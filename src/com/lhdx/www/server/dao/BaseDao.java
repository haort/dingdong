package com.lhdx.www.server.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class BaseDao {

	@Resource(name="sqlSession")
	public SqlSessionTemplate sqlSession;
}
