package com.oss.dao;

import com.oss.domain.Chapter;
import com.oss.domain.CourseChapter;

import java.util.List;

public interface ChapterDao {
    List<Chapter> findChapterListByCourseId(int courseid);
    List<Chapter> findChapterList();
    int addChapter(Chapter chapter);
    int addCourseChapter(CourseChapter courseChapter);
}
