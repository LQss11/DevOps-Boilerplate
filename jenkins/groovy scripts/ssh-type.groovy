#!groovy

// imports
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.Domain
import com.cloudbees.plugins.credentials.impl.*
import hudson.util.Secret
import java.nio.file.Files
import jenkins.model.Jenkins
import net.sf.json.JSONObject
import org.jenkinsci.plugins.plaincredentials.impl.*

String keyfile = "/root/.ssh/id_rsa"
// parameters
def jenkinsMasterKeyParameters = [
  description:  'Jenkins Master SSH Key',
  id:           'jenkins-master-key',
  secret:       '',
  userName:     'affessalem@hotmail.fr',
  // using file
  key: new BasicSSHUserPrivateKey.FileOnMasterPrivateKeySource(keyfile)
  // using the whole private ssh key
//   key:          new BasicSSHUserPrivateKey.DirectEntryPrivateKeySource('''-----BEGIN OPENSSH PRIVATE KEY-----
// b3BlbnN
// -----END OPENSSH PRIVATE KEY-----''')
]

// get Jenkins instance
Jenkins jenkins = Jenkins.getInstance()

// get credentials domain
def domain = Domain.global()

// get credentials store
def store = jenkins.getExtensionList('com.cloudbees.plugins.credentials.SystemCredentialsProvider')[0].getStore()

// define private key
def privateKey = new BasicSSHUserPrivateKey(
  CredentialsScope.GLOBAL,
  jenkinsMasterKeyParameters.id,
  jenkinsMasterKeyParameters.userName,
  jenkinsMasterKeyParameters.key,
  jenkinsMasterKeyParameters.secret,
  jenkinsMasterKeyParameters.description
)

// add credential to store
store.addCredentials(domain, privateKey)
// remove ssh key from container
boolean fileSuccessfullyDeleted =  new File(keyfile).delete()  

// save to disk
jenkins.save()