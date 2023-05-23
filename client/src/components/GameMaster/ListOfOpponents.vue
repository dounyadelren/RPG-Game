<script setup lang="ts">
const props = defineProps<{
  listOpponents: any
}>()

const { listOpponents } = toRefs(props)
</script>

<template>
  <div id="list-of-opponents">
    <el-table :data="listOpponents" style="width: 100%">
      <el-table-column prop="name" label="Nom" />
      <el-table-column prop="PV" label="PV" />
      <el-table-column prop="STR" label="Force" />
      <el-table-column prop="level" label="Niveau" />
      <el-table-column prop="helmet" label="Casque" />
      <el-table-column prop="weapon" label="Arme" />
      <el-table-column prop="shield" label="Bouclier" />
      <el-table-column prop="id" label="Actions" align="center" width="150">
        <template #default="{ row }">
          <el-button
            type="danger"
            size="default"
            @click="$emit('deleteOpponent', row.id)"
          >
            Supprimer
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style lang="scss">
#list-of-opponents {
  width: 100%;
  .el-button {
    background-color: var(--el-color-danger);
    border-color: var(--el-color-danger);
  }
}
</style>
