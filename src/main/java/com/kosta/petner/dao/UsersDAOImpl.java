package com.kosta.petner.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.Users;

@Repository
public class UsersDAOImpl implements UsersDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	//회원가입
	@Override
	public void insertUsers(Users users) throws Exception {
		sqlSession.insert("mapper.users.insertUsers", users);
		
	}
	//아이디 중복체크
	@Override
	public Users selectId(String id) throws Exception {
		return sqlSession.selectOne("mapper.users.selectId", id);
	}
	//로그인
	@Override
	public Users getUsers(String id, String password) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		Users users = sqlSession.selectOne("mapper.users.getByIdAndPassword",map);
		
		return users;
	}
	//아이디찾기
	@Override
	public Users getId(Users users) {
		return sqlSession.selectOne("mapper.users.getId", users);
		
		
	}
	
	
	
	
	

}


	
	

	

