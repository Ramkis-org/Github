pipeline {
    agent any

    environment {
        ACR_NAME = "srelloydsacr123"
        IMAGE_NAME = "hello-sre"
        IMAGE_TAG = "v1"
        AKS_RESOURCE_GROUP = "sre-demo-rg"
        AKS_CLUSTER_NAME = "sre-demo-aks"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ramkis-org/Github.git'
            }
        }

        stage('Azure Login') {
            steps {
                sh "az login --identity"
                sh "az account set --subscription 6efdb685-f5ce-4be4-9841-83d09c4ac05a"
            }
        }

        stage('Docker Build') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('Docker Tag') {
            steps {
                sh "docker tag $IMAGE_NAME:$IMAGE_TAG $ACR_NAME.azurecr.io/$IMAGE_NAME:$IMAGE_TAG"
            }
        }

        stage('Push to ACR') {
            steps {
                sh "az acr login --name $ACR_NAME"
                sh "docker push $ACR_NAME.azurecr.io/$IMAGE_NAME:$IMAGE_TAG"
            }
        }

        stage('Deploy to AKS') {
            steps {
                sh "az aks get-credentials -g $AKS_RESOURCE_GROUP -n $AKS_CLUSTER_NAME --overwrite-existing"
                sh "kubectl set image deployment/hello-sre app=$ACR_NAME.azurecr.io/$IMAGE_NAME:$IMAGE_TAG"
                sh "kubectl rollout status deployment/hello-sre1"
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed!"
        }
    }
}
