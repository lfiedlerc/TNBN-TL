/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.objects;

/**
 *
 * @author lfiedlerc
 */
import java.util.ArrayList;
public class EmployeeSearchService
{
/* Hard-coded sample data. Normally this would come from a real data
source such as a database. */
private static Employee[] employees =
{
new Employee("Bob Davidson", "123-45-6789"),
new Employee("Mary Williams", "987-65-4321"),
new Employee("Jim Smith", "111-11-1111"),
new Employee("Beverly Harris", "222-22-2222"),
new Employee("Thomas Frank", "333-33-3333"),
new Employee("Jim Davidson", "444-44-4444")
};
// Search for employees by name.
public ArrayList searchByName(String name) {
ArrayList resultList = new ArrayList();
for (int i = 0; i < employees.length; i++) {
if(employees[i].getName().toUpperCase().indexOf(name.toUpperCase())
!= -1)
{
resultList.add(employees[i]);
}
}
return resultList;
}
// Search for employee by social security number.
public ArrayList searchBySsNum(String ssNum) {
ArrayList resultList = new ArrayList();
for (int i = 0; i < employees.length; i++) {
if (employees[i].getSsNum().equals(ssNum)) {
resultList.add(employees[i]);
}
}
return resultList;
}
}
