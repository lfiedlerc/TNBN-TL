/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.beans;

import java.util.Hashtable;

/**
 *
 * @author lfiedlerc
 */
public class ProfessorBean extends Entity{
    private Hashtable<String, String> courses = null;

    public Hashtable<String, String> getCourses() {
        return courses;
    }

    public void setCourses(Hashtable<String, String> courses) {
        this.courses = courses;
    }
    
}
