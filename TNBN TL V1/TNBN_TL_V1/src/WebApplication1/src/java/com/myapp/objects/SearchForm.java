/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.objects;

/**
 *
 * @author lfiedlerc
 */
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
public class SearchForm extends ActionForm
{
private String name = null;
private String ssNum = null;
private List results = null;
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
public void setResults(List results) {
this.results = results;
}
public List getResults() {
return results;
}
// Reset form fields.
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request)
{
name = null;
ssNum = null;
results = null;
}

// Validate form data.
    @Override
    public ActionErrors validate(ActionMapping mapping,
HttpServletRequest request)
{
ActionErrors errors = new ActionErrors();
boolean nameEntered = false;
boolean ssNumEntered = false;
// Determine if name has been entered.
if (name != null && name.length() > 0) {
nameEntered = true;
}
// Determine if social security number has been entered.
if (ssNum != null && ssNum.length() > 0) {
ssNumEntered = true;
}
/* Validate that either name or social security number
has been entered. */
if (!nameEntered && !ssNumEntered) {
errors.add(null,new ActionMessage("error.search.criteria.missing"));
}

/* Validate format of social security number if
it has been entered. */
if (ssNumEntered && !isValidSsNum(ssNum.trim())) {
errors.add("ssNum",
new ActionMessage("error.search.ssNum.invalid"));
}
return errors;
}
// Validate format of social security number.
private static boolean isValidSsNum(String ssNum) {
if (ssNum.length() < 11) {
return false;
}
for (int i = 0; i < 11; i++) {
if (i == 3 || i == 6) {
if (ssNum.charAt(i) != '-') {
return false;
}
} else if ("0123456789".indexOf(ssNum.charAt(i)) == -1) {
return false;
}

}
return true;
}
}