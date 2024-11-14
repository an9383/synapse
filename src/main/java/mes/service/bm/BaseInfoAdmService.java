package mes.service.bm;

import java.util.List;

import mes.domain.bm.BaseInfoAdmVo;

public interface BaseInfoAdmService {
	
	// 80 검사항목 관리
//	// 검사항목 목록 조회
//	public List<BaseInfoAdmVo>   baseInfoItLst() throws Exception;
//
//	// 검사항목 상세 조회
//	public BaseInfoAdmVo baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//
//	// 검사항목 등록
//	public void baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//
//	// 검사항목 수정
//	public void baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	// 비가동 유형 전체 조회
//	public List<BaseInfoAdmVo> baseInfoDtList(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	// 70 불량유형 관리
	// 불량유형 목록 조회
	public List<BaseInfoAdmVo> baseInfoFtLst(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 상세 조회
	public BaseInfoAdmVo baseInfoFtSel(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 등록
	public void baseInfoFtIns(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 수정
	public void baseInfoFtUpd(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	//삭제
	public void baseInfoFtDataDel(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	//불량유형 삭제
//	public void baseInfoFtDel(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	// 시퀀스 조회
//	public String faultyTypeSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	
//	//시퀀스 조회
//	public String baseInfoSeq() throws Exception;
//	
//	//코드시퀀스 조회
//	public String baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
//	// 공정정보관리(봉제조립) 비가동항목설정 조회
//	public List<BaseInfoAdmVo> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	// 공정정보관리(봉제조립) 비가동항목설정 등록
//	public void prcssCodeNoCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
//	
//	// 공정정보관리(봉제조립) 비가동항목설정 삭제
//	public void prcssCodeNoDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	

}
