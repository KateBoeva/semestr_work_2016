<%@ page import="java.util.UUID" %>
<%@ page import="java.sql.*" %><%--
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
    <link href="../css/products.css" rel="stylesheet">
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
                int isAdmin = 0;
                String emailUser = "";
                try {
                    Class.forName("org.postgresql.Driver");
                    try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                        Statement statement = c.createStatement();
                        ResultSet email = statement.executeQuery("SELECT email FROM tokens WHERE token = '" + getServletConfig().getServletContext().getAttribute("token") + "'");
                        email.next();
                        ResultSet user = statement.executeQuery("SELECT * FROM users WHERE email = '" +email.getString("email") + "'");
                        user.next();
                        isAdmin = user.getInt("is_admin");
                        emailUser = user.getString("email");
                    } catch (SQLException e){

                    }
                } catch (Exception ex) {

                }
                Cookie[] cookies = request.getCookies();
                boolean isAuth = false;
                int numberPage = 1;
                numberPage = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
                if(getServletConfig().getServletContext().getAttribute("token") != null)
                    for(int i = 0; i < cookies.length; i++){
                        if(cookies[i].getName().equals("name")){
                            isAuth = true;
                            %>
                            <td><p class="name">Hello, <%=cookies[i].getValue()%></p></td>
                            <td>|</td>
                            <td><a href="/logout">Sign out</a></td>
                            <%if(isAdmin == 1){%>
                                <td>|</td>
                                <td><a href="/add_product">Add product</a></td>
                            <%}
                        }
                    }
                if(!isAuth){
                    response.sendRedirect("/login");
                }%>
            </tr>
        </table>
    </div>
</header>

<div class="content">
    <div id="select" class="content_select">
        <div class="content_boxes">
            <%
            int generalPrice = 0;
            try {
                Class.forName("org.postgresql.Driver");
                try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                    Statement statement = c.createStatement();
                    ResultSet bucket = statement.executeQuery("SELECT * FROM bucket WHERE email_user = '" + emailUser + "'");
                    bucket.next();
                    String sqlRequest = "SELECT * FROM products WHERE id = '" + bucket.getInt("id_product") + "'";
                    bucket.next();
                    while (!bucket.isAfterLast()){
                        sqlRequest += " OR id = '" + bucket.getInt("id_product") + "'";
                        bucket.next();
                    }
                    ResultSet products = statement.executeQuery(sqlRequest);
                    products.next();
                    while (!products.isAfterLast()){
                        %>
                        <form method="get">
                            <a href="/products/<%=products.getInt("id")%>"><div class="box_info">
                                <img class="img_min" src="<%=products.getString("photo_url")%>">
                                <h1><%=products.getString("title")%></h1>
                                <p><%=products.getString("price")%></p>
                                <p><%=products.getString("date_create")%></p>
                            </div></a>
                        </form>
                        <%
                        generalPrice += products.getInt("price");
                        products.next();
                    }
                    bucket.close();
                    products.close();
                    c.close();
                    statement.close();
                } catch (SQLException e){

                }
            } catch (Exception ex) {

            }
            %>
        </div><br>
        Итоговая сумма: <input type="text" disabled id="general_price" value="<%=generalPrice%>"> руб.</input>
        <input type="button" id="buy" value="BUY">
        <script src="../js/bucket.js"></script>
        <script src="../js/trans.js"></script>
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
    <script src="../js/trans.js"></script>
</div>
</body>
</html>
