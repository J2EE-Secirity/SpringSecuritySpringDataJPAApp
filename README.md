
# Гарячие клавиши:

* `CTRL+ALT+F` - автоматическая подстановка типа переменной!
* `ALT+F7` - поиск всех мест где используется класс, метод...
* `CTRL+ALT+F7` - поиск и переход в место где используется класс, метод...


# Spring Security 4 for Spring MVC using Spring Data JPA and Spring Boot

* `Step by Step Guide` http://www.programming-free.com/2016/01/spring-com.security-spring-data-jpa.html
* `Video Tutorial` https://youtu.be/XO-OdIXNU_o
* **(** [Spring Boot Hello World Example – JSP](https://www.mkyong.com/spring-boot/spring-boot-hello-world-example-jsp)  **)**
* **(** [Encoding of properties files](https://www.jetbrains.com/help/idea/properties-files.html) **)**  `Ctrl+Alt+S` >> `Editor` and `File Encodings` >> *Transparent native-to-ascii conversion* and *Default encoding for properties files - select the encoding that will be used*...

**Этот пример демонстрирует загрузку данных пользователя для Spring-Security из базы данных**
Здесь важны 3-основных момента:
1. **(** как обычно, реализуем `Entity` и `Repository` чтобы доставать данные пользователя из базы + создаем 2-таблички где будут хранится данные пользователя и его роли... **)**
2. создаем свою реализацию для сущности `UserDetails` - чтобы получать данные пользователя из своей базы...
3. создаем свою реализацию для сервиса `UserDetailsService` (а именно, метод `loadUserByUsername`) - чтобы потом передать эти данные в Spring-Security...
4. **(** предварительно настраиваем дрступ к ресурсам в Spring-Security `WebMvcConfigurerAdapter`, а именно метод `addViewControllers()`... **)**
5. и передаем данные пользователя в менеджер Spring-Security (`WebSecurityConfigurerAdapter`), а именно в методе `configAuthentication()`...
6 **(** ...в этом примере нет REST-контроллеров, здесь используются статические веб-ресурсы... **)**

![user_roles](user_roles.png)

```properties
##### PostgreSQL
################### DataSource Configuration ##########################
spring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.url=jdbc:postgresql://localhost:5432/userbase
spring.datasource.username=postgres
spring.datasource.password=postgres
spring.jpa.database-platform=org.hibernate.dialect.PostgreSQLDialect
spring.jpa.show-sql=true

##### Hibernate
spring.jpa.hibernate.ddl-auto=update
```

```sql
INSERT INTO users (id, username, email, password, enabled) VALUES
  (0, 'priya', 'abc@abc.com', '$2a$04$CO93CT2ObgMiSnMAWwoBkeFObJlMYi/wzzOnPlsTP44r7qVq0Jln2', 1),
  (1, 'naveen', 'def@def.com', '$2a$04$j3JpPUp6CTAe.kMWmdRNC.Wie58xDNPfcYz0DBJxWkucJ6ekJuiJm', 1);

INSERT INTO user_roles (user_role_id, user_id, role) VALUES
  (0, 0, 'ROLE_USER'),
  (1, 1, 'ROLE_ADMIN'),
  (2, 1, 'ROLE_USER');
```

```bash
mvn spring-boot:run
```
или
```bash
mvn clean package
java -jar target/SpringSecuritySpringDataJpaApp-0.0.1-SNAPSHOT.war
```

[http://localhost:8081](http://localhost:8081) >> `priya`:`priya` или `naveen`:`naveen`


![uvwUxE](uvwUxE.png)

###Закрытый доступ для пользователя с правами `ROLE_USER`:

(`priya`:`priya`)

![8i5vBO](8i5vBO.png)

![ruTW6O](ruTW6O.png)

###Открытый доступ для пользователя с правами `ROLE_ADMIN`:

(`naveen`:`naveen`)

![FmxEwN](FmxEwN.png)

