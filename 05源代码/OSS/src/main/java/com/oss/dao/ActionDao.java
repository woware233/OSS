package com.oss.dao;

import com.oss.domain.Action;

import java.util.List;

public interface ActionDao {
    List<Action> findActionListByUserId(int userid);
    List<Action> findActionList();
    int actioncount();
    List<Action> roleAction(int roleid);
    List<Action> allAction();
    int addAction(Action action);
    int deleteAction(List<Integer> list);
}
