/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class RevenueMonthServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        InvoiceDAO dao = new InvoiceDAO();
        double total1 = dao.totalMoneyMonth(1);
        double total2 = dao.totalMoneyMonth(2);
        double total3 = dao.totalMoneyMonth(3);
        double total4 = dao.totalMoneyMonth(4);
        double total5 = dao.totalMoneyMonth(5);
        double total6 = dao.totalMoneyMonth(6);
        double total7 = dao.totalMoneyMonth(7);
        double total8 = dao.totalMoneyMonth(8);
        double total9 = dao.totalMoneyMonth(9);
        double total10 = dao.totalMoneyMonth(10);
        double total11 = dao.totalMoneyMonth(11);
        double total12 = dao.totalMoneyMonth(12);

        request.setAttribute("total1", total1);
        request.setAttribute("total2", total2);
        request.setAttribute("total3", total3);
        request.setAttribute("total4", total4);
        request.setAttribute("total5", total5);
        request.setAttribute("total6", total6);
        request.setAttribute("total7", total7);
        request.setAttribute("total8", total8);
        request.setAttribute("total9", total9);
        request.setAttribute("total10", total10);
        request.setAttribute("total11", total11);
        request.setAttribute("total12", total12);

        request.getRequestDispatcher("/admin/revenuemonth.jsp").forward(request, response);
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
