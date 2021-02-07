export function fetchJobs() {
  fetch('http://localhost:3000/jobs')
    .then(r => r.json())
    .then(jobs => {
      this.jobs = jobs
      updateCache(jobs)
    })
}

export function fetchUpdatedJob(job) {
  let options = {
    method: "PATCH",
    headers: {"Content-Type": 'application/json'},
    body: JSON.stringify(job)
  }
  fetch(`http://localhost:3000/jobs/${job.id}`, options)
    .then(r => r.json())
    .then(job => {
        let index = this.jobs.findIndex(j => j.id === job.id)
        this.jobs = [...this.jobs.slice(0,index), job, ...this.jobs.slice(index+1)]

        updateCache(this.jobs)
        this.toggleEditForm(null)
      })
}

export function fetchNewJob(job) {
  let options = {
    method: 'POST',
    headers: {"Content-Type": 'application/json'},
    body: JSON.stringify(job)
  }
  fetch('http://localhost:3000/jobs', options)
    .then(r => r.json())
    .then(job => {
        this.jobs = [job, ...this.jobs]
        updateCache(this.jobs)
      })
}

export function deleteJob(id) {
  let options = {
    method: "DELETE",
    headers: {'Content-Type': 'application/json'},
    body: JSON.stringify({job: {id}})
  }
  fetch(`http://localhost:3000/jobs/${id}`, options)
    .then(r => r.json())
    .then(() => {
        let i = this.jobs.findIndex(j => j.id === id)
        this.jobs = [...this.jobs.slice(0, i), ...this.jobs.slice(i+1)]
        updateCache(this.jobs)
    })
}

const updateCache = (jobs) => {
  localStorage.jobs = JSON.stringify(jobs)
}