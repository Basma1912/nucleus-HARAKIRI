#!groovy

@Library('github.com/mozmeao/jenkins-pipeline@20170607.1')

def loadBranch(String branch) {
    // load the utility functions used below
    utils = load 'jenkins/utils.groovy'

    if ( fileExists("./jenkins/branches/${branch}.yml") ) {
        config = readYaml file: "./jenkins/branches/${branch}.yml"
        println "config ==> ${config}"
    } else {
        println "No config for ${branch}. Nothing to do. Good bye."
        return
    }

    // defined in the Library loaded above
    setGitEnvironmentVariables()

    if ( config.pipeline && config.pipeline.script ) {
        println "Loading ./jenkins/${config.pipeline.script}.groovy"
        load "./jenkins/${config.pipeline.script}.groovy"
    } else {
        println "Loading ./jenkins/default.groovy"
        load "./jenkins/default.groovy"
    }
}

node {
    stage ('Prepare') {
        checkout scm
    }
    if ( skipTheBuild() ) {
        println 'Skipping this build. CI Skip detected in commit message.'
    } else {
        loadBranch(env.BRANCH_NAME)
    }
}
