<script setup lang="ts">
import { useGameMasterAuth } from '@/stores/game_master'
import type {
  FormQuest,
  Oponent,
  Enigme,
  PNJ,
  Items,
} from '@/stores/game_master'
import { useAuthStore } from '@/stores/auth'
import router from '@/router'
import { ElMessage } from 'element-plus'

const authStore = useAuthStore()
const GameMaster = useGameMasterAuth()

const { user } = storeToRefs(authStore)

const activeName = ref('first')
const listQuests = ref()
const listOpponents = ref()
const listEnigmes = ref()
const listPnjs = ref()
const listItems = ref()
const listHelmets = ref()
const listWeapons = ref()
const listShields = ref()
const createQuestModal = ref()
const createOpponentModal = ref()
const createEnigmeModal = ref()
const createPnjModal = ref()
const createItemsModal = ref()

const form: FormQuest = reactive({
  level: undefined,
  XP: undefined,
  gold: undefined,
  title: '',
  objective: '',
  pnj: undefined,
  enigme: undefined,
  oponent: undefined,
  rewardId: undefined,
})

const rules = reactive({
  level: [
    { required: true, message: 'Please input the level', trigger: 'blur' },
  ],
  XP: [{ required: true, message: 'Please input the XP', trigger: 'blur' }],
  gold: [{ required: true, message: 'Please input the gold', trigger: 'blur' }],
  title: [
    { required: true, message: 'Please input the title', trigger: 'blur' },
  ],
  objective: [
    { required: true, message: 'Please input the objective', trigger: 'blur' },
  ],
  pnj: [{ required: true, message: 'Please input the pnj', trigger: 'blur' }],
  enigme: [
    { required: true, message: 'Please input the enigme', trigger: 'blur' },
  ],
  fight: [
    { required: true, message: 'Please input the fight', trigger: 'blur' },
  ],
})

const createQuest = async (form: FormQuest) => {
  await GameMaster.createQuest(form)
    .then((rep) => {
      GetListOfQuests()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Quête créée avec succès',
        type: 'success',
      })
    })
}

const GetListOfQuests = async () => {
  await GameMaster.listOfQuests()
    .then((rep) => {
      listQuests.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const removeQuests = async (id: number) => {
  await GameMaster.removeQuest(id)
    .then((rep) => {
      GetListOfQuests()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Quête supprimée avec succès',
        type: 'success',
      })
    })
}

const createOpponent = async (form: Oponent) => {
  await GameMaster.createOpponent(form)
    .then(() => {
      getOpponents()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Création réussie',
        type: 'success',
      })
    })
}

const removeOpponent = async (id: number) => {
  await GameMaster.removeOpponent(id)
    .then(() => {
      getOpponents()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Suppression réussie',
        type: 'success',
      })
    })
}

const createEnigme = async (form: Enigme) => {
  await GameMaster.createEnigme(form)
    .then(() => {
      getEnigmes()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Création réussie',
        type: 'success',
      })
    })
}

const removeEnigme = async (id: number) => {
  await GameMaster.removeEnigme(id)
    .then(() => {
      getEnigmes()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Suppression réussie',
        type: 'success',
      })
    })
}

const createPnj = async (form: PNJ) => {
  await GameMaster.createPnj(form)
    .then(() => {
      getPnjs()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Création réussie',
        type: 'success',
      })
    })
}

const removePnj = async (id: number) => {
  await GameMaster.removePnj(id)
    .then(() => {
      getPnjs()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Suppression réussie',
        type: 'success',
      })
    })
}

const createItems = async (form: Items) => {
  await GameMaster.createItem(form)
    .then(() => {
      getItems()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Création réussie',
        type: 'success',
      })
    })
}

const removeItem = async (id: number) => {
  await GameMaster.removeItem(id)
    .then(() => {
      getItems()
    })
    .catch((err) => {
      console.log(err)
    })
    .then(() => {
      ElMessage({
        message: 'Suppression réussie',
        type: 'success',
      })
    })
}

