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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author shreya gandhi
 */
public class ViewQuestionList extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            db_connection db = new db_connection();
            String Query = "select * from information_schema.quest_mstr where subject=?";
            db.pstmt = db.con.prepareStatement(Query);
            db.pstmt.setString(1, request.getParameter("sub"));

            db.rs = db.pstmt.executeQuery();

            List<Question> list = new ArrayList<>();
            while (db.rs.next()) {
                Question q = new Question();
                q.setQueid(db.rs.getInt("queid"));
                q.setQue(db.rs.getString("que"));
                q.setOp1(db.rs.getString("op1"));
                q.setOp2(db.rs.getString("op2"));
                q.setOp3(db.rs.getString("op3"));
                q.setOp4(db.rs.getString("op4"));
                q.setAns(db.rs.getString("ans"));
                q.setSub(db.rs.getString("subject"));
                list.add(q);
            }
            if(list != null)
            {
          
            request.setAttribute("questionList",list);
            request.getRequestDispatcher("view_ques_list.jsp").forward(request, response);
            }
            db.rs.close();
            db.pstmt.close();
            db.con.close();
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
