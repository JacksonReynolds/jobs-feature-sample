<template>
    <div class="show-job" :id="job.id">
      <p><strong>Title: {{job.title}}</strong></p>
      <p>Skills:</p>
      <ul>
        <li v-for="skill in job.skills" :key="skill">{{skill}}</li>  
      </ul>
      <p>Description: {{job.description}}</p>
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
  border: 2px solid black;
  border-radius: 10px;
  margin: 5px;
  padding: 5px;
  background-color: lightsteelblue;

}
</style>