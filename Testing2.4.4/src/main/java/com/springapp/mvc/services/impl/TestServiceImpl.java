package com.springapp.mvc.services.impl;

import com.springapp.mvc.dao.TestDao;
import com.springapp.mvc.dao.impl.TestDaoImpl;
import com.springapp.mvc.domain.CurrTest;
import com.springapp.mvc.domain.ResultTest;
import com.springapp.mvc.domain.Test;
import com.springapp.mvc.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service
@Transactional
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;

    @Override
    public List<Test> takeTests() {
        List<Test> list = testDao.takeTests();
        return list;
    }

    @Override
    public void saveCurrTest(Integer userID, Integer testID, Integer questionID, Integer answerID) {
        CurrTest currTest = new CurrTest();
        currTest.setUserId(userID);
        currTest.setTestId(testID);
        currTest.setQuestionId(questionID);
        currTest.setAnswerId(answerID);
        testDao.saveCurrentTest(currTest);
    }

    @Override
    public void saveResultTest(Integer userID, Integer testID, Integer result) {
        ResultTest resultTest = new ResultTest();
        resultTest.setUserId(userID);
        resultTest.setTestId(testID);
        resultTest.setResult(result);
        testDao.saveResultTest(resultTest);
    }

    @Override
    public List<CurrTest> takeCurrTest(Integer userID, Integer testID) {
        List<CurrTest> list = testDao.takeCurrTest(userID, testID);
        return list;
    }

    @Override
    public LinkedList<Object> takeTestId(Integer userID) {
        LinkedList<Object> result = new LinkedList<Object>();
        List<ResultTest> list = testDao.takeResultTest(userID);
        for (ResultTest resultTest : list) {
            result.add(resultTest.getTestId());
        }
        return result;
    }

    @Override
    public LinkedList<Object> takeResultTest(Integer userID) {
        LinkedList<Object> result = new LinkedList<Object>();
        List<ResultTest> list = testDao.takeResultTest(userID);
        for (ResultTest resultTest : list) {
            result.add(resultTest.getResult());
        }
        return result;
    }

    @Override
    public LinkedList<Object> takeTestTime(Integer userID) {
        LinkedList<Object> result = new LinkedList<Object>();
        List<ResultTest> list = testDao.takeResultTest(userID);
        for (ResultTest resultTest : list) {
            result.add(resultTest.getTime());
        }
        return result;
    }

    @Override
    public void clearCurrTest(Integer userID, Integer testID) {
        testDao.clearCurrTest(userID, testID);
    }

    @Override
    public void saveTest(String test) {
        testDao.saveTest(test);
    }

    @Override
    public void deleteTest(Integer testId) {
        Test test = new Test();
        test.setId(testId);
        testDao.deleteTest(test);
    }

    @Override
    public void deleteQuestion(Integer questionId) {
        testDao.deleteQuestion(questionId);
    }

}
