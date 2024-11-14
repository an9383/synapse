package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.GoodsTypeAdmVo;


@Repository
public class GoodsTypeAdmDAOImpl implements GoodsTypeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.goodsTypeAdmMapper";
	
	// 제품유형별 목록조회
	@Override
	public List<GoodsTypeAdmVo> GoodsTypeAdmLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return session.selectList(namespace+".GoodsTypeAdmLst", GoodsTypeAdmVo);
	}
	
	// 제품유형별 상세조회
	@Override
	public GoodsTypeAdmVo GoodsTypeAdmSel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return session.selectOne(namespace+".GoodsTypeAdmSel", GoodsTypeAdmVo);
	}
	
	// 제품유형별 등록
	@Override
	public String GoodsTypeAdmIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.insert(namespace+".GoodsTypeAdmIns", GoodsTypeAdmVo);
		String idx = GoodsTypeAdmVo.getIdx();
		return idx;
	}
	
	// 제품유형별 수정
	@Override
	public void GoodsTypeAdmUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.update(namespace+".GoodsTypeAdmUpd", GoodsTypeAdmVo);
	}
	
	// 제품유형별 삭제
	@Override
	public void GoodsTypeAdmDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.delete(namespace+".GoodsTypeAdmDel", GoodsTypeAdmVo);
	}
	
	// 제품유형별 코드 중복 체크
	@Override
	public GoodsTypeAdmVo GoodsTypeCdCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return session.selectOne(namespace+".GoodsTypeCdCheck", GoodsTypeAdmVo);
	}
	
	// 제품유형별 목록조회
	@Override
	public List<GoodsTypeAdmVo> GoodsTypeDtlLst(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return session.selectList(namespace+".GoodsTypeDtlLst", GoodsTypeAdmVo);
	}
	
	// 제품유형별 등록
	@Override
	public String GoodsTypeDtlIns(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.insert(namespace+".GoodsTypeDtlIns", GoodsTypeAdmVo);
		String idx = GoodsTypeAdmVo.getIdx();
		return idx;
	}
	
	// 제품유형별 수정
	@Override
	public void GoodsTypeDtlUpd(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.update(namespace+".GoodsTypeDtlUpd", GoodsTypeAdmVo);
	}
	
	// 제품유형별 삭제
	@Override
	public void GoodsTypeDtlDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		session.delete(namespace+".GoodsTypeDtlDel", GoodsTypeAdmVo);
	}
	
	// 제품유형별 코드 중복 체크
	@Override
	public GoodsTypeAdmVo GoodsNmCheck(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		return session.selectOne(namespace+".GoodsNmCheck", GoodsTypeAdmVo);
	}
}