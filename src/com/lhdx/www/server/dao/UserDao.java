package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.User;

@Component("userDao")
public class UserDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.UserDao";
	private static final String ADDUSER = ".addUser";
	private static final String FINDUSERBYWXID = ".selectUserByWxId";
	private static final String FINDUSERBYPHONE = ".selectUserByPhone";
	private static final String FINDADMIN = ".selectAdmin";
	private static final String UPDATEUSER = ".updateUser";
	private static final String UPDATEUSERINFO = ".updateUserInfo";
	private static final String UPDATEJF = ".updateJf";
	
	
	public void addUser(User u){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user", u);
		sqlSession.insert(NAMESPACE+ADDUSER, map);
	}
	public User findUserByWxId(String wxid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxid);
		return sqlSession.selectOne(NAMESPACE+FINDUSERBYWXID,map);
	}
	public User findUserByPhone(String phone) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("phone", phone);
		List<User> list = sqlSession.selectList(NAMESPACE+FINDUSERBYPHONE,map);
		if(list!=null&&list.size()!=0){
			return list.get(0);
		}else{
			return null;
		}
	}
	public void updateUser(int id,String auth){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("auth", auth);
		sqlSession.update(NAMESPACE+UPDATEUSER, map);
	}
	public void updateUser(User u){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user", u);
		sqlSession.update(NAMESPACE+UPDATEUSERINFO, map);
	}
	public User findAdmin(String wxid) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxid);
		return sqlSession.selectOne(NAMESPACE+FINDADMIN,map);
	}
	
	public void updateJf(int id,int jf,String jfDate){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("jf", jf);
		map.put("jfDate", jfDate);
		sqlSession.update(NAMESPACE+UPDATEJF, map);
	}
}
