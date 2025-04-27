pipeline {
    agent any

    environment {
        REMOTE_USER = 'ubuntu'
        REMOTE_HOST = '3.85.244.54'
        REMOTE_DIR  = '/home/ubuntu/project'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'master', url: 'https://github.com/girisettyramakrishna/newproject.git'
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

