require
	Apache Maven 3.x

build iQQ

	svn co https://iqq.googlecode.com/svn/trunk/italk-parent
	cd italk-parent
	mvn clean install

run iQQ
	cd italk-core
	mvn exec:java -Dexec.mainClass="italk.App"
	