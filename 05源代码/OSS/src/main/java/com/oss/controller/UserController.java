package com.oss.controller;

import com.oss.domain.RegisterInfo;
import com.oss.domain.Student;
import com.oss.domain.TableModel;
import com.oss.domain.User;
import com.oss.service.StudentService;
import com.oss.service.UserService;
import net.sf.json.JSONArray;
import org.apache.poi.ss.formula.functions.T;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hasee
 */
@Controller
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    StudentService studentService;

    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request) {
        User users = userService.userlogin(user);
        int userStatus=2;
        if (users != null) {
            HttpSession session = request.getSession();
            session.setAttribute("username", users.getUsername());
            session.setAttribute("userId", users.getUserid());
            session.setAttribute("password", users.getPassword());
            session.setAttribute("user", users);
            System.out.println(users.getUsername());
            System.out.println(users.getUserid());
        if(users.getState().equals(userStatus)){
                return "forward:/findActionListByUserId?userId=" + users.getUserid() + "";
                                }
        else{ return "loginfailed";}
            }
         else {
            return "loginfailed";
        }
    }

    @RequestMapping("/finduserlist")
    @ResponseBody
    public Map<String, Object> finduserlist(TableModel tableModel) {
        List<User> users = userService.usermanager();
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 1000);
        JSONArray array = JSONArray.fromObject(users);
        result.put("data", array);
        return result;
    }

    @RequestMapping("/delUser")
    @ResponseBody
    public Map<String, Object> delUser(String ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (ids == null || ids.equals("")) {
            map.put("success", 0);
            map.put("msg", "无可删除用户");
            return map;
        } else {

            String[] arr = ids.split(",");
            List<Integer> list = new ArrayList<Integer>();
            for (int i = 0; i < arr.length; i++) {
                String item = arr[i];
                if (item != null && !item.equals("")) {
                    list.add(Integer.parseInt(item));
                }
            }
            System.out.println(list);
            int result = userService.deleteUser(list);
            map.put("success", result);
            map.put("msg", "删除成功");
            return map;
        }
    }


    @RequestMapping("/selectStudentinfo")
    @ResponseBody
    public Map<String, Object> studentInfo(HttpSession session){
        Integer userid=(Integer) session.getAttribute("userId");
        Map<String, Object> map = new HashMap<String, Object>();
        RegisterInfo students=studentService.selectStudentById(userid);
        map.put("data",students);
        return map;
    }

    @RequestMapping("/selectUserStudentinfo")
    @ResponseBody
    public Map<String, Object> userStudentInfo(int userid,HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        RegisterInfo students=studentService.selectStudentById(userid);
        map.put("data",students);
        return map;
    }

    @RequestMapping("/shenheUser")
    @ResponseBody
    public int shenHeUser(int userid){
        User user=new User();
        user.setUserid(userid);
        user.setState(2);
        int ret=userService.shenheUser(user);
        if(ret>0){
            return 1;
        }
        else {return 0;}
    }
}