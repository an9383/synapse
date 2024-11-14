package mes.persistence.mm;

import java.util.List;

import mes.domain.mm.ManagementVo;

public interface ManagementDAO {
	
	//진척현황리스트 조회
	public List<ManagementVo> managementBoard(ManagementVo managementVo) throws Exception;
	
}
