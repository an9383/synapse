package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.bs.BizOrderVo;
import mes.domain.bs.ProjectPlanVo;

@Repository
public class ProjectPlanDAOImpl implements ProjectPlanDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.projectPlanMapper";
	
	//프로젝트일정표 메인 목록조회
	@Override
	public List<ProjectPlanVo> projectPlanLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".projectPlanLst", projectPlanVo);
	}
	
	//프로젝트일정표 버전 목록조회
	@Override
	public List<ProjectPlanVo> projectPlanVersionLst(ProjectPlanVo projectPlanVo) throws Exception {
		return session.selectList(namespace+".projectPlanVersionLst", projectPlanVo);
	}
	
	// 프로젝트일정표 버전 중복확인
	@Override
	public int projectPlanVersionExistCheck(ProjectPlanVo projectPlanVo) throws Exception {
		return session.selectOne(namespace+".projectPlanVersionExistCheck", projectPlanVo);
	}
	
	// 프로젝트일정표 등록
	@Override
	public void projectPlanIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".projectPlanIns", projectPlanVo);
	}
	
	// 프로젝트일정표 수정
	@Override
	public void projectPlanUpd(ProjectPlanVo projectPlanVo) throws Exception {
		session.update(namespace+".projectPlanUpd", projectPlanVo);
	}
	
	// 프로젝트일정표 행 삭제
	@Override
	public void projectPlanDel(ProjectPlanVo projectPlanVo) throws Exception {
		session.delete(namespace+".projectPlanDel", projectPlanVo);
	}
	
	// =========================== 프로젝트 계획서 등록/수정 ==========================================
	// 프로젝트 계획서 등록
	@Override
	public void bizPrjPlanIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".bizPrjPlanIns", projectPlanVo);
	}
	
	// 프로젝트 계획서 수정
	@Override
	public void bizPrjPlanUpd(ProjectPlanVo projectPlanVo) throws Exception {
		session.update(namespace+".bizPrjPlanUpd", projectPlanVo);
	}
	
	//주요고객 요구사항
	@Override
	public void mainCustIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".mainCustIns", projectPlanVo);
	}
	
	//참여인력
	@Override
	public void inPeopleIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".inPeopleIns", projectPlanVo);
	}
	
	////재료비 및 매출이익
	@Override
	public void materialIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".materialIns", projectPlanVo);
	}
	
	//추진일정
	@Override
	public void carryDateIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".carryDateIns", projectPlanVo);
	}
	
	//산출물 List
	@Override
	public void outputsIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.insert(namespace+".outputsIns", projectPlanVo);
	}
	
	// 프로젝트 계획서 조회
	@Override
	public ProjectPlanVo bizPrjPlanSel(ProjectPlanVo projectPlanVo) throws Exception {
		return session.selectOne(namespace+".bizPrjPlanSel", projectPlanVo);
	}
	
	//주요고객 요구사항 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanMaincustLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanMaincustLst", projectPlanVo);
	}
	
	//참여인력 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanUserLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanUserLst", projectPlanVo);
	}
	
	//재료비 및 매출이익 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanMaterialLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanMaterialLst", projectPlanVo);
	}
	
	//추진일정 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanCarryLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanCarryLst", projectPlanVo);
	}
	
	//산출물 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanOutputsLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanOutputsLst", projectPlanVo);
	}
	
	//프로젝트계획서 상신/승인 이력
	@Override
	public void upvoteApprovalHistIns(ProjectPlanVo projectPlanVo) throws Exception {
		session.update(namespace+".upvoteApprovalHistIns", projectPlanVo);
	}
	
	//프로젝트계획서 상신 처리
	@Override
	public void bizPrjPlanUpvoteYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		session.update(namespace+".bizPrjPlanUpvoteYnUpd", projectPlanVo);
	}
	
	//프로젝트 계획서 상신 조회
	@Override
	public List<ProjectPlanVo> bizPrjPlanUpvoteLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".bizPrjPlanUpvoteLst", projectPlanVo);
	}
	
	//프로젝트계획서 결재/반려
	@Override
	public void bizPrjPlanApprovalYnUpd(ProjectPlanVo projectPlanVo) throws Exception {
		session.update(namespace+".bizPrjPlanApprovalYnUpd", projectPlanVo);
	}
	
	//프로젝트 계획서 이력 조회
	@Override
	public List<ProjectPlanVo> upvoteApprovalHistLst(ProjectPlanVo projectPlanVo) throws Exception{
		return session.selectList(namespace+".upvoteApprovalHistLst", projectPlanVo);
	}
	
