package controller.admin;

import dao.OrderDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nofom
 */
public class ChangeOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String action = request.getParameter("action");
            if (action != null) {
                String orderIdTxt = request.getParameter("orderId");
                switch (action) {
                    case "2":
                        if (orderIdTxt != null) {
                            boolean check = new OrderDAO().finishOrder(Integer.parseInt(orderIdTxt), 2);
                            if (check) {
                                request.setAttribute("MSG_SUCCESS", "You have successfully completed orders!");
                            } else {
                                request.setAttribute("MSG_ERROR", "An error occurred! Completed order failed!");
                            }
                        } else {
                            request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
                        }
                        break;
                    default:
                        if (orderIdTxt != null) {
                            boolean check = new OrderDAO().updateOrderStatus(Integer.parseInt(orderIdTxt), Integer.parseInt(action));
                            if (check) {
                                request.setAttribute("MSG_SUCCESS", "You have successfully updated orders!");
                            } else {
                                request.setAttribute("MSG_ERROR", "An error occurred! Update order failed!");
                            }
                        } else {
                            request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
                        }
                        break;
                }
            } else {
                request.setAttribute("MSG_ERROR", "Oops, something went wrong! Try later!");
            }
        } catch (Exception e) {
            log("Error at ChangeOrderController: " + e.toString());
        } finally {
            request.getRequestDispatcher("AdminManageOrderController").forward(request, response);
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
