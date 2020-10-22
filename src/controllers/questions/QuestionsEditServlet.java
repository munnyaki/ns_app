package controllers.questions;

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
 * Servlet implementation class QuestionsEditServlet
 */
@WebServlet("/questions/edit")
public class QuestionsEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Question q = em.find(Question.class, Integer.parseInt(request.getParameter("id")));


        em.close();

        request.setAttribute("question", q);
        request.setAttribute("_token",request.getSession().getId());
        if(q != null){
        request.getSession().setAttribute("question_id", q.getId());
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/edit.jsp");
        rd.forward(request, response);

    }

}
