<template>
    <div class="show-job" :id="id">
      <p>Title: {{title}}</p>
      <p>Skills:</p>
      <ul>
        <li v-for="skill in skills" :key="skill">{{skill}}</li>  
      </ul>
      <p>Description: {{description}}</p>
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
        }
    }
</script>

<style scoped>

</style>