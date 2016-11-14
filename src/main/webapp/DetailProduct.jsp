<%@ page import="java.sql.*" %>
<%@ page import="ru.kpfu.itis.Katya_Boeva.DataBase.DataBase" %>
<%@ page import="ru.kpfu.itis.Katya_Boeva.Models.User" %><%--
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
    <link href="../../css/product_detail.css" rel="stylesheet">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<header>
    <div class="wrapper">
        <img class="head" src="../img/head.png">
    </div>
    <div class="menu">
        <table class="menu_table">
            <tr>
            <%
            boolean isAuth = false;
            try{
                String token = (String) getServletConfig().getServletContext().getAttribute("token");
                User user = DataBase.getUserData(token);
                Cookie[] cookies = request.getCookies();
                isAuth = false;
                if(token != null)
                    for(int i = 0; i < cookies.length; i++){
                        if(cookies[i].getName().equals("name") && cookies[i].getValue().equals(user.getName())){
                            isAuth = true;
                            %>
                            <td><p class="title">Hello, <%=cookies[i].getValue()%></p></td>
                            <td>|</td>
                            <td><a href="/logout">Sign out</a></td>
                            <td>|</td>
                            <td><a href="/bucket">Your bucket</a></td>
                            <%if(user.isAdmin()){%>
                                <td>|</td>
                                <td><a href="/add_product">Add product</a></td>
                            <%}
                        }
                    }
                    if(!isAuth){%>
                        <td><a href="/login">Sign in</a></td>
                        <td>|</td>
                        <td><a href="/registration">Registration</a></td>
                    <%}
            } catch (Exception e){%>
                <td><a href="/login">Sign in</a></td>
                <td>|</td>
                <td><a href="/registration">Registration</a></td>
            <%}%>
            </tr>
        </table>
    </div>
</header>

<div class="content">
    <div id="select" class="content_select">
        <p>About product</p>
        <hr>
        <%
            try {
                Class.forName("org.postgresql.Driver");
                try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                    Statement statement = c.createStatement();
                    String id_product = request.getPathInfo();
                    ResultSet product = statement.executeQuery("SELECT * FROM products WHERE id = " + id_product.substring(1));
                    product.next();
                    %>
                    <div class="goods_all">
                        <div class="goods_info">
                            <img class="goods_img" src="<%=product.getString("photo_url")%>">
                        </div>

                        <div class="goods_info" id="description">

                            <table>
                                <tr><h1>Name of product: <%=product.getString("title")%></h1><br></tr>
                                <tr>
                                    <td>Description:</td>
                                    <td class="info"><%=product.getString("description")%></td>
                                </tr>
                                <tr>
                                    <td>Price:</td>
                                    <td class="info"><%=product.getString("price")%></td>
                                </tr>
                                <tr>
                                    <td>Added:</td>
                                    <td class="info"><%=product.getString("date_create")%></td>
                                </tr>
                            </table>
                            <%if(isAuth){%>
                                <input class="btn" type="submit" title="add" value=" + Add to bucket"><br>
                            <%}%>
                        </div>
                    </div>
                    <%
                    product.close();
                    c.close();
                    statement.close();
                } catch (SQLException e){

                }
            } catch (Exception ex) {

            }
        %>
    </div>
    <div class="comment">
        <form method="post" action="/addComment/<%=request.getPathInfo().substring(1)%>">
            <div id="comment">
                <input name="comment" type="text" class="comment_field" required/>
            </div>
            <input type="submit" class="write_btn" value="To write">
        </form>
        <hr>
        <%
            try {
                Class.forName("org.postgresql.Driver");
                try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                    Statement statement = c.createStatement();
                    String id_product = request.getPathInfo();
                    ResultSet comments = statement.executeQuery("SELECT * FROM comments WHERE id_product = " + id_product.substring(1));
                    comments.next();
                    while(!comments.isAfterLast()){
                        %>
                        <div class="comments">
                            <a class="user"><%=comments.getString("email_user")%></a><br><br>
                            <a class="comment_text"><%=comments.getString("comment")%></a>
                            <hr>
                        </div>
                        <%
                        comments.next();
                    }
                    comments.close();
                    c.close();
                    statement.close();
                } catch (SQLException e){

                }
            } catch (Exception ex) {

            }
        %>
    </div>
</div>

<div class="footer">
    <table class="footer_social">
        <tr>
            <td class="contacts">Our general office:<br>
                Saint Petersburg, Shotman street, h. 20</td>
            <td class="contacts">Phone for information:<br>
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
    <script src="../../js/trans.js"></script>
</div>
</body>
</html>