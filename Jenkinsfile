pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "demoapp:latest"
    }

    stages {
        stage('Clone repository') {
            steps {
                echo "Clonage du code source depuis Git"
                git branch: 'main', url: 'https://github.com/User-sam21/StudentsGrades.git'
            }
        }

        stage('Build application') {
            steps {
                echo "Compilation de l'application"
                bat 'dotnet restore'
                bat 'dotnet build --configuration Release'
            }
        }

        stage('Run Unit Tests') {
            steps {
                echo "Exécution des tests unitaires"
                bat 'dotnet test --configuration Release --no-build'
            }
        }

        stage('Dockerize Application') {
            steps {
                echo "Création de l'image Docker"
                bat '''
                docker build -t $DOCKER_IMAGE .
                docker images
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline terminé avec succès !"
        }
        failure {
            echo "Pipeline échoué. Vérifiez les logs."
        }
    }
}
