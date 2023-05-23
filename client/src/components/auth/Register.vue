<script setup lang="ts">
import router from '@/router'
import { useAuthStore } from '@/stores/auth'
import { reactive } from 'vue'

const authStore = useAuthStore()

interface Form {
  username: string
  email: string
  password: string
}

const form: Form = reactive({
  username: '',
  email: '',
  password: '',
})

const register = async (form: Form) => {
  await authStore
    .register(form)
    .then(() => {
      console.log('register success')
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      router.push('/')
    })
}
</script>

<template>
  <div id="register" class="auth-form">
    <el-form :model="form" label-position="top">
      <el-form-item label="Nom d'utilisateur">
        <el-input
          v-model="form.username"
          placeholder="Votre nom d'utilisateur"
        />
      </el-form-item>
      <el-form-item label="Email">
        <el-input v-model="form.email" placeholder="jean@dupont.com" />
      </el-form-item>
      <el-form-item label="Mot de passe">
        <el-input type="password" v-model="form.password" placeholder="password" />
      </el-form-item>
      <el-row>
        <el-col :span="2" :offset="14">
          <el-button @click="register(form)">Inscription</el-button>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<style lang="scss">
</style>
