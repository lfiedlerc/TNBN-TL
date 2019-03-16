/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;

import com.myapp.forms.CourseForm;
import com.myapp.model.ProfessorService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author lfiedlerc
 */
public class SaveAction extends Action{
    
    @Override
    public ActionForward execute(ActionMapping mapping,
        ActionForm form,
        HttpServletRequest request,
        HttpServletResponse response)
        throws Exception {
        System.out.println("Reaches save action!");
        
            CourseForm course = (CourseForm)form;
            ProfessorService.saveChanges(course.getCourseId(),course.getGrades());
            request.setAttribute("studentGrades", course);
            course.setMessage("Changes saved");
            return mapping.getInputForward();
        }
}
