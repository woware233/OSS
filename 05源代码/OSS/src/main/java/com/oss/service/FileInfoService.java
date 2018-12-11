package com.oss.service;

import com.oss.dao.FileinfoDao;
import com.oss.domain.FileInfo;
import com.oss.domain.UserFile;
import com.oss.domain.UserFileid;
import com.oss.domain.upFileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileInfoService {
    @Autowired
    FileinfoDao fileinfoDao;

    public int addFileinfo(FileInfo fileInfo){
        return fileinfoDao.addFileinfo(fileInfo);
    }

    public  int addUserFile(UserFile userFile){
        return fileinfoDao.addUserFile(userFile);
    }
    public FileInfo upFileInfo(upFileInfo upFileInfo){return fileinfoDao.upFileInfo(upFileInfo);}
    public int delfileinfo(int fileid){return fileinfoDao.delfileinfo(fileid);}

    public int SelectInfo(UserFileid userFileid){return fileinfoDao.SelectInfo(userFileid);}
    public int updateFileinfo(FileInfo fileInfo){return fileinfoDao.updateFileinfo(fileInfo);}
}
