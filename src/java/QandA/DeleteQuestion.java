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


/**
 *
 * @author shreya gandhi
 */
public class DeleteQuestion extends HttpServlet {

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
        String queid = request.getParameter("queid");
        String sub = request.getParameter("sub");
          System.out.println(queid+" "+sub);
        PrintWriter out = response.getWriter();
        try {
            if (queid != null) {
                db_connection db = new db_connection();
                String Query = "select * from information_schema.quest_mstr where queid=? and subject=?";
                String DelQuery = "delete from information_schema.quest_mstr where queid=? and subject=?";
                db.pstmt = db.con.prepareStatement(Query);
                db.pstmt.setString(1, queid);
                db.pstmt.setString(2, sub);
              
                
                db.rs = db.pstmt.executeQuery();
                if (db.rs.next()) {
                    db.pstmt = db.con.prepareStatement(DelQuery);
                    db.pstmt.setString(1, queid);
                    db.pstmt.setString(2, sub);
                    int i = db.pstmt.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg", "Question Successfully Deleted");
RequestDispatcher dispatcher = request.getRequestDispatcher("msg_success.jsp");
dispatcher.forward(request, response);
                        
                    } else {
                         request.setAttribute("msg", "Error In Question Deletion !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                      request.setAttribute("msg", "Wrong Question Id !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                }
            } 
        } catch (Exception e) {
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