package mes.web.stock;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.stock.StockSummaryAdmVo;
import mes.service.stock.StockSummaryAdmService;
import mes.web.ut.Utils;

@Controller
public class StockSummaryAdmController {
	private static final Logger logger = LoggerFactory.getLogger(StockSummaryAdmController.class);
	
	@Inject
	private StockSummaryAdmService stockSummaryAdmService;
	
	// 재고 현황 조회
	@RequestMapping(value = "stock/stockSummaryAdmList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockSummaryAdmList(StockSummaryAdmVo stockSummaryAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고 현황 목록 조회");
		try {
			List<StockSummaryAdmVo> stockSummaryAdmList = stockSummaryAdmService.stockSummaryAdmLst(stockSummaryAdmVo);
			jsonData.put("data", stockSummaryAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 재고 등록 및 수정
	@RequestMapping(value = "stock/stockSummaryAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockSummaryAdmIns(StockSummaryAdmVo stockSummaryAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고 등록 및 수정");
		try {
			stockSummaryAdmService.stockSummaryAdmIns(stockSummaryAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	
}
