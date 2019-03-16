/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Pablo
 */

package LIPS;

public class AttributeValue {

       private String attribute; /* The name of the attribute*/
       private String attributeStr; /* For nominal values*/
       private Double value; /* For numeric values*/


    public AttributeValue(String at, Double va){
        attribute=at;
        value=va;
    }

    public AttributeValue(String at, String va){
        attribute=at;
        attributeStr=va;
    }

    public String getAttribute() {
        return attribute;
    }

    public void setAttribute(String attribute) {
        this.attribute = attribute;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    @Override
    public String toString(){
        return attribute+"="+value;
    }


        @Override
    public boolean equals(Object obj) {
        if (obj instanceof AttributeValue)
        {
        AttributeValue otro= (AttributeValue) obj;

        if (value.compareTo(otro.getValue())==0 && attribute.compareTo(otro.getAttribute())==0)
                return true;
        return false;
        }
        return false;
    }

    @Override
    public int hashCode() {
        return 0;
    }

}
