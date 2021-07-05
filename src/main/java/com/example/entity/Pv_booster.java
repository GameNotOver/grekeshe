package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "pv_booster")
public class Pv_booster {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long booster_id;

    @Column(name = "capicity")
    private String capicity;

    public Long getId() {
        return booster_id;
    }

    public String getCapicity() {
        return capicity;
    }

    public void setId(Long id) {
        this.booster_id = id;
    }

    public void setCapicity(String capicity) {
        this.capicity = capicity;
    }
}