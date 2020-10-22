package controllers.answers;

import java.io.IOException;

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
 * Servlet implementation class AnswersNewServlet
 */
@WebServlet("/answers/new")
public class AnswersNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswersNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        EntityManager em = DBUtil.createEntityManager();
        Question q = em.find(Question.class, Integer.parseInt(request.getParameter("id")));

        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("nowquestion", q);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/answers/new.jsp");
        rd.forward(request, response);
    }

}
