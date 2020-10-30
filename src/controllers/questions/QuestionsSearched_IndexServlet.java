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
 * Servlet implementation class QuestionsSearched_IndexServlet
 */
@WebServlet("/questions/searched_index")
public class QuestionsSearched_IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsSearched_IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        List<Category> categories = em.createNamedQuery("getAllCategories", Category.class)
                .getResultList();
        String part_of_title = request.getParameter("part_of_title");
        List<Question> questions = em.createNamedQuery("getSearchedQuestions", Question.class)
                .setParameter("part_of_title", part_of_title)
                .getResultList();
        long questions_count = (long)em.createNamedQuery("getSearchedQuestionsCount", Long.class)
                .setParameter("part_of_title", part_of_title)
                .getSingleResult();
         em.close();
        request.setAttribute("categories", categories);
        request.setAttribute("questions", questions);
        request.setAttribute("questions_count", questions_count);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/searched_index.jsp");
        rd.forward(request, response);
    }

}
