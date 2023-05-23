<script setup lang="ts">
import router from '@/router'
import { useCharacterStore } from '@/stores/characters'
import moment from 'moment'
import { ImgLabel } from '@/types/img'

const characterStore = useCharacterStore()

const { character } = storeToRefs(characterStore)

const redirect = (url: string) => {
  router.push(url)
}

const dateFormat = (date: string) => {
  return moment(date).format('DD-MM-YYYY')
}

console.log(ImgLabel)
console.log(character.value.imageId)
console.log(ImgLabel[character.value.imageId as keyof typeof ImgLabel])
</script>

<template>
  <div>
    <el-row justify="space-around" class="card">
      <el-col :span="6">
        <img
          :src="ImgLabel[character.imageId as keyof typeof ImgLabel]"
          style="width: 300px; height: 300px"
        />
      </el-col>
      <el-col :span="6">
        <span class="font-surcharge">
          <p>Niveau:&nbsp;</p>
          <p>{{ character.level }}</p>
        </span>
        <span class="font-surcharge">
          <p>Expérience:&nbsp;</p>
          <p>{{ character.xp }}</p>
        </span>
        <span class="font-surcharge">
          <p>Quêtes terminées:&nbsp;</p>
          <p>{{ character.questsDone?.length }}</p>
        </span>
        <span class="font-surcharge">
          <p>Quêtes en cours:&nbsp;</p>
          <p>{{ character.quests?.length }}</p>
        </span>
        <span class="font-surcharge">
          <p>Combats effectués:&nbsp;</p>
          <p>{{ character.fights?.length }}</p>
        </span>
      </el-col>
    </el-row>
    <el-row justify="center" class="wood-btn">
      <el-button @click="redirect('/choose_character')"
        >Changer de personnage</el-button
      >
    </el-row>
  </div>
</template>
