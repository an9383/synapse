package mes.web.sc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.ScmPurchaseOrderVo;
import mes.domain.sm.CommonCodeVo;
import mes.domain.stock.StockPaymentAdmVo;
import mes.service.sc.ScmPurchaseOrderService;
import mes.service.stock.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ScmPurchaseOrderController {
	
	@Inject
	private ScmPurchaseOrderService purchaseOrderService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ScmPurchaseOrderController.class);
	
	
	// scsc0020 페이지
//	@RequestMapping(value = "/sc/scsc0020", method = RequestMethod.GET)
//	public ModelAndView scsc0020(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0020");
//		mav.setViewName("/sc/scsc0020");
//		return mav;
//	}
	
	// scsc0030 페이지
//	@RequestMapping(value = "/sc/scsc0030", method = RequestMethod.GET)
//	public ModelAndView scsc0030(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0030");
//		mav.setViewName("/sc/scsc0030");
//		return mav;
//	}
//	
//	// scsc0040 페이지
//	@RequestMapping(value = "/sc/scsc0040", method = RequestMethod.GET)
//	public ModelAndView scsc0040(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0040");
//		mav.setViewName("/sc/scsc0040");
//		return mav;
//	}
//	
//	// scsc0050 페이지
////	@RequestMapping(value = "/sc/scsc0050", method = RequestMethod.GET)
////	public ModelAndView scsc0050(ModelAndView mav, HttpServletRequest request) {
////		logger.info("page : /sc/scsc0050");
////		mav.setViewName("/sc/scsc0050");
////		return mav;
////	}
//	
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
//	
//	// scsc0080 페이지
//	@RequestMapping(value = "/sc/scsc0080", method = RequestMethod.GET)
//	public ModelAndView scsc0080(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0080");
//		mav.setViewName("/sc/scsc0080");
//		return mav;
//	}
//	
//	// scsc0090 페이지
//	@RequestMapping(value = "/sc/scsc0090", method = RequestMethod.GET)
//	public ModelAndView scsc0090(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0090");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0090");
//		return mav;
//	}
//	
//	// scsc0100 페이지
//	@RequestMapping(value = "/sc/scsc0100", method = RequestMethod.GET)
//	public ModelAndView scsc0100(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0100");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0100");
//		return mav;
//	}
//	
//	// scsc0110 페이지
////	@RequestMapping(value = "/sc/scsc0110", method = RequestMethod.GET)
////	public ModelAndView scsc0110(ModelAndView mav, HttpServletRequest request) {
////		logger.info("page : /sc/scsc0110");
////		mav.addObject("userName", Utils.getUserNm());
////		mav.addObject("userIdx", Utils.getUserIdx());
////		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
////		mav.setViewName("/sc/scsc0110");
////		return mav;
////	}
//	
//	// scsc0120 페이지
//	@RequestMapping(value = "/sc/scsc0120", method = RequestMethod.GET)
//	public ModelAndView scsc0120(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0120");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0120");
//		return mav;
//	}
//	
//	// scsc0130 페이지
//	@RequestMapping(value = "/sc/scsc0130", method = RequestMethod.GET)
//	public ModelAndView scsc0130(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0130");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0130");
//		return mav;
//	}
//	
//	// scsc0160 페이지
//	@RequestMapping(value = "/sc/scsc0160", method = RequestMethod.GET)
//	public ModelAndView scsc0160(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0160");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0160");
//		return mav;
//	}
//	
//	// scsc0170 페이지
//	@RequestMapping(value = "/sc/scsc0170", method = RequestMethod.GET)
//	public ModelAndView scsc0170(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0170");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0170");
//		return mav;
//	}
//	
//	// scsc0180 페이지
//	@RequestMapping(value = "/sc/scsc0180", method = RequestMethod.GET)
//	public ModelAndView scsc0180(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0180");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0180");
//		return mav;
//	}
//	
//	// scsc0190 페이지
////	@RequestMapping(value = "/sc/scsc0190", method = RequestMethod.GET)
////	public ModelAndView scsc0190(ModelAndView mav, HttpServletRequest request) {
////		logger.info("page : /sc/scsc0190");
////		mav.addObject("userName", Utils.getUserNm());
////		mav.addObject("userIdx", Utils.getUserIdx());
////		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
////		mav.setViewName("/sc/scsc0190");
////		return mav;
////	}
//	
//	// scsc0200 페이지
//	@RequestMapping(value = "/sc/scsc0200", method = RequestMethod.GET)
//	public ModelAndView scsc0200(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0200");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0200");
//		return mav;
//	}
//	
//	// scsc0210 페이지
//	@RequestMapping(value = "/sc/scsc0210", method = RequestMethod.GET)
//	public ModelAndView scsc0210(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0210");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0210");
//		return mav;
//	}
//	
//	// scsc0220 페이지
//	@RequestMapping(value = "/sc/scsc0220", method = RequestMethod.GET)
//	public ModelAndView scsc0220(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0220");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0220");
//		return mav;
//	}
//	
//	// scsc0230 페이지
//	@RequestMapping(value = "/sc/scsc0230", method = RequestMethod.GET)
//	public ModelAndView scsc0230(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /sc/scsc0230");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.addObject("userIdx", Utils.getUserIdx());
//		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
//		mav.setViewName("/sc/scsc0230");
//		return mav;
//	}
	
	// =========================== 자재구매요청등록 ==========================================
	// 자재구매요청등록  목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderAdmLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 자재구매요청등록 등록/수정
	@RequestMapping(value = "sc/purchaseOrderAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ScmPurchaseOrderVo> purchaseOrderVoInsertList = new ArrayList<>();
			List<ScmPurchaseOrderVo> purchaseOrderVoUpdateList = new ArrayList<>();
			JSONObject jsonObj = new JSONObject();
			int seq = 1;
			
			String orderNo = purchaseOrderService.purchaseOrderAdmGetOrderNo();
			System.out.println("orderNo : " + orderNo);
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		purchaseOrderVo.setOrderUserIdx(jsonObject.get("orderUserIdx").toString());
	    		purchaseOrderVo.setRequestDate(jsonObject.get("requestDate").toString());
	    		purchaseOrderVo.setRequestGubun(jsonObject.get("requestGubun").toString());
	    		purchaseOrderVo.setBuyReason(jsonObject.get("buyReason").toString());
	    		purchaseOrderVo.setItemGubunIdx(jsonObject.get("itemGubunIdx").toString());
	    		purchaseOrderVo.setItemGubun1Idx(jsonObject.get("itemGubun1Idx").toString());
	    		purchaseOrderVo.setItemGubun2Idx(jsonObject.get("itemGubun2Idx").toString());
	    		purchaseOrderVo.setMaker(jsonObject.get("maker").toString());
	    		purchaseOrderVo.setItemCd(jsonObject.get("itemCd").toString());
	    		purchaseOrderVo.setOrderQty(jsonObject.get("orderQty").toString());
	    		purchaseOrderVo.setOrderDate(jsonObject.get("orderDate").toString());
	    		purchaseOrderVo.setProjectCd(jsonObject.get("projectCd").toString());
	    		purchaseOrderVo.setOrderDesc(jsonObject.get("orderDesc").toString());
	    		purchaseOrderVo.setStatus(jsonObject.get("status").toString());
	    		purchaseOrderVo.setInputGubun(jsonObject.get("inputGubun").toString());
//	    		purchaseOrderVo.setVersion(jsonObject.get("version").toString());
//	    		purchaseOrderVo.setBomGubun(jsonObject.get("bomGubun").toString());
	    		purchaseOrderVo.setBomOrderGubun(jsonObject.get("bomOrderGubun").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		if(jsonObject.get("orderNo")==null) {
	    			String orderSeq;
		    		if(Integer.toString(seq).length()==1) {
		    			orderSeq = "0000"+Integer.toString(seq);
		    		} else if(Integer.toString(seq).length()==2) {
		    			orderSeq = "000"+Integer.toString(seq);
		    		} else if(Integer.toString(seq).length()==3) {
		    			orderSeq = "00"+Integer.toString(seq);
		    		} else if(Integer.toString(seq).length()==4) {
		    			orderSeq = "0"+Integer.toString(seq);
		    		} else {
		    			orderSeq = Integer.toString(seq);
		    		}
		    		purchaseOrderVo.setOrderNo(orderNo + "-" + orderSeq);
	    			purchaseOrderVoInsertList.add(purchaseOrderVo);	
	    			seq++;
	    		} else {
	    			purchaseOrderVo.setOrderNo(jsonObject.get("orderNo").toString());
	    			purchaseOrderVoUpdateList.add(purchaseOrderVo);
	    		}
	        }
	        
	        for(int i=0;i<purchaseOrderVoInsertList.size();i++) {
        		purchaseOrderService.purchaseOrderAdmIns(purchaseOrderVoInsertList.get(i));
	        }
	        for(int i=0;i<purchaseOrderVoUpdateList.size();i++) {
        		purchaseOrderService.purchaseOrderAdmUpd(purchaseOrderVoUpdateList.get(i));
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 자재구매요청등록 삭제
	@RequestMapping(value = "sc/purchaseOrderAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmDel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 삭제");
		try {
			purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
			purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			purchaseOrderService.purchaseOrderAdmDel(purchaseOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 발주관리 ==========================================
	// 발주관리 요청번호별 조회
	@RequestMapping(value = "sc/purchaseOrderAdmOrderNoLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmOrderNoLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 요청번호별 조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmOrderNoLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	// 발주관리를 등록할 수 있는 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmInsertLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmInsertLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmInsertLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 등록/수정
	@RequestMapping(value = "sc/purchaseOrderDtlIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ScmPurchaseOrderVo> purchaseOrderVoInsertList = new ArrayList<>();
			List<ScmPurchaseOrderVo> purchaseOrderVoUpdateList = new ArrayList<>();
			List<ScmPurchaseOrderVo> purchaseOrderDtlVoInsertList = new ArrayList<>();
			List<ScmPurchaseOrderVo> purchaseOrderDtlVoUpdateList = new ArrayList<>();
			JSONObject jsonObj = new JSONObject();
			
			String dealCorpVal = "";
			int seq = 1;
			int dtlSeq = 1;
			String orderNo = purchaseOrderService.purchaseOrderAdmGetOrderNo();
			String orderDtlNo = purchaseOrderService.purchaseOrderDtlGetOrderDtlNo();
			System.out.println("orderNo : " + orderNo);
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		purchaseOrderVo.setRequestDate(jsonObject.get("requestDate").toString());
	    		purchaseOrderVo.setProjectCd(jsonObject.get("projectCd").toString());
	    		purchaseOrderVo.setBuyReason(jsonObject.get("buyReason").toString());
	    		purchaseOrderVo.setItemGubunIdx(jsonObject.get("itemGubunIdx").toString());
	    		purchaseOrderVo.setItemGubun1Idx(jsonObject.get("itemGubun1Idx").toString());
	    		purchaseOrderVo.setItemGubun2Idx(jsonObject.get("itemGubun2Idx").toString());
	    		purchaseOrderVo.setOrderUserIdx(jsonObject.get("orderUserIdx").toString());
	    		purchaseOrderVo.setMaker(jsonObject.get("maker").toString());
	    		purchaseOrderVo.setItemCd(jsonObject.get("itemCd").toString());
	    		purchaseOrderVo.setOrderQty(jsonObject.get("orderQty").toString());
	    		purchaseOrderVo.setOrderDate(jsonObject.get("orderDate").toString());
	    		purchaseOrderVo.setStatus(jsonObject.get("status").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		purchaseOrderVo.setOrderDtlQty(jsonObject.get("orderDtlQty").toString());
	    		purchaseOrderVo.setAlreadyOrderDtlQty(jsonObject.get("alreadyOrderDtlQty").toString());
//	    		if(jsonObject.get("orderNo")==null) {
//	    			String orderSeq;
//		    		if(Integer.toString(seq).length()==1) {
//		    			orderSeq = "0000"+Integer.toString(seq);
//		    		} else if(Integer.toString(seq).length()==2) {
//		    			orderSeq = "000"+Integer.toString(seq);
//		    		} else if(Integer.toString(seq).length()==3) {
//		    			orderSeq = "00"+Integer.toString(seq);
//		    		} else if(Integer.toString(seq).length()==4) {
//		    			orderSeq = "0"+Integer.toString(seq);
//		    		} else {
//		    			orderSeq = Integer.toString(seq);
//		    		}
//		    		purchaseOrderVo.setOrderNo(orderNo + "-" + orderSeq);
//		    		purchaseOrderVo.setInputGubun("E");
//	    			purchaseOrderVoInsertList.add(purchaseOrderVo);	
//	    			seq++;
//	    		} else {
    			purchaseOrderVo.setOrderNo(jsonObject.get("orderNo").toString());
    			int sum = Integer.parseInt(purchaseOrderVo.getOrderDtlQty()) + Integer.parseInt(purchaseOrderVo.getAlreadyOrderDtlQty());
    			
    			if(Integer.parseInt(purchaseOrderVo.getOrderQty()) <= sum) {
    				purchaseOrderVo.setStatus("002");
    			}
    			purchaseOrderVoUpdateList.add(purchaseOrderVo);
//	    		}
	    		
	    		purchaseOrderVo.setPrice(jsonObject.get("price").toString());
	    		purchaseOrderVo.setSupplyAmt(jsonObject.get("supplyAmt").toString());
	    		purchaseOrderVo.setVat(jsonObject.get("vat").toString());
	    		purchaseOrderVo.setDeliveryPossibleDate(jsonObject.get("deliveryPossibleDate").toString());
	    		purchaseOrderVo.setPreInDate(jsonObject.get("preInDate").toString());
	    		purchaseOrderVo.setDeliveryOrderDate(jsonObject.get("deliveryOrderDate").toString());
	    		purchaseOrderVo.setDealCorpIdx(jsonObject.get("dealCorpIdx").toString());
	    		purchaseOrderVo.setOrderDtlDesc(jsonObject.get("orderDtlDesc").toString());
	    		purchaseOrderVo.setDeliveryUserIdx(Utils.getUserIdx());
	    		
	    		if(jsonObject.get("orderDtlNo")==null || jsonObject.get("orderDtlNo").equals("")) {
	    			if(!dealCorpVal.equals(jsonObject.get("dealCorpIdx").toString())) {
	    				dealCorpVal = jsonObject.get("dealCorpIdx").toString();
	    			
    					for(int j=0;j<purchaseOrderDtlVoInsertList.size();j++) {
	    					purchaseOrderService.purchaseOrderDtlIns(purchaseOrderDtlVoInsertList.get(j));
    					}
	    				purchaseOrderDtlVoInsertList = new ArrayList<>();
	    				
	    				orderDtlNo = purchaseOrderService.purchaseOrderDtlGetOrderDtlNo();
	    				dtlSeq = 1;
	    			}
		    		String orderDtlSeq;
		    		
		    		orderDtlSeq = Integer.toString(dtlSeq);
		    		
		    		purchaseOrderVo.setOrderDtlNo(orderDtlNo);
		    		purchaseOrderVo.setOrderDtlSeq(orderDtlSeq);
		    		dtlSeq++;
		    		purchaseOrderDtlVoInsertList.add(purchaseOrderVo);
	    		} else {
	    			purchaseOrderVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    			purchaseOrderDtlVoUpdateList.add(purchaseOrderVo);
	    		}
	        }
	        
//	        for(int i=0;i<purchaseOrderVoInsertList.size();i++) {
//        		purchaseOrderService.purchaseOrderAdmIns(purchaseOrderVoInsertList.get(i));
//	        }
	        for(int i=0;i<purchaseOrderVoUpdateList.size();i++) {
        		purchaseOrderService.purchaseOrderAdmUpd(purchaseOrderVoUpdateList.get(i));
	        }
	        for(int i=0;i<purchaseOrderDtlVoInsertList.size();i++) {
        		purchaseOrderService.purchaseOrderDtlIns(purchaseOrderDtlVoInsertList.get(i));
	        }
	        for(int i=0;i<purchaseOrderDtlVoUpdateList.size();i++) {
        		purchaseOrderService.purchaseOrderDtlUpd(purchaseOrderDtlVoUpdateList.get(i));
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 삭제
	@RequestMapping(value = "sc/purchaseOrderDtlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlDel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 삭제");
		try {
			int cnt = purchaseOrderService.inProdWhsAdmCnt(purchaseOrderVo);
			
			if(cnt > 0) {
				jsonData.put("result", "fail");
				jsonData.put("message", "이미 입고가 진행중입니다.");
				
				return jsonData;
			} else {
				purchaseOrderService.purchaseOrderDtlDel(purchaseOrderVo);
			}
			
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주 종료
	@RequestMapping(value = "sc/completeYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> completeYnUpd(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주 종료");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		
	    		purchaseOrderVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    		purchaseOrderVo.setCompleteYn(jsonObject.get("completeYn").toString());
	    		purchaseOrderVo.setCompleteDesc(jsonObject.get("completeDesc").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		purchaseOrderService.completeYnUpd(purchaseOrderVo);
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주확정/취소
	@RequestMapping(value = "sc/confirmYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> confirmYnUpd(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주확정/취소");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		
	    		purchaseOrderVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    		purchaseOrderVo.setConfirmYn(jsonObject.get("confirmYn").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		purchaseOrderService.confirmYnUpd(purchaseOrderVo);
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 입고관리 ==========================================
	// 입고관리를 등록할 수 있는 목록조회
	@RequestMapping(value = "sc/purchaseOrderDtlInsertLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlInsertLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderDtlInsertLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 입고등록
	@RequestMapping(value = "sc/inProdWhsAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inProdWhsAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고등록");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ScmPurchaseOrderVo> inProdWhsAdmInsertList = new ArrayList<>();
			JSONObject jsonObj = new JSONObject();
			int dtlSeq = 1;
			String inSlipNo = purchaseOrderService.inProdWhsAdmGetInSlipNo();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		
	    		purchaseOrderVo.setItemCd(jsonObject.get("itemCd").toString());
				purchaseOrderVo.setPrice(jsonObject.get("price").toString());
				purchaseOrderVo.setInQty(jsonObject.get("inQty").toString());
				purchaseOrderVo.setInDate(jsonObject.get("inDate").toString());
				purchaseOrderVo.setDealCorpIdx(jsonObject.get("dealCorpIdx").toString());
				purchaseOrderVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
				purchaseOrderVo.setWhsIdx(jsonObject.get("whsIdx").toString());
				purchaseOrderVo.setWhsGubun(jsonObject.get("whsGubun").toString());
				purchaseOrderVo.setInUserIdx(jsonObject.get("inUserIdx").toString());
				purchaseOrderVo.setInDesc(jsonObject.get("inDesc").toString());
				purchaseOrderVo.setInputGubun(jsonObject.get("inputGubun").toString());
				
				purchaseOrderVo.setLotNo("");
	    		
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
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
		    		purchaseOrderVo.setInSlipNo(inSlipNo + "-" + inSlipNoSeq);
		    		dtlSeq++;
		    		inProdWhsAdmInsertList.add(purchaseOrderVo);
	    		}
	        }
	        
	        //수불 출고와 함께
    		StockPaymentAdmVo stockPaymentAdmEmptyVo = new StockPaymentAdmVo();
			String spNo = stockPaymentAdmService.stockPaymentAdmGetSpNo(stockPaymentAdmEmptyVo); // 입고수불 전표번호 채번
			
			//수불 등록 JSON배열
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			JSONArray stock_array = new JSONArray();
			
	        for(int i=0;i<inProdWhsAdmInsertList.size();i++) {
        		purchaseOrderService.inProdWhsAdmIns(inProdWhsAdmInsertList.get(i));
    			
				JSONObject stockData = new JSONObject();
				
				stockData.put("SP_NO", spNo);
				stockData.put("SP_SEQ", Integer.toString(i+1));
				stockData.put("SP_GUBUN", "001");
				stockData.put("SP_IDX", inProdWhsAdmInsertList.get(i).getItemCd());
				stockData.put("SP_TYPE", "입고");
				stockData.put("SP_TYPE2", "");
				stockData.put("SP_DATE", inProdWhsAdmInsertList.get(i).getInDate());
				stockData.put("SP_QTY", inProdWhsAdmInsertList.get(i).getInQty());
				//LOT NO 채번 기준 구현하면 읽어서 저장
				stockData.put("SP_LOT_NO", "");
				stockData.put("SP_SOURCE_NO", inProdWhsAdmInsertList.get(i).getInSlipNo());
				stockData.put("SP_WHS_GUBUN", inProdWhsAdmInsertList.get(i).getWhsGubun());
				stockData.put("SP_WHS_IDX", inProdWhsAdmInsertList.get(i).getWhsIdx());
				stockData.put("SP_LOC_IDX", 0);
				stockData.put("IN_SLIP_NO", inSlipNo);
				stockData.put("IN_SLIP_SEQ", Integer.toString(i+1));
				stockData.put("SP_DESC", inProdWhsAdmInsertList.get(i).getInDesc());
				stockData.put("REG_IDX", Utils.getUserIdx());
    			
    			stock_array.add(stockData);
    			
    			/*
    			String inputGubun = inProdWhsAdmInsertList.get(i).getInputGubun();
    			
    			//BOM 발주인 경우 입고 동시 출고처리
    			if("B".equals(inputGubun)) {
    				String outSpNo = stockPaymentAdmService.stockPaymentAdmGetSpNo(stockPaymentAdmEmptyVo); // 입고수불 전표번호 채번
    				
    				StockPaymentAdmVo outStockPaymentAdmVo = new StockPaymentAdmVo();
        			JSONArray outStock_array = new JSONArray();
        			
    				JSONObject outStockData = new JSONObject();
    				
    				outStockData.put("SP_NO", outSpNo);
    				outStockData.put("SP_SEQ", Integer.toString(i+1));
    				outStockData.put("SP_GUBUN", "001");
    				outStockData.put("SP_IDX", inProdWhsAdmInsertList.get(i).getItemCd());
    				outStockData.put("SP_TYPE", "출고");
    				outStockData.put("SP_TYPE2", "");
    				outStockData.put("SP_DATE", inProdWhsAdmInsertList.get(i).getInDate());
    				outStockData.put("SP_QTY", inProdWhsAdmInsertList.get(i).getInQty());
    				outStockData.put("SP_LOT_NO", ""); //LOT 번호는 프로시저단에서 채번된걸 검색해서 가져와야함
    				outStockData.put("SP_SOURCE_NO", inProdWhsAdmInsertList.get(i).getInSlipNo());
    				outStockData.put("SP_WHS_GUBUN", inProdWhsAdmInsertList.get(i).getWhsGubun());
    				outStockData.put("SP_WHS_IDX", inProdWhsAdmInsertList.get(i).getWhsIdx());
    				outStockData.put("SP_LOC_IDX", 0);
    				outStockData.put("IN_SLIP_NO", inSlipNo);
    				outStockData.put("IN_SLIP_SEQ", Integer.toString(i+1));
    				outStockData.put("SP_DESC", inProdWhsAdmInsertList.get(i).getInDesc());
    				outStock_array.add(outStockData);
        				
        			stockPaymentAdmVo.setInsertJson(outStock_array.toJSONString());
        			stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
        			stockPaymentAdmVo.setRegDate(DateUtil.getCurrentDateTime());
        			stockPaymentAdmService.stockPaymentAdmIns(stockPaymentAdmVo); // 입고수불 등록
    			}
    			*/
	        }
	        
	        stockPaymentAdmVo.setInsertJson(stock_array.toJSONString());
	        stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
			stockPaymentAdmService.stockPaymentAdmIns(stockPaymentAdmVo); // 입고수불 등록
			
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// =========================== 자재사용등록 ==========================================
	// 자재사용등록  목록조회
	@RequestMapping(value = "sc/outProdLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outProdLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재사용등록 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.outProdLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재사용등록 상세 조회
	@RequestMapping(value = "sc/outProdSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outProdSel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			purchaseOrderVo = purchaseOrderService.outProdSel(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	// 자재사용등록
	@RequestMapping(value = "sc/outProdWhsAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outProdWhsAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재사용등록");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ScmPurchaseOrderVo> outProdWhsAdmInsertList = new ArrayList<>();
			List<ScmPurchaseOrderVo> outProdWhsAdmUpdateList = new ArrayList<>();
			
			JSONObject jsonObj = new JSONObject();
			int dtlSeq = 1;
			String outSlipNo = purchaseOrderService.outProdWhsAdmGetOutSlipNo();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		
	    		purchaseOrderVo.setItemCd(jsonObject.get("itemCd").toString());
				purchaseOrderVo.setOutQty(jsonObject.get("outQty").toString());
				purchaseOrderVo.setOutDate(jsonObject.get("outDate").toString());
				purchaseOrderVo.setOutUserIdx(jsonObject.get("outUserIdx").toString());
				purchaseOrderVo.setOutDepartment(jsonObject.get("outDepartment").toString());
				purchaseOrderVo.setPrjCd(jsonObject.get("prjCd").toString());
				purchaseOrderVo.setOutDesc(jsonObject.get("outDesc").toString());
	    		
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		if(jsonObject.get("outSlipNo")==null) {
		    		String outSlipNoSeq;
		    		if(Integer.toString(dtlSeq).length()==1) {
		    			outSlipNoSeq = "0000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==2) {
		    			outSlipNoSeq = "000"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==3) {
		    			outSlipNoSeq = "00"+Integer.toString(dtlSeq);
		    		} else if(Integer.toString(dtlSeq).length()==4) {
		    			outSlipNoSeq = "0"+Integer.toString(dtlSeq);
		    		} else {
		    			outSlipNoSeq = Integer.toString(dtlSeq);
		    		}
		    		purchaseOrderVo.setOutSlipNo(outSlipNo + "-" + outSlipNoSeq);
		    		dtlSeq++;
		    		outProdWhsAdmInsertList.add(purchaseOrderVo);
	    		} else {
	    			purchaseOrderVo.setOutSlipNo(jsonObject.get("outSlipNo").toString());
	    			
	    			outProdWhsAdmUpdateList.add(purchaseOrderVo);
	    		}
	        }
	        for(int i=0;i<outProdWhsAdmInsertList.size();i++) {
        		purchaseOrderService.outProdWhsAdmIns(outProdWhsAdmInsertList.get(i));
        		
        		//수불 출고와 함께
        		StockPaymentAdmVo stockPaymentAdmEmptyVo = new StockPaymentAdmVo();
    			String spNo = stockPaymentAdmService.stockPaymentAdmGetSpNo(stockPaymentAdmEmptyVo); // 입고수불 전표번호 채번
    			
    			//수불 등록 JSON배열
    			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
    			JSONArray stock_array = new JSONArray();
    			
				JSONObject stockData = new JSONObject();
				
				stockData.put("SP_NO", spNo);
				stockData.put("SP_SEQ", Integer.toString(i+1));
				stockData.put("SP_GUBUN", "001");
				stockData.put("SP_IDX", outProdWhsAdmInsertList.get(i).getItemCd());
				stockData.put("SP_TYPE", "출고");
				stockData.put("SP_TYPE2", "");
				stockData.put("SP_DATE", outProdWhsAdmInsertList.get(i).getOutDate());
				stockData.put("SP_QTY", outProdWhsAdmInsertList.get(i).getOutQty());
				stockData.put("SP_LOT_NO", ""); //LOT 번호는 프로시저단에서 채번된걸 검색해서 가져와야함
				stockData.put("SP_SOURCE_NO", outProdWhsAdmInsertList.get(i).getOutSlipNo());
				stockData.put("SP_WHS_GUBUN", "");
				stockData.put("SP_WHS_IDX", 0);
				stockData.put("SP_LOC_IDX", 0);
				stockData.put("IN_SLIP_NO", outSlipNo);
				stockData.put("IN_SLIP_SEQ", Integer.toString(i+1));
				stockData.put("SP_DESC", outProdWhsAdmInsertList.get(i).getOutDesc());
				stock_array.add(stockData);
    			
    			stockPaymentAdmVo.setInsertJson(stock_array.toJSONString());
    			stockPaymentAdmVo.setRegIdx(Utils.getUserIdx());
    			stockPaymentAdmVo.setRegDate(DateUtil.getCurrentDateTime());
    			stockPaymentAdmService.stockPaymentAdmIns(stockPaymentAdmVo); // 입고수불 등록
    			
    			String inputGubun = outProdWhsAdmInsertList.get(i).getInputGubun();
    			
	        }
	        
	        for(int i=0;i<outProdWhsAdmUpdateList.size();i++) {
	        	purchaseOrderService.outProdWhsAdmUpd(outProdWhsAdmUpdateList.get(i));
	        	
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 통합발주관리대장 ==========================================
	
	// 통합발주관리대장  목록조회
	@RequestMapping(value = "sc/totalPurchaseOrderLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> totalPurchaseOrderLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("통합발주관리대장 목록조회");
		try {
			List<ScmPurchaseOrderVo> totalPurchaseOrderList = purchaseOrderService.totalPurchaseOrderLst(purchaseOrderVo);
			jsonData.put("data", totalPurchaseOrderList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// =========================== 발주서 출력 ==========================================
	// 발주서출력 좌측조회
	@RequestMapping(value = "sc/purchaseOrderPrintUpvoteLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderPrintUpvoteLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주서출력 좌측조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderPrintUpvoteLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주서출력 목록조회
	@RequestMapping(value = "sc/purchaseOrderPrintLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderPrintLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주서출력 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderPrintLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@RequestMapping(value = "sc/purchasePaperUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchasePaperUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주서 출력번호 및 출력여부 수정");
		try {
			purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			purchaseOrderService.purchasePaperUpd(purchaseOrderVo);
			jsonData.put("result", "ok");			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 개별발주등록
	@RequestMapping(value = "sc/purchaseOrderDtlIndividualIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlIndividualIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개별발주등록");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ScmPurchaseOrderVo> purchaseOrderDtlVoInsertList = new ArrayList<>();
			List<ScmPurchaseOrderVo> purchaseOrderDtlVoUpdateList = new ArrayList<>();
			JSONObject jsonObj = new JSONObject();
			int dtlSeq = 1;
			String orderDtlNo = purchaseOrderService.purchaseOrderDtlGetOrderDtlNo();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		purchaseOrderVo.setOrderNo(null);
	    		purchaseOrderVo.setDealCorpIdx(jsonObject.get("dealCorpIdx").toString());
	    		purchaseOrderVo.setDeliveryUserIdx(jsonObject.get("orderUserIdx").toString());
	    		purchaseOrderVo.setDeliveryOrderDate(jsonObject.get("deliveryOrderDate").toString());
	    		purchaseOrderVo.setOrderDtlDesc(jsonObject.get("orderDtlDesc").toString());
	    		
	    		purchaseOrderVo.setItemGubunIdx(jsonObject.get("itemGubunIdx").toString());
	    		purchaseOrderVo.setItemGubun1Idx(jsonObject.get("itemGubun1Idx").toString());
	    		purchaseOrderVo.setItemGubun2Idx(jsonObject.get("itemGubun2Idx").toString());
	    		purchaseOrderVo.setItemCd(jsonObject.get("itemCd").toString());
	    		
	    		purchaseOrderVo.setPrice(jsonObject.get("price").toString());
	    		purchaseOrderVo.setOrderDtlQty(jsonObject.get("orderDtlQty").toString());
	    		purchaseOrderVo.setSupplyAmt(jsonObject.get("supplyAmt").toString());
	    		purchaseOrderVo.setVat(jsonObject.get("vat").toString());
	    		purchaseOrderVo.setProjectCd(jsonObject.get("projectCd").toString());
	    		purchaseOrderVo.setDeliveryPossibleDate(jsonObject.get("deliveryPossibleDate").toString());
	    		
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		if(jsonObject.get("orderDtlNo")==null) {
		    		String orderDtlSeq;
		    		orderDtlSeq = Integer.toString(dtlSeq);
		    		
		    		purchaseOrderVo.setOrderDtlNo(orderDtlNo);
		    		purchaseOrderVo.setOrderDtlSeq(orderDtlSeq);
		    		dtlSeq++;
		    		purchaseOrderDtlVoInsertList.add(purchaseOrderVo);
	    		} else {
	    			purchaseOrderVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    			purchaseOrderDtlVoUpdateList.add(purchaseOrderVo);
	    		}
	        }
	        for(int i=0;i<purchaseOrderDtlVoInsertList.size();i++) {
        		purchaseOrderService.purchaseOrderDtlIns(purchaseOrderDtlVoInsertList.get(i));
        		
//        		PurchaseOrderVo confirmYnVo = new PurchaseOrderVo();
//        		confirmYnVo.setOrderDtlNo(purchaseOrderDtlVoInsertList.get(i).getOrderDtlNo());
//        		confirmYnVo.setConfirmYn("Y");
//        		confirmYnVo.setUpdIdx(Utils.getUserIdx());
//        		confirmYnVo.setUpdDate(DateUtil.getCurrentDateTime());
//	    		
//	    		purchaseOrderService.confirmYnUpd(confirmYnVo);
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// =========================== 개별발주 리스트 ==========================================
	// 개별발주 목록조회
	@RequestMapping(value = "sc/purchaseIndividualLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseIndividualLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개별발주 목록조회");
		try {
			List<ScmPurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseIndividualLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 발주 단가 수정
	@RequestMapping(value = "sc/purchaseOrderDtlPriceUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlPriceUpdate(@RequestBody List<Map<String, Object>> purchaseOrderAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주 단가 수정");
		try {
			
			List<ScmPurchaseOrderVo> purchaseOrderDtlVoUpdateList = new ArrayList<>();

	        for(Map<String, Object> list : purchaseOrderAdmList) {
	    		ScmPurchaseOrderVo purchaseOrderVo = new ScmPurchaseOrderVo();
	    		purchaseOrderVo.setOrderDtlNo(list.get("orderDtlNo").toString());		
	    		purchaseOrderVo.setPrice(list.get("price").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		purchaseOrderDtlVoUpdateList.add(purchaseOrderVo);
	        }
	        
	        for(int i=0;i<purchaseOrderDtlVoUpdateList.size();i++) {
        		purchaseOrderService.purchaseOrderDtlUpd(purchaseOrderDtlVoUpdateList.get(i));
	        }
        	jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	/*
	
	// 발주관리 발주서번호별 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstByPurchasePrintNo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주서번호별 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstByPurchasePrintNo(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 수주상세식별자별 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstByBizDtlIdx", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstByBizDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 수주상세식별자별 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstByBizDtlIdx(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	@RequestMapping(value = "sc/purchaseOrderDtlLstByPurchasePrintNo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderDtlLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주서번호별 입고 상세 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderDtlLstByPurchasePrintNo(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 수주별 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstByBizDtl", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstByBizDtl(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstByBizDtl(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 공정별 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstByWorkOrdPrcss", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstByWorkOrdPrcss(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 공정별 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstByWorkOrdPrcss(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 개별발주 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstBySingle", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstBySingle(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 개별발주 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstBySingle(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 메인 상세조회
	@RequestMapping(value = "sc/purchaseOrderAdmSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 상세조회");
		try {
			purchaseOrderVo = purchaseOrderService.purchaseOrderAdmSel(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 메인 수정
	@RequestMapping(value = "sc/purchaseOrderAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 수정");
		try {
			purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
			purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			purchaseOrderService.purchaseOrderAdmUpd(purchaseOrderVo);
			if("Y".equals(purchaseOrderVo.getSuccessYn())){
				jsonData.put("result", "ok");
			} else {
				jsonData.put("message", purchaseOrderVo.getResMessage());
				jsonData.put("result", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 메인 수정/삭제 체크
	@RequestMapping(value = "sc/purchaseOrderAdmUpdCheckByBizOrdDtlIdx", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmUpdCheckByBizOrdDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 수정/삭제 체크");
		try {
			PurchaseOrderVo returnVo = new PurchaseOrderVo();
			purchaseOrderService.purchaseOrderAdmUpdCheckByBizOrdDtlIdx(purchaseOrderVo);
			if("Y".equals(purchaseOrderVo.getResultYn())){
				jsonData.put("result", "ok");
			} else {
				jsonData.put("message", purchaseOrderVo.getResMessage());
				jsonData.put("result", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 입고예정일 수정
	@RequestMapping(value = "sc/purchaseOrderInDueDateAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderInDueDateAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 입고예정일 수정");
		try {
			purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
			purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			purchaseOrderService.purchaseOrderInDueDateAdmUpd(purchaseOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 메인 삭제
	@RequestMapping(value = "sc/purchaseOrderAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 삭제");
		try {
			purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
			purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
			purchaseOrderService.purchaseOrderAdmDel(purchaseOrderVo);
			if("Y".equals(purchaseOrderVo.getSuccessYn())) {
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", purchaseOrderVo.getResMessage());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@RequestMapping(value = "sc/purchasePaperUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주서 출력번호 및 출력여부 수정");
		try {
			purchaseOrderService.purchasePaperUpd(purchaseOrderVo);
			if("Y".equals(purchaseOrderVo.getResultYn())) {
				jsonData.put("result", "ok");			
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", purchaseOrderVo.getResMessage());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	@RequestMapping(value = "sc/purchasePaperDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchasePaperDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 발주서 출력번호 삭제 및 출력여부 수정");
		try {
			purchaseOrderService.purchasePaperDel(purchaseOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstSumInQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstSumInQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstSumInQty(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	@RequestMapping(value = "sc/purchaseOrderAdmLstWithNeedQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderAdmLstWithNeedQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주 재질별 필요량 계산 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.purchaseOrderAdmLstWithNeedQty(purchaseOrderVo);
	//		List<PurchaseOrderVo> purchaseOrderList = purchaseOrderVoList.stream()
	//													.filter(v->StringUtils.equals("SELECT", v.getSelectGubun()))
	//													.collect(Collectors.toList());
	//		List<PurchaseOrderVo> purchaseOrderAllList = purchaseOrderVoList.stream()
	//													.filter(v->StringUtils.equals("ALL_SELECT", v.getSelectGubun()))
	//													.collect(Collectors.toList());
			jsonData.put("data", purchaseOrderVoList);
			//jsonData.put("allData", purchaseOrderAllList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//발주관리 메인 발주수량 수정
	@RequestMapping(value = "sc/purchaseOrderQtyAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderQtyAdmUpd(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 발주수량 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			List<PurchaseOrderVo> purchaseOrderVoList = new ArrayList<>();
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		PurchaseOrderVo purchaseOrderVo = new PurchaseOrderVo();
	    //		String plusMinus = Float.parseFloat(jsonObject.get("beforeordQty").toString()) <= Float.parseFloat(jsonObject.get("purchaseOrdQty").toString()) 
	    //				? "plus" : "minus"; 
	    //		float targetQty = Float.parseFloat(jsonObject.get("beforeordQty").toString()) >= Float.parseFloat(jsonObject.get("purchaseOrdQty").toString()) 
	    //				? Float.parseFloat(jsonObject.get("beforeordQty").toString()) - Float.parseFloat(jsonObject.get("purchaseOrdQty").toString()) : Float.parseFloat(jsonObject.get("purchaseOrdQty").toString()) - Float.parseFloat(jsonObject.get("beforeordQty").toString());
	    //		float purchaseOrdQty = targetQty * Float.parseFloat(jsonObject.get("cutQty").toString()) * Float.parseFloat(jsonObject.get("eaQty").toString());
	    //			
   		//		purchaseOrderVo.setPlusMinus(plusMinus);
	    		purchaseOrderVo.setIdx(jsonObject.get("idx").toString());
	    	    purchaseOrderVo.setPurchaseOrdQty(jsonObject.get("purchaseOrdQty").toString());
	    		purchaseOrderVo.setUpdIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		purchaseOrderVoList.add(purchaseOrderVo);
	        }
	        
	        for(int i=0;i<purchaseOrderVoList.size();i++) {
        		purchaseOrderService.purchaseOrderQtyAdmUpd(purchaseOrderVoList.get(i));
	        }
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	@RequestMapping(value = "sc/inOrginLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inOrginLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고원장 목록조회");
		try {
			List<PurchaseOrderVo> purchaseOrderVoList = purchaseOrderService.inOrginLst(purchaseOrderVo);
			jsonData.put("data", purchaseOrderVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	*/
}
