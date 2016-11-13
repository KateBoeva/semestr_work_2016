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
public class AddComment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        try{
            String emailUser;
            if(!(emailUser = DataBase.getEmailUser((String) getServletContext().getAttribute("token"))).equals("")) {
                DataBase.addComment(emailUser, request.getPathInfo().substring(1), request.getParameter("comment"));
                response.sendRedirect("/products/" + request.getPathInfo().substring(1));
            } else
                response.sendRedirect("/login");
        } catch (Exception e){
            response.sendRedirect("/login");
        }
//        try {
//            Class.forName("org.postgresql.Driver");
//            try(Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47")){
//                Statement statement = c.createStatement();
//                ResultSet email = statement.executeQuery("SELECT email FROM tokens WHERE token = '" + getServletContext().getAttribute("token") + "'");
//                email.next();
//                String emailUser = email.getString("email");
//                if(emailUser.equals(""))
//                    response.sendRedirect("/login");
//                else {
//                    statement.executeUpdate("insert into comments(email_user, id_product, comment) " +
//                            "values('" + emailUser + "', " + request.getPathInfo().substring(1) + ", '" + request.getParameter("comment")+ "')");
//                    response.sendRedirect("/products/" + request.getPathInfo().substring(1));
//                }
//                email.close();
//                c.close();
//                statement.close();
//            } catch (SQLException e){
//                response.sendRedirect("/login");
//            }
//        } catch (Exception ex) {
//            response.sendRedirect("/login");
//        }
    }
}
