<%-- 
    Document   : login
    Created on : Nov 27, 2013, 12:38:53 PM
    Author     : lfiedlerc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html:errors/>
<html:form action="/login">
    <table border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <bean:write name="LoginForm" property="error" filter="false"/>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Enter your login:</td>
                <td><html:text property="login" /></td>
            </tr>
            <tr>
                <td>Enter your password:</td>
                <td><html:password property="password" /></td>
            </tr>
            <tr>
                <td></td>
                <td><html:select property="type">
                        <html:option value="Professor">Professor</html:option>
                        <html:option value="Student">Student</html:option>
                </html:select></td>
            </tr>
            <tr>
                <td></td>
                <td><html:submit value="Login" /></td>
            </tr>
        </tbody>
    </table>
</html:form>
