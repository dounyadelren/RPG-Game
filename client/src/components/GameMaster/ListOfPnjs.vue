<script setup lang="ts">
const props = defineProps<{
  listPnjs: any
}>()

const { listPnjs } = toRefs(props)
</script>

<template>
  <div id="list-of-pnj">
    <el-table :data="listPnjs" style="width: 100%">
      <el-table-column prop="name" label="Nom du PNJ" />
      <el-table-column prop="id" label="Actions" align="center" width="150">
        <template #default="{ row }">
          <el-button
            type="danger"
            size="default"
            @click="$emit('deletePnj', row.id)"
          >
            Supprimer
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style lang="scss">
#list-of-pnj {
  width: 100%;
  .el-button {
    background-color: var(--el-color-danger);
    border-color: var(--el-color-danger);
  }
}
</style>
