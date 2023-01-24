pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
        node(label: 'centos7-node')
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
        junit 'target/**/8.xml'
      }
    }

    stage('Deploy') {
      steps {
        echo 'Deploying'
        node(label: 'centos7-node')
        sh '''docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
      }
    }

  }
}