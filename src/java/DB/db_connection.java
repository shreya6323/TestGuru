/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author shreya gandhi
 */
public class db_connection {
    public Connection con;
    public ResultSet rs;
    public PreparedStatement pstmt;
    
    public db_connection()
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            String condb ="jdbc:postgresql://localhost:5432/postgres";
            String conusername="postgres";
            String conpswd = "postgres";
            con = DriverManager.getConnection(condb,conusername,conpswd);
        }   
        catch(Exception e)
                { 
                   
                      e.printStackTrace();
                }
    
    }
    public static void main(String args[])
    {
        db_connection c = new db_connection();
        System.out.println(c);
    }
}


