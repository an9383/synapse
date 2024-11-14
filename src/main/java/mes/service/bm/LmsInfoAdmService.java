package mes.service.bm;

import java.util.List;

import mes.domain.bm.LmsInfoAdmVo;
import mes.domain.sm.UserVo;

public interface LmsInfoAdmService {
	
	// 대중소분류정보 목록조회
	public List<LmsInfoAdmVo> lmsInfoAdmLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 대중소분류정보 상세조회
	public LmsInfoAdmVo lmsInfoAdmSel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 대중소분류정보 등록
	public String lmsInfoAdmIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 대중소분류정보 수정
	public void lmsInfoAdmUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 대중소분류정보 삭제
	public void lmsInfoAdmDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
		
	// 대중소분류 코드 중복 체크
	public LmsInfoAdmVo lmsInfoCdCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	//프로젝트 채번기준 목록조회
	public List<LmsInfoAdmVo> projectNumberLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	//프로젝트 채번기준 중복 체크
	public LmsInfoAdmVo projectNumberCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 프로젝트 채번기준 등록
	public String projectNumberIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 프로젝트 채번기준 수정
	public void projectNumberUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
	
	// 프로젝트 채번기준 삭제
	public void projectNumberDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception;
}
