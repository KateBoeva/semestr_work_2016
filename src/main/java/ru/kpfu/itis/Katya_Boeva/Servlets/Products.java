package ru.kpfu.itis.Katya_Boeva.Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Created by katemrrr on 01.11.16.
 */
public class Products extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        boolean isUser = false;
        try {
            Class.forName("org.postgresql.Driver");
            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                Statement statement = c.createStatement();
                ResultSet users = statement.executeQuery("SELECT * FROM users");

                users.close();
                c.close();
                statement.close();
            } catch (SQLException e){

            }
        } catch (Exception ex) {

        }

    }
}
