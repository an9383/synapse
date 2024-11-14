package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.EquipInfoVo;
import mes.domain.em.EquipRepairHistAdmVo;


@Repository
public class EquipRepairHistAdmDAOImpl implements EquipRepairHistAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.equipRepairHistAdmMapper";
	
	//설비수리이력 목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipRepairHistAdmListAll(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return session.selectList(namespace+".equipRepairHistAdmListAll" ,equipRepairHistAdmVo );
	}
	
	//설비수리이력 상세조회
	@Override
	public EquipRepairHistAdmVo equipRepairHistAdmSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return session.selectOne(namespace+".equipRepairHistAdmSel" ,equipRepairHistAdmVo );
	}
	
	//설비수리이력 등록
	@Override
	public void equipRepairHistAdmInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.insert(namespace+".equipRepairHistAdmInsert" ,equipRepairHistAdmVo );
	}
	
	//설비수리이력 수정
	@Override
	public void equipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.update(namespace+".equipRepairHistAdmUpdate" ,equipRepairHistAdmVo );
	}
	
	//설비수리이력 삭제
	@Override
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.delete(namespace+".equipRepairHistAdmDelete" ,equipRepairHistAdmVo );
	}

	//설비관리대장 조회
	@Override
	public List<EquipRepairHistAdmVo> equipRepairHistAdmStatusLst(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return session.selectList(namespace+".equipRepairHistAdmStatusLst" ,equipRepairHistAdmVo );
	}
	
	//검교정 목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return session.selectList(namespace+".equipCalibrationLst", equipRepairHistAdmVo);
	}
	
	//검교정 상세목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return session.selectList(namespace+".equipCalibrationDtlLst", equipRepairHistAdmVo);
	}
	
	//검교정  상세목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList2(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return session.selectList(namespace+".equipCalibrationDtlLst2", equipRepairHistAdmVo);
	}
	
	//검교정  상세목록조회
	@Override
	public List<EquipRepairHistAdmVo> equipCalibrationDtlList3(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return session.selectList(namespace+".equipCalibrationDtlLst3", equipRepairHistAdmVo);
	}
	
	//검교정 상세조회
	@Override
	public EquipRepairHistAdmVo equipCalibrationSel(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return session.selectOne(namespace+".equipCalibrationSel", equipRepairHistAdmVo);
	}
	
	//검교정 등록
	@Override
	public void equipCalibrationInsert(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		session.insert(namespace+".equipCalibrationInsert", equipRepairHistAdmVo);
	}
	
	//검교정 수정
	@Override
	public void equipCalibrationUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		session.update(namespace+".equipCalibrationUpdate", equipRepairHistAdmVo);
	}
	
	//이전 검교정 갱신
	@Override
	public void equipCalibrationExUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		session.update(namespace+".equipCalibrationExUpdate", equipRepairHistAdmVo);
	}
	
	//검교정 삭제
	@Override
	public void equipCalibrationDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		session.delete(namespace+".equipCalibrationDelete", equipRepairHistAdmVo);
	}
}