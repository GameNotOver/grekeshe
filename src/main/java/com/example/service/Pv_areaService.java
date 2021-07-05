package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.Pv_areaDao;
import com.example.entity.Pv_area;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class Pv_areaService {

    @Resource
    private Pv_areaDao pv_areaDao;

    public Pv_area save(Pv_area pv_area) {
        return pv_areaDao.save(pv_area);
    }

    public void delete(Long id) {
        pv_areaDao.deleteById(id);
    }

    public Pv_area findById(Long id) {
        return pv_areaDao.findById(id).orElse(null);    }

    public List<Pv_area> findAll() {
        return pv_areaDao.findAll();
    }

    public Page<Pv_area> findPage(int pageNum, int pageSize) {
        return pv_areaDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}