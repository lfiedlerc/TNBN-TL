package us.knexus.codetest.servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import us.knexus.codetest.jsp.StringProcessor;

/**
 *
 * @author lfiedlerc
 */
public class StringProcessingController extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String input = request.getParameter("in-text").toString().trim(); /* Get the text to translate */
        String [] words = input.split(" "); /* Split the input into seperate words */
        StringBuilder output = new StringBuilder(); /* A StringBuilder for the output */
        StringProcessor str = new StringProcessor(); /* A StringProcessor object */

        /* Call processString for each word */
        for(int i = 0; i < words.length; ++i){
            output.append(str.processString(words[i]));
            if(i < words.length - 1){
                output.append(" ");
            }
        }

        request.setAttribute("output", output.toString()); /* Set a HttpServletRequest attribute to hold the output */

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp"); /* Get the RequestDispatcher for the page "index.jsp" */
        dispatcher.forward(request, response); /* Forward the request back to the "index.jsp" page */
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
