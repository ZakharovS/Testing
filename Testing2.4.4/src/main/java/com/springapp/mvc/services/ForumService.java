package com.springapp.mvc.services;

import java.util.List;

public interface ForumService {
    List showPosts();

    void saveMessage(String message, String userName);

    void deleteMessage(Integer id);
}
