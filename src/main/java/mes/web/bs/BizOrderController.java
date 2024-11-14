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
public class BizOrderController {
	
	@Inject
	private BizOrderService bizOrderService;
	
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
	
	// bssc0010 페이지
	@RequestMapping(value = "/bs/bssc0010", method = RequestMethod.GET)
	public ModelAndView bssc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0010");
		mav.setViewName("/bs/bssc0010");
		return mav;
	}
	
	// bssc0020 페이지
	@RequestMapping(value = "/bs/bssc0020", method = RequestMethod.GET)
	public ModelAndView bssc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0020");
		mav.setViewName("/bs/bssc0020");
		return mav;
	}
	
	// bssc0030 페이지
	@RequestMapping(value = "/bs/bssc0030", method = RequestMethod.GET)
	public ModelAndView bssc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0030");
		mav.setViewName("/bs/bssc0030");
		return mav;
	}
	
	// bssc0040 페이지
	@RequestMapping(value = "/bs/bssc0040", method = RequestMethod.GET)
	public ModelAndView bssc0040(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0040");
		mav.setViewName("/bs/bssc0040");
		return mav;
	}
	
	// bssc0050 페이지
	@RequestMapping(value = "/bs/bssc0050", method = RequestMethod.GET)
	public ModelAndView bssc0050(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0050");
		mav.setViewName("/bs/bssc0050");
		return mav;
	}
	
	// bssc0060 페이지
	@RequestMapping(value = "/bs/bssc0060", method = RequestMethod.GET)
	public ModelAndView bssc0060(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0060");
		mav.setViewName("/bs/bssc0060");
		return mav;
	}
	
	// bssc0070 페이지
	@RequestMapping(value = "/bs/bssc0070", method = RequestMethod.GET)
	public ModelAndView bssc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0070");
		mav.setViewName("/bs/bssc0070");
		return mav;
	}
	
	// bssc0080 페이지
	@RequestMapping(value = "/bs/bssc0080", method = RequestMethod.GET)
	public ModelAndView bssc0080(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0080");
		mav.setViewName("/bs/bssc0080");
		return mav;
	}
	
	// bssc0090 페이지
	@RequestMapping(value = "/bs/bssc0090", method = RequestMethod.GET)
	public ModelAndView bssc0090(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0090");
		mav.setViewName("/bs/bssc0090");
		return mav;
	}
	
	// bssc0110 페이지
	@RequestMapping(value = "/bs/bssc0110", method = RequestMethod.GET)
	public ModelAndView bssc0110(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0110");
		mav.setViewName("/bs/bssc0110");
		return mav;
	}
	
	// bssc0120 페이지
	@RequestMapping(value = "/bs/bssc0120", method = RequestMethod.GET)
	public ModelAndView bssc0120(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0120");
		mav.setViewName("/bs/bssc0120");
		return mav;
	}
	
	// bssc0130 페이지
	@RequestMapping(value = "/bs/bssc0130", method = RequestMethod.GET)
	public ModelAndView bssc0130(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0130");
		mav.setViewName("/bs/bssc0130");
		return mav;
	}
	
	// bssc0170 페이지
	@RequestMapping(value = "/bs/bssc0170", method = RequestMethod.GET)
	public ModelAndView bssc0170(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0170");
		mav.setViewName("/bs/bssc0170");
		return mav;
	}
	// bssc0190 페이지
	@RequestMapping(value = "/bs/bssc0190", method = RequestMethod.GET)
	public ModelAndView bssc0190(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0190");
		mav.setViewName("/bs/bssc0190");
		return mav;
	}
	// bssc0200 페이지
	@RequestMapping(value = "/bs/bssc0200", method = RequestMethod.GET)
	public ModelAndView bssc0200(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0200");
		mav.setViewName("/bs/bssc0200");
		return mav;
	}
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@RequestMapping(value = "bs/bizOrderAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLst(bizOrderVo);
			//System.out.println(bizOrderVoList); <- 시스템 메모리 많이 먹는편이라 주석처리함
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 메인 목록조회
	@RequestMapping(value = "bs/bizOrderAdmPureLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmPureLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmPureLst(bizOrderVo);
//			System.out.println(bizOrderVoList);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계-GROUP BY 거래처명
	@RequestMapping(value = "bs/bizOrderAdmLstGroupByDealCorp", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계-GROUP BY 거래처명");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByDealCorp(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계-GROUP BY 장비유형
	@RequestMapping(value = "bs/bizOrderAdmLstGroupByGoodsType", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByGoodsType(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계-GROUP BY 장비유형");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByGoodsType(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 메인 상세조회
	@RequestMapping(value = "bs/bizOrderAdmSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 상세조회");
		try {
			bizOrderVo = bizOrderService.bizOrderAdmSel(bizOrderVo);
			jsonData.put("data", bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 메인 등록/수정
	@RequestMapping(value = "bs/bizOrderAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 등록/수정");
		try {
			String idx = "";
			
			bizOrderVo.setRegIdx(Utils.getUserIdx());
			bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(bizOrderVo.getBizOrdNo().equals("")) {
				bizOrderService.bizOrderAdmIns(bizOrderVo);
				idx = "";
			} else {
				bizOrderService.bizOrderAdmUpd(bizOrderVo);
				idx = bizOrderVo.getBizOrdAdmIdx();
			}
			
//			bizOrderVo.setIdx(idx);
//			BizOrderVo bizOrderSelVo = new BizOrderVo();
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
//	    		BizOrderVo bizSerialNoVo = new BizOrderVo();
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
//	        } <-- 시리얼번호 등록 및 수정

	        jsonData.put("result", "ok");
			jsonData.put("idx", idx);

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 채번 Seq
	@RequestMapping(value = "bs/prjCdSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prjCdDupCheck(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 채번 Seq");
		try {
			
			bizOrderVo = bizOrderService.prjCdSeq(bizOrderVo);
			String seq = bizOrderVo.getSeq();
			jsonData.put("result", "ok");
			jsonData.put("seq", seq);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 메인 삭제
	@RequestMapping(value = "bs/bizOrderAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 삭제");
		try {
			bizOrderService.bizOrderAdmDel(bizOrderVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 메인 등록/수정
	@RequestMapping(value = "bs/bizOrderProjectIUD", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderProjectIUD(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 등록/수정");
		try {
			
			bizOrderVo.setRegIdx(Utils.getUserIdx());
			bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			String idx = bizOrderService.bizOrderProjectIns(bizOrderVo);
			
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);

			//수주 사용 리스트
			JSONObject jsonStockObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonStockObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		BizOrderVo bizProjectUseVo = new BizOrderVo();
	    		bizProjectUseVo.setIdx("");
	    		bizProjectUseVo.setBizOrderIdx(jsonObject.get("bizOrderIdx").toString());
	    		bizProjectUseVo.setUseQty(jsonObject.get("useQty").toString());
	    		bizProjectUseVo.setProjectIdx(idx);
	    		bizProjectUseVo.setRegIdx(Utils.getUserIdx());
				bizProjectUseVo.setRegDate(DateUtil.getCurrentDateTime());
				bizProjectUseVo.setUpdIdx(Utils.getUserIdx());
				bizProjectUseVo.setUpdDate(DateUtil.getCurrentDateTime());
				
				bizOrderService.bizProjectUseIns(bizProjectUseVo);
	        }

	        jsonData.put("result", "ok");
			jsonData.put("idx", idx);

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 수주관리 상세 ==========================================
	// 수주관리 상세 목록조회
	@RequestMapping(value = "bs/bizOrderDtlLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 매출정보 조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLst(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 매출정보 수정
	@RequestMapping(value = "bs/bizOrderSalesIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 매출정보 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);

			//등록,수정할 수주Sales리스트
			List<BizOrderVo> bizSalesList = new ArrayList<>();
			JSONObject jsonStockObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonStockObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		BizOrderVo bizOrderDtlVo = new BizOrderVo();
	    		bizOrderDtlVo.setIdx(jsonObject.get("idx").toString());
	    		bizOrderDtlVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
	    		bizOrderDtlVo.setSalesGubun(jsonObject.get("salesGubun").toString());
	    		bizOrderDtlVo.setPublishPreDate(jsonObject.get("publishPreDate").toString());
	    		bizOrderDtlVo.setPublishAmt(jsonObject.get("publishAmt").toString());
	    		bizOrderDtlVo.setPublishDate(jsonObject.get("publishDate").toString());
	    		bizOrderDtlVo.setCollectMonth(jsonObject.get("collectMonth").toString());
	    		bizOrderDtlVo.setRegIdx(Utils.getUserIdx());
				bizOrderDtlVo.setRegDate(DateUtil.getCurrentDateTime());
				bizOrderDtlVo.setUpdIdx(Utils.getUserIdx());
				bizOrderDtlVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		if(bizOrderDtlVo.getIdx().equals("")) {
	    			bizOrderService.bizOrderDtlIns(bizOrderDtlVo);
	    		} else {
	    			bizOrderService.bizOrderDtlUpd(bizOrderDtlVo);
	    		}
	        }
	        jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 매출정보 삭제
	@RequestMapping(value = "bs/bizOrderSalesDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderSalesDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 상세 삭제");
		try {
			bizOrderService.bizOrderDtlDel(bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 완료/취소처리
	@RequestMapping(value = "bs/bizOrderAdmConfirm", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 상세 PO완료처리");
		try {
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			bizOrderService.bizOrderAdmConfirm(bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// =========================== 수주 수금정보 ==========================================
	// 수주관리 수금정보 목록조회
	@RequestMapping(value = "bs/bizOrderCollectLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderStatusLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 수금정보 목록조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderCollectLst(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 수금정보 수정
	@RequestMapping(value = "bs/bizOrderCollectIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderCollectIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 수금정보 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);

			//등록,수정할 수주Collect리스트
			List<BizOrderVo> bizCollectList = new ArrayList<>();
			JSONObject jsonStockObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonStockObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		BizOrderVo bizOrderCollectVo = new BizOrderVo();	
	    		bizOrderCollectVo.setIdx(jsonObject.get("idx").toString());
	    		bizOrderCollectVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
	    		bizOrderCollectVo.setBizOrdSalesIdx(jsonObject.get("bizOrdSalesIdx").toString());
	    		bizOrderCollectVo.setCollectGubun(jsonObject.get("collectGubun").toString());
	    		bizOrderCollectVo.setCollectSub(jsonObject.get("collectSub").toString());
	    		bizOrderCollectVo.setCollectDate(jsonObject.get("collectDate").toString());
	    		bizOrderCollectVo.setCollectAmt(jsonObject.get("collectAmt").toString());
	    		bizOrderCollectVo.setReceiptDate(jsonObject.get("receiptDate").toString());
	    		bizOrderCollectVo.setDueDate(jsonObject.get("dueDate").toString());
	    		bizOrderCollectVo.setRegIdx(Utils.getUserIdx());
	    		bizOrderCollectVo.setRegDate(DateUtil.getCurrentDateTime());
	    		bizOrderCollectVo.setUpdIdx(Utils.getUserIdx());
	    		bizOrderCollectVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		if(jsonObject.get("idx").toString().equals("")) {
	    			bizOrderService.bizOrderCollectIns(bizOrderCollectVo);
	    		} else {
	    			bizOrderService.bizOrderCollectUpd(bizOrderCollectVo);
	    		}
	        }
	        jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 수금정보 삭제
	@RequestMapping(value = "bs/bizOrderCollectDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 상세 삭제");
		try {
			bizOrderService.bizOrderCollectDel(bizOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 수주집계표 수주기간별 수주처 목록조회
	@RequestMapping(value = "bs/bizOrderAdmLstAsDealCorp", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 수주집계표 수주기간별 수주처 목록조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstAsDealCorp(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주관리 수주집계표 수주처별 목록조회
	@RequestMapping(value = "bs/bizOrderDtlLstByDealCorp", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 수주집계표 수주처별 목록조회");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderDtlLstByDealCorp(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계- 월별실적
	@RequestMapping(value = "bs/bizOrderAdmLstGroupByYearMon", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByYearMon(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계- 월별실적");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByYearMon(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계- 분기별실적
	@RequestMapping(value = "bs/bizOrderAdmLstGroupByQuarter", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByQuarter(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계- 분기별실적");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByQuarter(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계- 반기별실적
	@RequestMapping(value = "bs/bizOrderAdmLstGroupByHalf", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLstGroupByHalf(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계- 반기별실적");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderAdmLstGroupByHalf(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수금/매출/미수금 집계- 월별매출
	@RequestMapping(value = "bs/bizOrderSalesGroupByDealMon", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderSalesGroupByDealMon(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수금/매출/미수금 집계- 월별매출");
		try {
			List<BizOrderVo> bizOrderVoList = bizOrderService.bizOrderSalesGroupByDealMon(bizOrderVo);
			jsonData.put("data", bizOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//********************************************* 수주등록(해외) *********************************************
	// 수주등록(해외) 메인 등록/수정
	@RequestMapping(value = "bs/bizOrderAdmAbroadIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmAbroadIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주등록(해외) 메인 등록/수정");
		try {
			String idx = "";
			
			bizOrderVo.setRegIdx(Utils.getUserIdx());
			bizOrderVo.setRegDate(DateUtil.getCurrentDateTime());
			bizOrderVo.setUpdIdx(Utils.getUserIdx());
			bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(bizOrderVo.getBizOrdNo().equals("")) {
				idx = bizOrderService.bizOrderAdmAbroadIns(bizOrderVo);
			} else {
				bizOrderService.bizOrderAdmAbroadUpd(bizOrderVo);
				idx = bizOrderVo.getBizOrdAdmIdx();
			}
			
//			bizOrderVo.setIdx(idx);
//			BizOrderVo bizOrderSelVo = new BizOrderVo();
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
//	    		BizOrderVo bizSerialNoVo = new BizOrderVo();
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
			
			jsonData.put("result", "ok");
			jsonData.put("idx", idx);

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수주등록(해외) 메인 삭제
	@RequestMapping(value = "bs/bizOrderAdmAbroadDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmAbroadDel(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주등록(해외) 메인 삭제");
		try {
			bizOrderService.bizOrderAdmAbroadDel(bizOrderVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 수주 SerialNo ==========================================
	// 수주 SerialNo 목록조회
	@RequestMapping(value = "bs/bizSerialNoLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizSerialNoLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주 SerialNo 목록조회");
		try {
			List<BizOrderVo> bizSerialNoLst = bizOrderService.bizSerialNoLst(bizOrderVo);
			jsonData.put("data", bizSerialNoLst);
			jsonData.put("bizSerialNoLst", bizSerialNoLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//=========================== 프로젝트 리스트 ==========================
	// 프로젝트 목록 조회
	@RequestMapping(value = "bs/bizProjectLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizProjectLst(BizOrderVo bizOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 목록 조회");
		try {
			List<BizOrderVo> bizProjectLst = bizOrderService.bizProjectLst(bizOrderVo);
			jsonData.put("data", bizProjectLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// Serial No 등록/수정
	@RequestMapping(value = "bs/bizSerialNoIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizSerialNoIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);

			//수주 Serial No 리스트
			JSONObject jsonStockObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonStockObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		BizOrderVo bizSerialNoVo = new BizOrderVo();
	    		bizSerialNoVo.setIdx(jsonObject.get("idx").toString());
	    		bizSerialNoVo.setProjectIdx(bizOrderVo.getProjectIdx());
	    		bizSerialNoVo.setGoodsTypeCd(bizOrderVo.getGoodsTypeCd());
	    		bizSerialNoVo.setGoodsNm(bizOrderVo.getGoodsNm());
	    		bizSerialNoVo.setSerialNo(jsonObject.get("serialNo").toString());
	    		bizSerialNoVo.setRegIdx(Utils.getUserIdx());
				bizSerialNoVo.setRegDate(DateUtil.getCurrentDateTime());
				bizSerialNoVo.setUpdIdx(Utils.getUserIdx());
				bizSerialNoVo.setUpdDate(DateUtil.getCurrentDateTime());
				
				if(bizSerialNoVo.getIdx().equals("")) {
					bizOrderService.bizSerialNoIns(bizSerialNoVo);
				} else {
					bizOrderService.bizSerialNoUpd(bizSerialNoVo);
				}
	        }

	        jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 진행여부 업데이트
	@RequestMapping(value = "bs/progressYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> progressYnUpd(BizOrderVo bizOrderVo/*, @RequestParam(value="jsonArray", required=false) String jsonArray*/) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("진행여부 업데이트");
		try {
//			JSONParser jsonParser = new JSONParser();
//			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
//			JSONObject jsonObj = new JSONObject();
			
//	        for(int i=0;i<dataArray.size();i++) {
//	        	jsonObj.put(i, dataArray.get(i));
//	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
//	    		PurchaseOrderVo purchaseOrderVo = new PurchaseOrderVo();
	    		
//	    		purchaseOrderVo.setIdx(jsonObject.get("orderDtlNo").toString());
//	    		purchaseOrderVo.setConfirmYn(jsonObject.get("confirmYn").toString());
	    		bizOrderVo.setUpdIdx(Utils.getUserIdx());
	    		bizOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		bizOrderService.progressYnUpd(bizOrderVo);
//	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
