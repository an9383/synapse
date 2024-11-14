package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.ItemPurchaseVo;
import mes.domain.wm.WorkProgressResultVo;

@Repository
public class WorkProgressResultDAOImpl implements WorkProgressResultDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.workProgressResultMapper";
	
	//진행결과 마스터 리스트 조회(+수주 데이터)
	@Override
	public List<WorkProgressResultVo> workProgressResultAdmLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		return session.selectList(namespace+".workProgressResultAdmLst", workProgressResultVo);
	}
	
	//진행결과 마스터 등록
	@Override
	public void workProgressResultAdmIns(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.insert(namespace+".workProgressResultAdmIns", workProgressResultVo);
	}
	
	//진행결과 마스터 수정
	@Override
	public void workProgressResultAdmUpd(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.update(namespace+".workProgressResultAdmUpd", workProgressResultVo);
	}
	
	//진행결과 마스터 삭제
	@Override
	public void workProgressResultAdmDel(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.delete(namespace+".workProgressResultAdmDel", workProgressResultVo);
	}

	//진행결과 디테일 리스트 조회(+프로세스 항목 데이터)
	@Override
	public List<WorkProgressResultVo> workProgressResultDtlLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		return session.selectList(namespace+".workProgressResultDtlLst", workProgressResultVo);
	}
	
	//진행결과 디테일 등록
	@Override
	public void workProgressResultDtlIns(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.insert(namespace+".workProgressResultDtlIns", workProgressResultVo);
	}
	
	//진행결과 디테일 수정
	@Override
	public void workProgressResultDtlUpd(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.update(namespace+".workProgressResultDtlUpd", workProgressResultVo);
	}
	
	//진행결과 디테일 삭제
	@Override
	public void workProgressResultDtlDel(WorkProgressResultVo workProgressResultVo) throws Exception {
		session.delete(namespace+".workProgressResultDtlDel", workProgressResultVo);
	}
	
	//등록된 데이터 확인 체크 여부 조회
	@Override
	public List<WorkProgressResultVo> workCheckCount(WorkProgressResultVo workProgressResultVo) throws Exception {
		
		System.out.println("123");
		return session.selectList(namespace+".workCheckCount", workProgressResultVo);
	}
}
