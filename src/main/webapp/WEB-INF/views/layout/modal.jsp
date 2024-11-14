<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!-- 특이사항 입력 모달 -->
<div class="modal fade" id="orderRemarkEditModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					요청 특이사항
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnRemarkEdit"><i class="fa-regular fa-pen-to-square"></i></button>
					<button type="button" disabled class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnRemarkSave"><i class="fa-regular fa-floppy-disk"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th class="text-center align-middle">특이사항</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control" id="remark">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 특이사항 입력 모달 -->
<div class="modal fade" id="orderRemarkModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					요청 특이사항
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOrderRemarkSave"><i class="fa-regular fa-floppy-disk"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th class="text-center align-middle">특이사항</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control" id="orderRemark">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 품목 등록 모달 -->
<div class="modal fade" id="newItemModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					품목 등록
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnNewItemSave"><i class="fa-regular fa-floppy-disk"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="newItemTable">
					<thead class="table-light">
						<tr>
<!-- 							<th class="text-center align-middle">No.</th> -->
							<th class="text-center align-middle">maker</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품목구분1</th>
							<th class="text-center align-middle">품목구분2</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- 이미지 업로드 모달 -->
<div class="modal fade" id="projectImageModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					이미지 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="projectImageFile" multiple="">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectImageAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectImageSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectImageEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnProjectImageDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectImageTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">이미지</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- 문서 업로드 모달 -->
<div class="modal fade" id="projectDocumentModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					기술문서 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="projectDocumentFile" multiple="">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectDocumentAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectDocumentSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectDocumentEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnProjectDocumentDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectDocumentTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">문서명</th>
							<th class="text-center align-middle">파일명</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- 기술문서 업로드 모달 -->
<div class="modal fade" id="projectFileModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					기술문서 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="projectFile" multiple="">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectFileAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectFileSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnProjectFileEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnProjectFileDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectFileTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">문서명</th>
							<th class="text-center align-middle">파일명</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">비고</th>
							<th class="text-center align-middle">대상부서</th>
							<th class="text-center align-middle">대상자</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<div id="my-spinner">
	<div>
		<span> <img src="<c:url value='/resources/assets/images/spinner.gif'/>">
		</span>
	</div>
</div>
<!-- 작업중에 다른내역을 클릭하거나 창을 빠져나갈때-->
<div class="modal fade" id="workingWarningModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-warning"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<spring:message code="modal.saveGuide" text="default text" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnWorkingWarningModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnWorkingWarningModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 삭제 경고 -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<spring:message code="modal.deleteGuide" text="default text" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 취소 경고 -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-warning"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<spring:message code="modal.cancelGuide" text="default text" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="btnCancelModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnCancelModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 담당자 모달 -->
<div class="modal fade" id="userModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					사용자 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnUserModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="userModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle"><spring:message code="userId" text="default text" /></th>
							<th class="text-center align-middle"><spring:message code="userName" text="default text" /></th>
							<th class="text-center align-middle"><spring:message code="userDepartmentCd" text="default text" /></th>
							<th class="text-center align-middle"><spring:message code="userJobCd" text="default text" /></th>
							<th class="text-center align-middle"><spring:message code="userPositionCd" text="default text" /></th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- 거래처 모달 -->
<div class="modal fade" id="dealCorpModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					거래처 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnDealCorpModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래상태</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealCorpStatus" style="min-width: 70px;"></select>
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래구분</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealGubun" style="min-width: 70px;"></select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnDealCorpModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="dealCorpModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">거래구분</th>
							<th class="text-center align-middle">거래처코드</th>
							<th class="text-center align-middle">이니셜</th>
							<th class="text-center align-middle">업체명</th>
							<th class="text-center align-middle">대표자</th>
							<th class="text-center align-middle">사업자번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 거래처 모달 -->
<div class="modal fade" id="dealCorpModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					거래처 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnDealCorpModalPaste1">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래상태</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealCorpStatus1" style="min-width: 70px;"></select>
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래구분</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealGubun1" style="min-width: 70px;"></select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnDealCorpModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="dealCorpModalTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">거래구분</th>
							<th class="text-center align-middle">거래처코드</th>
							<th class="text-center align-middle">이니셜</th>
							<th class="text-center align-middle">업체명</th>
							<th class="text-center align-middle">대표자</th>
							<th class="text-center align-middle">사업자번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 자재 모달 -->
<div class="modal fade" id="matrlModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					자재 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" name="btnModalNew" data-menu="bm-bmsc0090">
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMatrlModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnMatrlModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="matrlModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">원단코드</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">가로</th>
							<th class="text-center align-middle">세로</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 공정 모달 -->
<div class="modal fade" id="prcssModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					공정 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrcssModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="prcssModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">공정코드</th>
							<th class="text-center align-middle">공정명</th>
							<th class="text-center align-middle">수량단위</th>
							<th class="text-center align-middle">이니셜</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 부자재(목형) 모달 -->
