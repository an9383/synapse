package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.EquipInfoVo;
import mes.domain.em.EquipRepairHistAdmVo;
import mes.persistence.em.EquipRepairHistAdmDAO;
@Service
public class EquipRepairHistAdmServiceImpl implements EquipRepairHistAdmService {

	@Inject
	private EquipRepairHistAdmDAO dao;

	//설비수리이력 목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipRepairHistAdmListAll(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return dao.equipRepairHistAdmListAll(equipRepairHistAdmVo);
	}
	
	//설비수리이력 상세조회
	@Override
	public EquipRepairHistAdmVo equipRepairHistAdmSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return dao.equipRepairHistAdmSel(equipRepairHistAdmVo);
	}
	
	//설비수리이력 등록
	@Override
	public void equipRepairHistAdmInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		dao.equipRepairHistAdmInsert(equipRepairHistAdmVo);
	}
	
	//설비수리이력 수정
	@Override
	public void equipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		dao.equipRepairHistAdmUpdate(equipRepairHistAdmVo);
	}
	
	//설비수리이력 삭제
	@Override
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		dao.equipRepairHistAdmDelete(equipRepairHistAdmVo);
	}

	//설비관리대장 조회
	@Override
	public List<EquipRepairHistAdmVo> equipRepairHistAdmStatusLst(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return dao.equipRepairHistAdmStatusLst(equipRepairHistAdmVo);
	}
	
	//검교정 목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.equipCalibrationList(equipRepairHistAdmVo);
	}
	
	//검교정 목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.equipCalibrationDtlList(equipRepairHistAdmVo);
	}
	
	//검교정  상세목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList2(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.equipCalibrationDtlList2(equipRepairHistAdmVo);
	}
	
	//검교정  상세목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList3(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.equipCalibrationDtlList3(equipRepairHistAdmVo);
	}
	
	//검교정 상세조회
	@Override
	public EquipRepairHistAdmVo equipCalibrationSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.equipCalibrationSel(equipRepairHistAdmVo);
	}
	
	//검교정 등록
	@Override
	public void equipCalibrationInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.equipCalibrationInsert(equipRepairHistAdmVo);
	}
	
	//검교정 수정
	@Override
	public void equipCalibrationUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.equipCalibrationUpdate(equipRepairHistAdmVo);
	}
	
	//이전 검교정 갱신
	@Override
	public void equipCalibrationExUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.equipCalibrationExUpdate(equipRepairHistAdmVo);
	}
	
	//검교정 삭제
	@Override
	public void equipCalibrationDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.equipCalibrationDelete(equipRepairHistAdmVo);
	}
}

	