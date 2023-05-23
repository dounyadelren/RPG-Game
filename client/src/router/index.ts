import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ChooseCharacters from '../views/ChooseCharacters.vue'
import NewCharacter from '../views/NewCharacter.vue'
import MakeChoice from '../views/MakeChoice.vue'
import Enigme from '../views/Enigme.vue'
import Fight from '../views/Fight.vue'
import Winner from '../views/Winner.vue'
import Looser from '../views/Looser.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/choose_character',
      name: 'choose',
      component: ChooseCharacters,
    },
    {
      path: '/new_character',
      name: 'new',
      component: NewCharacter,
    },
    {
      path: '/auth',
      name: 'auth',
      component: () => import('../views/Auth.vue'),
    },
    {
      path: '/game_master',
      name: 'game_master',
      component: () => import('../views/GameMasterView/index.vue'),
    },
    {
      path: '/make_choice',
      name: 'make_choice',
      component: MakeChoice
    },
    {
      path: '/enigme',
      name: 'enigme',
      component: Enigme
    },
    {
      path: '/fight',
      name: 'fight',
      component: Fight
    },
    {
      path: '/winner',
      name: 'winner',
      component: Winner
    },
    {
      path: '/looser',
      name: 'looser',
      component: Looser
    }
  ],
})

export default router
