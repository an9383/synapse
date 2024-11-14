package mes.persistence.sc;

import java.util.List;

import mes.domain.sc.ScmPurchaseOrderVo2;

public interface ScmPurchaseOrderDAO2 {

	// =========================== 발주관리 메인 ==========================================
	// 발주관리 메인 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLst(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서번호별 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByPurchasePrintNo(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 수주상세식별자별 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByBizDtlIdx(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderDtlLstByPurchasePrintNo(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;

	// 발주관리 수주별 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByBizDtl(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;

	// 발주관리 공정별 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByWorkOrdPrcss(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;

	// 발주관리 개별발주 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstBySingle(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 상세조회
	public ScmPurchaseOrderVo2 purchaseOrderAdmSel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 등록
	public String purchaseOrderAdmIns(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 수정
	public void purchaseOrderAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 수정/삭제 체크
	public ScmPurchaseOrderVo2 purchaseOrderAdmUpdCheckByBizOrdDtlIdx(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;

	// 발주관리 메인 수정/삭제 체크
	public ScmPurchaseOrderVo2 purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;

	// 발주관리 입고예정일 수정
	public void purchaseOrderInDueDateAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 주문수량 수정
	public void purchaseOrderQtyAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 메인 삭제
	public void purchaseOrderAdmDel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	public void purchasePaperUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	public void purchasePaperDel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstSumInQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstWithNeedQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
	
	// 발주 재질별 가용재고량 목록 조회
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstWithAsQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
		
	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	public List<ScmPurchaseOrderVo2> inOrginLst(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception;
}
