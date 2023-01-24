pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        node(label: 'centos7-node') {
          git(url: 'https://github.com/rawikumarp/ecommerce-website.git', branch: 'master')
        }

        echo 'Building and Packaging'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
      }
    }

    stage('Deploy') {
      steps {
        node(label: 'centos7-node') {
          sh '''chmod 777 /var/run/docker.sock
docker rm -f $(sudo docker ps -a -q)
docker build /home/linuxuser/jenkins/workspace/git-job-ecommerce -t  ecommerce-website
docker run -it -p 81:80 -d ecommerce-website'''
          echo 'Deploying'
        }

      }
    }

  }
}