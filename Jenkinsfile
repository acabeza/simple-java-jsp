pipeline{
    agent { 
        docker { 
                image 'maven:3.6.2-jdk-11-slim'
                args '-v /root/.m2:/root/.m2'
            }
        }
    stages{
            stage ("----------------Cleaning up workspace"){
                    steps{
                        sh "rm -rf /var/jenkins_home/workspaces/ObjectServer"
                    }
            }
            stage ("--------------- Download source code"){
                    steps{
                        echo "Downloading code"
                    }            
            }
            stage("Build"){
                steps{
                    echo "----------------Creating .war file"
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
                deploy adapters: [tomcat8(credentialsId: 'a1a2db18-46a5-41f0-a437-6a113be91ac6',
                path: '', url: 'http://localhost:8081/')],
                contextPath: '/simple-java-jsp', war: '**/ObjectServer2-1.0.0.war'
                }
                    post{
                        always{
                            echo "====++++Comprobabando Deploy++++===="
                        }
                        success{
                            echo "====++++Deploy executed succesfully++++===="
                        }
                        failure{
                            echo "====+++Deploy Error+++==="
                        }        
                    }
            }

    }
}
