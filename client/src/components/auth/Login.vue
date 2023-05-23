<script setup lang="ts">
import router from '@/router'
import { useAuthStore } from '@/stores/auth'
import { reactive } from 'vue'

const authStore = useAuthStore()
const {user} = storeToRefs(authStore)

interface Form {
  username: string
  password: string
}

const form: Form = reactive({
  username: '',
  password: '',
})

const login = async (form: Form) => {
  await authStore
    .login(form)
    .then(() => {
      console.log('login success')
    })
    .catch((err) => {
      console.log(err)
    })
}
</script>

<template>
  <div id="login" class="auth-form">
    <el-form :model="form" label-position="top">
      <el-form-item label="Nom d'utilisateur">
        <el-input
          v-model="form.username"
          placeholder="Votre nom d'utilisateur"
        />
      </el-form-item>
      <el-form-item label="Mot de passe">
        <el-input type="password" v-model="form.password" placeholder="password" />
      </el-form-item>
      <el-button @click="login(form)">Connexion</el-button>
    </el-form>
  </div>
</template>

<style lang="scss">
</style>
