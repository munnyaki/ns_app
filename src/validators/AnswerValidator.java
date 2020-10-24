package validators;

import java.util.ArrayList;
import java.util.List;

import models.Answer;

public class AnswerValidator {
    public static List<String> validate(Answer a) {
        List<String> errors = new ArrayList<String>();

        List<String> errors_sub = _validateAnswer_content(a.getAnswer_content());
        if(!errors_sub.equals("")){
            errors.addAll(errors_sub);
        }
        return errors;
    }

    private static List<String> _validateAnswer_content(String answer_content){
        List<String> errors_sub = new ArrayList<String>();
        if(answer_content == null || answer_content.equals("")){
            errors_sub.add("enter the advice");
            errors_sub.add("提案を入力してください");
        }
        return errors_sub;
    }
}
