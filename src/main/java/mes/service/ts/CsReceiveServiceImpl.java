package mes.service.ts;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.ts.CsReceiveVo;
import mes.persistence.ts.CsReceiveDAO;

@Service
public class CsReceiveServiceImpl implements CsReceiveService{
	
	@Inject
	private CsReceiveDAO dao;
	
	@Override
	public List<CsReceiveVo> csReceiveAdmList(CsReceiveVo csReceiveVo) throws Exception{
		return dao.csReceiveAdmList(csReceiveVo);
	}
	
	@Override
	public List<CsReceiveVo> csReceiveDtlList(CsReceiveVo csReceiveVo) throws Exception{
		return dao.csReceiveDtlList(csReceiveVo);
	}
	
	@Override
	public List<CsReceiveVo> csReceiveAdmRead(CsReceiveVo csReceiveVo) throws Exception{
		return dao.csReceiveAdmRead(csReceiveVo);
	}
	
	@Override
	public String getAsNo() throws Exception {
		return dao.getAsNo();
	}
	
	@Override
	public String getSubAsNo(String vo) throws Exception {
		return dao.getSubAsNo(vo);
	}
	
	@Override
	public List<CsReceiveVo> csDtlCheck(CsReceiveVo csReceiveVo) throws Exception{
		return dao.csDtlCheck(csReceiveVo);
	}
	
	@Override
	public void admCsInsert(CsReceiveVo csReceiveVo) throws Exception{
		dao.admCsInsert(csReceiveVo);
	}
	
	@Override
	public void dtlCsInsert(CsReceiveVo vo) throws Exception{
		dao.dtlCsInsert(vo);
	}
	
	@Override
	public void admCsUpdate(CsReceiveVo vo) throws Exception{
		dao.admCsUpdate(vo);
	}
	
	@Override
	public void dtlCsUpdate(CsReceiveVo vo) throws Exception{
		dao.dtlCsUpdate(vo);
	}
	
	@Override
	public void admCsDelete(CsReceiveVo vo) throws Exception{
		dao.admCsDelete(vo);
	}
	
	@Override
	public void dtlCsDelete(CsReceiveVo vo) throws Exception{
		dao.dtlCsDelete(vo);
	}
}
