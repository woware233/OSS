package com.oss.service;

import com.oss.dao.CourseDao;
import com.oss.domain.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    CourseDao courseDao;

    public int addCourse(Course course){return courseDao.addCourse(course);}
    public List<Course> findCourse(){return courseDao.findCourse();}
    public int delCourse(List<Integer> list){return courseDao.delCourse(list);}
    public List<Course> findCourseByStd(int userid){return courseDao.findCourseByStd(userid);}
}
