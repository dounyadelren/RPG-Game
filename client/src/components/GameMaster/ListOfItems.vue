<script setup lang="ts">
import { ItemsLabel } from '@/types/items'

const props = defineProps<{
  listItems: any
}>()

const { listItems } = toRefs(props)
</script>

<template>
  <div id="list-of-items">
    <el-table :data="listItems" style="width: 100%">
      <el-table-column prop="name" label="Nom de l'item" />
      <el-table-column prop="description" label="Description de l'item" />
      <el-table-column prop="price" label="Prix" />
      <el-table-column prop="level" label="Level" />
      <el-table-column prop="typeOfEquipment" label="Type">
        <template #default="{ row }">
          {{ ItemsLabel[row.typeOfEquipment as keyof typeof ItemsLabel] }}
        </template>
      </el-table-column>
      <el-table-column prop="id" label="Actions" align="center" width="150">
        <template #default="{ row }">
          <el-button
            type="danger"
            size="default"
            @click="$emit('deleteItem', row.id)"
          >
            Supprimer
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<style lang="scss">
#list-of-items {
  width: 100%;
  .el-button {
    background-color: var(--el-color-danger);
    border-color: var(--el-color-danger);
  }
}
</style>
