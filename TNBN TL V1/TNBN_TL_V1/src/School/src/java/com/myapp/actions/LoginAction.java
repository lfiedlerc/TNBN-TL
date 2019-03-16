/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;

import com.myapp.beans.Entity;
import com.myapp.beans.ProfessorBean;
import com.myapp.beans.StudentBean;
import com.myapp.forms.LoginForm;
import com.myapp.model.LoginService;
import com.myapp.model.ProfessorService;
import com.myapp.model.StudentService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author lfiedlerc
 */

public class LoginAction extends Action{
    private final static String PROFESSOR = "professor";
    private final static String STUDENT = "student";

    @Override
    public ActionForward execute(ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception {
        
            LoginService service = new LoginService();
            LoginForm loginform = (LoginForm)form;
            String login = loginform.getLogin();
            String password = loginform.getPassword();
            String type = loginform.getType();
            Entity bean = service.login(login, password, type);
            if(bean != null){
                if(type.equals("Professor")){     
                    HttpSession session = request.getSession();
                    ProfessorBean professor = (ProfessorBean)bean;
                    ProfessorService.getCourses(professor);
                    session.setAttribute("courses", professor);
                    return mapping.findForward(PROFESSOR);
                } else {
                    StudentBean student = (StudentBean)bean;
                    StudentService.getReportCard(student);
                    request.setAttribute("grades",student);
                    return mapping.findForward(STUDENT);
                }
            }
            
            // set success to false
            loginform.setError("Login unsuccessfull");
            // Forward control to this Action's input page.
            return mapping.getInputForward();
        }
}
