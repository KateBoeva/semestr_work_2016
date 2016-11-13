package ru.kpfu.itis.Katya_Boeva.Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by katemrrr on 01.11.16.
 */
public class EditProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String photo_url = request.getParameter("photo_url");
        String price = request.getParameter("price");
        try {
            Class.forName("org.postgresql.Driver");
            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                Statement statement = c.createStatement();
                ResultSet email = statement.executeQuery("SELECT email FROM tokens WHERE token = '" + getServletContext().getAttribute("token") + "'");
                email.next();
                ResultSet user = statement.executeQuery("SELECT * FROM users WHERE email = '" +email.getString("email") + "'");
                user.next();
                if(user.getInt("is_admin") == 0)
                    response.sendRedirect("/login");
                else {
                    statement.executeUpdate("UPDATE products SET title = '" + title + "', description = '" + description +
                            "', photo_url = '" + photo_url + "', price = " + price + " WHERE id = " + request.getPathInfo().substring(1));
                    response.sendRedirect("/products");
                }
                c.close();
                statement.close();
            } catch (SQLException e){
                response.sendRedirect("/products");
            }
        } catch (Exception ex) {
            response.sendRedirect("/products");
        }
    }

}
