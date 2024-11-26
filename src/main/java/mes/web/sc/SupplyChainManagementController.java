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
import mes.domain.sm.UserVo;
import mes.service.bm.LocationService;
import mes.service.sc.SupplyChainManagementService;
import mes.service.sm.UserService;
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
	private UserService userService;
	private static final Logger logger = LoggerFactory.getLogger(SupplyChainManagementController.class);
	
	// scsc0010 페이지
	@RequestMapping(value = "/sc/scsc0010", method = RequestMethod.GET)
	public ModelAndView scsc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0010");
		UserVo userVo = new UserVo();
		userVo.setUserId(Utils.getUserId());
		userVo.setIdx(Utils.getUserIdx());
		try {
			userVo = userService.userSel(userVo);
		}catch(Exception e) {}
		if(userVo.getUserInOut()==null) {
			mav.addObject("userDepartmentCd", "");
		} else {
			mav.addObject("userDepartmentCd", userVo.getUserDealCorpCd());
		}
		mav.setViewName("/sc/scsc0010");
		return mav;
	}
	
	// scsc0020 페이지
	@RequestMapping(value = "/sc/scsc0020", method = RequestMethod.GET)
	public ModelAndView scsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0020");
		UserVo userVo = new UserVo();
		userVo.setUserId(Utils.getUserId());
		userVo.setIdx(Utils.getUserIdx());
		try {
			userVo = userService.userSel(userVo);
		}catch(Exception e) {}
		if(userVo.getUserInOut()==null) {
			mav.addObject("userDepartmentCd", "");
		} else {
			mav.addObject("userDepartmentCd", userVo.getUserDealCorpCd());
		}
		mav.setViewName("/sc/scsc0020");
		return mav;
	}
	
	// scsc0030 페이지
	@RequestMapping(value = "/sc/scsc0030", method = RequestMethod.GET)
	public ModelAndView scsc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /sc/scsc0030");
		UserVo userVo = new UserVo();
		userVo.setUserId(Utils.getUserId());
		userVo.setIdx(Utils.getUserIdx());
		try {
			userVo = userService.userSel(userVo);
		}catch(Exception e) {}
		if(userVo.getUserInOut()==null) {
			mav.addObject("userDepartmentCd", "");
		} else {
			mav.addObject("userDepartmentCd", userVo.getUserDealCorpCd());
		}
		mav.setViewName("/sc/scsc0030");
		return mav;
	}
	// scsc0050 페이지
	@RequestMapping(value = "/sc/scsc0050", method = RequestMethod.GET)
	public ModelAndView scsc0050(ModelAndView mav, HttpServletRequest request) {
		UserVo userVo = new UserVo();
		userVo.setUserId(Utils.getUserId());
		userVo.setIdx(Utils.getUserIdx());
		try {
			userVo = userService.userSel(userVo);
		}catch(Exception e) {}
		if(userVo.getUserInOut()==null) {
			mav.addObject("userDepartmentCd", "");
		} else {
			mav.addObject("userDepartmentCd", userVo.getUserDealCorpCd());
		}
		mav.setViewName("/sc/scsc0050");
		return mav;
	}
	
	// scsc0050 페이지
	@RequestMapping(value = "/sc/scsc0070", method = RequestMethod.GET)
	public ModelAndView scsc0070(ModelAndView mav, HttpServletRequest request) {
		UserVo userVo = new UserVo();
		userVo.setUserId(Utils.getUserId());
		userVo.setIdx(Utils.getUserIdx());
		try {
			userVo = userService.userSel(userVo);
		}catch(Exception e) {}
		if(userVo.getUserInOut()==null) {
			mav.addObject("userDepartmentCd", "");
		} else {
			mav.addObject("userDepartmentCd", userVo.getUserDealCorpCd());
		}
		mav.setViewName("/sc/scsc0070");
		return mav;
	}
	
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@RequestMapping(value = "sc/scmUpvoteYnLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> scmUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			List<SupplyChainManagementVo> scmVoList = scmService.scmUpvoteYnLst(scmVo);
			jsonData.put("data", scmVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 수주관리 메인 등록/수정
	@RequestMapping(value = "sc/scmDeliveryYnUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> scmDeliveryYnUpd(SupplyChainManagementVo scmVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
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
	    		scmYnVo.setOrderDtlSeq(jsonObject.get("orderDtlSeq").toString());
	    		scmYnVo.setDeliveryYn(jsonObject.get("deliveryYn").toString());
	    		if(scmYnVo.getDeliveryYn().equals("N")) {
	    			scmYnVo.setReturnYn(jsonObject.get("returnYn").toString());
	    		}
//	    		scmYnVo.setImportInspection(jsonObject.get("importInspection").toString());
				scmYnVo.setUpdIdx(Utils.getUserIdx());
				scmYnVo.setUpdDate(DateUtil.getCurrentDateTime());
	    		scmService.scmDeliveryYnUpd(scmYnVo);
	        }
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/sc/scmFileLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> scmFileLst(SupplyChainManagementVo scmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 메인 목록조회");
		try {
			List<SupplyChainManagementVo> scmFileList = scmService.scmFileLst(scmVo);
			jsonData.put("data", scmFileList);
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

}
