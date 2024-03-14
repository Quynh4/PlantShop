/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dao.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="Day", urlPatterns={"/Day"})
public class Day extends HttpServlet {
   

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO dao = new OrderDAO();
        double total1 = dao.totalMoneyDay(1);
        double total2 = dao.totalMoneyDay(2);
        double total3 = dao.totalMoneyDay(3);
        double total4 = dao.totalMoneyDay(4);
        double total5 = dao.totalMoneyDay(5);
        double total6 = dao.totalMoneyDay(6);
        double total7 = dao.totalMoneyDay(7);

        request.setAttribute("totalMoney1", total1);
        request.setAttribute("totalMoney2", total2);
        request.setAttribute("totalMoney3", total3);
        request.setAttribute("totalMoney4", total4);
        request.setAttribute("totalMoney5", total5);
        request.setAttribute("totalMoney6", total6);
        request.setAttribute("totalMoney7", total7);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
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
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
