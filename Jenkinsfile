pipeline {
    agent any

    environment {
        DEPLOY_SERVER = '192.168.42.171'       // Set your server IP here
        DEPLOY_USER = 'ubuntu'                 // Set your username here
        DEPLOY_PATH = '/home/ubuntu/my_shiny_project'  // Destination path on server
        DEPLOY_SCRIPT = '/home/ubuntu/deploy_script.sh' // Remote deploy script
    }

    stages {
        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Copy Files to Deployment Server') {
            steps {
                sh '''
                    scp -o StrictHostKeyChecking=no -r \
                    "Demand Forecasting_doc.docx" \
                    Jenkinsfile \
                    Latest \
                    "New folder" \
                    Product_data.csv \
                    _Rhistory \
                    app.R \
                    b.csv \
                    bivariate.R \
                    data \
                    data.R \
                    "demand forecast.pptx" \
                    deploy.R \
                    desc.pdf \
                    error.csv \
                    forecast \
                    forecast.R \
                    multi.csv \
                    myoutputfile.html \
                    output.R \
                    packages_to_be_installed.R \
                    uni_error.csv \
                    univariate.R \
                    www \
                    ${DEPLOY_USER}@${DEPLOY_SERVER}:${DEPLOY_PATH}
                '''
            }
        }

        stage('Run Deploy Script on Remote Server') {
            steps {
                sh '''
                    ssh -o StrictHostKeyChecking=no ${DEPLOY_USER}@${DEPLOY_SERVER} "bash ${DEPLOY_SCRIPT}"
                '''
            }
        }
    }

    post {
        success {
            echo ' Deployment completed successfully!'
        }
        failure {
            echo ' Deployment failed!'
        }
    }
}
