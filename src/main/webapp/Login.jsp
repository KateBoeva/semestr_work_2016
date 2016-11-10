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
            <p>Authorization</p>
            <hr>
            <%
            Cookie[] cookies = request.getCookies();
            for(int i = 0; i < cookies.length; i++){
                if(cookies[i].getName().equals("isInvalid") && cookies[i].getValue().equals("true")){
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]);
                    %>
                    <a class="error_message">Incorrect e-mail/password!</a>
                    <%
                } else if(cookies[i].getName().equals("isRemember") && cookies[i].getValue().equals("true")){
                    response.sendRedirect("/products");
                }
            }
            %>
            <form class="worksheet" method="post" action="/auth">
                <div class="data" id="email">
                    <span class="label">enter e-mail</span>
                    <p class="description">E-mail</p>
                    <input class="input" type="text" name="email" placeholder="Enter e-mail" required>
                </div>
                <div class="data" id="password">
                    <span class="label">enter password</span>
                    <p class="description">Password</p>
                    <input class="input" type="password" name="password" placeholder="Enter password" required>
                </div>
                <input class="checkbox" id="isRemember" type="checkbox"><a>remember me</a><br>
                <input class="signin" type="submit" value="Sign in">
            </form>
            <a id="registration" href="/registration">Are not registered?</a><br>
            <script src="js/login.js"></script>
        </div>
        <script src="js/trans.js"></script>
    </div>
</body>
</html>
