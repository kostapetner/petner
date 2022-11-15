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
	public Users selectId(String id) {
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
	public Users getId(String name, String email) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		Users users = sqlSession.selectOne("mapper.users.getId",map);
		
		return users;
	}
	//임시비밀번호발급
	@Override
	public void updatePw(Users users) {
		 sqlSession.selectOne("mapper.users.updatePw", users);		
	}
	
	// 카카오 정보 저장
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		sqlSession.insert("mapper.users.kakaoInsert",userInfo);
	}

	// 카카오 정보 확인
	public Users findkakao(HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		return sqlSession.selectOne("mapper.users.findKakao", userInfo);
	}
	
	
	
	
	// user정보 가져오기 221113-조다솜
	public Users getMyinfo(String id){		
		return sqlSession.selectOne("mapper.users.getMyinfo", id);
	}
	@Override
	public int updateMyinfo(Users users) {
		return sqlSession.update("mapper.users.updateMyinfo", users);
	}
	@Override
	public void passwordUpdate(Users users) {
		// TODO Auto-generated method stub
		
	}

	
	
	

}


	
	

	

