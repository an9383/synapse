package mes.domain.bs;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("QuotationVo")
public class QuotationVo {
	private String idx;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	private String reqNo;				// 견적의뢰번호
	
	private String reqType;				// REQ유형
	private String reqTitle;			// 견적의회제목
	private String reqCt;				// 품목수
	private String reqOrder;			// 차수
	private String reqDate;				// 의뢰일자
	private String deadLine;			// 견적마감일시
	private String submitDate;			// 제출일자
	private String expirationDate;		// 견적유효일자
	private String costUnit;			// 기준통화
	private String bidding;				// 입찰
	private String partialBidYn;		// 부분입찰가능여부
	private String incoterms;			// incoterms
	private String unitPriceAgreementYn;// 단가계약여부
	private String buyerDesc;			// 구매자비고
	private String dealCorpCd;			// 고객사코드
	private String dealCorpNm;			// 고객사
	private String purchaseType;		// 유형
	private String purchaseChargr;		// 구매담당자
	private String phoneNumber;			// 담당자 번호
	private String chargrEmail;			// 담당자 이메일
	private String rfxMethod;			// RFx방식
	private String selectionMethod;		// 업체선정방식
	private String quotationMethod;		// 방식
	private String quotationNo;			// 견적번호
	private String changeConditionsYn;	// 조건변경가능여부
	private String orderGubun;			// 발주구분
	private String dealCorpDesc;		// 협력사비고
	private String note;				// 노트
	
	private String itemType;			// 품목유형
	private String itemNm;				// 품명
	private String produceUnit;			// 단위
	private String quotationQty;		// 수량
	private String unitPrice;			// 견적단가
	private String quotationPrice;		// 견적금액
	private String leadTime;			// L/T(Day)
	private String attached;			// 첨부파일 수
	
	private String quotationIdx;		// 메인인텍스
	private String infoIdx;				// 품목인덱스
	private String inputGubun;			// 첨부파일 구분
	private String uuid;				// UUID
	private String fileName;			// 파일명
	private String fileExt;				// 파일타입
	private String fileSize;			// 파일크기
	
	private String startDate;			// 의뢰일시작조회
	private String endDate;				// 의뢰일끝조회
}
