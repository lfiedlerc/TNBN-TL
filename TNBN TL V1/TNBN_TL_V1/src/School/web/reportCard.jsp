<%-- 
    Document   : reportCard
    Created on : Nov 27, 2013, 7:37:29 PM
    Author     : lfiedlerc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
    </head>
    <body>
        <hr width="100%" size="1" noshade="true">
        <table border="1">
        <tr>
        <th>Course</th>
        <th>Grade</th>
        </tr>
        <logic:iterate id="row" name="grades" property="reportCard">
            <tr>
            <td><bean:write name="row" property="key" /></td>
            <td><bean:write name="row" property="value" /></td>
            </tr>
        </logic:iterate>
        </table>
    </body>
</html>
