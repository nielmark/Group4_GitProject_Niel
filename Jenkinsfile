pipeline {
    agent {
        node {
            label 'ubuntu-agent2'
            customWorkspace '/home/jenkins-agent/Group4_GitProject'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh '''
                    chmod +x -R /home/jenkins-agent/Group4_GitProject
                    ./user_input.sh << EOF 
                    Reydentor Casaljay
                    Morning
                    B2
                    Print 
                    EOF
                '''
            }
        }
    }
}
