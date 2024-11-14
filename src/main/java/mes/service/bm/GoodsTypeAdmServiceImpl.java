package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.GoodsTypeAdmVo;
import mes.persistence.bm.GoodsTypeAdmDAO;

@Service
public class GoodsTypeAdmServiceImpl implements GoodsTypeAdmService {

	@Inject
	private GoodsTypeAdmDAO dao;

	// 제품유형별 목록조회
	@Override
	public List<GoodsTypeAdmVo> GoodsTypeAdmLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeAdmLst(GoodsTypeAdmVo);
	}
	
	// 제품유형별 상세조회
	@Override
	public GoodsTypeAdmVo GoodsTypeAdmSel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeAdmSel(GoodsTypeAdmVo);
	}
	
	// 제품유형별 등록
	@Override
	public String GoodsTypeAdmIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeAdmIns(GoodsTypeAdmVo);
	}
	
	// 제품유형별 수정
	@Override
	public void GoodsTypeAdmUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		dao.GoodsTypeAdmUpd(GoodsTypeAdmVo);
	}
	
	// 제품유형별 삭제
	@Override
	public void GoodsTypeAdmDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		dao.GoodsTypeAdmDel(GoodsTypeAdmVo);
	}
	
	// 제품유형별 코드 중복 체크
	@Override
	public GoodsTypeAdmVo GoodsTypeCdCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeCdCheck(GoodsTypeAdmVo);
	}
	
	// 제품유형별 목록조회
	@Override
	public List<GoodsTypeAdmVo> GoodsTypeDtlLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeDtlLst(GoodsTypeAdmVo);
	}
	
	// 제품유형별 등록
	@Override
	public String GoodsTypeDtlIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsTypeDtlIns(GoodsTypeAdmVo);
	}
	
	// 제품유형별 수정
	@Override
	public void GoodsTypeDtlUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		dao.GoodsTypeDtlUpd(GoodsTypeAdmVo);
	}
	
	// 제품유형별 삭제
	@Override
	public void GoodsTypeDtlDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		dao.GoodsTypeDtlDel(GoodsTypeAdmVo);
	}
	
	// 제품유형별 코드 중복 체크
	@Override
	public GoodsTypeAdmVo GoodsNmCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return dao.GoodsNmCheck(GoodsTypeAdmVo);
	}
}

	