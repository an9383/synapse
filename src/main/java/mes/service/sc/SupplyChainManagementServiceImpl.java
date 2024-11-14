package mes.service.sc;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.sc.SupplyChainManagementVo;
import mes.persistence.sc.SupplyChainManagementDAO;

@Service
public class SupplyChainManagementServiceImpl implements SupplyChainManagementService {

	@Inject
	private SupplyChainManagementDAO dao;
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@Override
	public List<SupplyChainManagementVo> purchaseUpvoteYnLst(SupplyChainManagementVo scmVo) throws Exception {
		return dao.purchaseUpvoteYnLst(scmVo);
	}
	
	@Override
	public SupplyChainManagementVo scmFileSel(SupplyChainManagementVo scmVo) throws Exception {
		return dao.scmFileSel(scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void purchaseDeliveryYnIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.purchaseDeliveryYnIns(scmVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void purchaseDeliveryYnUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.purchaseDeliveryYnUpd(scmVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void planFileIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.planFileIns(scmVo);
	}
	
	@Override
	public void reportFileIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.reportFileIns(scmVo);
	}
	
	// 수주관리 메인 삭제
	@Override
	public void bizOrderCollectDel(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderCollectDel(scmVo);
	}
	
	// 수주관리 상세 수주 상태 수정
	@Override
	public void bizOrderDtlStatusUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlStatusUpd(scmVo);
	}
	
	// 수주관리 상세 수정 - 팀별일정조정표
	@Override
	public void bizOrderDtlUpdByTeamSchedule(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlUpdByTeamSchedule(scmVo);
	}
	
	// 수주관리 수주중지
	@Override
	public void bizOrderDtlStop(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlStop(scmVo);
	}
	
	// 출고시 수주 상태값 수정
	@Override
	public void bizOrderDtlStatusUpdWithItemOut(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlStatusUpdWithItemOut(scmVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void bizOrderDtlStockYnUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlStockYnUpd(scmVo);
	}
		
	// 수주관리 상세 삭제
	@Override
	public void bizOrderDtlDel(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlDel(scmVo);
	}
	
	// 수주관리 상세 취소처리
	@Override
	public void bizOrderDtlCancel(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderDtlCancel(scmVo);
	}
	
	// 수주관리 상세 PO완료처리
	@Override
	public void bizOrderAdmConfirm(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderAdmConfirm(scmVo);
	}
	
	// =========================== 수주현황 ==========================================
	// 수주관리 전체 목록조회(수주별발주미포함)
	@Override
	public List<SupplyChainManagementVo> bizOrderCollectLst(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderCollectLst(scmVo);
	}
	
	// 수주관리 전체 목록조회(수주별발주포함)
	@Override
	public List<SupplyChainManagementVo> bizOrderStatusLstWithPO(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderStatusLstWithPO(scmVo);
	}
	
	// =========================== 공정정보 ==========================================
	//수주관리 제품공정 목록조회
	@Override
	public List<ItemInfoAdmVo> bizOrderItemPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.bizOrderItemPrcssList(itemInfoAdmVo);
	}
	
	//수주관리 작지공정 목록
	@Override
	public List<ItemInfoAdmVo> bizOrderWorkOrderPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.bizOrderWorkOrderPrcssList(itemInfoAdmVo);
	}
	
