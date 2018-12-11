package com.oss.controller;

import com.oss.domain.Action;
import com.oss.domain.TableModel;
import com.oss.domain.User;
import com.oss.service.ActionService;
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
public class ActionController {
    @Autowired
    ActionService actionService;

    /**
     * 查询用户的主菜单
     */
    @RequestMapping("/findActionListByUserId")
    public ModelAndView findQuotaListByUserId(int userId, HttpServletRequest request) {
        List<Action> topList = new ArrayList<Action>();
        List<Action> actionList = actionService.findActionListByUserId(userId);
        for (Action tree : actionList) {
            // 遍历所有节点，将父菜单id与传过来的id比较
            if (tree.getPid().equals(0)) {
                tree.setSpread(true);
                tree.setChildren(prepareTreeChild(tree.getId(), actionList));
                topList.add(tree);
            }
        }
        JSONArray jsonArray = JSONArray.fromObject(actionList);
        JSONArray jsonArray2 = JSONArray.fromObject(topList);
        ModelAndView modelAndView = new ModelAndView("forward:/index.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("action", jsonArray.toString());
        session.setAttribute("menu", jsonArray2.toString());

        return modelAndView;
    }


    private List<Action> prepareTreeChild(Integer id, List<Action> actionList) {
        List<Action> childList = new ArrayList<Action>();
        for (Action tree : actionList) {

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

    @RequestMapping("/actionList")
    @ResponseBody
    public Map<String, Object> findActionlist(TableModel tableModel, HttpSession session) {
        int actioncount = actionService.actioncount();
        List<Action> actions = actionService.findActionList();
        session.setAttribute("action", actions);
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("code", 0);
        result.put("msg", "");
        result.put("count", actioncount);
        JSONArray array = JSONArray.fromObject(actions);
        result.put("data", array);
        return result;
    }

    @RequestMapping("/addjsp.do")
    @ResponseBody
    public ModelAndView add(HttpServletRequest request) {
        ModelAndView modelAndView;

        List<Action> actions = actionService.findActionList();
        modelAndView = new ModelAndView("forward:/moduls/action/add.jsp");
        modelAndView.addObject("action", actions);
        return modelAndView;
    }

    @RequestMapping("/addAction")
    @ResponseBody
    public String addAction(Action action) {


        int ret = actionService.addAction(action);

        return "添加成功";
    }

    @RequestMapping("/delAction")
    @ResponseBody
    public Map<String, Object> delAction(String ids) {
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
            int result = actionService.deleteAction(list);
            map.put("success", result);
            map.put("msg", "删除成功");
            return map;
        }
    }
}



