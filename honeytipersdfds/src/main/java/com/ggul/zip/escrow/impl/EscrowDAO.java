package com.ggul.zip.escrow.impl;

import java.util.ArrayList;
import java.util.HashMap;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ggul.zip.escrow.EscrowVO;

@Repository
public class EscrowDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<EscrowVO> getEscrowList(EscrowVO vo) {
		System.out.println("에스크로 리스트 다오를 가는가");
		return mybatis.selectList("EscrowDAO.getEscrowList", vo);
	}

	public List<EscrowVO> getEscrowListByStatus(EscrowVO vo) {
		return mybatis.selectList("EscrowDAO.getEscrowListByStatus", vo);
	}

	public List<EscrowVO> getDisputeResolutionList(EscrowVO vo) {
		return mybatis.selectList("EscrowDAO.getDisputeResolutionList", vo);
	}

	public List<EscrowVO> searchDispute(HashMap<String, Object> map) {
		return mybatis.selectList("EscrowDAO.searchDispute", map);
	}
	public List<EscrowVO> searchAndStatus(EscrowVO vo) {
		return mybatis.selectList("EscrowDAO.searchAndStatus", vo);
	}
	//상태거르기
			public int checkStatus(EscrowVO vo) {
				return mybatis.selectOne("EscrowDAO.checkStatus",vo);
			}
			//강제완료 눌렀을때
			public void updateStatus0103(EscrowVO vo) {
				mybatis.update("EscrowDAO.updateStatus0103",vo);
			 }
			 public void insertTiperPointList(EscrowVO vo) {
				mybatis.insert("EscrowDAO.insertTiperPointList",vo);
			 }
			 public void updateTiperPoint(EscrowVO vo) {
				 mybatis.update("EscrowDAO.updateTiperPoint",vo);
			 }
			 
			 //취소눌렀을때
			 public void updateStatus04(EscrowVO vo) {
				 mybatis.update("EscrowDAO.updateStatus04",vo);
			 }
			 public void insertUserPointList(EscrowVO vo) {
				 mybatis.insert("EscrowDAO.insertUserPointList",vo);
			 }
			 public void updateUserPoint(EscrowVO vo) {
				 mybatis.update("EscrowDAO.updateUserPoint",vo);
			 }

			public void  insertSalesCommission(EscrowVO vo) {
				 mybatis.insert("EscrowDAO.insertSalesCommission",vo);
			}
//------------------------------------------------------------------------------
	// 정보 조회
	public ArrayList<EscrowVO> select_escrow(EscrowVO vo) {

		ArrayList<EscrowVO> list = (ArrayList) mybatis.selectList("EscrowDAO.select_escrow", vo);

		return list;
	}

	// 제시된 가격 업데이트
	public void update_price(EscrowVO vo) {
		System.out.println("===> 에스크로 가격설정");
		mybatis.update("EscrowDAO.update_price", vo);
	}

	// 강의 상태 업데이트
	public int escrow_status(EscrowVO vo) {
		System.out.println("===> 수락 처리");
		int status = mybatis.update("EscrowDAO.escrow_status", vo);
		System.out.println("status==" + status);
		return status;
	}
	
	// 거래시 상태 조회
	public EscrowVO select_status(EscrowVO vo) {
		System.out.println("상태조회");
		EscrowVO select_status = mybatis.selectOne("EscrowDAO.select_status", vo);
		return select_status;
	}

	// Escrow테이블에 수강생id, 강사코드, 강의번호 insert ------성현
	public void insertEscrow(EscrowVO evo) {
		System.out.println("===>Spring JDBC로 insertEscrow() 기능처리");
		System.out.println(evo);

		mybatis.insert("EscrowDAO.insertEscrow", evo);
	}

	// 성현
	public void updateEscrowStatus12(EscrowVO evo) {
		System.out.println("===>Spring JDBC로 updateEscrowStatus12() 기능처리");
		System.out.println(evo);

		mybatis.insert("EscrowDAO.updateEscrowStatus12", evo);
	}
	
}
