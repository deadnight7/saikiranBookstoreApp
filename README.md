# Saikiran Bookstores App
##### An Online Retail Management and Custommer Order Processing System

![BrowserStack Status](https://www.browserstack.com/automate/badge.svg?badge_key=bUJrcGM5VGd4ajRzdHc4a1BFRjRuSTh3QTJEOEpxVWRITHpQTnBkVXpMST0tLXN1eHlWcnhrZzVCSjRmeFpEY29uZ0E9PQ==--493168ce6719b5f9368b52b9ec6292aab2cf4024)

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
	

### Update 2019 - Installing via Docker
You can now install via docker
1) Install docker / docker-ce on base system (Docker Install Guide - https://docs.docker.com/v17.12/install/)
2) Clone Project Repo
```
$ git clone https://github.com/deadnight7/saikiranBookstoreApp.git
```
3) Navigate to docker dir and execute docker-compose
```
$ cd saikiranBookstoreApp/docker
$ docker-compose up -d
```

Docker compose will perform these steps
- Hosted project on tomcat locally on port :80 (http://localhost/saikiranBookstoreApp)
- PhpMyadmin will be exposed on port 7577 (User: root, Password: password)
- MySQL will be exposed on port 3307 (User: root, Password: password)
*Make sure all respective ports are open and not used by any other applications


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

## Project Diagrams
Follow the documentation here
http://www.4shared.com/office/AEf2a-PW/Binder2.html

By Chirag Pandit - 
You can reach me out on 
* Facebook - https://www.facebook.com/chirag.pandit07
* LinkedIn - https://www.linkedin.com/in/chirag-pandit-15193638/

### Testing Partners

![Testing partners Browserstack](/web/images/logo/Browserstack-logo1.png)

### Licence
Project is [MIT licensed](./LICENSE).
