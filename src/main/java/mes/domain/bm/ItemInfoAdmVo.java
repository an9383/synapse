package mes.domain.bm;

import java.util.List;

import lombok.Data;

@Data
public class ItemInfoAdmVo {

	private String menuPath;		//메뉴경로
	private String itemGubun;
	private String itemGubunNm;
	//제품 컬럼
	private String itemCd;			//품번
	private String itemNm;         	//품명
	private String erpCd;         	//erp품번
	private String itemDc;	        //규격
	private String height;          //두께
	private String width;           //폭
	private String weight;          //중량
	private String length;          //피치(길이)
	private String unitDc;	        //재고 단위
	private String dealCorpCd;	    //제품 - 거래처 / 자재 - 입고처
	private String dealCorpNm;			//거래처 이름
	private String useYn;          	//사용여부코드
	private String useYnNm;       	//사용여부이름
	private String itemModel;      	//차종
	private String itemModelNm;    	//차종 이름
	private String mtrlGubun;      	//자재분류
	private String mtrlGubunNm;    	//자재분류 이름
	private String itemDesc;        //비고
	private String stockQty;
	private String preemptiveQty;
	private String regIdx;	        //등록자 id
	private String regDate;        	//등록 시간
	private String updIdx;   	    //수정자 id
	private String updDate;			//수정 시간
	private String equipNo;
	private String equipNm;
	private String mfcCorpCd;
	private String mfcDate;
	private String stateCd;
	
	private String itemImage;
	private String itemImage2;
	private String itemImage3;
	private String equipCd;
	private String unitPrice;
	private String inspectYn;
	private String inspectYnNm;
	private String maker;
	private String individualYn;
	private String safetyStock;
	private String stockUpdateJson;
	
	//품목구분등록
	private String idx;
	private String lmsType;
	private String largeIdx;
	private String itemGubunIdx;
	private String itemGubun1Idx;
	private String itemGubun1;
	private String itemGubun1Nm;
	private String mediumIdx;
	private String itemGubun2Idx;
	private String itemGubun2;
	private String itemGubun2Nm;
	
	//입고단가등록
	private String orderDtlNo;
	private String dealCorpIdx;
	private String costDate;
	private String cost;
	private String costUnit;
	private String costDesc;
	
	private String preInDate;
}
