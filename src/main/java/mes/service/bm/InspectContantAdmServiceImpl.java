package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.InspectContantAdmVo;
import mes.persistence.bm.InspectContantAdmDAO;

@Service
public class InspectContantAdmServiceImpl implements InspectContantAdmService {
	
	@Inject
	private InspectContantAdmDAO dao;
	
	@Override
	public List<InspectContantAdmVo> inspectContantAdmLst(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return dao.inspectContantAdmLst(inspectContantAdmVo);
	}
	
	@Override
	public InspectContantAdmVo inspectContantAdmSel(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return dao.inspectContantAdmSel(inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmIns(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		dao.inspectContantAdmIns(inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmUpd(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		dao.inspectContantAdmUpd(inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmDel(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		dao.inspectContantAdmDel(inspectContantAdmVo);
	}
	
	@Override
	public InspectContantAdmVo inspectCdCheck(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return dao.inspectCdCheck(inspectContantAdmVo);
	}
}
