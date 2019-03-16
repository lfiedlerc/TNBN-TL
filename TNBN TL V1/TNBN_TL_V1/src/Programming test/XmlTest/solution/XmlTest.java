/**
 * @author      Lindsey Fiedler
 */

import java.io.File;
import java.io.IOException;
import nu.xom.ParsingException;
import nu.xom.*;

public class XmlTest{
	public static void main(String [] args){
		String xmlFile = "../band.xml";
		
		printGuitarPlayers(xmlFile);
	}
	
	/**
	 * This function parses an xml file and prints out the names of all 
	 * the musician elements who have an "instrument" child element where 
	 * the text value is guitar.
	 *
	 * @param  xmlFile The name of the .xml file 
	 * @throws ParsingException if the xml document is malformed
	 * @throws IOException if it cannot read the file
	 */
	public static void printGuitarPlayers(String xmlFile){
		try{
			Builder parser = new Builder(); /* A builder that will read and parse the xml file */
			Document doc = parser.build(new File(xmlFile)); /* A Document object built from the xml file */
			
			Element root = doc.getRootElement(); /* Get the root element of the xml file */
			Elements musicians = root.getChildElements("musician"); /* Get all "musician" child elements */
			
			System.out.println("The band has the following guitar players: \n");
			
			/* Check each musician to see if they play guitar */
			for(int i = 0; i < musicians.size(); ++i){
				if(playsGuitar(musicians.get(i))){
					System.out.println(musicians.get(i).getAttribute("name").getValue());
				}
			}
			
		}catch (ParsingException ex) {
			System.err.println("File is malformed.");
		}
		catch (IOException ex) {
			System.err.println("Could not read " + xmlFile);
		}
	}
	
	/**
	 * Returns true if the musician element has an "instrument" child element where
	 * the text value is guitar and case is ignored. 
	 *
	 * @param  musician an xml element 
	 * @return true if the musician has an "instrument" child element with the text value 'guitar'
	 */
	private static boolean playsGuitar(Element musician){
		Elements instruments = musician.getChildElements("instrument"); /* Get all "instrument" child elements */
		
		/* Check each instrument element for a text value equal to guitar */ 
		for(int i = 0; i < instruments.size(); ++i){
			if(instruments.get(i).getValue().trim().toUpperCase().equals("GUITAR")){
				return true;
			}
		}
		
		return false;
	}
}