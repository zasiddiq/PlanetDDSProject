## CS 122B Project 2 Form example

This example shows how HTML `<form>` works to send user input to backend.

### Before running the example
#### If you do not have USER `mytestuser` setup in MySQL, follow the below steps to create it:

 - login to mysql as a root user 
    ```
    local> mysql -u root -p
    ```

 - create a test user and grant privileges:
    ```
    mysql> CREATE USER 'mytestuser'@'localhost' IDENTIFIED BY 'mypassword';
    mysql> GRANT ALL PRIVILEGES ON * . * TO 'mytestuser'@'localhost';
    mysql> quit;
    ```

#### prepare the database `moviedbexample`
 
```    
    local> mysql -u mytestuser -p
    mysql> CREATE DATABASE IF NOT EXISTS moviedbexample;
    mysql> USE moviedbexample;
    mysql> CREATE TABLE IF NOT EXISTS stars(
                   id varchar(10) primary key,
                   name varchar(100) not null,
                   birthYear integer
               );
    
    mysql> INSERT IGNORE INTO stars VALUES('755011', 'Arnold Schwarzeneggar', 1947);
    mysql> INSERT IGNORE INTO stars VALUES('755017', 'Eddie Murphy', 1961);
```    

### To run this example: 
1. Clone this repository using `git clone https://github.com/UCI-Chenli-teaching/cs122b-spring20-project2-form-example.git`
2. Open IntelliJ IDEA -> Open -> (Find the location of the repository) -> Choose "cs122b-spring20-project2-form-example" directory -> Click "OK" -> wait until Sync is complete.
3. In `WebContent/META-INF/context.xml`, make sure the mysql username is `mytestuser` and password is `mypassword`.
4. Also make sure you have the `moviedbexample` database.
5. In Tomcat Deployment Configuration, make sure the application context is: /cs122b-spring20-project2-form-example
6. To run the example, follow the instructions in [canvas](https://canvas.eee.uci.edu/courses/26486/pages/intellij-idea-tomcat-configuration)


### Brief Explanation
`FormServlet.java` is a Java servlet that retrieves the data from HTML `<form>` and then talks to the database and generates the result HTML `<table>`

### DataSource
For project 2, you are recommended to use tomcat to manage your DataSource instead of manually define MySQL connection in each of the servlet.

`WebContent/META-INF/context.xml` contains a DataSource, with database information stored in it.
`WEB-INF/web.xml` registers the DataSource to name jdbc/moviedbexample, which could be referred to anywhere in the project.

In both `FormServlet.java`, a private DataSource reference dataSource is created with `@Resource` annotation. It is a reference to the DataSource `jdbc/moviedbexample` we registered in `web.xml`

To use DataSource, you can create a new connection to it by `dataSource.getConnection()`, and you can use the connection as previous examples.
