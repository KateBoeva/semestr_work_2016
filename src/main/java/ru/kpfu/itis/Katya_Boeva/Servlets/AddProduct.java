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
public class AddProduct extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String photo_url = request.getParameter("photo_url");
        String price = request.getParameter("price");

        try{
            if(DataBase.isAdmin((String) getServletContext().getAttribute("token"))){
                DataBase.addProduct(title, description, photo_url, price);
                response.sendRedirect("/products");
            } else
                response.sendRedirect("/login");
        } catch (Exception e){
            response.sendRedirect("/products");
        }
    }

}
