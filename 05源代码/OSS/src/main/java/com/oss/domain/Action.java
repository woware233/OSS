package com.oss.domain;

import java.util.List;

public class Action {
    private Integer id;

    private String name;

    private String href;

    private Integer pid;
    private boolean spread;
    private List<Action> children;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getPid() {
        return pid;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public List<Action> getChildren() {
        return children;
    }

    public void setChildren(List<Action> children) {
        this.children = children;
    }

    public void toString(int id, String actionName, String actionUrl, int parentId){
        System.out.println( "id="+id+"name="+actionName+"href="+actionUrl+"pid="+parentId);
    }
}
