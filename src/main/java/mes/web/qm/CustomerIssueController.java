package mes.web.qm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.qm.CustomerIssueVo;
import mes.domain.rm.ProjectVo;
import mes.service.qm.CustomerIssueService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;
@Controller
public class CustomerIssueController {
	
	@Inject
	private CustomerIssueService customerIssueService;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerIssueController.class);

	
	// qmsc0170 페이지
	@RequestMapping(value = "/qm/qmsc0050", method = RequestMethod.GET)
	public ModelAndView qmsc0050(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /qm/qmsc0050");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/qm/qmsc0050");
		return mav;
	}
	
	
	// ================================== 고객불만 및 이슈사항등록 메인 ================================
	// 고객이슈사항 목록조회
	@RequestMapping(value = "/qm/customerIssueLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> customerIssueLst(CustomerIssueVo customerIssueVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("고객불만 및 이슈사항 목록조회");
		try {
			List<CustomerIssueVo> customerIssueVoList = customerIssueService.customerIssueLst(customerIssueVo);
			jsonData.put("data", customerIssueVoList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/qm/customerIssueIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> customerIssueIns(CustomerIssueVo customerIssueVo, HttpServletRequest request) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			customerIssueVo.setRegIdx(Utils.getUserIdx());
			customerIssueVo.setRegDate(DateUtil.getCurrentDateTime());
			customerIssueVo.setUpdIdx(Utils.getUserIdx());
			customerIssueVo.setUpdDate(DateUtil.getCurrentDateTime());
			if(!customerIssueVo.getIdx().equals("")) {
				customerIssueService.customerIssueUpd(customerIssueVo);
			}else {
				customerIssueService.customerIssueIns(customerIssueVo);
			}
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/qm/customerIssueDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> customerIssueDel(CustomerIssueVo customerIssueVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			customerIssueService.customerIssueDel(customerIssueVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//ISSUE FILE 조회
	@RequestMapping(value = "/qm/issueFileLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> issueFileLst(CustomerIssueVo customerIssueVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("ISSUE FILE 조회");
		try {
			List <CustomerIssueVo> issueVoList = customerIssueService.issueFileLst(customerIssueVo);
			jsonData.put("data", issueVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ISSUE FILE 등록
	@RequestMapping(value = "qm/issueFileInsUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> issueFileInsUpd(@RequestBody List<Map<String, Object>> issueFileList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			CustomerIssueVo customerVo = new CustomerIssueVo();				
			int managerIdx = 1;
			logger.info("data : " + issueFileList.size());
			logger.info("data : " + issueFileList);
			for(Map<String, Object> m : issueFileList) {
				customerVo.setIssueIdx(issueFileList.get(0).get("issueIdx").toString());
				customerVo.setInputGubun(m.get("inputGubun").toString());
				customerVo.setDocumentNm(m.get("documentNm").toString());
				customerVo.setUserIdx(m.get("userIdx").toString());
				customerVo.setUuid(m.get("uuid").toString().replace("\\", "\\\\"));
				customerVo.setFileName(m.get("fileName").toString());
				customerVo.setFileExt(m.get("fileExt").toString());
				customerVo.setFileDesc(m.get("fileDesc").toString());
				customerVo.setRegIdx(Utils.getUserIdx());
				customerVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx")!=null) {
					customerVo.setIdx(m.get("idx").toString());
					customerIssueService.issueFileUpd(customerVo);
				} else {
					customerIssueService.issueFileIns(customerVo);
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
	
	// ISSUE FILE 삭제
	@RequestMapping(value = "qm/issueFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> issueFileDel(CustomerIssueVo customerIssueVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 삭제");
		try {
			customerIssueService.issueFileDel(customerIssueVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
