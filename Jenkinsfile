pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building'
        sh '''sudo docker rm -f $(sudo docker ps -a -q)
sudo docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
sudo docker run -it -p 81:80 -d ecommerce-website'''
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
        sh '''sudo docker rm -f $(sudo docker ps -a -q)
sudo docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
sudo docker run -it -p 81:80 -d ecommerce-website'''
      }
    }

  }
}