package com.oss.controller;

import com.oss.domain.*;
import com.oss.service.ChapterService;
import com.oss.service.CoursefileService;
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

/**
 * @author hasee
 */
@Controller
public class ChapterController {
@Autowired
    ChapterService chapterService;
@Autowired
    CoursefileService coursefileService;



    @RequestMapping("/findChapterListByCourseId")
    public ModelAndView findChapterListByCourseId(int courseid, HttpServletRequest request) {
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
        ModelAndView modelAndView = new ModelAndView("forward:/moduls/course/chapter/chaptermanager.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("chapter", jsonArray.toString());
        session.setAttribute("chaptermenu", jsonArray2.toString());
        session.setAttribute("courseid", courseid);
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

    @RequestMapping("/addchapter.do")
    @ResponseBody
    public ModelAndView add(HttpServletRequest request) {
        ModelAndView modelAndView;
        List<Chapter> chapters = chapterService.findChapterList();
        modelAndView = new ModelAndView("forward:/moduls/course/chapter/add.jsp");
        modelAndView.addObject("chapter", chapters);

        return modelAndView;
    }

    @RequestMapping("/addChapter")
    @ResponseBody
    public String addChapter(Chapter chapter,HttpSession session) {
        Integer courseid=(Integer) session.getAttribute("courseid");
        int Ret=chapterService.addChapter(chapter);
        System.out.println("主键为："+chapter.getId());

        CourseChapter courseChapter=new CourseChapter();
        int chapterid=chapter.getId();
        courseChapter.setCourseid(courseid);
        courseChapter.setChapterid(chapterid);
        int Ret2=chapterService.addCourseChapter(courseChapter);

if(chapter.getPid()!=0) {
    Coursefile coursefile = new Coursefile();
    coursefile.setType(0);
    int Ret3 = coursefileService.addcoursefile(coursefile);

    int fileid = coursefile.getId();
    ChapterFile chapterFile = new ChapterFile();
    chapterFile.setChapterid(chapterid);
    chapterFile.setFileid(fileid);
    int Ret4 = coursefileService.addchapterfile(chapterFile);

    Coursefile coursefile2 = new Coursefile();
    coursefile2.setType(1);
    int Ret5 = coursefileService.addcoursefile(coursefile2);

    int fileid2 = coursefile2.getId();
    ChapterFile chapterFile2 = new ChapterFile();
    chapterFile2.setChapterid(chapterid);
    chapterFile2.setFileid(fileid2);
    int Ret6 = coursefileService.addchapterfile(chapterFile2);
}
       if (Ret2>0){
        return "添加成功";}else {return "添加失败";}
    }
}
