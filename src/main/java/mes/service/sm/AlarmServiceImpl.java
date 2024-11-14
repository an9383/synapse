package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.AlarmVo;
import mes.domain.sm.WorkplaceVo;
import mes.persistence.sm.AlarmDAO;

@Service
public class AlarmServiceImpl implements AlarmService {

	@Inject
	private AlarmDAO dao;
	
	//알람 리스트 조회
	@Override
	public List<AlarmVo> alarmLst(AlarmVo alarmVo) throws Exception {
		return dao.alarmLst(alarmVo);
	}
	
	//알람 데이터가 있으면 수정, 없으면 등록
	@Override
	public void alarmAdmIU(AlarmVo alarmVo) throws Exception {
		dao.alarmAdmIU(alarmVo);
	}
	
	//알람 등록
	@Override
	public void alarmAdmIns(AlarmVo alarmVo) throws Exception {
		dao.alarmAdmIns(alarmVo);
	}
	
	//알람 수정
	@Override
	public void alarmAdmUpd(AlarmVo alarmVo) throws Exception {
		dao.alarmAdmUpd(alarmVo);
	}
	
	//알람 확인
	@Override
	public void alarmCheckIns(AlarmVo alarmVo) throws Exception {
		dao.alarmCheckIns(alarmVo);
	}
	
	//알람 일괄 확인
	@Override
	public void alarmCheckBatchIns(AlarmVo alarmVo) throws Exception {
		dao.alarmCheckBatchIns(alarmVo);
	}
	
}
