<%--
  Created by IntelliJ IDEA.
  User: katemrrr
  Date: 27.10.16
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="css/style_login.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div class="all">
        <div class="wrapper">
            <p>Авторизация</p>
            <hr>
            <%
            Cookie[] cookies = request.getCookies();
            for(int i = 0; i < cookies.length; i++){
                if(cookies[i].getName().equals("isInvalid")){
                    cookies[i].setMaxAge(0);
                    %>
                    <p class="error_message">Неверные данные</p>
                    <%
                }
            }
            %>
            <form class="worksheet" method="post" action="/auth">
                <div class="data" id="email">
                    <span class="label">введите e-mail</span>
                    <p class="description">E-mail</p>
                    <input class="input" type="text" name="email" placeholder="Введите e-mail" required>
                </div>
                <div class="data" id="password">
                    <span class="label">введите пароль</span>
                    <p class="description">Пароль</p>
                    <input class="input" type="password" name="password" placeholder="Введите пароль" required>
                </div>
                <input class="checkbox" type="checkbox"><a>запомнить меня</a><br>
                <input class="signin" type="submit" value="Войти">
            </form>
            <a id="registration" href="/registration">Ещё не зарегистрированы?</a><br>
            <script src="js/login.js"></script>
        </div>
        <script src="js/trans.js"></script>
    </div>
</body>
</html>
