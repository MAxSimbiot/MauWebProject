<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="resources"/>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        html {
            height: 100%;
            display: grid;
            grid-template-rows: 1fr auto;
        }

        body {
            display: table;
            min-height: 100%;
            min-width: 900px;
            background: url(https://oir.mobi/uploads/posts/2021-02/thumbs/1612180212_5-p-zadnii-fon-dlya-pk-7.jpg),url("BackGround.png");
            background-repeat: no-repeat, repeat;
            -moz-background-size: 100%;
            -webkit-background-size: 100%;
            -o-background-size: 100%;
            background-size: 100%;
            height: 100%;
        }

        #regLog {
            display: flex;
            justify-content: center;
            margin: 0 20px;
            background-image: radial-gradient(rgba(72, 61, 139, 0.3), rgba(255, 20, 147, 0.8));
        }

        .regForm {
            margin-right: 35px;
            list-style-type: none;
        }

        .frontFormDiv {
            transform: scale(1);
            transition: box-shadow 0.5s, transform 0.5s;
            box-shadow: 0px 0px 4px 4px #0ff,
            0px 0px 4px 4px #f0f;

            margin: 30px;
            background-color: rgba(72, 61, 139, 0.9);
        }

        .frontFormDiv:hover {
            transform: scale(1.1);
            box-shadow: 0px 0px 6px 6px #f0f,
            0px 0px 6px 6px #0ff;
            transition: box-shadow 0.5s, transform 0.5s;
        }

        h3 {
            font-size: 17px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 3px;
        }

        .content {
            display: table-row;
            min-height: 700px;
        }

    </style>
    <script>
        window.onload = function () {
            var context = new AudioContext();
        }
    </script>
</head>
<jsp:include page="WEB-INF/common/header.jsp"/>
<body>
<marquee direction="left">
    <h3><fmt:message key="msg"/></h3>
</marquee>
<div class="content">
    <c:choose>
        <c:when test="${loggedIn}">
            <jsp:include page="WEB-INF/common/news.jsp"/>
        </c:when>
        <c:otherwise>
            <div id=regLog>

                <div class="frontFormDiv">

                    <form action="Servlet" method="post">
                        <ul class="regForm">
                            <li><h3><fmt:message key="enter.login"/></h3></li>
                            <li><input type="text" value="Arthur" name="login"/></li>
                            <li><h3><fmt:message key="enter.password"/></h3></li>
                            <li><input type="password" value="1lol" name="password"/></li>
                            <li>
                                <button type="submit" value="Зайти"><fmt:message key="log.in"/></button>
                            </li>
                            <li><h3 STYLE="color: darkturquoise">${message}</h3></li>
                            <input type="hidden" name="command" value="login"/>
                        </ul>
                    </form>
                </div>


                <c:if test="${!message.equals(\"registration successfull!\")}">
                    <div class="frontFormDiv">
                        <form action="Servlet" method="post">

                            <ul class="regForm">
                                <li><h3><fmt:message key="enter.login"/></h3></li>
                                <li><input type="text" value="" name="login"/></li>
                                <li><h3><fmt:message key="enter.password"/></h3></li>
                                <li><input type="password" value="" name="password"/></li>
                                <li><h3><fmt:message key="enter.zno"/></h3></li>
                                <li><input type="text" value="" name="zno"/></li>
                                <li><h3><fmt:message key="enter.email"/></h3></li>
                                <li><input type="text" value="" name="email"/></li>
                                <button type="submit" value="Регистрация"><fmt:message key="registrate"/></button>
                                <li><h3 STYLE="color: #ff0000">${errorMessage}</h3></li>
                            </ul>
                            <input type="hidden" name="command" value="register"/>
                        </form>
                    </div>
                </c:if>


            </div>

        </c:otherwise>

    </c:choose>
</div>

<audio autoplay>
    <source src="forest.mp3">
</audio>

</form>

</body>
<jsp:include page="WEB-INF/common/footer.jsp"/>
</html>