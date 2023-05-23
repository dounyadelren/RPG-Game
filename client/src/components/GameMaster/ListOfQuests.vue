<script setup lang="ts">
import { useGameMasterAuth } from '@/stores/game_master'

const GameMaster = useGameMasterAuth()

const props = defineProps<{
  listQuests: any
}>()

const { listQuests } = toRefs(props)

const fetchAllValues = () => {
  listQuests.value = listQuests?.value?.forEach((quest: any) => {
    if (quest.oponent) {
      GameMaster.getOpponent(quest.oponent).then((rep) => {
        quest.oponent = rep.data.name
      })
    }
    if (quest.enigme) {
      GameMaster.getEnigme(quest.enigme).then((rep) => {
        quest.enigme = rep.data.question
      })
    }
    if (quest.pnj) {
      GameMaster.getPnj(quest.pnj).then((rep) => {
        quest.pnj = rep.data.name
      })
    }
  })
}

watch(
  () => listQuests.value,
  () => {
    fetchAllValues()
  }
)
</script>

<template>
  <div id="list-of-quests">
    <el-table :data="listQuests" style="width: 100%">
      <el-table-column prop="title" label="Titre" width="300" />
      <el-table-column prop="objective" label="Objectif" width="450" />
      <el-table-column prop="level" label="Level" />
      <el-table-column prop="gold" label="Gold" />
      <el-table-column prop="XP" label="Expérience" />
      <el-table-column prop="pnj" label="PNJ" />
      <el-table-column prop="enigme" label="Enigme" />
      <el-table-column prop="oponent" label="Combat" />
      <el-table-column prop="id" label="Actions" align="center" width="150">
        <template #default="{ row }">
          <el-button
            type="danger"
            size="default"
            @click="$emit('deleteQuest', row.id)"
          >
            Supprimer
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style lang="scss">
#list-of-quests {
  width: 100%;
  .el-button {
    background-color: var(--el-color-danger);
    border-color: var(--el-color-danger);
  }
}
</style>
