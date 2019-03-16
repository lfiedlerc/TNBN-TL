/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.entities;

/**
 *
 * @author lfiedlerc
 */
public class Grade {
    private String course_id;
    private String student_id;
    private double grade;

    public Grade(String course_id, String student_id, double grade) {
        this.course_id = course_id;
        this.student_id = student_id;
        this.grade = grade;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }
    
    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public double getGrade() {
        return grade;
    }

    public void setGrade(double grade) {
        this.grade = grade;
    }
    
    
}
