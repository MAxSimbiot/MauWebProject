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
        ul {
            list-style: none;
            display: grid;
            grid-template-columns:2fr 1fr;
        }
        @media (max-width: 1500px) {
            ul {
                list-style: none;
                display: grid;
                grid-template-columns: 1fr;
            }
        }


        li {
            margin: 36px;
            display: flex; /* [1] */
            flex-direction: column; /* [2] */
        }



        .newsBlock {
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

        .newsBlock h2 {
            font-size: 45px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 5px;
            margin-left: 30px;
        }

        .newsBlock h3 {
            font-size: 25px;
            font-family: 'Bebas Neue';
            border: 0;
            color: mintcream;
            letter-spacing: 3px;
            margin-left: 45px;
        }

        .newsBlock:hover {
            transform: scale(1.025);
            box-shadow: 0px 0px 6px 6px #f0f,
            0px 0px 6px 6px #0ff;
            transition: box-shadow 0.5s, transform 0.5s;
        }

        img {
            margin: 20px;
            min-width: 200px;
            max-width: 100%;
            vertical-align: bottom;
            border-radius: 1vmin;
        }

    </style>

</head>
<body style="min-width: 900px;">
<div style="background-image: radial-gradient(rgba(72, 61, 139, 0.3), rgba(255, 20, 147, 0.8));">
<ul>

    <li>
        <div class="newsBlock">
            <h2>BOW WOW WOW</h2>
            <h3>
            Вот такой красивый парень</h3>
            <img src="https://cdna.artstation.com/p/assets/images/images/010/844/908/large/lukas-patrus-red-guy-000.jpg?1526518882&dl=1" alt="">
        </div>

    </li>
    <li>
        <div class="newsBlock">
            <h2>NAU NEWS</h2>
            <h3>
            Адміністрація Національного авіаційного університету категорично
            заперечує факт наявності, вказаних у статтях в інтернет-виданнях,
            недоліків в гуртожитку 11 Студентського містечка НАУ
            "Інформаційна атака" направлена, скоріш за все, від минулого керівництва
            університету, за результатами діяльності якого порушено більше 8 карних
            справ, і має на меті дискредитацію університету після успішної вступної
            кампанії, за результатами якої НАУ посів 4 місце в Україні за кількостю
            поданих заяв абітурієнтів</h3>
        </div>
    </li>
    <li>
        <div class="newsBlock">
            <h2>G-MIX</h2>
            <h3>
            НАУ - серед лідерів ЗВО України за кількістю зарахованих на бюджет
            вступників-бакалаврів ДП «Інфоресурс» оприлюднило рейтинг закладів
            вищої освіти України за кількістю зарахованих вступників-бакалаврів
            на навчання за державним замовленням. Національний авіаційний університет
            посідає у ньому шосту сходинку</h3>
        </div>
    </li>
    <li>
        <div class="newsBlock">
            <h2>hhmhmhmhmhmh</h2>
            <h3>
                Адміністрація Національного авіаційного університету категорично
                заперечує факт наявності, вказаних у статтях в інтернет-виданнях,
                недоліків в гуртожитку 11 Студентського містечка НАУ
                "Інформаційна атака" направлена, скоріш за все, від минулого керівництва
                університету, за результатами діяльності якого порушено більше 8 карних
                справ, і має на меті дискредитацію університету після успішної вступної
                кампанії, за результатами якої НАУ посів 4 місце в Україні за кількостю
                поданих заяв абітурієнтів</h3>
        </div>
    </li>

    <li>
        <div class="newsBlock">
            <h2>BOW WOW WOW</h2>
            <h3>
                Сьогодні свій День народження відзначає член Комітету Верховної
                Ради України з питань освіти, науки та інновацій Павленко Ростислав
                Миколайович Від імені ректора та всього колективу Національного
                авіаційного університету вітаємо Вас з Днем народження</h3>
        </div>

    </li>
    <li>

    </li>
</ul>
</div>


</body>
</html>
