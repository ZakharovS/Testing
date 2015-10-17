package com.springapp.mvc.domain;

import javax.persistence.*;

@Entity
@Table(name = "ANSWERS")
public class Answers {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    @Column(name = "ANSWER")
    private String answer;
    @Column(name = "CORRECT")
    private int correct;

    public Answers() {
    }

    public Answers(String answer) {
        this.answer = answer;
    }

    @ManyToOne()
    @JoinColumn(name = "QUESTION_ID")
    private Question question;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Integer questionId) {
        Question question = new Question();
        question.setId(questionId);
        this.question = question;
    }

    public int getCorrect() {
        return correct;
    }

    public void setCorrect(int correct) {
        this.correct = correct;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

}
