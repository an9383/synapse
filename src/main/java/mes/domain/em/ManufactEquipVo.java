package mes.domain.em;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("ManufactEquipVo")
public class ManufactEquipVo{
	
	private String idx;
	private String managementNumber;
	private String existingManagementNumber;
	private String registrationDate;
	private String projectNumber;
	private String orderNumber;
	private String productName;
	private String modelName;
	private String productSerialNumber;
	private String productLocation;
	private String specification;
	private String quantity;
	private String unitPrice;
	private String supplyAmount;
	private String responsiblePerson;
	private String deliveryDestination;
	private String vendorResponsible;
	private String vendorContact;
	private String disposeDate;
	private String useYn;
	private String remarks;
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
	
	// TB_MANUFACT_EQUIP_FILE
	private String manufactEquipIdx;
	private String fileType;
	private String uuid;
	private String fileName;
	private String fileExt;
	private String manufactEquipFileList;
	private String base64;
	private String specificationFile;
}
