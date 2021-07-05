package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "owner")
public class Owner {
    /**
     * 主键
     */
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long owner_id;

    @Column(name = "name")
    private String name;

    @Column(name = "password")
    private String password;

    @Column(name = "contact")
    private String contact;

    @Column(name = "`group`")
    private String group;

    public Long getId() {
        return owner_id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public String getContact() {
        return contact;
    }

    public String getGroup() {
        return group;
    }

    public void setId(Long id) {
        this.owner_id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setGroup(String group) {
        this.group = group;
    }
}