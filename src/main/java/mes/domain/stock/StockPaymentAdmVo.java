package mes.domain.stock;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("StockPaymentAdmVo")
public class StockPaymentAdmVo { // 수불 관리 테이블
	private String spNo;
	private String spSeq;
	private String spGubun;
	private String spGubunNm;
	private String spUnit;
	private String spUnitNm;
	private String spIdx;
	
	private String itemGubun;
	private String itemCd;
	private String itemNm;
	
	private String spType;
	private String spType2;
	private String spDate;
	private String spQty;
	private String inSpQty3Mon;
	private String outSpQty3Mon;
	private String inSpQty6Mon;
	private String outSpQty6Mon;
	private String inSpQty12Mon;
	private String outSpQty12Mon;
	private String inSpQty12MonAfter;
	private String outSpQty12MonAfter;
	private String totalSpQty;
	private String prevSpQty;
	private String spLotNo;
	private String spSourceNo;
	private String spWhsGubun;
	private String spWhsGubunNm;
	private String spWhsIdx;
	private String spLocIdx;
	
	private String spOutWhsGubun;
	private String spOutWhsGubunNm;
	private String spOutWhsIdx;
	private String spOutLocIdx;
	
	private String spInWhsGubun;
	private String spInWhsGubunNm;
	private String spInWhsIdx;
	private String spInLocIdx;
	private String outLcNm;
	private String inLcNm;
	
	private String locNm;
	private String locArea;
	private String storageLoc;
	private String spDesc;
	private String spEtc1;
	private String spEtc2;
	private String spEtc3;
	private String regIdx;
	private String regDate;
	
	private String startDate;
	private String endDate;
	
	private String prev;
	private String input;
	private String output;
	private String inputM;
	private String outputM;
	
	private String searchTarget;
	private String notStockSearch;
	private String spCd;
	private String sumSpQty;
	private String lcNm;
	private String lcDtlNm;
	private String lcIdx;
	private String itemIdx;
	private String dealCorpIdx;
	
	private String insertJson;
	private String updateJson;
	private String deleteJson;
	private String spSourceNoString;
}
