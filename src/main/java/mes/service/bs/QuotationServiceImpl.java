package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.QuotationVo;
import mes.persistence.bs.QuotationDAO;

@Service
public class QuotationServiceImpl implements QuotationService{
	
	@Inject
	private QuotationDAO dao;
	
	@Override
	public List<QuotationVo> quotationLst(QuotationVo quotationVo) throws Exception{
		return dao.quotationLst(quotationVo);
	}
	
	@Override
	public String getReqNo() throws Exception{
		return dao.getReqNo();
	}
	
	@Override
	public void quotationIns(QuotationVo quotationVo) throws Exception{
		dao.quotationIns(quotationVo);
	}
	
	@Override
	public void quotationUpd(QuotationVo quotationVo) throws Exception{
		dao.quotationUpd(quotationVo);
	}
	
	@Override
	public void quotationDel(QuotationVo quotationVo) throws Exception{
		dao.quotationDel(quotationVo);
	}
	
	@Override
	public List<QuotationVo> quotationInfoLst(QuotationVo quotationVo) throws Exception{
		return dao.quotationInfoLst(quotationVo);
	}
	
	@Override
	public void quotationInfoIns(QuotationVo quotationVo) throws Exception{
		dao.quotationInfoIns(quotationVo);
	}
	
	@Override
	public void quotationInfoUpd(QuotationVo quotationVo) throws Exception{
		dao.quotationInfoUpd(quotationVo);
	}
	
	@Override
	public void quotationInfoDel(QuotationVo quotationVo) throws Exception{
		dao.quotationInfoDel(quotationVo);
	}
	
	@Override
	public List<QuotationVo> quotationFileLst(QuotationVo quotationVo) throws Exception{
		return dao.quotationFileLst(quotationVo);
	}
	
	@Override
	public void quotationFileIns(QuotationVo quotationVo) throws Exception{
		dao.quotationFileIns(quotationVo);
	}
	
	@Override
	public void quotationFileUpd(QuotationVo quotationVo) throws Exception{
		dao.quotationFileUpd(quotationVo);
	}
	
	@Override
	public void quotationFileDel(QuotationVo quotationVo) throws Exception{
		dao.quotationFileDel(quotationVo);
	}
}
