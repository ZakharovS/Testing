package com.springapp.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CURRTEST")
public class CurrTest {
    @Id
    @Column(name = "ID")
    private int id;
    @Column(name = "TEST_ID")
    private int testId;
    @Column(name = "QUESTION_ID")
    private int questionId;
    @Column(name = "ANSWER_ID")
    private int answerId;
    @Column(name = "USER_ID")
    private int userId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int user_id) {
        this.userId = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int test_id) {
        this.testId = test_id;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int question_id) {
        this.questionId = question_id;
    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answer_id) {
        this.answerId = answer_id;
    }

}
