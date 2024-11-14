package mes.persistence.mm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.ManagementVo;
import mes.domain.wm.ItemPurchaseVo;
import mes.domain.wm.WorkProgressResultVo;

@Repository
public class ManagementDAOImpl implements ManagementDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.managementMapper";
	
	//진척현황리스트 조회
	@Override
	public List<ManagementVo> managementBoard(ManagementVo managementVo) throws Exception {
		return session.selectList(namespace+".managementBoard", managementVo);
	}
	
}
