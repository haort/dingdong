package com.lhdx.www.server.service;

import com.lhdx.www.server.dao.HdDao;
import com.lhdx.www.server.dao.NoticeDao;
import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.Hd;
import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.PorderInfo;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;
import com.lhdx.www.server.util.SystemParam;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("hdService")
public class HdService {
    @Resource(name = "hdDao")
    private HdDao hdDao;
    @Resource(name = "userDao")
    private UserDao userDao;

    public Map insertHd(String wxId, String name, String phone, String addr, String image) {
        Map<String, Boolean> map = new HashMap<String, Boolean>();
        User u = userDao.findUserByWxId(wxId);
        if (u != null) {
            Hd hd = new Hd();
            hd.setImage(image);
            hd.setAddr(addr);
            hd.setName(name);
            hd.setPhone(phone);
            hd.setXiaoqu(u.getXiaoqu());
            hd.setWxId(wxId);
            hd.setCreateTime(DataFormat.formatDate(new Date()));
            hd.setState(SystemParam.HD_UPDATE);
            hdDao.addHd(hd);
            map.put("isAddSucessed", true);
        } else {
            map.put("isAddSucessed", false);
        }
        return map;
    }


    public List<Hd> findHds(String wxId) {
        return hdDao.findHds(wxId);
    }

    public boolean isJoined(String wxId) {
        Hd hd = hdDao.isJoined(wxId);
        if (hd != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<Hd> findHdInfo(String wxId) {
        User u = userDao.findUserByWxId(wxId);
        if(u!=null&&u.getComment()!=null&&"admin".equals(u.getComment())){
            return hdDao.findHdInfo();
        }else{
            return null;
        }
    }

}
