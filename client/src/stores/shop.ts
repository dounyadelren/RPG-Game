import { defineStore } from 'pinia'
import axios from 'axios'

export interface FormItem {
  idItem?: number
  idSeller?: number
  name: string
  level?: number
  typeOfEquipment: string
  price?: number
}

export const useShopStore = defineStore('Shop', {
  state: () => ({}),
  actions: {
    listOfItems() {
      return axios.get(`http://localhost:4000/shop_items`)
    },
    sellItem(form: FormItem) {
      return axios.post(`http://localhost:4000/shop_items/create`, form)
    },
  },
})
