package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "location")
public class Location {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long loc_id;

    /**
     * capacity
     */
    @Column(name = "capicity")
    private double capicity;

    /**
     * area
     */
    @Column(name = "area")
    private double area;

    /**
     * altitude
     */
    @Column(name = "altitude")
    private double altitude;

    /**
     * longitude
     */
    @Column(name = "longtitude")
    private double longtitude;

    /**
     * latitude
     */
    @Column(name = "latitude")
    private double latitude;

    /**
     * best_angles
     */
    @Column(name = "best_angles")
    private double best_angles;

    /**
     * radiation
     */
    @Column(name = "radiation")
    private double radiation;


    public Long getId() {
        return loc_id;
    }

    public double getCapicity() {
        return capicity;
    }

    public double getArea() {
        return area;
    }

    public double getAltitude() {
        return altitude;
    }

    public double getLongtitude() {
        return longtitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getBest_angles() {
        return best_angles;
    }

    public double getRadiation() {
        return radiation;
    }

    public void setId(Long id) {
        this.loc_id = id;
    }

    public void setCapicity(double capicity) {
        this.capicity = capicity;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public void setAltitude(double altitude) {
        this.altitude = altitude;
    }

    public void setLongtitude(double longtitude) {
        this.longtitude = longtitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public void setBest_angles(double best_angles) {
        this.best_angles = best_angles;
    }

    public void setRadiation(double radiation) {
        this.radiation = radiation;
    }
}