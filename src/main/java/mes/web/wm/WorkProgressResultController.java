package mes.web.wm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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

import mes.domain.wm.WorkProgressResultVo;
import mes.service.wm.WorkProgressResultService;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class WorkProgressResultController {
	
	@Inject
	private WorkProgressResultService workProgressResultService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkProgressResultController.class);
	
	// 진행결과 마스터 리스트 조회(+수주 데이터)
	@RequestMapping(value = "/wm/workProgressResultAdmLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workProgressResultAdmLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List <WorkProgressResultVo> workProgressResultVoList = workProgressResultService.workProgressResultAdmLst(workProgressResultVo);
			jsonData.put("data", workProgressResultVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 진행결과 디테일 리스트 조회(+프로세스 항목 데이터)
	@RequestMapping(value = "/wm/workProgressResultDtlLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workProgressResultDtlLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			if(workProgressResultVo.getBizOrdAdmIdx().equals("")) {
				List<WorkProgressResultVo> workProgressResultVoList = new ArrayList<WorkProgressResultVo>();	
				jsonData.put("data", workProgressResultVoList);
				jsonData.put("result", "ok");
				return jsonData;
			}
			List <WorkProgressResultVo> workProgressResultVoList = workProgressResultService.workProgressResultDtlLst(workProgressResultVo);
			jsonData.put("data", workProgressResultVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//진행결과 마스터 등록, 수정
	@RequestMapping(value = "/wm/workProgressResultAdmIu", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workProgressResultAdmIu(WorkProgressResultVo workProgressResultVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	workProgressResultVo = new WorkProgressResultVo();
	        	workProgressResultVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
	        	workProgressResultVo.setAdmStartDate(jsonObject.get("admStartDate").toString());
	        	workProgressResultVo.setAdmEndDate(jsonObject.get("admEndDate").toString());
	        	workProgressResultVo.setAdmWorkChargr(jsonObject.get("admWorkChargr").toString());
	        	workProgressResultVo.setRegIdx(Utils.getUserIdx());
	        	workProgressResultVo.setUpdIdx(Utils.getUserIdx());
	    		if(jsonObject.get("idx")!=null) {
	    			workProgressResultVo.setIdx(jsonObject.get("idx").toString());
	    			workProgressResultService.workProgressResultAdmUpd(workProgressResultVo);
	    		} else {
	    			workProgressResultVo.setWorkStatus("W");
	    			workProgressResultService.workProgressResultAdmIns(workProgressResultVo);
    				List <WorkProgressResultVo> workCheckList = workProgressResultService.workCheckCount(workProgressResultVo);
    				if(workCheckList.size()!=0) {
    					workProgressResultVo = new WorkProgressResultVo();
						workProgressResultVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
						workProgressResultVo.setUpdIdx(Utils.getUserIdx());
						String workStatus = "E";
    					for(int j =0; j<workCheckList.size(); j++) {
        					if(workCheckList.get(j).getWorkCheck().equals("N")) {
    							workStatus = "S";
        					}
        				}
    					workProgressResultVo.setWorkStatus(workStatus);
    					workProgressResultService.workProgressResultAdmUpd(workProgressResultVo);
    				}
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
	
	//진행결과 디테일 등록, 수정
	@RequestMapping(value = "/wm/workProgressResultDtlIu", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workProgressResultDtlIu(WorkProgressResultVo workProgressResultVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			String admIdx = "";
			String bizOrdAdmIdx = "";
			String workStatus = "x";
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	workProgressResultVo = new WorkProgressResultVo();
	        	workProgressResultVo.setBizOrdAdmIdx(jsonObject.get("bizOrdAdmIdx").toString());
	        	workProgressResultVo.setLargeIdx(jsonObject.get("largeIdx").toString());
	        	workProgressResultVo.setMediumIdx(jsonObject.get("mediumIdx").toString());
	        	workProgressResultVo.setSmallIdx(jsonObject.get("smallIdx").toString());
	        	workProgressResultVo.setDtlStartDate(jsonObject.get("dtlStartDate").toString());
	        	workProgressResultVo.setDtlEndDate(jsonObject.get("dtlEndDate").toString());
	        	workProgressResultVo.setDtlWorkChargr(jsonObject.get("dtlWorkChargr").toString());
	        	workProgressResultVo.setWorkContents(jsonObject.get("workContents").toString());
	        	workProgressResultVo.setWorkCheck(jsonObject.get("workCheck").toString());
	        	workProgressResultVo.setWorkDesc(jsonObject.get("workDesc").toString());
	        	workProgressResultVo.setRegIdx(Utils.getUserIdx());
	        	workProgressResultVo.setUpdIdx(Utils.getUserIdx());
	    		if(jsonObject.get("status").equals("insert")) {
	    			workProgressResultService.workProgressResultDtlIns(workProgressResultVo);
	    		} else {
	    			workProgressResultService.workProgressResultDtlUpd(workProgressResultVo);
	    		}
	    		if(jsonObject.get("admIdx")!=null) {
	    			admIdx = jsonObject.get("admIdx").toString();	
	    		} else {
	    			admIdx = null;
	    		}
	    		if(jsonObject.get("workStatus")!=null) {
	    			workStatus = jsonObject.get("workStatus").toString();	
	    		} else {
	    			workStatus = "";
	    		}
	    		bizOrdAdmIdx = jsonObject.get("bizOrdAdmIdx").toString();
	        }
			boolean updateCheck = true;
			if(workStatus.equals("W") || workStatus.equals("S") || workStatus.equals("")) {
				List <WorkProgressResultVo> workCheckList = workProgressResultService.workCheckCount(workProgressResultVo);
				for(int i =0; i<workCheckList.size(); i++) {
					if(workCheckList.size()==1) {
						if(workCheckList.get(i).getWorkCheck().equals("N")) {
							workProgressResultVo = new WorkProgressResultVo();
							workProgressResultVo.setIdx(admIdx);
							workProgressResultVo.setWorkStatus("S");
							workProgressResultVo.setBizOrdAdmIdx(bizOrdAdmIdx);
							workProgressResultVo.setRegIdx(Utils.getUserIdx());
							workProgressResultVo.setUpdIdx(Utils.getUserIdx());
						} else {
							workProgressResultVo = new WorkProgressResultVo();
							workProgressResultVo.setIdx(admIdx);
							workProgressResultVo.setWorkStatus("E");
							workProgressResultVo.setBizOrdAdmIdx(bizOrdAdmIdx);
							workProgressResultVo.setRegIdx(Utils.getUserIdx());
							workProgressResultVo.setUpdIdx(Utils.getUserIdx());							
						}
						if(admIdx==null) {
							workProgressResultService.workProgressResultAdmIns(workProgressResultVo);
						} else {
							workProgressResultService.workProgressResultAdmUpd(workProgressResultVo);	
						}
						updateCheck = false;
					}
					if(workCheckList.get(i).getWorkCheck().equals("N") && updateCheck) {
						//모두 등록되었으니 완료시켜야함
						if(Integer.parseInt(workCheckList.get(i).getWorkCheckCount())==0){
							workProgressResultVo = new WorkProgressResultVo();
							workProgressResultVo.setIdx(admIdx);
							workProgressResultVo.setWorkStatus("E");
							workProgressResultVo.setBizOrdAdmIdx(bizOrdAdmIdx);
							workProgressResultVo.setRegIdx(Utils.getUserIdx());
							workProgressResultVo.setUpdIdx(Utils.getUserIdx());
						} else {//모두 등록된 것이 아니니 진행중으로 변경
							workProgressResultVo = new WorkProgressResultVo();
							workProgressResultVo.setIdx(admIdx);
							workProgressResultVo.setWorkStatus("S");
							workProgressResultVo.setBizOrdAdmIdx(bizOrdAdmIdx);
							workProgressResultVo.setRegIdx(Utils.getUserIdx());
							workProgressResultVo.setUpdIdx(Utils.getUserIdx());
						}
						if(admIdx==null) {
							workProgressResultService.workProgressResultAdmIns(workProgressResultVo);
						} else {
							workProgressResultService.workProgressResultAdmUpd(workProgressResultVo);	
						}
					}
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
}
