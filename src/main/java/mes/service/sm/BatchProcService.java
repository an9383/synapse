package mes.service.sm;

import mes.domain.sm.BatchProcVo;

public interface BatchProcService {
	
	//일별 부품 재고정보 생성
	public void batchTmData(BatchProcVo batchProcVo) throws Exception;
	
	//배치 수행 결과 생성
	public void batchProcLog(BatchProcVo batchProcVo) throws Exception;

}
