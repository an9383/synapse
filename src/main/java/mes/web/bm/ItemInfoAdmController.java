package mes.web.bm;

import java.util.ArrayList;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.ItemInfoAdmVo;
import mes.service.bm.ItemInfoAdmService;
import mes.service.bm.WoodenInfoService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class ItemInfoAdmController {
	
	@Inject
	private ItemInfoAdmService itemInfoAdmService;
	@Inject
	private WoodenInfoService woodenInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemInfoAdmController.class);
	
	// bmsc0030
	@RequestMapping(value = "/bm/bmsc0030", method = RequestMethod.GET)
	public ModelAndView bmsc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0030");
		mav.setViewName("/bm/bmsc0030");
		return mav;
	}
		
	// bmsc0070
	@RequestMapping(value = "/bm/bmsc0070", method = RequestMethod.GET)
	public ModelAndView bmsc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0070");
		mav.setViewName("/bm/bmsc0070");
		return mav;
	}
	
	// bmsc0070
	@RequestMapping(value = "/bm/bmsc0110", method = RequestMethod.GET)
	public ModelAndView bmsc0110(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0110");
		mav.setViewName("/bm/bmsc0110");
		return mav;
	}
	
	// bmsc0160
	@RequestMapping(value = "/bm/bmsc0160", method = RequestMethod.GET)
	public ModelAndView bmsc0160(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0160");
		mav.setViewName("/bm/bmsc0160");
		return mav;
	}
	
	// bmsc0180
	@RequestMapping(value = "/bm/bmsc0180", method = RequestMethod.GET)
	public ModelAndView bmsc0180(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0180");
		mav.setViewName("/bm/bmsc0180");
		return mav;
	}
	
	
	//품목정보 목록조회
	@RequestMapping(value = "/bm/itemInfoAdmLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInfoAdmLst(ItemInfoAdmVo itemInfoAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemInfoAdmVo> list  = itemInfoAdmService.itemInfoAdmLst(itemInfoAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보 목록조회 (serverSide X)
	@RequestMapping(value = "/bm/itemInfoAdmListModal", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInfoAdmListModal(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemInfoAdmVo> list  = itemInfoAdmService.itemInfoAdmLst(itemInfoAdmVo);

			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//검사항목 등록여부 포함 품목정보목록
	@RequestMapping(value = "/bm/itemInspAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspAdmList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemInfoAdmVo> list  = itemInfoAdmService.itemInspAdmList(itemInfoAdmVo);

			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보 상세 조회
	@RequestMapping(value = "/bm/itemInfoAdmSel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInfoAdmSel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemInfoAdmVo = itemInfoAdmService.itemInfoAdmSel(itemInfoAdmVo);
			jsonData.put("data", itemInfoAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/bm/itemInfoAdmGetCd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInfoAdmGetCd(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemInfoAdmVo = itemInfoAdmService.itemInfoAdmGetCd(itemInfoAdmVo);
			String itemCdSeq = itemInfoAdmVo.getItemCd();
			jsonData.put("result", "ok");
			jsonData.put("itemCdSeq", itemCdSeq);
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보 등록
	@RequestMapping(value = "/bm/itemInfoAdmIUD", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInfoAdmCreate(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemInfoAdmVo.setRegIdx(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
			itemInfoAdmVo.setRegDate(DateUtil.getCurrentDateTime());
			itemInfoAdmVo.setUpdIdx(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
			itemInfoAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(itemInfoAdmService.itemInfoAdmSel(itemInfoAdmVo) != null) {
				itemInfoAdmService.itemInfoAdmUpd(itemInfoAdmVo);
				jsonData.put("result", "ok");
				jsonData.put("message", "수정되었습니다.");
			} else {
				itemInfoAdmService.itemInfoAdmIns(itemInfoAdmVo);
				jsonData.put("result", "ok");
				jsonData.put("message", "등록되었습니다.");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
//	//품목정보 수정
//	@RequestMapping(value = "/bm/itemInfoAdmUpdate", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> itemInfoAdmUpdate(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		try {
//			itemInfoAdmVo.setUpdIdx(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
//			itemInfoAdmService.itemInfoAdmUpd(itemInfoAdmVo);
//			jsonData.put("result", "ok");
//		}catch(Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}
	
	// 품목구분등록 목록조회 
	@RequestMapping(value = "bm/itemGubunLmsAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemGubunLmsAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목구분등록 목록조회");
		try {
			List<ItemInfoAdmVo> itemGubunLmsAdmLst = itemInfoAdmService.itemGubunLmsAdmLst(itemInfoAdmVo);
			jsonData.put("data", itemGubunLmsAdmLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 품목구분등록 등록/수정
	@RequestMapping(value = "bm/itemGubunLmsAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemGubunLmsAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목구분등록 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ItemInfoAdmVo> itemGubunAddVoList = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		ItemInfoAdmVo itemGubunAddVo = new ItemInfoAdmVo();
	    		itemGubunAddVo.setIdx(jsonObject.get("idx").toString());
	    		itemGubunAddVo.setLmsType(jsonObject.get("lmsType").toString());
	    		itemGubunAddVo.setItemGubun(jsonObject.get("itemGubun").toString());
	    		itemGubunAddVo.setItemGubunNm(jsonObject.get("itemGubunNm").toString());
	    		itemGubunAddVo.setLargeIdx(jsonObject.get("largeIdx").toString());
	    		itemGubunAddVo.setItemGubun1(jsonObject.get("itemGubun1").toString());
	    		itemGubunAddVo.setItemGubun1Nm(jsonObject.get("itemGubun1Nm").toString());
	    		itemGubunAddVo.setMediumIdx(jsonObject.get("mediumIdx").toString());
	    		itemGubunAddVo.setItemGubun2(jsonObject.get("itemGubun2").toString());
	    		itemGubunAddVo.setItemGubun2Nm(jsonObject.get("itemGubun2Nm").toString());
	    		itemGubunAddVo.setUseYn(jsonObject.get("useYn").toString());
	    		itemGubunAddVo.setUpdIdx(Utils.getUserIdx());
	    		itemGubunAddVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		itemGubunAddVo.setRegIdx(Utils.getUserIdx());
	    		itemGubunAddVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		itemGubunAddVoList.add(itemGubunAddVo);
	    		
	    		duplicationCheckIdxList += jsonObject.get("idx").toString() + ",";
	        }
	        
	        for ( int i=0; i<itemGubunAddVoList.size(); i++ ) { // 중복확인 작업
	        	ItemInfoAdmVo itemGubunDupCheckVo = new ItemInfoAdmVo();
//	        	AccountSubjectVo acctVo = new AccountSubjectVo();
	        	
	        	itemGubunDupCheckVo.setIdx(duplicationCheckIdxList);
	        	itemGubunDupCheckVo.setLmsType(itemGubunAddVoList.get(i).getLmsType());
	        	itemGubunDupCheckVo.setLargeIdx(itemGubunAddVoList.get(i).getLargeIdx());
	        	itemGubunDupCheckVo.setMediumIdx(itemGubunAddVoList.get(i).getMediumIdx());
	        	itemGubunDupCheckVo.setItemGubun(itemGubunAddVoList.get(i).getItemGubun());
	        	itemGubunDupCheckVo.setItemGubun1(itemGubunAddVoList.get(i).getItemGubun1());
	        	itemGubunDupCheckVo.setItemGubun2(itemGubunAddVoList.get(i).getItemGubun2());
	        	
//	        	acctVo.setJudgeGubun(itemGubunAddVoList.get(i).getAcctCd());
//	        	acctVo.setIdx(itemGubunAddVoList.get(i).getIdx());
	        	
//	        	if(accountSubjectService.accountSubjectCheck(acctVo) != null) {
//	        		jsonData.put("result", "fail");
//	        		jsonData.put("idx", itemGubunAddVoList.get(i).getIdx());
//	        		jsonData.put("message", "이미 존재하는 코드입니다.");
//	        		return jsonData;
//	        	}
	        	
//	        	if(itemGubunAddVoList.get(i).getIdx().equals("")) {
//	        		if(itemInfoAdmService.itemGubunLmsAdmCheck(itemGubunDupCheckVo) != null) {
//		        		jsonData.put("result", "fail");
//		        		jsonData.put("idx", itemGubunAddVoList.get(i).getIdx());
//		        		jsonData.put("message", "이미 존재하는 코드입니다.");
//		        		return jsonData;
//		        	}
//	        	}
	        }
	        
	        for(int i=0;i<itemGubunAddVoList.size();i++) {
	        	if(itemGubunAddVoList.get(i).getIdx().equals("")) { // 등록
	        		itemInfoAdmService.itemGubunLmsAdmIns(itemGubunAddVoList.get(i));
	        		
	        		if(itemGubunAddVoList.get(i).getLmsType().equals("M")) {
	        			ItemInfoAdmVo itemGubunIdxUpdVo = new ItemInfoAdmVo();
	        			
	        			itemGubunIdxUpdVo.setIdx(itemGubunAddVoList.get(i).getLargeIdx());
	        			itemGubunIdxUpdVo.setLargeIdx(itemGubunAddVoList.get(i).getLargeIdx());
	        			
	    	    		itemGubunIdxUpdVo.setLmsType("");
	    	    		itemGubunIdxUpdVo.setItemGubun("");
	    	    		itemGubunIdxUpdVo.setItemGubunNm("");
	    	    		itemGubunIdxUpdVo.setItemGubun1("");
	    	    		itemGubunIdxUpdVo.setItemGubun1Nm("");
	    	    		itemGubunIdxUpdVo.setMediumIdx("");
	    	    		itemGubunIdxUpdVo.setItemGubun2("");
	    	    		itemGubunIdxUpdVo.setItemGubun2Nm("");
	    	    		itemGubunIdxUpdVo.setUseYn("");
	    	    		itemGubunIdxUpdVo.setUpdIdx(Utils.getUserIdx());
	    	    		itemGubunIdxUpdVo.setUpdDate(DateUtil.getCurrentDateTime());
	    	    		itemGubunIdxUpdVo.setRegIdx(Utils.getUserIdx());
	    	    		itemGubunIdxUpdVo.setRegDate(DateUtil.getCurrentDateTime());
	        			
	    	    		itemInfoAdmService.itemGubunLmsAdmUpd(itemGubunIdxUpdVo);
	        		} else if(itemGubunAddVoList.get(i).getLmsType().equals("S")) {
	        			ItemInfoAdmVo itemGubunIdxUpdVo = new ItemInfoAdmVo();
	        			
	        			itemGubunIdxUpdVo.setIdx(itemGubunAddVoList.get(i).getMediumIdx());
	        			itemGubunIdxUpdVo.setMediumIdx(itemGubunAddVoList.get(i).getMediumIdx());
	        			
	    	    		itemGubunIdxUpdVo.setLmsType("");
	    	    		itemGubunIdxUpdVo.setItemGubun("");
	    	    		itemGubunIdxUpdVo.setItemGubunNm("");
	    	    		itemGubunIdxUpdVo.setLargeIdx("");
	    	    		itemGubunIdxUpdVo.setItemGubun1("");
	    	    		itemGubunIdxUpdVo.setItemGubun1Nm("");
	    	    		itemGubunIdxUpdVo.setItemGubun("");
	    	    		itemGubunIdxUpdVo.setItemGubun2Nm("");
	    	    		itemGubunIdxUpdVo.setUseYn("");
	    	    		itemGubunIdxUpdVo.setUpdIdx(Utils.getUserIdx());
	    	    		itemGubunIdxUpdVo.setUpdDate(DateUtil.getCurrentDateTime());
	    	    		itemGubunIdxUpdVo.setRegIdx(Utils.getUserIdx());
	    	    		itemGubunIdxUpdVo.setRegDate(DateUtil.getCurrentDateTime());
	        			
	    	    		itemInfoAdmService.itemGubunLmsAdmUpd(itemGubunIdxUpdVo);
	        		}
	        		
	        	} else { // 수정
	        		itemInfoAdmService.itemGubunLmsAdmUpd(itemGubunAddVoList.get(i));
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
	
	// 품목구분등록 삭제
	@RequestMapping(value = "bm/itemGubunLmsAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemGubunLmsAdmDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목구분등록 삭제");
		try {
			itemInfoAdmService.itemGubunLmsAdmDel(itemInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//************************************************ 입고단가등록 ************************************************
	//입고단가 목록조회
	@RequestMapping(value = "/bm/itemCostLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCostLst(ItemInfoAdmVo itemInfoAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemInfoAdmVo> list  = itemInfoAdmService.itemCostLst(itemInfoAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 입고단가 등록/수정
	@RequestMapping(value = "bm/itemCostIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCostIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고단가 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<ItemInfoAdmVo> itemGubunAddVoList = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		ItemInfoAdmVo itemCostVo = new ItemInfoAdmVo();
	    		itemCostVo.setIdx(jsonObject.get("idx").toString());
	    		itemCostVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    		itemCostVo.setItemCd(jsonObject.get("itemCd").toString());
	    		itemCostVo.setCostDate(jsonObject.get("costDate").toString());
	    		itemCostVo.setDealCorpCd(jsonObject.get("dealCorpCd").toString());
	    		itemCostVo.setCost(jsonObject.get("cost").toString());
	    		itemCostVo.setCostUnit(jsonObject.get("costUnit").toString());
	    		itemCostVo.setCostDesc(jsonObject.get("costDesc").toString());
	    		itemCostVo.setUpdIdx(Utils.getUserIdx());
	    		itemCostVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		itemCostVo.setRegIdx(Utils.getUserIdx());
	    		itemCostVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		itemGubunAddVoList.add(itemCostVo);
	        }
	        
	        for(int i=0;i<itemGubunAddVoList.size();i++) {
        		if(itemGubunAddVoList.get(i).getCostDesc().equals("delete")) {
        			itemInfoAdmService.itemCostDel(itemGubunAddVoList.get(i));
        		} else {
        			itemInfoAdmService.itemCostIns(itemGubunAddVoList.get(i));
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
	
	// 입고단가 삭제
	@RequestMapping(value = "bm/itemCostDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCostDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고단가 삭제");
		try {
			itemInfoAdmService.itemCostDel(itemInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 입고단가만 수정
	@RequestMapping(value = "bm/itemOnlyCostIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemOnlyCostIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("입고단가만 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		ItemInfoAdmVo itemCostVo = new ItemInfoAdmVo();
	    		itemCostVo.setOrderDtlNo(jsonObject.get("orderDtlNo").toString());
	    		itemCostVo.setCost(jsonObject.get("cost").toString());
	    		itemCostVo.setPreInDate(jsonObject.get("preInDate").toString());
	    		itemCostVo.setUpdIdx(Utils.getUserIdx());
	    		itemCostVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		
	    		itemInfoAdmService.itemOnlyCostUpd(itemCostVo);
	        }
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}