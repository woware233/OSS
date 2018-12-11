package com.oss.dao;

import com.oss.domain.StdStyInfo;
import com.oss.domain.StudyInfo;

import java.util.List;

public interface StudyInfoDao {
    List<StudyInfo> findStudyInfo();
    List<StdStyInfo> findStdStyInfo(int userid);
}
