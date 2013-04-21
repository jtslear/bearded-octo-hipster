node 'puppetclient1.home' {
	include openssh-server
	include java
	include myrubyapp
	include jenkins
}
