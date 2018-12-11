package com.oss.controller;

import com.oss.domain.Course;
import com.oss.domain.Score;
import com.oss.domain.TableModel;
import com.oss.service.ScoreService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author hasee
 */
@Controller
public class ScoreController {
    @Autowired
    ScoreService scoreService;


    @RequestMapping(value = "ajaxUpload.do", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return scoreService.ajaxUploadExcel(request, response);
    }

    @RequestMapping("/findScorelist")
    @ResponseBody
    public Map<String, java.lang.Object> findScorelist(TableModel tableModel, HttpSession session) {
        List<Score> scores = scoreService.findscore();
        Map<String, java.lang.Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 100);
        JSONArray array = JSONArray.fromObject(scores);
        result.put("data", array);
        return result;
    }


    @RequestMapping("/delScore")
    @ResponseBody
    public Map<String, Object> delScore(String ids) {
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
            int result = scoreService.delScore(list);
            map.put("success", result);
            map.put("msg", "删除成功");
            return map;
        }
    }
}