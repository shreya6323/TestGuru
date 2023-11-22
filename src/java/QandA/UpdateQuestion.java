/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package QandA;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shreya gandhi
 */
public class UpdateQuestion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String queid = request.getParameter("queid"),
                que = request.getParameter("que"),
                opt1 = request.getParameter("opt1"),
                opt2 = request.getParameter("opt2"),
                opt3 = request.getParameter("opt3"),
                opt4 = request.getParameter("opt4"),
                ans = request.getParameter("ans"),
                sub = request.getParameter("sub");
      
        PrintWriter out = response.getWriter();

        try {
            if (ans == null) {
                if (queid != null) {
                    db_connection db = new db_connection();
                    String Query = "select * from information_schema.quest_mstr where queid=? and subject = ?";
                    db.pstmt = db.con.prepareStatement(Query);
                    db.pstmt.setString(1, queid);
                    db.pstmt.setString(2, sub);

                    db.rs = db.pstmt.executeQuery();
                    if (db.rs.next()) {

                        request.setAttribute("update_ques_info", db.rs);
                        request.getRequestDispatcher("update_ques.jsp").include(request, response);
                    } else {
                         request.setAttribute("msg", "Wrong Question Id !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                    }
                }
            } else if (queid != null
                    || que != null
                    || opt1 != null
                    || opt2 != null
                    || opt3 != null
                    || opt4 != null
                    || ans != null
                    || sub != null) {
                if (ans.equals(opt1) || ans.equals(opt2) || ans.equals(opt3) || ans.equals(opt4)) {
                    db_connection db = new db_connection();
                    String Query = "update information_schema.quest_mstr set que=?, op1=?, op2=?, op3=?, op4=?, ans=? where queid=? and subject = ?";
                    db.pstmt = db.con.prepareStatement(Query);

                    db.pstmt.setString(1, que);
                    db.pstmt.setString(2, opt1);
                    db.pstmt.setString(3, opt2);
                    db.pstmt.setString(4, opt3);
                    db.pstmt.setString(5, opt4);
                    db.pstmt.setString(6, ans);
                    db.pstmt.setString(7, queid);
                    db.pstmt.setString(8, sub);

                    int i = db.pstmt.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg", "Question Successfully Updated");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_success.jsp");
                        dispatcher.forward(request, response);
                    } else {
                          request.setAttribute("msg", "Error is question updation !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {

                    request.setAttribute("msg", "Try Again!,Your ans is not matching with any of the given options.");
                    System.out.println("Message before forwarding: " + request.getAttribute("msg"));

                    RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                    dispatcher.forward(request, response);

                }
            }

        } catch (IOException e) {
             System.out.println(e);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
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
