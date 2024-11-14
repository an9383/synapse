package mes.service.sc;

import java.util.List;

import mes.domain.sc.ScmCustomerIssueVo;
import mes.domain.sc.ScmInspectVo;

public interface ScmInspectService {
	
	//검사 ADM 조회
	public ScmInspectVo inspectAdmSel(ScmInspectVo inspectVo) throws Exception;
	
	//검사 DTL 조회
	public List<ScmInspectVo> inspectDtlLst(ScmInspectVo inspectVo) throws Exception;
	
	//마지막으로 등록된 검사 DTL 조회
	public List<ScmInspectVo> lastCreateInspectDtlLst(ScmInspectVo inspectVo) throws Exception;
	
	//검사 DTL의 마지막 시퀀스값 조회
	public int getMaxInspectDtlIdx(ScmInspectVo inspectVo) throws Exception;
	
	//검사 ADM 등록
	public String inspectAdmIns(ScmInspectVo inspectVo) throws Exception;
	
	//검사 ADM 수정
	public void inspectAdmUpd(ScmInspectVo inspectVo) throws Exception;

	//검사 ADM 삭제
	public void inspectAdmDel(ScmInspectVo inspectVo) throws Exception;
	
	//검사 DTL 등록
	public void inspectDtlIns(ScmInspectVo inspectVo) throws Exception;
	
	//검사 DTL 수정
	public void inspectDtlUpd(ScmInspectVo inspectVo) throws Exception;
	
	//검사 DTL 삭제
	public void inspectDtlDel(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 리스트
	public List<ScmInspectVo> prcssInspectAdmLst(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 등록
	public void prcssInspectAdmIns(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 수정
	public void prcssInspectAdmUpd(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 삭제
	public void prcssInspectAdmDel(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 리스트 조회
	public List<ScmInspectVo> prcssInspectFileLst(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 등록
	public void prcssInspectFileIns(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 관련자료 삭제
	public void prcssInspectFileDel(ScmInspectVo inspectVo) throws Exception;
	
	//공정검사 후 해당IDX 값 불러오기
	public int prcssInspectAdmIdxSel(ScmInspectVo inspectVo) throws Exception;
	
}
