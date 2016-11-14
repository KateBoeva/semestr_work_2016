package ru.kpfu.itis.Katya_Boeva.Servlets;

import ru.kpfu.itis.Katya_Boeva.DataBase.DataBase;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.UUID;

/**
 * Created by katemrrr on 27.10.16.
 */
public class Logout extends HttpServlet{

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            DataBase.removeToken((String) getServletContext().getAttribute("token"));
            getServletContext().removeAttribute("token");
            response.addCookie(new Cookie("isRemember", "false"));
            response.sendRedirect("/login");
        } catch (Exception e) {

        }

//        try {
//            Class.forName("org.postgresql.Driver");
//            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
//                Statement statement = c.createStatement();
//                statement.executeUpdate("DELETE FROM tokens WHERE token = '" + getServletContext().getAttribute("token") + "'");
//                getServletContext().removeAttribute("token");
//                response.addCookie(new Cookie("isRemember", "false"));
//                response.sendRedirect("/login");
//                c.close();
//                statement.close();
//            } catch (SQLException e){
//
//            }
//        } catch (Exception ex) {
//
//        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

    }

}
