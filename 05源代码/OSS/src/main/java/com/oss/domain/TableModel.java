package com.oss.domain;

import org.apache.poi.ss.formula.functions.T;

import java.util.List;

public class TableModel {
    private int code;
    private String msg;
    private int count;
    private List<T> data;
public TableModel(){
    this.code=0;
    this.msg="";
}
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