const getOpponents = () => {
  GameMaster.getOpponents()
    .then((rep) => {
      listOpponents.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getPnjs = () => {
  GameMaster.getPnjs()
    .then((rep) => {
      listPnjs.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getEnigmes = () => {
  GameMaster.getEnigmes()
    .then((rep) => {
      listEnigmes.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getItems = () => {
  GameMaster.getItems()
    .then((rep) => {
      listItems.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getHelmets = () => {
  GameMaster.getHelmets()
    .then((rep) => {
      listHelmets.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getShields = () => {
  GameMaster.getShields()
    .then((rep) => {
      listShields.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

const getWeapons = () => {
  GameMaster.getWeapons()
    .then((rep) => {
      listWeapons.value = rep.data
    })
    .catch((err) => {
      console.log(err)
    })
}

onMounted(() => {
  if (!user.value) {
    router.push('/login')
  } else if (user.value.roles !== 3) {
    router.push('/')
  } else {
    GetListOfQuests()
    getOpponents()
    getPnjs()
    getEnigmes()
    getItems()
    getHelmets()
    getShields()
    getWeapons()
  }
})
</script>

<template>
  <div id="GM-index">
    <el-tabs v-model="activeName" class="demo-tabs">
      <el-tab-pane label="Quêtes" name="first">
        <el-row>
          <el-col :lg="24" :md="24">
            <ListOfQuests
              :list-quests="listQuests"
              @delete-quest="removeQuests"
            />
          </el-col>
          <el-col
            :lg="24"
            :md="24"
            style="display: flex; justify-content: flex-end; margin-top: 5px"
          >
            <el-button type="primary" @click="createQuestModal.showModal()">
              Créer une nouvelle quête
            </el-button>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="Opposants" name="second">
        <el-row>
          <el-col :lg="24" :md="24">
            <ListOfOpponents
              :list-opponents="listOpponents"
              @delete-opponent="removeOpponent"
            />
          </el-col>
          <el-col
            :lg="24"
            :md="24"
            style="display: flex; justify-content: flex-end; margin-top: 5px"
          >
            <el-button type="primary" @click="createOpponentModal.showModal()">
              Créer un nouvel ennemi
            </el-button>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="Énigmes" name="third">
        <el-row>
          <el-col :lg="24" :md="24">
            <ListOfEnigmes
              :list-enigmes="listEnigmes"
              @delete-enigme="removeEnigme"
            />
          </el-col>
          <el-col
            :lg="24"
            :md="24"
            style="display: flex; justify-content: flex-end; margin-top: 5px"
          >
            <el-button type="primary" @click="createEnigmeModal.showModal()">
              Créer une nouvelle énigme
            </el-button>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="PNJ's" name="fourth">
        <el-row>
          <el-col :lg="24" :md="24">
            <ListOfPnjs :list-pnjs="listPnjs" @delete-pnj="removePnj" />
          </el-col>
          <el-col
            :lg="24"
            :md="24"
            style="display: flex; justify-content: flex-end; margin-top: 5px"
          >
            <el-button type="primary" @click="createPnjModal.showModal()">
              Créer un nouveau PNJ
            </el-button>
          </el-col>
        </el-row>
      </el-tab-pane>
      <el-tab-pane label="Items" name="five">
        <el-row>
          <el-col :lg="24" :md="24">
            <ListOfItems :list-items="listItems" @delete-item="removeItem" />
          </el-col>
          <el-col
            :lg="24"
            :md="24"
            style="display: flex; justify-content: flex-end; margin-top: 5px"
          >
            <el-button type="primary" @click="createItemsModal.showModal()">
              Créer un nouvel item
            </el-button>
          </el-col>
        </el-row>
      </el-tab-pane>
    </el-tabs>
    <CreateQuest
      ref="createQuestModal"
      :form="form"
      :list-opponents="listOpponents"
      :list-pnjs="listPnjs"
      :list-enigmes="listEnigmes"
      :list-helmets="listHelmets"
      :list-shields="listShields"
      :list-weapons="listWeapons"
      :rules="rules"
      @create-quest="createQuest($event)"
    />
    <CreateOpponent
      ref="createOpponentModal"
      @create-opponent="createOpponent($event)"
    />
    <CreateEnigmes
      ref="createEnigmeModal"
      @create-enigme="createEnigme($event)"
    />
    <CreatePnjs ref="createPnjModal" @create-enigme="createPnj($event)" />
    <CreateItems ref="createItemsModal" @create-items="createItems($event)" />
  </div>
</template>

<style lang="scss">
#GM-index {
  width: 100%;
  margin-top: 50px;
  .el-tabs__header {
    margin: 0;
  }
  .el-tabs__nav-scroll {
    display: flex;
    justify-content: center;
  }
  .el-tabs__item {
    color: #fff;
    padding: 0 100px;
    font-family: 'Rubik Vinyl', cursive;
    font-size: 20px;
  }
  .el-tabs__item.is-active {
    color: red;
  }
  .el-tabs__nav-wrap::after {
    display: none;
  }
  .el-tabs__active-bar {
    display: none;
  }
  .el-table {
    --el-table-header-bg-color: #808080;
    --el-table-header-text-color: #fff;
    --el-table-text-color: #fff;
    --el-table-bg-color: #909399;
    --el-table-tr-bg-color: #909399;
    --el-table-border: none;
    --el-table-border-color: #808080;
    --el-table-current-row-bg-color: #808080;
    --el-table-row-hover-bg-color: #808080;
    max-height: 700px;
    overflow-y: auto;
    .cell {
      word-break: break-word;
    }
  }
}
</style>
