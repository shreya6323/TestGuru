package ForgotPassword;

import DB.db_connection;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class send_otp extends HttpServlet {
      String user ;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String toemail = request.getParameter("email");
        request.getSession().setAttribute("email", toemail);
       
        try {
            String Query = "Select * from information_schema.admin_register where email = ?";
            db_connection db = new db_connection();
            db.pstmt = db.con.prepareStatement(Query);
            db.pstmt.setString(1, toemail);

            ResultSet rs = db.pstmt.executeQuery();
            if (rs.next()) {
              
                user = rs.getString("username");
                String token = UUID.randomUUID().toString();
                request.getSession().setAttribute(toemail, token);
                sendResetEmail(toemail, token,request,response);
                response.sendRedirect("msg_page.jsp?msg=Click the link sent to your email address to reset the password!");

            } else {
                // Assuming you have a PrintWriter object called out
                request.getRequestDispatcher("admin_login.html?error_message=This email address does not exist in the system !").forward(request, response);

            }

        } catch (Exception e) {
            System.out.println(e);
             request.setAttribute("msg", "Error !");
            RequestDispatcher dispatcher = request.getRequestDispatcher("msg_page.jsp");
            dispatcher.forward(request, response);
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

    private void sendResetEmail(String email, String token,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String from = "gandhishreya311@gmail.com";
        final String email_pass = "yeny bvrf zphq cftv";
        // Set up mail properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Create a session with an authenticator
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(from, email_pass);
            }
        });

        try {
            // Create a message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress());
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Reset your TestGuru Password.");
            // Assuming you have an 'email' variable containing the user's email address

// Assuming 'token' contains the generated token
// Construct the email content with the reset link including both token and email
            String resetLink = "http://localhost:8080/TestGuru/resetPassword?token=" + token + "&email=" + email;
            String emailContent
                    = "Dear "+user+","+"\nWe hope this message finds you well.\n\n"+
                  
                    "It seems you've requested a password reset for your TestGuru account. To proceed with resetting your password, please follow the link below:\n\n"
                   
                    + resetLink
                    + "\n\n"
                    + "If you didn't initiate this request, please disregard this email, and your account will remain secure.\n\n"
                  
                    + "Thank you for using TestGuru!\n\n"
                  
                    + "Best regards,\n"
                    + "The TestGuru Team." ;
            System.out.println(emailContent);
// Set the email content to your message
            message.setText(emailContent);

            // Send the message
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (Exception e) {
            e.printStackTrace();
             request.setAttribute("msg", "Error !");
            RequestDispatcher dispatcher = request.getRequestDispatcher("msg_page.jsp");
            dispatcher.forward(request, response);
        }
    }

}
