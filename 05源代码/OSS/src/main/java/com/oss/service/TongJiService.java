package com.oss.service;

import com.oss.dao.TongjiDao;
import com.oss.domain.TongJi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hasee
 */
@Service
public class TongJiService {
    @Autowired
    TongjiDao tongjiDao;
    public List<TongJi> selectCourseScore(int userid){
        return tongjiDao.selectCourseScore(userid);
    }
}
