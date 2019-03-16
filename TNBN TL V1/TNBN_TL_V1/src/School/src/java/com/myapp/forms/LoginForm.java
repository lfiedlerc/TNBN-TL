/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.forms;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author lfiedlerc
 */
public class LoginForm extends ActionForm{
    private String login = null;
    private String password = null;
    private String type = null;
    private String error = null;

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request){
        login = null;
        password = null;
        type = null;
        error = null;
    }
    
    // Validate form data.
    @Override
    public ActionErrors validate(ActionMapping mapping,HttpServletRequest request){
        ActionErrors errors = new ActionErrors();
        boolean loginEntered = false;
        boolean passwordEntered = false;
        // Determine if login has been entered.
        if (login != null && login.trim().length() > 0) {
            loginEntered = true;
        }
        // Determine if password has been entered.
        if (password != null && password.trim().length() > 0) {
            passwordEntered = true;
        }
        // Validate that either login or password has been entered.
        if (!loginEntered) {
            errors.add(null,new ActionMessage("errors.login.required"));
        }
        if(!passwordEntered){
            errors.add(null,new ActionMessage("errors.password.required"));
        }
        
        return errors;
    }
}
