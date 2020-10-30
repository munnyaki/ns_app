package controllers.questions;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Category;
import models.Question;
import utils.DBUtil;

/**
 * Servlet implementation class QuestionsNewServlet
 */
@WebServlet("/questions/new")
public class QuestionsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        EntityManager em = DBUtil.createEntityManager();
        List<Category> categories = em.createNamedQuery("getAllCategories", Category.class)
                .getResultList();
        Question q = new Question();

        request.setAttribute("question", q);
        request.setAttribute("categories", categories);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/new.jsp");
        rd.forward(request, response);

    }

}
