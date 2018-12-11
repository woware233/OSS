package com.oss.controller;

import com.oss.domain.Action;
import com.oss.domain.StdStyInfo;
import com.oss.domain.StudyInfo;
import com.oss.domain.TableModel;
import com.oss.service.StudyInfoService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class StudyInfoController {
    @Autowired
    StudyInfoService studyInfoService;

    @RequestMapping("/StudyInfoList")
    @ResponseBody
    public Map<String, Object> findStudyInfolist(TableModel tableModel, HttpSession session) {

       List<StudyInfo> studyInfos=studyInfoService.findStudyInfo();
        for (StudyInfo studyInfo:studyInfos){
            studyInfo.setStudyratio(studyInfo.getStudyratio()*100);
            if (studyInfo.getStudyratio()<80){
                studyInfo.setStatus(0);
            }else {studyInfo.setStatus(1);}
        }
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 1000);
        JSONArray array = JSONArray.fromObject(studyInfos);
        result.put("data", array);
        return result;
    }

    @RequestMapping("/StdStyList")
    @ResponseBody
    public Map<String, Object> findStdStyInfolist(TableModel tableModel, HttpSession session) {
        Integer userid=(Integer) session.getAttribute("userId");
        List<StdStyInfo> stdStyInfos=studyInfoService.findStdStyInfo(userid);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", 1000);
        JSONArray array = JSONArray.fromObject(stdStyInfos);
        result.put("data", array);
        return result;
    }
}
