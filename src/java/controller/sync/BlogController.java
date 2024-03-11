package controller.sync;

import dao.BlogCategoryDAO;
import dao.BlogDAO;
import dao.PlantDAO;
import dao.TagsDAO;
import model.Blog;
import model.Plant;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author nofom
 */
public class BlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Map<Integer, String> listBlogCategories = new BlogCategoryDAO().getRandomNBlogCategories(10);
            Map<Integer, String> listBlogTags = new TagsDAO().getRandomNTags(10);
            List<Blog> listBlogs = new BlogDAO().getRandomNBlogs(3);
            List<Plant> listPlants = new PlantDAO().getRandomNPlants(4);
            
            request.setAttribute("listBlogs", listBlogs);
            request.setAttribute("listPlants", listPlants);
            request.getSession().setAttribute("listBlogCategories", listBlogCategories);
            request.getSession().setAttribute("listBlogTags", listBlogTags);
            request.getSession().setAttribute("destPage", "blog");
            request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (Exception e) {
            log("Error at BlogController");
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
