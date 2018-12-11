package com.oss.dao;

import com.oss.domain.Score;

import java.util.List;

public interface ScoreDao {

    int deleteByPrimaryKey(Integer scoreid);

    int insert(Score score);

    int insertSelective(Score score);

    Score selectByPrimaryKey(Integer scoreid);

    int updateByPrimaryKeySelective(Score score);

    int updateByPrimaryKey(Score score);

    List<Score>findscore();

    int delScore(List<Integer> list);

}
