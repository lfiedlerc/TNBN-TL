/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.entities;

/**
 *
 * @author lfiedlerc
 */
public class Professor {
    private String name;
    private String last_name;
    private String professor_id;
    private String login;
    private String password;

    public Professor(String name, String last_name, String professor_id, String login, String password) {
        this.name = name;
        this.last_name = last_name;
        this.professor_id = professor_id;
        this.login = login;
        this.password = password;
    }
    
    public String getName(){
        return name;
    }
    
    public String getLastName(){
        return last_name;
    }
    
    public String getProfessorId(){
        return professor_id;
    }
    
    public String getLogin(){
        return login;
    }
    
    public String getPassword(){
        return password;
    }
}
