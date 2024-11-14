package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.ProjectPlanVo;
import mes.persistence.bs.ProjectPlanDAO;

@Service
public class ProjectPlanServiceImpl implements ProjectPlanService {

	@Inject
	private ProjectPlanDAO dao;
	
	//프로젝트일정표 메인 목록조회
	@Override
	public List<ProjectPlanVo> projectPlanLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.projectPlanLst(projectPlanVo);
	}
	
	//프로젝트일정표 버전 목록조회
	@Override
	public List<ProjectPlanVo> projectPlanVersionLst(ProjectPlanVo projectPlanVo) throws Exception {
		return dao.projectPlanVersionLst(projectPlanVo);
	}
	
	// 프로젝트일정표 버전 중복확인
	@Override
	public int projectPlanVersionExistCheck(ProjectPlanVo projectPlanVo) throws Exception {
		return dao.projectPlanVersionExistCheck(projectPlanVo);
	}
	
	// 프로젝트일정표 등록
	@Override
	public void projectPlanIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.projectPlanIns(projectPlanVo);
	}
	
	// 프로젝트일정표 수정
	@Override
	public void projectPlanUpd(ProjectPlanVo projectPlanVo) throws Exception {
		dao.projectPlanUpd(projectPlanVo);
	}
	
	// 프로젝트일정표 행 삭제
	@Override
	public void projectPlanDel(ProjectPlanVo projectPlanVo) throws Exception {
		dao.projectPlanDel(projectPlanVo);
	}
	
	// =========================== 프로젝트 계획서 등록/수정 ==========================================
	// 프로젝트 계획서 등록
	@Override
	public void bizPrjPlanIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.bizPrjPlanIns(projectPlanVo);
	}
	
	// 프로젝트 계획서 수정
	@Override
	public void bizPrjPlanUpd(ProjectPlanVo projectPlanVo) throws Exception {
		dao.bizPrjPlanUpd(projectPlanVo);
	}
	
	//주요고객 요구사항
	@Override
	public void mainCustIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.mainCustIns(projectPlanVo);
	}
	
	//참여인력
	@Override
	public void inPeopleIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.inPeopleIns(projectPlanVo);
	}
	
	////재료비 및 매출이익
	@Override
	public void materialIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.materialIns(projectPlanVo);
	}
	
	//추진일정
	@Override
	public void carryDateIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.carryDateIns(projectPlanVo);
	}
	
	//산출물 List
	@Override
	public void outputsIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.outputsIns(projectPlanVo);
	}
	
	// 프로젝트 계획서 조회
	@Override
	public ProjectPlanVo bizPrjPlanSel(ProjectPlanVo projectPlanVo) throws Exception {
		return dao.bizPrjPlanSel(projectPlanVo);
	}
	
	//주요고객 요구사항 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanMaincustLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanMaincustLst(projectPlanVo);
	}
	
	//참여인력 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanUserLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanUserLst(projectPlanVo);
	}
	
	//재료비 및 매출이익 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanMaterialLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanMaterialLst(projectPlanVo);
	}
	
	//추진일정 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanCarryLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanCarryLst(projectPlanVo);
	}
	
	//산출물 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanOutputsLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanOutputsLst(projectPlanVo);
	}
	
	
	//프로젝트계획서 상신/승인 이력
	@Override
	public void upvoteApprovalHistIns(ProjectPlanVo projectPlanVo) throws Exception {
		dao.upvoteApprovalHistIns(projectPlanVo);
	}
	
	//프로젝트계획서 상신 처리
	@Override
	public void bizPrjPlanUpvoteYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		dao.bizPrjPlanUpvoteYnUpd(projectPlanVo);
	}
	
	//프로젝트 계획서 상신 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanUpvoteLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.bizPrjPlanUpvoteLst(projectPlanVo);
	}
	
	//프로젝트계획서 결재/반려
	@Override
	public void bizPrjPlanApprovalYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		dao.bizPrjPlanApprovalYnUpd(projectPlanVo);
	}
	
	//프로젝트 계획서 이력 조회
	@Override
	public List<ProjectPlanVo> upvoteApprovalHistLst(ProjectPlanVo projectPlanVo) throws Exception{
		return dao.upvoteApprovalHistLst(projectPlanVo);
	}
	
