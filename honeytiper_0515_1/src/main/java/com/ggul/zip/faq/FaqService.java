package com.ggul.zip.faq;

import java.util.List;

public interface FaqService {

	//글등록
	void insertFaq(FaqVO vo);

	//글수정
	void updateFaq(FaqVO vo);

	//글삭제
	void deleteFaq(FaqVO vo);
	
	//글상세
	FaqVO getFaq(FaqVO vo);
	
	//글목록 조회
	List<FaqVO> getFaqList(FaqVO vo);
}
