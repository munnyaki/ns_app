package validators;

import java.util.ArrayList;
import java.util.List;

import models.Answer;

public class AnswerValidator {
    public static List<String> validate(Answer a) {
        List<String> errors = new ArrayList<String>();

        String answer_content_error = _validateAnswer_content(a.getAnswer_content());
        if(!answer_content_error.equals("")){
            errors.add(answer_content_error);
        }
        return errors;
    }

    private static String _validateAnswer_content(String answer_content){
        if(answer_content == null || answer_content.equals("")){
            return "内容を入力してください";
        }
        return "";
    }
}
