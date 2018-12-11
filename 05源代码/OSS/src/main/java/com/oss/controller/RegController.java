package com.oss.controller;

import com.oss.domain.RegisterInfo;
import com.oss.domain.Student;
import com.oss.domain.User;
import com.oss.domain.UserRole;
import com.oss.service.RoleService;
import com.oss.service.StudentService;
import com.oss.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RegController {
    @Autowired
    UserService userService;
    @Autowired
    StudentService studentService;
    @Autowired
    RoleService roleService;

@RequestMapping("/register")
    public ModelAndView addUser(@Valid RegisterInfo registerInfo,User users, HttpServletRequest request) {
    ModelAndView modelAndView;
    List<UserRole> userroleList = new ArrayList<UserRole>();
    String username = registerInfo.getUsername();
    String password = registerInfo.getPassword();
    users.setUsername(username);
    users.setPassword(password);
    users.setState(1);
    int ret = userService.addUser(users);
    System.out.println("主键为："+users.getUserid());

    UserRole userrole = new UserRole();
    int userId = users.getUserid();
    System.out.println(userId);
    userrole.setRoleid(2);
    userrole.setUserid(userId);
    int ret2=roleService.adduserrole(userrole);

   Student student=new Student();
   student.setUserid(userId);
   student.setStudentname(registerInfo.getStudentname());
   student.setSex(registerInfo.getSex());
   student.setEmail(registerInfo.getEmail());
   student.setPhone(registerInfo.getPhone());
   int ret3=studentService.addstudentinfo(student);
    if (ret3 > 0) {
        modelAndView = new ModelAndView("forward:/login.jsp");
    } else {
        modelAndView = new ModelAndView("forward:/error.jsp");
    }
    return modelAndView;
}
}
