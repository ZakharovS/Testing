package com.springapp.mvc.dao;

import com.springapp.mvc.domain.User;

import java.util.ArrayList;

public interface UserDao {
    void saveUser(User user, Integer roleId, Integer enable);

    User checkUser(User user);

    int takeUserId(String userName);

    String takeNickName(String userName);

    User takeUserById(Integer userId);

    Integer takeUserRole(Integer userId);

    String takeJoke(int randomJoke);

    Integer quantityJoke();

    ArrayList<User> takeUsersList();
}
