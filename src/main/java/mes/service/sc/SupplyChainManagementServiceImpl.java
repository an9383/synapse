package mes.service.sc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.SupplyChainManagementVo;
import mes.persistence.sc.SupplyChainManagementDAO;

@Service
public class SupplyChainManagementServiceImpl implements SupplyChainManagementService {

	@Inject
	private SupplyChainManagementDAO dao;
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@Override
	public List<SupplyChainManagementVo> scmUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception {
		return dao.scmUpvoteYnLst(scmVo);
	}
	
	@Override
	public List<SupplyChainManagementVo> scmFileLst(SupplyChainManagementVo scmVo) throws Exception {
		return dao.scmFileLst(scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void scmDeliveryYnIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.scmDeliveryYnIns(scmVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void scmDeliveryYnUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.scmDeliveryYnUpd(scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void planFileIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.planFileIns(scmVo);
	}
	
	@Override
	public void reportFileIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.reportFileIns(scmVo);
	}
	
}
