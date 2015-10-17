package com.springapp.mvc.services.impl;

import com.springapp.mvc.dao.QuestionsDao;
import com.springapp.mvc.dao.impl.QuestionsDaoImpl;
import com.springapp.mvc.domain.CurrTest;
import com.springapp.mvc.domain.Question;
import com.springapp.mvc.services.QuestionsService;
import com.springapp.mvc.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class QuestionsServiceImpl implements QuestionsService {

    @Autowired
    private QuestionsDao questionsDao;

    @Autowired
    private TestService testService;

    @Override
    public Question takeQuestion(Integer id) {
        return questionsDao.takeQuestion(id);
    }

    private HashMap<String, ArrayList<Integer>> hashMap = new HashMap<String, ArrayList<Integer>>();

    @Override
    public Integer takeQuestionById(Integer testID, String username) throws Exception {
        String userName = username;
        ArrayList<Object> list = questionsDao.takeListQuestionsId(testID);
        int i = list.size();
        Random generator = new Random();
        int id = 0;
        id = generator.nextInt(i - 1);
        ArrayList<Integer> arrlist = new ArrayList<Integer>();
        if (hashMap.containsKey(userName)) {
            arrlist.addAll(hashMap.get(userName));
        }
        boolean b = false;

        if (hashMap.size() == 0) {
            b = true;
            arrlist.add(id);
            hashMap.put(userName, arrlist);
        }
        while (!b) {
            if (!arrlist.contains(id)) {
                arrlist.add(id);
                hashMap.put(userName, arrlist);
                break;
            } else {
                id = generator.nextInt(i - 1);
            }
        }
        return (Integer) list.get(id);
    }

    @Override
    public void clearMap(String username) {
        hashMap.remove(username);
    }

    @Override
    public LinkedList<Object> showQuestion(Integer userID, Integer testID) {
        LinkedList<Object> questions = new LinkedList<Object>();
        List<CurrTest> list = testService.takeCurrTest(userID, testID);
        for (CurrTest currTest : list) {
            questions.add(takeQuestion(currTest.getQuestionId()).getQuestion());
        }
        return questions;
    }

    @Override
    public void saveQuestion(String que, Integer testId) {
        Question question = new Question();
        question.setTest(testId);
        question.setQuestion(que);
        questionsDao.saveQuestion(question);
    }

    @Override
    public Integer takeQuestionId(String question) {
        return questionsDao.takeQuestionId(question);
    }

}
