package com.lhdx.www.server.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.lhdx.www.server.model.Notice;

@Component("noticeDao")
public class NoticeDao extends BaseDao {
	private static final String NAMESPACE = "com.lhdx.www.server.dao.NoticeDao";
	private static final String ADDNOTICE = ".addNotice";
	private static final String FINDNOTICEBYXIAOQU = ".selectNoticeByXiaoqu";
	private static final String FINDNOTICESBYXIAOQU = ".selectNoticesByXiaoqu";
	
	public void addNotice(Notice u){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("notice", u);
		sqlSession.insert(NAMESPACE+ADDNOTICE, map);
	}
	public Notice findNoticeByXiaoqu(String xiaoqu) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("xiaoqu", xiaoqu);
		return sqlSession.selectOne(NAMESPACE+FINDNOTICEBYXIAOQU,map);
	}
	
	public List<Notice> findNoticesByXiaoqu(String xiaoqu) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("xiaoqu", xiaoqu);
		return sqlSession.selectList(NAMESPACE+FINDNOTICESBYXIAOQU,map);
	}
}
