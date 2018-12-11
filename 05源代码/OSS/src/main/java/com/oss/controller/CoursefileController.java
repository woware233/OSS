package com.oss.controller;

import com.oss.domain.Coursefile;
import com.oss.service.CoursefileService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class CoursefileController {
@Autowired
    CoursefileService coursefileService;

    @RequestMapping("/CoursefileList")
    @ResponseBody
    public Map<String, Object> tofileList(int chapterid, HttpServletRequest request){
        Map<String, Object> result = new HashMap<String, Object>();
        List<Coursefile> fileList = coursefileService.findFileBychapterid(chapterid);
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 2);
        JSONArray array = JSONArray.fromObject(fileList);
        result.put("data", array);
        return result;
    }

    @RequestMapping("/uploadjsp")
    public ModelAndView toupload(int fileid, HttpServletRequest request, HttpSession session){
        ModelAndView modelAndView;
        System.out.println(fileid);
        modelAndView = new ModelAndView("forward:/moduls/course/chapter/coursefile/fileupload.jsp");
        session.setAttribute("fileid", fileid);
        return modelAndView;
    }

    @RequestMapping("/uploadfile")
    @ResponseBody
    public String uploadfile(Coursefile coursefile,HttpServletRequest request,HttpSession session) throws IOException {
        Integer fileid=(Integer) session.getAttribute("fileid");
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath="F:\\upload\\video\\";
        //定义 文件名
        String filename=null;
        if(!coursefile.getFile().isEmpty()){
            //生成uuid作为文件名称
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            //获得文件类型（可以判断如果不是图片，禁止上传）
            String contentType=coursefile.getFile().getContentType();
            //获得文件后缀名
            String suffixName=contentType.substring(contentType.indexOf("/")+1);
            //得到 文件名
            filename=uuid+"."+suffixName;
            System.out.println(filename);
            //文件保存路径
            coursefile.getFile().transferTo(new File(localPath+filename));
        }
        //把图片的相对路径保存至数据库
        sqlPath = "/uploadVideo/"+filename;
        System.out.println(sqlPath);
        coursefile.setId(fileid);
        coursefile.setUrl(sqlPath);
        int ret=coursefileService.updateCoursefile(coursefile);
        if (ret>0)
        {return "OK";}else{return "Fail";}
    }




}
