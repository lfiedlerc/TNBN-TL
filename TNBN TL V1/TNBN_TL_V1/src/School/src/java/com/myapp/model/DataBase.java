/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.model;

import com.myapp.entities.Course;
import com.myapp.entities.Grade;
import com.myapp.entities.Professor;
import com.myapp.entities.Student;

/**
 *
 * @author lfiedlerc
 */
public class DataBase {
    public static Professor[] professors = {
        new Professor("Bob", "Davidson", "123", "bdavidson", "pas1"),
        new Professor("Mary", "Williams", "987", "mwilliams", "pas2"),
        new Professor("Jim", "Smith", "111", "jsmith", "pas3"),
        new Professor("Beverly", "Harris", "222", "bharris", "pas4"),
        new Professor("Thomas", "Frank", "333", "tfrank", "pas5"),
        new Professor("Jim", "Davidson", "444", "jdavidson", "pas6")
    };
    
    public static Student[] students = {
        new Student("Peeta", "Mellark", "abc", "pmellark", "pas7"),
        new Student("Katniss", "Everdeen", "def", "keverdeen", "pas8")
    };
    
    public static Course[] courses = {
        new Course("Math", "1", "123"),
        new Course("Science", "2", "123")
    };
    
    public static Grade[] grades = {
        new Grade("1","abc",97),
        new Grade("2","abc",70),
        new Grade("1","def",100),
        new Grade("2","def",85)
    };
}
