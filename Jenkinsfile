pipeline {
    agent any

    environment {
        TF_HOME = tool 'Terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/BHUPESHGCTECH/Terraform-Jenkins-Jenkinsfile.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh "${TF_HOME}/terraform init -input=false"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh "${TF_HOME}/terraform plan -out=tfplan -input=false"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    sh "${TF_HOME}/terraform apply -auto-approve -input=false tfplan"
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up
                sh "rm -f tfplan"
            }
        }
    }
}
