package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.ManufactEquipVo;


@Repository
public class ManufactEquipDAOImpl implements ManufactEquipDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.manufactEquipMapper";
	
	// 제조설비관리 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipList(ManufactEquipVo manufactEquipVo) throws Exception {
		return session.selectList(namespace+".manufactEquipList", manufactEquipVo);
	}
	
	// 제조설비관리 등록
	@Override
	public String manufactEquipIns(ManufactEquipVo manufactEquipVo) throws Exception {
		session.insert(namespace+".manufactEquipIns", manufactEquipVo);
		String idx = manufactEquipVo.getIdx();
		return idx;
	}
	
	// 제조설비관리 수정
	@Override
	public void manufactEquipUpd(ManufactEquipVo manufactEquipVo) throws Exception {
		session.update(namespace+".manufactEquipUpd", manufactEquipVo);
	}
	
	// 제조설비관리 삭제
	@Override
	public void manufactEquipDel(ManufactEquipVo manufactEquipVo) throws Exception {
		session.delete(namespace+".manufactEquipDel", manufactEquipVo);
	}
	
	// 제조설비관리 프로젝트 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipProjectList(ManufactEquipVo manufactEquipVo) throws Exception {
		return session.selectList(namespace+".manufactEquipProjectList", manufactEquipVo);
	}
	
	// 제조설비관리 파일 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipFileList(ManufactEquipVo manufactEquipVo) throws Exception {
		return session.selectList(namespace+".manufactEquipFileList", manufactEquipVo);
	}
	
	// 제조설비관리 파일 등록
	@Override
	public void manufactEquipFileIns(ManufactEquipVo manufactEquipVo) throws Exception {
		session.insert(namespace+".manufactEquipFileIns", manufactEquipVo);
	}
	
	// 제조설비관리 파일 삭제
	public void manufactEquipFileDel(ManufactEquipVo manufactEquipVo) throws Exception {
		session.delete(namespace+".manufactEquipFileDel", manufactEquipVo);
	}
}