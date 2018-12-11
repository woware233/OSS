package com.oss.service;

import com.oss.dao.VideoDao;
import com.oss.domain.Coursefile;
import com.oss.domain.FileInfo;
import com.oss.domain.upFileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoService {
    @Autowired
    VideoDao videoDao;
public Coursefile findVideoBychapterid(int chapterid){
    return videoDao.findVideoBychapterid(chapterid);
}

}
