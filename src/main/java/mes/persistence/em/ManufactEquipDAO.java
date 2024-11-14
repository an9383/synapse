package mes.persistence.em;

import java.util.List;

import mes.domain.em.ManufactEquipVo;

public interface ManufactEquipDAO {

	// 제조설비관리 목록조회
	public List<ManufactEquipVo> manufactEquipList(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 등록
	public String manufactEquipIns(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 수정
	public void manufactEquipUpd(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 삭제
	public void manufactEquipDel(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 프로젝트 목록조회
	public List<ManufactEquipVo> manufactEquipProjectList(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 파일 목록조회
	public List<ManufactEquipVo> manufactEquipFileList(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 파일 등록
	public void manufactEquipFileIns(ManufactEquipVo manufactEquipVo) throws Exception;
	
	// 제조설비관리 파일 삭제
	public void manufactEquipFileDel(ManufactEquipVo manufactEquipVo) throws Exception;
}
