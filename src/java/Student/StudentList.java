/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Student;

import DB.db_connection;
import QandA.ViewQuestionList;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shreya gandhi
 */
public class StudentList extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */

            db_connection db = new db_connection();
            String Query = "select * from information_schema.student_info";
            db.pstmt = db.con.prepareStatement(Query);
            db.rs = db.pstmt.executeQuery();
             List<Student_data> list = new ArrayList<>();
            while (db.rs.next()) {
                
                Student_data s = new Student_data();
                s.setEmail(db.rs.getString("email"));
                s.setDob(db.rs.getString("sdob"));
                s.setName(db.rs.getString("sname"));
                s.setQua(db.rs.getString("squa"));
                s.setGender(db.rs.getString("sgender"));
                s.setContact(db.rs.getString("scontact"));
                s.setPassword(db.rs.getString("spassword"));
                list.add(s);
            }
             
            request.setAttribute("ListofStudents",list);
            request.getRequestDispatcher("student_list.jsp").forward(request,response);

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
