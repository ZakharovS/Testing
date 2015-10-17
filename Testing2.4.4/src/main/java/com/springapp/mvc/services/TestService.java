package com.springapp.mvc.services;

import com.springapp.mvc.domain.CurrTest;
import com.springapp.mvc.domain.Test;

import java.util.LinkedList;
import java.util.List;

public interface TestService {
    List<Test> takeTests();

    void saveCurrTest(Integer userID, Integer testID, Integer questionID, Integer answerID);

    void saveResultTest(Integer userID, Integer testID, Integer result);

    List<CurrTest> takeCurrTest(Integer userID, Integer testID);

    LinkedList<Object> takeTestId(Integer userID);

    LinkedList<Object> takeResultTest(Integer userID);

    LinkedList<Object> takeTestTime(Integer userID);

    void clearCurrTest(Integer userID, Integer testID);

    void saveTest(String test);

    void deleteTest(Integer testId);

    void deleteQuestion(Integer questionId);
}
