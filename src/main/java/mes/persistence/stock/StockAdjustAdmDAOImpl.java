package mes.persistence.stock;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.stock.StockAdjustAdmVo;

@Repository
public class StockAdjustAdmDAOImpl implements StockAdjustAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.stock.stockAdjustAdmMapper";
	
	// 초기/재고조정 등록
	@Override
	public void stockAdjustAdmIns(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		session.insert(namespace+".stockAdjustAdmIns" ,stockAdjustAdmVo);
	}
	
	// 초기/재고조정 수정
	@Override
	public void stockAdjustAdmUpd(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		session.update(namespace+".stockAdjustAdmUpd" ,stockAdjustAdmVo);
	}
	
	// 초기/재고조정 삭제
	@Override
	public void stockAdjustAdmDel(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		session.delete(namespace+".stockAdjustAdmDel" ,stockAdjustAdmVo);
	}
	
	// 초기/재고조정 전표번호 조회
	@Override
	public String getSaNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		return session.selectOne(namespace+".getSaNo" ,stockAdjustAdmVo);
	}
	
	// 초기/재고조정 목록 조회
	@Override
	public List<StockAdjustAdmVo> stockAdjustAdmListBySaNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		return session.selectList(namespace+".stockAdjustAdmListBySaNo" ,stockAdjustAdmVo);
	}
	
	// 초기/재고조정 목록 조회
	@Override
	public List<StockAdjustAdmVo> stockAdjustAdmListGroupBySaNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception {
		return session.selectList(namespace+".stockAdjustAdmListGroupBySaNo" ,stockAdjustAdmVo);
	}
}
