<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
 <h2>Please, log in!</h2>
 <form action="Servlet" method="post">
     <h3>Введите логин</h3>
     <input type="text" value="Arthur" name = "login"/>
     <h3>Введите пароль</h3>
     <input type="password" value="1lol" name = "password"/>
     <input type = "submit" value="Зайти"/>
     <input type="hidden" name="command" value="login"/>
 </form>
</body>
</html>
