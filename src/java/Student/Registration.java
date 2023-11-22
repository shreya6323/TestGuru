package Student;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Registration", urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("email"),
                sname = request.getParameter("name"),
                squa = request.getParameter("qua"),
                sdob = request.getParameter("dob"),
                sgender = request.getParameter("gender"),
                scont = request.getParameter("cont"),
                password = request.getParameter("pswd"),
                cpassword = request.getParameter("cpswd");
        HttpSession session = request.getSession();
        if (session.getAttribute("Student") != null) {
            response.sendRedirect("admin_home.jsp");
        }

        try {
            if (email != null
                    || sname != null
                    || squa != null
                    || sgender != null
                    || password != null
                    || cpassword != null) {
                if (password.equals(cpassword)) {
                    db_connection db = new db_connection();
                    String Query = "insert into information_schema.student_info values(?, ?, ?, ?, ?, ?, ?)";
                    String Query1 = "insert into information_schema.login values(?, ?, 'Student')";
                    db.pstmt = db.con.prepareStatement(Query);
                    db.pstmt.setString(1, email);
                    db.pstmt.setString(2, sname);
                    db.pstmt.setString(3, squa);
                    db.pstmt.setString(4, sdob);
                    db.pstmt.setString(5, sgender);
                    db.pstmt.setString(6, scont);
                    db.pstmt.setString(7, password);
                    int i1 = db.pstmt.executeUpdate();
                    db.pstmt = db.con.prepareStatement(Query1);
                    db.pstmt.setString(1, sname);
                    db.pstmt.setString(2, password);
                    int i2 = db.pstmt.executeUpdate();
                    if (i1 > 0 && i2 > 0) {
                        session.setAttribute("Student", sname);
                        session.setMaxInactiveInterval(5 * 60);

                        response.sendRedirect("index.jsp");

                    } else {
                        request.setAttribute("msg", "Error !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("msg_page.jsp");
                        dispatcher.forward(request, response);
                    }

                } else {

                    response.sendRedirect("Registration.html");
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
