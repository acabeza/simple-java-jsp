pipeline{
    agent{
        docker {
            image 'java'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages{
        stage("Build"){
            steps{
                sh 'mvn -B -DskipTests clean package'
            }
            post{
                always{
                    echo "========Comprobrando Build========"
                }
                success{
                    echo "========Build executed successfully========"
                }
                failure{
                    echo "========Build execution failed========"
                }
            }
        }
        stage("Test"){
            steps{
                sh 'mvn test'
            }
             post{
                always{
                    echo "====++++Comprobando Test++++===="
                }
                success{
                    echo "====++++Test executed succesfully++++===="
                }
                failure{
                    echo "====++++Test execution failed++++===="
                }
        
            }
        }
        stage("Deploy"){
            steps{
                deploy adapters: [tomcat9(credentialsId: '9d8ae760-8d72-4879-8c98-926c418f7450',
                path: '', url: 'http://localhost:9090/')],
                contextPath: '/war',
                war: '"**/*.war"'
            }
            post{
                always{
                    echo "====++++Comprobabando Deploy++++===="
                }
                success{
                    echo "====++++Deploy executed succesfully++++===="
                }
                failure{
                    echo "====++++Deploy execution failed++++===="
                }
        
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}
