/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.model;

import com.myapp.beans.StudentBean;
import com.myapp.entities.Grade;
import java.util.ArrayList;
import java.util.Hashtable;

/**
 *
 * @author lfiedlerc
 */
public class StudentService {
    public static void getReportCard(StudentBean student){
        Hashtable<String,String> reportCard;
        ArrayList<Grade> student_grades = new ArrayList<Grade>();
        
        for(int i = 0; i < DataBase.grades.length; ++i){
            if(DataBase.grades[i].getStudent_id().equals(student.getId())){
                student_grades.add(DataBase.grades[i]);
            }
        }
        
        reportCard = new Hashtable(student_grades.size());
        
        for(int i = 0; i < student_grades.size(); ++i){
            for(int j = 0; j < DataBase.courses.length; ++j){
                if(DataBase.courses[j].getCourse_id().equals(student_grades.get(i).getCourse_id())){
                    reportCard.put(DataBase.courses[j].getName(), student_grades.get(i).getGrade() + "");
                }
            }
        }
        
        student.setReportCard(reportCard);
    }
}
