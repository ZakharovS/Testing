package com.springapp.mvc.dao.impl;


import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.domain.Authorization;
import com.springapp.mvc.domain.Joke;
import com.springapp.mvc.domain.User;
import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SessionFactory sessionFactory;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public void saveUser(User user, Integer roleId, Integer enable){
        openSession().save(user);
        user.setEnabled(enable);
        Authorization authorization = new Authorization();
        authorization.setId(roleId);
        user.setAuthorization(authorization);
    }

    @Override
    public User checkUser(User user){
        Criteria criteria = openSession().createCriteria(User.class)
                .add(Restrictions.eq("username", user.getUserName()));
        return (User) criteria.uniqueResult();
    }

    @Override
    public int takeUserId(String userName){
        Criteria criteria = openSession().createCriteria(User.class)
                .add(Restrictions.eq("username", userName));
        User user = (User) criteria.uniqueResult();
        return user.getUserid();
    }

    @Override
    public String takeNickName(String userName){
        Criteria criteria = openSession().createCriteria(User.class)
                .add(Restrictions.eq("username", userName));
        User user = (User) criteria.uniqueResult();
        return user.getNickName();
    }

    @Override
    public User takeUserById(Integer userId){
        Criteria criteria = openSession().createCriteria(User.class)
                .add(Restrictions.eq("id", userId));
        User user = (User) criteria.uniqueResult();
        return user;
    }

    @Override
    public Integer takeUserRole(Integer userId){
        String sql = "Select ROLE_ID from USER_AUTHORIZATION WHERE USER_ID = :userId";
        SQLQuery query = openSession().createSQLQuery(sql);
        query.setParameter("userId", userId);
        Integer roleId = (Integer) query.uniqueResult();
        return roleId;
    }

    @Override
    public String takeJoke(int randomJoke) {
        Criteria criteria = openSession().createCriteria(Joke.class)
                .add(Restrictions.eq("id", randomJoke));
        Joke joke = (Joke) criteria.uniqueResult();
        return joke.getName();
    }

    @Override
    public Integer quantityJoke() {
        return openSession().createCriteria(Joke.class).list().size();
    }

    @Override
    public ArrayList<User> takeUsersList() {
        Criteria criteria = openSession().createCriteria(User.class);
        ArrayList<User> list = (ArrayList<User>)criteria.list();
        return list;
    }
}
