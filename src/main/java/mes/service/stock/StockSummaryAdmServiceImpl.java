package mes.service.stock;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import mes.domain.stock.StockSummaryAdmVo;
import mes.persistence.stock.StockSummaryAdmDAO;

@Repository
public class StockSummaryAdmServiceImpl implements StockSummaryAdmService {

	@Inject
	private StockSummaryAdmDAO dao;
	
	// 재고 현황 목록
	@Override
	public List<StockSummaryAdmVo> stockSummaryAdmLst(StockSummaryAdmVo stockSummaryAdmVo){
		return dao.stockSummaryAdmLst(stockSummaryAdmVo);
	}
	
	// 재고 등록
	@Override
	public void stockSummaryAdmIns(StockSummaryAdmVo stockSummaryAdmVo) throws Exception {
		dao.stockSummaryAdmIns(stockSummaryAdmVo);
	}
	
}
