package com.oss.service;

import com.oss.dao.ActionDao;
import com.oss.domain.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActionService {
    @Autowired
    ActionDao actionDao;
    public List<Action> findActionListByUserId(int userid){
        return actionDao.findActionListByUserId(userid);
    }
    public  List<Action> findActionList(){
        return actionDao.findActionList();
    }
    public int actioncount(){
        return actionDao.actioncount();
    };

    public List<Action> roleAction(int roleid){
        return actionDao.roleAction(roleid);
    };
    public List<Action> allAction(){
       return actionDao.allAction();
    };
    public int addAction(Action action){return actionDao.addAction(action);}
    public int deleteAction(List<Integer> list){return actionDao.deleteAction(list);}
}
