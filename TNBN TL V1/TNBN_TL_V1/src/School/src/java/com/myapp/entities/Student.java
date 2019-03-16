/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.entities;

/**
 *
 * @author lfiedlerc
 */
public class Student {
    private String name;
    private String last_name;
    private String student_id;
    private String login;
    private String password;
    
    public Student(String name, String last_name, String student_id, String login, String password){
        this.name = name;
        this.last_name = last_name;
        this.student_id = student_id;
        this.login = login;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
