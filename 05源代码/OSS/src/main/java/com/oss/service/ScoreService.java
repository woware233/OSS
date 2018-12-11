package com.oss.service;

import com.oss.dao.ScoreDao;
import com.oss.domain.Score;
import com.oss.utils.ExcelUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * @author hasee
 */
@Service
public class ScoreService {
    @Autowired
    ScoreDao scoreDao;

    public String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response){
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        MultipartFile file = multipartRequest.getFile("upfile");
        if(file.isEmpty()){
            try {
                throw new Exception("文件不存在！");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        InputStream in =null;
        try {
            in = file.getInputStream();
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<List<Object>> listob = null;
        try {
            listob = new ExcelUtils().getBankListByExcel(in,file.getOriginalFilename());
        } catch (Exception e) {
            e.printStackTrace();
        }

        //该处可调用service相应方法进行数据保存到数据库中，现只对数据输出
        for (int i = 0; i < listob.size(); i++) {
            List<Object> lo = listob.get(i);
            Score vo = new Score();
            Score j = null;

            try {
                j = scoreDao.selectByPrimaryKey(Integer.valueOf(String.valueOf(lo.get(0))));
            } catch (NumberFormatException e) {
                // TODO Auto-generated catch block
                System.out.println("没有新增");
            }
            vo.setScoreid(Integer.valueOf(String.valueOf(lo.get(0))));
            vo.setStudentcode(String.valueOf(lo.get(1)));
            vo.setStudentname(String.valueOf(lo.get(2)));
            vo.setBatchname(String.valueOf(lo.get(3)));
            vo.setCoursename(String.valueOf(lo.get(4)));
            vo.setScore(Double.valueOf(String.valueOf(lo.get(5))));
            if(j == null)
            {
                scoreDao.insert(vo);
            }
            else
            {
                scoreDao.updateByPrimaryKey(vo);
            }
        }
        return "文件导入成功！";
    }

    public List<Score> findscore(){
        return scoreDao.findscore();
    }

    public int delScore(List<Integer> list){return scoreDao.delScore(list);}
}
