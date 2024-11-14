package mes.service.sc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sc.ScmPurchaseOrderVo;
import mes.persistence.sc.ScmPurchaseOrderDAO;

@Service
public class ScmPurchaseOrderServiceImpl implements ScmPurchaseOrderService {

	@Inject
	private ScmPurchaseOrderDAO dao;
	
	// =========================== 자재구매요청 ==========================================
	// 자재구매요청 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderAdmLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLst(purchaseOrderVo);
	}
	
	// 자재구매요청 상세조회
	@Override
	public ScmPurchaseOrderVo purchaseOrderAdmSel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmSel(purchaseOrderVo);
	}
	
	// 자재구매요청 요청번호 조회
	@Override
	public String purchaseOrderAdmGetOrderNo() throws Exception {
		return dao.purchaseOrderAdmGetOrderNo();
	}
	
	// 자재구매요청 등록
	@Override
	public void purchaseOrderAdmIns(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmIns(purchaseOrderVo);
	}
	
	// 자재구매요청 수정
	@Override
	public void purchaseOrderAdmUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmUpd(purchaseOrderVo);
	}
	
	// 자재구매요청 삭제
	@Override
	public void purchaseOrderAdmDel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmDel(purchaseOrderVo);
	}
	
	// =========================== 발주관리 ==========================================
	// 발주관리 요청번호별 조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderAdmOrderNoLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmOrderNoLst(purchaseOrderVo);
	}
	
	// 발주관리를 등록할 수 있는 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderAdmInsertLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmInsertLst(purchaseOrderVo);
	}
	
	// 발주관리 발주번호 조회
	@Override
	public String purchaseOrderDtlGetOrderDtlNo() throws Exception {
		return dao.purchaseOrderDtlGetOrderDtlNo();
	}
	
	// 발주관리 등록
	@Override
	public void purchaseOrderDtlIns(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderDtlIns(purchaseOrderVo);
	}
	
	// 발주관리 수정
	@Override
	public void purchaseOrderDtlUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderDtlUpd(purchaseOrderVo);
	}
	
	// 발주관리 삭제
	@Override
	public void purchaseOrderDtlDel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderDtlDel(purchaseOrderVo);
	}
	
	// 발주번호 입고여부 확인
	@Override
	public int inProdWhsAdmCnt(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.inProdWhsAdmCnt(purchaseOrderVo);
	}
	
	// 발주관리 발주 종료
	@Override
	public void completeYnUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.completeYnUpd(purchaseOrderVo);
	}
	
	// 발주관리 발주확정/취소
	@Override
	public void confirmYnUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.confirmYnUpd(purchaseOrderVo);
	}
	
	// =========================== 입고관리 ==========================================
	// 입고관리를 등록할 수 있는 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderDtlInsertLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderDtlInsertLst(purchaseOrderVo);
	}
	
	// 입고등록 입고번호 조회
	@Override
	public String inProdWhsAdmGetInSlipNo() throws Exception {
		return dao.inProdWhsAdmGetInSlipNo();
	}
	
	// 입고등록
	@Override
	public void inProdWhsAdmIns(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.inProdWhsAdmIns(purchaseOrderVo);
	}
		
		
	// =========================== 자재사용등록 ==========================================
	// 자재사용등록 목록조회
	@Override
	public List<ScmPurchaseOrderVo> outProdLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.outProdLst(purchaseOrderVo);
	}
	
	//자재사용등록 상세조회
	@Override
	public ScmPurchaseOrderVo outProdSel(ScmPurchaseOrderVo purchaseOrderVo) throws Exception{
		return dao.outProdSel(purchaseOrderVo);		
	}
	
	// 자재사용등록 사용번호 조회
	@Override
	public String outProdWhsAdmGetOutSlipNo() throws Exception {
		return dao.outProdWhsAdmGetOutSlipNo();
	}
	
	// 자재사용등록
	@Override
	public void outProdWhsAdmIns(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.outProdWhsAdmIns(purchaseOrderVo);
	}
	
	// 자재사용등록 수정
	@Override
	public void outProdWhsAdmUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.outProdWhsAdmUpd(purchaseOrderVo);
	}
	
	// =========================== 입고관리 ==========================================
	// 통합발주관리대장 목록조회
	@Override
	public List<ScmPurchaseOrderVo> totalPurchaseOrderLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.totalPurchaseOrderLst(purchaseOrderVo);
	}
	
	// =========================== 발주서 출력 ==========================================
	// 발주서출력 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderPrintUpvoteLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderPrintUpvoteLst(purchaseOrderVo);
	}
	
	// 발주서출력 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseOrderPrintLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderPrintLst(purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@Override
	public void purchasePaperUpd(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchasePaperUpd(purchaseOrderVo);
	}
	
	// =========================== 개별발주 리스트 ==========================================
	// 개별발주 목록조회
	@Override
	public List<ScmPurchaseOrderVo> purchaseIndividualLst(ScmPurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseIndividualLst(purchaseOrderVo);
	}
	
	/*
	
	// =========================== 발주관리 메인 ==========================================
	// 발주관리 메인 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLst(purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByPurchasePrintNo(purchaseOrderVo);
	}
	
	// 발주관리 수주상세식별자별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByBizDtlIdx(purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderDtlLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderDtlLstByPurchasePrintNo(purchaseOrderVo);
	}
	
	// 발주관리 수주별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtl(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByBizDtl(purchaseOrderVo);
	}
	
	// 발주관리 공정별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByWorkOrdPrcss(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByWorkOrdPrcss(purchaseOrderVo);
	}
	
	// 발주관리 개별발주 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstBySingle(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstBySingle(purchaseOrderVo);
	}
	
	// 발주관리 메인 상세조회
	@Override
	public PurchaseOrderVo purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmSel(purchaseOrderVo);
	}
	
	// 발주관리 메인 등록
	@Override
	public String purchaseOrderAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmIns(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정
	@Override
	public void purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmUpdCheckByBizOrdDtlIdx(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(purchaseOrderVo);
	}
	
	// 발주관리 입고예정일 수정
	@Override
	public void purchaseOrderInDueDateAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderInDueDateAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 주문수량 수정
	@Override
	public void purchaseOrderQtyAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderQtyAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 메인 삭제
	@Override
	public void purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmDel(purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@Override
	public void purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchasePaperUpd(purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	@Override
	public void purchasePaperDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		dao.purchasePaperDel(purchaseOrderVo);
	}
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstSumInQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstSumInQty(purchaseOrderVo);
	}
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstWithNeedQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstWithNeedQty(purchaseOrderVo);
	}
	
	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	@Override
	public List<PurchaseOrderVo> inOrginLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return dao.inOrginLst(purchaseOrderVo);
	}
	
	*/
}
