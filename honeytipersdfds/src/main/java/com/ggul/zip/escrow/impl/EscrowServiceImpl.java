package com.ggul.zip.escrow.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ggul.zip.escrow.EscrowService;
import com.ggul.zip.escrow.EscrowVO;

@Service("escrowService")
public class EscrowServiceImpl implements EscrowService {

	@Autowired
	private EscrowDAO escrowDAO;
	
	@Override
	public List<EscrowVO> getEscrowList(EscrowVO vo) {
		return escrowDAO.getEscrowList(vo);
	}
	public List<EscrowVO> getEscrowListByStatus(EscrowVO vo){
		return escrowDAO.getEscrowListByStatus(vo);
	}
	 public List<EscrowVO>getDisputeResolutionList(EscrowVO vo){
	 	return escrowDAO.getDisputeResolutionList(vo);
	 }
	 public List<EscrowVO>searchAndStatus(EscrowVO vo){
		 return escrowDAO.searchAndStatus(vo);
	 }

	 public ArrayList<EscrowVO>searchDispute(HashMap<String, Object> map){
		 return  (ArrayList<EscrowVO>)escrowDAO.searchDispute(map);
	 }
	 //상태거르기
	 public int checkStatus(EscrowVO vo) {
		 return escrowDAO.checkStatus(vo);
	 }
	//강제완료 눌렀을때
	 public void updateStatus0103(EscrowVO vo) {
		 escrowDAO.updateStatus0103(vo);
	 }
	 public void insertTiperPointList(EscrowVO vo) {
		 escrowDAO.insertTiperPointList(vo);
	 }
	 public void updateTiperPoint(EscrowVO vo) {
		 escrowDAO.updateTiperPoint(vo);
	 }
	 //취소 눌렀을때
	 public void updateStatus04(EscrowVO vo) {
		 escrowDAO.updateStatus04(vo);
	 }
	 public void insertUserPointList(EscrowVO vo) {
		 escrowDAO.insertUserPointList(vo);
	 }
	 public void updateUserPoint(EscrowVO vo) {
		 escrowDAO.updateUserPoint(vo);
	 }
	//-------------------------------------------------------------- 
	 @Override
		public void insertEscrow(EscrowVO evo) {
			escrowDAO.insertEscrow(evo);
		}
	 
	 @Override
	 	public void updateEscrowStatus12(EscrowVO evo) {
		 	escrowDAO.updateEscrowStatus12(evo);
	 }
	 	public void insertSalesCommission(EscrowVO vo) {
	 		escrowDAO.insertSalesCommission(vo);
	 	}
	 
	 
//	 현민
	 public void update_price(EscrowVO vo) {
			escrowDAO.update_price(vo);
		}
	 
	public EscrowVO select_status(EscrowVO vo) {
		return escrowDAO.select_status(vo);
	}
}
