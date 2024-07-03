pipeline{
    agent any
    
    stages{
        stage("Clone Code"){
            steps{
                echo "Cloning the code"
                git url:"https://github.com/saswatsam786/node-app-test.git", branch: "main"
            }
        }
        
        stage("Build"){
            steps{
                echo "Building the image"
                sh "docker build -t node-app ."
            }
        }
        
        stage("Push to Docker Hub"){
            steps{
                echo "Pushing the image to Docker hub"
                withCredentials([usernamePassword(credentialsId:"dockerHub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]){
                sh "docker tag node-app ${env.dockerHubUser}/node-app:latest"
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker push ${env.dockerHubUser}/node-app:latest"
                }
            }
        }
        
        stage("Deploy"){
            steps{
                echo "Deploying the container"
                // sh "docker run -d -p 3000:3000 saswatsam/node-app:latest"
                sh "docker compose down && docker compose up -d"
            }
        }
    }
}
