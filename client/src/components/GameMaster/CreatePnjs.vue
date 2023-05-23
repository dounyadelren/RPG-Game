<script setup lang="ts">
import type { PNJ } from '@/stores/game_master'

const form: PNJ = reactive({
  name: '',
})

const rules = reactive({
  name: [
    { required: true, message: "Veuillez rentrer l'énigme", trigger: 'blur' },
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
    title="Création d'un PNJ"
  >
    <div id="GM-create-enigme">
      <el-form :model="form" :rules="rules" label-position="top">
        <el-form-item prop="name" label="Nom du PNJ">
          <el-input v-model="form.name" clearable />
        </el-form-item>
        <el-button type="primary" @click="$emit('createEnigme', form)">
          Créer
        </el-button>
      </el-form>
    </div>
  </el-dialog>
</template>