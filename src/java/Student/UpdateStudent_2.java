/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Student;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author shreya gandhi
 */
public class UpdateStudent_2 extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
              String email = request.getParameter("email");
              String name = request.getParameter("name"),
                qua = request.getParameter("qua"),
                dob = request.getParameter("dob"),
                gender = request.getParameter("gender");
              System.out.println(email);
              try{
              if ( email != null && name != null
                    && qua != null
                    && gender != null
                    && dob != null) {
                  db_connection db = new db_connection();
                  System.out.println("check");
                String Query = "update information_schema.student_info set sname=?, squa=?, sdob=?, sgender=? where email=?";
                db.pstmt = db.con.prepareStatement(Query);
                System.out.println(email+" "+name+" "+qua+" "+gender+" "+dob);
                db.pstmt.setString(1, name);
                db.pstmt.setString(2, qua);
                db.pstmt.setString(3, dob);
                db.pstmt.setString(4, gender);
                db.pstmt.setString(5, email);
                int i = db.pstmt.executeUpdate();
                if (i > 0) {
                     request.setAttribute("msg", "Student info successfully updated");
RequestDispatcher dispatcher = request.getRequestDispatcher("msg_success.jsp");
dispatcher.forward(request, response);
                } else {
                    request.setAttribute("msg", "Error in Student Updation !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                }
            }
    }
    
              catch(Exception e)
              {
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

