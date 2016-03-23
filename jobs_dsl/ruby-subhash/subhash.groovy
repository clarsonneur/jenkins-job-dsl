job('ruby-subhash') {
    scm {
       git('https://github.com/forj-oss/rhash.git')
    }
    steps {
        shell(readFileFromWorkspace('jobs_dsl/ruby-subhash/build-18.sh'))
        shell(readFileFromWorkspace('jobs_dsl/ruby-subhash/build-20.sh'))
        shell(readFileFromWorkspace('jobs_dsl/ruby-subhash/build-22.sh'))
    }
}
