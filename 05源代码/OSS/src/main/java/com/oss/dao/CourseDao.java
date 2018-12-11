package com.oss.dao;

import com.oss.domain.Course;

import java.util.List;

public interface CourseDao {
    int addCourse(Course course);
    List<Course> findCourse();
    int delCourse(List<Integer> list);
    List<Course> findCourseByStd(int userid);
}
