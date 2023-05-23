<script setup lang="ts">
import router from '@/router'

const redirect = (url: string) => {
  router.push(url)
}
</script>
<template>
  <div id="make-choice">
    <el-row justify="center" class="victory">
      <h1>GAME OVER</h1>
      <el-button @click="redirect('/')">Retenter ma chance</el-button>
    </el-row>
  </div>
</template>
<style lang="scss">
.victory {
  flex-direction: column;
  .el-button {
    width: 20%;
    margin-left: auto;
    margin-right: auto;
  }
} 
</style>
