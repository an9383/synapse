package mes.domain.em;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("MoldVo")
public class MoldVo{
	
	private String idx;
	private String managementType;
	private String managementTypeNm;
	private String selfManagementNumber;
	private String moldType;
	private String moldTypeNm;
	private String companyManagementNumber;
	private String material;
	private String moldStorageLocation;
	private String itemNumber;
	private String itemName;
	private String specification;
	private String unit;
	private String quantity;
	private String unitPrice;
	private String amount;
	private String orderDate;
	private String receiptDate;
	private String vendor;
	private String orderNumber;
	private String projectCode;
	private String projectName;
	private String disposeDate;
	private String useYn;
	private String moldDesc;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String insertList;
	private String updateList;
	private String deleteList;

	private String projectCd;
	private String projectNm;
	private String orderDtlNo;
	private String deliveryOrderDate;
	private String itemCd;
	private String itemNm;
	private String itemDc;
	
	// TB_MOLD_FILE
	private String moldIdx;
	private String fileType;
	private String uuid;
	private String fileName;
	private String fileExt;
	private String moldFileList;
	private String base64;
}
