pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        node(label: 'centos7-node')
        echo 'Building'
        sh '''docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
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
        node(label: 'centos7-node')
        echo 'Deploying'
        sh '''docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
      }
    }

  }
}