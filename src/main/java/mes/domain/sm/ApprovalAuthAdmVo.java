package mes.domain.sm;

import lombok.Data;

@Data
public class ApprovalAuthAdmVo {
	
	private String apprCd;  //승인코드 
	private String apprNm;  //승인명
	private String userId;  //사용자ID
	private String userName;  //사용자명 
	private String regId;   //등록ID 
	private String regDate; //등록일
	private String updId;   //수정ID 
	private String updDate;	//수정날짜 
	private String apprDesc; //매뉴패스
	
	//추가항목
	private String userPositionCd;          //직위ID
	private String userPositionNm;          //직위명 
	private String userDepartmentCd;    //부서ID
	private String userDepartmentNm;	//부서명
	private String userStateNm;
	private String arrayData;
}
