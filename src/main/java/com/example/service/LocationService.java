package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.LocationDao;
import com.example.entity.Location;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class LocationService {

    @Resource
    private LocationDao locationDao;

    public Location save(Location location) {
        return locationDao.save(location);
    }

    public void delete(Long id) {
        locationDao.deleteById(id);
    }

    public Location findById(Long id) {
        return locationDao.findById(id).orElse(null);    }

    public List<Location> findAll() {
        return locationDao.findAll();
    }

    public Page<Location> findPage(int pageNum, int pageSize) {
        return locationDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}