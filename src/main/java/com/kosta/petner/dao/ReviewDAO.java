package com.kosta.petner.dao;

import java.util.List;

import com.kosta.petner.bean.PageInfo;
import com.kosta.petner.bean.Review;

public interface ReviewDAO {
	
	//내가 쓴 개시글 수
	Integer selectWrittenReviewCount();
	
	//내가 쓴 게시글
	List<Review> writtenReviewList(Integer page, PageInfo pageInfo);
	
	//리뷰작성
	void writeReview(Review review);
}
