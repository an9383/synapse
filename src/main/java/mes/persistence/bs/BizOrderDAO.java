package mes.persistence.bs;

import java.util.List;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.bs.BizOrderVo;

public interface BizOrderDAO {

	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	public List<BizOrderVo> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 목록조회
	public List<BizOrderVo> bizOrderAdmPureLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 상세조회
	public BizOrderVo bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 등록
	public String bizOrderAdmIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 수정
	public void bizOrderAdmUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 삭제
	public void bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 목형코드 중복확인
	public BizOrderVo bizOrderAdmIdDupCheck(BizOrderVo bizOrderVo) throws Exception;
	
	//수주 프로젝트 채번 Seq
	public BizOrderVo prjCdSeq(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주 프로젝트 생성
	public String bizOrderProjectIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주 수량 사용이력
	public void bizProjectUseIns(BizOrderVo bizOrderVo) throws Exception;
	
	// =========================== 수주관리 상세 ==========================================
	// 수주관리 상세 등록할 때 현재고체크
	public List<BizOrderVo> bizOrderSpQtySel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 목록조회
	public List<BizOrderVo> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 상세조회
	public BizOrderVo bizOrderDtlSel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 등록
	public void bizOrderDtlIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 수정
	public void bizOrderDtlUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 등록
	public void bizOrderCollectIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 수정
	public void bizOrderCollectUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 삭제
	public void bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 수주 상태 수정
	public void bizOrderDtlStatusUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 수정 - 팀별일정조정표
	public void bizOrderDtlUpdByTeamSchedule(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 수주중지
	public void bizOrderDtlStop(BizOrderVo bizOrderVo) throws Exception;
	
	// 출고시 수주 상태값 수정
	public void bizOrderDtlStatusUpdWithItemOut(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 수정
	public void bizOrderDtlStockYnUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 삭제
	public void bizOrderDtlDel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 취소처리
	public void bizOrderDtlCancel(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 상세 PO완료처리
	public void bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception;
	
	// =========================== 수주현황 ==========================================
	// 수주관리 전체 목록조회(수주별발주미포함)
	public List<BizOrderVo> bizOrderCollectLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 전체 목록조회(수주별발주포함)
	public List<BizOrderVo> bizOrderStatusLstWithPO(BizOrderVo bizOrderVo) throws Exception;

	// =========================== 공정정보 ==========================================
	//수주관리 제품공정 목록
	public List<ItemInfoAdmVo> bizOrderItemPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 작지공정 목록
	public List<ItemInfoAdmVo> bizOrderWorkOrderPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 제품공정 작업계획확정 전 작업지시 체크
	public List<ItemInfoAdmVo> bizOrderWorkOrderCheckList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
		
	//수주관리 제품공정 작업계획확정
	public void bizOrderWorkOrderInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 제품공정 복사
	public void bizOrderItemPrcssCopy(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
		
	//수주관리 제품공정 등록
	public void bizOrderItemPrcssInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
		
	//수주관리 제품공정 삭제
	public void bizOrderItemPrcssDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	// =========================== 투입자재 ==========================================
	//수주관리 투입자재 목록
	public List<ItemInfoAdmVo> bizOrderItemBomList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 투입자재 등록
	public void bizOrderItemBomInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 투입자재 삭제
	public void bizOrderItemBomDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	// =========================== 번들링 ==========================================
	//수주관리 번들링 목록
	public List<ItemInfoAdmVo> bizOrderDtlBundleList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//수주관리 번들링 등록
	public void bizOrderDtlBundleIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
		
	//수주관리 번들링 삭제
	public void bizOrderDtlBundleDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	// =========================== 수주집계표 ==========================================
	// 수주관리 수주집계표 수주기간별 수주처 목록조회
	public List<BizOrderVo> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 수주집계표 수주처별 목록조회
	public List<BizOrderVo> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계-GROUP BY 거래처명
	public List<BizOrderVo> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계-GROUP BY 장비유형
	public List<BizOrderVo> bizOrderAdmLstGroupByGoodsType(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계- 월별실적
	public List<BizOrderVo> bizOrderAdmLstGroupByYearMon(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계- 분기별실적
	public List<BizOrderVo> bizOrderAdmLstGroupByQuarter(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계- 반기별실적
	public List<BizOrderVo> bizOrderAdmLstGroupByHalf(BizOrderVo bizOrderVo) throws Exception;
	
	// 수금/매출/미수금 집계- 월별매출
	public List<BizOrderVo> bizOrderSalesGroupByDealMon(BizOrderVo bizOrderVo) throws Exception;
	
	//********************************************* 수주등록(해외) **********************
	// 수주관리 메인 등록
	public String bizOrderAdmAbroadIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주관리 메인 수정
	public void bizOrderAdmAbroadUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주등록(해외) 메인 삭제
	public void bizOrderAdmAbroadDel(BizOrderVo bizOrderVo) throws Exception;
	
	// =========================== 수주 SerialNo ==========================================
	// 수주 SerialNo 목록조회
	public List<BizOrderVo> bizSerialNoLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주 SerialNo 등록
	public void bizSerialNoIns(BizOrderVo bizOrderVo) throws Exception;
	
	// 수주 SerialNo 수정
	public void bizSerialNoUpd(BizOrderVo bizOrderVo) throws Exception;
	
	// =========================== 프로젝트 목록 ===========================
	// 프로젝트 목록조회
	public List<BizOrderVo> bizProjectLst(BizOrderVo bizOrderVo) throws Exception;
	
	// 진행여부 업데이트
	public void progressYnUpd(BizOrderVo bizOrderVo) throws Exception;
}
