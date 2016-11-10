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
    <title>WomanStore - stylish jewelry from Spain</title>
    <link href="../../css/style_pr_id.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header>
    <div class="wrapper">
        <img class="head" src="../../img/head.png">
    </div>

    <div class="menu">
        <table class="menu_table">
            <tr>
                <%
                    Cookie[] cookies = request.getCookies();
                    boolean isAuth = false;
                    for(int i = 0; i < cookies.length; i++){
                        if(cookies[i].getName().equals("name")){
                            isAuth = true;
                            %>
                            <td><p class="name">Hello, <%=cookies[i].getValue()%></p></td>
                            <td>|</td>
                            <td><a href="/logout">Sign out</a></td>
                            <td>|</td>
                            <td><a href="/products">Your bucket</a></td>
                            <td>|</td>
                            <td><a href="/add_products">Add product</a></td>
                            <%
                        }
                    }
                    <%--if(!isAuth) {--%>
                        <%--response.sendRedirect("/login");--%>
                    <%--}%>--%>
            </tr>
        </table>
    </div>
</header>

<div class="content">

    <div id="select" class="content_select">
        <p>About product</p>
        <hr>

        <div class="goods_all">
            <div class="goods_info">
                <img class="goods_img" src="../../img/example.png">
            </div>

            <div class="goods_info" id="description">

                <table>
                    <tr><h1>Name of product</h1><br></tr>
                    <tr>
                        <td>Price:</td>
                        <td class="info">3000</td>
                    </tr>
                    <tr>
                        <td>Added:</td>
                        <td class="info">23.06.2016</td>
                    </tr>
                </table>
                <input class="btn" type="submit" name="add" value=" + Add to bucket"><br>
                <button class="btn btn_back">Back</button>
            </div>
        </div>

        <div class="comment">
            <div class="text_area">
                <textarea></textarea>
            </div>

            <div class="comments">
                <p>Comment</p>
                <hr>
            </div>

        </div>

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
            <td class="button"><img src="../../img/vk.png"></td>
            <td class="button"><img src="../../img/fb.png"></td>
            <td class="button"><img src="../../img/tw.png"></td>
        </tr>
    </table>
    <script src="../../js/trans.js"></script>
</div>
</body>
</html>