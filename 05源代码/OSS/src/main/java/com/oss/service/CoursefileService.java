package com.oss.service;

import com.oss.dao.CourseDao;
import com.oss.dao.CoursefileDao;
import com.oss.domain.ChapterFile;
import com.oss.domain.Coursefile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoursefileService {
    @Autowired
    CoursefileDao coursefileDao;

    public List<Coursefile> findFileBychapterid(int chapterid){
        return coursefileDao.findFileBychapterid(chapterid);
    }
    public Coursefile findFileByid(int fileid){
        return coursefileDao.findFileByid(fileid);
    }
    public int updateCoursefile(Coursefile coursefile){
        return coursefileDao.updateCoursefile(coursefile);
    }
    public int addcoursefile(Coursefile coursefile){return coursefileDao.addcoursefile(coursefile);}
    public int addchapterfile(ChapterFile chapterFile){return coursefileDao.addchapterfile(chapterFile);}
}

