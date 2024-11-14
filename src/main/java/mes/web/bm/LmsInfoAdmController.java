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

import mes.domain.bm.LmsInfoAdmVo;
import mes.service.bm.LmsInfoAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class LmsInfoAdmController {
	
	@Inject
	private LmsInfoAdmService lmsInfoAdmService;
//	@Inject
//	private AccountSubjectService accountSubjectService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(LmsInfoAdmController.class);
	
	// 대중소분류정보관리 페이지
	@RequestMapping(value = "/bm/bmsc0120", method = RequestMethod.GET)
	public ModelAndView bmsc0120(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0120");
		mav.setViewName("/bm/bmsc0120");
		mav.addObject("userName", Utils.getUserNm());
		return mav;
	}
	
	//프로젝트 채번 기준 페이지
	@RequestMapping(value = "/bm/bmsc0150", method = RequestMethod.GET)
	public ModelAndView bmsc0150(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0150");
		mav.setViewName("/bm/bmsc0150");
		mav.addObject("userName", Utils.getUserNm());
		return mav;
	}
	
	// 대중소분류정보 목록조회
	@RequestMapping(value = "bm/lmsInfoAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lmsInfoAdmList(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("대중소분류정보 목록조회");
		try {
			List<LmsInfoAdmVo> lmsInfoAdmLst = lmsInfoAdmService.lmsInfoAdmLst(lmsInfoAdmVo);
			jsonData.put("data", lmsInfoAdmLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 대중소분류정보 상세조회
	@RequestMapping(value = "bm/lmsInfoAdmSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lmsInfoAdmSel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("대중소분류정보 상세조회");
		try {
			lmsInfoAdmVo = lmsInfoAdmService.lmsInfoAdmSel(lmsInfoAdmVo);
			jsonData.put("data", lmsInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 대중소분류정보 등록/수정
	@RequestMapping(value = "bm/lmsInfoAdmIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lmsInfoAdmIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("대중소분류정보 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<LmsInfoAdmVo> LmsInfoAddVoList = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		LmsInfoAdmVo lmsInfoAddVo = new LmsInfoAdmVo();
	    		lmsInfoAddVo.setIdx(jsonObject.get("idx").toString());
	    		lmsInfoAddVo.setLmsCategory(jsonObject.get("lmsCategory").toString());
	    		lmsInfoAddVo.setLmsType(jsonObject.get("lmsType").toString());
	    		lmsInfoAddVo.setLargeCd(jsonObject.get("largeCd").toString());
	    		lmsInfoAddVo.setLargeNm(jsonObject.get("largeNm").toString());
	    		lmsInfoAddVo.setLargeIdx(jsonObject.get("largeIdx").toString());
	    		lmsInfoAddVo.setMediumCd(jsonObject.get("mediumCd").toString());
	    		lmsInfoAddVo.setMediumNm(jsonObject.get("mediumNm").toString());
	    		lmsInfoAddVo.setMediumIdx(jsonObject.get("mediumIdx").toString());
	    		lmsInfoAddVo.setSmallCd(jsonObject.get("smallCd").toString());
	    		lmsInfoAddVo.setSmallNm(jsonObject.get("smallNm").toString());
	    		lmsInfoAddVo.setJudgeGubun(jsonObject.get("judgeGubun").toString());
	    		lmsInfoAddVo.setUseYn(jsonObject.get("useYn").toString());
	    		if(jsonObject.get("contents")!=null) {
	    			lmsInfoAddVo.setContents(jsonObject.get("contents").toString());	
	    		}
	    		
	    		
	    		lmsInfoAddVo.setUpdIdx(Utils.getUserIdx());
	    		lmsInfoAddVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		lmsInfoAddVo.setRegIdx(Utils.getUserIdx());
	    		lmsInfoAddVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		LmsInfoAddVoList.add(lmsInfoAddVo);
	    		
	    		duplicationCheckIdxList += jsonObject.get("idx").toString() + ",";
	        }
	        
	        for ( int i=0; i<LmsInfoAddVoList.size(); i++ ) { // 중복확인 작업
	        	LmsInfoAdmVo lmsInfoDupCheckVo = new LmsInfoAdmVo();
//	        	AccountSubjectVo acctVo = new AccountSubjectVo();
	        	
	        	lmsInfoDupCheckVo.setIdx(duplicationCheckIdxList);
	        	lmsInfoDupCheckVo.setLmsType(LmsInfoAddVoList.get(i).getLmsType());
	        	lmsInfoDupCheckVo.setLargeIdx(LmsInfoAddVoList.get(i).getLargeIdx());
	        	lmsInfoDupCheckVo.setMediumIdx(LmsInfoAddVoList.get(i).getMediumIdx());
	        	lmsInfoDupCheckVo.setLargeCd(LmsInfoAddVoList.get(i).getLargeCd());
	        	lmsInfoDupCheckVo.setMediumCd(LmsInfoAddVoList.get(i).getMediumCd());
	        	lmsInfoDupCheckVo.setSmallCd(LmsInfoAddVoList.get(i).getSmallCd());
	        	
//	        	acctVo.setJudgeGubun(LmsInfoAddVoList.get(i).getAcctCd());
//	        	acctVo.setIdx(LmsInfoAddVoList.get(i).getIdx());
	        	
//	        	if(accountSubjectService.accountSubjectCheck(acctVo) != null) {
//	        		jsonData.put("result", "fail");
//	        		jsonData.put("idx", LmsInfoAddVoList.get(i).getIdx());
//	        		jsonData.put("message", "이미 존재하는 코드입니다.");
//	        		return jsonData;
//	        	}
	        	
	        	if(LmsInfoAddVoList.get(i).getIdx().equals("")) {
	        		if(lmsInfoAdmService.lmsInfoCdCheck(lmsInfoDupCheckVo) != null) {
		        		jsonData.put("result", "fail");
		        		jsonData.put("idx", LmsInfoAddVoList.get(i).getIdx());
		        		jsonData.put("message", "이미 존재하는 코드입니다.");
		        		return jsonData;
		        	}
	        	}
	        }
	        
	        for(int i=0;i<LmsInfoAddVoList.size();i++) {
	        	if(LmsInfoAddVoList.get(i).getIdx().equals("")) { // 등록
	        		lmsInfoAdmService.lmsInfoAdmIns(LmsInfoAddVoList.get(i));
	        		
	        		if(LmsInfoAddVoList.get(i).getLmsType().equals("M")) {
	        			LmsInfoAdmVo lmsInfoIdxUpdVo = new LmsInfoAdmVo();
	        			
	        			lmsInfoIdxUpdVo.setIdx(LmsInfoAddVoList.get(i).getLargeIdx());
	        			lmsInfoIdxUpdVo.setLargeIdx(LmsInfoAddVoList.get(i).getLargeIdx());
	        			
	    	    		lmsInfoIdxUpdVo.setLmsCategory("");
	    	    		lmsInfoIdxUpdVo.setLmsType("");
	    	    		lmsInfoIdxUpdVo.setLargeCd("");
	    	    		lmsInfoIdxUpdVo.setLargeNm("");
	    	    		lmsInfoIdxUpdVo.setMediumCd("");
	    	    		lmsInfoIdxUpdVo.setMediumNm("");
	    	    		lmsInfoIdxUpdVo.setMediumIdx("");
	    	    		lmsInfoIdxUpdVo.setSmallCd("");
	    	    		lmsInfoIdxUpdVo.setSmallNm("");
	    	    		lmsInfoIdxUpdVo.setJudgeGubun("");
	    	    		lmsInfoIdxUpdVo.setUseYn("");
	    	    		lmsInfoIdxUpdVo.setUpdIdx(Utils.getUserIdx());
	    	    		lmsInfoIdxUpdVo.setUpdDate(DateUtil.getCurrentDateTime());
	    	    		lmsInfoIdxUpdVo.setRegIdx(Utils.getUserIdx());
	    	    		lmsInfoIdxUpdVo.setRegDate(DateUtil.getCurrentDateTime());
	        			
	    	    		lmsInfoAdmService.lmsInfoAdmUpd(lmsInfoIdxUpdVo);
	        		} else if(LmsInfoAddVoList.get(i).getLmsType().equals("S")) {
	        			LmsInfoAdmVo lmsInfoIdxUpdVo = new LmsInfoAdmVo();
	        			
	        			lmsInfoIdxUpdVo.setIdx(LmsInfoAddVoList.get(i).getMediumIdx());
	        			lmsInfoIdxUpdVo.setMediumIdx(LmsInfoAddVoList.get(i).getMediumIdx());
	        			
	    	    		lmsInfoIdxUpdVo.setLmsCategory("");
	    	    		lmsInfoIdxUpdVo.setLmsType("");
	    	    		lmsInfoIdxUpdVo.setLargeCd("");
	    	    		lmsInfoIdxUpdVo.setLargeNm("");
	    	    		lmsInfoIdxUpdVo.setLargeIdx("");
	    	    		lmsInfoIdxUpdVo.setMediumCd("");
	    	    		lmsInfoIdxUpdVo.setMediumNm("");
	    	    		lmsInfoIdxUpdVo.setSmallCd("");
	    	    		lmsInfoIdxUpdVo.setSmallNm("");
	    	    		lmsInfoIdxUpdVo.setJudgeGubun("");
	    	    		lmsInfoIdxUpdVo.setUseYn("");
	    	    		lmsInfoIdxUpdVo.setUpdIdx(Utils.getUserIdx());
	    	    		lmsInfoIdxUpdVo.setUpdDate(DateUtil.getCurrentDateTime());
	    	    		lmsInfoIdxUpdVo.setRegIdx(Utils.getUserIdx());
	    	    		lmsInfoIdxUpdVo.setRegDate(DateUtil.getCurrentDateTime());
	        			
	    	    		lmsInfoAdmService.lmsInfoAdmUpd(lmsInfoIdxUpdVo);
	        		}
	        		
	        	} else { // 수정
	        		lmsInfoAdmService.lmsInfoAdmUpd(LmsInfoAddVoList.get(i));
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
	
	// 대중소분류정보 삭제
	@RequestMapping(value = "bm/lmsInfoAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("대중소분류정보 삭제");
		try {
			lmsInfoAdmService.lmsInfoAdmDel(lmsInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//프로젝트 채번기준 목록조회
	@RequestMapping(value = "bm/projectNumberLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectNumberLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 채번기준 목록조회");
		try {
			List<LmsInfoAdmVo> projectNumberLst = lmsInfoAdmService.projectNumberLst(lmsInfoAdmVo);
			jsonData.put("data", projectNumberLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 프로젝트 채번기준 등록/수정
	@RequestMapping(value = "bm/projectNumberIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectNumberIU(@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 채번기준 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			
			List<LmsInfoAdmVo> projectNumberLst = new ArrayList<>();
			String duplicationCheckIdxList = ""; // 중복체크하기 위한 IDX 목록
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		
	    		LmsInfoAdmVo lmsInfoAddVo = new LmsInfoAdmVo();
	    		lmsInfoAddVo.setIdx(jsonObject.get("idx").toString());
	    		lmsInfoAddVo.setPrjNumberGubun(jsonObject.get("prjNumberGubun").toString());
	    		lmsInfoAddVo.setGubunIdx(jsonObject.get("gubunIdx").toString());
	    		lmsInfoAddVo.setGubunCd(jsonObject.get("gubunCd").toString());
	    		lmsInfoAddVo.setGubunNm(jsonObject.get("gubunNm").toString());
	    		lmsInfoAddVo.setGubunDesc(jsonObject.get("gubunDesc").toString());
	    		lmsInfoAddVo.setUpdIdx(Utils.getUserIdx());
	    		lmsInfoAddVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		lmsInfoAddVo.setRegIdx(Utils.getUserIdx());
	    		lmsInfoAddVo.setRegDate(DateUtil.getCurrentDateTime());
	    		
	    		projectNumberLst.add(lmsInfoAddVo);
	    		
	    		duplicationCheckIdxList += jsonObject.get("idx").toString() + ",";
	        }
	        
	        for ( int i=0; i<projectNumberLst.size(); i++ ) { // 중복확인 작업
	        	LmsInfoAdmVo projectNumberDupCheckVo = new LmsInfoAdmVo();
//	        	AccountSubjectVo acctVo = new AccountSubjectVo();
	        	
	        	projectNumberDupCheckVo.setIdx(duplicationCheckIdxList);
	        	projectNumberDupCheckVo.setPrjNumberGubun(projectNumberLst.get(i).getPrjNumberGubun());
	        	projectNumberDupCheckVo.setGubunCd(projectNumberLst.get(i).getGubunCd());              
	        	
//	        	acctVo.setJudgeGubun(LmsInfoAddVoList.get(i).getAcctCd());
//	        	acctVo.setIdx(LmsInfoAddVoList.get(i).getIdx());
	        	
//	        	if(accountSubjectService.accountSubjectCheck(acctVo) != null) {
//	        		jsonData.put("result", "fail");
//	        		jsonData.put("idx", LmsInfoAddVoList.get(i).getIdx());
//	        		jsonData.put("message", "이미 존재하는 코드입니다.");
//	        		return jsonData;
//	        	}
	        	
	        	if(projectNumberLst.get(i).getIdx().equals("")) {
	        		if(lmsInfoAdmService.projectNumberCheck(projectNumberDupCheckVo) != null) {
		        		jsonData.put("result", "fail");
		        		jsonData.put("idx", projectNumberLst.get(i).getIdx());
		        		jsonData.put("message", "이미 존재하는 코드입니다.");
		        		return jsonData;
		        	}
	        	}
	        }
	        
	        for(int i=0;i<projectNumberLst.size();i++) {
	        	if(projectNumberLst.get(i).getIdx().equals("")) { // 등록
	        		lmsInfoAdmService.projectNumberIns(projectNumberLst.get(i));
	        		
	        	} else { // 수정
	        		lmsInfoAdmService.projectNumberUpd(projectNumberLst.get(i));
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
	
	// 프로젝트 채번기준 삭제
	@RequestMapping(value = "bm/projectNumberDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectNumberDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 채번기준");
		try {
			lmsInfoAdmService.projectNumberDel(lmsInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}
