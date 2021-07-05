package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.MeteorologyDao;
import com.example.entity.Meteorology;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class MeteorologyService {

    @Resource
    private MeteorologyDao meteorologyDao;

    public Meteorology save(Meteorology meteorology) {
        return meteorologyDao.save(meteorology);
    }

    public void delete(Long id) {
        meteorologyDao.deleteById(id);
    }

    public Meteorology findById(Long id) {
        return meteorologyDao.findById(id).orElse(null);    }

    public List<Meteorology> findAll() {
        return meteorologyDao.findAll();
    }

    public Page<Meteorology> findPage(int pageNum, int pageSize) {
        return meteorologyDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}