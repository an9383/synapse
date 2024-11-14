package mes.web.bs;

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
import mes.domain.bs.BizOrderVo;
import mes.domain.bs.ProjectPlanVo;
import mes.domain.pm.PurchaseOrderVo;
import mes.domain.rm.ProjectVo;
import mes.domain.stock.StockManagementVo;
import mes.service.bm.LmsInfoAdmService;
import mes.service.bm.LocationService;
import mes.service.bs.BizOrderService;
import mes.service.bs.ProjectPlanService;
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
public class ProjectPlanController {
	
	@Inject
	private BizOrderService bizOrderService;
	
	@Inject
	private LmsInfoAdmService lmsInfoAdmService;
	
	@Inject
	private ProjectPlanService projectPlanService;
	
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
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectPlanController.class);
	
	// bssc0100 페이지
	@RequestMapping(value = "/bs/bssc0100", method = RequestMethod.GET)
	public ModelAndView bssc0100(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0100");
		mav.setViewName("/bs/bssc0100");
		return mav;
	}
	
	// bssc0160 페이지
	@RequestMapping(value = "/bs/bssc0160", method = RequestMethod.GET)
	public ModelAndView bssc0160(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0160");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/bs/bssc0160");
		return mav;
	}
	
	// mmsc0020 페이지
	@RequestMapping(value = "/mm/mmsc0020", method = RequestMethod.GET)
	public ModelAndView mmsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /mm/mmsc0020");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/mm/mmsc0020");
		return mav;
	}
	
	//프로젝트일정표 버전 목록조회
	@RequestMapping(value = "/bs/projectPlanVersionLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanVersionLst(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트일정표 버전 목록조회");
		try {
			List<ProjectPlanVo> projectPlanVersionLst = projectPlanService.projectPlanVersionLst(projectPlanVo);
			jsonData.put("data", projectPlanVersionLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트일정표 버전명 중복확인
	@RequestMapping(value = "/bs/projectPlanVersionExistCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanVersionExistCheck(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트일정표 버전명 중복확인");
		try {
			int existCount = projectPlanService.projectPlanVersionExistCheck(projectPlanVo);
			jsonData.put("existCount", existCount);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	

	//프로젝트일정표 목록조회
	@RequestMapping(value = "/bs/projectPlanLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanLst(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트일정표 목록조회");
		try {
			List<ProjectPlanVo> projectPlanLst = projectPlanService.projectPlanLst(projectPlanVo);
			jsonData.put("data", projectPlanLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트일정표 등록
	@RequestMapping(value = "/bs/projectPlanIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanIns(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트일정표 등록");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(projectPlanVo.getInsertList().toString());
			
			// 프로젝트일정표 등록 목록
			JSONArray projectPlanInputList = new JSONArray();
			
			String userIdx = Utils.getUserIdx();
			String nowDate = DateUtil.getCurrentDateTime();
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		JSONObject projectPlanObj = new JSONObject();
	    		
	    		projectPlanObj.put("PRJ_CD", jsonObject.get("prjCd").toString());
	    		projectPlanObj.put("SERIAL_NO", jsonObject.get("serialNo").toString());
	    		projectPlanObj.put("VERSION_NO", jsonObject.get("versionNo").toString());
	    		projectPlanObj.put("VERSION_DATETIME", nowDate.replaceAll("-", "").replaceAll(" ", "").replaceAll(":", ""));
	    		projectPlanObj.put("PLAN_ID", jsonObject.get("planId").toString());
	    		projectPlanObj.put("LMS_TYPE", jsonObject.get("lmsType").toString());
	    		projectPlanObj.put("LARGE_NM", jsonObject.get("largeNm").toString());
	    		projectPlanObj.put("MEDIUM_NM", jsonObject.get("mediumNm").toString());
	    		projectPlanObj.put("SMALL_NM", jsonObject.get("smallNm").toString());
	    		projectPlanObj.put("PLAN_START_DATE", jsonObject.get("planStartDate").toString());
	    		projectPlanObj.put("PLAN_END_DATE", jsonObject.get("planEndDate").toString());
	    		projectPlanObj.put("PERFORM_START_DATE", jsonObject.get("performStartDate").toString());
	    		projectPlanObj.put("PERFORM_END_DATE", jsonObject.get("performEndDate").toString());
	    		projectPlanObj.put("COMPLETION_RATE", jsonObject.get("completionRate").toString());
	    		projectPlanObj.put("PROJECT_PLAN_DESC", jsonObject.get("projectPlanDesc").toString());
	    		projectPlanObj.put("REG_IDX", userIdx);
	    		projectPlanObj.put("REG_DATE", nowDate);
				
	    		projectPlanInputList.add(projectPlanObj);
	        }
	        
	        projectPlanVo.setInsertList(projectPlanInputList.toJSONString());
	        
	        projectPlanService.projectPlanIns(projectPlanVo);
	        
	        jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트일정표 수정
	@RequestMapping(value = "/bs/projectPlanUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanUpd(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트일정표 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(projectPlanVo.getUpdateList().toString());
			
			// 프로젝트일정표 수정 목록
			JSONArray projectPlanInputList = new JSONArray();
			
			String userIdx = Utils.getUserIdx();
			String nowDate = DateUtil.getCurrentDateTime();
			
			JSONObject jsonObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		JSONObject projectPlanObj = new JSONObject();
	    		
	    		projectPlanObj.put("IDX", jsonObject.get("idx").toString());
	    		projectPlanObj.put("PRJ_CD", jsonObject.get("prjCd").toString());
	    		projectPlanObj.put("SERIAL_NO", jsonObject.get("serialNo").toString());
	    		projectPlanObj.put("VERSION_NO", jsonObject.get("versionNo").toString());
	    		projectPlanObj.put("PLAN_ID", jsonObject.get("planId").toString());
	    		projectPlanObj.put("LMS_TYPE", jsonObject.get("lmsType").toString());
	    		projectPlanObj.put("LARGE_NM", jsonObject.get("largeNm").toString());
	    		projectPlanObj.put("MEDIUM_NM", jsonObject.get("mediumNm").toString());
	    		projectPlanObj.put("SMALL_NM", jsonObject.get("smallNm").toString());
	    		projectPlanObj.put("PLAN_START_DATE", jsonObject.get("planStartDate").toString());
	    		projectPlanObj.put("PLAN_END_DATE", jsonObject.get("planEndDate").toString());
	    		projectPlanObj.put("PERFORM_START_DATE", jsonObject.get("performStartDate").toString());
	    		projectPlanObj.put("PERFORM_END_DATE", jsonObject.get("performEndDate").toString());
	    		projectPlanObj.put("COMPLETION_RATE", jsonObject.get("completionRate").toString());
	    		projectPlanObj.put("PROJECT_PLAN_DESC", jsonObject.get("projectPlanDesc").toString());
	    		projectPlanObj.put("UPD_IDX", userIdx);
	    		projectPlanObj.put("UPD_DATE", nowDate);
				
	    		projectPlanInputList.add(projectPlanObj);
	        }
	        
	        projectPlanVo.setUpdateList(projectPlanInputList.toJSONString());
	        
	        projectPlanService.projectPlanUpd(projectPlanVo);
	        
	        jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//행 삭제
	@RequestMapping(value = "/bs/projectPlanDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectPlanDel(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("행 삭제");
		try {
			projectPlanService.projectPlanDel(projectPlanVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//************************************ 프로젝트 계획서 ************************************
	//프로젝트 계획서 등록/수정
	@RequestMapping(value = "/bs/bizPrjPlanIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizPrjPlanIU(ProjectPlanVo projectPlanVo, 
														@RequestParam(value="mainCustArray", required=false) String mainCustArray,
														@RequestParam(value="inPeopleArray", required=false) String inPeopleArray,
														@RequestParam(value="materialArray", required=false) String materialArray,
														@RequestParam(value="carryDateArray", required=false) String carryDateArray,
														@RequestParam(value="outPutsArray", required=false) String outPutsArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 등록/수정");
		try {
			//단일정보 처리
			projectPlanVo.setRegIdx(Utils.getUserIdx());
			projectPlanVo.setRegDate(DateUtil.getCurrentDateTime());
			projectPlanVo.setUpdIdx(Utils.getUserIdx());
			projectPlanVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			String prjCd = projectPlanVo.getPrjCd();
			
			if(projectPlanVo.getIdx().equals("0")) {
				projectPlanService.bizPrjPlanIns(projectPlanVo);
			} else {
				projectPlanService.bizPrjPlanUpd(projectPlanVo);
			}
			
			JSONParser jsonParser = new JSONParser();
			JSONArray mainCustArr = (JSONArray) jsonParser.parse(mainCustArray);
			JSONArray inPeopleArr = (JSONArray) jsonParser.parse(inPeopleArray);
			JSONArray materialArr = (JSONArray) jsonParser.parse(materialArray);
			JSONArray carryDateArr = (JSONArray) jsonParser.parse(carryDateArray);
			JSONArray outPutsArr = (JSONArray) jsonParser.parse(outPutsArray);

			//주요고객 요구사항
			JSONArray  mainCustIns_array = new JSONArray();
			ProjectPlanVo  mainCustVo = new ProjectPlanVo();	
			
	        for(int i=0;i<mainCustArr.size();i++) {
	        	JSONObject jsonStockObj = new JSONObject();
	        	jsonStockObj.put(i, mainCustArr.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		JSONObject mainCustData = new JSONObject();
	    		mainCustData.put("IDX", "");
	    		mainCustData.put("PRJ_CD", prjCd);
	    		mainCustData.put("MAIN_CUST_SUB", jsonObject.get("mainCustSub").toString());
	    		mainCustData.put("MAIN_CUST_REQ_CONTENT", jsonObject.get("mainCustReqContent").toString());
	    		mainCustIns_array.add(mainCustData);
	        }
	        mainCustVo.setInsertJson(mainCustIns_array.toJSONString());
	        mainCustVo.setRegIdx(Utils.getUserIdx());
	        mainCustVo.setRegDate(DateUtil.getCurrentDateTime());
			
			projectPlanService.mainCustIns(mainCustVo);
			
			
			//참여인력
			JSONArray inPeopleIns_array = new JSONArray();
			ProjectPlanVo inPeopleVo = new ProjectPlanVo();	
			
	        for(int i=0;i<inPeopleArr.size();i++) {
	        	JSONObject jsonStockObj = new JSONObject();
	        	jsonStockObj.put(i, inPeopleArr.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		JSONObject inPeopleData = new JSONObject();
	    		inPeopleData.put("IDX", "");
	    		inPeopleData.put("PRJ_CD", prjCd);
	    		inPeopleData.put("IN_USER_IDX", jsonObject.get("inUserIdx").toString());
	    		inPeopleData.put("IN_PERCENT", jsonObject.get("inPercent").toString());
	    		inPeopleData.put("IN_DAYS", jsonObject.get("inDays").toString());
	    		inPeopleData.put("USER_MAIN_WORK", jsonObject.get("userMainWork").toString());
				inPeopleIns_array.add(inPeopleData);
	        }
	        inPeopleVo.setInsertJson(inPeopleIns_array.toJSONString());
	        inPeopleVo.setRegIdx(Utils.getUserIdx());
			inPeopleVo.setRegDate(DateUtil.getCurrentDateTime());
			
			projectPlanService.inPeopleIns(inPeopleVo);
	        
			//재료비 및 매출이익
			JSONArray materialIns_array = new JSONArray();
			ProjectPlanVo materialVo = new ProjectPlanVo();	
			
	        for(int i=0;i<materialArr.size();i++) {
	        	JSONObject jsonStockObj = new JSONObject();
	        	jsonStockObj.put(i, materialArr.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		JSONObject materialData = new JSONObject();
	    		materialData.put("IDX", "");
	    		materialData.put("PRJ_CD", prjCd);
	    		materialData.put("MATERIAL_SUB", jsonObject.get("materialSub").toString());
	    		materialData.put("MATERIAL_SPEC", jsonObject.get("materialSpec").toString());
	    		materialData.put("MATERIAL_AMT", jsonObject.get("materialAmt").toString());
	    		materialData.put("MATERIAL_DESC", jsonObject.get("materialDesc").toString());
	    		materialData.put("OUT_PERSON_SUM", jsonObject.get("outPersonSum").toString());
	    		materialIns_array.add(materialData);
	        }
	        materialVo.setInsertJson(materialIns_array.toJSONString());
	        materialVo.setRegIdx(Utils.getUserIdx());
	        materialVo.setRegDate(DateUtil.getCurrentDateTime());
	        
	        projectPlanService.materialIns(materialVo);
	        
			//추진일정
			JSONArray carryDateIns_array = new JSONArray();
			ProjectPlanVo carryDateVo = new ProjectPlanVo();	
			
	        for(int i=0;i<carryDateArr.size();i++) {
	        	JSONObject jsonStockObj = new JSONObject();
	        	jsonStockObj.put(i, carryDateArr.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		JSONObject carryDateData = new JSONObject();
	    		carryDateData.put("IDX", "");
	    		carryDateData.put("PRJ_CD", prjCd);
	    		carryDateData.put("CARRY_GUBUN_NM", jsonObject.get("carryGubunNm").toString());
	    		carryDateData.put("CARRY_DETAILS", jsonObject.get("carryDetails").toString());
	    		carryDateData.put("CARRY_DURING_START", jsonObject.get("carryDuringStart").toString());
	    		carryDateData.put("CARRY_DURING_END", jsonObject.get("carryDuringEnd").toString());
	    		carryDateData.put("CARRY_MAIN_USER", jsonObject.get("carryMainUser").toString());
	    		carryDateData.put("CARRY_WAY", jsonObject.get("carryWay").toString());
	    		carryDateIns_array.add(carryDateData);
	        }
	        carryDateVo.setInsertJson(carryDateIns_array.toJSONString());
	        carryDateVo.setRegIdx(Utils.getUserIdx());
	        carryDateVo.setRegDate(DateUtil.getCurrentDateTime());
			
			projectPlanService.carryDateIns(carryDateVo);
			
			//산출물 List
			JSONArray outPutsIns_array = new JSONArray();
			ProjectPlanVo outPutsVo = new ProjectPlanVo();	
			
	        for(int i=0;i<outPutsArr.size();i++) {
	        	JSONObject jsonStockObj = new JSONObject();
	        	jsonStockObj.put(i, outPutsArr.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		
	    		JSONObject outPutsData = new JSONObject();
	    		outPutsData.put("IDX", "");
	    		outPutsData.put("PRJ_CD", prjCd);
	    		outPutsData.put("CAL_NM", jsonObject.get("calNm").toString());
	    		outPutsData.put("CAL_CONTENT", jsonObject.get("calContent").toString());
	    		outPutsData.put("CAL_CNT", jsonObject.get("calCnt").toString());
	    		outPutsIns_array.add(outPutsData);
	        }
	        outPutsVo.setInsertJson(outPutsIns_array.toJSONString());
	        outPutsVo.setRegIdx(Utils.getUserIdx());
	        outPutsVo.setRegDate(DateUtil.getCurrentDateTime());
			
			projectPlanService.outputsIns(outPutsVo);
	        
	        jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 계획서 조회
	@RequestMapping(value = "/bs/bizPrjPlanSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizPrjPlanSel(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 조회");
		try {
			
			projectPlanVo = projectPlanService.bizPrjPlanSel(projectPlanVo);
			jsonData.put("data", projectPlanVo);
			
			List<ProjectPlanVo> mainCustLst = projectPlanService.bizPrjPlanMaincustLst(projectPlanVo);
			jsonData.put("mainCustLst", mainCustLst);
			
			List<ProjectPlanVo> inPeopleLst = projectPlanService.bizPrjPlanUserLst(projectPlanVo);
			jsonData.put("inPeopleLst", inPeopleLst);
			
			List<ProjectPlanVo> materialLst = projectPlanService.bizPrjPlanMaterialLst(projectPlanVo);
			jsonData.put("materialLst", materialLst);
			
			List<ProjectPlanVo> carryLst = projectPlanService.bizPrjPlanCarryLst(projectPlanVo);
			jsonData.put("carryLst", carryLst);
			
			List<ProjectPlanVo> outputsLst = projectPlanService.bizPrjPlanOutputsLst(projectPlanVo);
			jsonData.put("outputsLst", outputsLst);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 계획서 상신/취소
	@RequestMapping(value = "/bs/upvoteYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> upvoteYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 상신/취소");
		try {
			if(projectPlanVo.getUpvoteYn().equals("Y")) {
				projectPlanVo.setUpvoteGubun("PL");
				projectPlanVo.setStatus("U"+projectPlanVo.getUpvoteYn());
				projectPlanVo.setUserIdx(projectPlanVo.getUpvoteUserIdx());
				projectPlanVo.setUpvoteApprovalDate(projectPlanVo.getUpvoteDate());
				projectPlanVo.setUpvoteApprovalReason(projectPlanVo.getUpvoteReason());
				projectPlanVo.setRegIdx(Utils.getUserIdx());             
				projectPlanVo.setRegDate(DateUtil.getCurrentDateTime());
				projectPlanVo.setUpdIdx(Utils.getUserIdx());             
				projectPlanVo.setUpdDate(DateUtil.getCurrentDateTime());
				
				projectPlanService.upvoteApprovalHistIns(projectPlanVo);
			} else {
				projectPlanVo.setUpvoteUserIdx("");
				projectPlanVo.setUpvoteDate("");
				projectPlanVo.setUpvoteReason("");
			}
			
			projectPlanService.bizPrjPlanUpvoteYnUpd(projectPlanVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트 계획서 상신 조회
	@RequestMapping(value = "/bs/bizPrjPlanUpvoteLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizPrjPlanUpvoteLst(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 상신 조회");
		try {
				
			List<ProjectPlanVo> projectPlanLst = projectPlanService.bizPrjPlanUpvoteLst(projectPlanVo);

			jsonData.put("data", projectPlanLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 계획서 결재/반려
	@RequestMapping(value = "/bs/approvalYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> approvalYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 결재/반려");
		try {
			
				projectPlanVo.setUpvoteGubun("PL");
				projectPlanVo.setStatus("A"+projectPlanVo.getApprovalYn());
				projectPlanVo.setUserIdx(projectPlanVo.getApprovalUserIdx());
				projectPlanVo.setUpvoteApprovalDate(projectPlanVo.getApprovalDate());
				projectPlanVo.setUpvoteApprovalReason(projectPlanVo.getApprovalReason());
				projectPlanVo.setRegIdx(Utils.getUserIdx());
				projectPlanVo.setRegDate(DateUtil.getCurrentDateTime());
				projectPlanVo.setUpdIdx(Utils.getUserIdx());
				projectPlanVo.setUpdDate(DateUtil.getCurrentDateTime());
				
				projectPlanService.upvoteApprovalHistIns(projectPlanVo);
			if(projectPlanVo.getApprovalYn().equals("N")) {
				projectPlanVo.setApprovalUserIdx("");
				projectPlanVo.setApprovalDate("");
				projectPlanVo.setApprovalReason("");
			}
			
			projectPlanService.bizPrjPlanApprovalYnUpd(projectPlanVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트 계획서 이력 조회
	@RequestMapping(value = "/bs/upvoteApprovalHistLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> upvoteApprovalHistLst(ProjectPlanVo projectPlanVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 계획서 이력 조회");
		try {
				
			List<ProjectPlanVo> projectPlanLst = projectPlanService.upvoteApprovalHistLst(projectPlanVo);

			jsonData.put("data", projectPlanLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
