import { defineStore } from 'pinia'
import { useCookies } from 'vue3-cookies'
import axios from 'axios'
import router from '@/router'

const { cookies } = useCookies()

export interface Form {
  name: string
  player: number
  imageId: number
}

export interface Character {
  id?: number
  name: string
  level?: number
  xp?: number
  PV?: number
  STR?: number
  helmet?: number
  weapon?: number
  shield?: number
  inventory?: number
  pointsStats?: number
  quests?: number[]
  fights?: number[]
  questsDone?: number[]
  player?: number
  imageId?: number
}

export type CharacterState = {
  character: Character
}

export const useCharacterStore = defineStore('character', {
  state: () =>
    ({
      character: {
        id: undefined,
        name: '',
        level: undefined,
        xp: undefined,
        PV: undefined,
        STR: undefined,
        helmet: undefined,
        weapon: undefined,
        shield: undefined,
        inventory: undefined,
        pointsStats: undefined,
        quests: [],
        fights: [],
        questsDone: [],
        player: undefined,
        imageId: undefined,
      },
    } as CharacterState),
  actions: {
    createCharacter(form: Form) {
      return axios
        .post(`http://localhost:4000/characters/create`, form)
        .then((rep: any) => {
          console.log('new character', rep)
          this.chooseCharacter(rep.data.id)
        })
    },
    getCharacters(id: Number) {
      return axios.get(`http://localhost:4000/characters/player/${id}`)
    },
    chooseCharacter(id: number) {
      return axios
        .get(`http://localhost:4000/characters/choose/${id}`)
        .then((rep: any) => {
          this.character = rep.data
          router.push('/')
        })
    },
    getInventory(id: number) {
      return axios.post(`http://localhost:4000/characters/inventory/${id}`)
    },
    updatePVStats(id: number) {
      return axios
        .put(`http://localhost:4000/characters/updatePV/${id}`)
        .then((rep: any) => {
          this.character = rep.data
        })
    },
    updateSTRStats(id: number) {
      return axios
        .put(`http://localhost:4000/characters/updateSTR/${id}`)
        .then((rep: any) => {
          this.character = rep.data
        })
    },
    winQuest(idChar: number, idQuest: number) {
      return axios.post(`http://localhost:4000/characters/updateCharacterAfterWin/${idChar}/${idQuest}`)
      .then((rep: any) => {
        router.push('/winner')
      })
    }
  },
  persist: {
    enabled: true,
  },
})
