package mes.web.sc;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.qm.CustomerIssueVo;
import mes.domain.sc.SupplyChainManagementVo;
import mes.service.bm.LocationService;
import mes.service.sc.SupplyChainManagementService;
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
public class SupplyChainManagementController {
	
	@Inject
	private SupplyChainManagementService scmService;
	
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
	
	private static final Logger logger = LoggerFactory.getLogger(SupplyChainManagementController.class);
	
	// scsc0010 페이지
	@RequestMapping(value = "/sc/scsc0010", method = RequestMethod.GET)
	public ModelAndView scsc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0010");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/sc/scsc0010");
		return mav;
	}
	
	// scsc0020 페이지
	@RequestMapping(value = "/sc/scsc0020", method = RequestMethod.GET)
	public ModelAndView scsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0020");
		mav.setViewName("/sc/scsc0020");
		return mav;
	}
	
	// scsc0030 페이지
	@RequestMapping(value = "/sc/scsc0030", method = RequestMethod.GET)
	public ModelAndView scsc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0030");
		mav.setViewName("/sc/scsc0030");
		return mav;
	}
	
	// scsc0040 페이지
//	@RequestMapping(value = "/sc/scsc0040", method = RequestMethod.GET)
//	public ModelAndView scsc0040(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0040");
//		mav.setViewName("/sc/scsc0040");
//		return mav;
//	}
	
	// scsc0050 페이지
	@RequestMapping(value = "/sc/scsc0050", method = RequestMethod.GET)
	public ModelAndView scsc0050(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0050");
		mav.setViewName("/sc/scsc0050");
		return mav;
	}
	
