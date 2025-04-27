pipeline {
    agent any

    stages {
        stage('Checkout Source') {
            steps {
                checkout scm
            }
        }

        stage('Copy Files to Deployment Server') {
            steps {
                sh '''
                    scp -o StrictHostKeyChecking=no -r Demand\ Forecasting_doc.docx Jenkinsfile Latest New\ folder Product_data.csv _Rhistory app.R b.csv bivariate.R data data.R demand\ forecast.pptx deploy.R desc.pdf error.csv forecast forecast.R multi.csv myoutputfile.html output.R packages_to_be_installed.R uni_error.csv univariate.R www ubuntu@54.173.137.64:/home/ubuntu/my_shiny_project
                '''
            }
        }

        stage('Run Deploy Script on Remote Server') {
            steps {
                sh '''
                    ssh -o StrictHostKeyChecking=no ubuntu@54.173.137.64 "bash /home/ubuntu/deploy_script.sh"
                '''
            }
        }
    }
}

