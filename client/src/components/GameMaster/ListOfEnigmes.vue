<script setup lang="ts">
const props = defineProps<{
  listEnigmes: any
}>()

const { listEnigmes } = toRefs(props)
</script>

<template>
  <div id="list-of-enigmes">
    <el-table :data="listEnigmes" style="width: 100%">
      <el-table-column prop="question" label="Énigme" />
      <el-table-column prop="first_answer" label="Première réponse" />
      <el-table-column prop="second_answer" label="Deuxième réponse" />
      <el-table-column prop="third_answer" label="Troisième réponse" />
      <el-table-column prop="fourth_answer" label="Quatrième réponse" />
      <el-table-column prop="correct_answer" label="Bonne réponse" />
      <el-table-column prop="id" label="Actions" align="center" width="150">
        <template #default="{ row }">
          <el-button
            type="danger"
            size="default"
            @click="$emit('deleteEnigme', row.id)"
          >
            Supprimer
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style lang="scss">
#list-of-enigmes {
  width: 100%;
  .el-button {
    background-color: var(--el-color-danger);
    border-color: var(--el-color-danger);
  }
}
</style>
