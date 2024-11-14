package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.QuotationVo;

@Repository
public class QuotationDAOImpl implements QuotationDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.quotationMapper";
	
	@Override
	public List<QuotationVo> quotationLst(QuotationVo quotationVo) throws Exception{
		return session.selectList(namespace+".quotationLst", quotationVo);
	}
	
	@Override
	public String getReqNo() throws Exception{
		return session.selectOne(namespace+".getReqNo");
	}
	
	@Override
	public void quotationIns(QuotationVo quotationVo) throws Exception{
		session.insert(namespace+".quotationIns", quotationVo);
	}
	
	@Override
	public void quotationUpd(QuotationVo quotationVo) throws Exception{
		session.update(namespace+".quotationUpd", quotationVo);
	}
	
	@Override
	public void quotationDel(QuotationVo quotationVo) throws Exception{
		session.delete(namespace+".quotationDel", quotationVo);
	}
	
	@Override
	public List<QuotationVo> quotationInfoLst(QuotationVo quotationVo) throws Exception{
		return session.selectList(namespace+".quotationInfoLst", quotationVo);
	}
	
	@Override
	public void quotationInfoIns(QuotationVo quotationVo) throws Exception{
		session.insert(namespace+".quotationInfoIns", quotationVo);
	}
	
	@Override
	public void quotationInfoUpd(QuotationVo quotationVo) throws Exception{
		session.update(namespace+".quotationInfoUpd", quotationVo);
	}
	
	@Override
	public void quotationInfoDel(QuotationVo quotationVo) throws Exception{
		session.delete(namespace+".quotationInfoDel", quotationVo);
	}
	
	@Override
	public List<QuotationVo> quotationFileLst(QuotationVo quotationVo) throws Exception{
		return session.selectList(namespace+".quotationFileLst", quotationVo);
	}
	
	@Override
	public void quotationFileIns(QuotationVo quotationVo) throws Exception{
		session.insert(namespace+".quotationFileIns", quotationVo);
	}
	
	@Override
	public void quotationFileUpd(QuotationVo quotationVo) throws Exception{
		session.update(namespace+".quotationFileUpd", quotationVo);
	}
	
	@Override
	public void quotationFileDel(QuotationVo quotationVo) throws Exception{
		session.delete(namespace+".quotationFileDel", quotationVo);
	}
}
