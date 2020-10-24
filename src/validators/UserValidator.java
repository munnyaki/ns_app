package validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {

    public static List<String> validate(User u, Boolean name_duplicate_check_flag, Boolean password_check_flag) {
        List<String> errors = new ArrayList<String>();


        List<String> errors_sub = _validateName(u.getName(), name_duplicate_check_flag);
        if(!errors_sub.equals("")){
            errors.addAll(errors_sub);
        }

        List<String> errors_sub2 = _validatePassword(u.getPassword(), password_check_flag);
        if(!errors_sub2.equals("")) {
            errors.addAll(errors_sub2);
        }

        return errors;
    }


    private static List<String> _validateName(String name, Boolean name_duplicate_check_flag) {
        List<String> errors_sub = new ArrayList<String>();
        if(name == null || name.equals("")){
            errors_sub.add("enter the user name");
            errors_sub.add("ユーザー名を入力してください");
        }
        if(name_duplicate_check_flag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long)em.createNamedQuery("checkRegisteredName", Long.class)
                    .setParameter("name", name)
                    .getSingleResult();
            em.close();
            if(users_count > 0) {
                errors_sub.add("already used the other user");
                errors_sub.add("すでに使われているユーザー名です");
                }
        }

        return errors_sub;

    }

    private static List<String> _validatePassword(String password, Boolean password_check_flag) {
        List<String> errors_sub2 = new ArrayList<String>();
        if(password_check_flag && (password == null || password.equals(""))) {
            errors_sub2.add("enter the user password");
            errors_sub2.add("パスワードを入力してください");
        }
        return errors_sub2;

    }



}
