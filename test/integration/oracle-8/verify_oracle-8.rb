# the right version of java is installed
describe command('java -version') do
  its('stderr') { should match /1\.8/ }
end

# env is properly setup
describe os_env('JAVA_HOME') do
  its('content') { should include 'java-1.8.0' }
end

# alternatives were properly set
describe command('alternatives --display jar') do
  its('stdout') { should include 'java-1.8.0' }
end

# jce is setup properly
describe command('java -jar /tmp/UnlimitedSupportJCETest.jar') do
  its('stdout') { should include 'isUnlimitedSupported=TRUE, strength: 2147483647' }
end

# the cert was installed into the keystore
describe command('$JAVA_HOME/bin/keytool -list -storepass changeit -keystore $JAVA_HOME/jre/lib/security/cacerts -alias java_certificate_test') do
  its('stdout') { should include '9D:9E:EA:E6:5F:D2:C8:34:93:6E:5C:65:EE:00:46:A9:CD:E4:F1:83' }
end
