package com.oss.service;

import com.oss.dao.ChapterDao;
import com.oss.domain.Chapter;
import com.oss.domain.CourseChapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChapterService {
    @Autowired
    ChapterDao chapterDao;

    public List<Chapter> findChapterListByCourseId(int courseid){return chapterDao.findChapterListByCourseId(courseid);}

    public List<Chapter> findChapterList(){return chapterDao.findChapterList();}

    public int addChapter(Chapter chapter){return chapterDao.addChapter(chapter);}
    public int addCourseChapter(CourseChapter courseChapter){return chapterDao.addCourseChapter(courseChapter);}
}
