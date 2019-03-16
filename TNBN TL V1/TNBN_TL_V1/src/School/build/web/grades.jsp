<%-- 
    Document   : grades
    Created on : Nov 28, 2013, 9:24:19 PM
    Author     : lfiedlerc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html:form action="/save">
    <html:hidden property="courseName" value="${studentGrades.courseName}"/>
    <html:hidden property="courseId" value="${studentGrades.courseId}"/>
        <table border="0">
        <tr>
        <th>Student ID</th>
        <th>Name</th>
        <th>Last Name</th>
        <th>Grade</th>
        </tr>
        
        <logic:iterate id="record" name="studentGrades" property="names">
            <tr>
                <td><bean:write name="record" property="key"/></td>
                <td>${studentGrades.names[record.key]}</td> <html:hidden property="name(${record.key})" value="${studentGrades.names[record.key]}"/>
                <td>${studentGrades.lastNames[record.key]}</td> <html:hidden property="lastName(${record.key})" value="${studentGrades.lastNames[record.key]}"/>
                <td><html:text property="grade(${record.key})" value="${studentGrades.grades[record.key]}"/></td> 
            </tr>
        </logic:iterate>
            <tr>
                <td></td>
                <td><html:submit value="Save" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <bean:write name="studentGrades" property="message" filter="false"/>
                    &nbsp;</td>
            </tr>
        </table>
</html:form>
