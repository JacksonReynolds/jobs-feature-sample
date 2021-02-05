<template>
  <div class="edit-job" :id="id">
    <p>Title: <input type="text" v-model="title"></p>
      <p>Skills:</p>
      <ul>
        <li v-for="(skill, index) in skills" :key="skill"><input type="text" v-model="skills[index]"><button @click="() => deleteSkill(skill)"></button></li>
        <li id="new"><input type="text" v-model="newSkill"></li>  
      </ul>
      <p>Description: <input type="text" v-model="description"></p>
  </div>
</template>

<script>
  export default {
    name: "EditJob",
    props: {
      job: Object
    },
    data () {
      return {
        id: this.job.id,
        title: this.job.title,
        skills: this.job.skills,
        newSkill: '',
        description: this.job.description,
      }
    },
    methods: {
      deleteSkill(skill) {
        console.log(`${skill} deleted...?`)
      }
    }
  }
</script>

<style scoped>
.edit-job {
  border: 3px solid red;
  border-radius: 5px;
  margin: 5px;
  padding: 5px;
}
</style>