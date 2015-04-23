package com.lhdx.www.server.model;

/**
 * Created by mac on 15/4/20.
 */
public class XiaoquUsers {
    private String xiaoqu;
    private int allUserNum;
    private int namedUserNum;
    private int adminNum;

    public String getXiaoqu() {
        return xiaoqu;
    }

    public void setXiaoqu(String xiaoqu) {
        this.xiaoqu = xiaoqu;
    }

    public int getAllUserNum() {
        return allUserNum;
    }

    public void setAllUserNum(int allUserNum) {
        this.allUserNum = allUserNum;
    }

    public int getNamedUserNum() {
        return namedUserNum;
    }

    public void setNamedUserNum(int namedUserNum) {
        this.namedUserNum = namedUserNum;
    }

    public int getAdminNum() {
        return adminNum;
    }

    public void setAdminNum(int adminNum) {
        this.adminNum = adminNum;
    }
}
