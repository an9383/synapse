package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.BaseInfoAdmVo;
import mes.persistence.bm.BaseInfoAdmDAO;

@Service
public class BaseInfoAdmServiceImpl implements BaseInfoAdmService {
	
	@Inject
	private BaseInfoAdmDAO dao;
	
//	// 70 검사항목 관리
//	// 검사항목 목록 조회
//	@Override
//	public List<BaseInfoAdmVo> baseInfoItList() throws Exception {
//		return dao.baseInfoItList();
//	}
//
//	// 검사항목 상세 조회
//	@Override
//	public BaseInfoAdmVo baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		return dao.baseInfoItRead(baseInfoAdmVo);
//	}
//
//	// 검사항목 등록
//	@Override
//	public void baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		dao.baseInfoItCreate(baseInfoAdmVo);
//	}
//
//	// 검사항목 수정
//	@Override
//	public void baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		dao.baseInfoItUpdate(baseInfoAdmVo);
//	}
//	
//	// 비가동 유형 전체 조회
//	@Override
//	public List<BaseInfoAdmVo> baseInfoDtList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		return dao.baseInfoDtList(baseInfoAdmVo);
//	}
//	
//
//	// 80 불량유형 관리
	// 불량유형 목록 조회
	@Override
	public List<BaseInfoAdmVo> baseInfoFtLst(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return dao.baseInfoFtLst(baseInfoAdmVo);
	}

	// 불량유형 상세 조회
	@Override
	public BaseInfoAdmVo baseInfoFtSel(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return dao.baseInfoFtSel(baseInfoAdmVo);
	}

	// 불량유형 등록
	@Override
	public void baseInfoFtIns(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		dao.baseInfoFtIns(baseInfoAdmVo);
	}

	// 불량유형 수정
	@Override
	public void baseInfoFtUpd(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		dao.baseInfoFtUpd(baseInfoAdmVo);
	}

	//삭제
	public void baseInfoFtDataDel(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		dao.baseInfoFtDataDel(baseInfoAdmVo);
	}
//	//불량유형 삭제
//	public void baseInfoFtDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
//		dao.baseInfoFtDelete(baseInfoAdmVo);
//	}
//
//	// 시퀀스 조회
//	public String faultyTypeSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
//		return dao.faultyTypeSeq(baseInfoAdmVo);
//	}
//	
//
//	// 시퀀스 조회
//	@Override
//	public String baseInfoSeq() throws Exception {
//		return dao.baseInfoSeq();
//	}
//	
//	// 코드 시퀀스 조회
//	@Override
//	public String baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		return dao.baseInfoCdSeq(baseInfoAdmVo);
//	}
	
//	// 공정정보관리(봉제조립) 비가동항목설정 조회
//	@Override
//	public List<BaseInfoAdmVo> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		return dao.prcssCodeNoList(baseInfoAdmVo);
//	}
//	
//	// 공정정보관리(봉제조립) 비가동항목설정 등록
//	@Override
//	public void prcssCodeNoCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		dao.prcssCodeNoCreate(baseInfoAdmVo);
//	}
//	
//	// 공정정보관리(봉제조립) 비가동항목설정 삭제
//	public void prcssCodeNoDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
//		dao.prcssCodeNoDelete(baseInfoAdmVo);
//	}
//	
	
}
