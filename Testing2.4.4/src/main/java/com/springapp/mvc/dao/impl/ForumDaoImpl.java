package com.springapp.mvc.dao.impl;

import com.springapp.mvc.dao.ForumDao;
import com.springapp.mvc.domain.Forum;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ForumDaoImpl implements ForumDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public List<Forum> showPosts() {
        Criteria criteria = openSession().createCriteria(Forum.class);
        return criteria.list();
    }

    @Override
    public void saveMessage(String message, String userName) {
        Forum forum = new Forum();
        forum.setPost(message);
        forum.setUserName(userName);
        openSession().save(forum);
    }

    @Override
    public void deleteMessage(Integer id) {
        Forum forum = (Forum) openSession().createCriteria(Forum.class).add(Restrictions.eq("id", id))
                .uniqueResult();
        openSession().delete(forum);
    }
}
