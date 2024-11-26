package mes.persistence.sc;

import java.util.List;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.SupplyChainManagementVo;

public interface SupplyChainManagementDAO {

	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	public List<SupplyChainManagementVo> scmUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception;
	
	public List<SupplyChainManagementVo> scmFileLst(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 등록
	public void scmDeliveryYnIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정
	public void scmDeliveryYnUpd(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 등록
	public void planFileIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정
	public void reportFileIns(SupplyChainManagementVo scmVo) throws Exception;
}
