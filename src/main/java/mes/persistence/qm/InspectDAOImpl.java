package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.qm.CustomerIssueVo;
import mes.domain.qm.InspectVo;

@Repository
public class InspectDAOImpl implements InspectDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.inspectMapper";
	
	//검사 ADM 조회
	@Override
	public InspectVo inspectAdmSel(InspectVo inspectVo) throws Exception {
		return session.selectOne(namespace+".inspectAdmSel", inspectVo);
	}
	
	//검사 DTL 조회
	@Override
	public List<InspectVo> inspectDtlLst(InspectVo inspectVo) throws Exception {
		return session.selectList(namespace+".inspectDtlLst", inspectVo);
	}
	
	//마지막으로 등록된 검사 DTL 조회
	@Override
	public List<InspectVo> lastCreateInspectDtlLst(InspectVo inspectVo) throws Exception {
		return session.selectList(namespace+".lastCreateInspectDtlLst", inspectVo);
	}
	
	//검사 DTL의 마지막 시퀀스값 조회
	@Override
	public int getMaxInspectDtlIdx(InspectVo inspectVo) throws Exception {
		return session.selectOne(namespace+".getMaxInspectDtlIdx", inspectVo);
	}
	
	//검사 ADM 등록
	@Override
	public String inspectAdmIns(InspectVo inspectVo) throws Exception {
		session.insert(namespace+".inspectAdmIns", inspectVo);
		String idx = inspectVo.getIdx();
		return idx;
	}
	
	//검사 ADM 수정
	@Override
	public void inspectAdmUpd(InspectVo inspectVo) throws Exception {
		session.update(namespace+".inspectAdmUpd", inspectVo);
	}

	//검사 ADM 삭제
	@Override
	public void inspectAdmDel(InspectVo inspectVo) throws Exception {
		session.delete(namespace+".inspectAdmDel", inspectVo);
	}
	
	//검사 DTL 등록
	@Override
	public void inspectDtlIns(InspectVo inspectVo) throws Exception {
		session.insert(namespace+".inspectDtlIns", inspectVo);
	}
	
	//검사 DTL 수정
	@Override
	public void inspectDtlUpd(InspectVo inspectVo) throws Exception {
		session.update(namespace+".inspectDtlUpd", inspectVo);
	}
	
	//검사 DTL 삭제
	@Override
	public void inspectDtlDel(InspectVo inspectVo) throws Exception {
		session.delete(namespace+".inspectDtlDel", inspectVo);
	}
	
	//공정검사 리스트
	@Override
	public List<InspectVo> prcssInspectAdmLst(InspectVo inspectVo) throws Exception{
		return session.selectList(namespace+".prcssInspectAdmLst", inspectVo);
	}
	
	//공정검사 등록
	@Override
	public void prcssInspectAdmIns(InspectVo inspectVo) throws Exception{
		session.insert(namespace+".prcssInspectAdmIns", inspectVo);
	}
	
	//공정검사 수정
	@Override
	public void prcssInspectAdmUpd(InspectVo inspectVo) throws Exception{
		session.update(namespace+".prcssInspectAdmUpd", inspectVo);
	}
	
	//공정검사 삭제
	@Override
	public void prcssInspectAdmDel(InspectVo inspectVo) throws Exception{
		session.delete(namespace+".prcssInspectAdmDel", inspectVo);
	}
	
	//공정검사 관련자료 리스트 조회
	@Override
	public List<InspectVo> prcssInspectFileLst(InspectVo inspectVo) throws Exception{
		return session.selectList(namespace+".prcssInspectFileLst", inspectVo);
	}
	
	//공정검사 관련자료 등록
	@Override
	public void prcssInspectFileIns(InspectVo inspectVo) throws Exception{
		session.insert(namespace+".prcssInspectFileIns", inspectVo);
	}
	
	//공정검사 관련자료 삭제
	@Override
	public void prcssInspectFileDel(InspectVo inspectVo) throws Exception{
		session.delete(namespace+".prcssInspectFileDel", inspectVo);
	}
	
	//공정검사 후 해당IDX 값 불러오기
	@Override
	public int prcssInspectAdmIdxSel(InspectVo inspectVo) throws Exception{
		return session.selectOne(namespace+".prcssInspectAdmIdxSel");
	}
	
}