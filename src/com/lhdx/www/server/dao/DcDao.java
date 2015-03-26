package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Dc;

@Component("dcDao")
public class DcDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.DcDao";
	private static final String ADDDC = ".addDc";
	private static final String FINDDCBYWXID = ".findDcByWxId";
	
	public void addDc(Dc dc){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("dc", dc);
		sqlSession.insert(NAMESPACE+ADDDC, map);
	}
	public Dc findDcByWxId(String wxId) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("wxId", wxId);
		return sqlSession.selectOne(NAMESPACE+FINDDCBYWXID,map);
	}
}
