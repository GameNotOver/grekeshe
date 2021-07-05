package com.example.controller;

import com.example.common.Result;
import com.example.entity.Pv_system;
import com.example.service.Pv_systemService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/pv_system")
public class Pv_systemController {
    @Resource
     private Pv_systemService pv_systemService;

    @PostMapping
    public Result<Pv_system> save(@RequestBody Pv_system pv_system) {
        return Result.success(pv_systemService.save(pv_system));
    }

    @PutMapping
    public Result<?> update(@RequestBody Pv_system pv_system) {
        return Result.success(pv_systemService.save(pv_system));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        pv_systemService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Pv_system> findById(@PathVariable Long id) {
        return Result.success(pv_systemService.findById(id));
    }

    @GetMapping
    public Result<List<Pv_system>> findAll() {
        return Result.success(pv_systemService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Pv_system>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(pv_systemService.findPage(pageNum, pageSize));
    }

}