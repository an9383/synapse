package mes.web.wm;

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

import mes.domain.wm.VomVo;
import mes.service.wm.VomService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class VomController {
	
	@Inject
	private VomService vomService;
	
	private static final Logger logger = LoggerFactory.getLogger(VomController.class);
	
	@RequestMapping(value = "/wm/wmsc0080", method = RequestMethod.GET)
	public ModelAndView wmsc0080(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /wm/wmsc0080");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/wm/wmsc0080");
		return mav;
	}
	@RequestMapping(value = "/wm/wmsc0090", method = RequestMethod.GET)
	public ModelAndView wmsc0090(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /wm/wmsc0090");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/wm/wmsc0090");
		return mav;
	}
	
	@RequestMapping(value = "/wm/vomList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vomList(VomVo vomVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<VomVo> vomVoList = vomService.vomList(vomVo);
			jsonData.put("data", vomVoList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message",  Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/wm/vomIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vomIns(VomVo vomVo, HttpServletRequest request) throws Exception{
		Map<String, Object> jsonData = new HashMap<>();
		try {
			vomVo.setRegIdx(Utils.getUserIdx());
			vomVo.setRegDate(DateUtil.getCurrentDateTime());
			vomVo.setUpdIdx(Utils.getUserIdx());
			vomVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(vomVo.getIdx().equals("")) {
				vomService.vomIns(vomVo);
			}else {
				vomService.vomUpd(vomVo);
			}
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT FILE 삭제
		@RequestMapping(value = "wm/vomDel", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> vomDel(VomVo vomVo) throws Exception {
			Map<String, Object> jsonData = new HashMap<String, Object>();
//			logger.info("거래처정보 삭제");
			try {
				vomService.vomDel(vomVo);
				jsonData.put("result", "ok");
			} catch (Exception e) {
				e.printStackTrace();
				jsonData.put("result", "error");
				jsonData.put("message", Utils.getErrorMessage());
			}
			return jsonData;
		}
	
	
	@RequestMapping(value = "/wm/vomFileList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> vomFileLst(VomVo vomVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<VomVo> vomVoList = vomService.vomFileList(vomVo);
			jsonData.put("data", vomVoList);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT FILE 등록
	@RequestMapping(value = "wm/vomFileIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vomFileIU(@RequestBody List<Map<String, Object>> vomFileList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			VomVo vomVo = new VomVo();				
			int managerIdx = 1;
//			logger.info("data : " + projectFileList.size());
//			logger.info("data : " + projectFileList);
			for(Map<String, Object> m : vomFileList) {
				vomVo.setVomIdx(vomFileList.get(0).get("vomIdx").toString());
				vomVo.setInputGubun(m.get("inputGubun").toString());
				vomVo.setDocumentNm(m.get("documentNm").toString());
				vomVo.setUserIdx(m.get("userIdx").toString());
				vomVo.setUuid(m.get("uuid").toString());
				vomVo.setFileName(m.get("fileName").toString());
				vomVo.setFileExt(m.get("fileExt").toString());
				vomVo.setFileDesc(m.get("fileDesc").toString());
				vomVo.setRegIdx(Utils.getUserIdx());
				vomVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx")!=null) {
					vomVo.setIdx(m.get("idx").toString());
					vomService.vomFileUpd(vomVo);
				} else {
					vomService.vomFileIns(vomVo);
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
		
	// PROJECT FILE 삭제
	@RequestMapping(value = "wm/vomFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vomFileDel(VomVo vomVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("거래처정보 삭제");
		try {
			vomService.vomFileDel(vomVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/wm/vomImgFileSel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> vomImgFileSel(VomVo vomVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			vomVo = vomService.vomImgFileSel(vomVo);
			jsonData.put("data", vomVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	@RequestMapping(value = "/wm/vomImgFileIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> vomImgFileIU(VomVo vomVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			vomVo.setRegIdx(Utils.getUserIdx());
			vomVo.setUpdIdx(Utils.getUserIdx());
			if(!vomVo.getIdx().equals("")) {
				vomService.vomImgFileUpd(vomVo);
			}else {
				vomService.vomImgFileIns(vomVo);
			}
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
