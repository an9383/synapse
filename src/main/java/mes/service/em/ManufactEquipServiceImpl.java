package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.ManufactEquipVo;
import mes.persistence.em.ManufactEquipDAO;
@Service
public class ManufactEquipServiceImpl implements ManufactEquipService {

	@Inject
	private ManufactEquipDAO dao;
	
	// 제조설비관리 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipList(ManufactEquipVo manufactEquipVo) throws Exception {
		return dao.manufactEquipList(manufactEquipVo);
	}
	
	// 제조설비관리 등록
	@Override
	public String manufactEquipIns(ManufactEquipVo manufactEquipVo) throws Exception {
		return dao.manufactEquipIns(manufactEquipVo);
	}
	
	// 제조설비관리 수정
	@Override
	public void manufactEquipUpd(ManufactEquipVo manufactEquipVo) throws Exception {
		dao.manufactEquipUpd(manufactEquipVo);
	}
	
	// 제조설비관리 삭제
	@Override
	public void manufactEquipDel(ManufactEquipVo manufactEquipVo) throws Exception {
		dao.manufactEquipDel(manufactEquipVo);
	}
	
	// 제조설비관리 프로젝트 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipProjectList(ManufactEquipVo manufactEquipVo) throws Exception {
		return dao.manufactEquipProjectList(manufactEquipVo);
	}
	
	// 제조설비관리 파일 목록조회
	@Override
	public List<ManufactEquipVo> manufactEquipFileList(ManufactEquipVo manufactEquipVo) throws Exception {
		return dao.manufactEquipFileList(manufactEquipVo);
	}
	
	// 제조설비관리 파일 등록
	@Override
	public void manufactEquipFileIns(ManufactEquipVo manufactEquipVo) throws Exception {
		dao.manufactEquipFileIns(manufactEquipVo);
	}
	
	// 제조설비관리 파일 삭제
	public void manufactEquipFileDel(ManufactEquipVo manufactEquipVo) throws Exception {
		dao.manufactEquipFileDel(manufactEquipVo);
	}
}

	