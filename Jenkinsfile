pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'main', credentialsId: 'abb8b4cd-3743-400a-bd06-97370d5e3864', url: 'https://github.com/chaosthor18/Group4_GitProject.git'
                sh '''
                    #!/bin/bash
                    echo "Running Build"
                    sed -i '/RED=$(tput setaf 1)/d' *.sh
                    sed -i '/RED=$(tput setaf 1)/d' */*.sh
                    sed -i '/GREEN=$(tput setaf 2)/d' *.sh
                    sed -i '/GREEN=$(tput setaf 2)/d' */*.sh
                    sed -i '/YELLOW=$(tput setaf 3)/d' *.sh
                    sed -i '/YELLOW=$(tput setaf 3)/d' */*.sh
                    sed -i '/CYAN=$(tput setaf 6)/d' *.sh
                    sed -i '/CYAN=$(tput setaf 6)/d' */*.sh
                    sed -i '/CYAN=$(tput setaf 7)/d' */*.sh
                    sed -i '/NORMAL=$(tput sgr0)/d' *.sh
                    sed -i '/NORMAL=$(tput sgr0)/d' */*.sh
                    sed -i '/BOLD=$(tput bold)/d' *.sh
                    sed -i '/BOLD=$(tput bold)/d' */*.sh
                    sed -i 's/exit 1/exit 0/g' *.sh
                    sed -i 's/exit 1/exit 0/g' */*.sh
                    echo "Entering 30 entries..."
                    ./shift_sched.sh <<-EOF
                        Reset
                        $(cat ./database/test_entries.txt)
                    EOF
                '''
            }
        }
        stage('Test 1') {
            steps {
                        sh '''
                        echo "Verifying 30 entries..."
                        if [ $(cat ./database/database.json | grep -i "EMPTY" | wc -l) -eq 0 ]
                        then
                            echo "Test 1 Success"
                            exit 0
                        else
                            echo "Test 1 Failed"
                            exit 1
                        fi
                        '''
            }
        }
        stage('Test 2') {
            steps {
                script{
                        try {
                                sh '''
                                echo "Testing condition (2 people max per shift in a team)..."
                                sed -i 's/exit 0/exit 1/g' ./scripts/schedule_check.sh
                                ./shift_sched.sh <<-EOF
                                    Reset
                                    TestUser1
                                    Morning
                                    A1
                                    TestUser2
                                    Morning
                                    A1
                                    TestUser3
                                    Morning
                                    A1
                                EOF
                                '''
                        }
                        catch (hudson.AbortException e) {
                            echo "Test 2 Success..."
                            sh 'exit 0'
                        } 
                }
            }
        }
        stage('Test 3') {
            steps {
                script{
                        try {
                                sh '''
                                echo "Testing condition (wrong input)..."
                                sed -i 's/exit 0/exit 1/g' ./scripts/user_input.sh
                                ./shift_sched.sh <<-EOF
                                    Reset
                                    TestUser1
                                    A1
                                    Morning
                                EOF
                                '''
                        }
                        catch (hudson.AbortException e) {
                            echo "Test 3 Success..."
                            sh 'exit 0'
                        } 
                }
            }
        }
    }
}