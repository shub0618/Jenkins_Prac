# Jenkins Practice Repository

This repository contains scripts and configuration files used to practice and explore Jenkins CI/CD pipelines. 
The primary focus of this repository is to demonstrate how to automate various software development tasks such as building, testing, and deploying applications using Jenkins.

## Table of Contents

- [About](#about)
- [Technologies Used](#technologies-used)
- [Setup Instructions](#setup-instructions)
- [Jenkins Pipeline Examples](#jenkins-pipeline-examples)
- [Contributing](#contributing)
- [License](#license)

## About

This repository is a environment created by me druring the practicing of  continuous integration and continuous delivery (CI/CD) workflows using Jenkins. 
The repository includes Jenkins pipeline scripts, shell scripts, and other resources for automating typical tasks in a development cycle.

### Key Features:
- Jenkins Pipeline as Code (Declarative and Scripted pipelines)
- Automated build and test scripts
- Integration with GitHub for webhook triggers
- Practice of CI/CD concepts such as building, testing, and deploying

## Technologies Used

- **Jenkins**: An open-source automation server that automates parts of the software development process related to building, testing, and deploying applications.
- **Shell Scripts**: For custom automation tasks within the Jenkins pipeline.
- **Git**: Version control system for managing code.
  
## Setup Instructions

To use the repository locally and start Jenkins in a Docker container:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/shub0618/Jenkins_Prac.git
   cd PipeLine_Codes
   ```

2. **Installing Jenkins**:
   ```bash
   ./installtion.sh/
   ```
   run the script with executable permissions to install the jenkins or you can visit the offical jenkins documentation to download it
      
2. **Access Jenkins**:
   After running Jenkins, navigate to `http://localhost:8080` in your browser. Use the following default credentials (if not changed):
   - Username: `admin`
   - Password: Check the Jenkins container logs to find the initial admin password.

3. **Configure Jenkins**:
   - Install suggested plugins.
   - Set up your first Jenkins pipeline using the included `Jenkinsfile`.

## Jenkins Pipeline Examples

### Declarative Pipeline Example
```groovy
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                sh 'make build'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
                sh 'make deploy'
            }
        }
    }
}
```

### Scripted Pipeline Example
```groovy
node {
    stage('Build') {
        echo 'Building...'
        sh 'make build'
    }
    stage('Test') {
        echo 'Testing...'
        sh 'make test'
    }
    stage('Deploy') {
        echo 'Deploying...'
        sh 'make deploy'
    }
}
```

## Contributing

Contributions are welcome! If you'd like to improve this repository or add more Jenkins practice pipelines, please fork the repo and submit a pull request.

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a pull request


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
