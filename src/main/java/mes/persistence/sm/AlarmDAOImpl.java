package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.sm.AlarmVo;
import mes.domain.sm.WorkplaceVo;

@Repository
public class AlarmDAOImpl implements AlarmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.sm.alarmMapper";
	
	//알람 리스트 조회
	@Override
	public List<AlarmVo> alarmLst(AlarmVo alarmVo) throws Exception {
		return session.selectList(namespace+".alarmLst", alarmVo);
	}
	
	//알람 데이터가 있으면 수정, 없으면 등록
	@Override
	public void alarmAdmIU(AlarmVo alarmVo) throws Exception {
		session.insert(namespace+".alarmAdmIU", alarmVo);
	}
	
	//알람 등록
	@Override
	public void alarmAdmIns(AlarmVo alarmVo) throws Exception {
		session.insert(namespace+".alarmAdmIns", alarmVo);
	}
	
	//알람 수정
	@Override
	public void alarmAdmUpd(AlarmVo alarmVo) throws Exception {
		session.update(namespace+".alarmAdmUpd", alarmVo);
	}
	
	//알람 확인
	@Override
	public void alarmCheckIns(AlarmVo alarmVo) throws Exception {
		session.insert(namespace+".alarmCheckIns", alarmVo);
	}
	
	//알람 일괄 확인
	@Override
	public void alarmCheckBatchIns(AlarmVo alarmVo) throws Exception {
		session.insert(namespace+".alarmCheckBatchIns", alarmVo);
	}
	
}
