pipeline {
    agent any // Make sure the agent has Terraform and AWS CLI installed for Windows

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

        stage('Verify EC2 Instance Creation') {
            steps {
                script {
                    // Retrieve instance ID from Terraform output
                    def instanceId = bat(script: 'terraform output -raw instance_id', returnStdout: true).trim()
                    env.INSTANCE_ID = instanceId 

                    // Use AWS CLI to describe the instance and check its state (Windows style)
                    bat '''
                        aws ec2 describe-instances --instance-ids %INSTANCE_ID% --query 'Reservations[].Instances[].State.Name' --output text > instance_state.txt
                    '''

                    def instanceState = readFile('instance_state.txt').trim()

                    if (instanceState == 'running') {
                        echo "EC2 instance created successfully with ID: ${instanceId}"
                    } else {
                        error("EC2 instance creation failed! Current state: ${instanceState}")
                    }
                }
            }
        }
    }
}