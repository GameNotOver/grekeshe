package com.example.controller;

import com.example.common.Result;
import com.example.entity.Pv_booster;
import com.example.service.Pv_boosterService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/pv_booster")
public class Pv_boosterController {
    @Resource
     private Pv_boosterService pv_boosterService;

    @PostMapping
    public Result<Pv_booster> save(@RequestBody Pv_booster pv_booster) {
        return Result.success(pv_boosterService.save(pv_booster));
    }

    @PutMapping
    public Result<?> update(@RequestBody Pv_booster pv_booster) {
        return Result.success(pv_boosterService.save(pv_booster));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        pv_boosterService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Pv_booster> findById(@PathVariable Long id) {
        return Result.success(pv_boosterService.findById(id));
    }

    @GetMapping
    public Result<List<Pv_booster>> findAll() {
        return Result.success(pv_boosterService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Pv_booster>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(pv_boosterService.findPage(pageNum, pageSize));
    }

}