/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;

import com.myapp.forms.CourseForm;
import com.myapp.model.ProfessorService;
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
public class DisplayAction extends Action{
    
    @Override
    public ActionForward execute(ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception {
        
            CourseForm course = (CourseForm)form;
            
            ProfessorService.getStudents(course);
            request.setAttribute("studentGrades", course);
            return mapping.findForward("grades");
        }
}
