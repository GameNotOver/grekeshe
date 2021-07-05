package com.example.controller;

import com.example.common.Result;
import com.example.entity.Location;
import com.example.service.LocationService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/location")
public class LocationController {
    @Resource
     private LocationService locationService;

    @PostMapping
    public Result<Location> save(@RequestBody Location location) {
        return Result.success(locationService.save(location));
    }

    @PutMapping
    public Result<?> update(@RequestBody Location location) {
        return Result.success(locationService.save(location));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        locationService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Location> findById(@PathVariable Long id) {
        return Result.success(locationService.findById(id));
    }

    @GetMapping
    public Result<List<Location>> findAll() {
        return Result.success(locationService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Location>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(locationService.findPage(pageNum, pageSize));
    }

}