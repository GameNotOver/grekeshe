package com.example.dao;

import com.example.entity.Pv_booster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface Pv_boosterDao extends JpaRepository<Pv_booster, Long>, JpaSpecificationExecutor<Pv_booster> {

}