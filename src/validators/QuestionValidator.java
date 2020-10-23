package validators;

import java.util.ArrayList;
import java.util.List;

import models.Question;
public class QuestionValidator {
    public static List<String> validate(Question q) {
        List<String> errors = new ArrayList<String>();

        List<String> errors_sub = _validateQuestion_title(q.getQuestion_title());
        if(!errors_sub.equals("")){
            errors.addAll(errors_sub);
        }

        List<String> errors_sub2 = _validateQuestion_content(q.getQuestion_content());
        if(!errors_sub2.equals("")){
            errors.addAll(errors_sub2);
        }
        return errors;
    }
    private static List<String> _validateQuestion_title(String question_title){
        List<String> errors_sub = new ArrayList<String>();
        if(question_title == null || question_title.equals("")){
            errors_sub.add("enter the sammary of a issue");
            errors_sub.add("課題の要約を入力してください");
            return errors_sub;

        }
        return errors_sub;
    }
    private static List<String> _validateQuestion_content(String question_content){
        List<String> errors_sub2 = new ArrayList<String>();
        if(question_content == null || question_content.equals("")){
            errors_sub2.add("enter the issue");
            errors_sub2.add("課題を入力してください");
            return errors_sub2;
        }
        return errors_sub2;
    }

}
