package mes.web.bs;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.StringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.bm.LocationVo;
import mes.domain.bs.BizOrderVo;
import mes.domain.pm.PurchaseOrderVo;
import mes.domain.sm.CommonCodeVo;
import mes.domain.stock.InProdWhsAdmVo;
import mes.domain.stock.OutMatrWhsAdmVo;
import mes.domain.stock.OutProdWhsAdmVo;
import mes.domain.stock.StockManagementVo;
import mes.domain.stock.StockPaymentAdmVo;
import mes.domain.wm.WorkOrderVo;
import mes.domain.wm.WorkPlanVo;
import mes.service.bm.LocationService;
import mes.service.bs.BizOrderService;
import mes.service.bs.OutReqService;
import mes.service.pm.PurchaseOrderService;
import mes.service.stock.InProdWhsAdmService;
import mes.service.stock.OutMatrWhsAdmService;
import mes.service.stock.OutProdWhsAdmService;
import mes.service.stock.StockPaymentAdmService;
import mes.service.wm.WorkOrderService;
import mes.service.wm.WorkPlanService;
import mes.web.stock.StockManagementController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class OutReqController {
	
	@Inject
	private OutReqService outReqService;
	
	@Inject
	private PurchaseOrderService purchaseOrderService;
	
	@Inject
	private WorkPlanService workPlanService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private OutMatrWhsAdmService outMatrWhsAdmService;
	
	@Inject
	private InProdWhsAdmService inProdWhsAdmService;
	
	@Inject
	private OutProdWhsAdmService outProdWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private LocationService locationService;
	
	@Inject
	private StockManagementController stockManagementController;
	
	private static final Logger logger = LoggerFactory.getLogger(BizOrderController.class);
	
	
	// bssc0150 페이지
	@RequestMapping(value = "/bs/bssc0150", method = RequestMethod.GET)
	public ModelAndView bssc0130(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0150");
		mav.setViewName("/bs/bssc0150");
		return mav;
	}
	
	// =========================== 출고등록 메인 ==========================================
	// 출고등록 메인 목록조회
	@RequestMapping(value = "bs/bizOrderOutReqLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderOutReqLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고등록 메인 목록조회");
		try {
			List<BizOrderVo> bizOrderOutReqLst = outReqService.bizOrderOutReqLst(bizOrderVo);
			jsonData.put("data", bizOrderOutReqLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 출고등록 출고처리 ==========================================
	// 출고등록 출고처리 메인 목록조회
	@RequestMapping(value = "bs/outReqAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderoutReqAdmLstOutReqLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고등록 출고처리 메인 목록조회");
		try {
			List<BizOrderVo> outReqAdmLst = outReqService.outReqAdmLst(bizOrderVo);
			jsonData.put("data", outReqAdmLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 출고처리
	@RequestMapping(value = "bs/outReqAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고처리");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<BizOrderVo> outReqAdmInsertList = new ArrayList<>();
			List<BizOrderVo> outReqAdmUpdateList = new ArrayList<>();
			
			JSONObject jsonObj = new JSONObject();
			int dtlSeq = 1;
			String outReqNo = outReqService.outReqAdmGetOutReqNo();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		BizOrderVo bizOrderVo = new BizOrderVo();
	    		
	    		bizOrderVo.setIdx(jsonObject.get("idx").toString());
				bizOrderVo.setOutDate(jsonObject.get("outDate").toString());
				bizOrderVo.setOutQty(jsonObject.get("outQty").toString());
				bizOrderVo.setBizOrdIdx(jsonObject.get("bizOrdIdx").toString());
				bizOrderVo.setBizOrdNo(jsonObject.get("bizOrdNo").toString());
				bizOrderVo.setBizOrdSeq(jsonObject.get("bizOrdSeq").toString());
				bizOrderVo.setPrjCd(jsonObject.get("prjCd").toString());
				bizOrderVo.setPrjNm(jsonObject.get("prjNm").toString());
	    		
	    		bizOrderVo.setUpdIdx(Utils.getUserIdx());
	    		bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		bizOrderVo.setRegIdx(Utils.getUserIdx());
	    		bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		if(jsonObject.get("outReqNo")==null) {
		    		String outReqNoSeq;
		    		if(Integer.toString(dtlSeq).length()==1) {
		    			outReqNoSeq = "0000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==2) {
		    			outReqNoSeq = "000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==3) {
		    			outReqNoSeq = "00"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==4) {
		    			outReqNoSeq = "0"+Integer.toString(dtlSeq);
		    		} else {
		    			outReqNoSeq = Integer.toString(dtlSeq);
		    		}
		    		bizOrderVo.setOutReqNo(outReqNo + "-" + outReqNoSeq);
		    		dtlSeq++;
		    		outReqAdmInsertList.add(bizOrderVo);
	    		} else {
	    			bizOrderVo.setOutReqNo(jsonObject.get("outReqNo").toString());
	    			
	    			outReqAdmUpdateList.add(bizOrderVo);
	    		}
	        }
	        for(int i=0;i<outReqAdmInsertList.size();i++) {
	        	outReqService.outReqAdmIns(outReqAdmInsertList.get(i));
        		
	        }
	        
	        for(int i=0;i<outReqAdmUpdateList.size();i++) {
	        	outReqService.outReqAdmUpd(outReqAdmUpdateList.get(i));
	        	
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 출고처리 삭제
	@RequestMapping(value = "bs/outReqAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqAdmDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고처리 삭제");
		try {
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			outReqService.outReqAdmDel(bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 출고처리 Serial No ==========================================
	//  출고처리 Serial No 목록조회
	@RequestMapping(value = "bs/outReqDtlLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqDtlLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(" 출고처리 Serial No 목록조회");
		try {
			List<BizOrderVo> outReqDtlLst = outReqService.outReqDtlLst(bizOrderVo);
			jsonData.put("data", outReqDtlLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// Serial No 등록/수정
	@RequestMapping(value = "bs/outReqDtlIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqDtlIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(" Serial No 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<BizOrderVo> outReqDtlInsertList = new ArrayList<>();
			List<BizOrderVo> outReqDtlUpdateList = new ArrayList<>();
			
			JSONObject jsonObj = new JSONObject();
			int dtlSeq = 1;
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		BizOrderVo bizOrderVo = new BizOrderVo();
	    		
				bizOrderVo.setOutReqIdx(jsonObject.get("outReqIdx").toString());
				bizOrderVo.setOutReqNo(jsonObject.get("outReqNo").toString());
				bizOrderVo.setSerialNo(jsonObject.get("serialNo").toString());
	    		
	    		bizOrderVo.setUpdIdx(Utils.getUserIdx());
	    		bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		bizOrderVo.setRegIdx(Utils.getUserIdx());
	    		bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		if(jsonObject.get("idx").equals("")) {
		    		outReqDtlInsertList.add(bizOrderVo);
	    		} else {
	    			bizOrderVo.setOutReqNo(jsonObject.get("outReqNo").toString());
	    			
	    			outReqDtlUpdateList.add(bizOrderVo);
	    		}
	        }
	        for(int i=0;i<outReqDtlInsertList.size();i++) {
	        	outReqService.outReqDtlIns(outReqDtlInsertList.get(i));
        		
	        }
	        
	        for(int i=0;i<outReqDtlUpdateList.size();i++) {
	        	outReqService.outReqDtlUpd(outReqDtlUpdateList.get(i));
	        	
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// Serial No 삭제
	@RequestMapping(value = "bs/outReqDtlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqDtlDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("Serial No 삭제");
		try {
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			outReqService.outReqDtlDel(bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// CS등록 Serial No 목록조회
	@RequestMapping(value = "bs/outReqDtlSerialLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outReqDtlSerialLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(" 출고처리 Serial No 목록조회");
		try {
			List<BizOrderVo> outReqDtlLst = outReqService.outReqDtlSerialLst(bizOrderVo);
			jsonData.put("data", outReqDtlLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
//	
//	// 수금/매출/미수금 집계-GROUP BY 거래처명
//	@RequestMapping(value = "bs/bizOrderAdmLstGroupByDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계-GROUP BY 거래처명");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByDealCorp(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수금/매출/미수금 집계-GROUP BY 장비유형
//	@RequestMapping(value = "bs/bizOrderAdmLstGroupByGoodsType", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByGoodsType(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계-GROUP BY 장비유형");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByGoodsType(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 메인 상세조회
//	@RequestMapping(value = "bs/bizOrderAdmSel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 메인 상세조회");
//		try {
//			bizOrderVo = bizOrderService.bizOrderAdmSel(bizOrderVo);
//			jsonData.put("data", bizOrderVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 메인 등록/수정
//	@RequestMapping(value = "bs/bizOrderAdmIU", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmIU(BizOrderVo bizOrderVo/*, @RequestParam(value="jsonArray", required=false) String jsonArray*/) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 메인 등록/수정");
//		try {
//			String idx = "";
//			
//			bizOrderVo.setRegIdx(Utils.getUserIdx());
//			bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
//			bizOrderVo.setUpdIdx(Utils.getUserIdx());
//			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
//			
//			if(bizOrderVo.getBizOrdNo().equals("")) {
//				idx = bizOrderService.bizOrderAdmIns(bizOrderVo);
//			} else {
//				bizOrderService.bizOrderAdmUpd(bizOrderVo);
//				idx = bizOrderVo.getBizOrdAdmIdx();
//			}
//			
//			jsonData.put("result", "ok");
//			jsonData.put("idx", idx);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 프로젝트 채번 Seq
//	@RequestMapping(value = "bs/prjCdSeq", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> prjCdDupCheck(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("프로젝트 채번 Seq");
//		try {
//			
//			bizOrderVo = bizOrderService.prjCdSeq(bizOrderVo);
//			String seq = bizOrderVo.getSeq();
//			jsonData.put("result", "ok");
//			jsonData.put("seq", seq);
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 메인 삭제
//	@RequestMapping(value = "bs/bizOrderAdmDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 메인 삭제");
//		try {
//			bizOrderService.bizOrderAdmDel(bizOrderVo);
//			jsonData.put("result", "ok");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// =========================== 수주관리 상세 ==========================================
//	// 수주관리 상세 목록조회
//	@RequestMapping(value = "bs/bizOrderDtlLst", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 매출정보 조회");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLst(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 매출정보 수정
//	@RequestMapping(value = "bs/bizOrderSalesIU", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 매출정보 수정");
//		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//
//			//등록,수정할 수주Sales리스트
//			List<BizOrderVo> bizSalesList = new ArrayList<>();
//			JSONObject jsonStockObj = new JSONObject();
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonStockObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
//	    		
//	    		BizOrderVo bizOrderDtlVo = new BizOrderVo();
//	    		bizOrderDtlVo.setIdx(jsonObject.get("idx").toString());
//	    		bizOrderDtlVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
//	    		bizOrderDtlVo.setSalesGubun(jsonObject.get("salesGubun").toString());
//	    		bizOrderDtlVo.setPublishPreDate(jsonObject.get("publishPreDate").toString());
//	    		bizOrderDtlVo.setPublishAmt(jsonObject.get("publishAmt").toString());
//	    		bizOrderDtlVo.setPublishDate(jsonObject.get("publishDate").toString());
//	    		bizOrderDtlVo.setCollectMonth(jsonObject.get("collectMonth").toString());
//	    		bizOrderDtlVo.setRegIdx(Utils.getUserIdx());
//				bizOrderDtlVo.setRegDate(DateUtil.getCurrentDateTime());
//				bizOrderDtlVo.setUpdIdx(Utils.getUserIdx());
//				bizOrderDtlVo.setUpdDate(DateUtil.getCurrentDateTime());
//	    		if(bizOrderDtlVo.getIdx().equals("")) {
//	    			bizOrderService.bizOrderDtlIns(bizOrderDtlVo);
//	    		} else {
//	    			bizOrderService.bizOrderDtlUpd(bizOrderDtlVo);
//	    		}
//	        }
//	        jsonData.put("result", "ok");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 매출정보 삭제
//	@RequestMapping(value = "bs/bizOrderSalesDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderSalesDel(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 상세 삭제");
//		try {
//			bizOrderService.bizOrderDtlDel(bizOrderVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 완료/취소처리
//	@RequestMapping(value = "bs/bizOrderAdmConfirm", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 상세 PO완료처리");
//		try {
//			bizOrderVo.setUpdIdx(Utils.getUserIdx());
//			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
//			bizOrderService.bizOrderAdmConfirm(bizOrderVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	
//	// =========================== 수주 수금정보 ==========================================
//	// 수주관리 수금정보 목록조회
//	@RequestMapping(value = "bs/bizOrderCollectLst", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderStatusLst(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수금정보 목록조회");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderCollectLst(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 수금정보 수정
//	@RequestMapping(value = "bs/bizOrderCollectIU", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderCollectIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수금정보 등록/수정");
//		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//
//			//등록,수정할 수주Collect리스트
//			List<BizOrderVo> bizCollectList = new ArrayList<>();
//			JSONObject jsonStockObj = new JSONObject();
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonStockObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
//	    		
//	    		BizOrderVo bizOrderCollectVo = new BizOrderVo();	
//	    		bizOrderCollectVo.setIdx(jsonObject.get("idx").toString());
//	    		bizOrderCollectVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
//	    		bizOrderCollectVo.setCollectGubun(jsonObject.get("collectGubun").toString());
//	    		bizOrderCollectVo.setCollectSub(jsonObject.get("collectSub").toString());
//	    		bizOrderCollectVo.setCollectDate(jsonObject.get("collectDate").toString());
//	    		bizOrderCollectVo.setCollectAmt(jsonObject.get("collectAmt").toString());
//	    		bizOrderCollectVo.setReceiptDate(jsonObject.get("receiptDate").toString());
//	    		bizOrderCollectVo.setDueDate(jsonObject.get("dueDate").toString());
//	    		bizOrderCollectVo.setRegIdx(Utils.getUserIdx());
//	    		bizOrderCollectVo.setRegDate(DateUtil.getCurrentDateTime());
//	    		bizOrderCollectVo.setUpdIdx(Utils.getUserIdx());
//	    		bizOrderCollectVo.setUpdDate(DateUtil.getCurrentDateTime());
//	    		if(jsonObject.get("idx").toString().equals("")) {
//	    			bizOrderService.bizOrderCollectIns(bizOrderCollectVo);
//	    		} else {
//	    			bizOrderService.bizOrderCollectUpd(bizOrderCollectVo);
//	    		}
//	        }
//	        jsonData.put("result", "ok");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 수금정보 삭제
//	@RequestMapping(value = "bs/bizOrderCollectDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 상세 삭제");
//		try {
//			bizOrderService.bizOrderCollectDel(bizOrderVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//		
//	// =========================== 수주관리 메인 ==========================================
//	// 수주관리 수주집계표 수주기간별 수주처 목록조회
//	@RequestMapping(value = "bs/bizOrderAdmLstAsDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수주집계표 수주기간별 수주처 목록조회");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstAsDealCorp(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수주관리 수주집계표 수주처별 목록조회
//	@RequestMapping(value = "bs/bizOrderDtlLstByDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수주집계표 수주처별 목록조회");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLstByDealCorp(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수금/매출/미수금 집계- 월별실적
//	@RequestMapping(value = "bs/bizOrderAdmLstGroupByYearMon", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByYearMon(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 월별실적");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByYearMon(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수금/매출/미수금 집계- 분기별실적
//	@RequestMapping(value = "bs/bizOrderAdmLstGroupByQuarter", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByQuarter(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 분기별실적");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByQuarter(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수금/매출/미수금 집계- 반기별실적
//	@RequestMapping(value = "bs/bizOrderAdmLstGroupByHalf", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByHalf(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 반기별실적");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByHalf(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
//	
//	// 수금/매출/미수금 집계- 월별매출
//	@RequestMapping(value = "bs/bizOrderSalesGroupByDealMon", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderSalesGroupByDealMon(BizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 월별매출");
//		try {
//			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderSalesGroupByDealMon(bizOrderVo);
//			jsonData.put("data", bizOrderVoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
}
