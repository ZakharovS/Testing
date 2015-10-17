package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Question;

import java.util.ArrayList;

public interface QuestionsDao {
    ArrayList<Object> takeListQuestionsId(int testID);

    Question takeQuestion(Integer id);

    void saveQuestion(Question question);

    Integer takeQuestionId(String question);
}
