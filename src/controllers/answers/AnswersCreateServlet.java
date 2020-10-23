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
import models.Question;
import models.User;
import utils.DBUtil;
import validators.AnswerValidator;
/**
 * Servlet implementation class AnswersCreateServlet
 */
@WebServlet("/answers/create")
public class AnswersCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswersCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");

        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();
            Question q = em.find(Question.class, Integer.parseInt(request.getParameter("id")));
            Answer a = new Answer();
            a.setUser((User)request.getSession().getAttribute("login_user"));
            a.setQuestion(q);
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            a.setCreated_at(currentTime);
            a.setUpdated_at(currentTime);
            a.setAnswer_content(request.getParameter("answer_content"));

            List<String> errors = AnswerValidator.validate(a);
            if(errors.size() > 0) {
                em.close();
                request.setAttribute("errors", errors);
                request.setAttribute("answer", a);
                request.setAttribute("nowquestion", q);
                request.setAttribute("_token",request.getSession().getId());

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/answers/new.jsp");
                rd.forward(request, response);
            } else {
                em.getTransaction().begin();
                em.persist(a);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "succeed in creating your advice");
                request.getSession().setAttribute("flush2", "あなたの提案を作成しました");
                response.sendRedirect(request.getContextPath() + "/questions/show?id=" + q.getId());
            }



        }

    }

}
