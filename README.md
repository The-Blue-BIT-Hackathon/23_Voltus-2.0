# 23_Voltus-2.0

A project to tackle unemployment. Built under 24 hours in The-Blue-BIT Hackathon '23. By Team Voltus 2.0.


Workconnect is a Web based application or online platform that aims to address the issue of unemployment by providing resources and tools for job seekers to find employment opportunities, as well as connecting them with potential employers. It also provides additional resources such as resume building, and personalized job alerts. The goal of the project is to make it easier for job seekers to find employment and to help address the issue of unemployment in the community.

## 🟡PowerPoint Link
[Canva](https://www.canva.com/design/DAFbjHdF9bA/xNVc6JQqqGxKA_nvmlRBYw/view?utm_content=DAFbjHdF9bA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)


## 🟡Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### ➡️Prerequisites
You will need to have Eclipse IDE, Oracle 10g Express Edition, Apache Tomcat v8.5 and Git Bash installed on your machine.
You can download them from the official website:

[Eclipse IDE](https://www.eclipse.org/downloads/) <br><br>
[Oracle 10g Express Edition](https://www.oracle.com/in/database/technologies/oracle-database-software-downloads.html) <br><br>
[Apache Tomcat v8.5](https://tomcat.apache.org/download-80.cgi)<br><br>
[Git Bash](https://gitforwindows.org/)

### ➡️Installing

1. Clone the repository to your local machine <br><br>
  `git clone https://github.com/The-Blue-BIT-Hackathon/23_Voltus-2.0.git` <br>
2. Open Eclipse IDE and Import the cloned Git Project <br><br>
 	`File > Import > Git > Git Project > Existing local repository > Add > Browse Project Directory > Click Finish` <br>
3. ADD JRE Library for imported project <br><br>
	`Right click on project name > Properties > Java Build Path > Libraries > Add Library > JRE System library > Workspace default JRE (jre1.8.0_271)`<br>
4. ADD External JARs into your imported project <br><br>
	`Right click on project name > Properties > Java Build Path > Libraries > Add External JARs > Attach Ojdbc14.jar file from the oracleexe folder at C Drive > Click Apply & Close` <br>
5. Change Database username & password in DBConnection.java file at "23_Voltus-2.0\src\main\java\com\job\DAO\DBConnection.java" <br><br>
	`jdbc:oracle:thin:@localhost:1521:xe", "your_username", "your_password`
6. Add Apache Tomcat Server to your project <br><br>
