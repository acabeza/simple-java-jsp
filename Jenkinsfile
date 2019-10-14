pipeline{
    agent any
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
                sh 'jar -cvf ObjectServer.war *'
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
        // stage("Test"){
        //     steps{
        //         sh 'mvn test'
        //     }
        //      post{
        //         always{
        //             echo "====++++Comprobando Test++++===="
        //         }
        //         success{
        //             echo "====++++Test executed succesfully++++===="
        //         }
        //         failure{
        //             echo "====++++Test execution failed++++===="
        //         }
        
        //     }
        // }
        stage("Deploy"){
            steps{
               deploy adapters: [tomcat8(credentialsId: 'd9981447-eee8-444c-9a93-410d6f6f64c1',
               path: '', url: 'http://bd8278e8.ngrok.io')],
               contextPath: '/simple-java-jsp', war: 'ObjectServer.war'
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
        // }
        // stage('Deliver') { 
        //     steps {
        //         sh './jenkins/scripts/deliver.sh' 
        //     }
        // }
    }
    // post{
    //     always{
    //         echo "========always========"
    //     }
    //     success{
    //         echo "========pipeline executed successfully ========"
    //     }
    //     failure{
    //         echo "========pipeline execution failed========"
    //     }
    // }
}
}