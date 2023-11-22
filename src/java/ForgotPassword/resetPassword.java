/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ForgotPassword;

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
public class resetPassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String newpass,toemail;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         newpass = request.getParameter("newpass");
          System.out.println(newpass);
        if(newpass == null)
        {
          
            toemail = request.getParameter("email");
            System.out.println(toemail);
           response.sendRedirect("reset.jsp");
           
        }
        else
        {
            
             changepass(request,response);
        }

    }
 public void changepass(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
 {
     try{
      db_connection db = new db_connection();
                    String Query = "update information_schema.admin_register set password=? where email = ?";
                    db.pstmt = db.con.prepareStatement(Query);
                    db.pstmt.setString(1, newpass);
                    db.pstmt.setString(2, toemail);
                    int a = db.pstmt.executeUpdate();
                    if(a > 0)
                    {
                     request.setAttribute("reset","true");
                     request.getRequestDispatcher("admin_login.html").forward(request,response);
                    }
                    else
                    {
                     
                        response.sendRedirect("req_email.html");
                    }               
 }
 catch(Exception e)
 {
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
