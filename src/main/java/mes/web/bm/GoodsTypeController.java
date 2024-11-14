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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.GoodsTypeAdmVo;
import mes.service.bm.GoodsTypeAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class GoodsTypeController {
	
	@Inject
	private GoodsTypeAdmService GoodsTypeAdmService;
//	@Inject
//	private AccountSubjectService accountSubjectService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsTypeController.class);
	
	// 제품유형별관리 페이지
	@RequestMapping(value = "/bm/bmsc0130", method = RequestMethod.GET)
	public ModelAndView bmsc0130(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0130");
		mav.setViewName("/bm/bmsc0130");
		mav.addObject("userName", Utils.getUserNm());
		return mav;
	}
	
	// 제품유형별 목록조회
	@RequestMapping(value = "/bm/goodsTypeAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeAdmList(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 목록조회");
		try {
			List<GoodsTypeAdmVo> GoodsTypeAdmLst = GoodsTypeAdmService.GoodsTypeAdmLst(GoodsTypeAdmVo);
			jsonData.put("data", GoodsTypeAdmLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 제품유형별 상세조회
	@RequestMapping(value = "/bm/goodsTypeAdmSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeAdmSel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 상세조회");
		try {
			GoodsTypeAdmVo = GoodsTypeAdmService.GoodsTypeAdmSel(GoodsTypeAdmVo);
			jsonData.put("data", GoodsTypeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 제품유형별 등록/수정
	@RequestMapping(value = "/bm/goodsTypeAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<GoodsTypeAdmVo> GoodsTypeAddVoList = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		GoodsTypeAdmVo GoodsTypeAddVo = new GoodsTypeAdmVo();
	    		GoodsTypeAddVo.setIdx(jsonObject.get("idx").toString());
	    		GoodsTypeAddVo.setGoodsGubun(jsonObject.get("goodsGubun").toString());
	    		GoodsTypeAddVo.setGoodsTypeCd(jsonObject.get("goodsTypeCd").toString());
	    		GoodsTypeAddVo.setGoodsTypeNm(jsonObject.get("goodsTypeNm").toString());
	    		GoodsTypeAddVo.setUseYn(jsonObject.get("useYn").toString());
	    		GoodsTypeAddVo.setUpdIdx(Utils.getUserIdx());
	    		GoodsTypeAddVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		GoodsTypeAddVo.setRegIdx(Utils.getUserIdx());
	    		GoodsTypeAddVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		GoodsTypeAddVoList.add(GoodsTypeAddVo);
	    		
	    		duplicationCheckIdxList += jsonObject.get("idx").toString() + ",";
	        }
	        
	        for ( int i=0; i<GoodsTypeAddVoList.size(); i++ ) { // 중복확인 작업
	        	GoodsTypeAdmVo GoodsTypeDupCheckVo = new GoodsTypeAdmVo();
//	        	AccountSubjectVo acctVo = new AccountSubjectVo();
	        	
	        	GoodsTypeDupCheckVo.setIdx(duplicationCheckIdxList);
	        	GoodsTypeDupCheckVo.setGoodsGubun(GoodsTypeAddVoList.get(i).getGoodsGubun());
	        	GoodsTypeDupCheckVo.setGoodsTypeCd(GoodsTypeAddVoList.get(i).getGoodsTypeCd());
	        	
//	        	acctVo.setJudgeGubun(GoodsTypeAddVoList.get(i).getAcctCd());
//	        	acctVo.setIdx(GoodsTypeAddVoList.get(i).getIdx());
	        	
//	        	if(accountSubjectService.accountSubjectCheck(acctVo) != null) {
//	        		jsonData.put("result", "fail");
//	        		jsonData.put("idx", GoodsTypeAddVoList.get(i).getIdx());
//	        		jsonData.put("message", "이미 존재하는 코드입니다.");
//	        		return jsonData;
//	        	}
	        	
	        	if(GoodsTypeAdmService.GoodsTypeCdCheck(GoodsTypeDupCheckVo) != null) {
	        		jsonData.put("result", "fail");
	        		jsonData.put("idx", GoodsTypeAddVoList.get(i).getIdx());
	        		jsonData.put("message", "이미 존재하는 유형입니다.");
	        		return jsonData;
	        	}
	        }
	        
	        for(int i=0;i<GoodsTypeAddVoList.size();i++) {
	        	System.out.println(GoodsTypeAddVoList.get(i));
	        	if(GoodsTypeAddVoList.get(i).getIdx().equals("")) { // 등록
	        		GoodsTypeAdmService.GoodsTypeAdmIns(GoodsTypeAddVoList.get(i));
	        	} else { // 수정
	        		GoodsTypeAdmService.GoodsTypeAdmUpd(GoodsTypeAddVoList.get(i));
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
	
	// 제품유형별 삭제
	@RequestMapping(value = "/bm/goodsTypeAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 삭제");
		try {
			GoodsTypeAdmService.GoodsTypeAdmDel(GoodsTypeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 제품유형별 목록조회
	@RequestMapping(value = "/bm/goodsTypeDtlLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeDtlList(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 목록조회");
		try {
			List<GoodsTypeAdmVo> GoodsTypeDtlLst = GoodsTypeAdmService.GoodsTypeDtlLst(GoodsTypeAdmVo);
			jsonData.put("data", GoodsTypeDtlLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 제품유형별 등록/수정
	@RequestMapping(value = "/bm/goodsTypeDtlIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeDtlIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<GoodsTypeAdmVo> GoodsTypeAddVoList = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		GoodsTypeAdmVo GoodsTypeAddVo = new GoodsTypeAdmVo();
	    		GoodsTypeAddVo.setIdx(jsonObject.get("idx").toString());
	    		GoodsTypeAddVo.setGoodsTypeCd(jsonObject.get("goodsTypeCd").toString());
	    		GoodsTypeAddVo.setGoodsNm(jsonObject.get("goodsNm").toString());
	    		GoodsTypeAddVo.setGoodsDesc(jsonObject.get("goodsDesc").toString());
	    		GoodsTypeAddVo.setUseYn(jsonObject.get("useYn").toString());
	    		GoodsTypeAddVo.setUpdIdx(Utils.getUserIdx());
	    		GoodsTypeAddVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		GoodsTypeAddVo.setRegIdx(Utils.getUserIdx());
	    		GoodsTypeAddVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		GoodsTypeAddVoList.add(GoodsTypeAddVo);
	    		
	    		duplicationCheckIdxList += jsonObject.get("idx").toString() + ",";
	        }
	        
	        for ( int i=0; i<GoodsTypeAddVoList.size(); i++ ) { // 중복확인 작업
	        	GoodsTypeAdmVo GoodsTypeDupCheckVo = new GoodsTypeAdmVo();
//	        	AccountSubjectVo acctVo = new AccountSubjectVo();
	        	
	        	GoodsTypeDupCheckVo.setIdx(duplicationCheckIdxList);
	        	GoodsTypeDupCheckVo.setGoodsTypeCd(GoodsTypeAddVoList.get(i).getGoodsTypeCd());
	        	GoodsTypeDupCheckVo.setGoodsNm(GoodsTypeAddVoList.get(i).getGoodsNm());
	        	
//	        	acctVo.setJudgeGubun(GoodsTypeAddVoList.get(i).getAcctCd());
//	        	acctVo.setIdx(GoodsTypeAddVoList.get(i).getIdx());
	        	
//	        	if(accountSubjectService.accountSubjectCheck(acctVo) != null) {
//	        		jsonData.put("result", "fail");
//	        		jsonData.put("idx", GoodsTypeAddVoList.get(i).getIdx());
//	        		jsonData.put("message", "이미 존재하는 코드입니다.");
//	        		return jsonData;
//	        	}
	        	
	        	if(GoodsTypeAdmService.GoodsTypeCdCheck(GoodsTypeDupCheckVo) != null) {
	        		jsonData.put("result", "fail");
	        		jsonData.put("idx", GoodsTypeAddVoList.get(i).getIdx());
	        		jsonData.put("message", "이미 존재하는 품명입니다.");
	        		return jsonData;
	        	}
	        }
	        
	        for(int i=0;i<GoodsTypeAddVoList.size();i++) {
	        	if(GoodsTypeAddVoList.get(i).getIdx().equals("")) { // 등록
	        		GoodsTypeAdmService.GoodsTypeDtlIns(GoodsTypeAddVoList.get(i));
	        	} else { // 수정
	        		GoodsTypeAdmService.GoodsTypeDtlUpd(GoodsTypeAddVoList.get(i));
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
	
	// 제품유형별 삭제
	@RequestMapping(value = "/bm/goodsTypeDtlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> GoodsTypeDtlDel(GoodsTypeAdmVo GoodsTypeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품유형별 삭제");
		try {
			GoodsTypeAdmService.GoodsTypeDtlDel(GoodsTypeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
