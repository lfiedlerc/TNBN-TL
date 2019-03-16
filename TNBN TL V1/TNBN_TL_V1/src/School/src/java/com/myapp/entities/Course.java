/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.entities;

import java.util.ArrayList;

/**
 *
 * @author lfiedlerc
 */
public class Course {
    private String name;
    private String course_id;
    private String professor_id;

    public Course(String name, String course_id, String professor_id) {
        this.name = name;
        this.course_id = course_id;
        this.professor_id = professor_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourse_id() {
        return course_id;
    }

    public void setCourse_id(String course_id) {
        this.course_id = course_id;
    }

    public String getProfessor_id() {
        return professor_id;
    }

    public void setProfessor_id(String professor_id) {
        this.professor_id = professor_id;
    }
    
}
