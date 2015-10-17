package com.springapp.mvc.services.impl;

import com.springapp.mvc.dao.UserDao;
import com.springapp.mvc.dao.impl.UserDaoImpl;
import com.springapp.mvc.domain.User;
import com.springapp.mvc.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Random;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    private final Integer ROLE_DEFAULT = 2;
    private final Integer ENABLE = 1;

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user, ROLE_DEFAULT, ENABLE);
    }

    @Override
    public void updateUser(User user, Integer userId) {
        User oldUser = takeUserById(userId);

        if (oldUser.getPassword() != user.getPassword()) {
            oldUser.setPassword(user.getPassword());
        }
        if (oldUser.getNickName() != user.getNickName()) {
            oldUser.setNickName(user.getNickName());
        }
        if (oldUser.geteMail() != user.geteMail()) {
            oldUser.seteMail(user.geteMail());
        }
    }

    @Override
    public User checkUser(User user) {
        User checkUser = userDao.checkUser(user);
        return checkUser;
    }

    @Override
    public Integer takeUserId(String username) {
        return userDao.takeUserId(username);
    }

    @Override
    public String takeNickName(String username) {
        return userDao.takeNickName(username);
    }

    @Override
    public String takeUserRole(Integer userId) {
        Integer roleId = userDao.takeUserRole(userId);
        String role;
        if (roleId == 1) {
            role = "Администратор";
        } else if (roleId == 2) {
            role = "Пользователь";
        } else {
            role = "Нет данных";
        }
        return role;
    }

    @Override
    public User takeUserById(Integer userId) {
        return userDao.takeUserById(userId);
    }

    @Override
    public String takeJoke() {
        Random random = new Random();
        int quantityJoke = userDao.quantityJoke();
        int randomJoke = random.nextInt(quantityJoke) + 1;
        return userDao.takeJoke(randomJoke);
    }

    @Override
    public ArrayList<User> takeUsersList() {
        return userDao.takeUsersList();
    }
}
