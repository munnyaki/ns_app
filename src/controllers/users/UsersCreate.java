package controllers.users;

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

import models.User;
import utils.DBUtil;
import utils.EncryptUtil;
import validators.UserValidator;

/**
 * Servlet implementation class UsersCreate
 */
@WebServlet("/users/create")
public class UsersCreate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsersCreate() {
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

            User u = new User();

            u.setName(request.getParameter("name"));
            try {
                u.setAge(Integer.parseInt(request.getParameter("age")));
            }
            catch (NumberFormatException e) {}
            u.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                            request.getParameter("password"),
                            (String)this.getServletContext().getAttribute("pepper")
                            )
                    );
            u.setIntroduction(request.getParameter("introduction"));

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            u.setCreated_at(currentTime);
            u.setUpdated_at(currentTime);

            List<String> errors = UserValidator.validate(u, true, true);
            if(errors.size() > 0) {
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/new.jsp");
                rd.forward(request, response);
            }else {
                em.getTransaction().begin();
                em.persist(u);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "succeed in creating user");
                request.getSession().setAttribute("flush2", "ユーザーを作成しました");
                request.getSession().setAttribute("login_user", u);
                response.sendRedirect(request.getContextPath() + "/questions/index");

            }

        }
    }

}
