package mes.persistence.sc;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.SupplyChainManagementVo;

@Repository
public class SupplyChainManagementDAOImpl implements SupplyChainManagementDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.sc.supplyChainManagementMapper";
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@Override
	public List<SupplyChainManagementVo> scmUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception {
		return session.selectList(namespace+".scmUpvoteYnLst", scmVo);
	}
	
	@Override
	public List<SupplyChainManagementVo> scmFileLst(SupplyChainManagementVo scmVo) throws Exception{
		return session.selectList(namespace+".scmFileLst", scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void scmDeliveryYnIns(SupplyChainManagementVo scmVo) throws Exception {
		session.insert(namespace+".scmDeliveryYnIns", scmVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void scmDeliveryYnUpd(SupplyChainManagementVo scmVo) throws Exception {
		session.update(namespace+".scmDeliveryYnUpd", scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void planFileIns(SupplyChainManagementVo scmVo) throws Exception {
		session.update(namespace+".planFileIns", scmVo);
	}
	
	@Override
	public void reportFileIns(SupplyChainManagementVo scmVo) throws Exception {
		session.update(namespace+".reportFileIns", scmVo);
	}
}
