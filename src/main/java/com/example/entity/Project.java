package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "project")
public class Project {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pj_id;

    /**
     * owner_id
     */
    @Column(name = "owner_id")
    private int owner_id;

    /**
     * loc_id
     */
    @Column(name = "loc_id")
    private int loc_id;

    /**
     * pv_area
     */
    @Column(name = "pv_area")
    private int pv_area;

    /**
     * name
     */
    @Column(name = "name")
    private String name;

    /**
     * design
     */
    @Column(name = "disign")
    private String disign;

    /**
     * type
     */
    @Column(name = "type")
    private String type;

    /**
     * stage
     */
    @Column(name = "stage")
    private String stage;

    /**
     * date
     */
    @Column(name = "date")
    private String date;

    /**
     * invest
     */
    @Column(name = "invest")
    private double invest;

    public Long getId() {
        return pj_id;
    }

    public int getOwner_id() {
        return owner_id;
    }

    public int getLoc_id() {
        return loc_id;
    }

    public int getPv_area() {
        return pv_area;
    }

    public String getName() {
        return name;
    }

    public String getDisign() {
        return disign;
    }

    public String getType() {
        return type;
    }

    public String getStage() {
        return stage;
    }

    public String getDate() {
        return date;
    }

    public double getInvest() {
        return invest;
    }

    public void setId(Long id) {
        this.pj_id = id;
    }

    public void setOwner_id(int owner_id) {
        this.owner_id = owner_id;
    }

    public void setLoc_id(int loc_id) {
        this.loc_id = loc_id;
    }

    public void setPv_area(int pv_area) {
        this.pv_area = pv_area;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDisign(String disign) {
        this.disign = disign;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setInvest(double invest) {
        this.invest = invest;
    }
}