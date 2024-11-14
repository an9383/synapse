package mes.domain.tm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("InventoryMoveVo")
public class InventoryMoveVo{
	
	//식별자
	private String idx;
	private String lotNo;
	private String moveQty;
	private String moveUserIdx;
	private String moveUserNm;
	private String moveDate;
	private String beforeWarehouse;
	private String beforeWarehouseNm;
	private String afterWarehouse;
	private String afterWarehouseNm;
	private String moveReason;
	private String moveReasonNm;
	private String moveDesc;
	private String spNo;
	private String spSeq;
	private String itemCd;
	private String itemNm;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	//조회조건
	private String startDate;
	private String endDate;
	
	//추가사항
	private String spSourceNo;
}
