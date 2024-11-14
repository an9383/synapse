package mes.service.stock;

import java.util.List;

import mes.domain.stock.StockSummaryAdmVo;

public interface StockSummaryAdmService {
	
	// 재고 현황 목록
	public List<StockSummaryAdmVo> stockSummaryAdmLst(StockSummaryAdmVo stockSummaryAdmVo);
	
	// 재고 등록
	public void stockSummaryAdmIns(StockSummaryAdmVo stockSummaryAdmVo) throws Exception;
	
}