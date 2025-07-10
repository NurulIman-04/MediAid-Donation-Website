package admin.com.model;
import java.sql.*;

public class AdminDashboard {
    // Updated to use the correct database
    private static final String dburl = "jdbc:derby://localhost:1527/MediAidDB";
    private static final String dbname = "app";
    private static final String dbpass = "app";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(dburl, dbname, dbpass);
    }
}
