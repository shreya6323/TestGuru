
import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author shreya gandhi
 */
@WebServlet(urlPatterns = {"/StudentLogin"})
public class StudentLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String name = (String)request.getParameter("username");
        String password=(String)request.getParameter("pswd");
       
        try{
        {
           if(name != null || password != null)
           {
               db_connection db = new db_connection();
               String query = "Select * from information_schema.student_info where sname=? and spassword=?";
               db.pstmt = db.con.prepareStatement(query);
               db.pstmt.setString(1, name);
               db.pstmt.setString(2, password);
             
               db.rs = db.pstmt.executeQuery();
               
               if(db.rs.next())
               {
                       
                   HttpSession session = request.getSession();
                   session.setAttribute("Student", name);
                   session.setMaxInactiveInterval(5*60);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");// here it will not destroy req object unlike sendRedirect and also url will get change on client side while using sendRedirect
    dispatcher.forward(request, response);
  
               }
               else
               {
                   request.setAttribute("msg", "Error !");
            RequestDispatcher dispatcher = request.getRequestDispatcher("msg_page.jsp");
            dispatcher.forward(request, response);
                   
               }
               
               
               
               
               
           }
           
        }
    }
        catch(Exception e)
        {
            System.err.print(e);
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
    }
    
}