	//수주관리 제품공정 작업계획확정 전 작업지시 체크
	@Override
	public List<ItemInfoAdmVo> bizOrderWorkOrderCheckList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.bizOrderWorkOrderCheckList(itemInfoAdmVo);
	}
	
	//수주관리 제품공정 작업계획확정
	@Override
	public void bizOrderWorkOrderInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderWorkOrderInsert(itemInfoAdmVo);
	}
	
	//수주관리 제품공정 복사
	@Override
	public void bizOrderItemPrcssCopy(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderItemPrcssCopy(itemInfoAdmVo);
	}
	
	//수주관리 제품공정 등록
	@Override
	public void bizOrderItemPrcssInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderItemPrcssInsert(itemInfoAdmVo);
	}
	
	//수주관리 제품공정 삭제
	@Override
	public void bizOrderItemPrcssDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderItemPrcssDelete(itemInfoAdmVo);
	}
	
	// =========================== 투입자재 ==========================================
	//수주관리 투입자재 목록조회
	@Override
	public List<ItemInfoAdmVo> bizOrderItemBomList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.bizOrderItemBomList(itemInfoAdmVo);
	}
	
	//수주관리 투입자재 등록
	@Override
	public void bizOrderItemBomInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderItemBomInsert(itemInfoAdmVo);
	}
	
	//수주관리 투입자재 삭제
	@Override
	public void bizOrderItemBomDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderItemBomDelete(itemInfoAdmVo);
	}
	
	// =========================== 번들링 ==========================================
	//수주관리 번들링 목록
	@Override
	public List<ItemInfoAdmVo> bizOrderDtlBundleList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.bizOrderDtlBundleList(itemInfoAdmVo );
	}
	
	//수주관리 번들링 등록
	@Override
	public void bizOrderDtlBundleIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderDtlBundleIns(itemInfoAdmVo);
	}
	
	//수주관리 번들링 삭제
	@Override
	public void bizOrderDtlBundleDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.bizOrderDtlBundleDel(itemInfoAdmVo);
	}
	
	// =========================== 수주집계표 ==========================================
	// 수주관리 수주집계표 수주기간별 수주처 목록조회
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstAsDealCorp(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstAsDealCorp(scmVo);
	}
	
	// 수주관리 수주집계표 수주처별 목록조회
	@Override
	public List<SupplyChainManagementVo> bizOrderDtlLstByDealCorp(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderDtlLstByDealCorp(scmVo);
	}
	
	// 수금/매출/미수금 집계-GROUP BY 거래처명
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByDealCorp(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstGroupByDealCorp(scmVo);
	}
	
	// 수금/매출/미수금 집계-GROUP BY 장비유형
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByGoodsType(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstGroupByGoodsType(scmVo);
	}
	
	// 수금/매출/미수금 집계- 월별실적
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByYearMon(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstGroupByYearMon(scmVo);
	}
	
	// 수금/매출/미수금 집계- 분기별실적
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByQuarter(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstGroupByQuarter(scmVo);
	}
	
	// 수금/매출/미수금 집계- 반기별실적
	@Override
	public List<SupplyChainManagementVo> bizOrderAdmLstGroupByHalf(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmLstGroupByHalf(scmVo);
	}
	
	// 수금/매출/미수금 집계- 월별매출
	@Override
	public List<SupplyChainManagementVo> bizOrderSalesGroupByDealMon(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderSalesGroupByDealMon(scmVo);
	}
	
	//********************************* 수주등록(해외) **********************************
	// 수주등록(해외) 메인 등록
	@Override
	public String bizOrderAdmAbroadIns(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizOrderAdmAbroadIns(scmVo);
	}
	
	// 수주등록(해외) 메인 수정
	@Override
	public void bizOrderAdmAbroadUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizOrderAdmAbroadUpd(scmVo);
	}
	
	// 수주등록(해외) 메인 삭제
	@Override
	public void bizOrderAdmAbroadDel(SupplyChainManagementVo scmVo) throws Exception{
		dao.bizOrderAdmAbroadDel(scmVo);
	}
	
	// =========================== 수주 SerialNo ==========================================
	// 수주 SerialNo 목록조회
	@Override
	public List<SupplyChainManagementVo> bizSerialNoLst(SupplyChainManagementVo scmVo) throws Exception {
		return dao.bizSerialNoLst(scmVo);
	}
	
	// 수주 SerialNo 등록
	@Override
	public void bizSerialNoIns(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizSerialNoIns(scmVo);
	}
	
	// 수주 SerialNo 수정
	@Override
	public void bizSerialNoUpd(SupplyChainManagementVo scmVo) throws Exception {
		dao.bizSerialNoUpd(scmVo);
	}
}
