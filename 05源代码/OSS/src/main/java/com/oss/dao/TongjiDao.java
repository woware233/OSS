package com.oss.dao;

import com.oss.domain.TongJi;

import java.util.List;

public interface TongjiDao {
    List<TongJi> selectCourseScore(int userid);
}
