package mes.service.ts;

import java.util.List;

import mes.domain.ts.CsReceiveVo;

public interface CsReceiveService{
	
	public List<CsReceiveVo> csReceiveAdmList(CsReceiveVo csReceiveVo) throws Exception;
	
	public List<CsReceiveVo> csReceiveDtlList(CsReceiveVo csReceiveVo) throws Exception;
	
	public List<CsReceiveVo> csReceiveAdmRead(CsReceiveVo csReceiveVo) throws Exception;
	
	public String getAsNo() throws Exception;
	
	public String getSubAsNo(String vo) throws Exception;
	
	public List<CsReceiveVo> csDtlCheck(CsReceiveVo csReceiveVo) throws Exception;
	
	public void admCsInsert(CsReceiveVo csReceiveVo) throws Exception;
	
	public void dtlCsInsert(CsReceiveVo csReceiveVo) throws Exception;
	
	public void admCsUpdate(CsReceiveVo csReceiveVo) throws Exception;
	
	public void dtlCsUpdate(CsReceiveVo csReceiveVo) throws Exception;
	
	public void admCsDelete(CsReceiveVo csReceiveVo) throws Exception;
	
	public void dtlCsDelete(CsReceiveVo csReceiveVo) throws Exception;

}