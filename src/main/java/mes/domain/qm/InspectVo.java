package mes.domain.qm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("InspectVo")
public class InspectVo {
	private String idx;
	
	//ADM
	private String bizOrdAdmIdx;
	private String serialNoIdx;
	private String inputGubun;
	private String approvalYn;
	private String approvalDate;
	private String admUserIdx;
	private String admUserNm;
	private String produceUserIdx;
	private String produceUserNm;
	private String qaUserIdx;
	private String qaUserNm;
	private String inspectAdmDesc;
	private String writeDate;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;

	//DTL
	private String inspectIdx;
	private String items;
	private String checkDepartmentCd;
	private String checkDepartmentNm;
	private String checkCd;
	private String passCd;
	private String inspectDate;
	private String uuid;
	private String fileName;
	private String fileExt;
	private String updateUuid;
	private String updateFileName;
	private String updateFileExt;
	private String inspectDtlDesc;
	private String dtlUserIdx;
	private String dtlUserNm;
	
	private String statusGubun;
	
	private String insertJson;
	private String goodsNm;
	
	//prcss ADM
	
	private String startDate;
	private String endDate;
	
	private String bizOrdNo;
	private String prjCd;
	private String prjNm;
	private String prcssIdx;
	private String prcssCd;
	private String prcssNm;
	private String inspectUserIdx;
	private String inspectUserNm;
	private String inspectQty;
	private String inspectDesc;
	private String admIdx;
	
}
