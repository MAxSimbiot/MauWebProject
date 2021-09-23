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

        button, .button::after {
            margin: 10px;
            min-width: 80px;
            min-height: 33px;
            font-size: 17px;
            font-family: 'Bebas Neue';
            background: linear-gradient(45deg, transparent 5%, deeppink 5%);
            border: 0;
            color: #fff;
            letter-spacing: 2px;
            line-height: 8px;
            box-shadow: 6px 0px 0px #00E6F6;
            outline: transparent;
            position: relative;
        }

        button::after {
            --slice-0: inset(50% 50% 50% 50%);
            --slice-1: inset(80% -6px 0 0);
            --slice-2: inset(50% -6px 30% 0);
            --slice-3: inset(10% -6px 85% 0);
            --slice-4: inset(40% -6px 43% 0);
            --slice-5: inset(80% -6px 5% 0);
            content: 'AVAILABLE NOW';
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, transparent 3%, #00E6F6 3%, #00E6F6 5%, deeppink 5%);
            text-shadow: -3px -3px 0px #F8F005, 3px 3px 0px #00E6F6;
            clip-path: var(--slice-0);
        }

        button:hover::after {
            animation: 1s glitch;
            animation-timing-function: steps(2, end);
        }

        @keyframes glitch {
            0% {
                clip-path: var(--slice-1);
                transform: translate(-15px, -5px);
            }
            10% {
                clip-path: var(--slice-3);
                transform: translate(5px, 5px);
            }
            20% {
                clip-path: var(--slice-1);
                transform: translate(-5px, 5px);
            }
            30% {
                clip-path: var(--slice-3);
                transform: translate(0px, 5px);
            }
            40% {
                clip-path: var(--slice-2);
                transform: translate(-5px, 0px);
            }
            50% {
                clip-path: var(--slice-3);
                transform: translate(5px, 0px);
            }
            60% {
                clip-path: var(--slice-4);
                transform: translate(5px, 10px);
            }
            70% {
                clip-path: var(--slice-2);
                transform: translate(-5px, 5px);
            }
            80% {
                clip-path: var(--slice-5);
                transform: translate(15px, -5px);
            }
            90% {
                clip-path: var(--slice-1);
                transform: translate(-5px, 0px);
            }
            100% {
                clip-path: var(--slice-1);
                transform: translate(0);
            }
        }

        img {
            height: 180px;
            width: 180px;
            margin-left: 60px;
            margin: 10px;
        }

        ul {
            list-style: none;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            grid-gap: 16px;

        }

        li {
            display: flex;
            flex-direction: column;
            margin: 30px;
        }

        body {
            background-image: url("BackGround.png");
            background-repeat: repeat;
        }

        .wrapper {
            background-image: radial-gradient(rgba(72, 61, 139, 0.3), rgba(255, 20, 147, 0.8));
        }

        .itemFrame {
            transform: scale(1);
            transition: box-shadow 0.5s, transform 0.5s;
            box-shadow: 0px 0px 4px 4px #0ff,
            0px 0px 4px 4px #f0f;
            background-color: rgba(72, 61, 139, 0.8);

            border-radius: 1vmin;

            flex-grow: 1; /* [3] */
            display: flex; /* [4] */
            flex-direction: column;
        }

        .itemFrame h2 {
            font-size: 45px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 5px;
            margin-left: 30px;
        }

        .itemFrame h3 {
            font-size: 25px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 3px;
            margin-left: 45px;
        }

        .itemFrame h5 {
            font-size: 18px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 2px;
            margin-left: 40px;
        }

        .itemFrame:hover {
            transform: scale(1.025);
            box-shadow: 0px 0px 6px 6px #f0f,
            0px 0px 6px 6px #0ff;
            transition: box-shadow 0.5s, transform 0.5s;
        }

        h2 {
            font-size: 50px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 5px;
            margin-left: 30px;
        }

        h3 {
            font-size: 28px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 3px;
            margin-left: 45px;
            margin-right: 45px;
        }

        .head {
            display: flex;
            justify-content: space-between;
        }

        .topButtons {
            display: flex;
            justify-content: flex-end;
        }

        .info {
            display: flex;
            justify-content: space-between;
        }


    </style>
    <script>
        window.onload = function () {
            var context = new AudioContext();
        }
    </script>
    <title>Inventory</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
</head>
<body>
<div class="head">
    <h2>Hello, thot slayer by name of <u>${user.login}</u></h2>
    <div class="topButtons">
        <form action="Servlet" method="post">
            <button type="submit">Log Out</button>
            <input type="hidden" name="command" value="logOut"/>
        </form>
        <form action="/MauWebProject_war/">
            <button type="submit">Страница начальная</button>
        </form>
        <form action="Servlet" method="post">
            <button type="submit" name="language" value="en"><fmt:message key="en"/></button>
            <button type="submit" name="language" value="ru"><fmt:message key="ru"/></button>
            <input type="hidden" id="command" name="command" value="changeLanguage"/>
        </form>
    </div>
</div>


<hr/>
<div class="wrapper">
    <div class="info">
        <h3>Status: ${user.role.toString()}</h3>
        <h3> LVL: ${user.lvl}</h3>
        <h3> Mind fuel: ${user.mind_fuel} </h3>
        <h3>Location: ${user.location_id}</h3>
    </div>
    <h2 style="text-align: center;"><fmt:message key="inventory"/></h2>


    <ul>
        <c:forEach var="item" items="${inventory}">
            <li>
                <div class="itemFrame">
                    <img src="${item.image_url}"/>
                    <h2>${item.name}</h2>
                    <h5>${item.rarity}</h5>
                    <h3> ${item.description}</h3>
                    <h5>You have: ${item.count}</h5>
                </div>

            </li>
        </c:forEach>
    </ul>
</div>


<p></p>
<hr/>
<form action="Servlet" method="post">
    <button type="submit" value="LogOut">Main page</button>
    <input type="hidden" name="command" value="logOut"/>
</form>
<form action="/MauWebProject_war/">
    <button type="submit">Страница начальная"</button>
</form>
<audio autoplay>
    <source src="inventory_theme.mp3">
</audio>

</body>
</html>
