package mes.persistence.stock;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.stock.StockSummaryAdmVo;

@Repository
public class StockSummaryAdmDAOImpl implements StockSummaryAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.stock.stockSummaryAdmMapper";
	
	// 재고 현황 목록
	@Override
	public List<StockSummaryAdmVo> stockSummaryAdmLst(StockSummaryAdmVo stockSummaryAdmVo){
		return session.selectList(namespace+".stockSummaryAdmLst", stockSummaryAdmVo);
	}
	
	// 재고 등록
	@Override
	public void stockSummaryAdmIns(StockSummaryAdmVo stockSummaryAdmVo) throws Exception {
		session.insert(namespace+".stockSummaryAdmIUD" ,stockSummaryAdmVo);
	}
}
