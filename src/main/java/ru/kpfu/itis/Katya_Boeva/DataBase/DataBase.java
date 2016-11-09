package ru.kpfu.itis.Katya_Boeva.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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


}
