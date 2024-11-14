package mes.web.qm;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.em.EquipInfoVo;
import mes.domain.qm.InspectVo;
import mes.domain.rm.ProjectVo;
import mes.service.qm.InspectService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;
@Controller
public class InspectController {
	
	@Inject
	private InspectService inspectService;
	
	private static final Logger logger = LoggerFactory.getLogger(InspectController.class);

	
	// qmsc0060 페이지
	@RequestMapping(value = "/qm/qmsc0060", method = RequestMethod.GET)
	public ModelAndView qmsc0060(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /qm/qmsc0060");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/qm/qmsc0060");
		return mav;
	}
	
	// qmsc0070 페이지
	@RequestMapping(value = "/qm/qmsc0070", method = RequestMethod.GET)
	public ModelAndView qmsc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /qm/qmsc0070");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/qm/qmsc0070");
		return mav;
	}
	
	// qmsc0080 페이지
	@RequestMapping(value = "/qm/qmsc0080", method = RequestMethod.GET)
	public ModelAndView qmsc0080(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /qm/qmsc0080");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/qm/qmsc0080");
		return mav;
	}
	
	// 검사 ADM 조회
	@RequestMapping(value = "/qm/inspectAdmSel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspectAdmSel(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectVo = inspectService.inspectAdmSel(inspectVo);
			jsonData.put("data", inspectVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검사 DTL 조회
	@RequestMapping(value = "/qm/inspectDtlLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspectDtlLst(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			System.out.println("statusGubun : " + inspectVo.getStatusGubun());
			if(inspectVo.getStatusGubun().equals("CREATE")) {
				List<InspectVo> inspectVoList = inspectService.lastCreateInspectDtlLst(inspectVo);
				jsonData.put("data", inspectVoList);
			} else {
				List<InspectVo> inspectVoList = inspectService.inspectDtlLst(inspectVo);
				jsonData.put("data", inspectVoList);
			}
			
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검사 DTL 등록
	@RequestMapping(value = "qm/inspectDtlIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectDtlIns(InspectVo inspectVo,
			@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			inspectVo = new InspectVo();
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put(0, dataArray.get(0));
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			inspectVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
			inspectVo.setInputGubun(jsonObject.get("inputGubun").toString());
			inspectVo.setSerialNoIdx(jsonObject.get("serialNoIdx").toString());
			inspectVo.setApprovalYn("002");
			inspectVo.setApprovalDate("");
			inspectVo.setAdmUserIdx(jsonObject.get("admUserIdx").toString());
			inspectVo.setProduceUserIdx(jsonObject.get("produceUserIdx").toString());
			inspectVo.setQaUserIdx(jsonObject.get("qaUserIdx").toString());
			inspectVo.setInspectAdmDesc(jsonObject.get("inspectAdmDesc").toString());
			inspectVo.setRegIdx(Utils.getUserIdx());
			String inspectIdx = inspectService.inspectAdmIns(inspectVo);
			int InspectDtlIdx = 1;
			JSONArray inspectDtlns_array = new JSONArray();
			if(!jsonObject.get("idx").toString().equals("x")) {
				for(int i=0;i<dataArray.size();i++) {
					jsonObj.put(i, dataArray.get(i));
		    		jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
		    		
					JSONObject inspectDtlData = new JSONObject();
					inspectDtlData.put("INSPECT_IDX", inspectIdx);
					inspectDtlData.put("IDX", InspectDtlIdx);
					inspectDtlData.put("ITEMS", jsonObject.get("items").toString());
					inspectDtlData.put("CHECK_DEPARTMENT_CD", jsonObject.get("checkDepartmentCd").toString());
					inspectDtlData.put("CHECK_CD", jsonObject.get("checkCd").toString());
					inspectDtlData.put("PASS_CD", jsonObject.get("passCd").toString());
					inspectDtlData.put("INSPECT_DATE", jsonObject.get("inspectDate").toString());
					inspectDtlData.put("FILE_NAME", jsonObject.get("updateFileName").toString());
					inspectDtlData.put("FILE_EXT", jsonObject.get("updateFileExt").toString());
					inspectDtlData.put("UUID", jsonObject.get("updateUuid").toString());
					inspectDtlData.put("INSPECT_DTL_DESC", jsonObject.get("inspectDtlDesc").toString());
					inspectDtlData.put("DTL_USER_IDX", jsonObject.get("dtlUserIdx").toString());
					if(jsonObject.get("items")!=null) {
						inspectDtlns_array.add(inspectDtlData);
						InspectDtlIdx++;	
					}
				}	
			}
			inspectVo.setInsertJson(inspectDtlns_array.toJSONString());
			inspectVo.setRegIdx(Utils.getUserIdx());
			if(InspectDtlIdx>1) {
				inspectService.inspectDtlIns(inspectVo);	
			}
			jsonData.put("result", "ok");
			jsonData.put("inspectAdmIdx", inspectIdx);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검사 DTL 등록 및 수정
	@RequestMapping(value = "qm/inspectDtlUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectDtlUpd(InspectVo inspectVo,
			@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			inspectVo = new InspectVo();
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			jsonObj.put(0, dataArray.get(0));
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			inspectVo.setIdx(jsonObject.get("inspectIdx").toString());
			jsonData.put("inspectAdmIdx", jsonObject.get("inspectIdx").toString());
			inspectVo.setSerialNoIdx(jsonObject.get("serialNoIdx").toString());
			inspectVo.setAdmUserIdx(jsonObject.get("admUserIdx").toString());
			inspectVo.setProduceUserIdx(jsonObject.get("produceUserIdx").toString());
			inspectVo.setQaUserIdx(jsonObject.get("qaUserIdx").toString());
			inspectVo.setInspectAdmDesc(jsonObject.get("inspectAdmDesc").toString());
			inspectVo.setUpdIdx(Utils.getUserIdx());
			inspectService.inspectAdmUpd(inspectVo);
			
			JSONArray inspectDtlns_array = new JSONArray();
			if(!jsonObject.get("idx").toString().equals("x")) {
				inspectVo.setInspectIdx(jsonObject.get("inspectIdx").toString());
				int InspectDtlIdx = inspectService.getMaxInspectDtlIdx(inspectVo);
				for(int i=0;i<dataArray.size();i++) {
					jsonObj.put(i, dataArray.get(i));
		    		jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
		    		if(jsonObject.get("idx").toString().equals("")) {
						JSONObject inspectDtlData = new JSONObject();
						inspectDtlData.put("INSPECT_IDX", jsonObject.get("inspectIdx").toString());
						inspectDtlData.put("IDX", InspectDtlIdx);
						inspectDtlData.put("ITEMS", jsonObject.get("items").toString());
						inspectDtlData.put("CHECK_DEPARTMENT_CD", jsonObject.get("checkDepartmentCd").toString());
						inspectDtlData.put("CHECK_CD", jsonObject.get("checkCd").toString());
						inspectDtlData.put("PASS_CD", jsonObject.get("passCd").toString());
						inspectDtlData.put("INSPECT_DATE", jsonObject.get("inspectDate").toString());
						inspectDtlData.put("FILE_NAME", jsonObject.get("updateFileName").toString());
						inspectDtlData.put("FILE_EXT", jsonObject.get("updateFileExt").toString());
						inspectDtlData.put("UUID", jsonObject.get("updateUuid").toString());
						inspectDtlData.put("INSPECT_DTL_DESC", jsonObject.get("inspectDtlDesc").toString());
						inspectDtlData.put("DTL_USER_IDX", jsonObject.get("dtlUserIdx").toString());
						inspectDtlns_array.add(inspectDtlData);
						InspectDtlIdx++;	
					} else {
						inspectVo = new InspectVo();
						inspectVo.setInspectIdx(jsonObject.get("inspectIdx").toString());
						inspectVo.setIdx(jsonObject.get("idx").toString());
						inspectVo.setItems(jsonObject.get("items").toString());
						inspectVo.setCheckDepartmentCd(jsonObject.get("checkDepartmentCd").toString());
						inspectVo.setCheckCd(jsonObject.get("checkCd").toString());
						inspectVo.setPassCd(jsonObject.get("passCd").toString());
						inspectVo.setInspectDate(jsonObject.get("inspectDate").toString());
						if(jsonObject.get("updateFileName")!=null) {
							inspectVo.setFileName(jsonObject.get("updateFileName").toString());
							inspectVo.setFileExt(jsonObject.get("updateFileExt").toString());	
							inspectVo.setUuid(jsonObject.get("updateUuid").toString());	
						}
						inspectVo.setInspectDtlDesc(jsonObject.get("inspectDtlDesc").toString());
						inspectVo.setDtlUserIdx(jsonObject.get("dtlUserIdx").toString());
						inspectVo.setUpdIdx(Utils.getUserIdx());
						inspectService.inspectDtlUpd(inspectVo);
					}
				}	
			}
			inspectVo.setInsertJson(inspectDtlns_array.toJSONString());
			inspectVo.setRegIdx(Utils.getUserIdx());
			if(inspectDtlns_array.size()>0) {
				inspectService.inspectDtlIns(inspectVo);	
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ISSUE FILE 삭제
	@RequestMapping(value = "qm/inspectDtlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectDtlDel(InspectVo inspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 삭제");
		try {
			inspectService.inspectDtlDel(inspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 승인여부 변경
	@RequestMapping(value = "qm/inspectAdmApprovalUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectAdmApprovalUpd(InspectVo inspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectVo.setUpdIdx(Utils.getUserIdx());
			inspectService.inspectAdmUpd(inspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 공정검사 ADM 조회
	@RequestMapping(value = "/qm/prcssInspectAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectAdmLst(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<InspectVo> prcssInspectList = inspectService.prcssInspectAdmLst(inspectVo);
			jsonData.put("data", prcssInspectList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정검사 ADM 등록
	@RequestMapping(value = "/qm/prcssInspectAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectAdmIns(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectVo.setRegIdx(Utils.getUserIdx());
			inspectVo.setRegDate(DateUtil.getCurrentDateTime());
			inspectService.prcssInspectAdmIns(inspectVo);	
			int idx = inspectService.prcssInspectAdmIdxSel(inspectVo);
			jsonData.put("data", idx);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정검사 ADM 수정
	@RequestMapping(value = "/qm/prcssInspectAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectAdmUpd(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectVo.setUpdIdx(Utils.getUserIdx());
			inspectVo.setUpdDate(DateUtil.getCurrentDateTime());
			inspectService.prcssInspectAdmUpd(inspectVo);		
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정검사 ADM 삭제
	@RequestMapping(value = "/qm/prcssInspectAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectAdmDel(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectService.prcssInspectAdmDel(inspectVo);
			InspectVo inspVo = new InspectVo();
			inspVo.setAdmIdx(inspectVo.getIdx());
			List<InspectVo> inspList = inspectService.prcssInspectFileLst(inspectVo);
			inspectService.prcssInspectFileDel(inspVo);
			jsonData.put("data", inspList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 공정검사 관련자료 조회
	@RequestMapping(value = "/qm/prcssInspectFileLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectFileLst(InspectVo inspectVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<InspectVo> prcssInspectList = inspectService.prcssInspectFileLst(inspectVo);		
			jsonData.put("data", prcssInspectList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공정검사 관련자료 등록
	@RequestMapping(value = "qm/prcssInspectFileIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectFileIns(InspectVo inspectVo,
														@RequestParam(value="fileString", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비정보관리 관련자료 등록");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			
			inspectVo.setRegIdx(Utils.getUserIdx());
			inspectVo.setRegDate(DateUtil.getCurrentDateTime());
			//파일 업로드 DB 생성
			for(int i=0;i<dataArray.size();i++) {
				jsonObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	    		inspectVo.setUuid(jsonObject.get("uuid").toString());
	    		inspectVo.setFileName(jsonObject.get("fileName").toString());
	    		inspectVo.setFileExt(jsonObject.get("fileExt").toString());
				inspectService.prcssInspectFileIns(inspectVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//관련자료 삭제
	@RequestMapping(value = "qm/prcssInspectFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssInspectFileDel(InspectVo inspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련자료 삭제");
		try {
			inspectService.prcssInspectFileDel(inspectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
