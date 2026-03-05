package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://maglev.proxy.rlwy.net:58231/railway",
                "root",
                "FvKDdUXlspaVFptgBoxPQQCGBXBrNYiM"
            );

            System.out.println("Database Connected");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}