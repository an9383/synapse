package mes.persistence.sm;

import java.util.List;

import mes.domain.sm.AlarmVo;

public interface AlarmDAO {

	//알람 리스트 조회
	public List<AlarmVo> alarmLst(AlarmVo alarmVo) throws Exception;
	
	//알람 데이터가 있으면 수정, 없으면 등록
	public void alarmAdmIU(AlarmVo alarmVo) throws Exception;
	
	//알람 등록
	public void alarmAdmIns(AlarmVo alarmVo) throws Exception;
	
	//알람 수정
	public void alarmAdmUpd(AlarmVo alarmVo) throws Exception;
	
	//알람 확인
	public void alarmCheckIns(AlarmVo alarmVo) throws Exception;
	
	//알람 일괄 확인
	public void alarmCheckBatchIns(AlarmVo alarmVo) throws Exception;
	
}
