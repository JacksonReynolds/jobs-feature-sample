<template>
    <div class="show-job" :id="id">
      <p>Title: {{title}}</p>
      <p>Skills:</p>
      <ul>
        <li v-for="skill in skills" :key="skill">{{skill}}</li>  
      </ul>
      <p>Description: {{description}}</p>
      <button @click="editJob">Edit</button>
      <button @click="deleteJob">Delete</button>
    </div>
</template>

<script>
    export default {
        name: "JobShow",
        props: {
          job: Object
        },
        data () {
          return {
            id: this.job.id,
            title: this.job.title,
            skills: this.job.skills,
            description: this.job.description
          }
        },
        methods: {
          editJob() {
            this.$emit('edit-job', this.job.id)
          },
          deleteJob() {
            this.$emit('job-deleted', this.job.id)
          }
        }
    }
</script>

<style scoped>
.show-job {
  border: 3px solid black;
  border-radius: 5px;
  margin: 5px;
  padding: 5px;
}
</style>