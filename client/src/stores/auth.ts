import { defineStore } from 'pinia'
import { useCookies } from 'vue3-cookies'
import axios from 'axios'
import router from '@/router'

const { cookies } = useCookies()

const enum Role {
  Admin = 1,
  Player = 2,
  GM = 3,
}

export interface User {
  id: number
  email: string
  username: string
  roles: Role
}

export type AuthState = {
  user: User
}

export const useAuthStore = defineStore('auth', {
  state: () =>
    ({
      user: {
        email: '',
        username: '',
        roles: Role.Player,
      },
    } as AuthState),
  getters: {
    isLogged: (state): boolean => {
      return !!state.user.email
    },
  },
  actions: {
    register(form: { username: string; email: string; password: string }) {
      return axios
        .post(
          `http://localhost:4000/players/create?username=${form.username}&email=${form.email}&password=${form.password}`
        )
        .then((rep: any) => {
          this.user = rep.data
          router.push('/new_character')
        })
    },
    login(form: { username: string; password: string }) {
      return axios
        .post(
          `http://localhost:4000/players/login?username=${form.username}&password=${form.password}`
        )
        .then((rep: any) => {
          this.user = rep.data
          if(this.user.roles === 3) {
            router.push('/game_master')
          } else {
            this.getCharacters(this.user.id)
          }
        })
    },
    getCharacters(id: Number) {
      return axios
      .get(
        `http://localhost:4000/characters/player/${this.user.id}`
      )
      .then((rep: any) => {
        if(rep.data && rep.data.length > 0) {
          router.push('/choose_character')
        } else {
          router.push('/new_character')
        }
      })
    },
    logout() {
      this.$reset()
      cookies.remove('session')
      router.push('/auth')
    },
  },
  persist: {
    enabled: true,
  },
})
