package controllers.answers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Answer;
import utils.DBUtil;

/**
 * Servlet implementation class AnswersEditServlet
 */
@WebServlet("/answers/edit")
public class AnswersEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswersEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Answer a = em.find(Answer.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("_token", request.getSession().getId());
        request.setAttribute("answer", a);
        request.getSession().setAttribute("answer_id", a.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/answers/edit.jsp");
        rd.forward(request, response);
    }

}
