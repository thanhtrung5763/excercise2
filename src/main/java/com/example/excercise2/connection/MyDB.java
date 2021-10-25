package com.example.excercise2.connection;

import org.hibernate.cfg.Environment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDB {
    public static Connection CreateConnect(){
        Connection conn = null;
        String URL = "jdbc:postgresql://localhost:5432/excercise";
        String USER = "postgres";
        String PASSWD = "57632919";
//        String URL = "jdbc:postgresql://ec2-34-239-55-93.compute-1.amazonaws.com:5432/d352gr1ttfjolk";
//        String USER = "pykyrnqggdnwdj";
//        String PASSWD = "8e1370df19a4fc115ac9e1139b22638a244313d1baeeb8a160c0fd02821f3dd7";
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
