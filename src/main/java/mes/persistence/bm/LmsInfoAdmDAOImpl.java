package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.LmsInfoAdmVo;


@Repository
public class LmsInfoAdmDAOImpl implements LmsInfoAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.lmsInfoAdmMapper";
	
	// 대중소분류정보 목록조회
	@Override
	public List<LmsInfoAdmVo> lmsInfoAdmLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return session.selectList(namespace+".lmsInfoAdmLst", lmsInfoAdmVo);
	}
	
	// 대중소분류정보 상세조회
	@Override
	public LmsInfoAdmVo lmsInfoAdmSel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return session.selectOne(namespace+".lmsInfoAdmSel", lmsInfoAdmVo);
	}
	
	// 대중소분류정보 등록
	@Override
	public String lmsInfoAdmIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.insert(namespace+".lmsInfoAdmIns", lmsInfoAdmVo);
		String idx = lmsInfoAdmVo.getIdx();
		return idx;
	}
	
	// 대중소분류정보 수정
	@Override
	public void lmsInfoAdmUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.update(namespace+".lmsInfoAdmUpd", lmsInfoAdmVo);
	}
	
	// 대중소분류정보 삭제
	@Override
	public void lmsInfoAdmDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.delete(namespace+".lmsInfoAdmDel", lmsInfoAdmVo);
	}
	
	// 대중소분류 코드 중복 체크
	@Override
	public LmsInfoAdmVo lmsInfoCdCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return session.selectOne(namespace+".lmsInfoCdCheck", lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 목록조회
	@Override
	public List<LmsInfoAdmVo> projectNumberLst(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		return session.selectList(namespace+".projectNumberLst", lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 중복 체크
	@Override
	public LmsInfoAdmVo projectNumberCheck(LmsInfoAdmVo lmsInfoAdmVo) throws Exception{
		return session.selectOne(namespace+".projectNumberCheck", lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 등록
	@Override
	public String projectNumberIns(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.insert(namespace+".projectNumberIns", lmsInfoAdmVo);
		String idx = lmsInfoAdmVo.getIdx();
		return idx;
	}
	
	//프로젝트 채번기준 수정
	@Override
	public void projectNumberUpd(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.update(namespace+".projectNumberUpd", lmsInfoAdmVo);
	}
	
	//프로젝트 채번기준 삭제
	@Override
	public void projectNumberDel(LmsInfoAdmVo lmsInfoAdmVo) throws Exception {
		session.delete(namespace+".projectNumberDel", lmsInfoAdmVo);
	}
}