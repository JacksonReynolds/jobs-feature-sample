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
        jobs: [{
          id: 1,
          title: "Full-Stack Engineer",
          skills: ["JavaScript", "Ruby", "Rails", "Vue.js", "HTML", "CSS"],
          description: "As a Full Stack Engineer, you will aid us in innovating the world of connecting people with a job that they love.",
          editing: false
        },
        {
          id: 2,
          title: "Architect",
          skills: ["CAD", "Revit", "Residential and Commercial Design", "Building Codes"],
          description: "This position is excellent for architects seeking career growth within the firm, design opportunities in a variety of project types, and extensive client contact.",
          editing: false
        },
        {
          id: 3,
          title: "Real Estate Agent",
          skills: ["Market Analysis", "Salespersonship", "Networking", "Presentation"],
          description: "A Real Estate Agent plays an essential role in a real estate transaction. In this role, you will advocate for your clients by understanding their preferences, representing them when negotiating a sale and assisting them with every detail of their home purchase and sale.",
          editing: false
        },
        {
          id: 4,
          title: "Fitness Trainer",
          skills: ["Knowledge of Anatomy", "Record Keeping", "Principles of Nutrition", "Affective Exercises", "Personal Training Techniques"],
          description: "Instruct members and guests using up to date techniques and methods to ensure proper use of all exercise equipment as well as other methods of exercise.",
          editing: false
        }]
      }
    },
    // mounted () {
    //   localStorage.jobs ? this.jobs = localStorage.jobs : this.fetchJobs()
    // },
    methods: {
      fetchJobs() {
        fetch('https://localhost:3000/jobs')
          .then(r => r.json())
          .then(r => localStorage.jobs = r.jobs)
          .catch(() => {
            alert('Please check your server, reload, and try again')
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