package mes.persistence.pm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.pm.PurchaseOrderVo;

@Repository
public class PurchaseOrderDAOImpl implements PurchaseOrderDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.pm.purchaseOrderMapper";
	
	// =========================== 자재구매요청 ==========================================
	// 자재구매요청 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLst", purchaseOrderVo);
	}
	
	// 자재구매요청 상세조회
	@Override
	public PurchaseOrderVo purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectOne(namespace+".purchaseOrderAdmSel", purchaseOrderVo);
	}
	
	// 자재구매요청 요청번호 조회
	@Override
	public String purchaseOrderAdmGetOrderNo() throws Exception {
		return session.selectOne(namespace+".purchaseOrderAdmGetOrderNo");
	}
	
	// 자재구매요청 등록
	@Override
	public void purchaseOrderAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.insert(namespace+".purchaseOrderAdmIns", purchaseOrderVo);
	}
	
	// 자재구매요청 수정
	@Override
	public void purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchaseOrderAdmUpd", purchaseOrderVo);
	}
	
	// 자재구매요청 삭제
	@Override
	public void purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.delete(namespace+".purchaseOrderAdmDel", purchaseOrderVo);
	}
	
	// =========================== 발주관리 ==========================================
	// 발주관리 요청번호별 조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmOrderNoLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmOrderNoLst", purchaseOrderVo);
	}
	
	// 발주관리를 등록할 수 있는 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmInsertLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmInsertLst", purchaseOrderVo);
	}
	
	// 발주관리 발주번호 조회
	@Override
	public String purchaseOrderDtlGetOrderDtlNo() throws Exception {
		return session.selectOne(namespace+".purchaseOrderDtlGetOrderDtlNo");
	}
	
	// 발주관리 등록
	@Override
	public void purchaseOrderDtlIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.insert(namespace+".purchaseOrderDtlIns", purchaseOrderVo);
	}
	
	// 발주관리 수정
	@Override
	public void purchaseOrderDtlUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchaseOrderDtlUpd", purchaseOrderVo);
	}
	
	// 발주관리 삭제
	@Override
	public void purchaseOrderDtlDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.delete(namespace+".purchaseOrderDtlDel", purchaseOrderVo);
	}
	
	// 발주번호 입고여부 확인
	@Override
	public int inProdWhsAdmCnt(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectOne(namespace+".inProdWhsAdmCnt", purchaseOrderVo);
	}
	
	// 발주관리 발주 종료
	@Override
	public void completeYnUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".completeYnUpd", purchaseOrderVo);
	}
	
	// 발주관리 발주확정/취소
	@Override
	public void confirmYnUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".confirmYnUpd", purchaseOrderVo);
	}
	
	// =========================== 입고관리 ==========================================
	// 입고관리를 등록할 수 있는 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderDtlInsertLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderDtlInsertLst", purchaseOrderVo);
	}
	
	// 입고등록 입고번호 조회
	@Override
	public String inProdWhsAdmGetInSlipNo() throws Exception {
		return session.selectOne(namespace+".inProdWhsAdmGetInSlipNo");
	}
	
	// 입고등록
	@Override
	public void inProdWhsAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.insert(namespace+".inProdWhsAdmIns", purchaseOrderVo);
	}
	
	// =========================== 출고관리 ==========================================
	// 출고관리를 등록할 수 있는 목록조회
	@Override
	public List<PurchaseOrderVo> outProdLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".outProdLst", purchaseOrderVo);
	}
	
	//자재사용등록 상세조회
	@Override
	public PurchaseOrderVo outProdSel(PurchaseOrderVo purchaseOrderVo) throws Exception{
		return session.selectOne(namespace+".outProdSel", purchaseOrderVo);	
	}
	
	// 자재사용등록 사용번호 조회
	@Override
	public String outProdWhsAdmGetOutSlipNo() throws Exception {
		return session.selectOne(namespace+".outProdWhsAdmGetOutSlipNo");
	}
	
	// 자재사용등록
	@Override
	public void outProdWhsAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.insert(namespace+".outProdWhsAdmIns", purchaseOrderVo);
	}
	
	// 자재사용등록 수정
	@Override
	public void outProdWhsAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".outProdWhsAdmUpd", purchaseOrderVo);
	}
	
	// =========================== 입고관리 ==========================================
	// 통합발주관리대장 목록조회
	@Override
	public List<PurchaseOrderVo> totalPurchaseOrderLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".totalPurchaseOrderLst", purchaseOrderVo);
	}
	
	// =========================== 발주서 출력 ==========================================
	// 발주서출력 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderPrintUpvoteLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderPrintUpvoteLst", purchaseOrderVo);
	}
	// 발주서출력 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderPrintLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderPrintLst", purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@Override
	public void purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchasePaperUpd", purchaseOrderVo);
	}
	
	// =========================== 개별발주 리스트 ==========================================
	// 개별발주 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseIndividualLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseIndividualLst", purchaseOrderVo);
	}
	
	/*
	
	// =========================== 발주관리 메인 ==========================================
	// 발주관리 메인 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLst", purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstByPurchasePrintNo", purchaseOrderVo);
	}
	
	// 발주관리 수주상세식별자별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstByBizDtlIdx", purchaseOrderVo);
	}
	
	// 발주관리 발주서번호별 입고 상세 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderDtlLstByPurchasePrintNo(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderDtlLstByPurchasePrintNo", purchaseOrderVo);
	}
	
	// 발주관리 수주별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByBizDtl(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstByBizDtl", purchaseOrderVo);
	}
	
	// 발주관리 공정별 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstByWorkOrdPrcss(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstByWorkOrdPrcss", purchaseOrderVo);
	}
	
	// 발주관리 개별발주 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstBySingle(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstBySingle", purchaseOrderVo);
	}
	
	// 발주관리 메인 상세조회
	@Override
	public PurchaseOrderVo purchaseOrderAdmSel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectOne(namespace+".purchaseOrderAdmSel", purchaseOrderVo);
	}
	
	// 발주관리 메인 등록
	@Override
	public String purchaseOrderAdmIns(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.insert(namespace+".purchaseOrderAdmIns", purchaseOrderVo);
		String idx = purchaseOrderVo.getReturnIdx();
		return idx;
	}
	
	// 발주관리 메인 수정
	@Override
	public void purchaseOrderAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchaseOrderAdmUpd", purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdx(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectOne(namespace+".purchaseOrderAdmUpdCheckByBizOrdDtlIdx", purchaseOrderVo);
	}
	
	// 발주관리 메인 수정/삭제 체크
	@Override
	public PurchaseOrderVo purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectOne(namespace+".purchaseOrderAdmUpdCheckByBizOrdDtlIdxJson", purchaseOrderVo);
	}
	
	// 발주관리 입고예정일 수정
	@Override
	public void purchaseOrderInDueDateAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchaseOrderInDueDateAdmUpd", purchaseOrderVo);
	}
	
	// 발주관리 주문수량 수정
	@Override
	public void purchaseOrderQtyAdmUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchaseOrderQtyAdmUpd", purchaseOrderVo);
	}
	
	// 발주관리 메인 삭제
	@Override
	public void purchaseOrderAdmDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.delete(namespace+".purchaseOrderAdmDel", purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 및 출력여부 수정
	@Override
	public void purchasePaperUpd(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchasePaperUpd", purchaseOrderVo);
	}
	
	// 발주관리 발주서 출력번호 삭제 및 출력여부 수정
	@Override
	public void purchasePaperDel(PurchaseOrderVo purchaseOrderVo) throws Exception {
		session.update(namespace+".purchasePaperDel", purchaseOrderVo);
	}
	
	// =========================== 발주관리 입고등록페이지 ==========================================
	// 발주 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstSumInQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstSumInQty", purchaseOrderVo);
	}
	
	// =========================== 발주관리 필요량 계산 ==========================================
	// 발주 재질별 필요량 계산 목록조회
	@Override
	public List<PurchaseOrderVo> purchaseOrderAdmLstWithNeedQty(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".purchaseOrderAdmLstWithNeedQty", purchaseOrderVo);
	}

	// =========================== 입고원장 페이지 ==========================================
	// 입고원장 목록조회
	@Override
	public List<PurchaseOrderVo> inOrginLst(PurchaseOrderVo purchaseOrderVo) throws Exception {
		return session.selectList(namespace+".inOrginLst", purchaseOrderVo);
	}
	
	*/
	
}
