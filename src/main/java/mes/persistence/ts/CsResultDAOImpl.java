package mes.persistence.ts;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.ts.CsResultVo;

@Repository
public class CsResultDAOImpl implements CsResultDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.ts.csResultMapper";
	
	@Override
	public List<CsResultVo> csResultList(CsResultVo vo) throws Exception{
		return session.selectList(namespace + ".csResultList", vo);
	}
	
	@Override
	public String get() throws Exception{
		return session.selectOne(namespace + ".get");
	}
	
	@Override
	public void csResultInsert(CsResultVo vo) throws Exception{
		session.insert(namespace + ".csResultInsert", vo);
	}
	
	@Override
	public void csResultUpdate(CsResultVo vo) throws Exception{
		session.update(namespace + ".csResultUpdate", vo);
	}
	
	@Override
	public void csResultDelete(CsResultVo vo) throws Exception{
		session.delete(namespace + ".csResultDelete", vo);
	}
}
