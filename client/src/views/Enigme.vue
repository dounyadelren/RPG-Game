<script setup lang="ts">
import { useQuestStore } from '@/stores/quests'
import { useCharacterStore } from '@/stores/characters'
import { onMounted } from 'vue'
import router from '@/router'


const questStore = useQuestStore()
const characterStore = useCharacterStore()

const { quest } = storeToRefs(questStore)
const { character } = storeToRefs(characterStore)
const enigma = ref()
const choice = ref()

const getEnigma = async (id: number) => {
	let arrayTmp = <any>[]
	await questStore.getEnigma(quest.value.enigme as number)
	.then((rep) => {
			console.log(rep.data)
      arrayTmp.push(rep.data)
			enigma.value = arrayTmp
    })
    .catch((err) => {
      console.log(err)
    })
}

const redirect = (url: string) => {
  router.push(url)
}

const answer = () => {
	console.log(choice.value)
	console.log(enigma.value[0].correct_answer)
	console.log(typeof quest.value.id)
	console.log(typeof character.value.id)
	if (choice.value === enigma.value[0].correct_answer) {
		characterStore.winQuest(character.value.id as number, quest.value.id as number)
		.then(() => {
			console.log('gagné')
		})
	} else {
		redirect('/looser')
	}
}

onMounted(() => {
  getEnigma()
	console.log(character.value.id)
})
</script>
<template>
  <div id="enigme">
    <el-row justify="center">
      <el-col :span="24">
        <h1>{{ quest.title }}</h1>
      </el-col>
			<el-col v-for="(value, key) in enigma" :key="key">
				<h3>{{value.question}}</h3>
				<ul class="answer-list">
					<el-radio-group v-model="choice" class="answer-group">
						<li><el-radio :label="value.first_answer" size="large">{{value.first_answer}}</el-radio></li>
						<li><el-radio :label="value.second_answer" size="large">{{value.second_answer}}</el-radio></li>
						<li><el-radio :label="value.third_answer" size="large">{{value.third_answer}}</el-radio></li>
						<li><el-radio :label="value.fourth_answer" size="large">{{value.fourth_answer}}</el-radio></li>
					</el-radio-group>
				</ul>
			</el-col>
    </el-row>
		<el-row justify="center" class="wood-btn">
      <el-button @click="answer"
        >OK</el-button
      >
		</el-row>
  </div>
</template>
<style lang="scss">
.answer-list {
	list-style-type: none;
	max-width: 703px;
	margin-left: auto;
	margin-right: auto;
}
.answer-group {
	display: flex;
	align-items: flex-start;
	flex-direction: column;
	color: white;
}
</style>
