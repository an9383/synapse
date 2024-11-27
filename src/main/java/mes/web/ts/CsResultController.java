package mes.web.ts;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.ts.CsResultVo;
import mes.service.ts.CsResultService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class CsResultController {
	
	@Inject
	private CsResultService csResultService;

	private static final Logger logger = LoggerFactory.getLogger(CsResultController.class);

//	// bssc0140 페이지
//	@RequestMapping(value = "/ts/tssc0020", method = RequestMethod.GET)
//	public ModelAndView bssc0140(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /ts/tssc0020");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.setViewName("/ts/tssc0020");
//		return mav;
//	}
	
	@RequestMapping(value = "/ts/csResultList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csResultList(CsResultVo csResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("사용자승인권한관리: "+cmplnReceiveVo);
		try {
			List<CsResultVo> CsResultVo = csResultService.csResultList(csResultVo);
			jsonData.put("data", CsResultVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/csResultIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csResultIU(CsResultVo csResultVo, HttpServletRequest request) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
//			String asNo;
//			if(csResultVo.getAsNo().equals("")) {
//				asNo = csResultService.getAsNo();
//			}else {
//				asNo = csResultVo.getAsNo();
//			}
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(csResultVo.getArrayData());
			List<CsResultVo> CmplnReceiveVoList = new ArrayList<>();
				
			for(int i=0;i<jsonArray.size();i++) {
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				CsResultVo cmplnVo = new CsResultVo();
				cmplnVo.setAsNo(jsonObjDtl.get("asNo").toString());
				cmplnVo.setSubAsNo(jsonObjDtl.get("subAsNo").toString());
				cmplnVo.setIdx(jsonObjDtl.get("idx").toString());
				cmplnVo.setItemCd(jsonObjDtl.get("itemCd").toString());
				cmplnVo.setItemNm(jsonObjDtl.get("itemNm").toString());
				cmplnVo.setItemDc(jsonObjDtl.get("itemDc").toString());
				cmplnVo.setStockQty(jsonObjDtl.get("stockQty").toString());
				cmplnVo.setConsumption(jsonObjDtl.get("consumption").toString());
				cmplnVo.setPaidFree(jsonObjDtl.get("paidFree").toString());
				cmplnVo.setPriceCost(jsonObjDtl.get("priceCost").toString());
				cmplnVo.setRepairCost(jsonObjDtl.get("repairCost").toString());
				cmplnVo.setEtcCost(jsonObjDtl.get("etcCost").toString());
				cmplnVo.setTravelExpense(jsonObjDtl.get("travelExpense").toString());
				cmplnVo.setTotalCost(jsonObjDtl.get("totalCost").toString());
				cmplnVo.setProcessing(jsonObjDtl.get("processing").toString());
				cmplnVo.setResultDesc(jsonObjDtl.get("resultDesc").toString());
				cmplnVo.setRegIdx(Utils.getUserIdx());
				cmplnVo.setRegDate(DateUtil.getCurrentDateTime());
				cmplnVo.setUpdIdx(Utils.getUserIdx());
				cmplnVo.setUpdDate(DateUtil.getCurrentDateTime());
				CmplnReceiveVoList.add(cmplnVo);
//				cmplnReceiveService.csDtlCheck();
			}
			
			for(int i=0;i<CmplnReceiveVoList.size();i++) {
				if(CmplnReceiveVoList.get(i).getIdx().equals("")) { // 등록
					csResultService.csResultInsert(CmplnReceiveVoList.get(i));
				} else { // 수정
					csResultService.csResultUpdate(CmplnReceiveVoList.get(i));
				}
			}
			
//			if(csResultVo.getAsNo().equals("")) {
//				cmplnReceiveVo.setAsNo(asNo);
//				csResultService.admCreate(cmplnReceiveVo);
//			}else {
//				csResultService.admUpdate(cmplnReceiveVo);
//			}
			
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
//	
//	
	@RequestMapping(value = "/ts/csResultD", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csResultD(CsResultVo csResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			csResultService.csResultDelete(csResultVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
//	
//	@RequestMapping(value = "/bs/dtlDelete", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> dtlDelete(CsResultVo csResultVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		try {
////			csResultService.dtlDelete(cmplnReceiveVo);
//			jsonData.put("result", "ok");
//		} catch(Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		
//		return jsonData;
//	}
}
