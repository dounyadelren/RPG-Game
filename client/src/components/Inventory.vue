<script setup lang="ts">
import { useCharacterStore } from '@/stores/characters'
import { useGameMasterAuth } from '@/stores/game_master'
import { ItemsImageLabel } from '@/types/items'
import { useShopStore } from '@/stores/shop'
import type { FormItem } from '@/stores/shop'

const characterStore = useCharacterStore()
const gameMasterStore = useGameMasterAuth()
const shopStore = useShopStore()

const { character } = storeToRefs(characterStore)

const gold = ref()
const items = ref([] as any[])

const getInventory = (characterId: number) => {
  characterStore
    .getInventory(characterId)
    .then((rep: any) => {
      gold.value = rep.data.gold
      rep.data.items.forEach((item: any) => {
        gameMasterStore.getItem(item).then((rep: any) => {
          items.value.push(rep.data)
        })
      })
    })
    .catch((err: any) => {
      console.log(err)
    })
}

const formSell: FormItem = reactive({
  name: '',
  price: 0,
  idItem: 0,
  idSeller: 0,
  level: 0,
  typeOfEquipment: '',
})

const sellitem = (id: number) => {
  gameMasterStore.getItem(id).then((rep: any) => {
    formSell.name = rep.data.name
    formSell.price = rep.data.price
    formSell.idItem = rep.data.id
    formSell.idSeller = character.value.id
    formSell.level = rep.data.level
    formSell.typeOfEquipment = rep.data.typeOfEquipment
    shopStore
      .sellItem(formSell)
      .then((rep: any) => {
        console.log(rep)
      })
      .catch((err: any) => {
        console.log(err)
      })
  })
}

const cancelSell = () => {
  console.log('skip')
}

onMounted(() => {
  character.value.id && getInventory(character.value.id)
})
</script>

<template>
  <div id="inventory">
    <el-row
      :gutter="16"
      justify="end"
      align="middle"
      style="margin: 0 30px 0 0"
    >
      <img src="@/assets/img/gold.svg" alt="logo gold de l'inventaire" />
      <span class="gold-inventory">{{ gold }}</span>
    </el-row>
    <el-row :gutter="16" justify="center">
      <el-col v-for="(v, k) in items" :key="k" :lg="6" :md="6">
        <img
          :src="ItemsImageLabel[v.typeOfEquipment as keyof typeof ItemsImageLabel]"
          alt="Image de l'item"
          style="width: 80px; height: 80px"
        />
        <div>
          <span>{{ v.name }}</span>
          <br />
          <br />
          <span>Description : {{ v.description }}</span>
          <br />
          <br />
          <span>Niveau : {{ v.level }}</span>
          <br />
          <span style="display: flex; align-items: center">
            Prix : {{ v.price }}
            <img
              src="@/assets/img/gold.svg"
              alt="logo gold de l'inventaire"
              style="width: 30px; height: 30px; margin: 0 0 0 5px"
            />
          </span>
        </div>
        <el-popconfirm
          title="Vous êtes sur de vouloir vendre cet objet ?"
          confirm-button-text="Vendre"
          cancel-button-text="Annuler"
          width="300"
          @confirm="sellitem(v.id)"
          @cancel="cancelSell"
        >
          <template #reference>
            <el-button>Vendre</el-button>
          </template>
        </el-popconfirm>
      </el-col>
    </el-row>
  </div>
</template>

<style lang="scss">
#inventory {
  img {
    width: 40px;
    height: 40px;
  }
  .gold-inventory {
    padding: 0 0 0 10px;
    font-size: 2rem;
    font-weight: bold;
    font-family: 'Rubik Vinyl', cursive;
  }
  .el-col {
    display: flex;
    justify-content: flex-start;
    &:hover {
      transform: none;
      font-size: 1.5rem;
      text-align: left;
    }
    span {
      color: #fff;
      font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    }
  }
}
</style>
