<script setup lang="ts">
const have_account = ref(false)
</script>

<template>
  <div id="auth-view">
    <Login v-if="have_account" />
    <Register v-else />
    <el-checkbox
      v-model="have_account"
      :label="
        have_account
          ? 'Vous n\'avez pas de compte ?'
          : 'Vous avez déjà un compte ?'
      "
      size="large"
    />
  </div>
</template>

<style lang="scss">
#auth-view {
  margin-top: 100px;
  display: flex;
  flex-direction: column;
  align-items: center;
  .el-checkbox__label {
    color: #fff;
  }
}
</style>
