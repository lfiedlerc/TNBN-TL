package us.knexus.codetest.jsp;

public class StringProcessor {

    /**
     * Return the pig latin translation of a word.
     *
     * @param input the word to translate
     * @return the pig latin translation
     */
    public String processString(String input) {
        String translation = null;
        String firstChar = input.substring(0, 1);
        // If the first character is a vowel...
        if (firstChar.equalsIgnoreCase("a")
                || firstChar.equalsIgnoreCase("e")
                || firstChar.equalsIgnoreCase("i")
                || firstChar.equalsIgnoreCase("o")
                || firstChar.equalsIgnoreCase("u")
                || firstChar.equalsIgnoreCase("y"))
            translation = input + "ay";
        else
            translation = input.substring(1) + firstChar + "ay";
        return translation;
    } //mend

} //cend
