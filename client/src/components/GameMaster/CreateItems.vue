<script setup lang="ts">
import type { Items } from '@/stores/game_master'
import { ItemsLabel } from '@/types/items'

const form: Items = reactive({
  name: '',
  description: '',
  price: undefined,
  level: undefined,
  typeOfEquipment: '',
})

const rules = reactive({
  name: [
    {
      required: true,
      message: "Veuillez rentrer le nom de l'équipement",
      trigger: 'blur',
    },
  ],
  description: [
    {
      required: true,
      message: 'Veuillez rentrer la description',
      trigger: 'blur',
    },
  ],
  price: [
    {
      required: true,
      message: 'Veuillez rentrer le prix',
      trigger: 'blur',
    },
  ],
  level: [
    {
      required: true,
      message: 'Veuillez rentrer le level',
      trigger: 'blur',
    },
  ],
  typeOfEquipment: [
    {
      required: true,
      message: "Veuillez rentrer le type de l'équipement",
      trigger: 'blur',
    },
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
    <div id="GM-create-items">
      <el-form :model="form" :rules="rules" label-position="top">
        <el-form-item prop="name" label="Nom de l'équipement">
          <el-input v-model="form.name" clearable />
        </el-form-item>
        <el-form-item prop="description" label="Déscription de l'équipement">
          <el-input v-model="form.description" clearable />
        </el-form-item>
        <el-row :gutter="16">
          <el-col :lg="12" :md="12">
            <el-form-item prop="price" label="Prix de l'équipement">
              <el-input-number v-model="form.price" :min="1" :max="500" />
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12">
            <el-form-item prop="level" label="Level de l'équipement">
              <el-input-number v-model="form.level" :min="1" :max="10" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="Choisir le type de l'équipement">
          <el-select v-model="form.typeOfEquipment">
            <el-option
              v-for="(v, k) in ItemsLabel"
              :key="k"
              :value="k"
              :label="v"
            />
          </el-select>
        </el-form-item>
        <el-button type="primary" @click="$emit('createItems', form)">
          Créer
        </el-button>
      </el-form>
    </div>
  </el-dialog>
</template>

<style lang="scss">
#GM-create-items {
  width: 100%;
  .el-input-number {
    width: 100%;
  }
  .el-select {
    width: 100%;
  }
}
</style>
