<script setup lang="ts">
import { useGameMasterAuth } from '@/stores/game_master'
import { useAuthStore } from '@/stores/auth'
import router from '@/router'
import { onMounted } from 'vue'
import Gold from '@/assets/img/gold.svg'
import Question from '@/assets/img/question.svg'
import { ImgLabel } from '@/types/img'

const authStore = useAuthStore()
const GameMaster = useGameMasterAuth()

const { user } = storeToRefs(authStore)

onMounted(() => {
  if (!user.value) {
    router.push('/auth')
  } else {
    GetListOfQuests()
  }
})

const listQuests = ref()
const questDetailsModal = ref()

const GetListOfQuests = async () => {
  await GameMaster.listOfQuests()
    .then((rep) => {
      listQuests.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}
</script>
<template>
  <el-row justify="center" class="card">
    <el-col :span="6" v-for="(quest, key) in listQuests" :key="key">
      <p>{{ quest.id }} - {{ quest.title }}</p>
      <img
        v-if="quest.imageId !== null"
        :src="ImgLabel[quest.imageId as keyof typeof ImgLabel]"
        :alt="quest.title"
        style="width: 100px; height: 100px"
      />
      <img
        v-else
        :src="Question"
        :alt="quest.title"
        style="width: 100px; height: 100px"
      />
      <p class="font-surcharge">Niveau {{ quest.level }}</p>
      <div class="img-align">
        {{ quest.gold }}&nbsp;<el-image
          :src="Gold"
          style="width: 30px; height: 30px"
        ></el-image>
      </div>
      <el-button size="large" @click="questDetailsModal.showModal(quest.id)">
        Voir
      </el-button>
    </el-col>
    <QuestDetails ref="questDetailsModal" />
  </el-row>
</template>
<style lang="scss">
.img-align {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size:2rem;
  font-family: 'Rubik Vinyl', cursive;
}

.el-button {
  margin-top: 10px;
}
</style>
