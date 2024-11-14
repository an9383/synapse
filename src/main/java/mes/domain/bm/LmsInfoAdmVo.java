package mes.domain.bm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("LmsInfoAdmVo")
public class LmsInfoAdmVo{
	
	//대중소분류정보 ADM
	private String idx;
	private String lmsCategory;
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
	private String judgeGubunNm;
	private String contents;
	private String useYn;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	//프로젝트일정표
	private String prjCd;
	private String bizOrdNo;
	private String period;
	private String planStartDate;
	private String planEndDate;
	private String performStartDate;
	private String performEndDate;
	private String completionRate;
	private String projectPlanDesc;
	
	//프로젝트 채번기준
	private String prjNumberGubun;
	private String gubunIdx;
	private String gubunCd;
	private String gubunNm;
	private String gubunDesc;
	private String selYear;
}
