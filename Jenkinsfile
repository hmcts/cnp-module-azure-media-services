#!groovy
@Library('Infrastructure') _

try {
  node {
    env.PATH = "$env.PATH:/usr/local/bin"

    stage('Checkout') {
      deleteDir()
      checkout scm
    }

    stage('Terraform init') {
      sh 'terraform init -backend=false'
    }

    stage('Terraform Linting Checks') {
      sh 'terraform validate -no-color'
      sh 'terraform fmt -check=true'
    }
  }
}
catch (err) {
  throw err
}