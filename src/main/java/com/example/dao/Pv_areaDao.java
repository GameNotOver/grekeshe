package com.example.dao;

import com.example.entity.Pv_area;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface Pv_areaDao extends JpaRepository<Pv_area, Long>, JpaSpecificationExecutor<Pv_area> {

}