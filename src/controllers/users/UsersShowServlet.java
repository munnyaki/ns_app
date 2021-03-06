package controllers.users;
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
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UsersShowservlet
 */
@WebServlet("/users/show")
public class UsersShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersShowServlet() {
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
        User u = em.find(User.class, Integer.parseInt(request.getParameter("id")));

        List<Question> questions = em.createNamedQuery("getSomeQuestions", Question.class)
                .setParameter("user", u)
                .setFirstResult(5 * (page - 1))
                .setMaxResults(5)
                .getResultList();

        List<Answer> answers = em.createNamedQuery("getSomeAnswers2", Answer.class)
                .setParameter("user", u)
                .setFirstResult(5 * (page - 1))
                .setMaxResults(5)
                .getResultList();

        em.close();

        request.setAttribute("user", u);
        request.setAttribute("questions", questions);
        request.setAttribute("answers", answers);
        request.setAttribute("page", page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/show.jsp");
        rd.forward(request, response);
    }

}


