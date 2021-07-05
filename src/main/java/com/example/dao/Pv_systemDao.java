package com.example.dao;

import com.example.entity.Pv_system;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface Pv_systemDao extends JpaRepository<Pv_system, Long>, JpaSpecificationExecutor<Pv_system> {

}