package mes.web.bm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.InspectContantAdmVo;
import mes.service.bm.InspectContantAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class InspectContantAdmController {

	@Inject
	private InspectContantAdmService inspectContantAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(InspectContantAdmController.class);
	
	// bmsc0190
	@RequestMapping(value = "/bm/bmsc0190", method = RequestMethod.GET)
	public ModelAndView bmsc0190(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0190");
		mav.setViewName("/bm/bmsc0190");
		return mav;
	}
	
	@RequestMapping(value = "/bm/inspectContantAdmLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectContantAdmLst(InspectContantAdmVo inspectContantAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<InspectContantAdmVo> inspectContantAdmLst = inspectContantAdmService.inspectContantAdmLst(inspectContantAdmVo);
			jsonData.put("data", inspectContantAdmLst);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bm/inspectContantAdmIU", method= RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectContantAdmIU(InspectContantAdmVo inspectContantAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if(inspectContantAdmService.inspectCdCheck(inspectContantAdmVo) != null) {
        		jsonData.put("result", "fail");
        		jsonData.put("idx", inspectContantAdmVo.getIdx());
        		jsonData.put("message", "이미 존재하는 코드입니다.");
        		return jsonData;
        	}else if(inspectContantAdmVo.getIdx().equals("")) {
				inspectContantAdmVo.setRegIdx(Utils.getUserIdx());
				inspectContantAdmVo.setRegDate(DateUtil.getCurrentDateTime());
				inspectContantAdmService.inspectContantAdmIns(inspectContantAdmVo);
			}else {
				inspectContantAdmVo.setUpdIdx(Utils.getUserIdx());
				inspectContantAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
				inspectContantAdmService.inspectContantAdmUpd(inspectContantAdmVo);
			}
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bm/inspectContantAdmDel", method= RequestMethod.POST)
	public @ResponseBody Map<String, Object> inspectContantAdmDel(InspectContantAdmVo inspectContantAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			inspectContantAdmService.inspectContantAdmDel(inspectContantAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
