package com.ggul.zip.escrow;

import java.util.List;

public interface EscrowService {
	
	//에스크로 내역조회
	List<EscrowVO> getEscrowList(EscrowVO vo);
	List<EscrowVO> getEscrowListByStatus(EscrowVO vo);
}
