package com.oss.dao;

import com.oss.domain.FileInfo;
import com.oss.domain.UserFile;
import com.oss.domain.UserFileid;
import com.oss.domain.upFileInfo;

public interface FileinfoDao {
   int addFileinfo(FileInfo fileInfo);
   int addUserFile(UserFile userFile);
   FileInfo upFileInfo(upFileInfo upFileInfo);
   int delfileinfo(int fileid);
   int SelectInfo(UserFileid userFileid);
   int updateFileinfo(FileInfo fileInfo);
}
