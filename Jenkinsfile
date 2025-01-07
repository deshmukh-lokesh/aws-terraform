pipeline {
    agent any
    
    stages {
        stage('Checkout git repo') {
            steps {
                script {
                git branch: 'main', 
                    url: 'https://github.com/deshmukh-lokesh/aws-terraform.git', 
                    credentialsId: 'aws-credentials'
            }
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

        stage('Validate terraorm code') {
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
                sh 'terraform plan'
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
}