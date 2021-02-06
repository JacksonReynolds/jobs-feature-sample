<template>
  <div id='jobs-index'>
    <header id="jobs-index-header">
      <h1>Jobs Index</h1>
      <div>
        Filter:<input v-model="filterTerm" @input="filterJobs">
        <p v-if="isFiltered">Filtering on Skills, showing {{filteredJobs.length}} of {{jobs.length}} jobs.</p>
      </div>
    </header>
    <EditJob />
    <template v-for="job in filteredJobs">
      <EditJob v-if="job.editing" @job-updated="updateJob" :job="job" :key="job.id"/>
      <ShowJob v-else @edit-job="toggleEditForm" :job="job" :key="job.id"/>
    </template>
  </div>
</template>

<script>
  import EditJob from './EditJob'
  import ShowJob from './ShowJob'
  export default {
    name: 'JobsIndex',
    components: {ShowJob, EditJob},
    data () {
      return {
        filterTerm: '',
        jobs: []
      }
    },
    mounted () {
      localStorage.jobs ? this.jobs = localStorage.jobs : this.fetchJobs()
    },
    methods: {
      fetchJobs() {
        fetch('http://localhost:3000/jobs')
          .then(r => r.json())
          .then(jobs => {
            console.log(jobs)
            // localStorage.jobs = jobs
            // this.jobs = jobs
            })
          .catch(({msg}) => {
            alert(`Please check your server, reload, and try again, ${msg}`)
          })
      },
      fetchUpdatedJob(job) {
        let options = {
          method: "PATCH",
          headers: {"Content-Type": 'application/json'},
          body: JSON.stringify(job)
        }
        fetch(`https://localhost:3000/jobs/${job.id}`, options)
          .then(r => r.json())
          .then(r => console.log(r))
          .catch(error => console.log(error))
      },
      toggleEditForm(id) {
        let job = this.jobs.find(j => j.id === id)
        job.editing = !job.editing
      },
      updateJob(job) {
        this.toggleEditForm(job.id)
        // this.fetchUpdatedJob(job)
      }
    },
    computed: {
      filteredJobs() {
        return (this.isFiltered ? this.jobs.filter(j => j.skills.find(s => s.toLowerCase().includes(this.filterTerm.toLowerCase()))) 
                                : this.jobs)
      },
      isFiltered() {
        return (this.filterTerm.trim() != '')
      }
    }
  }
</script>

<style >
#jobs-index-header {
  display: flex;
  justify-content: space-between;
  align-content: center;
  font-family: Arial;
  padding: 10px;
}

header > input {
  height: 33%;
}

#jobs-index {
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 80%;
  background-color: aqua;
  height: 100%;
  border-radius: 15px;
}
</style>