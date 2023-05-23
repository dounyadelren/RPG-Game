<script setup lang="ts">
import { useQuestStore } from '@/stores/quests'
import { useCharacterStore } from '@/stores/characters'
import { ImgLabel } from '@/types/img'
import Gold from '@/assets/img/gold.svg'
import type { Form } from '@/stores/quests'
import router from '@/router'

const questStore = useQuestStore()
const characterStore = useCharacterStore()

const { character } = storeToRefs(characterStore)

const modalStatus = ref(false)
const questDetails = ref()
const idQuest = ref<number>()

const showModal = (id: number) => {
  modalStatus.value = true
  idQuest.value = id
}
const hideModal = () => {
  modalStatus.value = false
}

const getQuestDetails = async () => {
  let arrayTmp = <any>[]
  await questStore.getQuest(idQuest.value as number).then((rep) => {
    arrayTmp.push(rep.data)
    questDetails.value = arrayTmp
  })
}

watch(
  () => idQuest.value,
  () => {
    getQuestDetails()
  }
)

const acceptQuest = () => {
  if (idQuest) {
    questStore
      .acceptQuest(character.value.id as number, idQuest.value as number)
      .then(() => {
        console.log('quest accepted')
      })
      .catch((err: any) => {
        console.log(err)
      })
  }
}

defineExpose({
  showModal,
})
</script>
<template>
  <el-dialog
    v-model="modalStatus"
    :close-on-click-modal="true"
    width="50%"
    @closed="hideModal"
    center
  >
    <div id="quest-details">
      <div v-for="(value, key) in questDetails" :key="key">
        <h3>{{ value.title }}</h3>
        <p style="text-align: center; margin: 1rem; word-break: keep-all">
          "{{ value.objective }}"
        </p>
        <p>Niveau:&nbsp;&nbsp;{{ value.level }}</p>
        <p>Expérience gagnée:&nbsp;&nbsp;{{ value.XP }}xp</p>
        <div class="img-align">
          {{ value.gold }}&nbsp;<el-image
            :src="Gold"
            style="width: 30px; height: 30px"
          ></el-image>
        </div>
        <div class="btn-green">
          <el-button @click="acceptQuest()">JOUER</el-button>
        </div>
      </div>
    </div>
  </el-dialog>
</template>
<style lang="scss">
#quest-details {
  width: 100%;
  color: white;
  font-size: 1rem;
}
.el-dialog {
  background-color: var(--color-background-game);
  box-shadow: rgba(64, 158, 255, 0.25) 0px 50px 100px -20px,
    rgba(255, 255, 255, 0.3) 0px 30px 60px -30px,
    rgba(64, 158, 255, 0.35) 0px -2px 6px 0px inset;
  border-radius: 5px;
}
.btn-green {
  text-align: center;
  .el-button {
    background-color: green;
    border: 2px solid white;
    width: 300px;
    font-family: 'Rubik Vinyl', cursive;
    font-size: 2rem;
    padding: 2.5rem;
    cursor: pointer;
    &hover {
      filter: brightness(0.4);
    }
  }
}
h3 {
  text-align: center;
  font-weight: bold;
  font-size: 2rem;
}
.quest-img {
  width: 100px;
  height: 100px;
  display: flex;
}
</style>
