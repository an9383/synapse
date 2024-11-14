package mes.persistence.qm;

import java.util.List;

//import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.qm.CustomerIssueVo;

public interface CustomerIssueDAO {
	
	//고객이슈사항 목록조회
	public List<CustomerIssueVo> customerIssueLst(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈사항 등록
	public void customerIssueIns(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈사항 수정
	public void customerIssueUpd(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈사항 삭제
	public void customerIssueDel(CustomerIssueVo customerIssueVo) throws Exception;
	
	
	//고객이슈 파일 조회
	public List<CustomerIssueVo> issueFileLst(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈 파일 등록
	public void issueFileIns(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈 파일 수정
	public void issueFileUpd(CustomerIssueVo customerIssueVo) throws Exception;
	
	//고객이슈 파일 삭제
	public void issueFileDel(CustomerIssueVo customerIssueVo) throws Exception;
}
