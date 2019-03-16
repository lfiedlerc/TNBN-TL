/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.forms;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author lfiedlerc
 */
public class CourseForm extends ActionForm{
    private String courseName = null;
    private String courseId = null;
    private HashMap<String, String> names = new HashMap();
    private HashMap<String, String> lastNames = new HashMap();
    private HashMap<String, Double> grades = new HashMap();
    private String message = null;
    
    public CourseForm(){
        System.out.println("Creating new bean!");
    }

    public HashMap<String, String> getNames() {
        return names;
    }
    
    public String getName(String key){
        return names.get(key);
    }

    public void setNames(HashMap<String, String> names) {
        this.names = names;
    }
    
    public void setName(String key, String name){
        names.put(key, name);
    }

    public HashMap<String, String> getLastNames() {
        return lastNames;
    }
    
    public String getLasName(String key){
        return lastNames.get(key);
    }

    public void setLastNames(HashMap<String, String> lastNames) {
        this.lastNames = lastNames;
    }
    
    public void setLastName(String key, String name){
        lastNames.put(key, name);
    }

    public HashMap<String, Double> getGrades() {
        return grades;
    }
    
    public double getGrade(String key){
        return grades.get(key);
    }

    public void setGrades(HashMap<String, Double> grades) {
        this.grades = grades;
    }
    
    public void setGrade(String key, double grade){
        grades.put(key, grade);
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request){
        courseName = null;
        courseId = null;
        names = new HashMap();
        lastNames = new HashMap();
        grades = new HashMap();
    }
}
