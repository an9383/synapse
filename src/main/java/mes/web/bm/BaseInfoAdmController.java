
package mes.web.bm;

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

import mes.domain.bm.BaseInfoAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BaseInfoAdmController {
	private static final Logger logger = LoggerFactory.getLogger(BaseInfoAdmController.class);

	@Inject
	private BaseInfoAdmService baseInfoAdmService;

	// 불량유형관리(봉제) 페이지
	@RequestMapping(value = "/bm/bmsc0140", method = RequestMethod.GET)
	public ModelAndView bmsc0140(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0140");
		mav.setViewName("/bm/bmsc0140");
		mav.addObject("userName", Utils.getUserNm());
		return mav;
	}

	
	// 불량원인 전체 조회
	@RequestMapping(value = "/bm/baseInfoFtLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFtLst(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발췌기준 목록조회: " + baseInfoAdmVo);
		try {
			List<BaseInfoAdmVo> baseInfoAdmLst = baseInfoAdmService.baseInfoFtLst(baseInfoAdmVo);
			jsonData.put("data", baseInfoAdmLst);
			jsonData.put("listSize", baseInfoAdmLst.size());
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 불량원인 상세 조회
	@RequestMapping(value = "/bm/baseInfoFtSel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFtSel(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("불량원인 상세 정보 : " +baseInfoAdmVo);
		try {
			baseInfoAdmVo = baseInfoAdmService.baseInfoFtSel(baseInfoAdmVo);
			logger.info("검색 후 : " + baseInfoAdmVo);
			jsonData.put("data", baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 불량원인 등록
	@RequestMapping(value = "/bm/baseInfoFtIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoFtCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량원인 등록: " + baseInfoAdmVo);
		try {
			baseInfoAdmVo.setRegIdx(Utils.getUserId());
			baseInfoAdmVo.setRegDate(DateUtil.getCurrentDateTime());
			baseInfoAdmVo.setUpdIdx(Utils.getUserId());
			baseInfoAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
			
			if(baseInfoAdmVo.getBaseInfoCd().equals("")) {
				baseInfoAdmService.baseInfoFtIns(baseInfoAdmVo);
			} else {
				baseInfoAdmService.baseInfoFtUpd(baseInfoAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 삭제
	@RequestMapping(value = "/bm/baseInfoFtDataDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoFtDataDel(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			baseInfoAdmService.baseInfoFtDataDel(baseInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
//	//전체 조회
//	@RequestMapping(value = "/baseInfoItList", method = RequestMethod.GET)
//	public @ResponseBody Map<String, Object> baseInfoItList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		
//		logger.info("검사항목관리 목록조회: " + baseInfoAdmVo);
//		try {
//			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoItList();
//			jsonData.put("data", baseInfoAdmList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
//
//	//상세 조회
//	@RequestMapping(value = "/bm/baseInfoItRead", method = RequestMethod.GET)
//	public @ResponseBody Map<String, Object> baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<>();
//		logger.info("불량원인 상세 정보 : " +baseInfoAdmVo);
//		try {
//			baseInfoAdmVo = baseInfoAdmService.baseInfoItRead(baseInfoAdmVo);
//			logger.info("검색 후 : " + baseInfoAdmVo);
//			jsonData.put("data", baseInfoAdmVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
//	
//	//등록
//	@RequestMapping(value = "/bm/baseInfoItCreate", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("불량원인 등록: " + baseInfoAdmVo);
//		try {
//			String sequence = baseInfoAdmService.baseInfoSeq();
//			logger.info("검색 후 SEQ : "+ sequence);
//			baseInfoAdmVo.setBaseInfoSeq(sequence);
//			baseInfoAdmVo.setBaseInfoCd(baseInfoAdmService.baseInfoCdSeq(baseInfoAdmVo));
//			baseInfoAdmVo.setRegIdx(Utils.getUserId());
//			baseInfoAdmService.baseInfoItCreate(baseInfoAdmVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
//
//	//수정
//	@RequestMapping(value = "/bm/baseInfoItUpdate", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		
//		try {
//			baseInfoAdmVo.setUpdIdx(Utils.getUserId());
//			logger.info("불량원인 수정: " + baseInfoAdmVo);
//			baseInfoAdmService.baseInfoItUpdate(baseInfoAdmVo);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
	
//	//코드 시퀀스
//	@RequestMapping(value = "/bm/baseInfoCdSeq", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		try {
//			String sequence = baseInfoAdmService.baseInfoCdSeq(baseInfoAdmVo);
//			logger.info("검색 후 CDSEQ : " + sequence);
//			jsonData.put("baseInfoCd", sequence);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
	
//	// 공정정보관리(봉제조립) 비가동항목설정 조회
//	@RequestMapping(value = "bm/prcssCodeNoList", method = RequestMethod.GET)
//	public @ResponseBody Map<String, Object> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("발췌기준 목록조회: " + baseInfoAdmVo);
//		try {
//			List<BaseInfoAdmVo> prcssCodeNoList = baseInfoAdmService.prcssCodeNoList(baseInfoAdmVo);
//			jsonData.put("data", prcssCodeNoList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
//	
//	// 공정정보관리(봉제조립) 항목설정 등록
//	@RequestMapping(value = "/bm/prcssCodeNoCreate", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> prcssCodeNoCreate(@RequestBody List<Map<String, Object>> baseInfoAdmList) throws Exception {
//		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("공정정보관리(봉제조립) 항목설정 등록: " + baseInfoAdmVo);
//		try {
//			baseInfoAdmVo.setEtc3(baseInfoAdmList.get(0).get("etc3").toString());
//			baseInfoAdmVo.setBaseInfoType(baseInfoAdmList.get(0).get("baseInfoType").toString());
//			baseInfoAdmService.prcssCodeNoDelete(baseInfoAdmVo);
//			for(Map<String, Object> list : baseInfoAdmList) {
//				if(list.get("baseInfoNm")!=null) {
//					String sequence = baseInfoAdmService.baseInfoSeq();
//					logger.info("검색 후 SEQ : " + sequence);
//					baseInfoAdmVo.setBaseInfoSeq(sequence);
//					
//					baseInfoAdmVo.setBaseInfoType(list.get("baseInfoType").toString());
//					baseInfoAdmVo.setBaseInfoCd(list.get("baseInfoCd").toString());
//					baseInfoAdmVo.setBaseInfoNm(list.get("baseInfoNm").toString());
//					baseInfoAdmVo.setBaseInfoDesc(list.get("baseInfoDesc").toString());
//					baseInfoAdmVo.setUseYn(list.get("useYn").toString());
//					baseInfoAdmVo.setEtc3(list.get("etc3").toString());
//					baseInfoAdmVo.setRegIdx(Utils.getUserId());
//					
//					baseInfoAdmService.prcssCodeNoCreate(baseInfoAdmVo);
//					jsonData.put("result", "ok");
//				}else {
//					jsonData.put("result", "ok");
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
//	
//	// 비가동유형 전체 조회
//	@RequestMapping(value = "/baseInfoDtList", method = RequestMethod.GET)
//	public @ResponseBody Map<String, Object> baseInfoDtList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		
//		logger.info("불량유형 목록조회: " + baseInfoAdmVo);
//		try {
//			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoDtList(baseInfoAdmVo);
//			jsonData.put("data", baseInfoAdmList);
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//
//		return jsonData;
//	}
	
}

