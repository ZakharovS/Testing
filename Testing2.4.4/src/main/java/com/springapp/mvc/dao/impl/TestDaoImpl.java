package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.TestDao;
import com.springapp.mvc.domain.*;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestDaoImpl implements TestDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Test> takeTests() {
        Criteria criteria = openSession().createCriteria(Test.class);
        return criteria.list();
    }

    @Override
    public void saveCurrentTest(CurrTest currTest) {
        openSession().save(currTest);
    }

    @Override
    public void saveResultTest(ResultTest resultTest) {
        openSession().save(resultTest);
    }

    @Override
    public void saveTest(String test) {
        Test newTest = new Test();
        newTest.setName(test);
        openSession().save(newTest);
    }

    @Override
    public List<CurrTest> takeCurrTest(Integer userID, Integer testID) {
        Criteria criteria = openSession().createCriteria(CurrTest.class)
                .add(Restrictions.eq("userId", userID))
                .add(Restrictions.eq("testId", testID));
        return criteria.list();
    }

    @Override
    public List<ResultTest> takeResultTest(Integer userID) {
        Criteria criteria = openSession().createCriteria(ResultTest.class)
                .add(Restrictions.eq("userId", userID));
        return criteria.list();
    }

    @Override
    public void clearCurrTest(Integer userID, Integer testID) {
        String sql = "Delete from CURRTEST " +
                "where user_id = :userID " +
                "and test_id = :testID ";
        SQLQuery query = openSession().createSQLQuery(sql);
        query.setParameter("testID", testID)
                .setParameter("userID", userID);
        query.executeUpdate();
    }

    @Override
    public void deleteTest(Test test) {
        Criteria criteria2 = openSession().createCriteria(Question.class).add(Restrictions.eq("test", test));
        List<Question> question = criteria2.list();
        for (Question que : question) {
            deleteQuestion(que.getId());
        }
        Criteria criteria = openSession().createCriteria(Test.class).add(Restrictions.eq("id", test.getId()));
        Test delTest = (Test) criteria.uniqueResult();
        openSession().delete(delTest);
    }

    @Override
    public void deleteQuestion(Integer questionId) {
        deleteAnswers(questionId);
        Criteria criteria = openSession().createCriteria(Question.class).add(Restrictions.eq("id", questionId));
        Question question = (Question) criteria.uniqueResult();
        openSession().delete(question);
    }

    private void deleteAnswers(Integer questionId) {
        Question question = new Question();
        question.setId(questionId);
        Criteria criteria = openSession().createCriteria(Answers.class).add(Restrictions.eq("question", question));
        List<Answers> answers = criteria.list();
        for (Answers ans : answers) {
            openSession().delete(ans);
        }
    }
}