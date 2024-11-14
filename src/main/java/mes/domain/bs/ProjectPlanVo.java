package mes.domain.bs;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("ProjectPlanVo")
public class ProjectPlanVo {
	private String idx;
	private String prjCd;
	private String serialNo;
	private String versionNo;
	private String bizOrdNo;
	private String planId;
	private String lmsType;
	private String largeCd;
	private String largeNm;
	private String largeIdx;
	private String mediumCd;
	private String mediumNm;
	private String mediumIdx;
	private String smallCd;
	private String smallNm;
	private String judgeGubun;
	private String period;
	private String planStartDate;
	private String planEndDate;
	private String performStartDate;
	private String performEndDate;
	private String completionRate;
	private String projectPlanDesc;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;

	private String newAdd;
	private String insertList;
	private String updateList;
	private String deleteList;
	
	//====================== 프로젝트 계획서 ======================
	
	//프로젝트 계획서 단일정보
	private String massDev;
	private String prjNm;
	private String leader;
	private String customer;
	private String startDate;
	private String endDate;
	private String forwardWay;
	private String extraIn;
	private String extraWrite;
	
	//주요고객 요청사항
	private String mainCustSub;
	private String mainCustReqContent;
	
	//참여인력
	private String inUserIdx;
	private String inUserName;
	private String userPositionNm;
	private String inPercent;
	private String inDays;
	private String userMainWork;

	//재료비 및 매출이익
	private String materialSub;
	private String materialSpec;
	private String materialAmt;
	private String materialDesc;
	private String outPersonSum;

	//추친일정
	private String carryGubunNm;
	private String carryDetails;
	private String carryDuringStart;
	private String carryDuringEnd;
	private String carryDuringStartMon;
	private String carryDuringStartDay;
	private String carryDuringEndMon;
	private String carryDuringEndDay;
	private String carryMainUser;
	private String carryWay;

	//산출물 List
	private String calNm;
	private String calContent;
	private String calCnt;

	private String insertJson;
	private String planIdx;
	
	//상신, 결재
	private String upvoteYn;
	private String upvoteUserIdx;
	private String upvoteUserName;
	private String upvoteDate;
	private String upvoteReason;
	private String approvalYn;
	private String approvalUserIdx;
	private String approvalUserName;
	private String approvalDate;
	private String approvalReason;
	
	//상신 조회
	private String customerNo;
	private String ordDate;
	private String dealCorpIdx;
	private String dealCorpNm;
	private String ordAmt;
	
	//상신, 결재 내역
	private String upvoteGubun;
	private String status;
	private String userIdx;
	private String upvoteApprovalDate;
	private String upvoteApprovalReason;
	
	private String userName;
	private String userDepartmentNm;
}
