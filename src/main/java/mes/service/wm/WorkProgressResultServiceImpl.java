package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.ItemPurchaseVo;
import mes.domain.wm.WorkProgressResultVo;
import mes.persistence.wm.WorkProgressResultDAO;

@Service
public class WorkProgressResultServiceImpl implements WorkProgressResultService {

	@Inject
	private WorkProgressResultDAO dao;
	
	//진행결과 마스터 리스트 조회(+수주 데이터)
	@Override
	public List<WorkProgressResultVo> workProgressResultAdmLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		return dao.workProgressResultAdmLst(workProgressResultVo);
	}
	
	//진행결과 마스터 등록
	@Override
	public void workProgressResultAdmIns(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultAdmIns(workProgressResultVo);
	}
	
	//진행결과 마스터 수정
	@Override
	public void workProgressResultAdmUpd(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultAdmUpd(workProgressResultVo);
	}
	
	//진행결과 마스터 삭제
	@Override
	public void workProgressResultAdmDel(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultAdmDel(workProgressResultVo);
	}

	//진행결과 디테일 리스트 조회(+프로세스 항목 데이터)
	@Override
	public List<WorkProgressResultVo> workProgressResultDtlLst(WorkProgressResultVo workProgressResultVo) throws Exception {
		return dao.workProgressResultDtlLst(workProgressResultVo);
	}
	
	//진행결과 디테일 등록
	@Override
	public void workProgressResultDtlIns(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultDtlIns(workProgressResultVo);
	}
	
	//진행결과 디테일 수정
	@Override
	public void workProgressResultDtlUpd(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultDtlUpd(workProgressResultVo);
	}
	
	//진행결과 디테일 삭제
	@Override
	public void workProgressResultDtlDel(WorkProgressResultVo workProgressResultVo) throws Exception {
		dao.workProgressResultDtlDel(workProgressResultVo);
	}
	
	//등록된 데이터 확인 체크 여부 조회
	@Override
	public List<WorkProgressResultVo> workCheckCount(WorkProgressResultVo workProgressResultVo) throws Exception {
		return dao.workCheckCount(workProgressResultVo);
	}
}
