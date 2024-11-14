package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

//import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.qm.CustomerIssueVo;

@Repository
public class CustomerIssueDAOImpl implements CustomerIssueDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.customerIssueMapper";
	
	//고객이슈사항 목록조회
	@Override
	public List<CustomerIssueVo> customerIssueLst(CustomerIssueVo customerIssueVo) throws Exception{
		return session.selectList(namespace + ".customerIssueLst", customerIssueVo);
	}
	
	//고객이슈사항 등록
	@Override
	public void customerIssueIns(CustomerIssueVo customerIssueVo) throws Exception{
		session.insert(namespace + ".customerIssueIns", customerIssueVo);
	}
	
	//고객이슈사항 수정
	@Override
	public void customerIssueUpd(CustomerIssueVo customerIssueVo) throws Exception{
		session.update(namespace + ".customerIssueUpd", customerIssueVo);
	}
	
	//고객이슈사항 삭제
	@Override
	public void customerIssueDel(CustomerIssueVo customerIssueVo) throws Exception{
		session.delete(namespace + ".customerIssueDel", customerIssueVo);
	}
	
	
	//고객이슈 파일 조회
	@Override
	public List<CustomerIssueVo> issueFileLst(CustomerIssueVo customerIssueVo) throws Exception {
		return session.selectList(namespace+".issueFileLst", customerIssueVo);
	}
	
	//고객이슈사항 등록
	@Override
	public void issueFileIns(CustomerIssueVo customerIssueVo) throws Exception{
		session.insert(namespace + ".issueFileIns", customerIssueVo);
	}
	
	//고객이슈사항 수정
	@Override
	public void issueFileUpd(CustomerIssueVo customerIssueVo) throws Exception{
		session.update(namespace + ".issueFileUpd", customerIssueVo);
	}
	
	//고객이슈사항 삭제
	@Override
	public void issueFileDel(CustomerIssueVo customerIssueVo) throws Exception{
		session.delete(namespace + ".issueFileDel", customerIssueVo);
	}
}