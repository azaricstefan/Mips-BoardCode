<%-- 
    Document   : show
    Created on : Jul 13, 2017, 10:36:37 AM
    Author     : TajnaSluzba
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weather DATA</title>
    </head>
    <body>
        <div align="center">
            <h1>Weather Data</h1>
            <table>
                <tr>
                    <th>Temperature</th>
                    <th>Humidity</th>
                    <th>Pressure</th>
                    <th>Date</th>
                </tr>
                <c:forEach var="data" items="${weatherDataList}" >
                    <tr>
                        <td>${data.temp} C</td>
                        <td>${data.hum} % </td>
                        <td>${data.date}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
