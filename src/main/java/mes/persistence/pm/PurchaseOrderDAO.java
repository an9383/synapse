package mes.persistence.pm;

import java.util.List;

import mes.domain.pm.PurchaseOrderVo;

public interface PurchaseOrderDAO {

	// =========================== 자재구매요청 ==========================================
	// 자재구매요청 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재구매요청 상세조회
	public PurchaseOrderVo purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재구매요청 요청번호 조회
	public String purchaseOrderAdmGetOrderNo() throws Exception;
	
	// 자재구매요청 등록
	public void purchaseOrderAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재구매요청 수정
	public void purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재구매요청 삭제
	public void purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 발주관리 ==========================================
	// 발주관리 요청번호별 조회
	public List<PurchaseOrderVo> purchaseOrderAdmOrderNoLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리를 등록할 수 있는 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmInsertLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주번호 조회
	public String purchaseOrderDtlGetOrderDtlNo() throws Exception;
	
	// 발주관리 등록
	public void purchaseOrderDtlIns(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 수정
	public void purchaseOrderDtlUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 삭제
	public void purchaseOrderDtlDel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주번호 입고여부 확인
	public int inProdWhsAdmCnt(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주 종료
	public void completeYnUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주확정/취소
	public void confirmYnUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 입고관리 ==========================================
	// 입고관리를 등록할 수 있는 목록조회
	public List<PurchaseOrderVo> purchaseOrderDtlInsertLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 입고등록 입고번호 조회
	public String inProdWhsAdmGetInSlipNo() throws Exception;
	
	// 입고등록
	public void inProdWhsAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 자재사용등록 ==========================================
	// 자재사용등록 목록조회
	public List<PurchaseOrderVo> outProdLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	//자재사용등록 상세조회
	public PurchaseOrderVo outProdSel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재사용등록 사용번호 조회
	public String outProdWhsAdmGetOutSlipNo() throws Exception;
	
	// 자재사용등록
	public void outProdWhsAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 자재사용등록 수정
	public void outProdWhsAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 입고관리 ==========================================
	// 통합발주관리대장 목록조회
	public List<PurchaseOrderVo> totalPurchaseOrderLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 발주서 출력 ==========================================
	// 발주서출력 목록조회
	public List<PurchaseOrderVo> purchaseOrderPrintUpvoteLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주서출력 목록조회
	public List<PurchaseOrderVo> purchaseOrderPrintLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	public void purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 개별발주 리스트 ==========================================
	// 개별발주 목록조회
	public List<PurchaseOrderVo> purchaseIndividualLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	/*
	
	// =========================== 발주관리 메인 ==========================================
	// 발주관리 메인 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서번호별 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 수주상세식별자별 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	public List<PurchaseOrderVo> purchaseOrderDtlLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception;

	// 발주관리 수주별 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtl(PurchaseOrderVo purchaseOrderVo) throws Exception;

	// 발주관리 공정별 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstByWorkOrdPrcss(PurchaseOrderVo purchaseOrderVo) throws Exception;

	// 발주관리 개별발주 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstBySingle(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 상세조회
	public PurchaseOrderVo purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 등록
	public String purchaseOrderAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 수정
	public void purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 수정/삭제 체크
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception;

	// 발주관리 메인 수정/삭제 체크
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(PurchaseOrderVo purchaseOrderVo) throws Exception;

	// 발주관리 입고예정일 수정
	public void purchaseOrderInDueDateAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 주문수량 수정
	public void purchaseOrderQtyAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 삭제
	public void purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	public void purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	public void purchasePaperDel(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstSumInQty(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	public List<PurchaseOrderVo> purchaseOrderAdmLstWithNeedQty(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	public List<PurchaseOrderVo> inOrginLst(PurchaseOrderVo purchaseOrderVo) throws Exception;
	
	*/
}
