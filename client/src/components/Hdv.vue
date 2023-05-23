<script setup lang="ts">
import { useShopStore } from '@/stores/shop'

const shopStore = useShopStore()

let shop = ref<any>([])

const getShop = () => {
  shopStore
    .listOfItems()
    .then((rep: any) => {
      shop.value = rep.data
    })
    .catch((err: any) => {
      console.log(err)
    })
}

onMounted(() => {
  getShop()
})
</script>

<template>
  <div id="shop">
    <el-table :data="shop">
      <el-table-column prop="name" label="Name" />
      <el-table-column prop="price" label="Prix" />
    </el-table>
  </div>
</template>

<style lang="scss">
#shop {
}
</style>
