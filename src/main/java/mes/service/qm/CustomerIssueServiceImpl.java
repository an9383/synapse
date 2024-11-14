package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.CustomerIssueVo;
import mes.persistence.qm.CustomerIssueDAO;

@Service
public class CustomerIssueServiceImpl implements CustomerIssueService{

	@Inject
	private CustomerIssueDAO dao;
	//고객이슈사항 목록조회
	@Override
	public List<CustomerIssueVo> customerIssueLst(CustomerIssueVo customerIssueVo) throws Exception{
		return dao.customerIssueLst(customerIssueVo);
	}
	
	//고객이슈사항 등록
	@Override
	public void customerIssueIns(CustomerIssueVo customerIssueVo) throws Exception{
		dao.customerIssueIns(customerIssueVo);
	}
	
	//고객이슈사항 수정
	@Override
	public void customerIssueUpd(CustomerIssueVo customerIssueVo) throws Exception{
		dao.customerIssueUpd(customerIssueVo);
	}
	
	//고객이슈사항 삭제
	@Override
	public void customerIssueDel(CustomerIssueVo customerIssueVo) throws Exception{
		dao.customerIssueDel(customerIssueVo);
	}
	
	
	//고객이슈 파일 조회
	@Override
	public List<CustomerIssueVo> issueFileLst(CustomerIssueVo customerIssueVo) throws Exception {
		return dao.issueFileLst(customerIssueVo);
	}
	
	//고객이슈사항 등록
	@Override
	public void issueFileIns(CustomerIssueVo customerIssueVo) throws Exception{
		dao.issueFileIns(customerIssueVo);
	}
	
	//고객이슈사항 수정
	@Override
	public void issueFileUpd(CustomerIssueVo customerIssueVo) throws Exception{
		dao.issueFileUpd(customerIssueVo);
	}
	
	//고객이슈사항 삭제
	@Override
	public void issueFileDel(CustomerIssueVo customerIssueVo) throws Exception{
		dao.issueFileDel(customerIssueVo);
	}
}
