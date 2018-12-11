package com.oss.dao;

import com.oss.domain.RegisterInfo;
import com.oss.domain.Student;

public interface StudentDao {
    int addstudentinfo(Student student);
    RegisterInfo selectStudentById(int userid);
    int updateStudent(Student student);
}