//	// =========================== 수주관리 메인 ==========================================
//	// 수주관리 메인 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderAdmLst(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderAdmLst", bizOrderVo);
//	}
//	
//	// 수주관리 메인 목록조회-GROUP BY 고객사
//	@Override
//	public List<BizOrderVo> bizOrderAdmLstGroupByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderAdmLstGroupByDealCorp", bizOrderVo);
//	}
//	
//	// 수주관리 메인 목록조회-GROUP BY 자재
//	@Override
//	public List<BizOrderVo> bizOrderDtlLstGroupByMatrl(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderDtlLstGroupByMatrl", bizOrderVo);
//	}
//	
//	// 수주관리 메인 상세조회
//	@Override
//	public BizOrderVo bizOrderAdmSel(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectOne(namespace+".bizOrderAdmSel", bizOrderVo);
//	}
//	
//	// 수주관리 메인 등록
//	@Override
//	public String bizOrderAdmIns(BizOrderVo bizOrderVo) throws Exception {
//		session.insert(namespace+".bizOrderAdmIns", bizOrderVo);
//		String idx = bizOrderVo.getIdx();
//		return idx;
//	}
//	
//	// 수주관리 메인 수정
//	@Override
//	public void bizOrderAdmUpd(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderAdmUpd", bizOrderVo);
//	}
//	
//	// 수주관리 메인 삭제
//	@Override
//	public void bizOrderAdmDel(BizOrderVo bizOrderVo) throws Exception {
//		session.delete(namespace+".bizOrderAdmDel", bizOrderVo);
//	}
//	
//	// 수주관리 메인 목형코드 중복확인
//	@Override
//	public BizOrderVo bizOrderAdmIdDupCheck(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectOne(namespace+".bizOrderAdmIdDupCheck", bizOrderVo);
//	}
//	
//	// =========================== 수주관리 상세 ==========================================
//	// 수주관리 상세 등록할 때 현재고체크
//	@Override
//	public List<BizOrderVo> bizOrderSpQtySel(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderSpQtySel", bizOrderVo);
//	}
//	
//	// 수주관리 상세 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderDtlLst(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderDtlLst", bizOrderVo);
//	}
//	
//	// 수주관리 상세 상세조회
//	@Override
//	public BizOrderVo bizOrderDtlSel(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectOne(namespace+".bizOrderDtlSel", bizOrderVo);
//	}
//	
//	// 수주관리 상세 등록
//	@Override
//	public void bizOrderDtlIns(BizOrderVo bizOrderVo) throws Exception {
//		session.insert(namespace+".bizOrderDtlIns", bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderDtlUpd(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlUpd", bizOrderVo);
//	}
//	
//	// 수주관리 상세 등록
//	@Override
//	public void bizOrderCollectIns(BizOrderVo bizOrderVo) throws Exception {
//		session.insert(namespace+".bizOrderCollectIns", bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderCollectUpd(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderCollectUpd", bizOrderVo);
//	}
//	
//	// 수주관리 메인 삭제
//	@Override
//	public void bizOrderCollectDel(BizOrderVo bizOrderVo) throws Exception {
//		session.delete(namespace+".bizOrderCollectDel", bizOrderVo);
//	}
//	
//	// 수주관리 상세 수주 상태 수정
//	@Override
//	public void bizOrderDtlStatusUpd(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlStatusUpd", bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정 - 팀별일정조정표
//	@Override
//	public void bizOrderDtlUpdByTeamSchedule(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlUpdByTeamSchedule", bizOrderVo);
//	}
//	
//	// 수주관리 수주중지
//	@Override
//	public void bizOrderDtlStop(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlStop", bizOrderVo);
//	}
//	
//	// 출고시 수주 상태값 수정
//	@Override
//	public void bizOrderDtlStatusUpdWithItemOut(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlStatusUpdWithItemOut", bizOrderVo);
//	}
//	
//	// 수주관리 상세 수정
//	@Override
//	public void bizOrderDtlStockYnUpd(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlStockYnUpd", bizOrderVo);
//	}
//	
//	// 수주관리 상세 삭제
//	@Override
//	public void bizOrderDtlDel(BizOrderVo bizOrderVo) throws Exception {
//		session.delete(namespace+".bizOrderDtlDel", bizOrderVo);
//	}
//	
//	// 수주관리 상세 취소처리
//	@Override
//	public void bizOrderDtlCancel(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderDtlCancel", bizOrderVo);
//	}
//	
//	// 수주관리 상세 PO완료 처리
//	@Override
//	public void bizOrderAdmConfirm(BizOrderVo bizOrderVo) throws Exception {
//		session.update(namespace+".bizOrderAdmConfirm", bizOrderVo);
//	}
//	
//	// =========================== 수주현황 ==========================================
//	// 수주관리 전체 목록조회(수주별발주미포함)
//	@Override
//	public List<BizOrderVo> bizOrderCollectLst(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderCollectLst", bizOrderVo);
//	}
//	
//	// 수주관리 전체 목록조회(수주별발주포함)
//	@Override
//	public List<BizOrderVo> bizOrderStatusLstWithPO(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderStatusLstWithPO", bizOrderVo);
//	}
//	
//	// =========================== 공정정보 ==========================================
//	//수주관리 제품공정 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderItemPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
//		return session.selectList(namespace+".bizOrderItemPrcssList" ,itemInfoAdmVo );
//	}
//
//	//수주관리 작지공정 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderWorkOrderPrcssList(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
//		return session.selectList(namespace+".bizOrderWorkOrderPrcssList" ,itemInfoAdmVo );
//	}
//	
//	//수주관리 제품공정 작업계획확정 전 작업지시 체크
//	@Override
//	public List<ItemInfoAdmVo> bizOrderWorkOrderCheckList(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
//		return session.selectList(namespace+".bizOrderWorkOrderCheckList" ,itemInfoAdmVo );
//	}
//		
//	//수주관리 제품공정 작업계획확정
//	@Override
//	public void bizOrderWorkOrderInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.insert(namespace+".bizOrderWorkOrderInsert", itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 복사
//	@Override
//	public void bizOrderItemPrcssCopy(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.insert(namespace+".bizOrderItemPrcssCopy", itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 등록
//	@Override
//	public void bizOrderItemPrcssInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.insert(namespace+".bizOrderItemPrcssInsert", itemInfoAdmVo);
//	}
//	
//	//수주관리 제품공정 삭제
//	@Override
//	public void bizOrderItemPrcssDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.delete(namespace+".bizOrderItemPrcssDelete", itemInfoAdmVo);
//	}
//	
//	// =========================== 투입자재 ==========================================
//	//수주관리 투입자재 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderItemBomList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return session.selectList(namespace+".bizOrderItemBomList" ,itemInfoAdmVo );
//	}
//	
//	//수주관리 투입자재 등록
//	@Override
//	public void bizOrderItemBomInsert(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.insert(namespace+".bizOrderItemBomInsert", itemInfoAdmVo);
//	}
//	
//	//수주관리 투입자재 삭제
//	@Override
//	public void bizOrderItemBomDelete(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.delete(namespace+".bizOrderItemBomDelete", itemInfoAdmVo);
//	}
//	
//	// =========================== 번들링 ==========================================
//	//수주관리 번들링 목록
//	@Override
//	public List<ItemInfoAdmVo> bizOrderDtlBundleList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		return session.selectList(namespace+".bizOrderDtlBundleList" ,itemInfoAdmVo );
//	}
//	
//	//수주관리 번들링 등록
//	@Override
//	public void bizOrderDtlBundleIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.insert(namespace+".bizOrderDtlBundleIns", itemInfoAdmVo);
//	}
//	
//	//수주관리 번들링 삭제
//	@Override
//	public void bizOrderDtlBundleDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
//		session.delete(namespace+".bizOrderDtlBundleDel", itemInfoAdmVo);
//	}
//	
//	// =========================== 수주집계표 ==========================================
//	// 수주관리 수주집계표 수주기간별 수주처 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderAdmLstAsDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderAdmLstAsDealCorp" ,bizOrderVo );
//	}
//	
//	// 수주관리 수주집계표 수주처별 목록조회
//	@Override
//	public List<BizOrderVo> bizOrderDtlLstByDealCorp(BizOrderVo bizOrderVo) throws Exception {
//		return session.selectList(namespace+".bizOrderDtlLstByDealCorp" ,bizOrderVo );
//	}
}
