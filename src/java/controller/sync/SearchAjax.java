/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sync;

import dao.CategoryDAO;
import dao.PlantDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Plant;

public class SearchAjax extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        /* TODO output your page here. You may use following sample code. */

//        final int PAGE_SIZE = 6;
//        int page = 1;
//        if (pagenumber != null) {
//                page = Integer.parseInt(pagenumber);
//            }

        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");

        String txtSearch = request.getParameter("txt");
        String priceMin = request.getParameter("priceMin");
        String priceMax = request.getParameter("priceMax");
        int cid = Integer.parseInt(request.getParameter("cid"));
        String pagenumber = request.getParameter("pagenumber");

        PlantDAO dao = new PlantDAO();
        List<Plant> list = dao.searchAjax(txtSearch, priceMin, priceMax, cid);

        Map<Integer, String> lc = new CategoryDAO().getCategories();

        for (Plant plant : list) {
            String linkImg = "PlantDetailController?pid=" + plant.getId();
            out.println(
                    "<div class=\"col mb-5\">\n"
                    + "                                        <div class=\"card h-100\">\n"
                    + "                                            <!-- Sale badge-->\n"
                    + "                                            <div class=\"position-absolute bg-black text-white default-cursor\"\n"
                    + "                                                 style=\"padding: 5px 15px; left: 15px; top: 15px;\">\n"
                    + (plant.getStatus() == 1 ? "Available" : "Sold out")
                    + "                                            </div>\n"
                    + "                                            <!-- Product image-->  \n"
                    + "                                            <a href=" + linkImg + " class=\"img-h-350\"><img src=" + plant.getImgPath() + " class=\"img-h-350\" alt=\"Plant IMG\" class=\"img-fluid\" /></a>\n"
                    + "                                            <!-- Product details-->\n"
                    + "                                            <div class=\"card-body p-2\">\n"
                    + "                                                <div class=\"text-center product-info\">\n"
                    + "                                                    <div class=\"category ms-3 mt-3 text-start\">\n"
                    + ((!lc.isEmpty()) ? lc.get(plant.getCategoryId()) : "")
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"name\">\n"
                    + "                                                        <a href=" + linkImg + " class=\"text-decoration-none text-black\">\n"
                    + plant.getName()
                    + "                                                        </a>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex justify-content-center small text-warning mb-2\">\n"
                    + "                                                        <div class=\"bi-star-fill\"></div>\n"
                    + "                                                        <div class=\"bi-star-fill\"></div>\n"
                    + "                                                        <div class=\"bi-star-fill\"></div>\n"
                    + "                                                        <div class=\"bi-star-fill\"></div>\n"
                    + "                                                        <div class=\"bi-star-fill\"></div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"price text-center fs-4 fw-bold default-cursor text-black\">\n"
                    + plant.getPrice()
                    + "                                                    $</div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                            <!-- Product actions-->\n"
                    + "                                            <div class=\"card-footer p-4 pt-0 border-top-0 bg-transparent\">\n"
                    + "                                                <div class=\"text-center\">\n"
                    + "                                                    <a onclick=\"addToCartAsync(" + plant.getId() + ")\" class=\"btn btn-outline-dark mt-auto w-50\"><i\n"
                    + "                                                            class=\"bi bi-cart-plus-fill\"></i></a>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SearchAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
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
