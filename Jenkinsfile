pipeline {
    agent {
        node {
            label 'ubuntu-agent2'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh '''
                    echo "Running Test"
                    ./shift_sched.sh << EOF 
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
