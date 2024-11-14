package mes.persistence.stock;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.stock.StockPaymentAdmVo;

@Repository
public class StockPaymentAdmDAOImpl implements StockPaymentAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.stock.stockPaymentAdmMapper";
	
	// 수불관리 조회
	@Override
	public StockPaymentAdmVo stockPaymentAdmSelBySpSourceNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".stockPaymentAdmSelBySpSourceNo" ,stockPaymentAdmVo);
	}
	
	// 수불리스트 조회
	@Override
	public List<StockPaymentAdmVo> stockLstBySpSourceNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".stockLstBySpSourceNo" ,stockPaymentAdmVo);
	}
	
	// 수불관리 등록
	@Override
	public void stockPaymentAdmIns(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		session.insert(namespace+".stockPaymentAdmIns" ,stockPaymentAdmVo);
	}
	
	// 수불관리 등록 ( 채번 없이 강제로 데이터만 등록 )
	@Override
	public void stockPaymentAdmCompulsionIns(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		session.insert(namespace+".stockPaymentAdmCompulsionIns" ,stockPaymentAdmVo);
	}
	
	// 수불관리 수정
	@Override
	public void stockPaymentAdmUpd(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		session.update(namespace+".stockPaymentAdmUpd" ,stockPaymentAdmVo);
	}
	
	// 수불관리 삭제
	@Override
	public void stockPaymentAdmDel(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		session.delete(namespace+".stockPaymentAdmDel" ,stockPaymentAdmVo);
	}
	
	// 수불관리 전표번호 조회
	@Override
	public String stockPaymentAdmGetSpNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".stockPaymentAdmGetSpNo" ,stockPaymentAdmVo);
	}
	
	// ================================== 현재고현황 =======================================
	// 현재고현황 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmStatusLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".stockPaymentAdmStatusLst" ,stockPaymentAdmVo);
	}
	
	// 재고이동 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentMoveLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".stockPaymentMoveLst" ,stockPaymentAdmVo);
	}
	
	// 현재고현황 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmOriginalLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".stockPaymentAdmOriginalLst" ,stockPaymentAdmVo);
	}
	
	// ================================== 불용재고현황 =======================================
	// 불용재고현황 목록조회
	@Override
	public List<StockPaymentAdmVo> obsoleteStockLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".obsoleteStockLst" ,stockPaymentAdmVo);
	}
	
	// ================================== 재고이동 ==========================================
	// 수불관리 등록
	@Override
	public void stockPaymentAdmIns2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		session.insert(namespace+".stockPaymentAdmIns2", stockPaymentAdmVo);
	}
	
	// 수불관리 삭제
	@Override
	public void stockPaymentAdmDel2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		session.delete(namespace+".stockPaymentAdmDel2", stockPaymentAdmVo);
	}
	
}
