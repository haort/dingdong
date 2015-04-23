package com.lhdx.www.server.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.NoticeDao;
import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.Notice;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;

@Service("noticeService")
public class NoticeService {
	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;
	@Resource(name = "userDao")
	private UserDao userDao;

	public List<Notice> findNotices(String wxId){
		User u = userDao.findUserByWxId(wxId);
		if (u != null) {
			String xiaoqu = u.getXiaoqu();
			return noticeDao.findNoticesByXiaoqu(xiaoqu);
		}else{
			return null;
		}
	}

	public Notice findNotice2(String wxId){
		User u = userDao.findUserByWxId(wxId);
		if (u != null) {
			String xiaoqu = u.getXiaoqu();
			return noticeDao.findNoticeByXiaoqu(xiaoqu);
		}else{
			return null;
		}
	}

	public Map insertNotice2(String title, String description, String createUser,String image) {
		Map<String,Boolean> map = new HashMap<String, Boolean>();
		User u = userDao.findUserByWxId(createUser);
		if (u != null&&"admin1".equals(u.getAuth())) {
			Notice c = new Notice();
			c.setTitle(title);
			c.setDescription(description);
			c.setCreateUser(createUser);
			c.setXiaoqu(u.getXiaoqu());
			c.setCreateTime(DataFormat.formatDate(new Date()));
			c.setImage(image);
			noticeDao.addNotice(c);
			map.put("isAddSucessed",true);
		}else{
			map.put("isAddSucessed",false);
		}
		return map;
	}


}
