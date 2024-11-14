package mes.domain.mm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("ManagementVo")
public class ManagementVo{
	
	private String startDate;
	private String endDate;
	
	private String idx;
	private String goodsTypeCd;
	private String goodsTypeNm;
	private String goodsNm;
	private String abroadGubun;
	private String ordDate;
	private String dealCorpIdx;
	private String dealCorpNm;
	private String bizOrdNo;
	private String bizOrdSeq;
	private String prjSeq;
	private String customerNo;
	private String prjCd;
	private String prjNm;
	private String customerDesc;
	private String ordQty;
	private String ordCost;
	private String ordAmt;
	private String dueDate;
	private String status;
	private String completeDate;
	private String machineCount;
	private String opticsCount;
	private String electronicsCount;
	private String admEndDate;
	private String workStatus;
	private String outDate;
	private String outQty;
	
}
