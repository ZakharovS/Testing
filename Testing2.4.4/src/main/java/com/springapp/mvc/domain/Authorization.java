package com.springapp.mvc.domain;

import javax.persistence.*;

@Entity
@Table(name = "AUTHORIZATION")
public class Authorization {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "USERROLE")
    private String userrole;

    public Integer getId() {
        return id;
    }

    public void setId(Integer userId) {
        this.id = userId;
    }

    public String getUserrole() {
        return userrole;
    }

    public void setUserrole(String userrole) {
        this.userrole = userrole;
    }
}
