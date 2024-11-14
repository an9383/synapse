package mes.domain.bs;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("BizOrderVo")
public class BizOrderVo {
	private String progressOrder;
	private String idx;
	private String mergeIdx;
	private String bizOrdDtlIdx;
	private String purchaseIdx;	
	private String bizOrdNo;
	private String dealCorpIdx;
	private String ordDate;
	private String outReqDate;
	private String ordGubun;
	private String ordDesc;
	private String workOrdCnt;
	private String workplaceIdx;
	private String bizOrdAdmIdx;
	private String bizOrdDtlNo;
	private String bizStatusCd;
	private String stockUseYn;
	private int ordQty;
	private String stockUseQty;
	private String purchaseBatch;
	private String itemIdx;
	private String stringItemIdx;
	private String workEndReqDate;
	private String bizStopYn;
	private String confirmOrder;
	private String confirmDesign;
	private String ordNote;
	private String ordIssue;
	private String ordDtlDesc;
	private String purchaseUuid;
	private String purchaseFileName;
	private String purchaseExt;
	private String completeDate;
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
	
	
	private String rowNumber;
	private String startDate;
	private String endDate;
	private String ordGubunNm;
	private String dealCorpCd;
	private String dealCorpNm;
	private String itemCd;
	private String customerItemCd;
	private String itemNm;
	private String itemSize;
	private String knifeTipSize;
	private String woodenCareCd;
	private String holeWoodenCd;
	private String itemColor;
	private String frequency;
	private String specialNotice;
	private String relayNotice;
	private String coatingMethod;
	private String moldingMethod;
	private String bundleMethod;
	private String bundleUnit; 
	private String packMethod;
	private String packUnit;
	private String workPrinter;
	private String detailDate;
	private String masterPaper;
	private String roundPlateCnt;
	private String careCd;
	private String plane;
	private String inspectMethod;
	private String printingYnCheck;
	private String plateSize;
	private String etc1;
	private String itemGubun;
	private String cmyk;
	private String resinBoard;
	
	private String woodenCareNm;
	private String bundleMethodNm;
	private String packMethodNm;
	private String inspectMethodNm;
	private String printingYnCheckNm;
	private String itemGubunNm;
	private String itemVersion;
	private String ext;
	private String fileNm;
	private String uuid;
	private String regIdxNm;
	private String resinBoardNm;
	
	private String matrlCd;
	private String matrlNm;
	private String paperType;
	private String paperTypeNm;
	private String purchaseOrdNo;
	private String cutQty;
	private String eaQty;
	private String extraQty;
	private String extraPackQty;
	private String cutSize;
	private String purchaseOrdQty;
	private String purchaseOrdDate;
	private String purchaseInDueDate;
	private String confirmYn;
	private String printYn;
	private String purchaseNote;
	private String purchaseDesc;
	
	private String spQty;
	private String outQty;
	private String purchaseTarget;
	private String workOrdPrcssJson;
	private String sizeX;
	private String sizeY;
	private String extraStock;
	private String purchaseQty;
	private String searchTarget;
	private String searchInMatrlTarget;
	
	private String inQty;
	private String inDate;
	private String updateJson;
	private String resultYn;
	private String resMessage;
	private String resIdx;
	
	private String bizOrdDtlCnt;
	private String conFirmCnt;
	private String purOrdCnt;
	private String prodOutCnt;
	private String workMethodJson;
	
	//추가사항
	private String bizOrderNo;
	private String bizOrdSeq;
	private String prjSeq;
	private String customerNo;
	private String poNo;
	private String customerDesc;
	private String poDesc;
	private String goodsTypeCd;
	private String goodsTypeNm;
	private String goodsNm;
	private String abroadGubun;
	private String ordCost;
	private String ordAmt;
	private String prjCd;
	private String prjNm;
	private String remainAmt;
	private String remainPublishAmt;
	private String inCompleteAmt;
	private String salesRecogGubun;
	private String contractGubun;
	private String useQty;
	private String projectIdx;
	
	private String bizOrderIdx;
	private String customerIdx;
	private String projectNm;
	private String bizOrdGubun;
	private String salesProgressGubun;
	private String prjCost;
	private String progressYn;
	private String customerNm;
	
	private String salesGubun;
	private String publishPreDate;
	private String publishAmt;
	private String publishDate;
	private String bizOrdSalesIdx;
	private String collectMonth;
	private String collectGubun;
	private String collectSub;
	private String collectDate;
	private String collectAmt;
	private String receiptDate;
	private String dueDate;
	private String seq;
	private String nowYear;
	private String lastYearAmt;
	private String thisYearAmt;
	private String carriedAmt;
	private String collectPreCheck;
	
	private String selYear;
	private String nowDate;
	
	private String gubun;
	private String noteCollectAmt;
	private String inCompleteAtm;
	
	private String yearMon;
	private String lastYearCollectAmt;
	private String thisYearCollectAmt;
	private String quarter;
	private String half;
	
	private String jan;
	private String feb;
	private String mar;
	private String apr;
	private String may;
	private String june;
	private String july;
	private String aug;
	private String sep;
	private String oct;
	private String nov;
	private String dec;
	private String dealSum;
	
	//출고등록
	private String status;
	private String outDate;
	private String remainQty;
	private String projectCd;
	private String bizOrdIdx;
	private String outReqIdx;
	private String outReqNo;
	private String serialNo;
	
	private String planIdx;
	
	//수주등록(해외)
	private String inVoice;
	private String buyer;
	private String country;
	private String costUnit;
	private String exchangeDate;
	private String exchangeRate;
	private String currencyAmt;
	private String transCondition;
	private String shipmentDate;
	private String userName;
	private String abroadDesc;
	private String serialCnt;
	
	//프로젝트 테이블
	private String targetDate;
	private String customer;
	private String progressAmt;
	private int prjQty;
}
