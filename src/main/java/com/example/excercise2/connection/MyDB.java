package com.example.excercise2.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDB {
    public static Connection CreateConnect(){
        Connection conn = null;
        String URL = "jdbc:postgresql://localhost:5432/excercise";
        String USER = "postgres";
        String PASSWD = "57632919";

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWD);
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
