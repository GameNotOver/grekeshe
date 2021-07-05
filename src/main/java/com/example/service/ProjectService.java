package com.example.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import java.util.List;
import com.example.dao.ProjectDao;
import com.example.entity.Project;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class ProjectService {

    @Resource
    private ProjectDao projectDao;

    public Project save(Project project) {
        return projectDao.save(project);
    }

    public void delete(Long id) {
        projectDao.deleteById(id);
    }

    public Project findById(Long id) {
        return projectDao.findById(id).orElse(null);    }

    public List<Project> findAll() {
        return projectDao.findAll();
    }

    public Page<Project> findPage(int pageNum, int pageSize) {
        return projectDao.findAll(PageRequest.of(pageNum - 1, pageSize));
    }

}