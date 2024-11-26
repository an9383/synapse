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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.ts.CsReceiveVo;
import mes.service.ts.CsReceiveService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class CsReceiveController {
	
	@Inject
	private CsReceiveService csReceiveService;
	
	private static final Logger logger = LoggerFactory.getLogger(CsReceiveController.class);
	
	// bssc0140 페이지
//	@RequestMapping(value = "/ts/tssc0010", method = RequestMethod.GET)
//	public ModelAndView tssc0010(ModelAndView mav, HttpServletRequest request) {
//		logger.info("page : /ts/tssc0010");
//		mav.addObject("userName", Utils.getUserNm());
//		mav.setViewName("/ts/tssc0010");
//		return mav;
//	}
	
	@RequestMapping(value = "/ts/CmplnReceiveList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CmplnReceiveList(CsReceiveVo csReceiveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("사용자승인권한관리: "+cmplnReceiveVo);
		try {
			List<CsReceiveVo> CsReceiveVo = csReceiveService.csReceiveAdmList(csReceiveVo);
			jsonData.put("data", CsReceiveVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/csReceiveDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csReceiveDtlList(CsReceiveVo csReceiveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자승인권한관리: "+csReceiveVo);
		try {
			List<CsReceiveVo> CsReceiveList = csReceiveService.csReceiveDtlList(csReceiveVo);
			jsonData.put("data", CsReceiveList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/csReceiveAdmRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csReceiveAdmRead(CsReceiveVo csReceiveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("사용자승인권한관리: "+cmplnReceiveVo);
		try {
			List<CsReceiveVo> CsReceiveList = csReceiveService.csReceiveAdmRead(csReceiveVo);
			jsonData.put("data", CsReceiveList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/csReceiveIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> csReceiveIU(CsReceiveVo csReceiveVo, HttpServletRequest request) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			String asNo;
			if(csReceiveVo.getAsNo().equals("")) {
				asNo = csReceiveService.getAsNo();
			}else {
				asNo = csReceiveVo.getAsNo();
			}
			
			csReceiveVo.setRegIdx(Utils.getUserIdx());
			csReceiveVo.setRegDate(DateUtil.getCurrentDateTime());
			csReceiveVo.setUpdIdx(Utils.getUserIdx());
			csReceiveVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(!csReceiveVo.getArrayData().equals("")) {
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = new JSONObject();
				JSONArray jsonArray = (JSONArray) jsonParser.parse(csReceiveVo.getArrayData());
				List<CsReceiveVo> CsReceiveVoList = new ArrayList<>();
				
				
				for(int i=0;i<jsonArray.size();i++) {
					jsonObj.put(i, jsonArray.get(i));
					JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
					
					CsReceiveVo csVo = new CsReceiveVo();
					
					csVo.setAsNo(asNo);
					csVo.setIdx(jsonObjDtl.get("idx").toString());
					csVo.setSerialNo(jsonObjDtl.get("serialNo").toString());
					csVo.setModuleNm(jsonObjDtl.get("moduleNm").toString());
					csVo.setItemGubun1(jsonObjDtl.get("itemGubun1").toString());
					csVo.setItemGubun2(jsonObjDtl.get("itemGubun2").toString());
					csVo.setCmplnDate(jsonObjDtl.get("cmplnDate").toString());
					csVo.setRegIdx(Utils.getUserIdx());
					csVo.setRegDate(DateUtil.getCurrentDateTime());
					csVo.setUpdIdx(Utils.getUserIdx());
					csVo.setUpdDate(DateUtil.getCurrentDateTime());
					CsReceiveVoList.add(csVo);
	//				cmplnReceiveService.csDtlCheck();
				}
				
				for(int i=0;i<CsReceiveVoList.size();i++) {
					CsReceiveVoList.get(i).setSubAsNo(csReceiveService.getSubAsNo(asNo));
					if(CsReceiveVoList.get(i).getIdx().equals("")) { // 등록
						csReceiveService.dtlCsInsert(CsReceiveVoList.get(i));
					} else { // 수정
						csReceiveService.dtlCsUpdate(CsReceiveVoList.get(i));
					}
				}
			}
			
			if(csReceiveVo.getAsNo().equals("")) {
				csReceiveVo.setAsNo(asNo);
				csReceiveService.admCsInsert(csReceiveVo);
			}else {
				csReceiveService.admCsUpdate(csReceiveVo);
			}
			
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/admCsUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> admCsUpdate(CsReceiveVo csReceiveVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			csReceiveVo.setRegIdx(Utils.getUserIdx());
			csReceiveVo.setRegDate(DateUtil.getCurrentDateTime());
			csReceiveVo.setUpdIdx(Utils.getUserIdx());
			csReceiveVo.setUpdDate(DateUtil.getCurrentDateTime());
			csReceiveService.admCsUpdate(csReceiveVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	@RequestMapping(value = "/ts/admCsDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> admCsDelete(CsReceiveVo csReceiveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
				csReceiveService.admCsDelete(csReceiveVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/ts/dtlCsDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dtlCsDelete(CsReceiveVo csReceiveVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			csReceiveService.dtlCsDelete(csReceiveVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
}
