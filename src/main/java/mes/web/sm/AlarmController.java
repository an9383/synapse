package mes.web.sm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.sm.AlarmVo;
import mes.service.sm.AlarmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class AlarmController {
	
	@Inject
	private AlarmService alarmService;
	
	private static final Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	// 알람 리스트 조회
	@RequestMapping(value = "sm/alarmLst", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> alarmLst(AlarmVo alarmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("알람 리스트 조회");
		try {
			alarmVo.setDepartmentCd(Utils.getUserDepartmentCd());
			alarmVo.setUserIdx(Utils.getUserIdx());
			List<AlarmVo> alarmVoList = alarmService.alarmLst(alarmVo);
			jsonData.put("data", alarmVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 알람 등록
	@RequestMapping(value = "sm/alarmAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> alarmAdmIns(AlarmVo alarmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("알람 등록");
		try {
			alarmService.alarmAdmIns(alarmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 알람 확인
	@RequestMapping(value = "sm/alarmCheckIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> alarmCheckIns(AlarmVo alarmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("알람 확인");
		try {
			alarmVo.setUserIdx(Utils.getUserIdx());
			alarmVo.setCheckTime(DateUtil.getYyyymmddHHmm());
			alarmService.alarmCheckIns(alarmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 알람 확인
	@RequestMapping(value = "sm/alarmCheckBatchIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> alarmCheckBatchIns(AlarmVo alarmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("알람 확인");
		try {
			alarmVo.setUserIdx(Utils.getUserIdx());
			alarmVo.setDepartmentCd(Utils.getUserDepartmentCd());
			alarmVo.setCheckTime(DateUtil.getYyyymmddHHmm());
			alarmService.alarmCheckBatchIns(alarmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
