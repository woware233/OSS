package com.oss.controller;

import com.oss.domain.*;
import com.oss.service.ChapterService;
import com.oss.service.CourseService;
import net.sf.json.JSONArray;
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

@Controller
public class CourseController {
    @Autowired
    CourseService courseService;
@Autowired
    ChapterService chapterService;

    @RequestMapping("/CourseList")
    @ResponseBody
    public Map<String, Object> findCourselist(TableModel tableModel, HttpSession session) {

        List<Course> courses = courseService.findCourse();
        session.setAttribute("course", courses);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 100);
        JSONArray array = JSONArray.fromObject(courses);
        result.put("data", array);
        return result;
    }

    @RequestMapping("/addcoursejsp.do")
    @ResponseBody
    public ModelAndView add(HttpServletRequest request) {
        ModelAndView modelAndView;

        List<Course> courses = courseService.findCourse();
        modelAndView = new ModelAndView("forward:/moduls/course/add.jsp");
        modelAndView.addObject("courses", courses);
        return modelAndView;
    }

    @RequestMapping("/addCourse")
    @ResponseBody
    public String addAction(Course course) {

        int Ret = courseService.addCourse(course);

        return "添加成功";
    }

    @RequestMapping("/delCourse")
    @ResponseBody
    public Map<String, Object> delCourse(String ids) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (ids == null || ids.equals("")) {
            map.put("success", 0);
            map.put("msg", "无可删除功能");
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
            int result = courseService.delCourse(list);
            map.put("success", result);
            map.put("msg", "删除成功");
            return map;
        }
    }

    @RequestMapping("/choosecoursejsp.do")
    @ResponseBody
    public ModelAndView choosebatchjsp(HttpServletRequest request,HttpSession session) {
        ModelAndView modelAndView;
        Integer userid=(Integer)session.getAttribute("userId");
        List<Course> courses = courseService.findCourseByStd(userid);
        modelAndView = new ModelAndView("forward:/moduls/chooseBatch/chooseCourse/choosecourse.jsp");
        modelAndView.addObject("courses", courses);

        return modelAndView;
    }

    @RequestMapping("/ChooseCourse")
    @ResponseBody
    public  ModelAndView ChooseCourse(Course course,HttpSession session) {
        ModelAndView modelAndView;
        Integer userid=(Integer)session.getAttribute("userId");
        int courseid=course.getCourseid();
        List<Chapter> topList = new ArrayList<Chapter>();
        List<Chapter> chapterList = chapterService.findChapterListByCourseId(courseid);
        for (Chapter tree : chapterList) {
            // 遍历所有节点，将父菜单id与传过来的id比较
            if (tree.getPid().equals(0)) {
                tree.setSpread(true);
                tree.setChildren(prepareTreeChild(tree.getId(), chapterList));
                topList.add(tree);
            }
        }
        JSONArray jsonArray = JSONArray.fromObject(chapterList);
        JSONArray jsonArray2 = JSONArray.fromObject(topList);
        modelAndView = new ModelAndView("forward:/moduls/studyvideo/studyVideo.jsp");
        session.setAttribute("chaptermenuvideo", jsonArray2.toString());
        return modelAndView;
    }

    private List<Chapter> prepareTreeChild(Integer id, List<Chapter> chapterList) {
        List<Chapter> childList = new ArrayList<Chapter>();
        for (Chapter tree : chapterList) {

            if (tree.getPid() != null && tree.getPid().equals(id)) {
                childList.add(tree);
            }
        }
        // 把子菜单的子菜单再循环一遍

        // 递归退出条件
        if (childList.size() == 0) {
            return null;
        }
        return childList;
    }
}
