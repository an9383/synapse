package mes.web.sm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.sm.MenuAuthVo;
import mes.domain.sm.UserVo;
import mes.service.sm.MenuAuthService;
import mes.service.sm.UserService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class UserController {
	
	@Inject
	private UserService userService;
	@Inject
	private MenuAuthService menuAuthService; 
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 사용자정보관리 페이지
	@RequestMapping(value = "/sm/smsc0020", method = RequestMethod.GET)
	public ModelAndView smsc0020(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : 사용자정보관리 /sm/smsc0020");
		mav.setViewName("/sm/smsc0020");
		return mav;
	}
	
	// bmsc0170
	@RequestMapping(value = "/bm/bmsc0170", method = RequestMethod.GET)
	public ModelAndView bmsc0170(ModelAndView mav, HttpServletRequest request) {
		logger.info("page : 직원정보 /bm/bmsc0170");
		mav.setViewName("/bm/bmsc0170");
		return mav;
	}
	
	// 사용자정보 목록조회
	@RequestMapping(value = "sm/userLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userLst(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 목록조회");
		try {
			List<UserVo> userVoList = userService.userLst(userVo);
			jsonData.put("data", userVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 사용자정보 상세조회
	@RequestMapping(value = "sm/userSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userSel(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 상세조회");
		try {
			userVo = userService.userSel(userVo);
			jsonData.put("data", userVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 사용자정보 등록
	@RequestMapping(value = "sm/userIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userIns(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 등록");
		try {
			if(userService.userIdDupCheck(userVo) == null) {
				userVo.setUserPw(BCrypt.hashpw(userVo.getUserPw().toString(), BCrypt.gensalt(12))); // 비밀번호 암호화
				userVo.setRegIdx(Utils.getUserIdx());
				userVo.setRegDate(DateUtil.getCurrentDateTime());
				userVo.setUpdIdx(null);
				userVo.setUpdDate(null);
				userService.userIns(userVo);
				if(userVo.getUserInOut().equals("O")) {
					userVo = userService.userSel(userVo);
					//메뉴권한 자동 부여
					MenuAuthVo menuAuthVo = new MenuAuthVo();
					menuAuthVo.setUserIdx(userVo.getIdx());
					menuAuthVo.setRegIdx(Utils.getUserIdx());
					menuAuthVo.setRegDate(DateUtil.getCurrentDateTime());
					menuAuthService.scmMenuAuthIns(menuAuthVo);
				}
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복되는 ID가 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 사용자정보 수정
	@RequestMapping(value = "sm/userUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userUpd(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 수정");
		try {
			if(userService.userIdDupCheck(userVo) == null) {
				if(userVo.getUserAdmin().equals("N") && userService.userAdminExsitCheck(userVo).getUserAdmin().equals("0")) { // ADMIN 권한을 제거하려고 할 때
					jsonData.put("result", "fail");
					jsonData.put("message", "ADMIN권한은 최소 1명은 가지고 있어야 합니다.");
				} else {
					if(!userVo.getUserPw().equals("")) {
						userVo.setUserPw(BCrypt.hashpw(userVo.getUserPw().toString(), BCrypt.gensalt(12))); // 비밀번호 암호화
					}
					userVo.setUpdIdx(Utils.getUserIdx());
					userVo.setUpdDate(DateUtil.getCurrentDateTime());
					userService.userUpd(userVo);
					jsonData.put("result", "ok");
				}
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복되는 ID가 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 사용자정보 ID 중복확인
	@RequestMapping(value = "sm/userIdDupCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userIdDupCheck(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 ID 중복확인");
		try {
			userVo = userService.userIdDupCheck(userVo);
			if(userVo == null) {
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복되는 ID가 존재합니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 사용자정보 삭제
	@RequestMapping(value = "sm/userDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userDel(UserVo userVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자정보 삭제");
		try {
			userService.userDel(userVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
