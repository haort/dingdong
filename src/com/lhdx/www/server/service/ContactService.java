package com.lhdx.www.server.service;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lhdx.www.server.dao.ContactDao;
import com.lhdx.www.server.dao.UserDao;
import com.lhdx.www.server.model.Contact;
import com.lhdx.www.server.model.User;
import com.lhdx.www.server.util.DataFormat;

@Service("contactService")
public class ContactService {
	@Resource(name = "contactDao")
	private ContactDao contactDao;
	@Resource(name = "userDao")
	private UserDao userDao;

	public void insertContact(String name, String phone, String wenti,String wxId,String addr) {
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
			String xiaoqu = u.getXiaoqu();
			if(xiaoqu!=null){
				Contact c = new Contact();
				c.setName(name);
				c.setPhone(phone);
				c.setWenti(wenti);
				c.setWxId(wxId);
				c.setFlag("未处理");
				c.setRep("未评价");
				c.setXiaoqu(xiaoqu);
				c.setCreateTime(DataFormat.formatDate(new Date()));
				c.setAddr(addr);
				contactDao.addContact(c);
				if(u.getName()==null){
					u.setName(name);
				}
				if(u.getPhone()==null){
					u.setPhone(phone);
				}
				if(u.getAddr()==null){
					u.setAddr(addr);
				}
				userDao.updateUser(u);
			}
		}
	}

	public Map findContactsById(String wxId) {
		User u = userDao.findUserByWxId(wxId);
		Map<String,Object> map = new HashMap<String,Object>();  
		List<Contact> list = new ArrayList<Contact>();
		if(u!=null){
			list = contactDao.selectContactsById(wxId);
			map.put("contacts", list);
			return map;
		}else{
			return null;
		}
	}
	

	public boolean updateContactById(String wxId,String flag,String id){
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
			String auth = u.getAuth();
			//判断是否管理员更新留言
			if(auth!=null&&"admin1".equals(auth)){
				 contactDao.updateContactById(id, flag);
				 return true;
			}
			return false;
		}else{
			return false;
		}
	}
	
	public boolean replyContactById(String wxId,String rep,String id){
		User u = userDao.findUserByWxId(wxId);
		if(u!=null){
			 contactDao.replyContactById(id, rep);
			 return true;
		}else{
			return false;
		}
	}

	public Map findContactsByXiaoqu2(String wxId) {
		User u = userDao.findUserByWxId(wxId);
		Map<String,Object> map = new HashMap<String,Object>();
		List<Contact> list = new ArrayList<Contact>();
		if(u!=null){
			list = contactDao.selectContactsByXiaoqu(u.getXiaoqu());
			map.put("contacts", list);
			return map;
		}else{
			return null;
		}
	}

	public Map findAdContacts(String wxId) {

		User u = userDao.findUserByWxId(wxId);
		Map<String,Object> map = new HashMap<String,Object>();
		List<Contact> list = new ArrayList<Contact>();
		if(u!=null){
			list = contactDao.selectContactsByAdmin(u.getXiaoqu());
			map.put("contacts", list);
			return map;
		}else{
			return null;
		}
	}
}
