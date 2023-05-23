<script setup lang="ts">
import type { Enigme } from '@/stores/game_master'

const form: Enigme = reactive({
  question: '',
  first_answer: '',
  second_answer: '',
  third_answer: '',
  fourth_answer: '',
  correct_answer: '',
})

const rules = reactive({
  question: [
    { required: true, message: "Veuillez rentrer l'énigme", trigger: 'blur' },
  ],
  first_answer: [
    { required: true, message: 'Réponses obligatoire', trigger: 'blur' },
  ],
  second_answer: [
    { required: true, message: 'Réponses obligatoire', trigger: 'blur' },
  ],
  third_answer: [
    { required: true, message: 'Réponses obligatoire', trigger: 'blur' },
  ],
  fourth_answer: [
    { required: true, message: 'Réponses obligatoire', trigger: 'blur' },
  ],
  correct_answer: [
    { required: true, message: 'Bonne réponses obligatoire', trigger: 'blur' },
  ],
})

const modalStatus = ref(false)

const showModal = () => {
  modalStatus.value = true
}
const hideModal = () => {
  modalStatus.value = false
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
    title="Création d'une énigme"
  >
    <div id="GM-create-enigme">
      <el-form :model="form" :rules="rules" label-position="top">
        <el-form-item prop="question" label="Intitulé de l'énigme">
          <el-input v-model="form.question" clearable />
        </el-form-item>
        <el-form-item prop="first_answer" label="Réponse 1">
          <el-input v-model="form.first_answer" clearable />
        </el-form-item>
        <el-form-item prop="second_answer" label="Réponse 2">
          <el-input v-model="form.second_answer" clearable />
        </el-form-item>
        <el-form-item prop="third_answer" label="Réponse 3">
          <el-input v-model="form.third_answer" clearable />
        </el-form-item>
        <el-form-item prop="fourth_answer" label="Réponse 4">
          <el-input v-model="form.fourth_answer" clearable />
        </el-form-item>
        <el-form-item prop="correct_answer" label="Bonne réponse">
          <el-input v-model="form.correct_answer" clearable />
        </el-form-item>
        <el-button type="primary" @click="$emit('createEnigme', form)">
          Créer
        </el-button>
      </el-form>
    </div>
  </el-dialog>
</template>

<style lang="scss">
#GM-create-enigme {
  width: 100%;
  .el-input-number {
    width: 100%;
  }
  .el-select {
    width: 100%;
  }
}
</style>
