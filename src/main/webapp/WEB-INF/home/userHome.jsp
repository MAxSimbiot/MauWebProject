<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="resources"/>
<html>
<head>
   <style>
      table, th, td {

      }

      #bigTable{
         background-color: silver;
         border-collapse: separate;
         border-spacing: 10px;
      }
      #subTable{
         border: 2px black;
         border-collapse: collapse;
      }

      img {
         height: 180px;
         width: 180px;
      }

      #demoObject {
         -webkit-box-shadow: -10px 0px 13px -7px #000000, 10px 0px 13px -7px #000000, -31px -39px 2px -25px rgba(0, 0, 0, 0);
         box-shadow: -10px 0px 13px -7px #000000, 10px 0px 13px -7px #000000, -31px -39px 2px -25px rgba(0, 0, 0, 0);
         height: 470px;
         width: 200px;
         background-color: aliceblue;
      }

   </style>
   <title>Title</title>
</head>
<body>
<h2>Hello, fellow rabotyaga <u>${user.login}</u></h2>
<hr/>
<h3> LVL: ${user.lvl}  Mind fuel: ${user.mind_fuel}</h3>
<h2 style="text-align: center">Inventory</h2>
<table id="bigTable">

   <c:forEach var="item" items="${inventory}">

      <td>
         <div id="demoObject">
            <img src="https://static.wikia.nocookie.net/minecraft_gamepedia/images/b/b0/Item_Frame_JE2_BE2.png"/>
            <table id = subTable>
               <tr  style="height: 70px;text-align: center;min-width: 100%">
                  <td style="text-align: center;min-width: 100%"><h2>${item.name}
                     <hr></h2></td>

               </tr>
               <tr>
                  <td><h5>${item.rarity}<hr></h5></td>

               </tr>
               <tr>
                  <td><h3>"${item.description}"</h3></td>
               </tr>
               <tr>
                  <td><h5>You have: ${item.count}</h5></td>
               </tr>
            </table>
         </div>
      </td>

   </c:forEach>

</table>


<p></p>
<hr/>
<form action="Servlet" method="post">
   <input type="submit" value="LogOut"/>
   <input type="hidden" name="command" value="logOut"/>
</form>
<a href="/MauWebProject_war/">Страница начальная</a>

</body>
</html>