pipeline {
    agent any

    stages {
        stage('Checkout git repo') {
            steps {
                git branch: 'main', 
                    url: 'https://github.com/deshmukh-lokesh/aws-terraform.git'
            }
        }

        stage('Check terraform version') {
            steps {
                sh 'terraform version'
            }
        }

        stage('Initialize terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Validate terraform code') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Check the terraform format') {
            steps {
                sh 'terraform fmt'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([usernamePassword(
                        credentialsId: 'aws-credentials',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )]) {
                        sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input message: "Approve to Apply Terraform Changes?", ok: "Apply"
                sh 'terraform apply'
            }
        }
    }

    post {
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the logs for details.'
        }
    }
}