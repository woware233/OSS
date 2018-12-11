package com.oss.dao;

import com.oss.domain.Batch;
import com.oss.domain.BatchCourse;
import com.oss.domain.Coursefile;
import com.oss.domain.UserBatch;

import java.util.List;

public interface BatchDao {
     int addBatch(Batch batch);
     List<Batch> findBatch();
     int delBatch(List<Integer> list);
     List<BatchCourse> findbatchcourse();
     int addBatchCourse(BatchCourse batchCourse);
     int ChooseBatch(UserBatch userBatch);
     int findusercount(int userid);
     List<Coursefile> findchoosefile(int batchid);
}
