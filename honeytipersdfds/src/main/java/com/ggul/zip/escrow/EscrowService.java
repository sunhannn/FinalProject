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
	List<EscrowVO>searchAndStatus(EscrowVO vo);
	//분쟁내역에서 검색결과 아약스에게주기
	ArrayList<EscrowVO>searchDispute(HashMap<String, Object> map);
	//진행상태거르기
	//강제완료 눌렀을때 에스크로 진행상태거르기
			int checkStatus(EscrowVO vo);
			//에스크로 3상태변경
			void updateStatus0103(EscrowVO vo);
			//티퍼의 아이디로 포인트리스트insert(강의료입급)
			void insertTiperPointList(EscrowVO vo);
			//(티퍼기준)유저테이블 유저포인트 업데이트(강의료입급)
			void updateTiperPoint(EscrowVO vo);
			
			//취소 눌렀을때 에스크로 4상태변경
			void updateStatus04(EscrowVO vo);
			//유저의 아이디로 포인트리스트insert(강의료환불)
			void insertUserPointList(EscrowVO vo);
			//유저테이블 유저포인트 업데이트(강의료환불)
			void updateUserPoint(EscrowVO vo);
			//강제완료시에 5%세일즈에 줌
			void insertSalesCommission(EscrowVO vo);
//----------------------------------------------------------------------
		void insertEscrow(EscrowVO evo);
		
		void updateEscrowStatus12(EscrowVO evo);
		
		void update_price(EscrowVO vo);
		
		EscrowVO select_status(EscrowVO vo);
}
