package mes.web.em;

import java.util.ArrayList;
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

import mes.domain.em.EquipInfoVo;
import mes.domain.em.EquipRepairHistAdmVo;
import mes.service.em.EquipInfoService;
import mes.service.em.EquipRepairHistAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping("/")
public class EquipRepairHistAdmController {
	
	@Inject
	private EquipRepairHistAdmService equipRepairHistAdmService;
	
	@Inject
	private EquipInfoService equipInfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(EquipRepairHistAdmController.class);
	
	// emsc0020
	@RequestMapping(value = "/em/emsc0020", method = RequestMethod.GET)
	public ModelAndView emsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : /em/emsc0020");
		mav.setViewName("/em/emsc0020");
		return mav;
	}
	
	// 설비수리이력 목록조회
	@RequestMapping(value = "em/equipRepairHistAdmListAll", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRepairHistAdmListAll(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> equipRepairHistAdmList = equipRepairHistAdmService.equipRepairHistAdmListAll(equipRepairHistAdmVo);
			jsonData.put("data", equipRepairHistAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 설비수리이력 상세목록조회
	@RequestMapping(value = "em/equipRepairHistAdmSel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRepairHistAdmSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo = equipRepairHistAdmService.equipRepairHistAdmSel(equipRepairHistAdmVo);
			jsonData.put("data", equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 설비수리이력 등록
	@RequestMapping(value = "em/equipRepairHistAdmInsert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo.setRegIdx(Utils.getUserIdx());
			equipRepairHistAdmVo.setRegDate(DateUtil.getCurrentDateTime());
			equipRepairHistAdmService.equipRepairHistAdmInsert(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 설비수리이력 수정
	@RequestMapping(value = "em/equipRepairHistAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipInfoUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo.setUpdIdx(Utils.getUserIdx());
			equipRepairHistAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
			equipRepairHistAdmService.equipRepairHistAdmUpdate(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 설비수리이력 삭제
	@RequestMapping(value = "em/equipRepairHistAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmService.equipRepairHistAdmDelete(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// emsc0030
	@RequestMapping(value = "/em/emsc0030", method = RequestMethod.GET)
	public ModelAndView emsc0030(ModelAndView mav, HttpServletRequest request) throws Exception {
		logger.info("page : /em/emsc0030");
		EquipInfoVo equipInfoVo = new EquipInfoVo();
		List<EquipInfoVo> EquipInfoVoList = equipInfoService.equipInfoListAll(equipInfoVo);
		
		mav.setViewName("/em/emsc0030");
		return mav;
	}
	
	// 설비관리대장조회
	@RequestMapping(value = "em/equipRepairHistAdmStatusLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmStatusLst(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> equipRepairHistAdmList = equipRepairHistAdmService.equipRepairHistAdmStatusLst(equipRepairHistAdmVo);
			jsonData.put("data", equipRepairHistAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//검교정  목록조회
	@RequestMapping(value = "em/equipCalibrationList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> list = equipRepairHistAdmService.equipCalibrationList(equipRepairHistAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//검교정 상세목록조회
	@RequestMapping(value = "em/equipCalibrationDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationDtlList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> list = new ArrayList<EquipRepairHistAdmVo>();
			if(equipRepairHistAdmVo.getListVal().equals("normal")) {
				list = equipRepairHistAdmService.equipCalibrationDtlList(equipRepairHistAdmVo);
			} else if(equipRepairHistAdmVo.getListVal().equals("ordered")){
				list = equipRepairHistAdmService.equipCalibrationDtlList2(equipRepairHistAdmVo);
				List<EquipRepairHistAdmVo> list2 = equipRepairHistAdmService.equipCalibrationDtlList3(equipRepairHistAdmVo);
				list.addAll(list2);
			} else {
				list = equipRepairHistAdmService.equipCalibrationDtlList(equipRepairHistAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//검교정 상세목록조회
	@RequestMapping(value = "em/equipCalibrationDtlList2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationDtlList2(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> list1 = equipRepairHistAdmService.equipCalibrationDtlList2(equipRepairHistAdmVo);
			List<EquipRepairHistAdmVo> list2 = equipRepairHistAdmService.equipCalibrationDtlList3(equipRepairHistAdmVo);
			list1.addAll(list2);
			jsonData.put("data", list1);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검교정 상세조회
	@RequestMapping(value = "em/equipCalibrationSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo = equipRepairHistAdmService.equipCalibrationSel(equipRepairHistAdmVo);
			jsonData.put("data", equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검교정 등록
	@RequestMapping(value = "em/equipCalibrationInsert", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo.setRegIdx(Utils.getUserIdx());
			equipRepairHistAdmVo.setRegDate(DateUtil.getCurrentDateTime());
			equipRepairHistAdmService.equipCalibrationInsert(equipRepairHistAdmVo);
			if(!equipRepairHistAdmVo.getExIdx().equals("")) {
				EquipRepairHistAdmVo updVo = new EquipRepairHistAdmVo();
				updVo = equipRepairHistAdmVo;
				updVo.setNextCalibrationCompleteYn("Y");
				updVo.setUpdIdx(Utils.getUserIdx());
				updVo.setUpdDate(DateUtil.getCurrentDateTime());
				equipRepairHistAdmService.equipCalibrationExUpdate(updVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 검교정 수정
	@RequestMapping(value = "em/equipCalibrationUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo.setUpdIdx(Utils.getUserIdx());
			equipRepairHistAdmVo.setUpdDate(DateUtil.getCurrentDateTime());
			equipRepairHistAdmService.equipCalibrationUpdate(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 검교정 삭제
	@RequestMapping(value = "em/equipCalibrationDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCalibrationDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmService.equipCalibrationDelete(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}

