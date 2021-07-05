package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "meteorology")
public class Meteorology {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long loc_id;

    @Column(name = "avg_year_tem")
    private double avg_year_tem;

    @Column(name = "max_year_tem")
    private double max_year_tem;

    @Column(name = "max_soil_depth")
    private double max_soil_depth;

    @Column(name = "min_year_tem")
    private double min_year_tem;

    @Column(name = "avg_wind_speed")
    private double avg_wind_speed;

    @Column(name = "avg_strom_days")
    private double avg_strom_days;

    public Long getId() {
        return loc_id;
    }

    public double getAvg_year_tem() {
        return avg_year_tem;
    }

    public double getMax_year_tem() {
        return max_year_tem;
    }

    public double getMax_soil_depth() {
        return max_soil_depth;
    }

    public double getMin_year_tem() {
        return min_year_tem;
    }

    public double getAvg_wind_speed() {
        return avg_wind_speed;
    }

    public double getAvg_strom_days() {
        return avg_strom_days;
    }

    public void setId(Long id) {
        this.loc_id = id;
    }

    public void setAvg_year_tem(double avg_year_tem) {
        this.avg_year_tem = avg_year_tem;
    }

    public void setMax_year_tem(double max_year_tem) {
        this.max_year_tem = max_year_tem;
    }

    public void setMax_soil_depth(double max_soil_depth) {
        this.max_soil_depth = max_soil_depth;
    }

    public void setMin_year_tem(double min_year_tem) {
        this.min_year_tem = min_year_tem;
    }

    public void setAvg_wind_speed(double avg_wind_speed) {
        this.avg_wind_speed = avg_wind_speed;
    }

    public void setAvg_strom_days(double avg_strom_days) {
        this.avg_strom_days = avg_strom_days;
    }
}