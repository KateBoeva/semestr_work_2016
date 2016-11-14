package ru.kpfu.itis.Katya_Boeva.Servlets;

import ru.kpfu.itis.Katya_Boeva.DataBase.DataBase;

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

        if (!password.equals(password2)) {
            sendError("1", response);
        } else if(!email.matches("^([a-z0-9_-]+\\.)*[a-z0-9_-]+@[a-z0-9_-]+(\\.[a-z0-9_-]+)*\\.[a-z]{2,6}$")){
            sendError("2", response);
        } else {
            try {
                DataBase.addUser(email, password, name);
                response.sendRedirect("/login");
            } catch (Exception e) {
                sendError("2", response);
            }
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
