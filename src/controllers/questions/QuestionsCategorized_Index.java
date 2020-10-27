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

import models.Question;
import utils.DBUtil;

/**
 * Servlet implementation class QuestionsCategorized_Index
 */
@WebServlet("/questions/categorized_index")
public class QuestionsCategorized_Index extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsCategorized_Index() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Question> questions = em.createNamedQuery("getAllQuestions", Question.class)
                .setFirstResult(10 * (page - 1))
                .setMaxResults(10)
                .getResultList();

        long questions_count = (long)em.createNamedQuery("getQuestionsCount", Long.class)
                .getSingleResult();

         em.close();

        request.setAttribute("questions", questions);
        request.setAttribute("questions_count", questions_count);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/categorized_index.jsp");
        rd.forward(request, response);
    }

}
