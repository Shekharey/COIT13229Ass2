/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package assesment.serverass2;

import java.sql.Connection;
import java.sql.SQLException;
import javax.activation.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Asus
 */
public class ConnectionPool {
    private static ConnectionPool pool = null;
    private static DataSource dataSource = null;
    private ConnectionPool(){
        try {
            InitialContext ic = new InitialContext();
            dataSource= (DataSource) ic.lookup("java:/comp/env/jdbc:mysql://localhost:3306/ibdms_server?zeroDateTimeBehavior=CONVERT_TO_NULL [root on Default schema]");
        }
        catch(NamingException e){
            System.out.println(e);
        }
    }
    public static synchronized ConnectionPool getInstance(){
        if(pool == null){
            pool = new ConnectionPool();
        }
        return pool;
    }
    public Connection getConnection(){
        return (Connection) dataSource;
    }
    public void freeConnection(Connection c){
        try{
            c.close();
        }
        catch(SQLException e){
            System.out.println(e);

        }
    }
}
