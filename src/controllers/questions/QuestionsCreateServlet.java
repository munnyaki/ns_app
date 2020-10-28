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

import models.Category;
import models.Question;
import models.User;
import utils.DBUtil;
import validators.QuestionValidator;

/**
 * Servlet implementation class QuestionsCreateServlet
 */
@WebServlet("/questions/create")
public class QuestionsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionsCreateServlet() {
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

                Category c = em.find(Category.class , 11);
                Question q = new Question();
                q.setCategory((Category)c);
                q.setQuestion_title(request.getParameter("question_title"));
                q.setQuestion_content(request.getParameter("question_content"));

                Timestamp currentTime = new Timestamp(System.currentTimeMillis());
                 q.setCreated_at(currentTime);
                 q.setUpdated_at(currentTime);

                 q.setUser((User)request.getSession().getAttribute("login_user"));


                 List<String> errors = QuestionValidator.validate(q);
                 if(errors.size() > 0){
                     em.close();

                     request.setAttribute("_token", request.getSession().getId());
                     request.setAttribute("question", q);
                     request.setAttribute("errors", errors);

                     RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/questions/new.jsp");
                     rd.forward(request, response);

                 } else {
                     em.getTransaction().begin();
                     em.persist(q);
                     em.getTransaction().commit();
                     request.getSession().setAttribute("flush", "succeed in creating your issue");
                     request.getSession().setAttribute("flush2", "あなたの課題を作成しました");
                     response.sendRedirect(request.getContextPath() + "/questions/show?id=" + q.getId() );
                 }
            }
    }

}