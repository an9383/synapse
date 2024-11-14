package mes.domain.sc;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("SupplyChainManagementVo")
public class SupplyChainManagementVo {
	private String idx;
	private String orderDtlNo;
	private String dealCorpIdx;
	private String dealCorpCd;
	private String dealCorpNm;
	private String deliveryUserIdx;	
	private String deliveryUserNm;
	private String deliveryOrderDate;
	private String itemCd;
	private String orderDtlQty;
	private String deliveryYn;
	private String inOutGubun;
	private String individualYn;
	
	private String startDate;
	private String endDate;
	
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String reportUuid;
	private String reports;
	
	private String planUuid;
	private String floorPlan;
}
