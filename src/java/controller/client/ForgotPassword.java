/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.client;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import model.Email;
import model.EmailUtils;

public class ForgotPassword extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPassword</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPassword at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
        @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
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
        try {
            String emailAddress = request.getParameter("email");
            
            AccountDAO dao = new AccountDAO();
            Account account = dao.getAccountInfoByEmail(emailAddress);
            if (account == null) {
                request.setAttribute("error", "Email wrong!");
            } else {
                Email email = new Email();
                email.setFrom("nofomtre@gmail.com");
                email.setFromPassword("ektotbrpyuycdflr");
                email.setTo(emailAddress);
                email.setSubject("[Plant Shop] Reset your password");
                StringBuilder sb = new StringBuilder();
                sb.append("Hello ").append("<br>");
                sb.append("This is your password: <b>").append(account.getPassword()).append(" </b> <br>");
                email.setContent(sb.toString());
                EmailUtils.send(email);
                request.setAttribute("mess", "Password has been sent to your email. Please check!");
            }
        } catch (Exception e) {
        }
        request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
    }
}