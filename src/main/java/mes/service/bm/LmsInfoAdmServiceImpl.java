package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.LmsInfoAdmVo;
import mes.persistence.bm.LmsInfoAdmDAO;

@Service
public class LmsInfoAdmServiceImpl implements LmsInfoAdmService {

	@Inject
	private LmsInfoAdmDAO dao;

	// 대중소분류정보 목록조회
	@Override
	public List<LmsInfoAdmVo> lmsInfoAdmLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.lmsInfoAdmLst(lmsInfoAdmVo);
	}
	
	// 대중소분류정보 상세조회
	@Override
	public LmsInfoAdmVo lmsInfoAdmSel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.lmsInfoAdmSel(lmsInfoAdmVo);
	}
	
	// 대중소분류정보 등록
	@Override
	public String lmsInfoAdmIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.lmsInfoAdmIns(lmsInfoAdmVo);
	}
	
	// 대중소분류정보 수정
	@Override
	public void lmsInfoAdmUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		dao.lmsInfoAdmUpd(lmsInfoAdmVo);
	}
	
	// 대중소분류정보 삭제
	@Override
	public void lmsInfoAdmDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		dao.lmsInfoAdmDel(lmsInfoAdmVo);
	}
	
	// 대중소분류 코드 중복 체크
	@Override
	public LmsInfoAdmVo lmsInfoCdCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.lmsInfoCdCheck(lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 목록조회
	@Override
	public List<LmsInfoAdmVo> projectNumberLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.projectNumberLst(lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 중복 체크
	@Override
	public LmsInfoAdmVo projectNumberCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception{
		return dao.projectNumberCheck(lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 등록
	@Override
	public String projectNumberIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return dao.projectNumberIns(lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 수정
	@Override
	public void projectNumberUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		dao.projectNumberUpd(lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 삭제
	@Override
	public void projectNumberDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		dao.projectNumberDel(lmsInfoAdmVo);
	}
}

	