<div class="modal fade" id="woodenInfoModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					부자재(목형) 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" name="btnModalNew" data-menu="bm-bmsc0040">
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnWoodenInfoModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnWoodenInfoModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="woodenInfoModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">코드</th>
							<th class="text-center align-middle">사이즈</th>
							<th class="text-center align-middle">성형방식</th>
							<th class="text-center align-middle">성형내용</th>
							<th class="text-center align-middle">묶음법</th>
							<th class="text-center align-middle">묶음단위</th>
							<th class="text-center align-middle">포장단위</th>
							<th class="text-center align-middle">포장박스</th>
							<th class="text-center align-middle">코팅방법</th>
							<th class="text-center align-middle">호기</th>
							<th class="text-center align-middle">후가공</th>
							<th class="text-center align-middle">후가공호기</th>
							<th class="text-center align-middle">사용여부</th>
						</tr>
					</thead>
				</table>
			</div>			
		</div>
	</div>
</div>
<!-- 창고 모달 -->
<div class="modal fade" id="locationModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					창고 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLocationModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품목구분</label>
						<select class="form-select w-auto h-100 me-3" id="locationModalItemGubun"></select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnLocationSearch">
								<i class="fa-regular fa-clipboard"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="locationModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">창고코드</th>
							<th class="text-center align-middle">창고명</th>
							<th class="text-center align-middle">창고분류</th>
							<th class="text-center align-middle">외주처</th>
							<th class="text-center align-middle">사용여부</th>
							<th class="text-center align-middle">품목구분</th>
						</tr>
					</thead>
				</table>
			</div>			
		</div>
	</div>
</div>
<!-- 창고 구역/위치 모달 -->
<div class="modal fade" id="locationDtlModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					창고 구역/위치 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLocationDtlModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="locationDtlModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">창고코드</th>
							<th class="text-center align-middle">창고명</th>
							<th class="text-center align-middle">구역</th>
							<th class="text-center align-middle">위치(단)</th>
							<th class="text-center align-middle">위치(열)</th>
							<th class="text-center align-middle">사용여부</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>			
		</div>
	</div>
</div>
<!-- 사업장 모달 -->
<div class="modal fade" id="workPlaceModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					사업장 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnWorkPlaceModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="workPlaceModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">주사업장여부</th>
							<th class="text-center align-middle">사업장코드</th>
							<th class="text-center align-middle">사업장명칭</th>
						</tr>
					</thead>
				</table>
			</div>			
		</div>
	</div>
</div>
<!-- 제품코드 모달 -->
<div class="modal fade" id="itemCodeModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog" style="max-width: 95vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					제품코드 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnItemCodeModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="itemCodeModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">고객사</th>
							<th class="text-center align-middle">제품명</th>
							<th class="text-center align-middle">건별전달사항</th>
							<th class="text-center align-middle">칼끝규격</th>
							<th class="text-center align-middle">자재코드</th>
							<th class="text-center align-middle">버전번호</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">절수</th>
							<th class="text-center align-middle">개수</th>
							<th class="text-center align-middle">COLOR</th>
							<th class="text-center align-middle">도수</th>
							<th class="text-center align-middle">사이즈</th>
							<th class="text-center align-middle">코팅방법</th>
							<th class="text-center align-middle">특이사항</th>
							<th class="text-center align-middle">성형방식</th>
							<th class="text-center align-middle">성형내용</th>
							<th class="text-center align-middle">묶음법</th>
							<th class="text-center align-middle">묶음단위</th>
							<th class="text-center align-middle">포장박스</th>
							<th class="text-center align-middle">포장단위</th>
							<th class="text-center align-middle">호기</th>			
							<th class="text-center align-middle">목형번호</th>
							<th class="text-center align-middle">타공목형번호</th>
							<th class="text-center align-middle">수지판번호</th>							
							<th class="text-center align-middle">동판번호</th>
							<th class="text-center align-middle">현재고량</th>
							<th class="text-center align-middle">검수방법</th>
							<th class="text-center align-middle">착인여부</th>
							<th class="text-center align-middle">사용여부</th>
							<th class="text-center align-middle">등록일자</th>
							<th class="text-center align-middle">후가공판번호</th>
							<th class="text-center align-middle">부분UV</th>
							<th class="text-center align-middle">FOIL</th>
							<th class="text-center align-middle">FOIL COLOR</th>
							<th class="text-center align-middle">형압</th>
							<th class="text-center align-middle">기타1</th>
							<th class="text-center align-middle">기타2</th>
							<th class="text-center align-middle">기타3</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 자재 모달 -->
<div class="modal fade" id="itemInfoAdmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					자재 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnItemInfoAdmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<!-- 
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래상태</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealCorpStatus" style="min-width: 70px;"></select>
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래구분</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealGubun" style="min-width: 70px;"></select>
					</div>
					 -->
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnitemInfoAdmModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="itemInfoAdmModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">재고단위</th>
							<th class="text-center align-middle">사용여부</th>
							<th class="text-center align-middle">검사여부</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>


