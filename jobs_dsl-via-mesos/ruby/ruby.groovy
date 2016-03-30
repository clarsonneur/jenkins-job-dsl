job('ruby') {
    label('mesos')
    scm {
       git('https://github.com/clarsonneur/demos-images.git')
    }
    steps {
        shell(readFileFromWorkspace('jobs_dsl/ruby/build_ruby_images.sh'))
    }
}
