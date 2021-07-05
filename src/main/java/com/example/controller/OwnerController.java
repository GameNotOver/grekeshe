package com.example.controller;

import com.example.common.Result;
import com.example.entity.Owner;
import com.example.service.OwnerService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/owner")
public class OwnerController {
    @Resource
     private OwnerService ownerService;

    @PostMapping
    public Result<Owner> save(@RequestBody Owner owner) {
        return Result.success(ownerService.save(owner));
    }

    @PutMapping
    public Result<?> update(@RequestBody Owner owner) {
        return Result.success(ownerService.save(owner));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        ownerService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Owner> findById(@PathVariable Long id) {
        return Result.success(ownerService.findById(id));
    }

    @GetMapping
    public Result<List<Owner>> findAll() {
        return Result.success(ownerService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Owner>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(ownerService.findPage(pageNum, pageSize));
    }

}