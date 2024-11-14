package mes.service.bm;

import java.util.List;

import mes.domain.bm.InspectContantAdmVo;

public interface InspectContantAdmService {
	
public List<InspectContantAdmVo> inspectContantAdmLst(InspectContantAdmVo inspectContantAdmVo) throws Exception;
	
	public InspectContantAdmVo inspectContantAdmSel(InspectContantAdmVo inspectContantAdmVo) throws Exception;
	
	public void inspectContantAdmIns(InspectContantAdmVo inspectContantAdmVo) throws Exception;
	
	public void inspectContantAdmUpd(InspectContantAdmVo inspectContantAdmVo) throws Exception;
	
	public void inspectContantAdmDel(InspectContantAdmVo inspectContantAdmVo) throws Exception;
	
	public InspectContantAdmVo inspectCdCheck(InspectContantAdmVo inspectContantAdmVo) throws Exception;
}
