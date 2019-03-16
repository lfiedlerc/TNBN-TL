/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.beans;

import java.util.Hashtable;


/**
 *
 * @author lfiedlerc
 */
public class StudentBean extends Entity {
    private Hashtable<String,String> reportCard = null;

    public Hashtable<String,String> getReportCard() {
        return reportCard;
    }

    public void setReportCard(Hashtable<String,String> reportCard) {
        this.reportCard = reportCard;
    }
    
}
