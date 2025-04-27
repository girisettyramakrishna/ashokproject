pipeline {
    agent any

    environment {
        REMOTE_USER = 'ubuntu'
        REMOTE_HOST = '54.173.137.64'
        REMOTE_DIR  = '/home/ubuntu/my_shiny_project'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/girisettyramakrishna/ashokproject.git'
            }
        }

        stage('Copy Files to Deployment Server') {
            steps {
                sh '''
                scp -o StrictHostKeyChecking=no -r * ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}
                '''
            }
        }

        stage('Run Deploy Script on Remote Server') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ${REMOTE_USER}@${REMOTE_HOST} "cd ${REMOTE_DIR} && Rscript deploy.R"
                '''
            }
        }
    }
}

