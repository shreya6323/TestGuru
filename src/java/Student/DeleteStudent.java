package Student;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteStudent extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("delemail");
        try {
            if (email != null) {
                db_connection db = new db_connection();
                String Query = "select * from information_schema.student_info where email=?";
                String DelQuery = "delete from information_schema.student_info where email=?";
                db.pstmt = db.con.prepareStatement(Query);
                db.pstmt.setString(1, email);
                db.rs = db.pstmt.executeQuery();
                if (db.rs.next()) {
                    db.pstmt = db.con.prepareStatement(DelQuery);
                    db.pstmt.setString(1, email);
                    int i = db.pstmt.executeUpdate();
                    if (i > 0) {
                        request.setAttribute("msg", "Student Successfully Deleted");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_success.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        request.setAttribute("msg", "Error in Student deletion");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_error.jsp");
                        dispatcher.forward(request, response);
                    }
                } else {
                    request.setAttribute("msg", "This Email id does not exist !");
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
