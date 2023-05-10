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
	 
	 public ArrayList<EscrowVO>searchDispute(HashMap<String, Object> map){
		 return  (ArrayList<EscrowVO>)escrowDAO.searchDispute(map);
	 }
	 public int checkStatus(EscrowVO vo) {
		 return escrowDAO.checkStatus(vo);
	 }
	 
	 public void update_price(EscrowVO vo) {
			escrowDAO.update_price(vo);
		}
	 
	 @Override
		public void insertEscrow(EscrowVO evo) {
			escrowDAO.insertEscrow(evo);
		}
	 
}
