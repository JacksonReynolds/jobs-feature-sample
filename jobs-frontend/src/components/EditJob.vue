<template>
  <div class="edit-job" :id="id">
    <form @submit.prevent="saveJob" action="#">
      <p><strong>Title: </strong><input type="text" v-model="title"></p>
      <p>Skills: <strong>press enter after editing a skill to create a new one</strong></p>
      <ul>
        <li v-for="(skill, index) in skills" :key="index"><input type="text" v-model="skills[index]"></li>
        <li v-for="(skill, index) in newSkills" :key="index"><input type="text" v-model="newSkills[index]"></li>
        <li id="new"><input type="text" @keydown.enter="buildSkill" v-model="newSkill"></li>
      </ul>
      <p>Description: <textarea cols="100" rows="3" v-model="description"></textarea></p>
      <input type="submit" value="Save">
    </form>
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
        id: (this.job ? this.job.id : null),
        title: (this.job ? this.job.title : ''),
        skills: (this.job ? this.job.skills : []),
        newSkill: '',
        newSkills: [],
        description: (this.job ? this.job.description : ''),
      }
    },
    methods: {
      saveJob() {
        // add newSkills to skills array, and filter blank skill inputs
        this.skills = [...this.skills, ...this.newSkills].filter(s => s.trim() != '')
        // emit job-updated, passing updated fields
        this.$emit('job-updated', this.updatedJob)
        // reset form if new job
        if (!this.id) {
          this.resetFields()
        }
      },
      buildSkill() {
        if (this.newSkill != '') {
          this.newSkills.push(this.newSkill)
          this.newSkill = ''
        }
      },
      resetFields() {
        this.id = null
        this.title = ''
        this.skills = []
        this.newSkill = ''
        this.newSkills = []
        this.description = ''
      }
    },
    computed: {
      updatedJob({id, title, skills, description}) {
        return {id, title, skills, description}
      }
    },
    watch: {
      skills() {
        this.skills.filter(s => s.trim() != '')
      }
    }
  }
</script>

<style scoped>
.edit-job {
  border: 3px solid red;
  border-radius: 10px;
  margin: 5px;
  padding: 5px;
}
</style>