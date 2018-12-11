package com.oss.controller;

import com.oss.domain.*;
import com.oss.service.BatchService;
import com.oss.service.CourseService;
import com.oss.service.FileInfoService;
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
    public class BatchController {
        @Autowired
        BatchService batchService;

        @Autowired
        CourseService courseService;
        @Autowired
        FileInfoService fileInfoService;


        @RequestMapping("/BatchList")
        @ResponseBody
        public Map<String, Object> findBatchlist(TableModel tableModel, HttpSession session) {

            List<Batch> batchs = batchService.findBatch();
            session.setAttribute("batch", batchs);
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("code", 0);
            result.put("msg", "");
            result.put("count", 100);
            JSONArray array = JSONArray.fromObject(batchs);
            result.put("data", array);
            return result;
        }

        @RequestMapping("/addbatchjsp.do")
        @ResponseBody
        public ModelAndView add(HttpServletRequest request) {
            ModelAndView modelAndView;

            List<Batch> batchs = batchService.findBatch();
            modelAndView = new ModelAndView("forward:/moduls/batch/add.jsp");
            modelAndView.addObject("batchs", batchs);
            return modelAndView;
        }

        @RequestMapping("/addBatch")
        @ResponseBody
        public String addAction(Batch batch) {

            int ret = batchService.addBatch(batch);

            return "添加成功";
        }

        @RequestMapping("/delBatch")
        @ResponseBody
        public Map<String, Object> delBatch(String ids) {
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
                int result = batchService.delBatch(list);
                map.put("success", result);
                map.put("msg", "删除成功");
                return map;
            }
        }

        @RequestMapping("/BatchCourseList")
        @ResponseBody
        public Map<String, Object> batchCourseList(TableModel tableModel, HttpSession session) {

            List<BatchCourse> batchCourses = batchService.findbatchcourse();
            Map<String, Object> result = new HashMap<String, Object>();
            result.put("code", 0);
            result.put("msg", "");
            result.put("count", 100);
            JSONArray array = JSONArray.fromObject(batchCourses);
            result.put("data", array);
            return result;
        }

        @RequestMapping("/BCaddjsp.do")
        @ResponseBody
        public ModelAndView bcadd(HttpServletRequest request) {
            ModelAndView modelAndView;
            List<Batch> batchs = batchService.findBatch();
            List<Course> courses=courseService.findCourse();
            modelAndView = new ModelAndView("forward:/moduls/batchcourse/add.jsp");
            modelAndView.addObject("batchs", batchs);
            modelAndView.addObject("courses",courses);
            return modelAndView;
        }

        @RequestMapping("/addBatchCourse")
        @ResponseBody
        public String addBatchCourse(BatchCourse batchCourse) {

            int ret = batchService.addBatchCourse(batchCourse);

            return "添加成功";

        }

        @RequestMapping("/choosebatchjsp.do")
        @ResponseBody
        public ModelAndView chooseBatchjsp(HttpServletRequest request) {
            ModelAndView modelAndView;
            List<Batch> batchs = batchService.findBatch();
            modelAndView = new ModelAndView("forward:/moduls/chooseBatch/choosebatch.jsp");
            modelAndView.addObject("batchs", batchs);

            return modelAndView;
        }

        @RequestMapping("/ChooseBatch")
        @ResponseBody
        public int chooseBatch(Batch batch,HttpSession session) {
            Integer userid=(Integer)session.getAttribute("userId");
            System.out.println(userid);
            System.out.println(batch.getBatchid());
            int count=batchService.findusercount(userid);
            if (count==0) {
                int batchid=batch.getBatchid();
                UserBatch userBatch = new UserBatch();
                userBatch.setUserid(userid);
                userBatch.setBatchid(batch.getBatchid());
                int ret = batchService.ChooseBatch(userBatch);

                List<Coursefile> coursefiles=batchService.findchoosefile(batchid);
                for (Coursefile coursefile:coursefiles){
                    FileInfo fileInfo=new FileInfo();
                    fileInfo.setFileid(coursefile.getId());
                    fileInfo.setFiratio(0);
                    int ret2 = fileInfoService.addFileinfo(fileInfo);
                    System.out.println(fileInfo.getId());
                    System.out.println(userid);
                    int fileinfoid = fileInfo.getId();

                    UserFile userFile = new UserFile();
                    userFile.setUserid(userid);
                    userFile.setFileinfoid(fileinfoid);
                    int ret3 = fileInfoService.addUserFile(userFile);
                }
                return 0;
            }else{
                return 1;}
        }

}
