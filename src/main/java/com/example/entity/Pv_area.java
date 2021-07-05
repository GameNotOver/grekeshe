package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "pv_area")
public class Pv_area {
    /**
     * 主键
     */
    @Id
//    @Column(name = "pj_id")
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pj_id;

    /**
     * pv_set
     */
    @Column(name = "pv_set")
    private int pv_set;

    /**
     * pv_booster
     */
    @Column(name = "pv_booster")
    private int pv_booster;

    /**
     * pv_system
     */
    @Column(name = "pv_system")
    private int pv_system;

    /**
     * area
     */
    @Column(name = "area")
    private double area;

    /**
     * road_length
     */
    @Column(name = "road_length")
    private double road_length;

    /**
     * inverter
     */
    @Column(name = "inverter")
    private String inverter;

    /**
     * pv_module
     */
    @Column(name = "pv_module")
    private String pv_module;

    /**
     * pad_mounted
     */
    @Column(name = "pad_mounted")
    private String pad_mounted;

    public Long getId() {
        return pj_id;
    }


    public void setId(Long id) {
        this.pj_id = id;
    }

    public int getPv_set() {
        return pv_set;
    }

    public int getPv_booster() {
        return pv_booster;
    }

    public int getPv_system() {
        return pv_system;
    }

    public double getArea() {
        return area;
    }

    public double getRoad_length() {
        return road_length;
    }

    public String getInverter() {
        return inverter;
    }

    public String getPv_module() {
        return pv_module;
    }

    public String getPad_mounted() {
        return pad_mounted;
    }

    public void setPv_set(int pv_set) {
        this.pv_set = pv_set;
    }

    public void setPv_booster(int pv_booster) {
        this.pv_booster = pv_booster;
    }

    public void setPv_system(int pv_system) {
        this.pv_system = pv_system;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public void setRoad_length(double road_length) {
        this.road_length = road_length;
    }

    public void setInverter(String inverter) {
        this.inverter = inverter;
    }

    public void setPv_module(String pv_module) {
        this.pv_module = pv_module;
    }

    public void setPad_mounted(String pad_mounted) {
        this.pad_mounted = pad_mounted;
    }
}