job('ruby-subhash') {
    scm {
       git('https://github.com/clarsonneur/subhash.git')
    }
    steps {
        shell(readFileFromWorkspace('jobs_dsl/subhash/build_18.sh'))
        shell(readFileFromWorkspace('jobs_dsl/subhash/build_20.sh'))
        shell(readFileFromWorkspace('jobs_dsl/subhash/build_22.sh'))
    }
}
