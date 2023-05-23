<script setup lang="ts">
import router from '@/router'
import { useCharacterStore } from '@/stores/characters'
import type { Form } from '@/stores/characters'
import { useAuthStore } from '@/stores/auth'
import { onMounted } from 'vue'
import Hypo from '@/assets/img/hypo.svg'
import Zoomer from '@/assets/img/zoomer.svg'
import Moundir from '@/assets/img/kohlanta.svg'
import { reactive } from 'vue'

const authStore = useAuthStore()
const characterStore = useCharacterStore()

const { user } = storeToRefs(authStore)
const rules = reactive({
  name: [
    {
      required: true,
      message: 'Votre personnage doit avoir un nom',
      trigger: 'blur',
    },
  ],
})

const imageTmp = ref()
const nameInput = ref(false)

onMounted(() => {
  if (user.value.username === '') {
    router.push('/auth')
  }
})

const form: Form = reactive({
  name: '',
  player: user.value.id,
  imageId: imageTmp.value,
})

const redirect = (url: string) => {
  router.push(url)
}

const getIdImage = (id: Number) => {
  imageTmp.value = id
  nameInput.value = true
}

watch(
  () => imageTmp.value,
  () => {
    form.imageId = imageTmp.value
  }
)

const createCharacter = (form: Form) => {
  if (form.name !== '' && form.player !== null) {
    characterStore
      .createCharacter(form)
      .then(() => {
        console.log('new character added')
      })
      .catch((err: any) => {
        console.log(err)
      })
      .then(() => {
        router.push('/')
      })
  } else {
    console.log('Nom du perso obligatoire')
  }
}

const characters = [
  {
    imageId: 1,
    class: "L'hypocondriaque",
    url: Hypo,
    description: 'Jamais sans mon gel hydroalcoolique !',
  },
  {
    imageId: 2,
    class: 'Le zoomer',
    url: Zoomer,
    description: "J'aime regarder TikTok survivor",
  },
  {
    imageId: 3,
    class: 'Moundir de Koh-Lanta',
    url: Moundir,
    description: 'Ma meilleure arme: mes mommy issues',
  },
]
</script>
<template>
  <div id="new-character">
    <h2 class="font-surcharge">Choisissez un nouveau personnage</h2>
    <p class="font-surcharge fs-smaler">
      Toutes leurs stats sont par défaut les mêmes ;)
    </p>
    <el-row justify="center" class="card-row">
      <el-col
        :span="6"
        v-for="perso in characters"
        :key="perso.imageId"
        @click="getIdImage(perso.imageId)"
      >
        <el-image
          :src="perso.url"
          style="width: 200px; height: 200px"
        ></el-image>
        <p>{{ perso.class }}</p>
        <p class="font-surcharge fs-smaller">{{ perso.description }}</p>
      </el-col>
    </el-row>
    <el-row v-if="nameInput === true" class="mt-2" :gutter="20">
      <el-col :span="10" :offset="7">
        <el-form :model="form" :rules="rules">
          <el-form-item prop="name">
            <el-input
              v-model="form.name"
              placeholder="Nom du personnage"
              clearable
              size="large"
              maxlength="30"
              show-word-limit
            ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button size="large" @click="createCharacter(form)"
              >CRÉER</el-button
            >
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>
  </div>
</template>
<style lang="scss">
.el-row {
  margin: 2rem 1rem;
}
.el-form {
  .el-form-item {
    .el-button {
      margin-right: auto;
      margin-left: auto;
      background-color: green;
      border: 2px solid white;
      width: 250px;
      font-family: 'Rubik Vinyl', cursive;
      font-size: 2rem;
      padding: 2.5rem;
      &hover {
        filter: brightness(0.4);
      }
    }
  }
}
</style>
