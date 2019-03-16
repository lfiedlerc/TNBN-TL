/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.model;

import com.myapp.beans.ProfessorBean;
import com.myapp.forms.CourseForm;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

/**
 *
 * @author lfiedlerc
 */
public class ProfessorService {
    public static void getCourses(ProfessorBean professor){
       Hashtable<String, String> courses = new Hashtable<String,String>();
        
        for(int i = 0; i < DataBase.courses.length; ++i){
            if(DataBase.courses[i].getProfessor_id().equals(professor.getId())){
                courses.put(DataBase.courses[i].getCourse_id(),DataBase.courses[i].getName()); 
            }
        }
        
        professor.setCourses(courses);
    }
    
    public static void getStudents(CourseForm course){
        String courseId = course.getCourseId();
        String name, lastName, id;
        double grade;
        
        for(int i = 0; i < DataBase.grades.length; ++i){
            if(DataBase.grades[i].getCourse_id().equals(courseId)){
                id = DataBase.grades[i].getStudent_id();
                grade = DataBase.grades[i].getGrade();
                course.setGrade(id, grade);
                name = null;
                lastName = null;
                for(int j = 0; j < DataBase.students.length; ++j){
                    if(DataBase.students[j].getStudent_id().equals(id)){
                        name = DataBase.students[j].getName();
                        lastName = DataBase.students[j].getLast_name();
                        break;
                    }
                }
                course.setName(id, name);
                course.setLastName(id, lastName);
            }
        }

    }
    
    public static void saveChanges(String courseId,  HashMap<String,Double> grades){
        Map.Entry pairs;
        for(int i = 0; i < DataBase.grades.length; ++i){
            if(DataBase.grades[i].getCourse_id().equals(courseId)){
                Iterator it = grades.entrySet().iterator();
                while(it.hasNext()){
                    pairs = (Map.Entry)it.next();
                    if(DataBase.grades[i].getStudent_id().equals(pairs.getKey().toString())){
                        DataBase.grades[i].setGrade((Double)pairs.getValue());
                    }
                }
                break;
            }
        }
    }
}
