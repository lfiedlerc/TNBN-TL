/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.objects;

/**
 *
 * @author lfiedlerc
 */
public class Employee
{
private String name;
private String ssNum;
public Employee(String name, String ssNum) {
this.name = name;
this.ssNum = ssNum;
}
public void setName(String name) {
this.name = name;
}
public String getName() {
return name;
}
public void setSsNum(String ssNum) {
this.ssNum = ssNum;
}
public String getSsNum() {
return ssNum;
}
}
