/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TajnaSluzba
 */
public class DB {

    
    private static DB instance;
    private static final int MAX_CON = 5;
    private static final Connection[] bafer = new Connection[MAX_CON];
    private int first = 0, last = 0, free = MAX_CON;

    /* za Access
     private DB(){
     try{
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     for(int i=0; i<MAX_CON; i++)
     bafer[i] = DriverManager.getConnection("jdbc:odbc:lab1kol");
     } catch(Exception e){}
     }
     */
    private DB() { //za MySQL
        String URL = "jdbc:mysql://localhost:3306/mips";
        String USER = "mips";
        String PASS = "mips"; // PI PASS 123456
        try {
          Class.forName("com.mysql.jdbc.Driver");
          //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
          for (int i = 0; i < MAX_CON; i++) {
            bafer[i] = DriverManager.getConnection(URL, USER, PASS);
          }
        } catch (ClassNotFoundException | SQLException ex) {
        //} catch (SQLException ex) {
          Logger.getLogger(DB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static DB getInstance() {
        if (instance == null) {
          instance = new DB();
        }
        return instance;
    }

    public synchronized Connection getConnection() {
        if (free == 0) {
          return null;
        }
        free--;
        Connection con = bafer[first];
        first = (first + 1) % MAX_CON;
        return con;
    }

    public synchronized void putConnection(Connection con) {
        if (con == null) {
          return;
        }
        free++;
        bafer[last] = con;
        last = (last + 1) % MAX_CON;
    }

}
