job('vnfm_pull_request') {
    triggers {
        githubPullRequest {
        }
    }
    scm {
        git('https://github-sc-p.corp.hp.com/vnfm/manager/')
        credentials('github-integration')
    }
    steps {
        shell(readFileFromWorkspace('jobs_dsl/vnfm/pull_request/step1.sh'))
        shell(readFileFromWorkspace('jobs_dsl/vnfm/pull_request/step2.sh'))
        shell(readFileFromWorkspace('jobs_dsl/vnfm/pull_request/step3.sh'))
    }
}
