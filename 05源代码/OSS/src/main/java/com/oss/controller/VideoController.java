package com.oss.controller;

import com.oss.domain.*;
import com.oss.service.CoursefileService;
import com.oss.service.FileInfoService;
import com.oss.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class VideoController {
    @Autowired
    VideoService videoService;
    @Autowired
    CoursefileService coursefileService;
    @Autowired
    FileInfoService fileInfoService;

    @RequestMapping("/findVideoBychpterid")
    @ResponseBody
    public Map<String, Object>  findVideo(int chapterid){
        Map<String, Object> result = new HashMap<String, Object>();
        Coursefile coursefile=videoService.findVideoBychapterid(chapterid);
        result.put("data",coursefile);
        return result;
    }

    @RequestMapping("/addFileinfo")
    @ResponseBody
    public String addFileinfo(FileInfo fileInfo, HttpSession session){
        Integer userid=(Integer) session.getAttribute("userId");
        int fileid=fileInfo.getFileid();
        UserFileid userFileid=new UserFileid();
        userFileid.setFileid(fileid);
        userFileid.setUserid(userid);
        int Count=fileInfoService.SelectInfo(userFileid);
        if (Count==0) {
            int Ret = fileInfoService.addFileinfo(fileInfo);
            System.out.println(fileInfo.getId());
            System.out.println(userid);
            int fileinfoid = fileInfo.getId();

            UserFile userFile = new UserFile();
            userFile.setUserid(userid);
            userFile.setFileinfoid(fileinfoid);
            int Ret2 = fileInfoService.addUserFile(userFile);
            if(Ret2>0){ return "记录成功";}
            else {return "记录失败";}
        }
       else {
           int Ret3=fileInfoService.updateFileinfo(fileInfo);
            if(Ret3>0){ return "更新成功";}
            else {return "更新失败";}
        }
    }


    @RequestMapping("/updateFileinfo")
    @ResponseBody
    public Map<String, Object> updateFileinfo(upFileInfo upFileInfo, HttpSession session){
        Map<String, Object> map = new HashMap<String, Object>();
        Integer userid=(Integer) session.getAttribute("userId");
        upFileInfo.setUserid(userid);
        FileInfo fileInfo=fileInfoService.upFileInfo(upFileInfo);
        map.put("info",fileInfo);

        return map;
    }

    @RequestMapping("/delFileinfo")
    @ResponseBody
    public String delFileinfo(upFileInfo upFileInfo, HttpSession session){
            int fileid=upFileInfo.getFileid();
            int Ret=fileInfoService.delfileinfo(fileid);
            if(Ret>0)
            {return "删除记录";}
            else
            {return "删除失败";}
    }
}
