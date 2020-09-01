package controllers.answers;

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

import models.Answer;
import utils.DBUtil;
import validators.AnswerValidator;

/**
 * Servlet implementation class AnswersUpdateServlet
 */
@WebServlet("/answers/update")
public class AnswersUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswersUpdateServlet() {
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

            Answer a = em.find(Answer.class, (Integer)(request.getSession().getAttribute("answer_id")));

            a.setAnswer_content(request.getParameter("answer_content"));
            a.setUpdated_at(new Timestamp(System.currentTimeMillis()));

            List<String> errors = AnswerValidator.validate(a);
            if( errors.size() > 0){
                em.close();
                request.setAttribute("errors", errors);
                request.setAttribute("answer", a);
                request.setAttribute("_token", request.getSession().getId());

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/answers/edit.jsp");
                rd.forward(request, response);

            } else {
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().removeAttribute("answer_id");

                response.sendRedirect(request.getContextPath() + "/answers/new");
            }
        }
    }
}

