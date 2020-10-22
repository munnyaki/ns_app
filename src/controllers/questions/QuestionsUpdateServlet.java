package controllers.questions;

import java.io.IOException;
import java.sql.Timestamp;
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
import validators.QuestionValidator;

/**
 * Servlet implementation class QuestionsUpdateServlet
 */
@WebServlet("/questions/update")
public class QuestionsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            Question q = em.find(Question.class, (Integer)(request.getSession().getAttribute("question_id")));

            q.setQuestion_title(request.getParameter("question_title"));
            q.setQuestion_content(request.getParameter("question_content"));
            q.setUpdated_at(new Timestamp(System.currentTimeMillis()));

        List<String> errors = QuestionValidator.validate(q);
        if(errors.size() > 0) {
            em.close();
            request.setAttribute("_token", request.getSession().getId());
            request.setAttribute("question", q);
            request.setAttribute("errors", errors);

            RequestDispatcher rd  = request.getRequestDispatcher("/WEB-INF/views/questions/edit.jsp");
            rd.forward(request, response);
        } else {
            em.getTransaction().begin();
            em.getTransaction().commit();
            em.close();
            request.getSession().setAttribute("flush", "succeed in updating your issue");
            request.getSession().setAttribute("flush2", "あなたの課題を更新しました");
            response.sendRedirect(request.getContextPath() + "/questions/show?id=" + q.getId());
            request.getSession().removeAttribute("question_id");

        }



        }
    }

}
