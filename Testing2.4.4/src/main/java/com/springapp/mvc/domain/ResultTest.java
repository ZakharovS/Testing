package com.springapp.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "RESULTTEST")
public class ResultTest {
    @Id
    @Column(name = "ID")
    private int id;
    @Column(name = "USER_ID")
    private int userId;
    @Column(name = "TEST_ID")
    private int testId;
    @Column(name = "RESULT")
    private int result;
    @Column(name = "TIME")
    private String time;

    public String getTime() {
        return String.valueOf(new StringBuffer(time).delete(time.length() - 2, time.length()));
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }
}

