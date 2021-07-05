package com.example.dao;

import com.example.entity.Meteorology;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface MeteorologyDao extends JpaRepository<Meteorology, Long>, JpaSpecificationExecutor<Meteorology> {

}