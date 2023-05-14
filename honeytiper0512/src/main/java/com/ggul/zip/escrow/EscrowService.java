package com.ggul.zip.escrow;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface EscrowService {
	
	//에스크로 내역조회
	List<EscrowVO> getEscrowList(EscrowVO vo);
	List<EscrowVO> getEscrowListByStatus(EscrowVO vo);
	
	//티퍼-회원 분쟁내역조회
	List<EscrowVO>getDisputeResolutionList(EscrowVO evo);
	//분쟁내역에서 검색결과 아약스에게주기
	ArrayList<EscrowVO>searchDispute(HashMap<String, Object> map);
	//진행상태거르기
	int checkStatus(EscrowVO vo);
	
	void update_price(EscrowVO vo);
	

		void insertEscrow(EscrowVO evo);
}
