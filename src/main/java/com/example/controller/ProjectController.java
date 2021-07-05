package com.example.controller;

import com.example.common.Result;
import com.example.entity.Project;
import com.example.service.ProjectService;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/project")
public class ProjectController {
    @Resource
     private ProjectService projectService;

    @PostMapping
    public Result<Project> save(@RequestBody Project project) {
        return Result.success(projectService.save(project));
    }

    @PutMapping
    public Result<?> update(@RequestBody Project project) {
        return Result.success(projectService.save(project));
    }

    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable Long id) {
        projectService.delete(id);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<Project> findById(@PathVariable Long id) {
        return Result.success(projectService.findById(id));
    }

    @GetMapping
    public Result<List<Project>> findAll() {
        return Result.success(projectService.findAll());
    }

    @GetMapping("/page")
    public Result<Page<Project>> findPage(@RequestParam(required = false, defaultValue = "1") Integer pageNum, @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        return Result.success(projectService.findPage(pageNum, pageSize));
    }

}