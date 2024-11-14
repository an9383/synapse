package mes.service.em;

import java.util.List;

import mes.domain.em.EquipInfoVo;
import mes.domain.em.MeasuringInstrumentVo;
import mes.domain.em.MoldVo;

public interface MeasuringInstrumentService {
	
	// 게측기관리 목록조회
	public List<MeasuringInstrumentVo> measuringInstrumentList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 등록
	public String measuringInstrumentIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 수정
	public void measuringInstrumentUpd(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 삭제
	public void measuringInstrumentDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 파일 목록조회
	public List<MeasuringInstrumentVo> measuringInstrumentFileList(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 파일 등록
	public void measuringInstrumentFileIns(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
	
	// 게측기관리 파일 삭제
	public void measuringInstrumentFileDel(MeasuringInstrumentVo measuringInstrumentVo) throws Exception;
}
