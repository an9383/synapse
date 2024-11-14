package mes.web.sm;

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

import mes.domain.sm.ApprovalAuthAdmVo;
import mes.service.sm.ApprovalAuthAdmService;
import mes.web.ut.Utils;

@Controller
public class ApprovalAuthAdmController {

	
	@Inject
	private ApprovalAuthAdmService approvalAuthAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ApprovalAuthAdmController.class);
	//승인이력 메인
	@RequestMapping(value = "/sm/smsc0070", method = RequestMethod.GET)
	public ModelAndView smsc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : 공통코드관리(시스템) /sm/smsc0070");
		mav.setViewName("/sm/smsc0070");
		return mav;
	}
	
	//승인권한 목록조회
	@RequestMapping(value = "/sm/approvalAuthAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approvalAuthAdmList(ApprovalAuthAdmVo approvalAuthAdm) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자승인권한관리: "+approvalAuthAdm);
		try {
			List<ApprovalAuthAdmVo> custCmplnAdmList = approvalAuthAdmService.approvalAuthAdmList(approvalAuthAdm);
			jsonData.put("data", custCmplnAdmList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//승인권한 등록
	@RequestMapping(value = "/sm/approvalAuthAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> approvalAuthAdmCreate(ApprovalAuthAdmVo approvalAuthAdm, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("승인권한 등록처리 >>>>>>..>>>>>>>..>>>>>...>>>>>...>>>>>>>: " + approvalAuthAdm.getArrayData());
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(approvalAuthAdm.getArrayData());
			ApprovalAuthAdmVo approvalAuthAdmTempVo = new ApprovalAuthAdmVo();
			
			logger.info("값 확인(jsonArray)>>>>>>>"+jsonArray);
			
			for(int i=0;i<jsonArray.size();i++){

				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				approvalAuthAdmTempVo.setUserId(jsonObjDtl.get("userId").toString());		//사용자 ID
				approvalAuthAdmTempVo.setApprDesc(jsonObjDtl.get("baseAttr").toString());	//메뉴패스
				approvalAuthAdmTempVo.setApprCd(jsonObjDtl.get("commonCd").toString());		//공통코드 승인코드
//				approvalAuthAdmTempVo.setApprCd("002");										//승인코드
				approvalAuthAdmTempVo.setRegId(Utils.getUserId());							//등록자
				
				logger.info("approvalAuthAdmTempVo 값  : "+approvalAuthAdmTempVo);
				
				approvalAuthAdmService.approvalAuthAdmCreate(approvalAuthAdmTempVo);
			};
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
					
		} 
		return jsonData;
	}
		
	
	//승인권한 삭제
	@RequestMapping(value = "/sm/approvalAuthAdmDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> approvalAuthAdmDelete(ApprovalAuthAdmVo approvalAuthAdm) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			approvalAuthAdmService.approvalAuthAdmDelete(approvalAuthAdm);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
		
}
