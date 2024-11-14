package mes.service.stock;

import java.util.List;

import mes.domain.stock.StockPaymentAdmVo;

public interface StockPaymentAdmService {
	
	// 수불관리 조회
	public StockPaymentAdmVo stockPaymentAdmSelBySpSourceNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불리스트 조회
	public List<StockPaymentAdmVo> stockLstBySpSourceNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 등록
	public void stockPaymentAdmIns(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 등록 ( 채번 없이 강제로 데이터만 등록 )
	public void stockPaymentAdmCompulsionIns(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 수정
	public void stockPaymentAdmUpd(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 삭제
	public void stockPaymentAdmDel(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 전표번호 조회
	public String stockPaymentAdmGetSpNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// ================================== 현재고현황 =======================================
	// 현재고현황 목록조회
	public List<StockPaymentAdmVo> stockPaymentAdmStatusLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;

	// 재고이동 목록조회
	public List<StockPaymentAdmVo> stockPaymentMoveLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불원장 목록조회
	public List<StockPaymentAdmVo> stockPaymentAdmOriginalLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;

	// ================================== 불용재고현황 =======================================
	// 불용재고현황 목록조회
	public List<StockPaymentAdmVo> obsoleteStockLst(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// ================================== 재고이동 ==========================================
	// 수불관리 등록
	public void stockPaymentAdmIns2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 수불관리 삭제
	public void stockPaymentAdmDel2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
}