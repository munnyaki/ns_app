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
 * Servlet implementation class QuestionIndexServlet
 */
@WebServlet("/questions/index")
public class QuestionsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsIndexServlet() {
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
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        long questions_count = (long)em.createNamedQuery("getQuestionsCount", Long.class)
                .getSingleResult();

        em.close();

        request.setAttribute("questions", questions);
        request.setAttribute("questions_count", questions_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null){
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
            request.setAttribute("flush2", request.getSession().getAttribute("flush2"));
            request.getSession().removeAttribute("flush2");
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/index.jsp");
        rd.forward(request, response);

    }
}