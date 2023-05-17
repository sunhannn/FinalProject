package com.ggul.zip.tiper;

public interface TiperService {

	int insertTiper(TiperVO tiperVO);

	TiperVO selectTiper(TiperVO tiperVO);

	int tiperUpdate(TiperVO tiperVO);

	int selecTiperCount(TiperVO tiperVO);

	int tiperInitialization(TiperVO tiperVO);
	
	
	//상현이부분
	TiperVO selectTiperInfo(TiperVO tiperVO);
	
}
