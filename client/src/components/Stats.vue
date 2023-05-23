<script setup lang="ts">
import { useCharacterStore } from '@/stores/characters'
import { ImgLabel } from '@/types/img'

const characterStore = useCharacterStore()

const { character } = storeToRefs(characterStore)

const updatePV = () => {
  characterStore.updatePVStats(character.value.id as number)
}

const updateSTR = () => {
  characterStore.updateSTRStats(character.value.id as number)
}
</script>

<template>
  <el-row id="stats" justify="center">
    <div class="stats-page">
      <el-row align="top">
        <img
          :src="ImgLabel[character.imageId as keyof typeof ImgLabel]"
          alt=""
          style="width: 100px; height: 100px"
        />
        <span style="width: 200px">
          <p>
            {{ character.name }}
          </p>
          <p>Niveau : {{ character.level }}</p>
          <p>XP : {{ character.xp }}</p>
          <el-progress :percentage="character.xp" style="width: 100%" />
        </span>
      </el-row>
      <el-row align="middle" style="padding: 0; margin: 1rem 1rem">
        <p>PV : {{ character.PV }}</p>
        <el-button size="small" style="margin: 0 0 0 10px" @click="updatePV">+</el-button>
      </el-row>
      <el-row align="middle" style="padding: 0; margin: 1rem 1rem">
        <p>Force : {{ character.STR }}</p>
        <el-button size="small" style="margin: 0 0 0 10px" @click="updateSTR">+</el-button>
      </el-row>
      <el-row style="padding: 0; margin: 1rem 1rem">
        <span>
          Point de statistique disponible : {{ character.pointsStats }}
        </span>
      </el-row>
    </div>
  </el-row>
</template>

<style lang="scss">
#stats {
  .stats-page {
    line-height: 1.5;
    max-width: 400px;
    width: 100%;
    height: 300px;
    background: linear-gradient(
      #434d9e 0.01%,
      var(--color-background-game-blue) 99.99%
    );
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    .el-progress__text {
      color: #fff;
    }
  }
}
</style>
