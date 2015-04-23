package com.lhdx.www.server.dao;

import com.lhdx.www.server.model.Hd;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component("hdDao")
public class HdDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.HdDao";
	private static final String ADDHD = ".addHd";
	private static final String SELECTHDSBYWXID = ".selectHdsByWxId";
	private static final String ISJOINED = ".isJoined";
	private static final String SELECTHDINFO = ".selectHdInfo";

	public void addHd(Hd u){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("hd", u);
		sqlSession.insert(NAMESPACE + ADDHD, map);
	}
	//用户查询
	public List<Hd> findHds(String wxId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxId);
		return sqlSession.selectList(NAMESPACE+SELECTHDSBYWXID,map);
	}

	public Hd isJoined(String wxId){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxId);
		return sqlSession.selectOne(NAMESPACE + ISJOINED, map);
	}

	//管理员查询
	public List<Hd> findHdInfo() {
		return sqlSession.selectList(NAMESPACE + SELECTHDINFO);
	}
}
