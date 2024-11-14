package mes.service.em;

import java.util.List;

import mes.domain.em.EquipInfoVo;
import mes.domain.em.EquipRepairHistAdmVo;

public interface EquipRepairHistAdmService {
	
	//설비수리이력 목록조회
	public List<EquipRepairHistAdmVo> equipRepairHistAdmListAll(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//설비수리이력 상세조회
	public EquipRepairHistAdmVo equipRepairHistAdmSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//설비수리이력 등록
	public void equipRepairHistAdmInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//설비수리이력 수정
	public void equipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//설비수리이력 삭제
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//설비관리대장 조회
	public List<EquipRepairHistAdmVo> equipRepairHistAdmStatusLst(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 목록조회
	public List<EquipRepairHistAdmVo> equipCalibrationList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 목록조회
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정  상세목록조회
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList2(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정  상세목록조회
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList3(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 상세조회
	public EquipRepairHistAdmVo equipCalibrationSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 등록
	public void equipCalibrationInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 수정
	public void equipCalibrationUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//이전 검교정 갱신
	public void equipCalibrationExUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//검교정 삭제
	public void equipCalibrationDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
}
