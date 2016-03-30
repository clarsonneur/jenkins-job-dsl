job('test') {
    label('mesos')
    steps {
        shell(readFileFromWorkspace('jobs_dsl/test/step1.sh'))
        shell(readFileFromWorkspace('jobs_dsl/test/step2.sh'))
        shell(readFileFromWorkspace('jobs_dsl/test/step3.sh'))
    }
}
