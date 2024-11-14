package mes.service.sm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.BatchProcVo;
import mes.persistence.sm.BatchProcDAO;

@Service
public class BatchProcServiceImpl implements BatchProcService {
	
	@Inject
	private BatchProcDAO dao;
	
	//일별 부품 재고정보 생성
	@Override
	public void batchTmData(BatchProcVo batchProcVo) throws Exception {
		dao.batchTmData(batchProcVo);
	}

	//배치 수행 결과 생성
	@Override
	public void batchProcLog(BatchProcVo batchProcVo) throws Exception {
		dao.batchProcLog(batchProcVo);
	}
	
}
