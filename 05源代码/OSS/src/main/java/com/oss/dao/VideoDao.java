package com.oss.dao;

import com.oss.domain.Coursefile;

public interface VideoDao {
    Coursefile findVideoBychapterid(int chapterid);
}
