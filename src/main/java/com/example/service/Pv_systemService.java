package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.Pv_systemDao;
import com.example.entity.Pv_system;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class Pv_systemService {

    @Resource
    private Pv_systemDao pv_systemDao;

    public Pv_system save(Pv_system pv_system) {
        return pv_systemDao.save(pv_system);
    }

    public void delete(Long id) {
        pv_systemDao.deleteById(id);
    }

    public Pv_system findById(Long id) {
        return pv_systemDao.findById(id).orElse(null);    }

    public List<Pv_system> findAll() {
        return pv_systemDao.findAll();
    }

    public Page<Pv_system> findPage(int pageNum, int pageSize) {
        return pv_systemDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}