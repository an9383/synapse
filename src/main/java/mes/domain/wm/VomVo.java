package mes.domain.wm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("VomVo")
public class VomVo {
	private String idx;
	private String projectCd;
	private String projectNm;
	private String serialNo;
	private String vomSite;
	private String userIdx;
	private String userDepartment;
	private String inspectDate;
	private String reqDate;
	private String goodsNm;
	private String goodsType;
	private String unit;
	private String module;
	private String drawNo;
	private String faultyCause;
	private String faultyType;
	private String statusAndProblem;
	private String reqResult;
	private String solution;
	private String actDepartment;
	private String actChargr;
	private String actStartDate;
	private String actEndDate;
	private String procDays;
	private String procResult;
	private String vomDesc;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String vomIdx;
	private String documentNm;
	private String uuid;
	private String fileName;
	private String fileExt;
	private String fileDesc;
	private String inputGubun;
	
	private String userNm;
	
	private String vomImage1;
	private String vomImage2;
	private String vomImage3;
	private String vomImage4;
	
	private String startDate;
	private String endDate;
}
