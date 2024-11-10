# Viridi - Green Technology Marketplace 🌱

A Java web-based marketplace application dedicated to connecting users with sustainable and eco-friendly technology products. The platform enables users to browse, purchase, and review green technology products while providing administrators with comprehensive management capabilities.

## Features ✨

### User Features
- User Registration and Login
- Profile Management
- Country-based User Categorization
- Secure Password Management
- Email Verification System
- User Data Management

### Admin Features
- User Management Dashboard
- User Data Analytics
- Email Management
- Access Control
- User Activity Monitoring

## Technical Requirements 🛠️

- JDK 11
- Apache Maven 3.8 or higher
- Apache Tomcat 9.x
- MySQL 8.0
- Eclipse IDE or IntelliJ IDEA
- Git

## Project Structure 📁

```
viridi/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── techno4/
│   │   │           └── viridi/
│   │   │               ├── dao/
│   │   │               │   └── UserDAO.java
│   │   │               ├── model/
│   │   │               │   └── User.java
│   │   │               ├── servlet/
│   │   │               │   ├── LoginServlet.java
│   │   │               │   ├── RegisterServlet.java
│   │   │               │   └── UserServlet.java
│   │   │               └── util/
│   │   │                   └── DatabaseUtil.java
│   │   ├── resources/
│   │   └── webapp/
│   │       └── WEB-INF/
│   │           ├── web.xml
│   │           └── views/
│   │               ├── login.jsp
│   │               ├── register.jsp
│   │               └── user-list.jsp
│   └── test/
│       └── java/
└── pom.xml
```

## Dependencies 📚

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/maven-v4_0_0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.techno4</groupId>
    <artifactId>Viridi</artifactId>
    <packaging>war</packaging>
    <version>0.0.1-SNAPSHOT</version>
    <name>Viridi Maven Webapp</name>
    <url>http://maven.apache.org</url>

    <properties>
        <maven.compiler.source>11</maven.compiler.source>
        <maven.compiler.target>11</maven.compiler.target>
    </properties>

    <dependencies>
        <!-- JUnit for Testing -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>3.8.1</version>
            <scope>test</scope>
        </dependency>

        <!-- Servlet API -->
        <dependency>
            <groupId>javax.servlet</groupId>
            <artifactId>servlet-api</artifactId>
            <version>2.5</version>
            <scope>provided</scope>
        </dependency>

        <!-- MySQL Connector -->
        <dependency>
            <groupId>com.mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <version>8.4.0</version>
        </dependency>
    </dependencies>

    <build>
        <finalName>Viridi</finalName>
    </build>
</project>
```

## Database Configuration 🗄️

### MySQL Setup

1. Create the database:
```sql
CREATE DATABASE userappdb;
USE userappdb;
```

2. Create users table:
```sql
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    uname VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL,
    passwd VARCHAR(20) NOT NULL
);
```

## Installation and Setup 🚀

### Prerequisites
1. Install JDK 11
2. Install Maven
3. Install MySQL 8.0
4. Install Apache Tomcat 9.x
5. Install your preferred IDE (Eclipse/IntelliJ)

### Steps
1. Clone the repository:
```bash
git clone https://github.com/NRanjan-17/Viridi-Web.git
```

2. Configure database connection in `src/main/java/com/techno4/viridi/util/DatabaseUtil.java`:
```java
public class DatabaseUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/userappdb";
    private static final String USER = "your_username";
    private static final String PASSWORD = "your_password";
    // ... rest of the configuration
}
```

3. Build the project:
```bash
mvn clean install
```

## Running the Project ▶️

### Development
1. Deploy the WAR file to Tomcat webapps directory
2. Start Tomcat server
3. Access the application at `http://localhost:8080/Viridi`

### Production Deployment
1. Build for production:
```bash
mvn clean package
```
2. Deploy the generated WAR file from `target/Viridi.war` to your production server

## Testing 🧪
Run the tests using:
```bash
mvn test
```

## Contact 📧

Nalinish Ranjan - [@NRanjan-17](https://github.com/NRanjan-17)

Project Link: [https://github.com/NRanjan-17/Viridi-Web](https://github.com/NRanjan-17/Viridi-Web)
