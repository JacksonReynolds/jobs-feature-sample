<template>
  <div id='jobs-index'>
    <header id="jobs-index-header">
      <h1>Jobs Index</h1>
      <div>
        Filter:<input v-model="filterTerm" @input="filterJobs">
        <p v-if="isFiltered">Filtering on Skills, showing {{filteredJobs.length}} of {{jobs.length}} jobs.</p>
      </div>
    </header>
    <EditJob 
      @job-updated="fetchNewJob"
      @keydown.enter.prevent 
    />
    <template v-for="job in filteredJobs">
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
      fetchJobs() {
        fetch('http://localhost:3000/jobs')
          .then(r => r.json())
          .then(jobs => {
            this.jobs = jobs
            this.updateCache()
            })
          .catch(() => {
            alert(`Please check your server, reload, and try again`)
          })
      },
      fetchUpdatedJob(job) {
        let options = {
          method: "PATCH",
          headers: {"Content-Type": 'application/json'},
          body: JSON.stringify(job)
        }
        fetch(`http://localhost:3000/jobs/${job.id}`, options)
          .then(r => r.json())
          .then(job => {
            if (!job.msg) {
              // update data with new job
              let index = this.jobs.findIndex(j => j.id === job.id)
              this.jobs = [...this.jobs.slice(0,index), job, ...this.jobs.slice(index+1)]

              this.updateCache()
              this.toggleEditForm(null)
            } else {
              alert(job.msg)
            }
            })
      },
      fetchNewJob(job) {
        let options = {
          method: 'POST',
          headers: {"Content-Type": 'application/json'},
          body: JSON.stringify(job)
        }
        fetch('http://localhost:3000/jobs', options)
          .then(r => r.json())
          .then(job => {
            if (!job.msg) {
              this.jobs.unshift(job)
              this.updateCache()
            } else {
              alert(job.msg)
            }
            })
      },
      toggleEditForm(id) {
        this.editingJob = id
      },
      updateJob(job) {
        if (job.id) {
          this.fetchUpdatedJob(job)
        } else {
          this.fetchNewJob(job)
        }
      },
      deleteJob(id) {
        let options = {
          method: "DELETE",
          headers: {'Content-Type': 'application/json'},
          body: JSON.stringify({job: {id}})
        }
        fetch(`http://localhost:3000/jobs/${id}`, options)
          .then(r => r.json())
          .then(r => {
            if (r.success) {
              let i = this.jobs.findIndex(j => j.id === id)
              this.jobs = [...this.jobs.slice(0, i), ...this.jobs.slice(i+1)]
              this.updateCache()
            } else {
              alert(r.msg)
            }
          })
      },
      updateCache() {
        localStorage.jobs = JSON.stringify(this.jobs)
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
  border: 2px solid black;
}
</style>