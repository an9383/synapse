package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.InspectContantAdmVo;

@Repository
public class InspectContantAdmDAOImpl implements InspectContantAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.inspectContantAdmMapper";
	
	@Override
	public List<InspectContantAdmVo> inspectContantAdmLst(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return session.selectList(namespace+".inspectContantAdmLst", inspectContantAdmVo);
	}
	
	@Override
	public InspectContantAdmVo inspectContantAdmSel(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return session.selectOne(namespace+".inspectContantAdmSel", inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmIns(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		session.insert(namespace+".inspectContantAdmIns", inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmUpd(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		session.update(namespace+".inspectContantAdmUpd", inspectContantAdmVo);
	}
	
	@Override
	public void inspectContantAdmDel(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		session.delete(namespace+".inspectContantAdmDel", inspectContantAdmVo);
	}
	
	@Override
	public InspectContantAdmVo inspectCdCheck(InspectContantAdmVo inspectContantAdmVo) throws Exception {
		return session.selectOne(namespace+".inspectCdCheck", inspectContantAdmVo);
	}
}
