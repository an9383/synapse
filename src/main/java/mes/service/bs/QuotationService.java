package mes.service.bs;

import java.util.List;

import mes.domain.bs.QuotationVo;

public interface QuotationService {
	
	public List<QuotationVo> quotationLst(QuotationVo quotationVo) throws Exception;
	
	public String getReqNo() throws Exception;
	
	public void quotationIns(QuotationVo quotationVo) throws Exception;
	
	public void quotationUpd(QuotationVo quotationVo) throws Exception;
	
	public void quotationDel(QuotationVo quotationVo) throws Exception;
	
	public List<QuotationVo> quotationInfoLst(QuotationVo quotationVo) throws Exception;
	
	public void quotationInfoIns(QuotationVo quotationVo) throws Exception;
	
	public void quotationInfoUpd(QuotationVo quotationVo) throws Exception;
	
	public void quotationInfoDel(QuotationVo quotationVo) throws Exception;
	
	public List<QuotationVo> quotationFileLst(QuotationVo quotationVo) throws Exception;
	
	public void quotationFileIns(QuotationVo quotationVo) throws Exception;
	
	public void quotationFileUpd(QuotationVo quotationVo) throws Exception;
	
	public void quotationFileDel(QuotationVo quotationVo) throws Exception;
}
