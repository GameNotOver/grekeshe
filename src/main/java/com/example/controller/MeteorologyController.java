package com.example.controller;

import com.example.common.Result;
import com.example.entity.Meteorology;
import com.example.service.MeteorologyService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/meteorology")
public class MeteorologyController {
    @Resource
     private MeteorologyService meteorologyService;

    @PostMapping
    public Result<Meteorology> save(@RequestBody Meteorology meteorology) {
        return Result.success(meteorologyService.save(meteorology));
    }

    @PutMapping
    public Result<?> update(@RequestBody Meteorology meteorology) {
        return Result.success(meteorologyService.save(meteorology));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        meteorologyService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Meteorology> findById(@PathVariable Long id) {
        return Result.success(meteorologyService.findById(id));
    }

    @GetMapping
    public Result<List<Meteorology>> findAll() {
        return Result.success(meteorologyService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Meteorology>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(meteorologyService.findPage(pageNum, pageSize));
    }

}