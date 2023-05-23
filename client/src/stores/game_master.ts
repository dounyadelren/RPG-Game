import { defineStore } from 'pinia'
import axios from 'axios'

export interface FormQuest {
  level?: number
  XP?: number
  gold?: number
  title: string
  objective: string
  pnj?: number
  enigme?: number
  oponent?: number
  rewardId?: number
}

export interface Oponent {
  name: string
  level?: number
  PV?: number
  STR?: number
  helmet?: number
  weapon?: number
  shield?: number
}

export interface Enigme {
  question: string
  first_answer: string
  second_answer: string
  third_answer: string
  fourth_answer: string
  correct_answer: string
}

export interface Items {
  name: string
  description: string
  price?: number
  level?: number
  typeOfEquipment: string
}

export interface PNJ {
  name: string
}

export const useGameMasterAuth = defineStore('GameMaster', {
  state: () => ({}),
  actions: {
    listOfQuests() {
      return axios.get(`http://localhost:4000/quests`)
    },
    createQuest(form: FormQuest) {
      return axios.post(`http://localhost:4000/quests/create`, form)
    },
    removeQuest(id: number) {
      return axios.delete(`http://localhost:4000/quests/${id}`)
    },
    getPnjs() {
      return axios.get(`http://localhost:4000/pnjs`)
    },
    getPnj(id: number) {
      return axios.get(`http://localhost:4000/pnjs/${id}`)
    },
    createPnj(form: PNJ) {
      return axios.post(`http://localhost:4000/pnjs/create`, form)
    },
    removePnj(id: number) {
      return axios.delete(`http://localhost:4000/pnjs/${id}`)
    },
    getEnigmes() {
      return axios.get(`http://localhost:4000/enigmes`)
    },
    getEnigme(id: number) {
      return axios.get(`http://localhost:4000/enigmes/${id}`)
    },
    createEnigme(form: Enigme) {
      return axios.post(`http://localhost:4000/enigmes/create`, form)
    },
    removeEnigme(id: number) {
      return axios.delete(`http://localhost:4000/enigmes/${id}`)
    },
    getOpponents() {
      return axios.get(`http://localhost:4000/oponents`)
    },
    getOpponent(id: number) {
      return axios.get(`http://localhost:4000/oponents/${id}`)
    },
    createOpponent(form: Oponent) {
      return axios.post(`http://localhost:4000/oponents/create`, form)
    },
    removeOpponent(id: number) {
      return axios.delete(`http://localhost:4000/oponents/${id}`)
    },
    getItems() {
      return axios.get(`http://localhost:4000/items`)
    },
    getItem(id: number) {
      return axios.get(`http://localhost:4000/items/${id}`)
    },
    createItem(form: Items) {
      return axios.post(`http://localhost:4000/items/create`, form)
    },
    removeItem(id: number) {
      return axios.delete(`http://localhost:4000/items/${id}`)
    },
    getHelmets() {
      return axios.post(`http://localhost:4000/helmets`)
    },
    getWeapons() {
      return axios.post(`http://localhost:4000/weapons`)
    },
    getShields() {
      return axios.post(`http://localhost:4000/shields`)
    },
  },
})
