<script setup lang="ts">
import { RouterLink } from "vue-router";
import router from '@/router';
import Logo from '@/assets/img/logo.svg';

import { useAuthStore } from '@/stores/auth'

const authStore = useAuthStore()


const logout = () => {
  return authStore
    .logout()
    // .then(() => {
    //   console.log('logout success')
    // })
    // .catch((err) => {
    //   console.log(err)
    // })
    // .then(() => {
    //   router.push('/auth')
    // })
}


</script>

<template>
  <nav id="navbar">
    <RouterLink to="/" class="app-title">
        <el-image style="width:60px; height:60px" :src="Logo" class="cursor" />
        <h2 class="cursor">Camping vs Wild</h2>
    </RouterLink>
    <!-- <RouterLink to="/about">A propos</RouterLink> -->
    <el-button size="large" @click="logout">
      Déconnexion
    </el-button>
  </nav>
</template>

<style lang="scss">
#navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 0.5rem;
  // background-color: rgb(65, 32, 4);
  color: white;
  font-size: 1.5rem;
  font-weight: bold;
  height: 80px;
  a {
    color: white;
    text-decoration: none;
  }
}
</style>
