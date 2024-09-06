pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                git branch: 'main', credentialsId: 'abb8b4cd-3743-400a-bd06-97370d5e3864', url: 'https://github.com/nielsanchez/Group4_GitProject.git'
                echo "Running Build..."
                sh '''
                    #!/bin/bash
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
                        echo "Verifying 30 entries..."
                        sh '''
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
                                echo "Testing condition (2 people max per shift in a team)..."
                                sh '''
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
                    def exit_code = "1"
                        try {
                                echo "Testing condition (wrong input in shift)..."
                                sh '''
                                echo "Testing condition Team..."
                                sed -i 's/exit 0/exit 1/g' ./scripts/user_input.sh
                                sed -i 's/exit 1/exit 0/g' ./scripts/print_all.sh
                                ./shift_sched.sh <<-EOF
                                    Reset
                                    TestUser1
                                    Morning
                                    A1
                                    Print
                                EOF
                                '''
                        }
                        catch (hudson.AbortException e) {
                            echo "Test 4 Success..."
                            exit_code = "0"
                            sh 'exit 0'
                        } 
                        if (exit_code == "1"){
                            echo "Test 3 Failed..."
                            sh 'exit 1'
                        } 
                }
            }
        }
        stage('Test 4') {
            steps {
                script{
                    def exit_code = "1"
                    try {
                            echo "Testing condition (wrong input in team)..."
                            sh '''
                            sed -i 's/exit 0/exit 1/g' ./scripts/user_input.sh
                            sed -i 's/exit 1/exit 0/g' ./scripts/print_all.sh
                            ./shift_sched.sh <<-EOF
                                Reset
                                TestUser1
                                Morning
                                A4
                                Print
                            EOF
                            '''
                    }
                    catch (hudson.AbortException e) {
                        echo "Test 4 Success..."
                        exit_code = "0"
                        sh 'exit 0'
                    }
                    if (exit_code == "1"){
                        echo "Test 4 Failed..."
                        sh 'exit 1'
                    } 
                }
            }
        }
    }
}