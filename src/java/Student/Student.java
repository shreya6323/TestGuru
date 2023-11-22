package Student;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name = "Student", urlPatterns = {"/Student"})
public class Student extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Object name = session.getAttribute("Student");

        String msg = request.getParameter("msg"),
                msgtype = request.getParameter("msgtype"),
                choice = request.getParameter("choice");
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("Student.jsp").include(request, response);
       PrintWriter out = response.getWriter();
            if (msg != null) {
                if (msgtype != null) {
                    if (msgtype.equals("success")) 
                    {
                       request.getRequestDispatcher("msg_success.jsp");
                    } else if (msgtype.equals("error")) {
                        request.getRequestDispatcher("msg_error.jsp");
                    } else if (msgtype.equals("delete")) {
                       request.getRequestDispatcher("msg_delete.jsp");
                    }
                }
            }
           
            if (name != null) {
                if (choice != null) {
                    switch (choice) {
                        case "Exam":
                            RequestDispatcher rd = request.getRequestDispatcher("Exam");
                            rd.include(request, response);
                            break;
                        case "StudentResult":
                            RequestDispatcher rd1 = request.getRequestDispatcher("StudentResult");
                            rd1.include(request, response);
                            break;
                        case "GiveFeedback":
                            RequestDispatcher rd2 = request.getRequestDispatcher("GiveFeedback");
                            rd2.include(request, response);
                            break;
                        case "Profile":
                            RequestDispatcher rd5 = request.getRequestDispatcher("Profile");
                            rd5.include(request, response);
                            break;
                        case "UpdateProfile":
                            RequestDispatcher rd4 = request.getRequestDispatcher("UpdateProfile");
                            rd4.include(request, response);
                            break;
                        case "ChangePassword":
                            RequestDispatcher rd6 = request.getRequestDispatcher("ChangePassword");
                            rd6.include(request, response);
                            break;
                        default:
                            RequestDispatcher rd3 = request.getRequestDispatcher("StudentDashboard");
                            rd3.include(request, response);
                    }
                } else {
                    response.sendRedirect("Student?choice=StudentDashboard");

                }
            } else {
                response.sendRedirect("Login");
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
     * @return a String containing serSvlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}