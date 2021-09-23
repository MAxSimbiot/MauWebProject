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
        header{

            min-width: 100%;
            display: flex;
            justify-content: space-between;
            height: 60px;
            background: radial-gradient(darkslateblue,deeppink);
            margin-left: auto;
            margin-right: auto;
            -webkit-transition: background-color 2s ease-out;
            -moz-transition: background-color 2s ease-out;
            -o-transition: background-color 2s ease-out;
            transition: background-color 2s ease-out;
        }

        a{
            font-size: 38px;
            font-family: 'Bebas Neue';
            border: 0;
            color: #fff;
            letter-spacing: 5px;
        }


        button, button::after {
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
    </style>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">

</head>
<header>
                <c:choose>
                    <c:when test="${loggedIn}">
                        <form action="Servlet" method="post" style="min-width: 250px;">
                            <button type="submit" ><fmt:message key="enter.cabinet"/> <c:out value="${user.login}"/> </button>
                            <input type="hidden" name = "command" value="enterCabinet"/>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <form action="Servlet" method="post" style="min-width: 250px;">
                            <button type="submit"><fmt:message key="but.can.you"/></button>
                        </form>
                    </c:otherwise>
                </c:choose>


                <a style="margin-right: 4%">MAU_WEB_PROJECT</a>


                <form action="Servlet" method="post" style="align-self: end">
                    <button type="submit" name="language" value="en"><fmt:message key="en"/></button>
                    <button type="submit" name="language" value="ru"><fmt:message key="ru"/></button>
                    <input type="hidden" id = "command" name="command" value="changeLanguage"/>
                </form>



</header>

</html>
