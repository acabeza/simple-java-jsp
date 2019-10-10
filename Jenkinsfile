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
               bat("xcopy ObjectSever.war C:\\Users\\acabezam\\composetest\\compose-jenkins-tomcat\\tomcat\\webapps /O /X /E /H /K")
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