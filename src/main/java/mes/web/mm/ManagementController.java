package mes.web.mm;

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

import mes.domain.bs.BizOrderVo;
import mes.domain.mm.ManagementVo;
import mes.service.bs.BizOrderService;
import mes.service.mm.ManagementService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class ManagementController {
	
	@Inject
	private ManagementService managementtService;
	@Inject
	private BizOrderService bizOrderService;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	// mmsc0010
	@RequestMapping(value = "/mm/mmsc0010", method = RequestMethod.GET)
	public ModelAndView wmsc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /mm/mmsc0010");
		mav.setViewName("/mm/mmsc0010");
		return mav;
	}
	
	// 진행결과 마스터 리스트 조회(+수주 데이터)
	@RequestMapping(value = "/mm/managementBoard", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workProgressResultAdmLst(ManagementVo managementVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List <ManagementVo> managementVoList = managementtService.managementBoard(managementVo);
			jsonData.put("data", managementVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 수주관리 상태, 완료일 수정
	@RequestMapping(value = "mm/bizOrderStatusUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bizOrderDtlIU(BizOrderVo bizOrderVo, @RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주관리 매출정보 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			List<BizOrderVo> bizSalesList = new ArrayList<>();
			JSONObject jsonStockObj = new JSONObject();
	        for(int i=0;i<dataArray.size();i++) {
	        	jsonStockObj.put(i, dataArray.get(i));
	    		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStockObj.get(i).toString());
	    		BizOrderVo bizOrderDtlVo = new BizOrderVo();
	    		bizOrderDtlVo.setIdx(jsonObject.get("idx").toString());
	    		bizOrderDtlVo.setStatus(jsonObject.get("status").toString());
	    		bizOrderDtlVo.setCompleteDate(jsonObject.get("completeDate").toString());
				bizOrderDtlVo.setUpdIdx(Utils.getUserIdx());
				bizOrderDtlVo.setUpdDate(DateUtil.getCurrentDateTime());
				bizOrderService.bizOrderAdmUpd(bizOrderDtlVo);
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
