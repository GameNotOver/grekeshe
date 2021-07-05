package com.example.entity;

import cn.hutool.core.date.DateTime;

import javax.persistence.*;

@Entity
@Table(name = "pv_system")
public class Pv_system {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long system_id;

    @Column(name = "capcity")
    private double capcity;

    @Column(name = "merge_date")
    private String merge_date;

    @Column(name = "scheme")
    private String scheme;

    @Column(name = "ratio")
    private double ratio;

    public Long getId() {
        return system_id;
    }

    public double getCapcity() {
        return capcity;
    }

    public String getMerge_date() {
        return merge_date;
    }

    public String getScheme() {
        return scheme;
    }

    public double getRatio() {
        return ratio;
    }

    public void setId(Long id) {
        this.system_id = id;
    }

    public void setCapcity(double capcity) {
        this.capcity = capcity;
    }

    public void setMerge_date(String merge_date) {
        this.merge_date = merge_date;
    }

    public void setScheme(String scheme) {
        this.scheme = scheme;
    }

    public void setRatio(double ratio) {
        this.ratio = ratio;
    }
}