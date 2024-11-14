package mes.domain.stock;

import lombok.Data;

@Data
public class StockSummaryAdmVo {
	
	//테이블 구성요소
	private String ssItemIdx;
	private String ssWhsGubun;
	private String ssWhsIdx;
	private String ssLocIdx;
	private String ssQty;
	private String ssEtc1;
	private String ssEtc2;
	private String ssEtc3;
	private String regIdx;
	private String regDate;
	
	//추가사항
	private String itemNm;
	private String lcCd;
	private String lcNm;
}
