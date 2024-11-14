package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.GoodsTypeAdmVo;

public interface GoodsTypeAdmDAO {

	// 제품유형별 목록조회
	public List<GoodsTypeAdmVo> GoodsTypeAdmLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 상세조회
	public GoodsTypeAdmVo GoodsTypeAdmSel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 등록
	public String GoodsTypeAdmIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 수정
	public void GoodsTypeAdmUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 삭제
	public void GoodsTypeAdmDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 코드 중복 체크
	public GoodsTypeAdmVo GoodsTypeCdCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 목록조회
	public List<GoodsTypeAdmVo> GoodsTypeDtlLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 등록
	public String GoodsTypeDtlIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 수정
	public void GoodsTypeDtlUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 삭제
	public void GoodsTypeDtlDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
	
	// 제품유형별 코드 중복 체크
	public GoodsTypeAdmVo GoodsNmCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception;
}
