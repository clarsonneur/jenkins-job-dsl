job('ruby-subhash') {
    scm {
       git('https://github.com/clarsonneur/subhash.git')
    }
    steps {
        shell(readFileFromWorkspace('jobs_dsl/forj-cli/build_1.8.sh'))
        shell(readFileFromWorkspace('jobs_dsl/forj-cli/build_2.0.sh'))
        shell(readFileFromWorkspace('jobs_dsl/forj-cli/build_2.2.sh'))
    }
}
