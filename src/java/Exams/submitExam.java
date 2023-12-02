/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Exams;

import DB.db_connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;

public class submitExam extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        double score = 0;
        int correct_ques = 0;
        int total_ques = 0;
        int incorrect_ques = 0;
        try {
            db_connection db = new db_connection();
            String Query = "select * from information_schema.quest_mstr where  subject = ?";
            String q1 = "insert into information_schema.exam values(?,?,?,?,?,?)";
            db.pstmt = db.con.prepareStatement(Query);
            db.pstmt.setString(1, (String) request.getSession().getAttribute("sub"));
            ResultSet rs = db.pstmt.executeQuery();
            
            
            while (rs.next()) {
                total_ques++;

                String ans = rs.getString("ans");
                String stu_ans = request.getParameter(rs.getString("queid"));

                if (ans.equals(stu_ans)) {

                    correct_ques++;
                }
            }

            score = (double)((double) correct_ques / total_ques) * 100;
            incorrect_ques = total_ques - correct_ques;
            
            String final_score = String.format("%.2f", score);
            
            db.pstmt = db.con.prepareStatement(q1);
           //  db.pstmt.setString(1,(String)request.getSession().getAttribute("Student") );
           db.pstmt.setString(1,"Student" );
               db.pstmt.setString(2,final_score );
                 db.pstmt.setInt(3,total_ques );
                   db.pstmt.setInt(4,correct_ques );
                   db.pstmt.setString(5,new java.util.Date().toString() );
                    db.pstmt.setString(6,(String)request.getSession().getAttribute("sub") );
                      int a = db.pstmt.executeUpdate();
                      if(a <= 0)
                      {
                          request.getSession().setAttribute("msg","Error !");
                          request.getRequestDispatcher("msg_page.jsp").forward(request,response);
                      }
            request.getSession().setAttribute("score", final_score);
            request.getSession().setAttribute("total_ques", total_ques);
            request.getSession().setAttribute("correct_ques", correct_ques);
            request.getSession().setAttribute("incorrect_ques", incorrect_ques);
            request.getRequestDispatcher("result.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
