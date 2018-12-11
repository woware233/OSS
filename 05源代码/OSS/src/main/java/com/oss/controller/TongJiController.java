package com.oss.controller;

import com.oss.domain.TongJi;
import com.oss.service.TongJiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hasee
 */
@Controller
public class TongJiController {
    @Autowired
    TongJiService tongJiService;

    @RequestMapping("/TongJi1")
    @ResponseBody
    public Map<String,Object> selectCourseScore(HttpSession session){
        Integer userid=(Integer) session.getAttribute("userId");
        Map<String,Object> map=new HashMap<String, Object>();
        List<TongJi> tongJis=tongJiService.selectCourseScore(userid);
        map.put("data",tongJis);
        return map;
    }
}
