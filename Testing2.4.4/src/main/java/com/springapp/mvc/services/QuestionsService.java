package com.springapp.mvc.services;

import com.springapp.mvc.domain.Question;

import java.util.LinkedList;

public interface QuestionsService {
    Question takeQuestion(Integer id);

    Integer takeQuestionById(Integer testID, String username) throws Exception;

    void clearMap(String username);

    LinkedList<Object> showQuestion(Integer userID, Integer testID);

    void saveQuestion(String que, Integer testId);

    Integer takeQuestionId(String question);
}
