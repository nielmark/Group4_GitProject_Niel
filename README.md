# Group 4 OpsWerks Shift Scheduler
Group 4 Shift Scheduler is a script that organizes and stores schedules in JSON format.

## Members:
- Reydentor Casaljay
- Mhonn Czedrick Ybañez
- Niel Mark Sanchez

## Running in a Docker Container
### Requirements: 
- Docker installed
- Git installed
Clone repository
```sh
git clone https://github.com/nielsanchez/Group4_GitProject.git 
```
Change directory to the repo
```sh
cd Group4_GitProject
```
Build docker image
```sh
docker build -t shift-sched .
```
Run docker image
```sh
docker run -it --mount type=bind,source=./database,target=/shift-scheduler/database shift-sched /bin/bash ./shift_sched.sh
```


## Running in a Mac or Linux Operating System
### Requirements for Mac: 
- Homebrew installed
### Requirements for linux:
- Package Manager(yum, dnf, apt, apt-get)
Clone repository
```sh
git clone https://github.com/nielsanchez/Group4_GitProject.git 
```
Change directory to the repo
```sh
cd Group4_GitProject
```
Run the script
```sh
./script_sched.sh
```
