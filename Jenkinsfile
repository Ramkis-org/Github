pipeline {
    agent any

    environment {
        AZURE_SUBSCRIPTION = "6efdb685-f5ce-4be4-9841-83d09c4ac05a"
        ACR_NAME           = "srelloydsacr123"
        IMAGE_NAME         = "hello-sre"
        IMAGE_TAG          = "v1"
        AKS_RESOURCE_GROUP = "sre-demo-rg1"
        AKS_CLUSTER_NAME   = "sre-demo-aks1"
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ramkis-org/Github.git'
            }
        }

        stage('Azure Login') {
            steps {
                sh """
                    az login --identity
                    az account set --subscription ${AZURE_SUBSCRIPTION}
                """
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh """
                        terraform init
                        terraform plan \
                          -out=tfplan \
                          -var="azure_subscription_id=${AZURE_SUBSCRIPTION}"
                        terraform apply -auto-approve tfplan
                    """
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh """
                    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    docker tag ${IMAGE_NAME}:${IMAGE_TAG} \
                      ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${IMAGE_TAG}

                    az acr login --name ${ACR_NAME}
                    docker push ${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${IMAGE_TAG}
                """
            }
        }

        stage('Deploy to AKS') {
            steps {
                sh """
                    az aks get-credentials \
                      -g ${AKS_RESOURCE_GROUP} \
                      -n ${AKS_CLUSTER_NAME} \
                      --overwrite-existing

                    kubectl apply -f deployment.yaml
                    kubectl apply -f service.yaml

                    kubectl set image deployment/hello-sre \
                      app=${ACR_NAME}.azurecr.io/${IMAGE_NAME}:${IMAGE_TAG}

                    kubectl rollout status deployment/hello-sre
                """
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Deployment failed"
        }
    }
}
