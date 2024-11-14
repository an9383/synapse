package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.MeasuringInstrumentVo;


@Repository
public class MeasuringInstrumentDAOImpl implements MeasuringInstrumentDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.measuringInstrumentMapper";
	
	// 계측기관리 목록조회
	@Override
	public List<MeasuringInstrumentVo> measuringInstrumentList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		return session.selectList(namespace+".measuringInstrumentList", measuringInstrumentVo);
	}
	
	// 계측기관리 등록
	@Override
	public String measuringInstrumentIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		session.insert(namespace+".measuringInstrumentIns", measuringInstrumentVo);
		String idx = measuringInstrumentVo.getIdx();
		return idx;
	}
	
	// 계측기관리 수정
	@Override
	public void measuringInstrumentUpd(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		session.update(namespace+".measuringInstrumentUpd", measuringInstrumentVo);
	}
	
	// 계측기관리 삭제
	@Override
	public void measuringInstrumentDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		session.delete(namespace+".measuringInstrumentDel", measuringInstrumentVo);
	}
	
	// 계측기관리 파일 목록조회
	@Override
	public List<MeasuringInstrumentVo> measuringInstrumentFileList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		return session.selectList(namespace+".measuringInstrumentFileList", measuringInstrumentVo);
	}
	
	// 계측기관리 파일 등록
	@Override
	public void measuringInstrumentFileIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		session.insert(namespace+".measuringInstrumentFileIns", measuringInstrumentVo);
	}
	
	// 계측기관리 파일 삭제
	public void measuringInstrumentFileDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		session.delete(namespace+".measuringInstrumentFileDel", measuringInstrumentVo);
	}
}