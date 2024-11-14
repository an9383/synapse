package mes.persistence.ts;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.ts.CsReceiveVo;

@Repository
public class CsReceiveDAOImpl implements CsReceiveDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.ts.csReceiveMapper";
	
	@Override
	public List<CsReceiveVo> csReceiveAdmList(CsReceiveVo csReceiveVo) throws Exception{
		return session.selectList(namespace + ".csReceiveAdmList", csReceiveVo);
	}
	
	@Override
	public List<CsReceiveVo> csReceiveDtlList(CsReceiveVo csReceiveVo) throws Exception{
		return session.selectList(namespace + ".csReceiveDtlList", csReceiveVo);
	}
	
	@Override
	public List<CsReceiveVo> csReceiveAdmRead(CsReceiveVo csReceiveVo) throws Exception{
		return session.selectList(namespace + ".csReceiveAdmRead", csReceiveVo);
	}
	
	@Override
	public String getAsNo() throws Exception {
		return session.selectOne(namespace+".getAsNo");
	}
	
	@Override
	public String getSubAsNo(String vo) throws Exception {
		return session.selectOne(namespace+".getSubAsNo", vo);
	}
	
	@Override
	public List<CsReceiveVo> csDtlCheck(CsReceiveVo csReceiveVo) throws Exception{
		return session.selectList(namespace + ".csDtlCheck", csReceiveVo);
	}
	
	@Override
	public void admCsInsert(CsReceiveVo csReceiveVo) throws Exception{
		session.insert(namespace + ".admCsInsert", csReceiveVo);
	}
	
	@Override
	public void dtlCsInsert(CsReceiveVo csReceiveVo) throws Exception{
		session.insert(namespace + ".dtlCsInsert", csReceiveVo);
	}
	
	@Override
	public void admCsUpdate(CsReceiveVo csReceiveVo) throws Exception{
		session.update(namespace + ".admCsUpdate", csReceiveVo);
	}
	
	@Override
	public void dtlCsUpdate(CsReceiveVo csReceiveVo) throws Exception{
		session.update(namespace + ".dtlCsUpdate", csReceiveVo);
	}
	
	@Override
	public void admCsDelete(CsReceiveVo csReceiveVo) throws Exception{
		session.delete(namespace + ".admCsDelete", csReceiveVo);
	}
	
	@Override
	public void dtlCsDelete(CsReceiveVo csReceiveVo) throws Exception{
		session.delete(namespace + ".dtlCsDelete", csReceiveVo);
	}

}