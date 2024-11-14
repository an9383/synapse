package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.InspectVo;
import mes.persistence.qm.InspectDAO;

@Service
public class InspectServiceImpl implements InspectService {

	@Inject
	private InspectDAO dao;
	
	//검사 ADM 조회
	@Override
	public InspectVo inspectAdmSel(InspectVo inspectVo) throws Exception {
		return dao.inspectAdmSel(inspectVo);
	}
	
	//검사 DTL 조회
	@Override
	public List<InspectVo> inspectDtlLst(InspectVo inspectVo) throws Exception {
		return dao.inspectDtlLst(inspectVo);
	}
	
	//마지막으로 등록된 검사 DTL 조회
	@Override
	public List<InspectVo> lastCreateInspectDtlLst(InspectVo inspectVo) throws Exception {
		return dao.lastCreateInspectDtlLst(inspectVo);
	}
	
	//검사 DTL의 마지막 시퀀스값 조회
	@Override
	public int getMaxInspectDtlIdx(InspectVo inspectVo) throws Exception {
		return dao.getMaxInspectDtlIdx(inspectVo);
	}
	
	//검사 ADM 등록
	@Override
	public String inspectAdmIns(InspectVo inspectVo) throws Exception {
		return dao.inspectAdmIns(inspectVo);
	}
	
	//검사 ADM 수정
	@Override
	public void inspectAdmUpd(InspectVo inspectVo) throws Exception {
		dao.inspectAdmUpd(inspectVo);
	}

	//검사 ADM 삭제
	@Override
	public void inspectAdmDel(InspectVo inspectVo) throws Exception {
		dao.inspectAdmDel(inspectVo);
	}
	
	//검사 DTL 등록
	@Override
	public void inspectDtlIns(InspectVo inspectVo) throws Exception {
		dao.inspectDtlIns(inspectVo);
	}
	
	//검사 DTL 수정
	@Override
	public void inspectDtlUpd(InspectVo inspectVo) throws Exception {
		dao.inspectDtlUpd(inspectVo);
	}
	
	//검사 DTL 삭제
	@Override
	public void inspectDtlDel(InspectVo inspectVo) throws Exception {
		dao.inspectDtlDel(inspectVo);
	}
	
	//공정검사 리스트
	public List<InspectVo> prcssInspectAdmLst(InspectVo inspectVo) throws Exception{
		return dao.prcssInspectAdmLst(inspectVo);
	}
	
	//공정검사 등록
	public void prcssInspectAdmIns(InspectVo inspectVo) throws Exception{
		dao.prcssInspectAdmIns(inspectVo);
	}
	
	//공정검사 수정
	public void prcssInspectAdmUpd(InspectVo inspectVo) throws Exception{
		dao.prcssInspectAdmUpd(inspectVo);
	}
	
	//공정검사 삭제
	public void prcssInspectAdmDel(InspectVo inspectVo) throws Exception{
		dao.prcssInspectAdmDel(inspectVo);
	}
	
	//공정검사 관련자료 리스트 조회
	public List<InspectVo> prcssInspectFileLst(InspectVo inspectVo) throws Exception{
		return dao.prcssInspectFileLst(inspectVo);
	}
	
	//공정검사 관련자료 등록
	public void prcssInspectFileIns(InspectVo inspectVo) throws Exception{
		dao.prcssInspectFileIns(inspectVo);
	}
	
	//공정검사 관련자료 삭제
	public void prcssInspectFileDel(InspectVo inspectVo) throws Exception{
		dao.prcssInspectFileDel(inspectVo);
	}
	
	//공정검사 후 해당IDX 값 불러오기
	public int prcssInspectAdmIdxSel(InspectVo inspectVo) throws Exception{
		return dao.prcssInspectAdmIdxSel(inspectVo);
	}
	
}
