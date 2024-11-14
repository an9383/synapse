package mes.web.bm;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import io.jsonwebtoken.io.IOException;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.sm.CommonCodeVo;
import mes.domain.sm.UserVo;
import mes.domain.sm.WorkplaceVo;
import mes.service.bm.DealCorpAdmService;
import mes.service.sm.CommonCodeService;
import mes.service.sm.UserService;
import mes.service.sm.WorkplaceService;
import mes.web.ut.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class DealCorpAdmController {
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	@Inject
	private CommonCodeService commonCodeService;
	@Inject
	private UserService userService;
	@Inject
	private WorkplaceService workplaceService;
	@Value("${file.dealCorpPath}")
	private String filePath;
	
	
	private static final Logger logger = LoggerFactory.getLogger(DealCorpAdmController.class);
	
	// bmsc0010
	@RequestMapping(value = "/bm/bmsc0010", method = RequestMethod.GET)
	public ModelAndView bmsc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0010");
		mav.setViewName("/bm/bmsc0010");
		return mav;
	}
	
	// 거래처정보관리 페이지
	@RequestMapping(value = "/bm/bmsc0020", method = RequestMethod.GET)
	public ModelAndView bmsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /bm/bmsc0020");
		mav.setViewName("/bm/bmsc0020");
		mav.addObject("userName", Utils.getUserNm());
		return mav;
	}
	
	// 거래처정보 목록조회
	@RequestMapping(value = "bm/dealCorpAdmList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpAdmList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 목록조회");
		try {
			List<DealCorpAdmVo> dealCorpAdmList = dealCorpAdmService.dealCorpAdmList(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보(투입자재 발주처) 목록조회
	@RequestMapping(value = "bm/matrlDealCorpAdmList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlDealCorpAdmList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보(투입자재 발주처) 목록조회");
		try {
			List<DealCorpAdmVo> dealCorpAdmList = dealCorpAdmService.matrlDealCorpAdmList(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 상세조회
	@RequestMapping(value = "bm/dealCorpAdmSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpAdmSel(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 상세조회");
		try {
			dealCorpAdmVo = dealCorpAdmService.dealCorpAdmSel(dealCorpAdmVo);
			logger.info("12" + dealCorpAdmVo.getSalesManagerNm());
			jsonData.put("data", dealCorpAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 등록
	@RequestMapping(value = "bm/dealCorpAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpAdmIns(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 등록" + dealCorpAdmVo);
		try {
			dealCorpAdmVo.setRegIdx(Utils.getUserIdx());
			dealCorpAdmVo.setRegDate(DateUtil.getCurrentDateTime());
			if(dealCorpAdmService.dealCorpCdCheck(dealCorpAdmVo) == null) {
				String admIdx = dealCorpAdmService.dealCorpAdmIns(dealCorpAdmVo);
				logger.info("admIdx : " + admIdx);	
				jsonData.put("idx", admIdx);
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복되는 거래처 코드가 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 수정
	@RequestMapping(value = "bm/dealCorpAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpAdmUpd(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 수정");
		try {
			dealCorpAdmVo.setUpdIdx(Utils.getUserIdx());
			dealCorpAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
			if(dealCorpAdmService.dealCorpCdCheck(dealCorpAdmVo) == null) {
				dealCorpAdmService.dealCorpAdmUpd(dealCorpAdmVo);
				dealCorpAdmVo.setAdmIdx(dealCorpAdmVo.getIdx());
				dealCorpAdmService.dealCorpManagerDel(dealCorpAdmVo);
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복되는 거래처 코드가 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 삭제
	@RequestMapping(value = "bm/dealCorpAdmDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userDel(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 삭제");
		try {
			dealCorpAdmService.dealCorpAdmDel(dealCorpAdmVo);
			dealCorpAdmVo.setAdmIdx(dealCorpAdmVo.getIdx());
			dealCorpAdmVo.setIdx(null);
			dealCorpAdmService.dealCorpManagerDel(dealCorpAdmVo);
			dealCorpAdmService.dealCorpFileDel(dealCorpAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 담당자 목록 조회
	@RequestMapping(value = "bm/dealCorpManagerList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpManagerList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 담당자 목록조회");
		try {
			List<DealCorpAdmVo> dealCorpAdmList = dealCorpAdmService.dealCorpManagerList(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 담당자 등록
	@RequestMapping(value = "bm/dealCorpManagerIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpManagerIns(@RequestBody List<Map<String, Object>> dealCorpManagerList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo();				
			logger.info("data : " + dealCorpManagerList.size());
			logger.info("data : " + dealCorpManagerList);
			for(Map<String, Object> m : dealCorpManagerList) {
				dealCorpAdmVo.setAdmIdx(dealCorpManagerList.get(0).get("admIdx").toString());
				dealCorpAdmVo.setChargeDepartment(m.get("chargeDepartment").toString());
				dealCorpAdmVo.setChargeName(m.get("chargeName").toString());
				dealCorpAdmVo.setChargePhoneNumber(m.get("chargePhoneNumber").toString());
				dealCorpAdmVo.setChargeEmail(m.get("chargeEmail").toString());
				dealCorpAdmVo.setRegIdx(Utils.getUserIdx());
				dealCorpAdmVo.setRegDate(DateUtil.getCurrentDateTime());
				 dealCorpAdmService.dealCorpManagerIns(dealCorpAdmVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 관련파일 목록조회
	@RequestMapping(value = "bm/dealCorpFileList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpFileList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 목록조회");
		try {
			List<DealCorpAdmVo> dealCorpFileList = dealCorpAdmService.dealCorpFileList(dealCorpAdmVo);
			jsonData.put("data", dealCorpFileList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 관련파일 등록
	@RequestMapping(value = "bm/dealCorpFileIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpFileIns(@RequestBody List<Map<String, Object>> dealCorpFileList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo();				
			int managerIdx = 1;
			logger.info("data : " + dealCorpFileList.size());
			logger.info("data : " + dealCorpFileList);
			for(Map<String, Object> m : dealCorpFileList) {
				dealCorpAdmVo.setAdmIdx(dealCorpFileList.get(0).get("admIdx").toString());
				dealCorpAdmVo.setUuid(m.get("uuid").toString());
				dealCorpAdmVo.setFileName(m.get("fileName").toString());
				dealCorpAdmVo.setFileExt(m.get("fileExt").toString());
				dealCorpAdmVo.setRegIdx(Utils.getUserIdx());
				dealCorpAdmVo.setRegDate(DateUtil.getCurrentDateTime());
				 dealCorpAdmService.dealCorpFileIns(dealCorpAdmVo);
				 managerIdx++;
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처정보 관련파일 삭제
	@RequestMapping(value = "bm/dealCorpFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpFileDel(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 삭제");
		try {
			dealCorpAdmService.dealCorpFileDel(dealCorpAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 거래처 액셀 업로드
	@RequestMapping(value="/bm/dealCorpExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpExcelUpload(Model model, @RequestParam("excelfile") MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		String url = null;
		String fileName = "";
		try {
			//파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			
			
			// 서버에 저장할 파일 이름
			TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
			Calendar calendar = Calendar.getInstance(tz);
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH)+1;
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			
			String[] originalFileName = extName.split("\\.");
			if(originalFileName[1].equals("xlsx")) {
				fileName += ".xlsx";		
			} else if(originalFileName[1].equals("xls")) {
				fileName += ".xls";		
			}
			
			String saveFileName = fileName;
			
			logger.info("originFilename : " + originFilename);
			logger.info("extensionName : " + extName);
			logger.info("size : " + size);
			logger.info("saveFileName : " + saveFileName);
			
			logger.info("path : " + filePath);
			
			File Folder = new File(filePath);
			
			if(!Folder.exists()) {
				try {
					Folder.mkdirs();
					logger.info("폴더 생성됨");
				} catch(Exception e) {
					e.getStackTrace();
				}
			} else {
				logger.info("이미 생성되어있음");
			}
			
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ==> "+filePath);
			
			FileOutputStream fos = new FileOutputStream(filePath+"/"+saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = filePath + "/" + saveFileName;
			logger.info("url ==> "+ url);
			
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<DealCorpAdmVo> dealCorpList = excelReader.dealCorpExcelRead(url, logger);
			CommonCodeVo commonCodeVo = new CommonCodeVo();
			commonCodeVo.setCommonType("시스템");
			//거래구분
			commonCodeVo.setCommonCd("011");
			List<CommonCodeVo> dealGubunList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//중요도
			commonCodeVo.setCommonCd("012");
			List<CommonCodeVo> importantLevelList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//회사구분
			commonCodeVo.setCommonCd("013");
			List<CommonCodeVo> companyGubunList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//결제구분
			commonCodeVo.setCommonCd("014");
			List<CommonCodeVo> paymentInfoList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//거래상태
			commonCodeVo.setCommonCd("015");
			List<CommonCodeVo> dealCorpStatusList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//국내/해외
			commonCodeVo.setCommonCd("043");
			List<CommonCodeVo> abroadGubunList = commonCodeService.commonCodeDtlLstByCommonCd(commonCodeVo);
			//담당자 코드
			UserVo userVo = new UserVo();
			List<UserVo> userList = userService.userLst(userVo);
			//사업장
			WorkplaceVo workplaceVo = new WorkplaceVo(); 
			List<WorkplaceVo> workplaceList = workplaceService.workplaceLst(workplaceVo);
			
			JSONArray dealCorpTempIns_array = new JSONArray();
			DealCorpAdmVo checkVo = new DealCorpAdmVo();
			int duplicateNum = 0;
			for(int i=0;i<dealCorpList.size();i++) {
				checkVo.setDealCorpCd(dealCorpList.get(i).getDealCorpCd());
				if(dealCorpAdmService.dealCorpCdCheck(checkVo)==null) {
					JSONObject dealCorpTempData = new JSONObject();
					dealCorpTempData.put("DEAL_CORP_CD", dealCorpList.get(i).getDealCorpCd());
					dealCorpTempData.put("DEAL_CORP_NM", dealCorpList.get(i).getDealCorpNm());
					dealCorpTempData.put("INITIAL", dealCorpList.get(i).getInitial());
					dealCorpTempData.put("REPRESENTATIVE", dealCorpList.get(i).getRepresentative());
					dealCorpTempData.put("COMPANY_NUMBER", dealCorpList.get(i).getCompanyNumber());
					dealCorpTempData.put("MASTER_ITEM", dealCorpList.get(i).getMasterItem());
					dealCorpTempData.put("BUSINESS_STATUS", dealCorpList.get(i).getBusinessStatus());
					dealCorpTempData.put("PRODUCE_TYPE", dealCorpList.get(i).getProduceType());
					dealCorpTempData.put("POST_NUMBER", dealCorpList.get(i).getPostNumber());
					dealCorpTempData.put("ADDRESS_ADM", dealCorpList.get(i).getAddressAdm());
					dealCorpTempData.put("ADDRESS_DTL", dealCorpList.get(i).getAddressDtl());
					dealCorpTempData.put("DEAL_CORP_ADDRESS", dealCorpList.get(i).getDealCorpAddress());
					dealCorpTempData.put("PHONE_NUMBER", dealCorpList.get(i).getPhoneNumber());
					dealCorpTempData.put("FAX_NUMBER", dealCorpList.get(i).getFaxNumber());
					dealCorpTempData.put("SALES_MANAGER_NM", dealCorpList.get(i).getSalesManagerNm());
					dealCorpTempData.put("CHARGE_DEPARTMENT", dealCorpList.get(i).getChargeDepartment());
					dealCorpTempData.put("CHARGE_NAME", dealCorpList.get(i).getChargeName());
					dealCorpTempData.put("CHARGE_PHONE_NUMBER", dealCorpList.get(i).getChargePhoneNumber());
					dealCorpTempData.put("CHARGE_EMAIL", dealCorpList.get(i).getChargeEmail());
					dealCorpTempData.put("DEAL_CORP_DESC", dealCorpList.get(i).getDealCorpDesc());
					for(int d=0;d<dealGubunList.size();d++) {
						if(dealGubunList.get(d).getCommonNm().equals(dealCorpList.get(i).getDealGubun())) {
							dealCorpTempData.put("DEAL_GUBUN", dealGubunList.get(d).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("DEAL_GUBUN", "");
						}
					}
					for(int a=0;a<abroadGubunList.size();a++) {
						if(abroadGubunList.get(a).getCommonNm().equals(dealCorpList.get(i).getAbroadGubun())) {
							dealCorpTempData.put("ABROAD_GUBUN", abroadGubunList.get(a).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("ABROAD_GUBUN", "");
						}
					}
					for(int l=0;l<importantLevelList.size();l++) {
						if(importantLevelList.get(l).getCommonNm().equals(dealCorpList.get(i).getImportantLevel())) {
							dealCorpTempData.put("IMPORTANT_LEVEL", importantLevelList.get(l).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("IMPORTANT_LEVEL", "");
						}
					}
					for(int c=0;c<companyGubunList.size();c++) {
						if(companyGubunList.get(c).getCommonNm().equals(dealCorpList.get(i).getCompanyGubun())) {
							dealCorpTempData.put("COMPANY_GUBUN", companyGubunList.get(c).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("COMPANY_GUBUN", "");
						}
					}
					for(int u=0;u<userList.size();u++) {
						if(userList.get(u).getUserName().equals(dealCorpList.get(i).getSalesManagerNm())) {
							dealCorpTempData.put("SALES_MANAGER", userList.get(u).getIdx());
							break;
						} else {
							dealCorpTempData.put("SALES_MANAGER", "");
						}
					}
					for(int p=0;p<paymentInfoList.size();p++) {
						if(paymentInfoList.get(p).getCommonNm().equals(dealCorpList.get(i).getPaymentInfo())) {
							dealCorpTempData.put("PAYMENT_INFO", paymentInfoList.get(p).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("PAYMENT_INFO", "");
						}
					}
					for(int s=0;s<dealCorpStatusList.size();s++) {
						if(dealCorpStatusList.get(s).getCommonNm().equals(dealCorpList.get(i).getDealCorpStatus())) {
							dealCorpTempData.put("DEAL_CORP_STATUS", dealCorpStatusList.get(s).getCommonCd());
							break;
						} else {
							dealCorpTempData.put("DEAL_CORP_STATUS", "");
						}
					}
					for(int w=0;w<workplaceList.size();w++) {
						if(workplaceList.get(w).getWorkplaceNm().equals(dealCorpList.get(i).getWorkPlaceNm())) {
							dealCorpTempData.put("WORK_PLACE_IDX", workplaceList.get(w).getIdx());
							break;
						} else {
							dealCorpTempData.put("WORK_PLACE_IDX", "");
						}
					}
					dealCorpTempIns_array.add(dealCorpTempData);
				} else {
					duplicateNum++;
				}
			}
			DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo();
			dealCorpAdmVo.setInsertJson(dealCorpTempIns_array.toJSONString());
			dealCorpAdmVo.setRegIdx(Utils.getUserIdx());
			System.out.println(dealCorpAdmVo.getInsertJson());
			dealCorpAdmService.dealCorpTempIns(dealCorpAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", dealCorpList);
			jsonData.put("duplicateNum", duplicateNum);
		} catch(IOException e) {
			jsonData.put("result", "error");
			throw new RuntimeException(e);
		}
		
		return jsonData;
	}
}
