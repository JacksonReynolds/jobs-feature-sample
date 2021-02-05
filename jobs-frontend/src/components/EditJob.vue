<template>
  <div class="edit-job" :id="id">
    <p>Title: <input type="text" v-model="title"></p>
      <p>Skills:</p>
      <ul>
        <li v-for="(skill, index) in skills" :key="index"><input type="text" v-model="skills[index]"></li>
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
        id: (this.job ? this.job.id : null),
        title: (this.job ? this.job.title : ''),
        skills: (this.job ? this.job.skills : []),
        newSkill: '',
        description: (this.job ? this.job.description : ''),
      }
    },
    methods: {
      saveJob() {
        // filter out blank skill fields
        this.skills = this.skills.filter(s => s.trim() != '')
        // emit job-updated, passing updated fields
        this.$emit('job-updated', this.updatedJob)
      },
      addSkill() {
        if (this.newSkill != '') {
          this.skills.push(this.newSkill)
          this.newSkill = ''
        }
      }
    },
    computed: {
      updatedJob({id, title, skills, description}) {
        return {id, title, skills: skills.filter(s => s.trim() != ''), description}
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
  border-radius: 5px;
  margin: 5px;
  padding: 5px;
}
</style>