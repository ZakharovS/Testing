package com.springapp.mvc.dao;

import com.springapp.mvc.domain.Forum;

import java.util.List;

public interface ForumDao {
    List<Forum> showPosts();

    void saveMessage(String message, String userName);

    void deleteMessage(Integer id);
}
