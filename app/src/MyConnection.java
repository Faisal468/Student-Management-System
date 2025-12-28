/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProjectWork;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author PR3YDATOR
 */
class MyConnection {
    // SQL Server JDBC Driver
    final static String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    
    // Connection URL for SQL Server Express with Windows Authentication
    final static String DB_URL = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;" +
            "databaseName=studentmanagementsystem;" +
            "encrypt=false;" +
            "trustServerCertificate=true;" +
            "integratedSecurity=true";
    
    /**
     * Establish database connection
     * @return Connection object or null if failed
     */
    public static Connection connection() throws SQLException {
        try {
            // Load JDBC driver
            Class.forName(JDBC_DRIVER);
            
            // Create connection with Windows Authentication
            // Note: authenticationScheme=nativeAuthentication is implied by integratedSecurity=true 
            // but requires mssql-jdbc_auth-*.dll in java.library.path
            Connection con = DriverManager.getConnection(DB_URL);
            
            System.out.println("Database connected successfully!");
            return con;
            
        } catch (ClassNotFoundException e) {
            JOptionPane.showMessageDialog(null, 
                "SQL Server JDBC Driver not found!\n\n" +
                "Please add mssql-jdbc-*.jar to your lib folder.",
                "Driver Error", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
            return null;
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, 
                "Database connection failed!\n\n" + 
                "Error: " + e.getMessage() + "\n\n" +
                "Please check:\n" +
                "1. SQL Server is running\n" +
                "2. TCP/IP is enabled on port 1433\n" +
                "3. Database 'studentmanagementsystem' exists\n\n" +
                "If using Windows Authentication, ensure sqljdbc_auth.dll is in your System32 folder.",
                "Connection Error", JOptionPane.ERROR_MESSAGE);
            e.printStackTrace();
            return null;
        }
    }
}

 