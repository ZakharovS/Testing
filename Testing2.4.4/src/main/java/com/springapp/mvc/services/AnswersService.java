package com.springapp.mvc.services;

import com.springapp.mvc.domain.Answers;

import java.util.LinkedList;
import java.util.List;

public interface AnswersService {
    List<Answers> takeAnswers(int question_id);

    LinkedList<Object> takeCurrAnswer(Integer userID, Integer testID);

    LinkedList<Object> takeCorrectAnswer(Integer userID, Integer testID);

    Integer result(Integer userID, Integer testID);

    void saveAnswers(Integer questionId, String answer1, String answer2, String answer3, String answer4);

    void saveOneAnswer(Integer questionId, String answer);

    void saveCorrect(Integer correctId);
}
