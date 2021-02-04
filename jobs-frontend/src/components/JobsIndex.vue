<template>
  <div id='jobs-index'>
    <ul>
      <li v-for="job in jobs" :key="job.name">
        Title: {{job.name}}<br>
        <ul>Skiils: <br>
          <li v-for="skill in job.skills" :key="skill">{{skill}}</li>
        </ul><br>
        Description: {{job.description}}
      </li>
    </ul>
  </div>
</template>

<script>
  import EditJob from './EditJob'
  import ShowJob from './ShowJob'
  export default {
    name: 'JobsIndex',
    components: {EditJob, ShowJob},
    data () {
      return {
        jobs: [{
          title: "Full-Stack Engineer",
          skills: ["JavaScript", "Ruby", "Rails", "Vue.js", "HTML", "CSS"],
          description: "As a Full Stack Engineer, you will aid us in innovating the world of connecting people with a job that they love."
        },
        {

        }]
      }
    },
    // mounted () {
    //   localStorage.jobs ? null : this.fetchJobs()
    // },
    methods: {
      fetchJobs() {
        fetch('https://localhost:3000/jobs')
          .then(r => r.json())
          .then(r => localStorage.jobs = r.jobs)
          .catch(() => {
            alert('Please check your server, reload, and try again')
          })
      }
    },
    computed: {
    }
  }
</script>

<style lang="sass" scoped>
</style>