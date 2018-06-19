# Saikiran Bookstores App
##### An Online Retail Management and Custommer Order Processing System
##### -By Chirag Pandit https://www.facebook.com/chirag.pandit07

[![BrowserStack Status](https://www.browserstack.com/automate/badge.svg?badge_key=MzZoN09JWVk2Y2Y4OHFDT1FYaFdKeFdCMXRTcjdKdWhwaXB3Q3hMOUxVYz0tLVBMcmVIWFpoTHZkMWRERllhMGpvaHc9PQ==--4d3885b8ec10d38737480d9c3677c32c54968d22)](https://www.browserstack.com/automate/public-build/MzZoN09JWVk2Y2Y4OHFDT1FYaFdKeFdCMXRTcjdKdWhwaXB3Q3hMOUxVYz0tLVBMcmVIWFpoTHZkMWRERllhMGpvaHc9PQ==--4d3885b8ec10d38737480d9c3677c32c54968d22)

Follow the documentation and the blackbook here
http://www.4shared.com/office/AEf2a-PW/Binder2.html
###### Skip over to Pg. 62 for the visual usage.

### Video Guides  

* Installation - https://www.youtube.com/watch?v=FnuKUfAiHUM&t=229s
* Project Demo - https://www.youtube.com/watch?v=XeTGQXrDYjE&t=7s

### Features 
* A full fledged online retail website system using java technologies
* Frontend supported with HTML5 and CSS3 
* Images used as resources only when they are in a real need _For Eg. A product informational purpose_
* Ajax powered site _using jQuery as base for javascript_ search for both Administrator as well as Clients
* Product image gallery for both the usecases admin/client
* Quick dashboard views,
* Dashboard consists of the monthly sales and reporting charts powered by google charts
	* Some of the charts include 
	* Top most view products
	* Top sold products
	* The monthly sales revenue and purchases being made by the store
	

### Guide to installing saikiranBookStoreApp into your machine
Prerequisites - Must be having on the client computer before installation

* A copy of JDK/JRE + Netbeans 7.x +
	http://netbeans.org/downloads/
	
* A built in or external container like Apache Tomcat 7.x +
	http://tomcat.apache.org
	
* MySQL Database with the same name as the project, (Use an Xampp)
* Given the MySQL File (.sql) Under jLibs directory of project root, Import the file into your database and you have your tables ready
* Configuring Apache Server along with MySQL will be probably s system like mine for using phpMyAdmin
* _Install XAMPP/WAMPP as per the the above two steps if dont need to install manually_
	http://www.apachefriends.org/en/xampp.html
* Try to change the username and passwords as per your database users for both of the file DB_Comm in packages database and cart respectively 
	
* Clean the project, Build the project and deploy it into the container
* Resolve the referencing problems if any by adding the project Server _Apache Tomcat_ and/or the jLibs directory under the project root
* Run your project copy
* Custommize the products and users as per your requirement
* Done

### Testing Partners
![Testing partners Browserstack](/web/images/logo/Browserstack-logo.svg)

### Licence
Project is [MIT licensed](./LICENSE).
