pipeline {
    agent any // Make sure the agent has Terraform and AWS CLI installed for Windows
    environment {
        AWS_ACCESS_KEY_ID = 'AKIA2UC3BEDBGIIYKFNP'
        AWS_SECRET_ACCESS_KEY = credentials('secret-access-key')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/gaurav714/jenkins_pipeline_terraform_aws.git', branch: 'main'  // Replace with your Git repository URL
            }
        }

        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                bat 'terraform apply -auto-approve tfplan' 
            }
        }

        stage('Terraform Destroy') { 
            steps {
                bat 'terraform destroy -auto-approve' 
            }
        }
    }
}