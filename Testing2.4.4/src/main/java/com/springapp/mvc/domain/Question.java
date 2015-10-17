package com.springapp.mvc.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "QUESTIONS")
public class Question {
    @Id
    @Column(name = "ID")
    private int id;
    @Column(name = "QUESTION")
    private String question;

    public Question() {
    }

    public Question(String question) {
        this.question = question;
    }

    @ManyToOne
    @JoinColumn(name = "TEST_ID")
    private Test test;

    public Test getTest() {
        return test;
    }

    public void setTest(Integer testId) {
        Test test = new Test();
        test.setId(testId);
        this.test = test;
    }

    @OneToMany(mappedBy = "question")
    private Set<Answers> answers;

    public Set<Answers> getAnswers() {
        return answers;
    }

    public void setAnswers(Set<Answers> answers) {
        this.answers = answers;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }
}
