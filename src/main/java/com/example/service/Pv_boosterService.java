package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.Pv_boosterDao;
import com.example.entity.Pv_booster;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class Pv_boosterService {

    @Resource
    private Pv_boosterDao pv_boosterDao;

    public Pv_booster save(Pv_booster pv_booster) {
        return pv_boosterDao.save(pv_booster);
    }

    public void delete(Long id) {
        pv_boosterDao.deleteById(id);
    }

    public Pv_booster findById(Long id) {
        return pv_boosterDao.findById(id).orElse(null);    }

    public List<Pv_booster> findAll() {
        return pv_boosterDao.findAll();
    }

    public Page<Pv_booster> findPage(int pageNum, int pageSize) {
        return pv_boosterDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}