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
    <link href="../css/add_product.css" rel="stylesheet">
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
                try{
                    String token = (String) getServletConfig().getServletContext().getAttribute("token");
                    User user = DataBase.getUserData(token);
                    Cookie[] cookies = request.getCookies();
                    boolean isAuth = false;
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
                    if(!isAuth){
                        response.sendRedirect("/login");
                    }
                } catch (Exception e){
                    response.sendRedirect("/login");
                }%>
            </tr>
        </table>
    </div>
</header>

<div class="content">
    <div id="select" class="content_select">
        <p>Add product</p>
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
                    <form method="post" action="/editProduct/<%=request.getPathInfo().substring(1)%>">

                        <table class="form">
                            <tr id="title">
                                <td>Title</td>
                                <td><input class="input" name="title" type="text" value="<%=product.getString("title")%>" required autofocus></td>
                            </tr>
                            <tr id="price">
                                <td>Price</td>
                                <td><input class="input" name="price" type="number" value="<%=product.getInt("price")%>" required></td>
                            </tr>

                            <tr id="description">
                                <td>Description</td>
                                <td><input class="input" name="description" type="text" value="<%=product.getString("description")%>" required></td>
                            </tr>

                            <tr id="photo_url">
                                <td>Photo</td>
                                <td><input class="input_photo" name="photo_url" type="file" value="<%=product.getString("photo_url")%>" required></td>
                            </tr>
                        </table>
                        <input class="btn" type="submit" value="Edit">
                    </form>
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