package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.MeasuringInstrumentVo;
import mes.persistence.em.MeasuringInstrumentDAO;
@Service
public class MeasuringInstrumentServiceImpl implements MeasuringInstrumentService {

	@Inject
	private MeasuringInstrumentDAO dao;
	
	// 계측기관리 목록조회
	@Override
	public List<MeasuringInstrumentVo> measuringInstrumentList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		return dao.measuringInstrumentList(measuringInstrumentVo);
	}
	
	// 계측기관리 등록
	@Override
	public String measuringInstrumentIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		return dao.measuringInstrumentIns(measuringInstrumentVo);
	}
	
	// 계측기관리 수정
	@Override
	public void measuringInstrumentUpd(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		dao.measuringInstrumentUpd(measuringInstrumentVo);
	}
	
	// 계측기관리 삭제
	@Override
	public void measuringInstrumentDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		dao.measuringInstrumentDel(measuringInstrumentVo);
	}
	
	// 계측기관리 파일 목록조회
	@Override
	public List<MeasuringInstrumentVo> measuringInstrumentFileList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		return dao.measuringInstrumentFileList(measuringInstrumentVo);
	}
	
	// 계측기관리 파일 등록
	@Override
	public void measuringInstrumentFileIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		dao.measuringInstrumentFileIns(measuringInstrumentVo);
	}
	
	// 계측기관리 파일 삭제
	public void measuringInstrumentFileDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception {
		dao.measuringInstrumentFileDel(measuringInstrumentVo);
	}
}

	