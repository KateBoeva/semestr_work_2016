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
        <p class="registration">Registration</p>
        <hr>
        <form method="post" action="/addUser">
                <table class="form" id="name">
                    <tr class="data">
                        <td class="label">Name</td>
                        <td><input class="input" name="name" type="text" required autofocus></td>
                    </tr>
                    <tr class="data" id="email">
                        <td class="label">E-mail</td>
                        <td><input class="input" name="email" type="email" required></td>
                    </tr>

                    <tr class="data" id="password">
                        <td class="label">Password</td>
                        <td><input class="input" name="password" type="password" required></td>
                    </tr>

                    <tr class="data" id="password_2">
                        <td class="label">Repeat password</td>
                        <td><input class="input" name="password_2" type="password" required></td>
                    </tr>
                </table>

            <%--<table class="form">--%>
                <%--<div class="data" id="name">--%>
                    <%--<span class="label">введите имя</span>--%>
                    <%--<input class="input" type="text" name="name" placeholder="Введите имя" required>--%>
                <%--</div>--%>
                <%--<div class="data" id="email">--%>
                    <%--<span class="label">введите e-mail</span>--%>
                    <%--<input class="input" type="text" name="email" placeholder="Введите e-mail" required>--%>
                <%--</div>--%>
                <%--<div class="data" id="password">--%>
                    <%--<span class="label">введите пароль</span>--%>
                    <%--<input class="input" type="password" name="password" placeholder="Введите пароль" required>--%>
                <%--</div>--%>
                <%--<div class="data" id="password_2">--%>
                    <%--<span class="label">введите пароль ещё раз</span>--%>
                    <%--<input class="input" type="password" name="password_2" placeholder="Введите пароль ещё раз" required>--%>
                <%--</div>--%>

                <%
                Cookie[] cookies = request.getCookies();
                for(int i = 0; i < cookies.length; i++){
                    if(cookies[i].getName().equals("isError")){
                        if(cookies[i].getValue().equals("1")){
                            %>
                            <p class="error_message">Passwords don't match</p>
                            <%
                        } else if(cookies[i].getValue().equals("2")){
                            %>
                            <p class="error_message">E-mail already taken</p>
                            <%
                        }
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                    }
                }
                %>
            <input class="reg_up" id="registration" type="submit" value="Sign up">
        </form>
    </div>
</div>

<div class="footer">
    <table class="footer_social">
        <tr>
            <td class="contacts"><strong>Our general office:</strong><br>
                Saint Petersburg, Shotman street, h. 20</td>
            <td class="contacts"><strong>Phone for information:</strong><br>
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
