package com.springapp.mvc.services.impl;

import com.springapp.mvc.dao.ForumDao;
import com.springapp.mvc.dao.impl.ForumDaoImpl;
import com.springapp.mvc.services.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ForumServiceImpl implements ForumService {

    @Autowired
    private ForumDao forumDao;

    @Override
    public List showPosts() {
        List list = forumDao.showPosts();
        return list;
    }

    @Override
    public void saveMessage(String message, String userName) {
        forumDao.saveMessage(message, userName);
    }

    @Override
    public void deleteMessage(Integer id) {
        forumDao.deleteMessage(id);
    }
}
