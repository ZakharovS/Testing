package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.QuestionsDao;
import com.springapp.mvc.domain.Question;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class QuestionsDaoImpl implements QuestionsDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public ArrayList<Object> takeListQuestionsId(int testID){
        String sql = "Select QUESTIONS.ID from QUESTIONS where QUESTIONS.TEST_ID = :testid";
        SQLQuery query = openSession().createSQLQuery(sql);
        query.setParameter("testid", testID);
        return (ArrayList<Object>) query.list();
    }

    @Override
    public Question takeQuestion(Integer id) {
        return (Question) openSession().get(Question.class, id);
    }

    @Override
    public void saveQuestion(Question question){
        openSession().save(question);
    }

    @Override
    public Integer takeQuestionId(String question){
        String sql = "Select QUESTIONS.ID from QUESTIONS where QUESTIONS.QUESTION = :question";
        SQLQuery query = openSession().createSQLQuery(sql);
        query.setParameter("question", question);
        return (Integer) query.list().get(0);
    }
}