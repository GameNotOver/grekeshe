package com.example.controller;

import com.example.common.Result;
import com.example.entity.Pv_area;
import com.example.service.Pv_areaService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/pv_area")
public class Pv_areaController {
    @Resource
     private Pv_areaService pv_areaService;

    @PostMapping
    public Result<Pv_area> save(@RequestBody Pv_area pv_area) {
        return Result.success(pv_areaService.save(pv_area));
    }

    @PutMapping
    public Result<?> update(@RequestBody Pv_area pv_area) {
        return Result.success(pv_areaService.save(pv_area));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        pv_areaService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Pv_area> findById(@PathVariable Long id) {
        return Result.success(pv_areaService.findById(id));
    }

    @GetMapping
    public Result<List<Pv_area>> findAll() {
        return Result.success(pv_areaService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Pv_area>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(pv_areaService.findPage(pageNum, pageSize));
    }

}