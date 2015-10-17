package com.springapp.mvc.services;

import com.springapp.mvc.domain.User;

import java.util.ArrayList;

public interface UserService {
    void saveUser(User user);

    void updateUser(User user, Integer userId);

    User checkUser(User user);

    Integer takeUserId(String username);

    String takeNickName(String username);

    String takeUserRole(Integer userId);

    User takeUserById(Integer userId);

    String takeJoke();

    ArrayList<User> takeUsersList();
}
