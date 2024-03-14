/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dao.AccountDAO;
import dao.CategoryDAO;
import dao.OrderDAO;
import dao.PlantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import model.Account;
import model.Order;
import model.Plant;

public class Statistic extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();

            Map<Integer, String> listCategories = new CategoryDAO().getCategories();
            List<Plant> listPlants = new PlantDAO().getAllPlants();
            List<Account> listAccounts = new AccountDAO().getAccounts();
            List<Order> listOrders = new OrderDAO().getAllOrders();

            OrderDAO dao = new OrderDAO();
            int wd1 = dao.weekdayRevenue(1);
            int wd2 = dao.weekdayRevenue(2);
            int wd3 = dao.weekdayRevenue(3);
            int wd4 = dao.weekdayRevenue(4);
            int wd5 = dao.weekdayRevenue(5);
            int wd6 = dao.weekdayRevenue(6);
            int wd7 = dao.weekdayRevenue(7);
            
            request.setAttribute("wd1", wd1);
            request.setAttribute("wd2", wd2);
            request.setAttribute("wd3", wd3);
            request.setAttribute("wd4", wd4);
            request.setAttribute("wd5", wd5);
            request.setAttribute("wd6", wd6);
            request.setAttribute("wd7", wd7);

            int month1 = dao.monthRevenue(1);
            int month2 = dao.monthRevenue(2);
            int month3 = dao.monthRevenue(3);
            int month4 = dao.monthRevenue(4);
            int month5 = dao.monthRevenue(5);
            int month6 = dao.monthRevenue(6);
            int month7 = dao.monthRevenue(7);
            int month8 = dao.monthRevenue(8);
            int month9 = dao.monthRevenue(9);
            int month10 = dao.monthRevenue(10);
            int month11 = dao.monthRevenue(11);
            int month12 = dao.monthRevenue(12);

            request.setAttribute("month1", month1);
            request.setAttribute("month2", month2);
            request.setAttribute("month3", month3);
            request.setAttribute("month4", month4);
            request.setAttribute("month5", month5);
            request.setAttribute("month6", month6);
            request.setAttribute("month7", month7);
            request.setAttribute("month8", month8);
            request.setAttribute("month9", month9);
            request.setAttribute("month10", month10);
            request.setAttribute("month11", month11);
            request.setAttribute("month12", month12);

            session.setAttribute("listCategories", listCategories);
            request.setAttribute("listPlants", listPlants);
            request.setAttribute("listAccounts", listAccounts);
            request.setAttribute("listOrders", listOrders);
            request.setAttribute("destPage", "dashboard");
        } catch (Exception e) {
            log("Error at AdminHomeController: " + e.toString());
        } finally {
            request.getRequestDispatcher("statistic.jsp").forward(request, response);
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
