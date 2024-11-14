package mes.domain.sm;

import lombok.Data;

@Data
public class AlarmVo {

	private String idx;
	private String cunnectIdx1;
	private String cunnectIdx2;
	private String cunnectIdx3;
	private String happenDepartmentCd;
	private String happenDepartmentNm;
	private String happenTime;
	private String moduleCd;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String departmentCd;
	private String departmentNm;
	
	private String userIdx;
	private String userNm;
	private String checkTime;
	
	private String prjCd;
	private String moduleNm;
	private String moduleDesc;
	
	
	
}
