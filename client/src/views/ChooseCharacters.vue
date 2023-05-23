<script setup lang="ts">
import router from '@/router'
import { useAuthStore } from '@/stores/auth'
import { onMounted } from 'vue'
import { useCharacterStore } from '@/stores/characters'
import { ImgLabel } from '@/types/img'

const authStore = useAuthStore()
const characterStore = useCharacterStore()

const { user } = storeToRefs(authStore)
const listOfCharacters = ref<any>([])

onMounted(() => {
  user
  if (user.value.username === '') {
    router.push('/auth')
  }
  getCharacters(user.value.id)
})

const redirect = (url: string) => {
  router.push(url)
}

const getCharacters = (id: number) => {
  characterStore
    .getCharacters(id)
    .then((rep: any) => {
      rep.data.forEach((item: any) => {
        listOfCharacters.value.push(item)
      })
    })
    .catch((err: any) => {
      console.log(err)
    })
}

const chooseCharacter = (id: number) => {
  characterStore
    .chooseCharacter(id)
    .then((rep: any) => {
      router.push('/')
    })
    .catch((err: any) => {
      console.log(err)
    })
}
</script>
<template>
  <div id="choose-characters" v-if="user.id !== null">
    <el-row justify="center">
      <el-col>
        <h2>Choisissez un personnage</h2>
      </el-col>
    </el-row>
    <el-row justify="center" class="card-row">
      <el-col :span="6" v-for="(perso, key) in listOfCharacters" :key="key">
        <img
          :src="perso.imageId as keyof typeof ImgLabel"
          alt=""
          style="width: 100px; height: 100px"
        />
        <div style="margin-top: 1rem">
          <p>{{ perso.name }}</p>
          <p class="font-surcharge fs-smaller">LVL {{ perso.level }}</p>
          <p class="font-surcharge fs-smaller">Expérience {{ perso.xp }}xp</p>
        </div>
        <div style="margin-top: 1rem">
          <el-button @click="chooseCharacter(perso.id)">Choisir</el-button>
        </div>
      </el-col>
    </el-row>
    <el-row justify="center" class="btn-green">
      <el-button size="large" @click="redirect('/new_character')">
        Créer un nouveau personnage
      </el-button>
    </el-row>
  </div>
</template>
<style lang="scss" scoped>
.btn-green {
  .el-button {
    margin-right: auto;
    margin-left: auto;
    background-color: green;
    border: 2px solid white;
    width: 600px;
    font-family: 'Rubik Vinyl', cursive;
    font-size: 2rem;
    padding: 2.5rem;
    &hover {
      filter: brightness(0.4);
    }
  }
}
.el-col {
  h2 {
    text-align: center;
  }
}
</style>