//	// scsc0060 페이지
//	@RequestMapping(value = "/sc/scsc0060", method = RequestMethod.GET)
//	public ModelAndView scsc0060(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0060");
//		mav.setViewName("/sc/scsc0060");
//		return mav;
//	}
//	
//	// scsc0070 페이지
//	@RequestMapping(value = "/sc/scsc0070", method = RequestMethod.GET)
//	public ModelAndView scsc0070(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0070");
//		mav.setViewName("/sc/scsc0070");
//		return mav;
//	}
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@RequestMapping(value = "sc/purchaseUpvoteYnLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			List<SupplyChainManagementVo> scmVoList = scmService.purchaseUpvoteYnLst(scmVo);
			System.out.println(scmVoList);
			jsonData.put("data", scmVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
//	// 수금/매출/미수금 집계-GROUP BY 거래처명
//	@RequestMapping(value = "sc/bizOrderAdmLstGroupByDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByDealCorp(SupplyChainManagementVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계-GROUP BY 거래처명");
//		try {
//			List<SupplyChainManagementVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByDealCorp(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderAdmLstGroupByGoodsType", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByGoodsType(SupplyChainManagementVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계-GROUP BY 장비유형");
//		try {
//			List<SupplyChainManagementVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByGoodsType(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderAdmSel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmSel(SupplyChainManagementVo bizOrderVo) throws Exception {
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
	
	// 수주관리 메인 등록/수정
	@RequestMapping(value = "sc/purchaseDeliveryYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseDeliveryYnUpd(SupplyChainManagementVo scmVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 메인 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);

			//수주 Serial No 리스트
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		SupplyChainManagementVo scmYnVo = new SupplyChainManagementVo();
	    		scmYnVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    		scmYnVo.setDeliveryYn(jsonObject.get("deliveryYn").toString());
				scmYnVo.setUpdIdx(Utils.getUserIdx());
				scmYnVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		scmService.purchaseDeliveryYnUpd(scmYnVo);
	        }
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "sc/scmFileSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> scmFileSel(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			scmVo = scmService.scmFileSel(scmVo);
			System.out.println(scmVo);
			jsonData.put("data", scmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "sc/planFileIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> planFileIU(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			scmVo.setPlanUuid(scmVo.getPlanUuid().toString().replace("\\", "\\\\"));
//			scmVo.setFloorPlan(scmVo.getFloorPlan().toString());
			scmService.planFileIns(scmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "sc/reportFileIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> reportFileIU(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			scmVo.setReportUuid(scmVo.getReportUuid().toString().replace("\\", "\\\\"));
//			scmVo.setReports(scmVo.getReports().toString());
			scmService.reportFileIns(scmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
//	// 프로젝트 채번 Seq
//	@RequestMapping(value = "sc/prjCdSeq", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> prjCdDupCheck(ScmBizOrderVo bizOrderVo) throws Exception {
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
//	@RequestMapping(value = "sc/bizOrderAdmDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmDel(ScmBizOrderVo bizOrderVo) throws Exception {
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
//	@RequestMapping(value = "sc/bizOrderDtlLst", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlLst(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 매출정보 조회");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLst(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderSalesIU", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlIU(ScmBizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 매출정보 수정");
//		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//
//			//등록,수정할 수주Sales리스트
//			List<ScmBizOrderVo> bizSalesList = new ArrayList<>();
//			JSONObject jsonStockObj = new JSONObject();
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonStockObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
//	    		
//	    		ScmBizOrderVo bizOrderDtlVo = new ScmBizOrderVo();
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
//	@RequestMapping(value = "sc/bizOrderSalesDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderSalesDel(ScmBizOrderVo bizOrderVo) throws Exception {
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
//	@RequestMapping(value = "sc/bizOrderAdmConfirm", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmConfirm(ScmBizOrderVo bizOrderVo) throws Exception {
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
//	@RequestMapping(value = "sc/bizOrderCollectLst2", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderStatusLst2(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수금정보 목록조회");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderCollectLst(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderCollectIU", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderCollectIU(ScmBizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수금정보 등록/수정");
//		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//
//			//등록,수정할 수주Collect리스트
//			List<ScmBizOrderVo> bizCollectList = new ArrayList<>();
//			JSONObject jsonStockObj = new JSONObject();
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonStockObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
//	    		
//	    		ScmBizOrderVo bizOrderCollectVo = new ScmBizOrderVo();	
//	    		bizOrderCollectVo.setIdx(jsonObject.get("idx").toString());
//	    		bizOrderCollectVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
//	    		bizOrderCollectVo.setBizOrdSalesIdx(jsonObject.get("bizOrdSalesIdx").toString());
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
//	@RequestMapping(value = "sc/bizOrderCollectDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderCollectDel(ScmBizOrderVo bizOrderVo) throws Exception {
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
//	@RequestMapping(value = "sc/bizOrderAdmLstAsDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstAsDealCorp(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수주집계표 수주기간별 수주처 목록조회");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstAsDealCorp(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderDtlLstByDealCorp", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderDtlLstByDealCorp(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주관리 수주집계표 수주처별 목록조회");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLstByDealCorp(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderAdmLstGroupByYearMon", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByYearMon(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 월별실적");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByYearMon(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderAdmLstGroupByQuarter", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByQuarter(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 분기별실적");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByQuarter(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderAdmLstGroupByHalf", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByHalf(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 반기별실적");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByHalf(bizOrderVo);
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
//	@RequestMapping(value = "sc/bizOrderSalesGroupByDealMon", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderSalesGroupByDealMon(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수금/매출/미수금 집계- 월별매출");
//		try {
//			List<ScmBizOrderVo> bizOrderVoList = bizOrderService.bizOrderSalesGroupByDealMon(bizOrderVo);
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
//	//********************************************* 수주등록(해외) *********************************************
//	// 수주등록(해외) 메인 등록/수정
//	@RequestMapping(value = "sc/bizOrderAdmAbroadIU2", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmAbroadIU2(ScmBizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주등록(해외) 메인 등록/수정");
//		try {
//			String idx = "";
//			
//			bizOrderVo.setRegIdx(Utils.getUserIdx());
//			bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
//			bizOrderVo.setUpdIdx(Utils.getUserIdx());
//			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
//			
//			if(bizOrderVo.getBizOrdNo().equals("")) {
//				idx = bizOrderService.bizOrderAdmAbroadIns(bizOrderVo);
//			} else {
//				bizOrderService.bizOrderAdmAbroadUpd(bizOrderVo);
//				idx = bizOrderVo.getBizOrdAdmIdx();
//			}
//			
//			bizOrderVo.setIdx(idx);
//			ScmBizOrderVo bizOrderSelVo = new ScmBizOrderVo();
//			bizOrderSelVo = bizOrderService.bizOrderAdmSel(bizOrderVo);
//			
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//
//			//수주 Serial No 리스트
//			JSONObject jsonStockObj = new JSONObject();
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonStockObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
//	    		
//	    		ScmBizOrderVo bizSerialNoVo = new ScmBizOrderVo();
//	    		bizSerialNoVo.setIdx(jsonObject.get("idx").toString());
//	    		bizSerialNoVo.setBizOrdIdx(bizOrderSelVo.getIdx());
//	    		bizSerialNoVo.setBizOrdNo(bizOrderSelVo.getBizOrdNo());
//	    		bizSerialNoVo.setBizOrdSeq(bizOrderSelVo.getBizOrdSeq());
//	    		bizSerialNoVo.setPrjSeq(bizOrderSelVo.getPrjSeq());
//	    		bizSerialNoVo.setGoodsTypeCd(bizOrderSelVo.getGoodsTypeCd());
//	    		bizSerialNoVo.setGoodsNm(bizOrderSelVo.getGoodsNm());
//	    		bizSerialNoVo.setAbroadGubun(bizOrderSelVo.getAbroadGubun());
//	    		bizSerialNoVo.setPrjCd(bizOrderSelVo.getPrjCd());
//	    		bizSerialNoVo.setPrjNm(bizOrderSelVo.getPrjNm());
//	    		bizSerialNoVo.setSerialNo(jsonObject.get("serialNo").toString());
//	    		bizSerialNoVo.setRegIdx(Utils.getUserIdx());
//				bizSerialNoVo.setRegDate(DateUtil.getCurrentDateTime());
//				bizSerialNoVo.setUpdIdx(Utils.getUserIdx());
//				bizSerialNoVo.setUpdDate(DateUtil.getCurrentDateTime());
//				
//				if(bizSerialNoVo.getIdx().equals("")) {
//					bizOrderService.bizSerialNoIns(bizSerialNoVo);
//				} else {
//					bizOrderService.bizSerialNoUpd(bizSerialNoVo);
//				}
//	        }
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
//	// 수주등록(해외) 메인 삭제
//	@RequestMapping(value = "sc/bizOrderAdmAbroadDel", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizOrderAdmAbroadDel(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주등록(해외) 메인 삭제");
//		try {
//			bizOrderService.bizOrderAdmAbroadDel(bizOrderVo);
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
//	// =========================== 수주 SerialNo ==========================================
//	// 수주 SerialNo 목록조회
//	@RequestMapping(value = "sc/bizSerialNoLst", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> bizSerialNoLst(ScmBizOrderVo bizOrderVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("수주 SerialNo 목록조회");
//		try {
//			List<ScmBizOrderVo> bizSerialNoLst = bizOrderService.bizSerialNoLst(bizOrderVo);
//			jsonData.put("data", bizSerialNoLst);
//			jsonData.put("bizSerialNoLst", bizSerialNoLst);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
}
