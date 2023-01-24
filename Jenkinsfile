pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        node(label: 'centos7-node')
        git(url: 'https://github.com/rawikumarp/ecommerce-website.git', branch: '/master')
        sh 'mvn clean compile package'
        echo 'Building and Packaging'
      }
    }

    stage('Test') {
      steps {
        junit 'target/**/8.xml'
        echo 'Testing'
      }
    }

    stage('Deploy') {
      steps {
        node(label: 'centos7-node')
        sh '''docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
        echo 'Deploying'
      }
    }

  }
}