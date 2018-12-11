package com.oss.domain;

public class StudyInfo {
    private String username;
    private String batchname;
    private double studyratio;
    private int status;
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBatchname() {
        return batchname;
    }

    public void setBatchname(String batchname) {
        this.batchname = batchname;
    }

    public double getStudyratio() {
        return studyratio;
    }

    public void setStudyratio(double studyratio) {
        this.studyratio = studyratio;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
