/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import beans.WeatherData;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import util.DB;

/**
 *
 * @author TajnaSluzba
 */
@ManagedBean
@RequestScoped
public class DataController {

    List<WeatherData> list = new ArrayList<>();
    
    @PostConstruct
    void init() {
        list.clear();
        Connection connection = null;
        Statement st = null;
        ResultSet rs = null;
        List<WeatherData> weatherDataList = new ArrayList<>();
        DateFormat df = new SimpleDateFormat("HH:mm:ss dd.MM.yyyy");
        DateFormat dff = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
        try {
            connection = DB.getInstance().getConnection();
            st = connection.createStatement();
            String query = "SELECT * FROM temp_hum ORDER BY created_on DESC";
            rs = st.executeQuery(query);
            while (rs.next()) {
                WeatherData data = new WeatherData();
                data.setTemp(rs.getDouble("temp"));
                data.setHum(rs.getDouble("hum"));
                data.setPressure(rs.getDouble("pres"));
                data.setDistance(rs.getDouble("dist"));
                Date date = dff.parse(rs.getString("created_on"));
                data.setDate(df.format(date));
                weatherDataList.add(data);
            }
            
        } catch (SQLException | NumberFormatException | NullPointerException | ParseException ex) {
            Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(st!=null)
                    st.close();
            } catch (SQLException ex) {
                Logger.getLogger(DataController.class.getName()).log(Level.SEVERE, null, ex);
            }
            DB.getInstance().putConnection(connection);   
        }
        list = weatherDataList;
    }

    public List<WeatherData> getList() {
        return list;
    }
    
    
}
