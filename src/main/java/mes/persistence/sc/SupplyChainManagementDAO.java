package mes.persistence.sc;

import java.util.List;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.SupplyChainManagementVo;

public interface SupplyChainManagementDAO {

	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	public List<SupplyChainManagementVo> purchaseUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception;
	
	public SupplyChainManagementVo scmFileSel(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 등록
	public void purchaseDeliveryYnIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정
	public void purchaseDeliveryYnUpd(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 등록
	public void planFileIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정
	public void reportFileIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 메인 삭제
	public void bizOrderCollectDel(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수주 상태 수정
	public void bizOrderDtlStatusUpd(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정 - 팀별일정조정표
	public void bizOrderDtlUpdByTeamSchedule(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 수주중지
	public void bizOrderDtlStop(SupplyChainManagementVo scmVo) throws Exception;
	
	// 출고시 수주 상태값 수정
	public void bizOrderDtlStatusUpdWithItemOut(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 수정
	public void bizOrderDtlStockYnUpd(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 삭제
	public void bizOrderDtlDel(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 취소처리
	public void bizOrderDtlCancel(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 상세 PO완료처리
	public void bizOrderAdmConfirm(SupplyChainManagementVo scmVo) throws Exception;
	
	// =========================== 수주현황 ==========================================
	// 수주관리 전체 목록조회(수주별발주미포함)
	public List<SupplyChainManagementVo> bizOrderCollectLst(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 전체 목록조회(수주별발주포함)
	public List<SupplyChainManagementVo> bizOrderStatusLstWithPO(SupplyChainManagementVo scmVo) throws Exception;

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
	public List<SupplyChainManagementVo> bizOrderAdmLstAsDealCorp(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 수주집계표 수주처별 목록조회
	public List<SupplyChainManagementVo> bizOrderDtlLstByDealCorp(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계-GROUP BY 거래처명
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByDealCorp(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계-GROUP BY 장비유형
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByGoodsType(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계- 월별실적
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByYearMon(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계- 분기별실적
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByQuarter(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계- 반기별실적
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByHalf(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수금/매출/미수금 집계- 월별매출
	public List<SupplyChainManagementVo> bizOrderSalesGroupByDealMon(SupplyChainManagementVo scmVo) throws Exception;
	
	//********************************************* 수주등록(해외) **********************
	// 수주관리 메인 등록
	public String bizOrderAdmAbroadIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주관리 메인 수정
	public void bizOrderAdmAbroadUpd(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주등록(해외) 메인 삭제
	public void bizOrderAdmAbroadDel(SupplyChainManagementVo scmVo) throws Exception;
	
	// =========================== 수주 SerialNo ==========================================
	// 수주 SerialNo 목록조회
	public List<SupplyChainManagementVo> bizSerialNoLst(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주 SerialNo 등록
	public void bizSerialNoIns(SupplyChainManagementVo scmVo) throws Exception;
	
	// 수주 SerialNo 수정
	public void bizSerialNoUpd(SupplyChainManagementVo scmVo) throws Exception;
}
