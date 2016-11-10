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
public class AddUser extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password_2");
        try {
            Class.forName("org.postgresql.Driver");
            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                Statement statement = c.createStatement();
                if(!password.equals(password2)){
                    sendError("1", response);
                } else {
                    statement.executeUpdate("INSERT INTO users(email, password, name, is_admin) " +
                            "VALUES ('" + email + "','" + password + "','" + name + "',0" + ")");
                    response.sendRedirect("/login");
                }
                c.close();
                statement.close();
            } catch (SQLException e){
                sendError("2", response);
            }
        } catch (Exception ex) {

        }
    }

    private void sendError(String textError, HttpServletResponse response){
        Cookie cookie = new Cookie("isError", textError);
        cookie.setMaxAge(100);
        response.addCookie(cookie);
        try {
            response.sendRedirect("/registration");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
