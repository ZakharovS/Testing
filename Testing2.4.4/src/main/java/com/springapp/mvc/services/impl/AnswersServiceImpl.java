package com.springapp.mvc.services.impl;

import com.springapp.mvc.dao.AnswersDao;
import com.springapp.mvc.domain.Answers;
import com.springapp.mvc.domain.CurrTest;
import com.springapp.mvc.domain.Question;
import com.springapp.mvc.services.AnswersService;
import com.springapp.mvc.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service
@Transactional
public class AnswersServiceImpl implements AnswersService {

    @Autowired
    private AnswersDao answersDao;

    @Autowired
    private TestService testService;

    @Override
    public List<Answers> takeAnswers(int question_id) {
        Question question = new Question();
        question.setId(question_id);
        List<Answers> list = answersDao.takeAnswers(question);
        return list;
    }

    @Override
    public LinkedList<Object> takeCurrAnswer(Integer userID, Integer testID) {
        LinkedList<Object> currAnswers = new LinkedList<Object>();
        List<CurrTest> list = testService.takeCurrTest(userID, testID);
        for (CurrTest currTest : list) {
            if (currTest.getAnswerId() != 0) {
                currAnswers.add(answersDao.takeCurrAnswer(currTest.getAnswerId()).getAnswer());
            } else {
                currAnswers.add("The answer is not selected");
            }
        }
        return currAnswers;
    }

    @Override
    public LinkedList<Object> takeCorrectAnswer(Integer userID, Integer testID) {
        LinkedList<Object> correctAnswers = new LinkedList<Object>();
        List<CurrTest> list = testService.takeCurrTest(userID, testID);
        for (CurrTest currTest : list) {
            Question question = new Question();
            question.setId(currTest.getQuestionId());
            correctAnswers.add(answersDao.takeCorrectAnswer(question).getAnswer());
        }
        return correctAnswers;
    }

    @Override
    public Integer result(Integer userID, Integer testID) {
        int i = 0;
        List<CurrTest> list = testService.takeCurrTest(userID, testID);
        for (CurrTest currTest : list) {
            if (currTest.getAnswerId() != 0) {
                if (answersDao.takeCurrAnswer(currTest.getAnswerId()).getCorrect() == 1) {
                    i++;
                }
            }
        }
        return i;
    }

    @Override
    public void saveAnswers(Integer questionId, String answer1, String answer2, String answer3, String answer4) {
        saveOneAnswer(questionId, answer1);
        saveOneAnswer(questionId, answer2);
        if (answer3 != "") {
            saveOneAnswer(questionId, answer3);
        }
        if (answer4 != "") {
            saveOneAnswer(questionId, answer4);
        }
    }

    @Override
    public void saveOneAnswer(Integer questionId, String answer) {
        Answers answers = new Answers();
        answers.setQuestion(questionId);
        answers.setAnswer(answer);
        answersDao.saveAnswer(answers);
    }

    @Override
    public void saveCorrect(Integer correctId) {
        answersDao.saveCorrect(correctId);
    }

}
