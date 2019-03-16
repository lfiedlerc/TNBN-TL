<%-- 
    Document   : courses
    Created on : Nov 28, 2013, 10:48:49 AM
    Author     : lfiedlerc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
        <table border="1">
        <tr>
        <th>Course ID</th>
        <th>Course</th>
        </tr>
        <logic:iterate id="subject" name="courses" property="courses">
            <tr>
                <td>
                    <html:form action="/display">
                        <a  href="#" onclick="javascript:submit()">
                            <html:hidden property="courseId" value="${subject.key}"/>
                            <html:hidden property="courseName" value="${subject.value}"/>
                            <bean:write name="subject" property="key"/></a>
                    </html:form>
                </td>
                <td><bean:write name="subject" property="value"/></td>
            </tr>
        </logic:iterate>
        </table>
