package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.bs.BizOrderVo;
import mes.persistence.bs.BizOrderDAO;

@Service
public class BizOrderServiceImpl implements BizOrderService {

	@Inject
	private BizOrderDAO dao;
	
	// =========================== 수주관리 메인 ==========================================
	// 수주관리 메인 목록조회
	@Override
	public List<BizOrderVo> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLst(bizOrderVo);
	}
	
	// 수주관리 메인 목록조회
	@Override
	public List<BizOrderVo> bizOrderAdmPureLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmPureLst(bizOrderVo);
	}
	
	// 수주관리 메인 상세조회
	@Override
	public BizOrderVo bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmSel(bizOrderVo);
	}
	
	// 수주관리 메인 등록
	@Override
	public String bizOrderAdmIns(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmIns(bizOrderVo);
	}
	
	// 수주관리 메인 수정
	@Override
	public void bizOrderAdmUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderAdmUpd(bizOrderVo);
	}
		
	// 수주관리 메인 삭제
	@Override
	public void bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderAdmDel(bizOrderVo);
	}
	
	// 수주관리 메인 목형코드 중복확인
	@Override
	public BizOrderVo bizOrderAdmIdDupCheck(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmIdDupCheck(bizOrderVo);
	}
	
	//수주 프로젝트 채번 Seq
	@Override
	public BizOrderVo prjCdSeq(BizOrderVo bizOrderVo) throws Exception {
		 return dao.prjCdSeq(bizOrderVo);
	}
	
	// 수주 프로젝트 생성
	@Override
	public String bizOrderProjectIns(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderProjectIns(bizOrderVo);
	}
	
	// 수주 수량 사용이력
	@Override
	public void bizProjectUseIns(BizOrderVo bizOrderVo) throws Exception {
		dao.bizProjectUseIns(bizOrderVo);
	}
	
	// =========================== 수주관리 상세 ==========================================
	// 수주관리 상세 등록할 때 현재고체크
	@Override
	public List<BizOrderVo> bizOrderSpQtySel(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderSpQtySel(bizOrderVo);
	}
	
	// 수주관리 상세 목록조회
	@Override
	public List<BizOrderVo> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderDtlLst(bizOrderVo);
	}
	
	// 수주관리 상세 상세조회
	@Override
	public BizOrderVo bizOrderDtlSel(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderDtlSel(bizOrderVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void bizOrderDtlIns(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlIns(bizOrderVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void bizOrderDtlUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlUpd(bizOrderVo);
	}
	
	// 수주관리 상세 등록
	@Override
	public void bizOrderCollectIns(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderCollectIns(bizOrderVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void bizOrderCollectUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderCollectUpd(bizOrderVo);
	}
	
	// 수주관리 메인 삭제
	@Override
	public void bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderCollectDel(bizOrderVo);
	}
	
	// 수주관리 상세 수주 상태 수정
	@Override
	public void bizOrderDtlStatusUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlStatusUpd(bizOrderVo);
	}
	
	// 수주관리 상세 수정 - 팀별일정조정표
	@Override
	public void bizOrderDtlUpdByTeamSchedule(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlUpdByTeamSchedule(bizOrderVo);
	}
	
	// 수주관리 수주중지
	@Override
	public void bizOrderDtlStop(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlStop(bizOrderVo);
	}
	
	// 출고시 수주 상태값 수정
	@Override
	public void bizOrderDtlStatusUpdWithItemOut(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlStatusUpdWithItemOut(bizOrderVo);
	}
	
	// 수주관리 상세 수정
	@Override
	public void bizOrderDtlStockYnUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlStockYnUpd(bizOrderVo);
	}
		
	// 수주관리 상세 삭제
	@Override
	public void bizOrderDtlDel(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlDel(bizOrderVo);
	}
	
	// 수주관리 상세 취소처리
	@Override
	public void bizOrderDtlCancel(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderDtlCancel(bizOrderVo);
	}
	
	// 수주관리 상세 PO완료처리
	@Override
	public void bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderAdmConfirm(bizOrderVo);
	}
	
	// =========================== 수주현황 ==========================================
	// 수주관리 전체 목록조회(수주별발주미포함)
	@Override
	public List<BizOrderVo> bizOrderCollectLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderCollectLst(bizOrderVo);
	}
	
	// 수주관리 전체 목록조회(수주별발주포함)
	@Override
	public List<BizOrderVo> bizOrderStatusLstWithPO(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderStatusLstWithPO(bizOrderVo);
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
	public List<BizOrderVo> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstAsDealCorp(bizOrderVo);
	}
	
	// 수주관리 수주집계표 수주처별 목록조회
	@Override
	public List<BizOrderVo> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderDtlLstByDealCorp(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계-GROUP BY 거래처명
	@Override
	public List<BizOrderVo> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstGroupByDealCorp(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계-GROUP BY 장비유형
	@Override
	public List<BizOrderVo> bizOrderAdmLstGroupByGoodsType(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstGroupByGoodsType(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계- 월별실적
	@Override
	public List<BizOrderVo> bizOrderAdmLstGroupByYearMon(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstGroupByYearMon(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계- 분기별실적
	@Override
	public List<BizOrderVo> bizOrderAdmLstGroupByQuarter(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstGroupByQuarter(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계- 반기별실적
	@Override
	public List<BizOrderVo> bizOrderAdmLstGroupByHalf(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmLstGroupByHalf(bizOrderVo);
	}
	
	// 수금/매출/미수금 집계- 월별매출
	@Override
	public List<BizOrderVo> bizOrderSalesGroupByDealMon(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderSalesGroupByDealMon(bizOrderVo);
	}
	
	//********************************* 수주등록(해외) **********************************
	// 수주등록(해외) 메인 등록
	@Override
	public String bizOrderAdmAbroadIns(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizOrderAdmAbroadIns(bizOrderVo);
	}
	
	// 수주등록(해외) 메인 수정
	@Override
	public void bizOrderAdmAbroadUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizOrderAdmAbroadUpd(bizOrderVo);
	}
	
	// 수주등록(해외) 메인 삭제
	@Override
	public void bizOrderAdmAbroadDel(BizOrderVo bizOrderVo) throws Exception{
		dao.bizOrderAdmAbroadDel(bizOrderVo);
	}
	
	// =========================== 수주 SerialNo ==========================================
	// 수주 SerialNo 목록조회
	@Override
	public List<BizOrderVo> bizSerialNoLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizSerialNoLst(bizOrderVo);
	}
	
	// 수주 SerialNo 등록
	@Override
	public void bizSerialNoIns(BizOrderVo bizOrderVo) throws Exception {
		dao.bizSerialNoIns(bizOrderVo);
	}
	
	// 수주 SerialNo 수정
	@Override
	public void bizSerialNoUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.bizSerialNoUpd(bizOrderVo);
	}
	
	// =========================== 프로젝트 목록 ===========================
	// 프로젝트 목록조회
	@Override
	public List<BizOrderVo> bizProjectLst(BizOrderVo bizOrderVo) throws Exception {
		return dao.bizProjectLst(bizOrderVo);
	}
	
	// 진행여부 업데이트
	@Override
	public void progressYnUpd(BizOrderVo bizOrderVo) throws Exception {
		dao.progressYnUpd(bizOrderVo);
	}
}
