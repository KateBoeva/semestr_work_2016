<%--
  Created by IntelliJ IDEA.
  User: katemrrr
  Date: 27.10.16
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WomanStore - стильная бижутерия из Испании</title>
    <link href="../css/style_registration.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header>
    <div class="wrapper">
        <img class="head" src="../img/head.png">
    </div>
</header>

<div class="content">
    <div id="select" class="content_select">
        <p class="registration">Регистрация</p>
        <hr>
        <form method="post" action="/addUser">
            <%--<table class="form">--%>
                <div class="data" id="name">
                    <span class="label">введите имя</span>
                    <input class="input" type="text" name="name" placeholder="Введите имя" required>
                </div>
                <div class="data" id="email">
                    <span class="label">введите e-mail</span>
                    <input class="input" type="text" name="email" placeholder="Введите e-mail" required>
                </div>
                <div class="data" id="password">
                    <span class="label">введите пароль</span>
                    <input class="input" type="password" name="password" placeholder="Введите пароль" required>
                </div>
                <div class="data" id="password_2">
                    <span class="label">введите пароль ещё раз</span>
                    <input class="input" type="password" name="password_2" placeholder="Введите пароль ещё раз" required>
                </div>

                <%
                Cookie[] cookies = request.getCookies();
                for(int i = 0; i < cookies.length; i++){
                    if(cookies[i].getName().equals("isPasswordInvalid") && cookies[i].getValue().equals("true")){
                        cookies[i].setMaxAge(0);
                        %>
                        <p class="error_message">Пароли не совпадают</p>
                        <%
                    }
                }
                %>
            <input class="reg_up" id="registration" type="submit" value="Зарегистрироваться">
        </form>
    </div>
</div>

<div class="footer">
    <table class="footer_social">
        <tr>
            <td class="contacts"><strong>Наш главный офис находится:</strong><br>
                г. Москва, ул. Гоголя, д. 7</td>
            <td class="contacts"><strong>Телефон для справок:</strong><br>
                +7-(495)-543-25-25</td>
        </tr>
    </table>
    <table class="footer_social_buttons">
        <tr>
            <td class="button"><img src="../img/vk.png"></td>
            <td class="button"><img src="../img/fb.png"></td>
            <td class="button"><img src="../img/tw.png"></td>
        </tr>
    </table>
    <script src="../js/trans.js"></script>
</div>


</body>
</html>
