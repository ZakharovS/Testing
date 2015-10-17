package com.springapp.mvc.dao;

import com.springapp.mvc.domain.CurrTest;
import com.springapp.mvc.domain.ResultTest;
import com.springapp.mvc.domain.Test;

import java.util.List;

public interface TestDao {
    List<Test> takeTests();

    void saveCurrentTest(CurrTest currTest);

    void saveResultTest(ResultTest resultTest);

    void saveTest(String test);

    List<CurrTest> takeCurrTest(Integer userID, Integer testID);

    List<ResultTest> takeResultTest(Integer userID);

    void clearCurrTest(Integer userID, Integer testID);

    void deleteTest(Test test);

    void deleteQuestion(Integer questionId);
}
