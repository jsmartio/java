name              'java'
maintainer        'Agile Orbit'
maintainer_email  'info@agileorbit.com'
license           'Apache-2.0'
description       'Installs Java runtime.'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '2.0.0'

recipe 'java::default', 'Installs Java runtime'
recipe 'java::default_java_symlink', 'Updates /usr/lib/jvm/default-java'
recipe 'java::ibm', 'Installs the JDK for IBM'
recipe 'java::ibm_tar', 'Installs the JDK for IBM from a tarball'
recipe 'java::openjdk', 'Installs the OpenJDK flavor of Java'
recipe 'java::oracle', 'Installs the Oracle flavor of Java'
recipe 'java::oracle_i386', 'Installs the 32-bit jvm without setting it as the default'
recipe 'java::oracle_rpm', 'Installs the Oracle RPM flavor of Java'
recipe 'java::set_attributes_from_version', 'Sets various attributes that depend on jdk_version'
recipe 'java::set_java_home', 'Sets the JAVA_HOME environment variable'
recipe 'java::windows', 'Installs the JDK on Windows'
recipe 'java::homebrew', 'Installs the JDK on Mac OS X via Homebrew'
recipe 'java::oracle_jce', 'Installs the Java Crypto Extension for strong encryption'

%w(
  debian
  ubuntu
  centos
  redhat
  scientific
  fedora
  amazon
  arch
  oracle
  freebsd
  windows
  suse
  opensuse
  opensuseleap
  xenserver
  smartos
  mac_os_x
  zlinux
).each do |os|
  supports os
end

depends 'windows'
depends 'homebrew'

source_url 'https://github.com/agileorbit-cookbooks/java'
issues_url 'https://github.com/agileorbit-cookbooks/java/issues'
chef_version '>= 12.9' if respond_to?(:chef_version)
