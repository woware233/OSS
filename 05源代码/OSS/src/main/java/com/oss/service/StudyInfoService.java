package com.oss.service;

import com.oss.dao.StudyInfoDao;
import com.oss.domain.StdStyInfo;
import com.oss.domain.StudyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyInfoService {
    @Autowired
    StudyInfoDao studyInfoDao;

    public List<StudyInfo> findStudyInfo(){return studyInfoDao.findStudyInfo();}
    public List<StdStyInfo> findStdStyInfo(int userid){return studyInfoDao.findStdStyInfo(userid);}

}
