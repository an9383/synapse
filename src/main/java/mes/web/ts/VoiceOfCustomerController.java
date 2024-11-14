package mes.web.ts;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.stock.StockPaymentAdmVo;
import mes.domain.stock.StockSummaryAdmVo;
import mes.domain.ts.VoiceOfCustomerVo;
import mes.service.pm.PurchaseOrderService;
import mes.service.stock.StockPaymentAdmService;
import mes.service.stock.StockSummaryAdmService;
import mes.service.ts.VoiceOfCustomerService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class VoiceOfCustomerController {
	
	@Inject
	private VoiceOfCustomerService vocService;
	@Inject
	private StockSummaryAdmService stockSummaryAdmService;
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private PurchaseOrderService purchaseOrderService;
	
	private static final Logger logger = LoggerFactory.getLogger(VoiceOfCustomerController.class);
	
	// tssc0010 페이지
	@RequestMapping(value = "/ts/tssc0010", method = RequestMethod.GET)
	public ModelAndView tssc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /ts/tssc0010");
		mav.addObject("userName", Utils.getUserNm());
		mav.setViewName("/ts/tssc0010");
		return mav;
	}
	
	// tssc0020 페이지
	@RequestMapping(value = "/ts/tssc0020", method = RequestMethod.GET)
	public ModelAndView tssc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /ts/tssc0020");
		mav.addObject("userName", Utils.getUserNm());
		mav.setViewName("/ts/tssc0020");
		return mav;
	}
	
	// tssc0030 페이지
	@RequestMapping(value = "/ts/tssc0030", method = RequestMethod.GET)
	public ModelAndView tssc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /ts/tssc0030");
		mav.addObject("userName", Utils.getUserNm());
		mav.setViewName("/ts/tssc0030");
		return mav;
	}
	
	@RequestMapping(value = "/ts/voiceOfCustomerAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> voiceOfCustomerAdmLst(VoiceOfCustomerVo vocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("사용자승인권한관리: "+cmplnReceiveVo);
		try {
			List<VoiceOfCustomerVo> vocVoList = vocService.voiceOfCustomerAdmLst(vocVo);
			jsonData.put("data", vocVoList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/voiceOfCustomerDtlLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> voiceOfCustomerDtlLst(VoiceOfCustomerVo vocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("사용자승인권한관리: "+csReceiveVo);
		try {
			List<VoiceOfCustomerVo> vocVoList = vocService.voiceOfCustomerDtlLst(vocVo);
			jsonData.put("data", vocVoList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/vocAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vocAdmIU(VoiceOfCustomerVo vocVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			vocVo.setRegIdx(Utils.getUserIdx());
			vocVo.setRegDate(DateUtil.getCurrentDateTime());
			vocVo.setUpdIdx(Utils.getUserIdx());
			vocVo.setUpdDate(DateUtil.getCurrentDateTime());
			if(vocVo.getAsNo().equals("")) {
				String asNo = vocService.getAsNo();
				vocVo.setAsNo(asNo);
				vocService.vocAdmIns(vocVo);
			}else {
				vocService.vocAdmUpd(vocVo);
			}
			
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	@RequestMapping(value = "/ts/vocDtlIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vocDtlIU(VoiceOfCustomerVo vocVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(vocVo.getVocDtlList().toString());
			vocVo.setAsNo(vocVo.getAsNo().toString());
			vocVo.setHandler(vocVo.getHandler().toString());
			vocVo.setHandlerDepartment(vocVo.getHandlerDepartment().toString());
			vocVo.setCompletionDate(vocVo.getCompletionDate().toString());
			vocVo.setUpdIdx(Utils.getUserIdx());
			vocVo.setUpdDate(DateUtil.getCurrentDateTime());
			vocService.vocAdmUpd(vocVo);
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
			
			JSONObject jsonObj = new JSONObject();
			JSONArray stock_array = new JSONArray();
			int dtlSeq = 1;
			String inSlipNo = purchaseOrderService.inProdWhsAdmGetInSlipNo();
			
			StockPaymentAdmVo stockPaymentAdmEmptyVo = new StockPaymentAdmVo();
    		stockPaymentAdmEmptyVo.setRegIdx(Utils.getUserIdx());
			String spNo = stockPaymentAdmService.stockPaymentAdmGetSpNo(stockPaymentAdmEmptyVo); // 입고수불 전표번호 채번
			for(int i=0;i<dataArray.size();i++) {
				jsonObj.put(i, dataArray.get(i));
				JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				VoiceOfCustomerVo vocVoLst = new VoiceOfCustomerVo();
				vocVoLst.setAsNo(jsonObject.get("asNo").toString());
				vocVoLst.setAsNoSeq(jsonObject.get("asNoSeq").toString());
				vocVoLst.setGoodsCd(jsonObject.get("goodsCd").toString());
				vocVoLst.setGoodsNm(jsonObject.get("goodsNm").toString());
//				vocVoLst.setGoodsDc(jsonObject.get("goodsDc").toString());
				vocVoLst.setConsumption(jsonObject.get("consumption").toString());
				vocVoLst.setUnitPrice(jsonObject.get("unitPrice").toString());
				vocVoLst.setPaidFree(jsonObject.get("paidFree").toString());
				vocVoLst.setPriceCost(jsonObject.get("priceCost").toString());
				vocVoLst.setRepairCost(jsonObject.get("repairCost").toString());
				vocVoLst.setTravelExpense(jsonObject.get("travelExpense").toString());
				vocVoLst.setEtcCost(jsonObject.get("etcCost").toString());
				vocVoLst.setTotalCost(jsonObject.get("totalCost").toString());
				vocVoLst.setHandling(jsonObject.get("handling").toString());
				vocVoLst.setRemarks(jsonObject.get("remarks").toString());
				vocVoLst.setWhsIdx(jsonObject.get("whsIdx").toString());
				vocVoLst.setWhsGubun(jsonObject.get("whsGubun").toString());
				if(jsonObject.get("asNoSeq").equals("")) {
					vocVoLst.setRegIdx(Utils.getUserIdx());
					vocVoLst.setRegDate(DateUtil.getCurrentDateTime());
					vocService.vocDtlIns(vocVoLst);
				}else {
					vocVoLst.setUpdIdx(Utils.getUserIdx());
					vocVoLst.setUpdDate(DateUtil.getCurrentDateTime());
					vocService.vocDtlUpd(vocVoLst);
				}
				StockSummaryAdmVo stockSummaryAdmVo = new StockSummaryAdmVo();
    			stockSummaryAdmVo.setSsItemIdx(jsonObject.get("goodsCd").toString());
    			stockSummaryAdmVo.setSsWhsGubun(jsonObject.get("whsGubun").toString());
    			stockSummaryAdmVo.setSsWhsIdx(jsonObject.get("whsIdx").toString());
    			stockSummaryAdmVo.setSsQty(jsonObject.get("consumption").toString());
    			stockSummaryAdmVo.setSsLocIdx("");
    			stockSummaryAdmVo.setRegIdx(Utils.getUserIdx());
    			stockSummaryAdmService.stockSummaryAdmIns(stockSummaryAdmVo);
    			
    			JSONObject stockData = new JSONObject();	//재고요약 데이터
	    		
	    		if(jsonObject.get("inSlipNo")==null) {
		    		String inSlipNoSeq;
		    		if(Integer.toString(dtlSeq).length()==1) {
		    			inSlipNoSeq = "0000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==2) {
		    			inSlipNoSeq = "000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==3) {
		    			inSlipNoSeq = "00"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==4) {
		    			inSlipNoSeq = "0"+Integer.toString(dtlSeq);
		    		} else {
		    			inSlipNoSeq = Integer.toString(dtlSeq);
		    		}
		    		stockData.put("SP_SOURCE_NO", inSlipNo + "-" + inSlipNoSeq);
		    		stockData.put("IN_SLIP_NO", inSlipNo);
		    		stockData.put("IN_SLIP_SEQ", dtlSeq);
		    		dtlSeq++;
	    		}
				
				stockData.put("SP_NO", spNo);
				stockData.put("SP_SEQ", Integer.toString(i+1));
				stockData.put("SP_GUBUN", "001");
				stockData.put("SP_IDX", jsonObject.get("goodsCd").toString());
				stockData.put("SP_TYPE", "입고");
				stockData.put("SP_TYPE2", "");
				stockData.put("SP_DATE", jsonObject.get("inDate").toString());
				stockData.put("SP_QTY", jsonObject.get("consumption").toString());
				stockData.put("SP_WHS_GUBUN", jsonObject.get("whsGubun").toString());
				stockData.put("SP_WHS_IDX", jsonObject.get("whsIdx").toString());
				stockData.put("SP_LOC_IDX", 0);
				stockData.put("SP_DESC", "");
				stockData.put("REG_IDX", Utils.getUserIdx());
    			stock_array.add(stockData);
			}
			stockPaymentAdmVo.setInsertJson(stock_array.toJSONString());
	        stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
			stockPaymentAdmService.stockPaymentAdmIns(stockPaymentAdmVo); // 입고수불 등록
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/vocAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vocAdmDel(VoiceOfCustomerVo vocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			vocService.vocAdmDel(vocVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/vocDtlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vocDtlDel(VoiceOfCustomerVo vocVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			vocService.vocDtlDel(vocVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
}
