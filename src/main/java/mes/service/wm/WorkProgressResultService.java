package mes.service.wm;

import java.util.List;

import mes.domain.wm.ItemPurchaseVo;
import mes.domain.wm.WorkProgressResultVo;

public interface WorkProgressResultService {
	
	//진행결과 마스터 리스트 조회(+수주 데이터)
	public List<WorkProgressResultVo> workProgressResultAdmLst(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 마스터 등록
	public void workProgressResultAdmIns(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 마스터 수정
	public void workProgressResultAdmUpd(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 마스터 삭제
	public void workProgressResultAdmDel(WorkProgressResultVo workProgressResultVo) throws Exception;

	//진행결과 디테일 리스트 조회(+프로세스 항목 데이터)
	public List<WorkProgressResultVo> workProgressResultDtlLst(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 디테일 등록
	public void workProgressResultDtlIns(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 디테일 수정
	public void workProgressResultDtlUpd(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//진행결과 디테일 삭제
	public void workProgressResultDtlDel(WorkProgressResultVo workProgressResultVo) throws Exception;
	
	//등록된 데이터 확인 체크 여부 조회
	public List<WorkProgressResultVo> workCheckCount(WorkProgressResultVo workProgressResultVo) throws Exception;
}
