package mes.domain.mt;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("MonitoringVo")
public class MonitoringVo {

	private String bizOrdDtlNo;
	private String confirmDesign;
	private String bizOrdDealCorpNm;
	private String bizOrdDate;
	private String bizOrdQty;
	private String itemNm;
	private String matrlCd;
	private String paperType;
	private String itemVersionNm;
	private String outReqDate;
	private String workEndReqDate;
	private String workOrdQty;
	private String workEndDate;
	private String workFairQty;
	private String upTime;
	private String productionPerHour;
	
	//리드타임
	private String workOrdDate;
	private String outDate;
	private String outQty;
	private String totalDay;
	
	//불량률현황
	private String ordDate;
	private String fairQtySum;
	private String faultyQtySum;
	
	//생산진행현황
	private String workPrcssStatusJson;
	private String workOrdNo;
	private String stockUseYn;
	private String workResultIdx;
	private String inQtyCheck;
	private String prcssStatus;
	private String ordGubun;
	
	private String startDate;
	private String endDate;
	private String searchTarget;
}
