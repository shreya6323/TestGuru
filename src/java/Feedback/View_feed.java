
import DB.db_connection;
import Feedback.stu_feedback;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author shreya gandhi
 */
public class View_feed extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            db_connection db = new db_connection();
            String Query = "select * from information_schema.feedback";
            db.pstmt = db.con.prepareStatement(Query);
            db.rs = db.pstmt.executeQuery();
            List<stu_feedback> list = new ArrayList<>();
            while (db.rs.next()) {

                stu_feedback s = new stu_feedback();
                s.setEmail(db.rs.getString("email"));
                s.setUsername(db.rs.getString("username"));
                s.setMsg(db.rs.getString("feedback"));
                list.add(s);
            }

            request.setAttribute("feedbackList", list);
            request.getRequestDispatcher("view_feedback.jsp").forward(request, response);

        } catch (SQLException ex) {
          System.out.print(ex);
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
