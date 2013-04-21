node 'puppetclient1.home' {
	include openssh-server
	include java
	include myrubyapp
	include jenkins
	jenkins::plugin {'swarm':}
	jenkins::plugin {'git':}
}

node /jenkinsslave.*/ {
	class  { 'jenkins::slave':
		ensure => 'enabled',
		masterurl => 'http://puppetmaster.home:8080',
		ui_user => 'adminuser',
		ui_pass => 'adminpass',
	}
}
