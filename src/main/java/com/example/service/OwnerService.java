package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.OwnerDao;
import com.example.entity.Owner;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class OwnerService {

    @Resource
    private OwnerDao ownerDao;

    public Owner save(Owner owner) {
        return ownerDao.save(owner);
    }

    public void delete(Long id) {
        ownerDao.deleteById(id);
    }

    public Owner findById(Long id) {
        return ownerDao.findById(id).orElse(null);    }

    public List<Owner> findAll() {
        return ownerDao.findAll();
    }

    public Page<Owner> findPage(int pageNum, int pageSize) {
        return ownerDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}