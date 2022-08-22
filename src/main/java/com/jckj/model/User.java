package com.jckj.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: SkLily
 * @date: 2022/8/19 19:04
 * @description:
 */
public class User implements Serializable {
    private String uid;
    private String uname;
    private String uportrait;
    private String uphone;
    private Long isDelete;
    private Date createTime;
    private String createTimestr;
    private Date updateTime;
    private String updateTimestr;
    private Integer guardianId;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUportrait() {
        return uportrait;
    }

    public void setUportrait(String uportrait) {
        this.uportrait = uportrait;
    }

    public String getUphone() {
        return uphone;
    }

    public void setUphone(String uphone) {
        this.uphone = uphone;
    }

    public Long getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Long isDelete) {
        this.isDelete = isDelete;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateTimestr() {
        return createTimestr;
    }

    public void setCreateTimestr(String createTimestr) {
        this.createTimestr = createTimestr;
    }

    public String getUpdateTimestr() {
        return updateTimestr;
    }

    public void setUpdateTimestr(String updateTimestr) {
        this.updateTimestr = updateTimestr;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public Integer getGuardianId() {
        return guardianId;
    }

    public void setGuardianId(Integer guardianId) {
        this.guardianId = guardianId;
    }

    public User() {
    }

    public User(String uid, String uname, String uportrait, String uphone, Long isDelete, Date createTime, String createTimestr, Date updateTime, String updateTimestr, Integer guardianId) {
        this.uid = uid;
        this.uname = uname;
        this.uportrait = uportrait;
        this.uphone = uphone;
        this.isDelete = isDelete;
        this.createTime = createTime;
        this.createTimestr = createTimestr;
        this.updateTime = updateTime;
        this.updateTimestr = updateTimestr;
        this.guardianId = guardianId;
    }
}
