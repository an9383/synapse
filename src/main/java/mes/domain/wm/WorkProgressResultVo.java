package mes.domain.wm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("WorkProgressResultVo")
public class WorkProgressResultVo{

	//마스터 데이터
	private String idx;
	private String bizOrdAdmIdx;
	private String workStatus;
	private String admStartDate;
	private String admEndDate;
	private String admWorkChargr;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	//디테일 데이터
	private String largeIdx;
	private String mediumIdx;
	private String smallIdx;
	
	private String mediumNm;
	private String mediumCd;
	private String smallNm;
	private String smallCd;
	private String contents;
	
	private String dtlStartDate;
	private String dtlEndDate;
	private String dtlWorkChargr;
	private String workCheck;
	private String workContents;
	private String workDesc;
	
	private String workCheckCount;
	
	//수주 데이터
	private String dealCorpIdx;
	private String dealCorpNm;
	private String prjCd;
	private String prjNm;
	private String goodsTypeNm;
	private String goodsNm;
	private String dueDate;
	private String bizOrdNo;
	
	private String startDate;
	private String endDate;
	
}
