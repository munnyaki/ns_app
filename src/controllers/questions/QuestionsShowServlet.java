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

import models.Answer;
import models.Question;
import utils.DBUtil;

/**
 * Servlet implementation class QuestionsShowServlet
 */
@WebServlet("/questions/show")
public class QuestionsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();

        Question q = em.find(Question.class, Integer.parseInt(request.getParameter("id")));

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(Exception e) {
            page = 1;
        }
        List<Answer> answers = em.createNamedQuery("getSomeAnswers", Answer.class)
                .setParameter("question", q)
                .setFirstResult(10 * (page - 1))
                .setMaxResults(10)
                .getResultList();
        long answers_count = (long)em.createNamedQuery("getSomeAnswersCount", Long.class)
                .setParameter("question", q)
                .getSingleResult();
        em.close();

        request.setAttribute("answers", answers);
        request.setAttribute("answers_count", answers_count);
        request.setAttribute("page", page);
        request.setAttribute("nowquestion", q);
        if(request.getSession().getAttribute("flush") != null){
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
            request.setAttribute("flush2", request.getSession().getAttribute("flush2"));
            request.getSession().removeAttribute("flush2");
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/show.jsp");
        rd.forward(request, response);

    }

}
