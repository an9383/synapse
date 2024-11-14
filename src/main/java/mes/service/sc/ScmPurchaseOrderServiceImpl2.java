package mes.service.sc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sc.ScmPurchaseOrderVo2;
import mes.persistence.sc.ScmPurchaseOrderDAO2;

@Service
public class ScmPurchaseOrderServiceImpl2 implements ScmPurchaseOrderService2 {

	@Inject
	private ScmPurchaseOrderDAO2 dao;
	
	// =========================== 발주관리 메인 ==========================================
	// 발주관리 메인 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLst(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLst(purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByPurchasePrintNo(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByPurchasePrintNo(purchaseOrderVo);
	}
	
	// 발주관리 수주상세식별자별 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByBizDtlIdx(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByBizDtlIdx(purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderDtlLstByPurchasePrintNo(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderDtlLstByPurchasePrintNo(purchaseOrderVo);
	}
	
	// 발주관리 수주별 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByBizDtl(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByBizDtl(purchaseOrderVo);
	}
	
	// 발주관리 공정별 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstByWorkOrdPrcss(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstByWorkOrdPrcss(purchaseOrderVo);
	}
	
	// 발주관리 개별발주 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstBySingle(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstBySingle(purchaseOrderVo);
	}
	
	// 발주관리 메인 상세조회
	@Override
	public ScmPurchaseOrderVo2 purchaseOrderAdmSel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmSel(purchaseOrderVo);
	}
	
	// 발주관리 메인 등록
	@Override
	public String purchaseOrderAdmIns(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmIns(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정
	@Override
	public void purchaseOrderAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public ScmPurchaseOrderVo2 purchaseOrderAdmUpdCheckByBizOrdDtlIdx(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmUpdCheckByBizOrdDtlIdx(purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public ScmPurchaseOrderVo2 purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(purchaseOrderVo);
	}
	
	// 발주관리 입고예정일 수정
	@Override
	public void purchaseOrderInDueDateAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchaseOrderInDueDateAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 주문수량 수정
	@Override
	public void purchaseOrderQtyAdmUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchaseOrderQtyAdmUpd(purchaseOrderVo);
	}
	
	// 발주관리 메인 삭제
	@Override
	public void purchaseOrderAdmDel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchaseOrderAdmDel(purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@Override
	public void purchasePaperUpd(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchasePaperUpd(purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	@Override
	public void purchasePaperDel(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		dao.purchasePaperDel(purchaseOrderVo);
	}
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstSumInQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstSumInQty(purchaseOrderVo);
	}
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstWithNeedQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstWithNeedQty(purchaseOrderVo);
	}
	
	// 발주 재질별 가용재고량 목록 조회
	@Override
	public List<ScmPurchaseOrderVo2> purchaseOrderAdmLstWithAsQty(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.purchaseOrderAdmLstWithAsQty(purchaseOrderVo);
	}
	
	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	@Override
	public List<ScmPurchaseOrderVo2> inOrginLst(ScmPurchaseOrderVo2 purchaseOrderVo) throws Exception {
		return dao.inOrginLst(purchaseOrderVo);
	}
}
