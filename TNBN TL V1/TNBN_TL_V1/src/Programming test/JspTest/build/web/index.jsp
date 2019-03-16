<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>JSP Test</title>
        <script src="lib/jquery-1.7.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var validate = function(){
                var data = $("#inTxt").val();
                if(isEmpty(data) || !isAlphabetic(data)){
                    alert("Input must be alphabetic and a nonempty string. ");
                    return false;
                }
                return true;
            }
            
            function isEmpty(data) {
                if(data.replace(/\s/g,"") == ""){
                    return true;
                }
                return false;
            }

            function isAlphabetic(data) {
                var validChars = "abcdefghijklmnñopqrstuvwxyzABCDEFGHIJKLMNÑOPQRSTUVWXYZ ";
                var rs = true;
                var character;

                for (i = 0; i < data.length; i++) {
                    character = data.charAt(i);
                    if (validChars.indexOf(character) == -1) {
                        rs = false;
                        break;
                    }
                }
                return rs;
            }
            
            $(document).ready(function() {
		$("#sbmBtn").click(validate); 		
            });
		
        </script>
    </head>
    
    <body>
        
        <h1>Translate</h1>
        
        <!-- Validate the input and send it to a controller servlet -->
        <form action="StringProcessingController" method="GET" >
            <input type="text" id="inTxt" name="in-text" size="40" />
            <button type="submit" id="sbmBtn">Translate</button>
        </form>
        
        <h3>Pig Latin translation:</h3> ${output} <!-- Display the translation -->
        
    </body>
</html>
