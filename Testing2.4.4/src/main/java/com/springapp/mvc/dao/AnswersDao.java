package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Answers;
import com.springapp.mvc.domain.Question;

import java.util.List;

public interface AnswersDao {
    List<Answers> takeAnswers(Question question);

    Answers takeCurrAnswer(Integer answerID);

    Answers takeCorrectAnswer(Question question);

    void saveAnswer(Answers answers);

    void saveCorrect(Integer correctId);
}
