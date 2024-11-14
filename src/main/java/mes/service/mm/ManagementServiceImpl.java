package mes.service.mm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.ManagementVo;
import mes.persistence.mm.ManagementDAO;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Inject
	private ManagementDAO dao;
	
	//진척현황리스트 조회
	@Override
	public List<ManagementVo> managementBoard(ManagementVo managementVo) throws Exception {
		return dao.managementBoard(managementVo);
	}
}
