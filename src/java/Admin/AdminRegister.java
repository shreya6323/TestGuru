package Admin;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
public class AdminRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "0");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("Email"),
                username = request.getParameter("Username"),
                qua = request.getParameter("Qua"),
                password = request.getParameter("Password");
        HttpSession session = request.getSession();

        try {
            if (email != null
                    || username != null
                    || qua != null
                    || password != null) {

                db_connection db = new db_connection();
                String Query = "insert into information_schema.admin_register values(?, ?, ?, ?)";

                db.pstmt = db.con.prepareStatement(Query);
                db.pstmt.setString(1, email);
                db.pstmt.setString(4, username);
                db.pstmt.setString(2, qua);
                db.pstmt.setString(3, password);
                int i1 = db.pstmt.executeUpdate();
                if (i1 > 0) {
                    session.setAttribute("Admin", username);
                    session.setMaxInactiveInterval(5 * 60);
                    response.sendRedirect("admin_home.jsp");
                } else {
                    response.sendRedirect("admin_register.jsp");
                }

            }
        } catch (IOException | SQLException e) {
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
