package mes.service.ts;

import java.util.List;

import mes.domain.ts.CsResultVo;

public interface CsResultService {
	
	public List<CsResultVo> csResultList(CsResultVo vo) throws Exception;
	
	public String get() throws Exception;
	
	public void csResultInsert(CsResultVo vo) throws Exception;
	
	public void csResultUpdate(CsResultVo vo) throws Exception;
	
	public void csResultDelete(CsResultVo vo) throws Exception;

}
