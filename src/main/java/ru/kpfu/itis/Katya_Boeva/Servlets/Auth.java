package ru.kpfu.itis.Katya_Boeva.Servlets;

import ru.kpfu.itis.Katya_Boeva.Models.Addresses;

import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by katemrrr on 27.10.16.
 */
public class Auth extends HttpServlet{
    private String email;
    private String password;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        email = request.getParameter("email");
        password = request.getParameter("password");
        String isRemember = request.getParameter("isRemember");
        boolean isUser = false;
        try {
            Class.forName("org.postgresql.Driver");
            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
                Statement statement = c.createStatement();
                ResultSet users = statement.executeQuery("SELECT * FROM users");
                while(users.next()){
                    String name = users.getString("name");
                    if(users.getString("email").equals(email) && users.getString("password").equals(password)){
                        String token = UUID.randomUUID().toString();
                        statement.executeUpdate("DELETE FROM tokens WHERE email = '" + email + "'");
                        statement.executeUpdate("INSERT INTO tokens (email, token) VALUES('" + email + "','" + token + "')");
                        getServletContext().setAttribute("token", token);
                        if(isRemember != null && isRemember.equals("true"))
                            response.addCookie(new Cookie("isRemember", "true"));
                        else
                            response.addCookie(new Cookie("isRemember", "false"));
                        Cookie nameCookie = new Cookie("name", name);
                        nameCookie.setMaxAge(3600);
                        response.addCookie(nameCookie);
                        response.sendRedirect("/products");
                        isUser = true;
                    }
                }
                if(!isUser){
                    Cookie cookie = new Cookie("isInvalid", "true");
                    cookie.setMaxAge(20);
                    response.addCookie(cookie);
                    response.sendRedirect("/login");
                }
                users.close();
                c.close();
                statement.close();
            } catch (SQLException e){

            }
        } catch (Exception ex) {

        }

    }

}
