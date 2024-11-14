package mes.domain.rm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;
import mes.domain.stock.StockAdjustAdmVo;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("ProjectVo")
public class ProjectVo {

	//공통
	private String IUDtype;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	private String startDate;
	private String endDate;
	private String projectCd;
	private String idx;
	
	//ADM
	
	//private String bizOrdAdmIdx; -> 2023.11.06 프로젝트 ㄷ 수주 : 1 ㄷ N 리팩토링진행때매 프로젝트식별자로 변경되면서 주석처리
	private String bizOrdProjectIdx;
	private String goodsNm;
	private String inputGubun;
	private String version;
	private String userIdx;
	private String userNm;
	private String userDepartmentNm;
	private String changeReason;
	private String projectDesc;
	
	//DTL
	private String projectIdx;
	private String moduleGubun;
	private String moduleName;
	private String orderGubun;
	private String positionGubun;
	private String purchaseGubun;
	private String partCd;
	private String partGubun;
	private String partNm;
	private String material;
	private String purpose;
	private String surfaceTreatment;
	private String partDc;
	private String maker;
	private String needQty;
	private String preemptiveQty;
	private String inventoryQty;
	private String supplier;
	private String dealCorpNm;
	private String remark;
	private String rowNumber;
	private String fileName;
	

	//VIEW
	private String ordDate;
	private String bizOrdNo;
	private String pjtCd;
	private String customerNo;
	private String status;
	private String dueDate;
	private String prjCd;
	private String prjNm;
	private String ordQty;
	private String ssQty;
	
	//EXCEL
	private String sheetCount;
	private String sheetNameList;
	
	private String insertJson;

	
	//DTL_ORDER
	private String projectDtlIdx;
	private String groupIdx;
	private String orderDate;
	private String orderQty;
	private String approvalYn;
	private String designApprovalYn;
	private String purchaseOrderDtlCount;
	private String orderRemark;
	
	//프로젝트별 표준원가 조회
	private String ordNo;
	private String ordDtlNo;
	private String price;				//금액
	private String ordDateNew;			//새로 등록한 날짜
	private String ordQtyNew;			//새로 등록한 수량
	private String outQty;				//발주수량
	private String confirmYn;			//확정여부
	
	//프로젝트 기술문서
	private String documentNm;
	private String uuid;
	private String fileExt;
	private String fileDesc;
	private String checkDepartmentCd;
	private String checkDepartmentNm;
	private String checkUserIdx;
	private String checkUserNm;
	
	//프로젝트 이미지
	private String projectImage;
	
	private String imageCount;
	private String documentCount;
	
	private String documentDesc;
}
