package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Contact;

@Component("contactDao")
public class ContactDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.ContactDao";
	private static final String ADDCONTACT = ".addContact";
	private static final String SELECTCONTACTSBYXIAOQU = ".selectContactsByXiaoqu";
	private static final String SELECTCONTACTSBYID = ".selectContactsById";
	private static final String UPDATECONTACTBYID = ".updateContactById";
	private static final String REPLYCONTACTBYID = ".replyContactById";
	private static final String SELECTCONTACTSBYADMIN = ".selectContactsByAdmin";
	
	public void addContact(Contact u){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("contact", u);
		sqlSession.insert(NAMESPACE+ADDCONTACT, map);
	}
	public List<Contact> selectContactsByXiaoqu(String xiaoqu) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("xiaoqu", xiaoqu);
		return sqlSession.selectList(NAMESPACE + SELECTCONTACTSBYXIAOQU,map);
	}
	public List<Contact> selectContactsByAdmin(String xiaoqu) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("xiaoqu", xiaoqu);
		return sqlSession.selectList(NAMESPACE + SELECTCONTACTSBYADMIN,map);
	}
	public List<Contact> selectContactsById(String wxId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxId);
		return sqlSession.selectList(NAMESPACE + SELECTCONTACTSBYID,map);
	}
	
	public void updateContactById(String id,String flag){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("flag", flag);
		sqlSession.update(NAMESPACE + UPDATECONTACTBYID, map);
	}
	public void replyContactById(String id,String rep){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("rep", rep);
		sqlSession.update(NAMESPACE+REPLYCONTACTBYID, map);
	}
}
