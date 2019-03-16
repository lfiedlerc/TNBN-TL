/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.model;

import com.myapp.beans.Entity;
import com.myapp.beans.ProfessorBean;
import com.myapp.beans.StudentBean;

/**
 *
 * @author lfiedlerc
 */
public class LoginService {
    //hardcoded data! in reality this would be in a DB
    
    
    public Entity login(String login, String password, String type){ // this would actually be sql code
        Entity bean = null;
        if(type.equals("Professor")){
            for(int i = 0; i < DataBase.professors.length; ++i){
                if(DataBase.professors[i].getLogin().equals(login) && DataBase.professors[i].getPassword().equals(password)){
                    bean = new ProfessorBean();
                    bean.setName(DataBase.professors[i].getName());
                    bean.setLastName(DataBase.professors[i].getLastName());
                    bean.setId(DataBase.professors[i].getProfessorId());
                    bean.setLogin(login);
                    bean.setPassword(password);
                }
            }
        } else {
            for(int i = 0; i < DataBase.students.length; ++i){
                if(DataBase.students[i].getLogin().equals(login) && DataBase.students[i].getPassword().equals(password)){
                    bean = new StudentBean();
                    bean.setName(DataBase.students[i].getName());
                    bean.setLastName(DataBase.students[i].getLast_name());
                    bean.setId(DataBase.students[i].getStudent_id());
                    bean.setLogin(login);
                    bean.setPassword(password);
                }
            }
        }
        return bean;
    }
 
}
