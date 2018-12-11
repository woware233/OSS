package com.oss.dao;

import com.oss.domain.ChapterFile;
import com.oss.domain.Coursefile;

import java.util.List;

public interface CoursefileDao {
    List<Coursefile> findFileBychapterid(int chapterid);
    Coursefile findFileByid(int fileid);
    int updateCoursefile(Coursefile coursefile);
    int addcoursefile(Coursefile coursefile);
    int addchapterfile(ChapterFile chapterFile);
}
