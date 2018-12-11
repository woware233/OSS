package com.oss.service;

import com.oss.dao.BatchDao;
import com.oss.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BatchService {
    @Autowired
    BatchDao batchDao;

    public int addBatch(Batch batch){return batchDao.addBatch(batch);};
    public List<Batch> findBatch(){return batchDao.findBatch();};
    public int delBatch(List<Integer> list){return batchDao.delBatch(list);};
    public List<BatchCourse> findbatchcourse(){return batchDao.findbatchcourse();};
    public int addBatchCourse(BatchCourse batchCourse){return batchDao.addBatchCourse(batchCourse);}
    public int ChooseBatch(UserBatch userBatch){return batchDao.ChooseBatch(userBatch);}
    public int findusercount(int userid){return batchDao.findusercount(userid);};
    public List<Coursefile> findchoosefile(int batchid){
        return batchDao.findchoosefile(batchid);
    };
}
