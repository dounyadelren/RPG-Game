<script setup lang="ts">
import type { Oponent } from '@/stores/game_master'

const listHelmet = [
  { id: 1, name: 'Casque de cuir' },
  { id: 2, name: 'Casque de fer' },
]

const listWeapon = [
  { id: 1, name: 'Épée de bois' },
  { id: 2, name: 'Épée de fer' },
]

const listShield = [
  { id: 1, name: 'Bouclier de bois' },
  { id: 2, name: 'Bouclier de fer' },
]

const form: Oponent = reactive({
  name: '',
  level: undefined,
  PV: undefined,
  STR: undefined,
  helmet: undefined,
  weapon: undefined,
  shield: undefined,
})

const rules = reactive({
  name: [{ required: true, message: 'Please input the name', trigger: 'blur' }],
  level: [
    { required: true, message: 'Please input the level', trigger: 'blur' },
  ],
  PV: [{ required: true, message: 'Please input the PV', trigger: 'blur' }],
  STR: [{ required: true, message: 'Please input the STR', trigger: 'blur' }],
  helmet: [
    { required: true, message: 'Please input the helmet', trigger: 'blur' },
  ],
  weapon: [
    { required: true, message: 'Please input the weapon', trigger: 'blur' },
  ],
  shield: [
    { required: true, message: 'Please input the shield', trigger: 'blur' },
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
    title="Création d'un ennemi"
  >
    <div id="GM-create-oponent">
      <el-form :model="form" :rules="rules" label-position="top">
        <el-form-item prop="name" label="Nom de l'ennemi">
          <el-input v-model="form.name" clearable />
        </el-form-item>
        <el-row :gutter="16">
          <el-col :lg="8" :md="8">
            <el-form-item prop="level" label="Level de l'ennemi">
              <el-input-number v-model="form.level" :min="1" :max="10" />
            </el-form-item>
          </el-col>
          <el-col :lg="8" :md="8">
            <el-form-item prop="PV" label="PV de l'ennemi">
              <el-input-number v-model="form.PV" :min="1" :max="20" />
            </el-form-item>
          </el-col>
          <el-col :lg="8" :md="8">
            <el-form-item prop="STR" label="Force de l'ennemi">
              <el-input-number v-model="form.STR" :min="1" :max="1000" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="Casque de l'ennemi">
          <el-select v-model="form.helmet">
            <el-option
              v-for="(v, k) in listHelmet"
              :key="k"
              :value="v.id"
              :label="v.name"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="Arme de l'ennemie">
          <el-select v-model="form.weapon">
            <el-option
              v-for="(v, k) in listWeapon"
              :key="k"
              :value="v.id"
              :label="v.name"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="Bouclier de l'ennemie">
          <el-select v-model="form.shield">
            <el-option
              v-for="(v, k) in listShield"
              :key="k"
              :value="v.id"
              :label="v.name"
            />
          </el-select>
        </el-form-item>
        <el-button type="primary" @click="$emit('createOpponent', form)">
          Créer
        </el-button>
      </el-form>
    </div>
  </el-dialog>
</template>

<style lang="scss">
#GM-create-oponent {
  width: 100%;
  .el-input-number {
    width: 100%;
  }
  .el-select {
    width: 100%;
  }
}
</style>
