package mes.domain.pm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("PurchaseOrderVo")
public class PurchaseOrderVo {
	
	private String IUDtype;
	private String orderNo;
	private String projectCd;
	private String buyReason;
	private String itemGubunIdx;
	private String itemGubun1Idx;
	private String itemGubun2Idx;
	private String itemGubunNm;
	private String itemGubun1Nm;
	private String itemGubun2Nm;
	private String orderUserIdx;
	private String orderUserName;
	private String orderUserDepartment;
	private String maker;
	private String orderQty;
	private String itemCd;
	private String itemNm;
	private String itemDc;
	private String unitDc;
	private String orderDate;
	private String orderDesc;
	private String inputGubun;
	private String status;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String startDate;
	private String endDate;

	
	private String orderDtlNo;
	private String orderDtlSeq;
	private String orderDtlQty;
	private String price;
	private String supplyAmt;
	private String vat;
	private String deliveryOrderDate;
	private String preInDate;
	private String deliveryPossibleDate;
	private String dealCorpIdx;
	private String dealCorpCd;
	private String dealCorpNm;
	private String alreadyOrderDtlQty;
	private String orderDtlDesc;
	private String departmentCd;
	
	private String alreadyInWhsQty;
	
	private String requestDate;
	private String requestGubun;
	private String printYn;
	private String printNo;
	private String completeYn;
	private String completeDesc;
	
	private String purchaseOrderType;
	private String confirmYn;
	private String recentPrice;
	private String updDtlNo;
	private String printDate;
	
	private String representative;
	private String addressAdm;
	private String phoneNumber;
	private String faxNumber;
	
	private String version;
	private String bomGubun;
	private String bomOrderGubun;
	
	private String inOutGubun;
	private String deliveryUserIdx;
	private String deliveryUserNm;
	
	private String projectIdx;
	private String projectDtlIdx;
	private String groupIdx;
	private String idx;
	
	private String inQty;
	private String inDate;
	private String whsIdx;
	private String whsGubun;
	private String inWhsNm;
	private String inUserIdx;
	private String inDesc;
	private String inSlipNo;
	
	private String outSlipNo;
	private String outDepartment;
	private String outUserIdx;
	private String outUserName;
	private String outUserDepartment;
	private String outQty;
	private String outDate;
	private String relationNo;
	private String outDesc;
	private String prjCd;
	private String upvoteYn;
	private String remark;
	private String imageCount;
	private String documentCount;
	private String orderRemark;
	
	private String partDc;
	private String orderStatus;
	private String prjNm;
	private String moduleGubun;
	private String moduleName;
	
	private String insertJson;
	private String updateJson;
	private String deleteJson;
	
	private String lotNo;
}
