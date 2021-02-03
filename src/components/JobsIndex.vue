<template>
    <div>

    </div>
</template>

<script>
    import EditJob from './EditJob'
    import ShowJob from './ShowJob'

    export default {
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
                let options = {

                }
                fetch('https://localhost:3000/jobs', options)
                  .then(r => r.json())
                  .then(r => localStorage.jobs = r.jobs)
                  .catch(() => {
                      // something went wrong, tell the user
                  })
            }
        },
        computed: {

        }
    }
</script>

<style lang="sass" scoped>

</style>