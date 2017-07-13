/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.WeatherData;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DB;

/**
 *
 * @author TajnaSluzba
 */
public class ShowDataServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Connection connection = null;
        Statement st = null;
        ResultSet rs = null;
        List<WeatherData> weatherDataList = new ArrayList<>();
        try {
            connection = DB.getInstance().getConnection();
            st = connection.createStatement();
            String query = "SELECT * FROM temp_hum";
            rs = st.executeQuery(query);
            while (rs.next()) {
                WeatherData data = new WeatherData();
                data.setTemp(rs.getDouble("temp"));
                data.setHum(rs.getDouble("hum"));
                data.setPressure(rs.getDouble("pres"));
                data.setDate(rs.getDate("date")); // drugacije na produkciji
                weatherDataList.add(data);
            }
            request.setAttribute("weatherDataList", weatherDataList);
        } catch (SQLException | NumberFormatException | NullPointerException ex) {
            Logger.getLogger(LogDataServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(st!=null)
                    st.close();
            } catch (SQLException ex) {
                Logger.getLogger(LogDataServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            DB.getInstance().putConnection(connection);   
        }
        request.getRequestDispatcher("show.jsp").forward(request, response);
    }

}
