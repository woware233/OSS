package com.oss.domain;

import java.util.List;

public class UserRole {
    private int id;
    private int userid;
    private int roleid;
    private List<UserRole> userroleList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public List<UserRole> getUserroleList() {
        return userroleList;
    }

    public void setUserroleList(List<UserRole> userroleList) {
        this.userroleList = userroleList;
    }
}
