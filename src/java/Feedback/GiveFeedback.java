/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Feedback;

import DB.db_connection;
import QandA.ViewQuestionList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shreya gandhi
 */
public class GiveFeedback extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("email");
            String feedback = request.getParameter("message");
            String username = (String)request.getSession().getAttribute("Student");
            db_connection db = new db_connection();

            String Query = "insert into information_schema.feedback (username,email,feedback) values (?,?,?)";
            db.pstmt = db.con.prepareStatement(Query);
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, email);
            db.pstmt.setString(1, feedback);
            int a = db.pstmt.executeUpdate();

            if (a > 0) {
                request.setAttribute("msg", "Feedback submitted !");
                RequestDispatcher dispatcher = request.getRequestDispatcher("student_msg_success.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("msg", "Error !");
                RequestDispatcher dispatcher = request.getRequestDispatcher("student_msg_error.jsp");
                dispatcher.forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ViewQuestionList.class.getName()).log(Level.SEVERE, null, ex);
           request.setAttribute("msg", "Error !");
            RequestDispatcher dispatcher = request.getRequestDispatcher("msg_page.jsp");
            dispatcher.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
