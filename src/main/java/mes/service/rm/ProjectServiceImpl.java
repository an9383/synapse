package mes.service.rm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.pm.PurchaseOrderVo;
import mes.domain.rm.ProjectVo;
import mes.persistence.rm.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Inject
	private ProjectDAO dao;
	
	// =========================== project ==========================================
	// 프로젝트 마스터 데이터 조회
	@Override
	public List<ProjectVo> projectAdmLst(ProjectVo projectVo) throws Exception {
		return dao.projectAdmLst(projectVo);
	}
	
	// 프로젝트 마스터 데이터 등록
	@Override
	public void projectAdmIns(ProjectVo projectVo) throws Exception {
		dao.projectAdmIns(projectVo);
	}
	
	// 프로젝트 마스터 데이터 수정
	@Override
	public void projectAdmUpd(ProjectVo projectVo) throws Exception {
		dao.projectAdmUpd(projectVo);
	}
	
	// 프로젝트 마스터 데이터 삭제
	@Override
	public void projectAdmDel(ProjectVo projectVo) throws Exception {
		dao.projectAdmDel(projectVo);
	}
	
	// 프로젝트 디테일 데이터 조회
	@Override
	public List<ProjectVo> projectDtlLst(ProjectVo projectVo) throws Exception {
		return dao.projectDtlLst(projectVo);
	}
	
	// 프로젝트 SHEET NAME 조회
	@Override
	public String projectSheetNameLst(ProjectVo projectVo) throws Exception {
		return dao.projectSheetNameLst(projectVo);
	}

	// 프로젝트 디테일 데이터 등록
	@Override
	public void projectDtlIns(ProjectVo projectVo) throws Exception {
		dao.projectDtlIns(projectVo);
	}
	
	// 프로젝트 디테일 데이터 엑셀 등록
	@Override
	public void projectDtlExcelIns(ProjectVo projectVo) throws Exception {
		dao.projectDtlExcelIns(projectVo);
	}
	
	// 프로젝트 디테일 데이터 수정
	@Override
	public void projectDtlUpd(ProjectVo projectVo) throws Exception {
		dao.projectDtlUpd(projectVo);
	}
	
	// 프로젝트 디테일 데이터 삭제
	@Override
	public void projectDtlDel(ProjectVo projectVo) throws Exception {
		dao.projectDtlDel(projectVo);
	}
	
	// 프로젝트 디테일 임시 데이터 조회
	@Override
	public List<ProjectVo> projectDtlTempLst(ProjectVo projectVo) throws Exception {
		return dao.projectDtlTempLst(projectVo);
	}
	
	// 프로젝트 디테일 임시 데이터 등록
	@Override
	public void projectDtlTempIns(ProjectVo projectVo) throws Exception {
		dao.projectDtlTempIns(projectVo);
	}
	
	// 프로젝트 디테일 임시 데이터 삭제
	@Override
	public void projectDtlTempDel(ProjectVo projectVo) throws Exception {
		dao.projectDtlTempDel(projectVo);
	}

	// 프로젝트 디테일 주문 등록
	@Override
	public void projectDtlOrderIns(ProjectVo projectVo) throws Exception {
		dao.projectDtlOrderIns(projectVo);
	}
	
	// 프로젝트 디테일 주문 수정
	@Override
	public void projectDtlOrderUpd(ProjectVo projectVo) throws Exception {
		dao.projectDtlOrderUpd(projectVo);
	}
	
	// 프로젝트 디테일 주문 삭제
	@Override
	public void projectDtlOrderDel(ProjectVo projectVo) throws Exception {
		dao.projectDtlOrderDel(projectVo);
	}
	
	//프로젝트 디테일 주문 그룹시퀀스 조회
	@Override
	public String projectDtlOrderGroupIdx(ProjectVo projectVo) throws Exception {
		return dao.projectDtlOrderGroupIdx(projectVo);
	}
	
	//프로젝트 요청현황 조회
	@Override
	public List<ProjectVo> projectDtlOrderLst(ProjectVo projectVo) throws Exception {
		return dao.projectDtlOrderLst(projectVo);
	}
	
	//요청 승인 취소 처리
	@Override
	public void projectDtlOrderApproval002Upd(ProjectVo projectVo) throws Exception {
		dao.projectDtlOrderApproval002Upd(projectVo);
	}
	
	// 프로젝트별 표준원가 조회 
	@Override
	public List<ProjectVo> projectTotalLst(ProjectVo projectAdmVo) throws Exception{
		return dao.projectTotalLst(projectAdmVo);
	}

	// 프로젝트 파일 조회
	@Override
	public List<ProjectVo> projectFileLst(ProjectVo projectVo) throws Exception {
		return dao.projectFileLst(projectVo);
	}
	
	// 프로젝트 파일 등록
	@Override
	public String projectFileIns(ProjectVo projectVo) throws Exception {
		return dao.projectFileIns(projectVo);
	}
	
	// 프로젝트 파일 수정
	@Override
	public void projectFileUpd(ProjectVo projectVo) throws Exception {
		dao.projectFileUpd(projectVo);
	}
	
	// 프로젝트 파일 삭제
	@Override
	public void projectFileDel(ProjectVo projectVo) throws Exception {
		dao.projectFileDel(projectVo);
	}
	
	// 프로젝트 이미지 조회
	@Override
	public List<ProjectVo> projectImageLst(ProjectVo projectVo) throws Exception {
		return dao.projectImageLst(projectVo);
	}
	
	// 프로젝트 이미지 등록
	@Override
	public void projectImageIns(ProjectVo projectVo) throws Exception {
		dao.projectImageIns(projectVo);
	}
	
	// 프로젝트 이미지 수정
	@Override
	public void projectImageUpd(ProjectVo projectVo) throws Exception {
		dao.projectImageUpd(projectVo);
	}
	
	// 프로젝트 이미지 삭제
	@Override
	public void projectImageDel(ProjectVo projectVo) throws Exception {
		dao.projectImageDel(projectVo);
	}
	
	// 이미지가 저장된 품번 리스트 조회
	@Override
	public List<ProjectVo> projectImagePartNoLst(ProjectVo projectVo) throws Exception {
		return dao.projectImagePartNoLst(projectVo);
	}
	
	// 프로젝트 문서 조회
	@Override
	public List<ProjectVo> projectDocumentLst(ProjectVo projectVo) throws Exception {
		return dao.projectDocumentLst(projectVo);
	}
	
	// 프로젝트 문서 등록
	@Override
	public void projectDocumentIns(ProjectVo projectVo) throws Exception {
		dao.projectDocumentIns(projectVo);
	}
	
	// 프로젝트 문서 수정
	@Override
	public void projectDocumentUpd(ProjectVo projectVo) throws Exception {
		dao.projectDocumentUpd(projectVo);
	}
	
	// 프로젝트 문서 삭제
	@Override
	public void projectDocumentDel(ProjectVo projectVo) throws Exception {
		dao.projectDocumentDel(projectVo);
	}
	
	// 프로젝트 특이사항 수정
	@Override
	public void projectDtlOrderRemarkUpd(ProjectVo projectVo) throws Exception {
		dao.projectDtlOrderRemarkUpd(projectVo);
	}
}
