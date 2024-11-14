package mes.domain.ts;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("CsReceiveVo")
public class CsReceiveVo {
	private String idx;
	private String asNo;
	private String subAsNo;
	private String itemIdx;
	private String serialNo;
	private String moduleNm;
	private String companyNm;
	private String phoneNumber;
	private String addressAdm;
	private String rcvChargr;
	private String receiveChargr;
	private String faultyType;
	private String faultyNm;
	private String dtlDesc;
	private String prjCd;
	private String itemGubun1;
	private String itemGubun2;
	private String cmplnDate;
	private String resultGubun;
	private String processing;
	private String resultDesc;
	private String paidFree;
	private String processDate;
	private String processUser;
	private String repairCost;
	private String etcCost;
	private String travelExpense;
	private String totalCost;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	private String arrayData;
	
	private String startDate;
	private String endDate;
	private String startPrsDate;
	private String endPrsDate;
//	private String cnt;
//	private String result;
}
