<template>
  <div id='jobs-index'>
    <header id="jobs-index-header">
      <h1>Jobs Index</h1>
      <div>
        Filter:<input v-model="filterTerm" >
        <p v-if="isFiltered">Filtering on Skills, showing {{jobsList.length}} of {{jobs.length}} jobs.</p>
      </div>
    </header>
    <EditJob 
      @job-updated="fetchNewJob"
      @keydown.enter.prevent 
    />
    <template v-for="job in jobsList">
      <EditJob v-if="job.id === editingJob" 
        @keydown.enter.prevent
        @job-updated="fetchUpdatedJob" 
        :job="job" 
        :key="job.id"
      />
      <ShowJob v-else 
        @edit-job="toggleEditForm" 
        @job-deleted="deleteJob" 
        :job="job" 
        :key="job.id"
      />
    </template>
  </div>
</template>

<script>
  import EditJob from './EditJob'
  import ShowJob from './ShowJob'
  import {fetchJobs, fetchUpdatedJob, fetchNewJob, deleteJob} from '../JobsApiHelper.js'
  
  export default {
    name: 'JobsIndex',
    components: {ShowJob, EditJob},
    data () {
      return {
        filterTerm: '',
        editingJob: null,
        jobs: []
      }
    },
    mounted () {
      localStorage.jobs ? this.jobs = JSON.parse(localStorage.jobs) : this.fetchJobs()
    },
    methods: {
      fetchJobs,
      fetchUpdatedJob,
      fetchNewJob,
      deleteJob,
      toggleEditForm(id) {
        this.editingJob = id
      },
      updateJob(job) {
        if (job.id) {
          this.fetchUpdatedJob(job)
        } else {
          this.fetchNewJob(job)
        }
      }
    },
    computed: {
      jobsList() {
        return (this.isFiltered ? this.jobs.filter(job => job.skills.find(skill => skill.toLowerCase().includes(this.filterTerm.toLowerCase()))) 
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
  border: 2px solid black;
}
</style>