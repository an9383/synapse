package mes.service.ts;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.ts.CsResultVo;
import mes.persistence.ts.CsResultDAO;

@Service
public class CsResultServiceImpl implements CsResultService {
	
	@Inject
	private CsResultDAO dao;
	
	private static final String namespace = "mes.mappers.ts.customerServiceResultMapper";
	
	@Override
	public List<CsResultVo> csResultList(CsResultVo vo) throws Exception{
		return dao.csResultList(vo);
	}
	
	@Override
	public String get() throws Exception{
		return dao.get();
	}
	
	@Override
	public void csResultInsert(CsResultVo vo) throws Exception{
		dao.csResultInsert(vo);
	}
	
	@Override
	public void csResultUpdate(CsResultVo vo) throws Exception{
		dao.csResultUpdate(vo);
	}
	
	@Override
	public void csResultDelete(CsResultVo vo) throws Exception{
		dao.csResultDelete(vo);
	}
}
