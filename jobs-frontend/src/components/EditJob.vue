<template>
  <div class="edit-job" :id="id">
    <p>Title: <input type="text" v-model="title"></p>
      <p>Skills:</p>
      <ul>
        <li v-for="(skill, index) in skills" :key="skill"><input type="text" v-model="skills[index]"></li>
        <li id="new"><input @change="addSkill" type="text" v-model="newSkill"></li>  
      </ul>
      <p>Description: <textarea cols="100" rows="3" v-model="description"></textarea></p>
      <button @click="saveJob">Save</button>
  </div>
</template>

<script>
  export default {
    name: "EditJob",
    props: {
      job: Object
    },
    data() {
      return {
        id: this.job.id,
        title: this.job.title,
        skills: this.job.skills,
        newSkill: '',
        description: this.job.description,
      }
    },
    methods: {
      saveJob() {
        // add skill if new field is filled
        if (this.newSkill.trim() != '') {
          this.skills.push(this.newSkill)
        }
        // filter out blank skill fields
        this.skills = this.skills.filter(s => s.trim() != '')
        // emit job-updated, passing updated fields
        this.$emit('job-updated', this.updatedJob)
      },
      addSkill() {
        this.skills.push(this.newSkill)
        this.newSkill = ''
      }
    },
    computed: {
      updatedJob({id, title, skills, description}) {
        return {id, title, skills, description}
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