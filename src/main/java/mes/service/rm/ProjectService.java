package mes.service.rm;

import java.util.List;

import mes.domain.pm.PurchaseOrderVo;
import mes.domain.rm.ProjectVo;

public interface ProjectService {

	// =========================== project ==========================================
	// 프로젝트 마스터 데이터 조회
	public List<ProjectVo> projectAdmLst(ProjectVo projectVo) throws Exception;

	// 프로젝트 마스터 데이터 등록
	public void projectAdmIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 마스터 데이터 수정
	public void projectAdmUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 마스터 데이터 삭제
	public void projectAdmDel(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 데이터 조회
	public List<ProjectVo> projectDtlLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 SHEET NAME 조회
	public String projectSheetNameLst(ProjectVo projectVo) throws Exception;

	// 프로젝트 디테일 데이터 엑셀 등록
	public void projectDtlExcelIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 데이터 등록
	public void projectDtlIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 데이터 수정
	public void projectDtlUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 데이터 삭제
	public void projectDtlDel(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 임시 데이터 조회
	public List<ProjectVo> projectDtlTempLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 임시 데이터 등록
	public void projectDtlTempIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 임시 데이터 삭제
	public void projectDtlTempDel(ProjectVo projectVo) throws Exception;

	// 프로젝트 디테일 주문 등록
	public void projectDtlOrderIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 주문 수정
	public void projectDtlOrderUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 디테일 주문 삭제
	public void projectDtlOrderDel(ProjectVo projectVo) throws Exception;
	
	//프로젝트 디테일 주문 그룹시퀀스 조회
	public String projectDtlOrderGroupIdx(ProjectVo projectVo) throws Exception;
	
	//프로젝트 요청현황 조회
	public List<ProjectVo> projectDtlOrderLst(ProjectVo projectVo) throws Exception;
	
	//요청 승인 취소 처리
	public void projectDtlOrderApproval002Upd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트별 표준원가 조회 
	public List<ProjectVo> projectTotalLst(ProjectVo projectAdmVo) throws Exception;
	
	// 프로젝트 파일 조회
	public List<ProjectVo> projectFileLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 파일 등록
	public String projectFileIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 파일 수정
	public void projectFileUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 파일 삭제
	public void projectFileDel(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 이미지 조회
	public List<ProjectVo> projectImageLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 이미지 등록
	public void projectImageIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 이미지 수정
	public void projectImageUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 이미지 삭제
	public void projectImageDel(ProjectVo projectVo) throws Exception;
	
	// 이미지가 저장된 품번 리스트 조회
	public List<ProjectVo> projectImagePartNoLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 문서 조회
	public List<ProjectVo> projectDocumentLst(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 문서 등록
	public void projectDocumentIns(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 문서 수정
	public void projectDocumentUpd(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 문서 삭제
	public void projectDocumentDel(ProjectVo projectVo) throws Exception;
	
	// 프로젝트 특이사항 수정
	public void projectDtlOrderRemarkUpd(ProjectVo projectVo) throws Exception;
}
