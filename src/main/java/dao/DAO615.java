/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author quanc
 */
 import java.sql.Connection;
 import java.sql.DriverManager;
public class DAO615 {
    protected Connection con;

    public DAO615() {
        final String DATABASE_NAME = "restman615"; // TODO FILL YOUR DATABASE NAME
        final String jdbcURL = "jdbc:mysql://localhost:3306/" + DATABASE_NAME;
        final String JDBC_USER = "root";  // TODO FILL YOUR DATABASE USER
        final String JDBC_PASSWORD = "123456"; // TODO FILL YOUR DATABASE PASSWORD
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cập nhật driver nếu cần
            con = DriverManager.getConnection(jdbcURL, JDBC_USER, JDBC_PASSWORD);
            System.out.println("Connection successful!"); // Thông báo kết nối thành công
        } catch (Exception e) {
            System.out.println("Connection to database failed: " + e.getMessage()); // Thông báo lỗi kết nối
        }
    }
}