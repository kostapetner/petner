package com.kosta.petner.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Review;


@Repository
public class ReviewDAOImpl implements ReviewDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public Integer selectWrittenReviewCount() {
		return sqlSession.selectOne("mapper.review.writtenReviewConunt"); 
	}

	public List<Review> writtenReviewList(Integer page, PageInfo pageInfo) {
		return sqlSession.selectList("mapper.review.writtenReviewList");
	}

	public void writeReview(Review review) {
		sqlSession.insert("mapper.review.writeReview", review);
	}
	
	
}


	
	

	

