<template>
  <div id='jobs-index'>
    <ul>
      <li v-for="job in jobs" :key="job.name">{{job.name}}</li>
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
        jobs: []
      }
    },
    mounted () {
      localStorage.jobs ? null : this.fetchJobs()
    },
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