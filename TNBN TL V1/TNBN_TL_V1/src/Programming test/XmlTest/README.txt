Contents
========
band.xml

Instructions
============

Included is an XML file of the structure defined below.

Use whatever Java XML library (e.g., JDOM, dom4j) you prefer to parse the XML document and print (i.e. to System.out) the value of the "name" attribute of every musician element which has an "instrument" child element with the text value of "guitar".

Be sure you include the jar file for the library you used along with the source code of your solution.

Structure of the XML File
=========================
 
   <!-- Band is the root element -->
   <band>
      <!-- 0 or more musician child elements, which have two attributes, founder and name -->
      <musician founder="true" name="foo">
         <!-- 1 or more instrument elements -->
         <instrument>guitar</instrument>
      </musician>
   </band>
