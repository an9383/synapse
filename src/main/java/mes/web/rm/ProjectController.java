package mes.web.rm;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringEscapeUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.pm.PurchaseOrderVo;
import mes.domain.rm.ProjectVo;
import mes.domain.sm.AlarmVo;
import mes.service.bm.ItemInfoAdmService;
import mes.service.pm.PurchaseOrderService;
import mes.service.rm.ProjectService;
import mes.service.sm.AlarmService;
import mes.web.ut.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ProjectController {
	
	@Inject
	private ProjectService projectService;
	
	@Value("${file.projectBomExcelUpload}") 
	private String filePath;
	
	@Inject
	private PurchaseOrderService purchaseOrderService;
	@Inject
	private ItemInfoAdmService itemInfoAdmService;
	@Inject
	private AlarmService alarmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	// rmsc0010 페이지 - 기구
	@RequestMapping(value = "/rm/rmsc0010", method = RequestMethod.GET)
	public ModelAndView rmsc0010(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0010");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/rm/rmsc0010");
		return mav;
	}
	
	// rmsc0020 페이지 - 광학
	@RequestMapping(value = "/rm/rmsc0020", method = RequestMethod.GET)
	public ModelAndView rmsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0020");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/rm/rmsc0020");
		return mav;
	}
	
	// rmsc0030 페이지 - 전장
	@RequestMapping(value = "/rm/rmsc0030", method = RequestMethod.GET)
	public ModelAndView rmsc0030(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0030");
		mav.addObject("userName", Utils.getUserNm());
		mav.addObject("userIdx", Utils.getUserIdx());
		mav.addObject("userDepartmentNm", Utils.getUserDepartmentNm());
		mav.setViewName("/rm/rmsc0030");
		return mav;
	}
	
	// rmsc0040 페이지 - 프로젝트별 표준원가 조회
	@RequestMapping(value = "/rm/rmsc0040", method = RequestMethod.GET)
	public ModelAndView rmsc0040(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0040");
		mav.setViewName("/rm/rmsc0040");
		return mav;
	}
	
	// rmsc0050 페이지 - 기구
	@RequestMapping(value = "/rm/rmsc0050", method = RequestMethod.GET)
	public ModelAndView rmsc0050(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0050");
		mav.setViewName("/rm/rmsc0050");
		return mav;
	}
	
	// rmsc0060 페이지 - 광학
	@RequestMapping(value = "/rm/rmsc0060", method = RequestMethod.GET)
	public ModelAndView rmsc0060(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0060");
		mav.setViewName("/rm/rmsc0060");
		return mav;
	}
	
	// rmsc0070 페이지 - 전장
	@RequestMapping(value = "/rm/rmsc0070", method = RequestMethod.GET)
	public ModelAndView rmsc0070(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0070");
		mav.setViewName("/rm/rmsc0070");
		return mav;
	}
	
	// rmsc0080 페이지 - 전장
	@RequestMapping(value = "/rm/rmsc0080", method = RequestMethod.GET)
	public ModelAndView rmsc0080(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /rm/rmsc0080");
		mav.setViewName("/rm/rmsc0080");
		return mav;
	}
	
	//project Bom 엑셀 업로드(기구)
	@RequestMapping(value= "/rm/projectBomMachineFileload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectBomMachineFileload(Model model,@RequestParam("excelfile") MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = filePath + "/machine";
			
			// 서버에서 저장 할 파일 이름
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
			
			logger.info("path : " + path);
			
			File Folder = new File(path);
			
			if (!Folder.exists()) {
				try{
				    Folder.mkdirs(); //폴더 생성합니다.
				    logger.info("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
		        	 logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " +path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path + "/" + saveFileName;
			logger.info(url);
			
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ProjectVo> projectBomList = excelReader.projectBomMachineFileload(url, logger);
			jsonData.put("data", projectBomList);
			JSONArray projectDtlTempIns_array = new JSONArray();
			for(int i=0;i<projectBomList.size();i++) {
				JSONObject projectDtlTempData = new JSONObject();
				projectDtlTempData.put("FILE_NAME", fileName);
				projectDtlTempData.put("IDX", Integer.toString(i+1));
				projectDtlTempData.put("MODULE_GUBUN", projectBomList.get(i).getModuleGubun());
				projectDtlTempData.put("MODULE_NAME", projectBomList.get(i).getModuleName());
				projectDtlTempData.put("ORDER_GUBUN", projectBomList.get(i).getOrderGubun());
				projectDtlTempData.put("POSITION_GUBUN", projectBomList.get(i).getPositionGubun());
				projectDtlTempData.put("PURCHASE_GUBUN", projectBomList.get(i).getPurchaseGubun());
				projectDtlTempData.put("PART_CD", projectBomList.get(i).getPartCd());
				projectDtlTempData.put("PART_GUBUN", projectBomList.get(i).getPartGubun());
				projectDtlTempData.put("PART_NM", projectBomList.get(i).getPartNm());
				projectDtlTempData.put("MATERIAL", projectBomList.get(i).getMaterial());
				projectDtlTempData.put("SURFACE_TREATMENT", projectBomList.get(i).getSurfaceTreatment());
				projectDtlTempData.put("PART_DC", projectBomList.get(i).getPartDc());
				projectDtlTempData.put("MAKER", projectBomList.get(i).getMaker());
				projectDtlTempData.put("NEED_QTY", projectBomList.get(i).getNeedQty());
				projectDtlTempData.put("INVENTORY_QTY", "0");
				projectDtlTempData.put("SUPPLIER", projectBomList.get(i).getSupplier());
				projectDtlTempData.put("REMARK", projectBomList.get(i).getRemark());
				projectDtlTempIns_array.add(projectDtlTempData);
			}
			ProjectVo projectVo = new ProjectVo();
			projectVo.setInsertJson(projectDtlTempIns_array.toJSONString());
			projectVo.setRegIdx(Utils.getUserIdx());
			projectService.projectDtlTempIns(projectVo);
			jsonData.put("fileName", fileName);
			jsonData.put("result", "ok");
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();
			jsonData.put("result", "error");
			throw new RuntimeException(e);
		}
		return jsonData;
	}
	
	//project Bom 엑셀 업로드(광학)
	@RequestMapping(value= "/rm/projectBomOpticsFileload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectBomOpticsFileload(Model model,@RequestParam("excelfile") MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = filePath + "/optics";
			
			// 서버에서 저장 할 파일 이름
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
			
			logger.info("path : " + path);
			
			File Folder = new File(path);
			
			if (!Folder.exists()) {
				try{
				    Folder.mkdirs(); //폴더 생성합니다.
				    logger.info("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
		        	 logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " +path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path + "/" + saveFileName;
			logger.info(url);
			
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ProjectVo> projectBomList = excelReader.projectBomOpticsFileload(url, logger);
			jsonData.put("data", projectBomList);
			JSONArray projectDtlTempIns_array = new JSONArray();
			for(int i=0;i<projectBomList.size();i++) {
				JSONObject projectDtlTempData = new JSONObject();
				projectDtlTempData.put("FILE_NAME", fileName);
				projectDtlTempData.put("IDX", Integer.toString(i+1));
				projectDtlTempData.put("MODULE_GUBUN", projectBomList.get(i).getModuleGubun());
				projectDtlTempData.put("MODULE_NAME", projectBomList.get(i).getModuleName());
				projectDtlTempData.put("ORDER_GUBUN", projectBomList.get(i).getOrderGubun());
				projectDtlTempData.put("POSITION_GUBUN", projectBomList.get(i).getPositionGubun());
				projectDtlTempData.put("PURCHASE_GUBUN", projectBomList.get(i).getPurchaseGubun());
				projectDtlTempData.put("PART_CD", projectBomList.get(i).getPartCd());
				projectDtlTempData.put("PART_GUBUN", projectBomList.get(i).getPartGubun());
				projectDtlTempData.put("PART_NM", projectBomList.get(i).getPartNm());
				projectDtlTempData.put("MATERIAL", projectBomList.get(i).getMaterial());
				projectDtlTempData.put("SURFACE_TREATMENT", projectBomList.get(i).getSurfaceTreatment());
				projectDtlTempData.put("PART_DC", projectBomList.get(i).getPartDc());
				projectDtlTempData.put("MAKER", projectBomList.get(i).getMaker());
				projectDtlTempData.put("NEED_QTY", projectBomList.get(i).getNeedQty());
				projectDtlTempData.put("ORDER_QTY", projectBomList.get(i).getOrderQty());
				projectDtlTempData.put("INVENTORY_QTY", "0");
				projectDtlTempData.put("SUPPLIER", projectBomList.get(i).getSupplier());
				projectDtlTempData.put("REMARK", projectBomList.get(i).getRemark());
				projectDtlTempIns_array.add(projectDtlTempData);
			}
			ProjectVo projectVo = new ProjectVo();
			projectVo.setInsertJson(projectDtlTempIns_array.toJSONString());
			projectVo.setRegIdx(Utils.getUserIdx());
			projectService.projectDtlTempIns(projectVo);
			jsonData.put("fileName", fileName);
			jsonData.put("result", "ok");
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			jsonData.put("result", "error");
			throw new RuntimeException(e);
		}
		return jsonData;
	}
	
	//project Bom 엑셀 업로드(전장)
	@RequestMapping(value= "/rm/projectBomElectronicsFileload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectBomElectronicsFileload(Model model,@RequestParam("excelfile") MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = filePath + "/electronics";
			
			// 서버에서 저장 할 파일 이름
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
			
			logger.info("path : " + path);
			
			File Folder = new File(path);
			
			if (!Folder.exists()) {
				try{
				    Folder.mkdirs(); //폴더 생성합니다.
				    logger.info("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
		        	 logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " +path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path + "/" + saveFileName;
			logger.info(url);
			
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ProjectVo> projectBomList = excelReader.projectBomElectronicsFileload(url, logger);
			jsonData.put("data", projectBomList);
			JSONArray projectDtlTempIns_array = new JSONArray();
			for(int i=0;i<projectBomList.size();i++) {
				JSONObject projectDtlTempData = new JSONObject();
				projectDtlTempData.put("FILE_NAME", fileName);
				projectDtlTempData.put("IDX", Integer.toString(i+1));
				projectDtlTempData.put("MODULE_GUBUN", projectBomList.get(i).getModuleGubun());
				projectDtlTempData.put("MODULE_NAME", projectBomList.get(i).getModuleName());
				projectDtlTempData.put("ORDER_GUBUN", projectBomList.get(i).getOrderGubun());
				projectDtlTempData.put("POSITION_GUBUN", projectBomList.get(i).getPositionGubun());
				projectDtlTempData.put("PURCHASE_GUBUN", projectBomList.get(i).getPurchaseGubun());
				projectDtlTempData.put("PART_CD", projectBomList.get(i).getPartCd());
				projectDtlTempData.put("PART_GUBUN", projectBomList.get(i).getPartGubun());
				projectDtlTempData.put("PART_NM", projectBomList.get(i).getPartNm());
				projectDtlTempData.put("PURPOSE", projectBomList.get(i).getPurpose());
				projectDtlTempData.put("SURFACE_TREATMENT", projectBomList.get(i).getSurfaceTreatment());
				projectDtlTempData.put("PART_DC", projectBomList.get(i).getPartDc());
				projectDtlTempData.put("MAKER", projectBomList.get(i).getMaker());
				projectDtlTempData.put("NEED_QTY", projectBomList.get(i).getNeedQty());
				projectDtlTempData.put("ORDER_QTY", projectBomList.get(i).getOrderQty());
				projectDtlTempData.put("INVENTORY_QTY", "0");
				projectDtlTempData.put("SUPPLIER", projectBomList.get(i).getSupplier());
				projectDtlTempData.put("REMARK", projectBomList.get(i).getRemark());
				projectDtlTempIns_array.add(projectDtlTempData);
			}
			ProjectVo projectVo = new ProjectVo();
			projectVo.setInsertJson(projectDtlTempIns_array.toJSONString());
			projectVo.setRegIdx(Utils.getUserIdx());
			projectService.projectDtlTempIns(projectVo);
			jsonData.put("fileName", fileName);
			jsonData.put("result", "ok");
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			jsonData.put("result", "error");
			throw new RuntimeException(e);
		}
		return jsonData;
	}
	
	// PROJECT ADM 조회
	@RequestMapping(value = "/rm/projectAdmLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectAdmLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectAdmLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT EXCEL 등록
	@RequestMapping(value = "/rm/projectExcelIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlExcelIns(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			projectVo.setRegIdx(Utils.getUserIdx());
			projectService.projectAdmIns(projectVo);
			projectService.projectDtlExcelIns(projectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT BOM 목록조회
	@RequestMapping(value = "/rm/projectDtlLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bizOrderAdmLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			if(projectVo.getStatus().equals("001")) {
				List<ProjectVo> projectDtlList = projectService.projectDtlLst(projectVo);
				jsonData.put("data", projectDtlList);
			} else {
				List<ProjectVo> projectDtlList = projectService.projectDtlTempLst(projectVo);
				jsonData.put("data", projectDtlList);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT SHEET NAME 리스트 조회
	@RequestMapping(value = "/rm/projectSheetNameLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectSheetNameLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			String sheetNameLst = projectService.projectSheetNameLst(projectVo);
			//인코딩된 html 엔티티 디코딩 처리
			sheetNameLst = StringEscapeUtils.unescapeHtml(sheetNameLst);
			jsonData.put("data", sheetNameLst);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// bom설계 수정
	@RequestMapping(value = "rm/projectUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockAdjustAdmUpd(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			int orderIdx = 1;
			jsonObj.put(0, dataArray.get(0));
			JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			projectVo = new ProjectVo();
			projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
			String groupIdx = projectService.projectDtlOrderGroupIdx(projectVo);
			JSONArray projectDtlOrderIns_array = new JSONArray();
			
			//현재고 및 선점수량 체크로직
			//제품정보 ( 현재고, 선점 컬럼 불러오는 부분 )
			ItemInfoAdmVo itemInfoAdmVo = new ItemInfoAdmVo();
			itemInfoAdmVo.setIndividualYn("A");
			//비교
			List<JSONObject> jsonObjectList = new ArrayList<>();
			for(int i = 0; i < dataArray.size(); i++ ) {
				jsonObjectList.add((JSONObject) dataArray.get(i));
			}
			final List<ItemInfoAdmVo> itemList  = itemInfoAdmService.itemInfoAdmLst(itemInfoAdmVo); //TODO 속도, 데이터양(품목이 많이 등록되어지는 경우)때매 문제될 경우 필요한 제품만 불러오는 방식으로 변경
			List<JSONObject> jsonObjectFilterList = jsonObjectList.stream()
																	.filter(obj -> {
																		String partCd = obj.get("partCd").toString();
																		List<ItemInfoAdmVo> matchingItems = itemList.stream()
																						                            .filter(item -> item.getItemCd().equals(partCd))
																						                            .collect(Collectors.toList());
																		
																		return matchingItems.stream()
																						.anyMatch(item -> {
																							int orderQty = Integer.parseInt(obj.get("orderQty").toString());
																							int preemptiveQty = Integer.parseInt(obj.get("preemptiveQty").toString());
																							int bomQtySum = orderQty + preemptiveQty;
																							
																							int itemStockQty = Integer.parseInt(item.getStockQty());
																							int itemPreemptiveQty = Integer.parseInt(item.getPreemptiveQty());
																							int availableStockQty = itemStockQty - itemPreemptiveQty;
																							return bomQtySum > availableStockQty;
																						});
																	})
																	.collect(Collectors.toList());
											
			if( jsonObjectFilterList.size() > 0 ) {
				jsonData.put("result", "fail");
				jsonData.put("message", "현재고 수량이 부족한 품목이<br>있습니다. 재 조회 후 시도해주세요.");
				return jsonData;
			}
			if(jsonObject.get("inputGubun").toString().equals("001")) {
				for(int i=0;i<dataArray.size();i++) {
		        	jsonObj.put(i, dataArray.get(i));
		    		jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
		    		
		    		projectVo = new ProjectVo();
		    		projectVo.setUserIdx(jsonObject.get("userIdx").toString());
		    		projectVo.setChangeReason(jsonObject.get("changeReason").toString());
		    		projectVo.setUpdIdx(Utils.getUserIdx());
		    		if(jsonObject.get("idx").toString().equals("x")) {
		    			break;
		    		}
		    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
		    		projectVo.setIdx(jsonObject.get("idx").toString());
		    		projectVo.setOrderGubun(jsonObject.get("orderGubun").toString());
		    		projectVo.setPurchaseGubun(jsonObject.get("purchaseGubun").toString());
		    		projectVo.setPartCd(jsonObject.get("partCd").toString());
		    		projectVo.setPartNm(jsonObject.get("partNm").toString());
		    		projectVo.setMaterial(jsonObject.get("material").toString());
		    		projectVo.setSurfaceTreatment(jsonObject.get("surfaceTreatment").toString());
		    		projectVo.setPartDc(jsonObject.get("partDc").toString());
		    		projectVo.setMaker(jsonObject.get("maker").toString());
		    		projectVo.setNeedQty(jsonObject.get("needQty").toString());
		    		//projectVo.setInventoryQty(jsonObject.get("inventoryQty").toString());
		    		projectVo.setRemark(jsonObject.get("remark").toString());
		    		
		    		if(!jsonObject.get("orderDate").toString().equals("") && !jsonObject.get("orderQty").toString().equals("") && !jsonObject.get("orderQty").toString().equals("0")) {
		    			JSONObject projectDtlOrderData = new JSONObject();
		    			projectDtlOrderData.put("PROJECT_IDX", jsonObject.get("projectIdx").toString());
		    			projectDtlOrderData.put("PROJECT_DTL_IDX", jsonObject.get("idx").toString());
		    			projectDtlOrderData.put("GROUP_IDX", groupIdx);
		    			projectDtlOrderData.put("IDX", Integer.toString(orderIdx));
		    			projectDtlOrderData.put("ORDER_DATE", jsonObject.get("orderDate").toString());
		    			projectDtlOrderData.put("ORDER_QTY", jsonObject.get("orderQty").toString());
		    			projectDtlOrderData.put("PREEMPTIVE_QTY", jsonObject.get("preemptiveQty").toString());
		    			String partCd = jsonObject.get("partCd").toString();
		    			 
		    			List<ItemInfoAdmVo> matchingItems = itemList.stream()
												                    .filter(item -> item.getItemCd().equals(partCd))
												                    .collect(Collectors.toList());
		    			//item_cd로 검색시 무조건 하나나옴 PK라서
		    			int updatePreemptiveQty = Integer.parseInt(matchingItems.get(0).getPreemptiveQty()) + Integer.parseInt(jsonObject.get("preemptiveQty").toString());
		    			projectDtlOrderData.put("UPDATE_PREEMPTIVE_QTY", Integer.toString(updatePreemptiveQty) );		    			
		    			projectDtlOrderData.put("ITEM_CD", partCd);
		    			projectDtlOrderData.put("REG_IDX", Utils.getUserIdx());
		    			projectDtlOrderData.put("REMARK", jsonObject.get("orderRemark").toString());
		    			projectDtlOrderIns_array.add(projectDtlOrderData);
		    			orderIdx++;
		    		}
		    		//디테일 수정
			        projectService.projectDtlUpd(projectVo);
		        }
			} else if(jsonObject.get("inputGubun").toString().equals("002")) {
				for(int i=0;i<dataArray.size();i++) {
		        	jsonObj.put(i, dataArray.get(i));
		    		jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
		    		
		    		projectVo = new ProjectVo();
		    		projectVo.setUserIdx(jsonObject.get("userIdx").toString());
		    		projectVo.setChangeReason(jsonObject.get("changeReason").toString());
		    		projectVo.setUpdIdx(Utils.getUserIdx());
		    		if(jsonObject.get("idx").toString().equals("x")) {
		    			break;
		    		}
		    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
		    		projectVo.setIdx(jsonObject.get("idx").toString());
		    		projectVo.setOrderGubun(jsonObject.get("orderGubun").toString());
		    		projectVo.setPurchaseGubun(jsonObject.get("purchaseGubun").toString());
		    		projectVo.setPositionGubun(jsonObject.get("positionGubun").toString());
		    		projectVo.setPartCd(jsonObject.get("partCd").toString());
		    		projectVo.setPartNm(jsonObject.get("partNm").toString());
		    		projectVo.setSurfaceTreatment(jsonObject.get("surfaceTreatment").toString());
		    		projectVo.setPartDc(jsonObject.get("partDc").toString());
		    		projectVo.setMaker(jsonObject.get("maker").toString());
		    		projectVo.setNeedQty(jsonObject.get("needQty").toString());
		    		//projectVo.setInventoryQty(jsonObject.get("inventoryQty").toString());
		    		projectVo.setSupplier(jsonObject.get("supplier").toString());
		    		projectVo.setRemark(jsonObject.get("remark").toString());
		    		
		    		if(!jsonObject.get("orderDate").toString().equals("") && !jsonObject.get("orderQty").toString().equals("")) {
		    			JSONObject projectDtlOrderData = new JSONObject();
		    			projectDtlOrderData.put("PROJECT_IDX", jsonObject.get("projectIdx").toString());
		    			projectDtlOrderData.put("PROJECT_DTL_IDX", jsonObject.get("idx").toString());
		    			projectDtlOrderData.put("GROUP_IDX", groupIdx);
		    			projectDtlOrderData.put("IDX", Integer.toString(orderIdx));
		    			projectDtlOrderData.put("ORDER_DATE", jsonObject.get("orderDate").toString());
		    			projectDtlOrderData.put("ORDER_QTY", jsonObject.get("orderQty").toString());
		    			projectDtlOrderData.put("PREEMPTIVE_QTY", jsonObject.get("preemptiveQty").toString());
		    			String partCd = jsonObject.get("partCd").toString();
		    			 
		    			List<ItemInfoAdmVo> matchingItems = itemList.stream()
												                    .filter(item -> item.getItemCd().equals(partCd))
												                    .collect(Collectors.toList());
		    			//item_cd로 검색시 무조건 하나나옴 PK라서
		    			int updatePreemptiveQty = Integer.parseInt(matchingItems.get(0).getPreemptiveQty()) + Integer.parseInt(jsonObject.get("preemptiveQty").toString());
		    			projectDtlOrderData.put("UPDATE_PREEMPTIVE_QTY", Integer.toString(updatePreemptiveQty) );		    			
		    			projectDtlOrderData.put("ITEM_CD", partCd);
		    			projectDtlOrderData.put("REG_IDX", Utils.getUserIdx());
		    			projectDtlOrderData.put("REMARK", jsonObject.get("orderRemark").toString());
		    			projectDtlOrderIns_array.add(projectDtlOrderData);
		    			orderIdx++;
		    		}
		    		//디테일 수정
			        projectService.projectDtlUpd(projectVo);
		        }
			} else if(jsonObject.get("inputGubun").toString().equals("003")) {
				for(int i=0;i<dataArray.size();i++) {
		        	jsonObj.put(i, dataArray.get(i));
		    		jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
		    		
		    		projectVo = new ProjectVo();
		    		projectVo.setUserIdx(jsonObject.get("userIdx").toString());
		    		projectVo.setChangeReason(jsonObject.get("changeReason").toString());
		    		projectVo.setUpdIdx(Utils.getUserIdx());
		    		if(jsonObject.get("idx").toString().equals("x")) {
		    			break;
		    		}
		    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
		    		projectVo.setIdx(jsonObject.get("idx").toString());
		    		projectVo.setOrderGubun(jsonObject.get("orderGubun").toString());
		    		projectVo.setPositionGubun(jsonObject.get("positionGubun").toString());
		    		projectVo.setPurchaseGubun(jsonObject.get("purchaseGubun").toString());
		    		
		    		projectVo.setPartCd(jsonObject.get("partCd").toString());
		    		projectVo.setPartNm(jsonObject.get("partNm").toString());
		    		projectVo.setPurpose(jsonObject.get("purpose").toString().replaceAll("'", "''"));
		    		projectVo.setSurfaceTreatment(jsonObject.get("surfaceTreatment").toString().replaceAll("'", "''"));
		    		projectVo.setPartDc(jsonObject.get("partDc").toString().replaceAll("'", "''"));
		    		projectVo.setMaker(jsonObject.get("maker").toString().replaceAll("'", "''"));
		    		projectVo.setNeedQty(jsonObject.get("needQty").toString());
		    		//projectVo.setInventoryQty(jsonObject.get("inventoryQty").toString());
		    		projectVo.setSupplier(jsonObject.get("supplier").toString());
		    		projectVo.setRemark(jsonObject.get("remark").toString());
		    		
		    		if(!jsonObject.get("orderDate").toString().equals("") && !jsonObject.get("orderQty").toString().equals("")) {
		    			JSONObject projectDtlOrderData = new JSONObject();
		    			projectDtlOrderData.put("PROJECT_IDX", jsonObject.get("projectIdx").toString());
		    			projectDtlOrderData.put("PROJECT_DTL_IDX", jsonObject.get("idx").toString());
		    			projectDtlOrderData.put("GROUP_IDX", groupIdx);
		    			projectDtlOrderData.put("IDX", Integer.toString(orderIdx));
		    			projectDtlOrderData.put("ORDER_DATE", jsonObject.get("orderDate").toString());
		    			projectDtlOrderData.put("ORDER_QTY", jsonObject.get("orderQty").toString());
		    			projectDtlOrderData.put("PREEMPTIVE_QTY", jsonObject.get("preemptiveQty").toString());
		    			String partCd = jsonObject.get("partCd").toString();
		    			 
		    			List<ItemInfoAdmVo> matchingItems = itemList.stream()
												                    .filter(item -> item.getItemCd().equals(partCd))
												                    .collect(Collectors.toList());
		    			//item_cd로 검색시 무조건 하나나옴 PK라서
		    			int updatePreemptiveQty = Integer.parseInt(matchingItems.get(0).getPreemptiveQty()) + Integer.parseInt(jsonObject.get("preemptiveQty").toString());
		    			projectDtlOrderData.put("UPDATE_PREEMPTIVE_QTY", Integer.toString(updatePreemptiveQty) );		    			
		    			projectDtlOrderData.put("ITEM_CD", partCd);
		    			projectDtlOrderData.put("REG_IDX", Utils.getUserIdx());
		    			projectDtlOrderData.put("REMARK", jsonObject.get("orderRemark").toString());
		    			projectDtlOrderIns_array.add(projectDtlOrderData);
		    			orderIdx++;
		    		}
		    		//디테일 수정
			        projectService.projectDtlUpd(projectVo);
		        }
			}
			
	        projectVo = new ProjectVo();
	        jsonObj.put(0, dataArray.get(0));
	        jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
	        projectVo.setIdx(jsonObject.get("projectIdx").toString());
    		projectVo.setUserIdx(jsonObject.get("userIdx").toString());
    		projectVo.setChangeReason(jsonObject.get("changeReason").toString());
    		projectVo.setUpdIdx(Utils.getUserIdx());
    		projectVo.setVersion("0");
	        //마스터 수정
	        projectService.projectAdmUpd(projectVo);
	        
	        if(orderIdx>1) {
	        	projectVo = new ProjectVo();
				projectVo.setInsertJson(projectDtlOrderIns_array.toJSONString());
				projectVo.setRegIdx(Utils.getUserIdx());
				projectService.projectDtlOrderIns(projectVo);
				
				//선점재고수량 제품정보 업데이트
				itemInfoAdmVo.setUpdIdx(Utils.getUserId()); 
				itemInfoAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
				itemInfoAdmVo.setStockUpdateJson(projectDtlOrderIns_array.toJSONString());
				
				itemInfoAdmService.itemInfoAdmStockUpd(itemInfoAdmVo);
	        }
	        
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 요청현황 조회
	@RequestMapping(value = "/rm/projectDtlOrderLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectDtlOrderLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if(projectVo.getProjectCd().equals("")) {
				projectVo.setProjectCd(null);
			}
			if(projectVo.getVersion().equals("")) {
				projectVo.setVersion(null);
			}
			List <ProjectVo> projectVoList = projectService.projectDtlOrderLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//프로젝트 요청 수정
	@RequestMapping(value = "rm/projectDtlOrderUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlOrderUpd(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			JSONArray projectDtlOrderIns_array = new JSONArray();
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	projectVo = new ProjectVo();
	    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		projectVo.setProjectDtlIdx(jsonObject.get("projectDtlIdx").toString());
	    		projectVo.setGroupIdx(jsonObject.get("groupIdx").toString());
	    		projectVo.setIdx(jsonObject.get("idx").toString());
	    		projectVo.setUpdIdx(Utils.getUserIdx());
	        	if(jsonObject.get("designApprovalYn") != null){
	        		projectVo.setDesignApprovalYn(jsonObject.get("designApprovalYn").toString());
	        		projectService.projectDtlOrderUpd(projectVo);
	        	}else {
	        		if(jsonObject.get("remark") != null) {
	        			projectVo.setRemark(jsonObject.get("remark").toString());
	        		}
		    		projectVo.setOrderDate(jsonObject.get("orderDate").toString());
		    		projectVo.setOrderQty(jsonObject.get("orderQty").toString());
		    		projectVo.setPreemptiveQty(jsonObject.get("preemptiveQty").toString());
			        projectService.projectDtlOrderUpd(projectVo);
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
	
	//프로젝트 요청 승인처리
	@RequestMapping(value = "rm/projectDtlOrderApproval001Upd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlOrderApproval001Upd(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			JSONArray projectDtlOrderIns_array = new JSONArray();
			
			
			int seq = 1;
			String orderNo = purchaseOrderService.purchaseOrderAdmGetOrderNo();
			List<PurchaseOrderVo> purchaseOrderVoInsertList = new ArrayList<>();
			List<PurchaseOrderVo> purchaseOrderVoUpdateList = new ArrayList<>();
			
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	projectVo = new ProjectVo();
	    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		projectVo.setProjectDtlIdx(jsonObject.get("projectDtlIdx").toString());
	    		projectVo.setGroupIdx(jsonObject.get("groupIdx").toString());
	    		projectVo.setIdx(jsonObject.get("idx").toString());
	    		projectVo.setApprovalYn("001");
	    		projectVo.setUpdIdx(Utils.getUserIdx());
		        projectService.projectDtlOrderUpd(projectVo);
		        
		        PurchaseOrderVo purchaseOrderVo = new PurchaseOrderVo();
		        purchaseOrderVo.setOrderUserIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setProjectCd(jsonObject.get("projectCd").toString());
	    		purchaseOrderVo.setRequestDate(jsonObject.get("orderDate").toString());
	    		purchaseOrderVo.setStatus("001");
	    		
	    		purchaseOrderVo.setRequestGubun(jsonObject.get("requestGubun").toString());
	    		purchaseOrderVo.setBuyReason(jsonObject.get("purchaseGubun").toString());
	    		
	    		purchaseOrderVo.setItemCd(jsonObject.get("partCd").toString());
	    		purchaseOrderVo.setMaker(jsonObject.get("maker").toString());
	    		purchaseOrderVo.setVersion(jsonObject.get("version").toString());
	    		purchaseOrderVo.setOrderDate(jsonObject.get("orderDate").toString());
	    		purchaseOrderVo.setOrderQty(jsonObject.get("orderQty").toString());
	    		purchaseOrderVo.setInputGubun("B");
	    		purchaseOrderVo.setBomGubun(jsonObject.get("bomGubun").toString());
	    		purchaseOrderVo.setBomOrderGubun(jsonObject.get("orderGubun").toString());
	    		purchaseOrderVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		purchaseOrderVo.setProjectDtlIdx(jsonObject.get("projectDtlIdx").toString());
	    		purchaseOrderVo.setGroupIdx(jsonObject.get("groupIdx").toString());
	    		purchaseOrderVo.setIdx(jsonObject.get("idx").toString());
	    		
	    		
	    		purchaseOrderVo.setRegIdx(Utils.getUserIdx());
	    		purchaseOrderVo.setRegDate(DateUtil.getCurrentDateTime());
	    		String orderSeq;
	    		if(Integer.toString(seq).length()==1) {
	    			orderSeq = "0000"+Integer.toString(seq);
	    		} else if(Integer.toString(seq).length()==2) {
	    			orderSeq = "000"+Integer.toString(seq);
	    		} else if(Integer.toString(seq).length()==3) {
	    			orderSeq = "00"+Integer.toString(seq);
	    		} else if(Integer.toString(seq).length()==4) {
	    			orderSeq = "0"+Integer.toString(seq);
	    		} else {
	    			orderSeq = Integer.toString(seq);
	    		}
	    		purchaseOrderVo.setOrderNo(orderNo + "-" + orderSeq);
    			purchaseOrderVoInsertList.add(purchaseOrderVo);	
    			seq++;
    			
	        }
			for(int i=0;i<purchaseOrderVoInsertList.size();i++) {
        		purchaseOrderService.purchaseOrderAdmIns(purchaseOrderVoInsertList.get(i));
	        }
			
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트 요청 승인 취소
	@RequestMapping(value = "rm/projectDtlOrderApproval002Upd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlOrderApproval002Upd(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			JSONArray projectDtlOrderIns_array = new JSONArray();
			
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	projectVo = new ProjectVo();
	    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		projectVo.setProjectDtlIdx(jsonObject.get("projectDtlIdx").toString());
	    		projectVo.setGroupIdx(jsonObject.get("groupIdx").toString());
	    		projectVo.setIdx(jsonObject.get("idx").toString());
	    		projectVo.setUpdIdx(Utils.getUserIdx());
	    		projectService.projectDtlOrderApproval002Upd(projectVo);
	        }

			
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//프로젝트 요청 삭제
	@RequestMapping(value = "rm/projectDtlOrderDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlOrderDel(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			JSONArray projectDtlOrderIns_array = new JSONArray();
			
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	projectVo = new ProjectVo();
	    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		projectVo.setProjectDtlIdx(jsonObject.get("projectDtlIdx").toString());
	    		projectVo.setGroupIdx(jsonObject.get("groupIdx").toString());
	    		projectVo.setIdx(jsonObject.get("idx").toString());
	    		projectService.projectDtlOrderDel(projectVo);
	        }
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	// 프로젝트별 표준원가 조회
	@RequestMapping(value = "/rm/projectTotalLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectTotalLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("발주관리 메인 목록조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectTotalLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT FILE 조회
	@RequestMapping(value = "/rm/projectFileLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectFileLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("PROJECT FILE 조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectFileLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// PROJECT FILE 등록
	@RequestMapping(value = "rm/projectFileInsUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectFileInsUpd(@RequestBody List<Map<String, Object>> projectFileList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			ProjectVo projectVo = new ProjectVo();				
			int managerIdx = 1;
			logger.info("data : " + projectFileList.size());
			logger.info("data : " + projectFileList);
			for(Map<String, Object> m : projectFileList) {
				projectVo.setBizOrdProjectIdx(projectFileList.get(0).get("bizOrdProjectIdx").toString());
				projectVo.setInputGubun(m.get("inputGubun").toString());
				projectVo.setDocumentNm(m.get("documentNm").toString());
				projectVo.setUserIdx(m.get("userIdx").toString());
				projectVo.setUuid(m.get("uuid").toString());
				projectVo.setFileName(m.get("fileName").toString());
				projectVo.setFileExt(m.get("fileExt").toString());
				projectVo.setFileDesc(m.get("fileDesc").toString());
				projectVo.setCheckUserIdx(m.get("checkUserIdx").toString());
				projectVo.setCheckDepartmentCd(m.get("checkDepartmentCd").toString());
				projectVo.setRegIdx(Utils.getUserIdx());
				projectVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx")!=null) {
					projectVo.setIdx(m.get("idx").toString());
					projectService.projectFileUpd(projectVo);
					AlarmVo alarmVo = new AlarmVo();
					alarmVo.setHappenTime(DateUtil.getYyyymmddHHmm());
					System.out.println("알람 발생 시간 : " + alarmVo.getHappenTime());
					alarmVo.setCunnectIdx1(m.get("idx").toString());
					alarmVo.setModuleCd(m.get("moduleCd").toString());
					alarmVo.setRegIdx(Utils.getUserIdx());
					alarmVo.setUpdIdx(Utils.getUserIdx());
					alarmService.alarmAdmIU(alarmVo);
				} else {
					String idx = projectService.projectFileIns(projectVo);
					AlarmVo alarmVo = new AlarmVo();
					alarmVo.setHappenTime(DateUtil.getYyyymmddHHmm());
					System.out.println("알람 발생 시간 : " + alarmVo.getHappenTime());
					alarmVo.setCunnectIdx1(idx);
					alarmVo.setModuleCd(m.get("moduleCd").toString());
					alarmVo.setRegIdx(Utils.getUserIdx());
					alarmVo.setUpdIdx(Utils.getUserIdx());
					alarmService.alarmAdmIU(alarmVo);
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
	@RequestMapping(value = "rm/projectFileDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectFileDel(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 삭제");
		try {
			projectService.projectFileDel(projectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 이미지 조회
	@RequestMapping(value = "/rm/projectImageLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectImageLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 이미지 조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectImageLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 이미지 등록
	@RequestMapping(value = "rm/projectImageInsUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectImageInsUpd(@RequestBody List<Map<String, Object>> projectFileList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			ProjectVo projectVo = new ProjectVo();				
			for(Map<String, Object> m : projectFileList) {
				projectVo.setProjectIdx(projectFileList.get(0).get("projectIdx").toString());
				projectVo.setProjectDtlIdx(m.get("projectDtlIdx").toString());
				projectVo.setProjectDesc(m.get("projectDesc").toString());
				projectVo.setProjectImage(m.get("projectImage").toString());
				projectVo.setRegIdx(Utils.getUserIdx());
				projectVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx")!=null) {
					projectVo.setIdx(m.get("idx").toString());
					projectService.projectImageUpd(projectVo);
				} else {
					projectService.projectImageIns(projectVo);
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
	
	// 프로젝트 이미지 삭제
	@RequestMapping(value = "rm/projectImageDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectImageDel(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 이미지 삭제");
		try {
			projectService.projectImageDel(projectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 이미지가 저장된 품번 리스트 조회
	@RequestMapping(value = "/rm/projectImagePartNoLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectImagePartNoLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 이미지 품번 조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectImagePartNoLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 문서 조회
	@RequestMapping(value = "/rm/projectDocumentLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> projectDocumentLst(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 문서 조회");
		try {
			List <ProjectVo> projectVoList = projectService.projectDocumentLst(projectVo);
			jsonData.put("data", projectVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 문서 등록
	@RequestMapping(value = "rm/projectDocumentInsUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDocumentInsUpd(@RequestBody List<Map<String, Object>> projectDocumentList) throws Exception {
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			ProjectVo projectVo = new ProjectVo();				
			for(Map<String, Object> m : projectDocumentList) {
				projectVo.setProjectIdx(projectDocumentList.get(0).get("projectIdx").toString());
				projectVo.setProjectDtlIdx(projectDocumentList.get(0).get("projectDtlIdx").toString());
				projectVo.setDocumentNm(m.get("documentNm").toString());
				projectVo.setUserIdx(m.get("userIdx").toString());
				projectVo.setUuid(m.get("uuid").toString());
				projectVo.setFileName(m.get("fileName").toString());
				projectVo.setFileExt(m.get("fileExt").toString());
				projectVo.setDocumentDesc(m.get("documentDesc").toString());
				projectVo.setRegIdx(Utils.getUserIdx());
				projectVo.setUpdIdx(Utils.getUserIdx());
				if(m.get("idx")!=null) {
					projectVo.setIdx(m.get("idx").toString());
					projectService.projectDocumentUpd(projectVo);
				} else {
					projectService.projectDocumentIns(projectVo);
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
	
	// 프로젝트 문서 삭제
	@RequestMapping(value = "rm/projectDocumentDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDocumentDel(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 문서 삭제");
		try {
			projectService.projectDocumentDel(projectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 초기재고/재고조정 수정
	@RequestMapping(value = "rm/newItemIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> newItemIns(ProjectVo projectVo,
																@RequestParam(value="jsonArray", required=false) String jsonArray) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("초기재고/재고조정 수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray dataArray = (JSONArray) jsonParser.parse(jsonArray);
			JSONObject jsonObj = new JSONObject();
			projectVo = new ProjectVo();
			JSONArray projectDtlOrderIns_array = new JSONArray();
			for(int i=0;i<dataArray.size();i++) {
	        	jsonObj.put(i, dataArray.get(i));
	        	JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
	        	
	        	ItemInfoAdmVo itemInfoAdmCd = new ItemInfoAdmVo();
		        itemInfoAdmCd.setItemCd(jsonObject.get("itemCd").toString());
		        itemInfoAdmCd = itemInfoAdmService.itemInfoAdmGetCd(itemInfoAdmCd);
		        String itemCdSeq = itemInfoAdmCd.getItemCd();
		        
	    		projectVo = new ProjectVo();
	    		projectVo.setUpdIdx(Utils.getUserIdx());
	    		projectVo.setProjectIdx(jsonObject.get("projectIdx").toString());
	    		projectVo.setIdx(jsonObject.get("projectDtlIdx").toString());
	    		projectVo.setPartCd(itemCdSeq);
	    		//디테일 수정
		        projectService.projectDtlUpd(projectVo);
		        
		        ItemInfoAdmVo itemInfoAdmVo = new ItemInfoAdmVo();
		        
		        itemInfoAdmVo.setItemCd(itemCdSeq);
		        itemInfoAdmVo.setItemNm("");
		        itemInfoAdmVo.setErpCd("");
		        itemInfoAdmVo.setMaker("");
		        itemInfoAdmVo.setItemDc("");
		        itemInfoAdmVo.setUnitDc("");
		        itemInfoAdmVo.setDealCorpCd("");
		        itemInfoAdmVo.setUseYn("001");
		        itemInfoAdmVo.setItemGubunIdx(jsonObject.get("itemGubunIdx").toString());
		        itemInfoAdmVo.setItemGubun(jsonObject.get("itemGubun").toString());
		        itemInfoAdmVo.setItemGubun1Idx(jsonObject.get("itemGubun1Idx").toString());
		        itemInfoAdmVo.setItemGubun1(jsonObject.get("itemGubun1").toString());
		        itemInfoAdmVo.setItemGubun2Idx(jsonObject.get("itemGubun2Idx").toString());
		        itemInfoAdmVo.setItemGubun2(jsonObject.get("itemGubun2").toString());
		        itemInfoAdmVo.setIndividualYn("N");
		        itemInfoAdmVo.setSafetyStock("0");
		        itemInfoAdmVo.setItemDesc("");
		        itemInfoAdmVo.setItemImage("");
		        itemInfoAdmVo.setItemImage2("");
		        itemInfoAdmVo.setItemImage3("");
		        itemInfoAdmVo.setInspectYn("002");
		        itemInfoAdmVo.setRegIdx(Utils.getUserIdx());
		        itemInfoAdmVo.setRegDate(DateUtil.getCurrentDateTime());
		        itemInfoAdmService.itemInfoAdmIns(itemInfoAdmVo);
	        }
	        
	        jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 프로젝트 특이사항 수정
	@RequestMapping(value = "rm/projectDtlOrderRemarkUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> projectDtlOrderRemarkUpd(ProjectVo projectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("프로젝트 특이사항 수정");
		try {
			projectVo.setUpdIdx(Utils.getUserIdx());
			projectService.projectDtlOrderRemarkUpd(projectVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

}
