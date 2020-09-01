package validators;

import java.util.ArrayList;
import java.util.List;

import models.Question;

public class QuestionValidator {
    public static List<String> validate(Question q) {
        List<String> errors = new ArrayList<String>();

        String question_title_error = _validateQuestion_title(q.getQuestion_title());
        if(!question_title_error.equals("")){
            errors.add(question_title_error);
        }

        String question_content_error = _validateQuestion_content(q.getQuestion_content());
        if(!question_content_error.equals("")){
            errors.add(question_content_error);

        }
        return errors;
    }

    private static String _validateQuestion_title(String question_title){
        if(question_title == null || question_title.equals("")){
            return "タイトルを入力してください。";
        }
        return "";
    }

    private static String _validateQuestion_content(String question_content){
        if(question_content == null || question_content.equals("")){
            return "内容を入力してください。";

        }
        return "";
    }

}
