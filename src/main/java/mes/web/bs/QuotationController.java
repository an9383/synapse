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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bs.QuotationVo;
import mes.service.bs.QuotationService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class QuotationController {
	
	@Inject
	private QuotationService quotationService;
	
	private static final Logger logger = LoggerFactory.getLogger(QuotationController.class);
	
	// bssc0180 페이지
	@RequestMapping(value = "/bs/bssc0180", method = RequestMethod.GET)
	public ModelAndView bssc0180(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bs/bssc0180");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/bs/bssc0180");
		return mav;
	}
	
	@RequestMapping(value = "/bs/quotationLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationLst(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<QuotationVo> quotationVoList = quotationService.quotationLst(quotationVo);
			jsonData.put("data", quotationVoList);
			jsonData.put("result", "ok");
		}catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationIU(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String reqNo = "";
			quotationVo.setRegIdx(Utils.getUserIdx());
			quotationVo.setRegDate(DateUtil.getCurrentDateTime());
			quotationVo.setUpdIdx(Utils.getUserIdx());
			quotationVo.setUpdDate(DateUtil.getCurrentDateTime());
			if(quotationVo.getReqNo().equals("")) {
				reqNo = quotationService.getReqNo();
				quotationVo.setReqNo(reqNo);
				quotationService.quotationIns(quotationVo);
			}else {
//				reqNo = quotationVo.getReqNo();
//				quotationVo.setReqNo(reqNo);
				quotationService.quotationUpd(quotationVo);
			}
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationDel(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			quotationService.quotationDel(quotationVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationInfoLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationInfoLst(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<QuotationVo> quotationVoList = quotationService.quotationInfoLst(quotationVo);
			jsonData.put("data", quotationVoList);
			jsonData.put("result", "ok");
		}catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationInfoIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationInfoIU(@RequestBody List<Map<String, Object>> quotationInfoList) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			QuotationVo quotationVo = new QuotationVo();
			for(Map<String, Object> m : quotationInfoList) {
				quotationVo.setReqNo(quotationInfoList.get(0).get("reqNo").toString());
				quotationVo.setItemType(m.get("itemType").toString());
				quotationVo.setItemNm(m.get("itemNm").toString());
				quotationVo.setProduceUnit(m.get("produceUnit").toString());
				quotationVo.setQuotationQty(m.get("quotationQty").toString());
				quotationVo.setUnitPrice(m.get("unitPrice").toString());
				quotationVo.setQuotationPrice(m.get("quotationPrice").toString());
				quotationVo.setLeadTime(m.get("leadTime").toString());
				quotationVo.setUpdIdx(Utils.getUserIdx());
				quotationVo.setUpdDate(DateUtil.getCurrentDateTime());
				quotationVo.setRegIdx(Utils.getUserIdx());
				quotationVo.setRegDate(DateUtil.getCurrentDateTime());
				if(m.get("idx").equals("") || m.get("idx") == null) {
					quotationService.quotationInfoIns(quotationVo);
				} else {
					quotationVo.setIdx(m.get("idx").toString());
					quotationService.quotationInfoUpd(quotationVo);
				}
			}
			jsonData.put("result", "ok");
		}catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationInfoDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationInfoDel(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			quotationService.quotationInfoDel(quotationVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	@RequestMapping(value = "/bs/quotationFileLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationFileLst(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<QuotationVo> quotationVoList = quotationService.quotationFileLst(quotationVo);
			jsonData.put("data", quotationVoList);
			jsonData.put("result", "ok");
		}catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationFileIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationFileIU(@RequestBody List<Map<String, Object>> quotationFileList) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			QuotationVo quotationVo = new QuotationVo();
			for(Map<String, Object> m : quotationFileList) {
				quotationVo.setInfoIdx(quotationFileList.get(0).get("infoIdx").toString());
				quotationVo.setReqNo(quotationFileList.get(0).get("reqNo").toString());
				quotationVo.setInputGubun(m.get("inputGubun").toString());
				quotationVo.setUuid(m.get("uuid").toString());
				quotationVo.setFileName(m.get("fileName").toString());
				quotationVo.setFileExt(m.get("fileExt").toString());
				quotationVo.setFileSize(m.get("fileSize").toString());
				quotationVo.setRegIdx(Utils.getUserIdx());
				quotationVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx") != null) {
					quotationService.quotationFileUpd(quotationVo);
				} else {
					quotationService.quotationFileIns(quotationVo);
				}
			}
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/bs/quotationFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> quotationFileDel(QuotationVo quotationVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			quotationService.quotationFileDel(quotationVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
