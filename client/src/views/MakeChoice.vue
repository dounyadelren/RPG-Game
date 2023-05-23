<script setup lang="ts">
import router from '@/router'

const redirect = (url: string) => {
  router.push(url)
}
</script>
<template>
  <div id="make-choice">
    <el-row justify="center">
      <el-col :span="6" class="btn-green">
        <el-button @click="redirect('/enigme')">ENIGME</el-button>
      </el-col>
      <el-col :span="1"></el-col>
      <el-col :span="6" class="btn-green">
        <el-button @click="redirect('/fight')">COMBAT</el-button>
      </el-col>
    </el-row>
  </div>
</template>
<style lang="scss">
#make-choice {
  .el-row {
    width: 100%;
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(0%, 100%);
  }
}
</style>
