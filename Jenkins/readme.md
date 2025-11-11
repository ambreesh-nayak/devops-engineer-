# Jenkins Installation

````
sudo apt update
sudo apt install fontconfig openjdk-21-jre -y
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update -y
sudo apt install jenkins -y
````




#jenkins srpite

pipeline {
    agent any

    environment {
        PROJECT_NAME = "💫 Ultra-Demo-Pipeline 💫"
        BUILD_VERSION = "3.0.${BUILD_NUMBER}"
        START_TIME = "${new Date()}"
    }

    stages {
        stage('🚀 Initialize') {
            steps {
                echo "======================================================="
                echo "✨ Starting ${PROJECT_NAME} | Build #${BUILD_NUMBER}"
                echo "🕒 Started at: ${START_TIME}"
                echo "======================================================="
                sh 'echo "Environment initialized successfully!"'
            }
        }

        stage('📦 Code Checkout') {
            steps {
                echo "Checking out source code..."
                sh 'echo "Code checkout successful!"'
            }
        }

        stage('🔧 Dependencies Setup') {
            steps {
                echo "Installing dependencies..."
                sh 'echo "Dependencies installed successfully!"'
            }
        }

        stage('🏗️ Build') {
            steps {
                echo "Building the project..."
                sh 'echo "Build completed successfully!"'
            }
        }

        stage('🧪 Testing') {
            steps {
                echo "Running test suite..."
                sh 'echo "All tests passed successfully!"'
            }
        }

        stage('🧠 Code Quality Check') {
            steps {
                echo "Analyzing code quality..."
                sh 'echo "No issues found — Code quality is top-notch!"'
            }
        }

        stage('📦 Packaging') {
            steps {
                echo "Creating build package..."
                sh 'echo "Packaging completed successfully!"'
            }
        }

        stage('🚢 Deployment Simulation') {
            steps {
                echo "Simulating deployment to staging..."
                sh 'echo "Deployment simulation successful!"'
            }
        }

        stage('🔍 Validation') {
            steps {
                echo "Validating deployment..."
                sh 'echo "Validation successful!"'
            }
        }

        stage('🧹 Cleanup') {
            steps {
                echo "Cleaning up workspace..."
                sh 'echo "Cleanup completed successfully!"'
            }
        }
    }

    post {
        success {
            script {
                def END_TIME = new Date()
                def banner = """
=======================================================
███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
██╔════╝██║   ██║██╔════╝██╔═══██╗██╔════╝██╔════╝
███████╗██║   ██║██║     ██║   ██║█████╗  ███████╗
╚════██║██║   ██║██║     ██║   ██║██╔══╝  ╚════██║
███████║╚██████╔╝╚██████╗╚██████╔╝███████╗███████║
╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚══════╝
=======================================================
"""

                echo banner
                echo "🎉 PIPELINE PASSED SUCCESSFULLY! 🎉"
                echo "✅ Project       : ${PROJECT_NAME}"
                echo "✅ Build Version : ${BUILD_VERSION}"
                echo "✅ Status        : SUCCESS"
                echo "🕒 Completed At  : ${END_TIME}"
                echo "-------------------------------------------------------"
                echo "💬 Quote of the Build:"
                echo "\"Success is not the key to happiness. Happiness is the key to success.\""
                echo "-------------------------------------------------------"
                echo "🌈 Everything executed perfectly — Great job, Engineer! 🌈"
                echo "======================================================="
            }
        }

        failure {
            echo "❌ Pipeline failed — please review the logs for errors."
        }
    }
}
