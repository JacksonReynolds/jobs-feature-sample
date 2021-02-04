<template>
  <div id='jobs-index'>
    <header id="jobs-index-header">
      <h1>Jobs Index</h1>
      <input>
    </header>
    <ul>
      <li v-for="job in jobs" :key="job.name">
        Title: {{job.title}}<br>
        <ul>Skills:
          <li v-for="skill in job.skills" :key="skill">{{skill}}</li>
        </ul><br>
        Description: {{job.description}}
      </li>
    </ul>
  </div>
</template>

<script>
  // import EditJob from './EditJob'
  // import ShowJob from './ShowJob'
  export default {
    name: 'JobsIndex',
    // components: {EditJob, ShowJob},
    data () {
      return {
        jobs: [{
          title: "Full-Stack Engineer",
          skills: ["JavaScript", "Ruby", "Rails", "Vue.js", "HTML", "CSS"],
          description: `As a Full Stack Engineer, you will aid us in innovating the world
                        of connecting people with a job that they love.`
        },
        {
          title: "Architect",
          skills: ["CAD", "Revit", "Residential and Commericla Design", "Building Codes"],
          description: `This position is excellent for architects seeking career growth within the 
                        firm, design opportunities in a variety of project types, and extensive client contact.`
        },
        {
          title: "Real Estate Agent",
          skills: ["Market Analysis", "Salespersonship", "Networking", "Presentation"],
          description: `A Real Estate Agent plays an essential role in a real estate transaction.
                        In this role, you will advocate for your clients by understanding their 
                        preferences, representing them when negotiating a sale and assisting them 
                        with every detail of their home purchase and sale.`
        },
        {
          title: "Fitness Trainer",
          skills: [""],
          description: `Instruct members and guests using up to date techniques and methods to ensure
                        proper use of all exercise equipment as well as other methods of exercise.`
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

<style scoped>
#jobs-index-header {
  display: flex;
  justify-content: space-between;
  font-family: Arvo;
  
}
#jobs-index {
  display: flex;
  flex-direction: column;
  width: 80%;
  background-color: aqua;
  height: 100%;
  border-radius: 15px;
}
</style>