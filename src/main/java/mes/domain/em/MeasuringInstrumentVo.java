package mes.domain.em;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("MeasuringInstrumentVo")
public class MeasuringInstrumentVo{
	
	private String idx;
	private String managementNumber;
	private String existingManagementNumber;
	private String measuringInstrumentName;
	private String modelName;
	private String specification;
	private String deviceUniqueNumber;
	private String registrationDate;
	private String departmentInUse;
	private String manufacturerCountry;
	private String orderNumber;
	private String purchasePrice;
	private String calibrationCycle;
	private String calibrationDate;
	private String calibrationNumber;
	private String disposeDate;
	private String calibrationOrganization;
	private String useYn;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String insertList;
	private String updateList;
	private String deleteList;
	
	// TB_MEASURING_INSTRUMENT_FILE
	private String measuringInstrumentIdx;
	private String uuid;
	private String fileName;
	private String fileExt;
	private String measuringInstrumentFileList;
	private String base64;
}
