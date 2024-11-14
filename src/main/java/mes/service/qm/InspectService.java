package mes.service.qm;

import java.util.List;

import mes.domain.qm.CustomerIssueVo;
import mes.domain.qm.InspectVo;

public interface InspectService {
	
	//검사 ADM 조회
	public InspectVo inspectAdmSel(InspectVo inspectVo) throws Exception;
	
	//검사 DTL 조회
	public List<InspectVo> inspectDtlLst(InspectVo inspectVo) throws Exception;
	
	//마지막으로 등록된 검사 DTL 조회
	public List<InspectVo> lastCreateInspectDtlLst(InspectVo inspectVo) throws Exception;
	
	//검사 DTL의 마지막 시퀀스값 조회
	public int getMaxInspectDtlIdx(InspectVo inspectVo) throws Exception;
	
	//검사 ADM 등록
	public String inspectAdmIns(InspectVo inspectVo) throws Exception;
	
	//검사 ADM 수정
	public void inspectAdmUpd(InspectVo inspectVo) throws Exception;

	//검사 ADM 삭제
	public void inspectAdmDel(InspectVo inspectVo) throws Exception;
	
	//검사 DTL 등록
	public void inspectDtlIns(InspectVo inspectVo) throws Exception;
	
	//검사 DTL 수정
	public void inspectDtlUpd(InspectVo inspectVo) throws Exception;
	
	//검사 DTL 삭제
	public void inspectDtlDel(InspectVo inspectVo) throws Exception;
	
	//공정검사 리스트
	public List<InspectVo> prcssInspectAdmLst(InspectVo inspectVo) throws Exception;
	
	//공정검사 등록
	public void prcssInspectAdmIns(InspectVo inspectVo) throws Exception;
	
	//공정검사 수정
	public void prcssInspectAdmUpd(InspectVo inspectVo) throws Exception;
	
	//공정검사 삭제
	public void prcssInspectAdmDel(InspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 리스트 조회
	public List<InspectVo> prcssInspectFileLst(InspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 등록
	public void prcssInspectFileIns(InspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 삭제
	public void prcssInspectFileDel(InspectVo inspectVo) throws Exception;
	
	//공정검사 후 해당IDX 값 불러오기
	public int prcssInspectAdmIdxSel(InspectVo inspectVo) throws Exception;
	
}
