package com.lhdx.www.server.model;

/**
 * Created by mac on 15/4/14.
 */
public class PorderInfo {
    String productPic;
    String productName;
    String createTime;
    String num;

    public String getProductPic() {
        return productPic;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
}