//	// =========================== 수주관리 메인 ==========================================
//	// 수주관리 메인 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmLst(bizOrderVo);
//	}
//	
//	// 수주관리 메인 목록조회-GROUP BY 고객사
//	@Override
//	public List<BizOrderVo> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmLstGroupByDealCorp(bizOrderVo);
//	}
//	
//	// 수주관리 메인 목록조회-GROUP BY 자재
//	@Override
//	public List<BizOrderVo> bizOrderDtlLstGroupByMatrl(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderDtlLstGroupByMatrl(bizOrderVo);
//	}
//	
//	// 수주관리 메인 상세조회
//	@Override
//	public BizOrderVo bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmSel(bizOrderVo);
//	}
//	
//	// 수주관리 메인 등록
//	@Override
//	public String bizOrderAdmIns(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmIns(bizOrderVo);
//	}
//	
//	// 수주관리 메인 수정
//	@Override
//	public void bizOrderAdmUpd(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderAdmUpd(bizOrderVo);
//	}
//		
//	// 수주관리 메인 삭제
//	@Override
//	public void bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderAdmDel(bizOrderVo);
//	}
//	
//	// 수주관리 메인 목형코드 중복확인
//	@Override
//	public BizOrderVo bizOrderAdmIdDupCheck(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmIdDupCheck(bizOrderVo);
//	}
//	
//	// =========================== 수주관리 상세 ==========================================
//	// 수주관리 상세 등록할 때 현재고체크
//	@Override
//	public List<BizOrderVo> bizOrderSpQtySel(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderSpQtySel(bizOrderVo);
//	}
//	
//	// 수주관리 상세 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderDtlLst(bizOrderVo);
//	}
//	
//	// 수주관리 상세 상세조회
//	@Override
//	public BizOrderVo bizOrderDtlSel(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderDtlSel(bizOrderVo);
//	}
//	
//	// 수주관리 상세 등록
//	@Override
//	public void bizOrderDtlIns(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlIns(bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderDtlUpd(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlUpd(bizOrderVo);
//	}
//	
//	// 수주관리 상세 등록
//	@Override
//	public void bizOrderCollectIns(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderCollectIns(bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderCollectUpd(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderCollectUpd(bizOrderVo);
//	}
//	
//	// 수주관리 메인 삭제
//	@Override
//	public void bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderCollectDel(bizOrderVo);
//	}
//	
//	// 수주관리 상세 수주 상태 수정
//	@Override
//	public void bizOrderDtlStatusUpd(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlStatusUpd(bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정 - 팀별일정조정표
//	@Override
//	public void bizOrderDtlUpdByTeamSchedule(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlUpdByTeamSchedule(bizOrderVo);
//	}
//	
//	// 수주관리 수주중지
//	@Override
//	public void bizOrderDtlStop(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlStop(bizOrderVo);
//	}
//	
//	// 출고시 수주 상태값 수정
//	@Override
//	public void bizOrderDtlStatusUpdWithItemOut(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlStatusUpdWithItemOut(bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderDtlStockYnUpd(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlStockYnUpd(bizOrderVo);
//	}
//		
//	// 수주관리 상세 삭제
//	@Override
//	public void bizOrderDtlDel(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlDel(bizOrderVo);
//	}
//	
//	// 수주관리 상세 취소처리
//	@Override
//	public void bizOrderDtlCancel(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderDtlCancel(bizOrderVo);
//	}
//	
//	// 수주관리 상세 PO완료처리
//	@Override
//	public void bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception {
//		dao.bizOrderAdmConfirm(bizOrderVo);
//	}
//	
//	// =========================== 수주현황 ==========================================
//	// 수주관리 전체 목록조회(수주별발주미포함)
//	@Override
//	public List<BizOrderVo> bizOrderCollectLst(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderCollectLst(bizOrderVo);
//	}
//	
//	// 수주관리 전체 목록조회(수주별발주포함)
//	@Override
//	public List<BizOrderVo> bizOrderStatusLstWithPO(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderStatusLstWithPO(bizOrderVo);
//	}
//	
//	// =========================== 공정정보 ==========================================
//	//수주관리 제품공정 목록조회
//	@Override
//	public List<ItemInfoAdmVo> bizOrderItemPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return dao.bizOrderItemPrcssList(itemInfoAdmVo);
//	}
//	
//	//수주관리 작지공정 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderWorkOrderPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return dao.bizOrderWorkOrderPrcssList(itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 작업계획확정 전 작업지시 체크
//	@Override
//	public List<ItemInfoAdmVo> bizOrderWorkOrderCheckList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return dao.bizOrderWorkOrderCheckList(itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 작업계획확정
//	@Override
//	public void bizOrderWorkOrderInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderWorkOrderInsert(itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 복사
//	@Override
//	public void bizOrderItemPrcssCopy(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderItemPrcssCopy(itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 등록
//	@Override
//	public void bizOrderItemPrcssInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderItemPrcssInsert(itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 삭제
//	@Override
//	public void bizOrderItemPrcssDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderItemPrcssDelete(itemInfoAdmVo);
//	}
//	
//	// =========================== 투입자재 ==========================================
//	//수주관리 투입자재 목록조회
//	@Override
//	public List<ItemInfoAdmVo> bizOrderItemBomList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return dao.bizOrderItemBomList(itemInfoAdmVo);
//	}
//	
//	//수주관리 투입자재 등록
//	@Override
//	public void bizOrderItemBomInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderItemBomInsert(itemInfoAdmVo);
//	}
//	
//	//수주관리 투입자재 삭제
//	@Override
//	public void bizOrderItemBomDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderItemBomDelete(itemInfoAdmVo);
//	}
//	
//	// =========================== 번들링 ==========================================
//	//수주관리 번들링 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderDtlBundleList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return dao.bizOrderDtlBundleList(itemInfoAdmVo );
//	}
//	
//	//수주관리 번들링 등록
//	@Override
//	public void bizOrderDtlBundleIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderDtlBundleIns(itemInfoAdmVo);
//	}
//	
//	//수주관리 번들링 삭제
//	@Override
//	public void bizOrderDtlBundleDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		dao.bizOrderDtlBundleDel(itemInfoAdmVo);
//	}
//	
//	// =========================== 수주집계표 ==========================================
//	// 수주관리 수주집계표 수주기간별 수주처 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderAdmLstAsDealCorp(bizOrderVo);
//	}
//	
//	// 수주관리 수주집계표 수주처별 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return dao.bizOrderDtlLstByDealCorp(bizOrderVo);
//	}
}
