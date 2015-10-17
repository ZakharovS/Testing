package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.AnswersDao;
import com.springapp.mvc.domain.Answers;
import com.springapp.mvc.domain.Question;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AnswersDaoImpl implements AnswersDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Answers> takeAnswers(Question question) {
        Criteria criteria = openSession().createCriteria(Answers.class)
                .add(Restrictions.eq("question", question));
        return criteria.list();
    }

    @Override
    public Answers takeCurrAnswer(Integer answerID) {
        Criteria criteria = openSession().createCriteria(Answers.class)
                .add(Restrictions.eq("id", answerID));
        return (Answers) criteria.uniqueResult();
    }

    @Override
    public Answers takeCorrectAnswer(Question question) {
        Criteria criteria = openSession().createCriteria(Answers.class)
                .add(Restrictions.eq("question", question))
                .add(Restrictions.eq("correct", 1));
        return (Answers) criteria.uniqueResult();
    }

    @Override
    public void saveAnswer(Answers answers) {
        openSession().save(answers);
    }

    @Override
    public void saveCorrect(Integer correctId) {
        String sql = "Update ANSWERS set ANSWERS.CORRECT = 1 where ANSWERS.ID = " + correctId.toString();
        String sss = sql;
        SQLQuery query = openSession().createSQLQuery(sss);
        query.executeUpdate();
    }
}
