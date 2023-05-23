<script setup lang="ts">
const props = defineProps<{
  form: any
  rules: any
  listOpponents: any
  listEnigmes: any
  listPnjs: any
  listHelmets: any
  listWeapons: any
  listShields: any
}>()

const {
  form,
  rules,
  listOpponents,
  listEnigmes,
  listPnjs,
  listHelmets,
  listShields,
  listWeapons,
} = toRefs(props)

const modalStatus = ref(false)
const helmetId = ref<number>()
const shieldId = ref<number>()
const weaponId = ref<number>()

const showModal = () => {
  modalStatus.value = true
}
const hideModal = () => {
  modalStatus.value = false
}

watch(
  () => [helmetId.value, shieldId.value, weaponId.value],
  ([helmetId, shieldId, weaponId]) => {
    if (helmetId) {
      form.value.rewardId = helmetId
    }
    if (shieldId) {
      form.value.rewardId = shieldId
    }
    if (weaponId) {
      form.value.rewardId = weaponId
    }
  },
  { immediate: true }
)

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
    title="Création d'une nouvelle quête"
  >
    <div id="GM-create-quest">
      <el-form :model="form" :rules="rules" label-position="top">
        <el-form-item prop="title" label="Titre de la quête">
          <el-input v-model="form.title" clearable />
        </el-form-item>
        <el-form-item prop="objective" label="Objectif de la quête">
          <el-input v-model="form.objective" clearable />
        </el-form-item>
        <el-row :gutter="16">
          <el-col :lg="8" :md="8">
            <el-form-item prop="level" label="Level de la quête">
              <el-input-number v-model="form.level" :min="1" :max="10" />
            </el-form-item>
          </el-col>
          <el-col :lg="8" :md="8">
            <el-form-item prop="XP" label="Gain d'xp que rapport la quête">
              <el-input-number v-model="form.XP" :min="1" :max="20" />
            </el-form-item>
          </el-col>
          <el-col :lg="8" :md="8">
            <el-form-item prop="gold" label="Or que rapporte la quête">
              <el-input-number v-model="form.gold" :min="1" :max="1000" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="16">
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir le combat">
              <el-select v-model="form.oponent">
                <el-option
                  v-for="(v, k) in listOpponents"
                  :key="k"
                  :value="v.id"
                  :label="v.name"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir le PNJ">
              <el-select v-model="form.pnj">
                <el-option
                  v-for="(v, k) in listPnjs"
                  :key="k"
                  :value="v.id"
                  :label="v.name"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="16">
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir l'énigme">
              <el-select v-model="form.enigme" clearable>
                <el-option
                  v-for="(v, k) in listEnigmes"
                  :key="k"
                  :value="v.id"
                  :label="v.question"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir un casque en récompense">
              <el-select
                v-model="helmetId"
                :disabled="!weaponId && !shieldId ? false : true"
                clearable
              >
                <el-option
                  v-for="(v, k) in listHelmets"
                  :key="k"
                  :value="v.id"
                  :label="v.name"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="16">
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir une arme en récompense">
              <el-select
                v-model="weaponId"
                :disabled="!helmetId && !shieldId ? false : true"
                clearable
              >
                <el-option
                  v-for="(v, k) in listShields"
                  :key="k"
                  :value="v.id"
                  :label="v.name"
                />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :lg="12" :md="12">
            <el-form-item label="Choisir un bouclier en récompense">
              <el-select
                v-model="shieldId"
                :disabled="!helmetId && !weaponId ? false : true"
                clearable
              >
                <el-option
                  v-for="(v, k) in listWeapons"
                  :key="k"
                  :value="v.id"
                  :label="v.name"
                />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-button type="primary" @click="$emit('createQuest', form)">
          Créer
        </el-button>
      </el-form>
    </div>
  </el-dialog>
</template>

<style lang="scss">
#GM-create-quest {
  width: 100%;
  .el-input-number {
    width: 100%;
  }
  .el-select {
    width: 100%;
  }
}
</style>
