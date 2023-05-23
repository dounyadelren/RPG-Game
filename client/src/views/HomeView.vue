<script setup lang="ts">
import router from '@/router'
import { useAuthStore } from '@/stores/auth'
import Compass from '@/assets/img/compass.svg'
import Shop from '@/assets/img/shop.svg'
import Backpack from '@/assets/img/backpack.svg'
import Stat from '@/assets/img/stats.svg'
import Perso from '@/components/Perso.vue'
import Quests from '@/components/Quests.vue'
import { onMounted } from 'vue'

const authStore = useAuthStore()

const { user } = storeToRefs(authStore)
const vuePerso = ref(true)
const vueQuest = ref(false)
const vueInv = ref(false)
const vueShop = ref(false)
const vueStats = ref(false)

onMounted(() => {
  if (user.value.username === '') {
    router.push('/auth')
  }
})

const redirect = (url: string) => {
  router.push(url)
}

const showQuest = (tab: string) => {
  vuePerso.value = false
  vueQuest.value = true
  vueInv.value = false
  vueShop.value = false
  vueStats.value = false
}

const showInv = (tab: string) => {
  vuePerso.value = false
  vueQuest.value = false
  vueInv.value = true
  vueShop.value = false
  vueStats.value = false
}

const showShop = (tab: string) => {
  vuePerso.value = false
  vueQuest.value = false
  vueInv.value = false
  vueShop.value = true
  vueStats.value = false
}

const showStat = (tab: string) => {
  vuePerso.value = false
  vueQuest.value = false
  vueInv.value = false
  vueShop.value = false
  vueStats.value = true
}
</script>

<template>
  <div id="home">
    <el-row class="wood-btn" v-if="!user">
      <el-col :span="24" :offset="9">
        <el-button @click="redirect('/auth')">JOUER</el-button>
      </el-col>
    </el-row>
    <el-row v-else class="card-row" justify="center">
      <el-col :span="4" flex @click="showQuest">
        <el-image :src="Compass" style="width: 80px; height: 80px"></el-image>
        <h3>QUÊTES</h3>
      </el-col>
      <el-col :span="4" @click="showInv">
        <el-image :src="Backpack" style="width: 80px; height: 80px"></el-image>
        <h3>INVENTAIRE</h3>
      </el-col>
      <el-col :span="4" @click="showShop">
        <el-image :src="Shop" style="width: 80px; height: 80px"></el-image>
        <h3>BOUTIQUE</h3>
      </el-col>
      <el-col :span="4" @click="showStat">
        <el-image :src="Stat" style="width: 80px; height: 80px"></el-image>
        <h3>STATS</h3>
      </el-col>
      <div class="w-100" v-if="vuePerso">
        <Perso />
      </div>
      <div class="w-100" v-if="vueQuest">
        <Quests />
      </div>
      <div class="w-100" v-if="vueInv">
        <Inventory />
      </div>
      <div class="w-100" v-if="vueStats">
        <Stats />
      </div>
      <div class="w-100" v-if="vueShop">
        <Hdv />
      </div>
    </el-row>
  </div>
</template>

<style lang="scss">
.wood-btn {
  .el-button {
    background: url('../assets/img/wood.jpg'), no-repeat;
    background-size: contain;
    color: white;
    padding: 4.8rem;
    font-size: 4rem;
    font-family: 'Rubik Vinyl', cursive;
    text-decoration: none;
    border-radius: 8px;
    border: none;
    box-shadow: 0 10px #471a11;
    margin-top: -4rem;
    cursor: pointer;
    position: absolute;
    top: 50;
    left: 50;
    transform: translate(0%, 50%);
    &:hover {
      filter: brightness(1.2);
      color: white;
    }
  }
}
</style>
