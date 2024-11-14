package mes.domain.sc;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("ScmCustomerIssueVo")
public class ScmCustomerIssueVo {
	private String idx;
	
	private String startDate;
	private String endDate;
	
	private String gubun;
	private String unit;
	private String companyNm;
	private String number;
	private String issueSite;
	private String departmentGubun;
	private String projectNo;
	private String serialNo;
	private String requestGubun;
	private String faultyReason;
	private String requirement;
	private String measure;
	private String issueStatus;
	private String rcvChargr;
	private String processUser;
	private String receiptDate;
	private String workStartDate;
	private String workEndDate;
	private String processDate;
//	private String fileUpload;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	//파일
	private String userNm;
	private String issueIdx;
	private String inputGubun;
	private String documentNm;
	private String fileName;
	private String userIdx;
	private String userDepartmentNm;
	private String fileDesc;
	private String uuid;
	private String fileExt;
}
