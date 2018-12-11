package com.oss.domain;

public class FileInfo {
    private int id;
    private int fileid;
    private double alltime;
    private double playtime;
    private double firatio;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFileid() {
        return fileid;
    }

    public void setFileid(int fileid) {
        this.fileid = fileid;
    }

    public double getAlltime() {
        return alltime;
    }

    public void setAlltime(double alltime) {
        this.alltime = alltime;
    }

    public double getPlaytime() {
        return playtime;
    }

    public void setPlaytime(double playtime) {
        this.playtime = playtime;
    }

    public double getFiratio() {
        return firatio;
    }

    public void setFiratio(double firatio) {
        this.firatio = firatio;
    }
}
