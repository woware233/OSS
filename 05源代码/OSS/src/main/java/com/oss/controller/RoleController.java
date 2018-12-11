package com.oss.controller;

import com.oss.domain.*;
import com.oss.service.ActionService;
import com.oss.service.RoleService;
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
public class RoleController {
   @Autowired
    RoleService roleService;
    @Autowired
    ActionService actionService;

   @RequestMapping("/roleList")
   @ResponseBody
   public Map<String, Object> findRolelist(TableModel tableModel, HttpSession session){

       List<Role> roleList=roleService.findrole();
       Map<String, Object> result = new HashMap<String, Object>();
       result.put("code", 0);
       result.put("msg", "");
       result.put("count",100);
       JSONArray array = JSONArray.fromObject(roleList);
       result.put("data", array);
       return result;
   }
    @RequestMapping("/addroleaction.do")
    @ResponseBody
    public ModelAndView addrole(HttpServletRequest request){
        ModelAndView modelAndView;
        List<Action> actions = actionService.findActionList();
        modelAndView=new ModelAndView("forward:/moduls/role/add.jsp");
        modelAndView.addObject("action",actions) ;
        return modelAndView;
    }

    @RequestMapping("/checkAction")
    @ResponseBody
    public Map<String, Object> checkAction(int roleid,HttpSession session){
        Map<String, Object> result = new HashMap<String, Object>();

        List<ActionTree> actionTrees=new ArrayList<ActionTree>();
        List<Action> roleactions=actionService.roleAction(roleid);
        List<Action> allactions=actionService.allAction();
        for (Action aaction : allactions) {
            ActionTree actionTree=new ActionTree();
            actionTree.setId(aaction.getId());
            actionTree.setName(aaction.getName());
            actionTree.setOn(false);
            for (Action raction : roleactions) {
                if (aaction.getId().equals(raction.getId())) {
                    actionTree.setOn(true);break;
                }

            }actionTrees.add(actionTree);
        }
        JSONArray array = JSONArray.fromObject(actionTrees);
        result.put("data", array.toString());
       return result;
    }

    @RequestMapping("/addroleaction")
    @ResponseBody
    public String addroleaction(int roleid,int actionid, HttpServletRequest request){
        RoleAction roleAction=new RoleAction();
        roleAction.setRoleid(roleid);
        roleAction.setActionid(actionid);
        int Ret=roleService.addroleaction(roleAction);
        if(Ret>0){
            return "1";
        }else {
            return "0";
        }
    }

    @RequestMapping("/delroleaction")
    @ResponseBody
    public String delroleaction(int roleid,int actionid, HttpServletRequest request){

        RoleAction roleAction=new RoleAction();
        roleAction.setRoleid(roleid);
        roleAction.setActionid(actionid);
        int Ret=roleService.delroleaction(roleAction);
        if(Ret>0){
            return "1";
        }else {
            return "0";
        }
    }

}
