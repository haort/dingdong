package com.lhdx.www.server.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import com.lhdx.www.server.dao.ContactDao;
import com.lhdx.www.server.dao.PorderDao;
import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;

@Service("userService")
public class UserService {
	@Resource(name = "userDao")
	private UserDao userDao;

	@Resource(name="porderDao")
	private PorderDao porderDao;

	@Resource(name="contactDao")
	private ContactDao contactDao;

	public void insertUser(String name, String phone, String addr,
			String comment, String xiaoqu, String wxId, String birthday) {
		User user = userDao.findUserByWxId(wxId);
		if (user == null) {
			User u = new User();
			u.setName(name);
			u.setPhone(phone);
			u.setAddr(addr);
			u.setComment(comment);
			u.setWxId(wxId);
			u.setXiaoqu(xiaoqu);
			u.setCreateTime(DataFormat.formatDate(new Date()));
			u.setBirthday(birthday);
			u.setAuth("");
			u.setJf(0);
			userDao.addUser(u);
		}else{
			user.setAddr(null);
			user.setXiaoqu(xiaoqu);
			userDao.updateUserXiaoqu(user);
		}
	}

	public User findUserByWxId(String wxId) {
		return  userDao.findUserByWxId(wxId);
	}

	public Map addjf(String wxId,String jf) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userDao.findUserByWxId(wxId);
		int n = 0;
		if (user != null) {
			if(jf!=null&&!"".equals(jf)){
				 n = Integer.parseInt(jf);
			}
			String jfDate = user.getJfDate();
			String nwDateS = df.format(new Date());
			if(jfDate !=null && !"".equals(jfDate)){
				try {
					Date dt1 = df.parse(user.getJfDate());
					Date nowDate = df.parse(nwDateS);
					if (dt1.getTime() < nowDate.getTime()) {
						userDao.updateJf(user.getId(), user.getJf()+n,nwDateS);
						map.put("qd", true);
						map.put("jf", user.getJf()+n);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}else if(jfDate ==null||"".equals(jfDate)){
				userDao.updateJf(user.getId(), user.getJf()+n,nwDateS);
				map.put("qd", true);
				map.put("jf", user.getJf()+n);
			}
		} 
		return map;
	}

	public Map isDq(User u) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (u != null) {
			User user = findUserByWxId(u.getWxId());
			String jfDate = user.getJfDate();
			if(jfDate !=null && !"".equals(jfDate)){
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date dt1 = df.parse(user.getJfDate());
					String nwDateS = df.format(new Date());
					Date nowDate = df.parse(nwDateS);
					if (dt1.getTime() < nowDate.getTime()) {
						map.put("qd", false);
						map.put("jf", user.getJf());
					} else {
						map.put("qd", true);
						map.put("jf", user.getJf());
					}
				} catch (ParseException e) {
					e.printStackTrace();
					map.put("qd", false);
				}
			}else if(jfDate ==null||"".equals(jfDate)){
				map.put("qd", false);
				map.put("jf", user.getJf());
			}
		}
		return map;

	}

	public void updateUser(String wxId, String name, String phone,String addr, String birthday, String comment) {
		User user = userDao.findUserByWxId(wxId);
		if (user != null) {
			user.setName(name);
			user.setPhone(phone);
			user.setAddr(addr);
			user.setComment(comment);
			user.setBirthday(birthday);
			userDao.updateUser2(user);
		}
	}

	public Map initUserView(String wxId) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = userDao.findUserByWxId(wxId);
		if (user != null) {
			map.put("jf", user.getJf());
			map.put("lp", porderDao.findPorders(user.getWxId()).size());
			map.put("fk", contactDao.selectContactsById(user.getWxId()).size());
		}
		return map;
	}
}
