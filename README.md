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

- JDK 23
- Apache Maven 3.11 or higher
- Jakarta EE 11
- MySQL 9.1
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
│   │   │               │   ├── CategoryDao.java
│   │   │               │   ├── PriceRequestDao.java
│   │   │               │   ├── ProductDao.java
│   │   │               │   └── UserDao.java
│   │   │               ├── entities/
│   │   │               │   ├── Category.java
│   │   │               │   ├── PriceRequest.java
│   │   │               │   ├── Product.java
│   │   │               │   └── User.java
│   │   │               ├── helper/
│   │   │               │   ├── FactoryProvider.java
│   │   │               │   └── Helper.java
│   │   │               ├── servlets/
│   │   │               │   ├── LoginServlet.java
│   │   │               │   ├── LogoutServlet.java
│   │   │               │   ├── PriceRequestServlet.java
│   │   │               │   ├── ProductOperationServlet.java
│   │   │               │   └── RegisterServlet.java
│   │   │               └── util/
│   │   ├── resources/
│   │   │   └── hibernate.cfg.xml
│   │   └── webapp/
│   │       ├── components/
│   │       ├── css/
│   │       ├── fonts/
│   │       ├── img/
│   │       ├── js/
│   │       ├── FarmerRequest.jsp
│   │       ├── OrderConfirmation.jsp
│   │       ├── about.jsp
│   │       ├── admin.jsp
│   │       ├── checkout.jsp
│   │       ├── deleteproduct.jsp
│   │       ├── editProduct.jsp
│   │       ├── farmerProductManagement.jsp
│   │       ├── index.jsp
│   │       ├── login.jsp
│   │       ├── normal.jsp
│   │       └── register.jsp
│   └── test/
│       └── java/
│           └── com/
│               └── techno4/
│                   └── viridi/
│                       └── test/
│                           ├── CategoryDaoTest.java
│                           ├── ProductDaoTest.java
│                           └── UserDaoTest.java
├── pom.xml
└── nb-configuration.xml
```
### Directory Explanation

#### Java Sources (`src/main/java`)
- `dao`: Data Access Objects for database operations
- `entities`: Hibernate entity classes
- `helper`: Utility classes including factory providers
- `servlets`: Jakarta EE servlet controllers
- `util`: Common utility functions

#### Resources (`src/main/resources`)
- `hibernate.cfg.xml`: Hibernate configuration

#### Web Application (`src/main/webapp`)
- `components`: Reusable JSP components
- `css`, `fonts`, `img`, `js`: Static resources
- JSP files: View templates for different pages

#### Tests (`src/test/java`)
- Unit tests for DAOs and business logic

## Dependencies 📚

Key dependencies include:
- Hibernate ORM 6.6.3
- Jakarta EE 11.0.0-M1
- MySQL Connector 9.1.0
- JUnit Jupiter 5.11.4
- Jakarta Servlet 6.1.0
- Mockito 3.6.0

## Database Configuration 🗄️

### MySQL Setup

1. Create the database:
```sql
CREATE DATABASE Viridi;
USE Viridi;
```

2. Configure Hibernate in `src/main/resources/hibernate.cfg.xml`

## Installation and Setup 🚀

### Prerequisites
1. Install JDK 23
2. Install Maven
3. Install MySQL 9.1
4. Configure Jakarta EE compatible server
5. Install your preferred IDE (Eclipse/IntelliJ)

### Steps
1. Clone the repository:
```bash
git clone https://github.com/NRanjan-17/Viridi-Web.git
```

2. Build the project:
```bash
mvn clean install
```

## Testing 🧪
Run tests using:
```bash
mvn test
```

## Contact 📧

Nalinish Ranjan - [@NRanjan-17](https://github.com/NRanjan-17)

Project Link: [https://github.com/NRanjan-17/Viridi-Web](https://github.com/NRanjan-17/Viridi-Web)

Made with 💖 by Team TechnoFour
