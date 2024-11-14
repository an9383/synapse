package mes.service.bs;

import java.util.List;

import mes.domain.bs.ProjectPlanVo;

public interface ProjectPlanService {
	
	//프로젝트일정표 메인 목록조회
	public List<ProjectPlanVo> projectPlanLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트일정표 버전 목록조회
	public List<ProjectPlanVo> projectPlanVersionLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트일정표 버전 중복확인
	public int projectPlanVersionExistCheck(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트일정표 등록
	public void projectPlanIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트일정표 수정
	public void projectPlanUpd(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트일정표 행 삭제
	public void projectPlanDel(ProjectPlanVo projectPlanVo) throws Exception;
	
	// =========================== 프로젝트 계획서 등록/수정 ==========================================
	// 프로젝트 계획서 등록
	public void bizPrjPlanIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트 계획서 수정
	public void bizPrjPlanUpd(ProjectPlanVo projectPlanVo) throws Exception;
	
	//주요고객 요구사항
	public void mainCustIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	//참여인력
	public void inPeopleIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	//재료비 및 매출이익
	public void materialIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	//추진일정
	public void carryDateIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	//산출물 List
	public void outputsIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	// 프로젝트 계획서 조회
	public ProjectPlanVo bizPrjPlanSel(ProjectPlanVo projectPlanVo) throws Exception;
	
	//주요고객 요구사항 조회
	public List<ProjectPlanVo> bizPrjPlanMaincustLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//참여인력 조회
	public List<ProjectPlanVo> bizPrjPlanUserLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//재료비 및 매출이익 조회
	public List<ProjectPlanVo> bizPrjPlanMaterialLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//추진일정 조회
	public List<ProjectPlanVo> bizPrjPlanCarryLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//산출물 조회
	public List<ProjectPlanVo> bizPrjPlanOutputsLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트계획서 상신/승인 이력                                                    
	public void upvoteApprovalHistIns(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트계획서 상신 처리                                                 
	public void bizPrjPlanUpvoteYnUpd(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트 계획서 상신 조회
	public List<ProjectPlanVo> bizPrjPlanUpvoteLst(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트계획서 결재/반려
	public void bizPrjPlanApprovalYnUpd(ProjectPlanVo projectPlanVo) throws Exception;
	
	//프로젝트 계획서 이력 조회
	public List<ProjectPlanVo> upvoteApprovalHistLst(ProjectPlanVo projectPlanVo) throws Exception;
		
//	// =========================== 수주관리 메인 ==========================================
//	// 수주관리 메인 목록조회
//	public List<BizOrderVo> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 목록조회-GROUP BY 고객사
//	public List<BizOrderVo> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 목록조회-GROUP BY 자재
//	public List<BizOrderVo> bizOrderDtlLstGroupByMatrl(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 상세조회
//	public BizOrderVo bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 등록
//	public String bizOrderAdmIns(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 수정
//	public void bizOrderAdmUpd(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 삭제
//	public void bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 목형코드 중복확인
//	public BizOrderVo bizOrderAdmIdDupCheck(BizOrderVo bizOrderVo) throws Exception;
//	
//	// =========================== 수주관리 상세 ==========================================
//	// 수주관리 상세 등록할 때 현재고체크
//	public List<BizOrderVo> bizOrderSpQtySel(BizOrderVo bizOrderVo) throws Exception;
//		
//	// 수주관리 상세 목록조회
//	public List<BizOrderVo> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 상세조회
//	public BizOrderVo bizOrderDtlSel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 등록
//	public void bizOrderDtlIns(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 수정
//	public void bizOrderDtlUpd(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 등록
//	public void bizOrderCollectIns(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 수정
//	public void bizOrderCollectUpd(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 메인 삭제
//	public void bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 수주 상태 수정
//	public void bizOrderDtlStatusUpd(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 수정 - 팀별일정조정표
//	public void bizOrderDtlUpdByTeamSchedule(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 수주중지
//	public void bizOrderDtlStop(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 출고시 수주 상태값 수정
//	public void bizOrderDtlStatusUpdWithItemOut(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 수정
//	public void bizOrderDtlStockYnUpd(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 삭제
//	public void bizOrderDtlDel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 취소처리
//	public void bizOrderDtlCancel(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 상세 PO완료처리
//	public void bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception;
//	
//	// =========================== 수주현황 ==========================================
//	// 수주관리 전체 목록조회(수주별발주미포함)
//	public List<BizOrderVo> bizOrderCollectLst(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 전체 목록조회(수주별발주포함)
//	public List<BizOrderVo> bizOrderStatusLstWithPO(BizOrderVo bizOrderVo) throws Exception;
//	
//	// =========================== 공정정보 ==========================================
//	//수주관리 제품공정 목록
//	public List<ItemInfoAdmVo> bizOrderItemPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 작지공정 목록
//	public List<ItemInfoAdmVo> bizOrderWorkOrderPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//
//	//수주관리 제품공정 작업계획확정 전 작업지시 체크
//	public List<ItemInfoAdmVo> bizOrderWorkOrderCheckList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 제품공정 작업계획확정
//	public void bizOrderWorkOrderInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 제품공정 복사
//	public void bizOrderItemPrcssCopy(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 제품공정 등록
//	public void bizOrderItemPrcssInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//		
//	//수주관리 제품공정 삭제
//	public void bizOrderItemPrcssDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	// =========================== 투입자재 ==========================================
//	//수주관리 투입자재 목록
//	public List<ItemInfoAdmVo> bizOrderItemBomList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 투입자재 등록
//	public void bizOrderItemBomInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 투입자재 삭제
//	public void bizOrderItemBomDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	// =========================== 번들링 ==========================================
//	//수주관리 번들링 목록
//	public List<ItemInfoAdmVo> bizOrderDtlBundleList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	//수주관리 번들링 등록
//	public void bizOrderDtlBundleIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//		
//	//수주관리 번들링 삭제
//	public void bizOrderDtlBundleDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
//	
//	// =========================== 수주집계표 ==========================================
//	// 수주관리 수주집계표 수주기간별 수주처 목록조회
//	public List<BizOrderVo> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception;
//	
//	// 수주관리 수주집계표 수주처별 목록조회
//	public List<BizOrderVo> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception;
}
