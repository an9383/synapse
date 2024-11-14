package mes.domain.ts;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("CsResultVo")
public class CsResultVo {
	private String idx;
	private String asNo;
	private String subAsNo;
	private String itemCd;
	private String itemNm;
	private String itemDc;
	private String stockQty;
	private String consumption;
	private String paidFree;
	private String priceCost;
	private String totalCost;
	private String complete;
	private String csDesc;
	private String repairCost;
	private String etcCost;
	private String travelExpense;
	private String processing;
	private String resultDesc;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	private String arrayData;
	
	private String startDate;
	private String endDate;
	private String startPrsDate;
	private String endPrsDate;
	private String resultGubun;
}
