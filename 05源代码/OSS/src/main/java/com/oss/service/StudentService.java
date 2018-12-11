package com.oss.service;

import com.oss.dao.StudentDao;
import com.oss.domain.RegisterInfo;
import com.oss.domain.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentService {
    @Autowired
    StudentDao studentDao;
    public int addstudentinfo(Student student){
        return studentDao.addstudentinfo(student);
    };
    public RegisterInfo selectStudentById(int userid){return studentDao.selectStudentById(userid);};
    public int updateStudent(Student student){return updateStudent(student);};

}
