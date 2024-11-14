package mes.persistence.stock;

import java.util.List;

import mes.domain.stock.StockSummaryAdmVo;

public interface StockSummaryAdmDAO {
	
	// 재고 현황 목록
	public List<StockSummaryAdmVo> stockSummaryAdmLst(StockSummaryAdmVo stockSummaryAdmVo);
	
	// 재고 등록
	public void stockSummaryAdmIns(StockSummaryAdmVo stockSummaryAdmVo) throws Exception;

}