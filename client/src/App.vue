<script setup lang="ts">
import { RouterView } from 'vue-router'
import NavBar from '@/components/NavBar.vue'
import { useAuthStore } from '@/stores/auth'
import { useCharacterStore } from '@/stores/characters'
import { onMounted } from 'vue'

const authStore = useAuthStore()

const { user } = storeToRefs(authStore)

const characterStore = useCharacterStore()

const { character } = storeToRefs(characterStore)

onMounted(() => {
  authStore
  user
})
</script>

<template>
  <header>
    <div v-if="user.username !== ''">
      <NavBar />
    </div>
    <div v-else>
      <h1>Camping vs Wild</h1>
    </div>
  </header>
  <RouterView />
</template>

<style lang="scss">
h1 {
  margin-top: 2rem;
  color: #fff;
  text-align: center;
  font-size: 6rem;
  font-family: 'Rubik Vinyl', cursive;
}
</style>
