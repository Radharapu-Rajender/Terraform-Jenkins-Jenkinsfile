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
                    input message: 'Deploy changes?', ok: 'Deploy'
                    sh "${TF_HOME}/terraform apply -input=false tfplan"
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    input message: 'Destroy infrastructure?', ok: 'Destroy'
                    sh "${TF_HOME}/terraform destroy -auto-approve -input=false"
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up
                sh "rm -rf .terraform"
                sh "rm -f tfplan"
            }
        }
    }
}
