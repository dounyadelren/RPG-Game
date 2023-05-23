import { defineStore } from 'pinia'
import { useCookies } from 'vue3-cookies'
import axios from 'axios'
import router from '@/router'

const { cookies } = useCookies()

export interface Form {
  idQuest?: number
}

export interface Quest {
  id?: number
  level?: number
  XP?: number
  gold?: number
  title?: string
  objective?: string
  pnj?: number
  enigme?: number
  oponent?: number
  imageId?: number
  rewardId?: number
}

export type QuestState = {
  quest: Quest
}

export const useQuestStore = defineStore('quest', {
  state: () =>
    ({
      quest: {
        id: undefined,
        level: undefined,
        XP: undefined,
        gold: undefined,
        title: '',
        objective: '',
        pnj: undefined,
        enigme: undefined,
        oponent: undefined,
        imageId: undefined,
        rewardId: undefined,
      },
    } as QuestState),
  actions: {
    getQuest(id: Number) {
      return axios.get(`http://localhost:4000/quests/${id}`)
    },
    acceptQuest(id: number, quest: number) {
      return axios
        .post(`http://localhost:4000/characters/acceptQuest/${id}/${quest}`)
        .then((rep: any) => {
          this.quest = rep.data
          console.log('quest accepted', rep)
          router.push('/make_choice')
        })
    },
    getEnigma(id: number) {
      return axios
        .get(`http://localhost:4000/enigmes/${this.quest.enigme}`)
    },
  },
  persist: {
    enabled: true,
  },
})
