package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.MoldVo;


@Repository
public class MoldDAOImpl implements MoldDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.moldMapper";
	
	// 금형관리 목록조회
	@Override
	public List<MoldVo> moldList(MoldVo moldVo) throws Exception {
		return session.selectList(namespace+".moldList", moldVo);
	}
	
	// 금형관리 등록
	@Override
	public String moldIns(MoldVo moldVo) throws Exception {
		session.insert(namespace+".moldIns", moldVo);
		String idx = moldVo.getIdx();
		return idx;
	}
	
	// 금형관리 수정
	@Override
	public void moldUpd(MoldVo moldVo) throws Exception {
		session.update(namespace+".moldUpd", moldVo);
	}
	
	// 금형관리 삭제
	@Override
	public void moldDel(MoldVo moldVo) throws Exception {
		session.delete(namespace+".moldDel", moldVo);
	}
	
	// 금형관리 프로젝트 목록조회
	@Override
	public List<MoldVo> moldProjectList(MoldVo moldVo) throws Exception {
		return session.selectList(namespace+".moldProjectList", moldVo);
	}
	
	// 금형관리 파일 목록조회
	@Override
	public List<MoldVo> moldFileList(MoldVo moldVo) throws Exception {
		return session.selectList(namespace+".moldFileList", moldVo);
	}
	
	// 금형관리 파일 등록
	@Override
	public void moldFileIns(MoldVo moldVo) throws Exception {
		session.insert(namespace+".moldFileIns", moldVo);
	}
	
	// 금형관리 파일 삭제
	public void moldFileDel(MoldVo moldVo) throws Exception {
		session.delete(namespace+".moldFileDel", moldVo);
	}
}