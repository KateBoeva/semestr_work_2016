package ru.kpfu.itis.Katya_Boeva.DataBase;

import java.sql.*;

/**
 * Created by katemrrr on 01.11.16.
 */
public class DataBase {
    private Connection connection;
    private Connection getConnection(){
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Shop","postgres", "bafobu47");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void addComment(String emailUser, String id_product, String comment) throws Exception {
        Class.forName("org.postgresql.Driver");
        Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47");
        Statement statement = c.createStatement();
        statement.executeUpdate("insert into comments(email_user, id_product, comment) " +
                "values('" + emailUser + "', " + id_product + ", '" + comment + "')");
        c.close();
        statement.close();
    }

    public static String getEmailUser(String token) throws Exception {
        Class.forName("org.postgresql.Driver");
        Connection c = DriverManager.getConnection("jdbc:postgresql://localhost/Shop", "postgres", "bafobu47");
        Statement statement = c.createStatement();
        ResultSet email = statement.executeQuery("SELECT email FROM tokens WHERE token = '" + token + "'");
        email.next();
        String emailUser = email.getString("email");
        email.close();
        c.close();
        statement.close();
        return emailUser;
    }


}
