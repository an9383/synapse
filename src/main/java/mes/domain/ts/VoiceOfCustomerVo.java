package mes.domain.ts;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("VoiceOfCustomerVo")
public class VoiceOfCustomerVo {
	private String idx;
	private String asNo;
	private String dealCorpIdx;
	private String dealCorpNm;
	private String failureDate;
	private String projectCd;
	private String projectNm;
	private String serialNo;
	private String goodsNm;
	private String goodsCd;
	private String rcvChargr;
	private String rcvChargrNm;
	private String rcvDepartment;
	private String receiveChargr;
	private String receiveChargrNm;
	private String receiveDepartment;
	private String faultyGubun;
	private String faultyType;
	private String faultyDesc;
	private String requestDate;
	private String dueDate;
	private String completionDate;
	private String status;
	private String totalCost;
	
	private String asNoSeq;
	private String goodsDc;
	private String consumption;
	private String unitPrice;
	private String cost;
	private String paidFree;
	private String priceCost;
	private String repairCost;
	private String travelExpense;
	private String etcCost;
	private String handler;
	private String handlerNm;
	private String handling;
	private String handlerDepartment;
	
	private String remarks;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String startDate;
	private String endDate;
	private String startPrsDate;
	private String endPrsDate;
	
	private String vocDtlList;
	
	private String inSlipNo;
	private String inDate;
	private String whsIdx;
	private String whsGubun;
	

}
