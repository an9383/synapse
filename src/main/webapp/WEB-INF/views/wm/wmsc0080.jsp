<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 8fr 4px 5fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발생일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="vomTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">.No</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">장비시리얼번호</th>
							<th class="text-center align-middle">Site</th>
							<th class="text-center align-middle">작성부서</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">발생일</th>
							<th class="text-center align-middle">조치요청일</th>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">호기</th>
							<th class="text-center align-middle">모듈명</th>
							<th class="text-center align-middle">도면번호<br>(구매품규격)</th>
							<th class="text-center align-middle">발생원인</th>
							<th class="text-center align-middle">불량유형</th>
							<th class="text-center align-middle">현상및문제점</th>
							<th class="text-center align-middle">조치결과</th>
							<th class="text-center align-middle">대책수립</th>
							<th class="text-center align-middle">조치부서</th>
							<th class="text-center align-middle">조치담당</th>
							<th class="text-center align-middle">조치시작일</th>
							<th class="text-center align-middle">조치완료일</th>
							<th class="text-center align-middle">처리일수</th>
							<th class="text-center align-middle">조치결과</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row">
				<div style="width: 100%;">
					<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">사진&도면</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<div class="d-flex align-items-center justify-content-end w-100">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnImageFileSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
<!-- 										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnImageFileEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button> -->
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
									</div>
								</div>
<!-- 									<div class="d-flex align-items-center d-flex"> -->
<!-- 									</div> -->
<!-- 									<div class="me-lg-auto"></div> -->
								<table class="table table-bordered p-0 m-0" id="vomImageTable">
									<tr>
										<td class="text-center align-middle">
											<div class="card align-items-center p-1">
												<div class="mb-1">
													<div class="btn-group" role="group" aria-label="Small button group">
														<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnImage1" disabled><i class="fa-solid fa-plus"></i></button>
														<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnImageDel1" disabled><i class="fa-solid fa-trash-can"></i></button>
													</div>
												</div>
												<img class="card-img-bottom" id="image1" src=""
													 onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													 style="border: 1px solid #000000;height:167px;width:auto;">
												<input type="file" class="d-none" id="imageFile1">
											</div>
										</td>
										<td class="text-center align-middle">
											<div class="card align-items-center p-1">
												<div class="mb-1">
													<div class="btn-group" role="group" aria-label="Small button group">
														<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnImage2" disabled><i class="fa-solid fa-plus"></i></button>
														<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnImageDel2" disabled><i class="fa-solid fa-trash-can"></i></button>
													</div>
												</div>
												<img class="card-img-bottom" id="image2" src=""
													 onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													 style="border: 1px solid #000000;height:167px;width:auto;">
												<input type="file" class="d-none" id="imageFile2">
											</div>
										</td>
									</tr>
									<tr>
										<td class="text-center align-middle">
											<div class="card align-items-center p-1">
												<div class="mb-1">
													<div class="btn-group" role="group" aria-label="Small button group">
														<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnImage3" disabled><i class="fa-solid fa-plus"></i></button>
														<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnImageDel3" disabled><i class="fa-solid fa-trash-can"></i></button>
													</div>
												</div>
												<img class="card-img-bottom" id="image3" src=""
													 onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													 style="border: 1px solid #000000;height:167px;width:auto;">
												<input type="file" class="d-none" id="imageFile3">
											</div>
										</td>
										<td class="text-center align-middle">
											<div class="card align-items-center p-1">
												<div class="mb-1">
													<div class="btn-group" role="group" aria-label="Small button group">
														<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnImage4" disabled><i class="fa-solid fa-plus"></i></button>
														<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnImageDel4" disabled><i class="fa-solid fa-trash-can"></i></button>
													</div>
												</div>
												<img class="card-img-bottom" id="image4" src=""
													 onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													 style="border: 1px solid #000000;height:167px;width:auto;">
												<input type="file" class="d-none" id="imageFile4">
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="modal-body">
								<div class="d-flex align-items-center justify-content-end w-100 my-1">
									<input type="file" class="d-none" id="vomFile" multiple="">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnVomFileAdd" disabled><i class="fa-solid fa-plus"></i></button>
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnVomFileSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnVomFileEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
										<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnVomFileDel" disabled><i class="fa-solid fa-trash-can"></i></button>
									</div>
								</div>
								<table class="table table-bordered p-0 m-0" id="vomFileTable">
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
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="vomModal" tabindex="-1" aria-hidden="true" 
	data-bs-backdrop="static" data-bs-keyboard="false">
<!--  style="z-index: 9999;"> -->
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					VOM요청등록
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave"><i class="fa-regular fa-floppy-disk"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="vomModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">프로젝트코드</th>
							<td class="text-center align-middle">
								<div style="display: flex; flex-wrap: 1 1 auto;">
									<input type="text" class="form-control" id="projectCd" disabled>
									<button type="button"
											style="padding: 1px 4px; margin-left: 5px;"
											class="btn btn-primary input-sub-search"
											id="btnProjectSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center align-middle">프로젝트명</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="projectNm" disabled>
							</td>
							<th class="text-center align-middle">장비시리얼번호</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="serialNo">
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">site</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="site">
							</td>
							<th class="text-center align-middle">작성자</th>
							<td class="text-center align-middle">
								<div style="display: flex; flex-wrap: 1 1 auto;">
									<input type="text" class="form-control" id="userNm" disabled>
									<button type="button"
											style="padding: 1px 4px; margin-left: 5px;"
											class="btn btn-primary input-sub-search"
											onclick="userSel('REQ')"
											id="btnUserSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center align-middle">작성부서</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="useDepart" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">발생일</th>
							<td class="text-center align-middle">
								<input type="date" class="form-control" id="inspectDate">
							</td>
							<th class="text-center align-middle">조치요청일</th>
							<td class="text-center align-middle">
								<input type="date" class="form-control" id="reqDate">
							</td>
							<th class="text-center align-middle">호기</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="unit">
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">품명</th>
							<td class="text-center align-middle">
								<div style="display: flex; flex-wrap: 1 1 auto;">
									<input type="text" class="form-control" id="goodsNm" disabled>
									<button type="button"
											style="padding: 1px 4px; margin-left: 5px;"
											class="btn btn-primary input-sub-search"
											id="btnGoodsSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center align-middle">품목유형</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="goodsType" disabled>
							</td>
							<th class="text-center align-middle">모듈명</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="moduleNm">
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">도면번호</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="drawNo">
							</td>
							<th class="text-center align-middle">발생원인</th>
							<td class="text-center align-middle">
								<select class="form-select" id="faultyCause">
								</select>
							</td>
							<th class="text-center align-middle">불량유형</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control" id="faultyType">
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">현상 및 문제점</th>
							<td class="text-center align-middle" colspan="5">
								<textArea class="form-control inputGroup textarea" id="statusProblem" style="max-width: 100%;max-height:100%; resize: none; min-height: 0px !important;"></textArea>
							</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="bizOrderAdmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					프로젝트 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste1">
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
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주등록일</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate1"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate1"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품목유형명</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">Project No.</th>
							<th class="text-center align-middle">프로젝트명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 제품명 모달 -->
<div class="modal fade" id="goodsNmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title" id="goodsNmModalTitle">
					제품명 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnGoodsNmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow:auto;">
				<table class="table table-bordered p-0 m-0" id="goodsNmModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">유형코드</th>
							<th class="text-center">유형명</th>
							<th class="text-center">No</th>
							<th class="text-center">제품명</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 제품명 모달 끝 -->
<div class="modal fade" id="fileDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
				<button type="button" class="btn btn-danger" id="btnFileDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnFileDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 화면설정 script -->
<script>
	let isDragging = false;
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag() {
		isDragging = true;
		SetCursor("ew-resize");
	}
	
	function EndDrag(e) {
		if(isDragging) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDragging = false;
			SetCursor("auto");
		}
	}
	
	function OnDrag(event) {
		if (isDragging) {
			let page = document.getElementById("page");
			let leftcol = document.getElementById("leftcol");
			let rightcol = document.getElementById("rightcol");
			let dragbarWidth = 4;
			let leftcolMinWidth = 20; // leftcol 최소사이즈
			$('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			});
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

			console.log(Math.max(rightColWidth, rightcolMinWidth));
			let cols = [
				parseInt(Math.max(leftcolMinWidth, page.clientWidth - dragbarWidth - parseInt(Math.max(rightColWidth, rightcolMinWidth)))),
				dragbarWidth,
				parseInt(Math.max(rightColWidth, rightcolMinWidth))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			page.style.gridTemplateColumns = newColDefn;
	
			event.preventDefault()
		}
	}
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		if($('#rightcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '8fr 4px 5fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 8fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '8fr 4px 5fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '8fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));

	
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let vomIdx = '';
	let fileNumber = 0;
	let imageIdx = '';
	let faultyCauseList = getCommonCode('일반', '029'); //vom발생원인
	selectBoxAppend(faultyCauseList, 'faultyCause', '', '2'); //vom발생원인
	let fileFormData = new FormData();

	$('#tab1Nav').on('click',function(){
	});

	
	// 문서파일--------------------------------------------------------------------------------------------
	let vomFileTable = $('#vomFileTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
	    fixedHeader: false,
	    scrollY: '30vh',
	    scrollX: true,
		pageLength: 100000000,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
		ajax : {
			url : '<c:url value="/wm/vomFileList"/>',
			type : 'GET',
			data : {
				vomIdx : function() {return vomIdx;},
				inputGubun : '001'
			}
		},
		rowId : 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					let tableRow = meta.row
						+ meta.settings._iDisplayStart
						+ 1;
					return '<div name="fileIndex">'+tableRow+'</div>';
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
					}
				}
			},
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel(\'FILE\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'fileDesc', className : 'text-center align-middle', name : "fileDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#btnVomFileAdd').on('click', function() {
		$('#vomFile').trigger('click');
		$('#btnVomFileSave').attr('disabled', false);
	});

	$('#vomFile').on('change',function() {
		let fileInput = document.getElementById("vomFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#vomFileTable').DataTable().row.add({
				'idx'		: null,
				'documentNm': '',
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1)
			}).draw(false);
			
			fileFormData.append('file-'+uuid,files[i]);
			fileFormData.append('uuid-'+uuid,uuid);
			fileFormData.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
		fileNumber = 1;
    	$('#vomFileTable tbody tr').each(function(index, item){
    		$(this).find("div[name=fileIndex]").text(fileNumber);
    		fileNumber++;
        });
    	$('#vomFile').val('');
	});

	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	// 저장 버튼 click
	$('#btnVomFileSave').on('click', function() {
		let array = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				let saveFileFormData = new FormData();
				let fileSubKeyIndex = 1;
				let fileKeyIndex = 0; 
				for (var key of fileFormData.keys()) {
					if(fileSubKeyIndex==1) {
						saveFileFormData.append(key, fileFormData.get(key));
						console.log("fileFormData.get(key) : " + fileFormData.get(key));
					} else if(fileSubKeyIndex==2) {
						saveFileFormData.append('uuid', fileFormData.get(key));
						console.log("uuid : " + fileFormData.get(key));
					} else {
						saveFileFormData.append('ext', fileFormData.get(key));
						console.log("ext : " + fileFormData.get(key));
					} 
					fileSubKeyIndex++;
					if(fileSubKeyIndex==3) {
						fileSubKeyIndex = 0;
						fileKeyIndex++;
					}
				}
				fileUpload(saveFileFormData);
				
				console.log(saveFileFormData)

				$('#vomFileTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = vomFileTable.row($(item)).data();
					let node = vomFileTable.row($(item)).node();
					
					let idx = vomFileTable.row($(item)).data().idx;
					let documentNm = $(td).eq(vomFileTable.column('documentNm:name').index()).find('input').val();
					let userIdx = $(td).eq(vomFileTable.column('userIdx:name').index()).find('input').val();
					let uuid = vomFileTable.row($(item)).data().uuid;
					let fileName = vomFileTable.row($(item)).data().fileName;
					let fileExt = vomFileTable.row($(item)).data().fileExt;
					let fileDesc = $(td).eq(vomFileTable.column('fileDesc:name').index()).find('input').val();

					let obj = new Object();
					obj.vomIdx = vomIdx;
					obj.idx = idx;
					obj.inputGubun = "001";
					obj.documentNm = documentNm==undefined?data.documentNm:documentNm;
					obj.userIdx = userIdx==undefined?data.userIdx:userIdx;
					obj.uuid = uuid;
					obj.fileName = fileName;
					obj.fileExt = fileExt;
					obj.fileDesc = fileDesc==undefined?data.fileDesc:fileDesc;
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#vomFileTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = vomFileTable.row(index).data();
					obj.vomIdx = vomIdx;
					obj.idx = data.idx;
					obj.inputGubun = '001';
					obj.documentNm = data.documentNm;
					obj.userIdx = data.userIdx;
					obj.uuid = data.uuid;
					obj.fileName = data.fileName;
					obj.fileExt = data.fileExt;
					obj.fileDesc = data.fileDesc;
					
					tableData.push(obj);
				});
				
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)

				
				$.ajax({
					url: '<c:url value="/wm/vomFileIU"/>',
					type : 'POST',
					async: false,
					datatype: 'json',
					data: JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						fileNumber = 0;
						fileFormData = new FormData();
						vomFileTable.ajax.reload(function() {});
						$('#btnVomFileSave').attr('disabled', true);
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide();
						$('#vomFile').val('');
					},
				});
				
			},100)
		})
	});

	$('#btnVomFileEdit').on('click', function() {
		if( $('#vomFileTable').DataTable().rows().count()==0 ){
			toastr.warning('수정할 데이터가 없습니다.');
			return false;
		}
		$('#vomFileTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == vomFileTable.column('documentNm:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
					} else if(index_td == vomFileTable.column('fileDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:300px;" class="form-control" value="'+value+'">');
					} else if(index_td == vomFileTable.column('userIdx:name').index()) {
						let value = vomFileTable.row(tr).data().userIdx;
						let value2 = vomFileTable.row(tr).data().userNm;
						let html = '';
						html += '<div style="width:200px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+value+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+value2+'" disabled>';
						html += '<button type="button" onclick="userSel(\'FILE\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					}
				}
			})
		});
		$('#btnVomFileSave').attr('disabled', false);
	});

	// 관련파일 삭제 버튼 클릭
	$('#btnVomFileDel').on('click', function() {
		if( !$('#vomFileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#vomFileTable').DataTable().row('.selected').data().idx!=null) {
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = vomFileTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#vomFileTable').DataTable().row('.selected').remove().draw();
			fileNumber = 1;
	    	$('#vomFileTable tbody tr').each(function(index, item){
	    		$(this).find("div[name=fileIndex]").text(fileNumber);
	    		fileNumber++;
	        });
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		idx = vomFileTable.row('.selected').data().idx;
		
		$.ajax({
			url: '<c:url value="/wm/vomFileDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'		:	idx,
                'vomIdx'	:	vomIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let uuid = $('#vomFileTable').DataTable().row('.selected').data().uuid;;
				let ext = $('#vomFileTable').DataTable().row('.selected').data().fileExt;
				fileDelete({uuid:uuid,ext:ext});
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#vomFileTable').DataTable().row('.selected').remove().draw();
					fileNumber = 1;
			    	$('#vomFileTable tbody tr').each(function(index, item){
			    		$(this).find("div[name=fileIndex]").text(fileNumber);
			    		fileNumber++;
			        });
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	//===============================================================================================
	
	
	// 이미지 파일---------------------------------------------------------------------------------------
	$('#btnImage1').on('click', function() {
		$('#imageFile1').trigger('click');
	});
	$('#btnImage2').on('click', function() {
		$('#imageFile2').trigger('click');
	});
	$('#btnImage3').on('click', function() {
		$('#imageFile3').trigger('click');
	});
	$('#btnImage4').on('click', function() {
		$('#imageFile4').trigger('click');
	});

	$('#btnImageDel1').on('click', function() {
		$('#image1').attr('src','');
		$('#imageFile1').val('');
	});
	$('#btnImageDel2').on('click', function() {
		$('#image2').attr('src','');
		$('#imageFile2').val('');
	});
	$('#btnImageDel3').on('click', function() {
		$('#image3').attr('src','');
		$('#imageFile3').val('');
	});
	$('#btnImageDel4').on('click', function() {
		$('#image4').attr('src','');
		$('#imageFile4').val('');
	});
	

	$('#imageFile1').on('change',function(e) {
		let formData = new FormData();
		let fileInput = document.getElementById("imageFile1"); //id로 파일 태그를 호출
		let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		let fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		let bases64 = getImgBase64(files[0]);
		$('#image1').attr('src','data:image/jpeg;base64,'+bases64);
	});
	
	$('#imageFile2').on('change',function(e) {
		let formData = new FormData();
		let fileInput = document.getElementById("imageFile2"); //id로 파일 태그를 호출
		let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		let fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		let bases64 = getImgBase64(files[0]);
		$('#image2').attr('src','data:image/jpeg;base64,'+bases64);
	});
	
	$('#imageFile3').on('change',function(e) {
		let formData = new FormData();
		let fileInput = document.getElementById("imageFile3"); //id로 파일 태그를 호출
		let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		let fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		let bases64 = getImgBase64(files[0]);
		$('#image3').attr('src','data:image/jpeg;base64,'+bases64);
	});
	
	$('#imageFile4').on('change',function(e) {
		let formData = new FormData();
		let fileInput = document.getElementById("imageFile4"); //id로 파일 태그를 호출
		let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		let fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		let bases64 = getImgBase64(files[0]);
		$('#image4').attr('src','data:image/jpeg;base64,'+bases64);
	});

	$('#btnImageFileSave').on('click', function(){
		let imageFile1 = '';
		imageFile1 = $('#image1').attr('src');
		imageFile1 = imageFile1.replaceAll('data:image/jpeg;base64','');

		let imageFile2 = '';
		imageFile2 = $('#image2').attr('src');
		imageFile2 = imageFile2.replaceAll('data:image/jpeg;base64','');
		
		let imageFile3 = '';
		imageFile3 = $('#image3').attr('src');
		imageFile3 = imageFile3.replaceAll('data:image/jpeg;base64','');

		let imageFile4 = '';
		imageFile4 = $('#image4').attr('src');
		imageFile4 = imageFile4.replaceAll('data:image/jpeg;base64','');

		
		
		let state = true;
		if(!state){
			return false;
		}
		$.ajax({
			url : '<c:url value="/wm/vomImgFileIU"/>',
			type : 'POST',
			data : {
				'idx'		:	imageIdx,
				'vomIdx'	:	vomIdx,
				'vomImage1'	:	imageFile1,
				'vomImage2'	:	imageFile2,
				'vomImage3'	:	imageFile3,
				'vomImage4'	:	imageFile4,
			},
			beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
 					$('#btnImageFileSave').attr('disabled', true);
 					$('#btnImage1').attr('disabled', true);
 					$('#btnImage2').attr('disabled', true);
 					$('#btnImage3').attr('disabled', true);
 					$('#btnImage4').attr('disabled', true);
 					$('#btnImageDel1').attr('disabled', true);
 					$('#btnImageDel2').attr('disabled', true);
 					$('#btnImageDel3').attr('disabled', true);
 					$('#btnImageDel4').attr('disabled', true);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	//=====================================================================================================

	// vom-------------------------------------------------------------------------------------------------
	
	$('#btnSearch').on('click', function(){
		setTimeout(function() {
			vomTable.ajax.reload(function() {});
		}, 200);
	});
	
	// 신규 vom요청
	$('#btnNew').on('click', function() {
		vomTable.rows('.selected').deselect();
		$('#vomModal').modal('show');
		vomIdx = '';
		$('#projectCd').val('');
		$('#projectNm').val('');
		$('#serialNo').val('');
		$('#site').val('');
		$('#useDepart').val(userDepartmentNm);
		$('#userNm').val(userName);
		$('#inspectDate').val(moment().format('YYYY-MM-DD'));
		$('#reqDate').val(moment().format('YYYY-MM-DD'));
		$('#goodsNm').val('');
		$('#goodsType').val('');
		$('#unit').val('');
		$('#moduleNm').val('');
		$('#drawNo').val('');
		$('#faultyCause').val('');
		$('#faultyType').val('');
		$('#statusProblem').val('');
	});

	$('#btnEdit').on('click', function(){
		if(vomIdx == ''){
			toastr.warning('vom목록을 선택해주세요');
			return false;
		}
		$('#vomModal').modal('show');
		let data = vomTable.row('.selected').data();
		vomIdx = data.idx;
		$('#projectCd').val(data.projectCd);
		$('#projectNm').val(data.projectNm);
		$('#serialNo').val(data.serialNo);
		$('#site').val(data.vomSite);
		$('#useDepart').val(data.userDepartment);
		$('#userNm').val(data.userIdx);
		$('#inspectDate').val(moment(data.inspectDate).format('YYYY-MM-DD'));
		$('#reqDate').val(moment(data.reqDate).format('YYYY-MM-DD'));
		$('#goodsNm').val(data.goodsNm);
		$('#goodsType').val(data.goodsType);
		$('#unit').val(data.unit);
		$('#moduleNm').val(data.module);
		$('#drawNo').val(data.drawNo);
		$('#faultyCause').val(data.faultyCause);
		$('#faultyType').val(data.faultyType);
		$('#statusProblem').val(data.statusAndProblem);
	});
	
	// vom 목록 조회 테이블
	$('#vomTable thead tr').clone(true).addClass('filters').appendTo('#vomTable thead'); // filter 생성
	let vomTable = $('#vomTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '85vh',
        scrollX: true,
		pageLength: 100000000,
		/*
		colReorder: false,
		rowReorder: {
			enable: true,
			dataSrc: 'progressOrder',
		},
		*/
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/vomList"/>',
			type : 'POST',
			data : {
				startDate : function(){return moment($('#startDate').val()).format('YYYYMMDD');},
				endDate : function(){return moment($('#endDate').val()).format('YYYYMMDD');},
			},
		},
        rowId: 'idx',
        columns : [
			{
				render : function(data, type, row, meta){
					return meta.row
					+ meta.settings._iDisplayStart
					+ 1;
				}, 'className' : 'text-center align-middle'
			},
			{data : 'projectCd', 'className' : 'text-center align-middle'},
			{data : 'projectNm', 'className' : 'text-center align-middle'},
			{data : 'serialNo', 'className' : 'text-center align-middle'},
			{data : 'vomSite', 'className' : 'text-center align-middle'},
			{data : 'userIdx', 'className' : 'text-center align-middle'},
			{data : 'userDepartment', 'className' : 'text-center align-middle'},
			{data : 'inspectDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}, 'className' : 'text-center align-middle'
			},
			{data : 'reqDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}, 'className' : 'text-center align-middle'
			},
			{data : 'goodsNm', 'className' : 'text-center align-middle'},
			{data : 'goodsType', 'className' : 'text-center align-middle'},
			{data : 'unit', 'className' : 'text-center align-middle'},
			{data : 'module', 'className' : 'text-center align-middle'},
			{data : 'drawNo', 'className' : 'text-center align-middle'},
			{data : 'faultyCause',
				render : function(data, type, row, meta) {
					var faultyCause = '';
					faultyCauseList.forEach(function(item){
					    if(item.commonCd == data){
					    	faultyCause = item.commonNm;
					    }
					});
					return faultyCause;
				}, 'className' : 'text-center align-middle'	
			},
			{data : 'faultyType', 'className' : 'text-center align-middle'},
			{data : 'statusAndProblem', 'className' : 'text-center align-middle'},
			{data : 'reqResult', 'className' : 'text-center align-middle'},
			{data : 'solution', 'className' : 'text-center align-middle'},
			{data : 'actDepartment', 'className' : 'text-center align-middle'},
			{data : 'actChargr', 'className' : 'text-center align-middle'},
			{data : 'actStartDate', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}, 'className' : 'text-center align-middle'
			},
			{data : 'actEndDate', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}, 'className' : 'text-center align-middle'
			},
			{data : 'procDays', 'className' : 'text-center align-middle'},
			{data : 'procResult', 'className' : 'text-center align-middle'},
			{data : 'vomDesc', 'className' : 'text-center align-middle'}
		],
		columnDefs : [
// 			{ "targets": '_all', "orderable": false },
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	orientation: 'landscape',
	        	exportOptions: {
                	columns: ':visible', modifier: {                      
						selected:null
					},
				},
			},
			{ extend: 'print',	text: 'Print',	charset: 'UTF-8', bom: true,
				exportOptions: {
                	columns: ':visible', modifier: {                      
						selected:null
					},
				},
			},
		],
		order : [[0,'asc']],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#vomTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');

			
			$('#'+table_id+'_filter').addClass('d-none');

			//progressOrder
			for(var i=0;i<data.length;i++) {
				let tr = $('#vomTable tbody').find('tr').eq(i);
				vomTable.row(tr).data().progressOrder = i+1;
				$(tr).find('td').eq(0).html(i+1);
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#vomTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#vomTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	vomTable.on('column-reorder', function( e, settings, details ) {
		let api = vomTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#vomTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});


	$('#vomTable tbody').on('click','tr',function() {
		let data = vomTable.row(this).data();
		vomIdx = data.idx;

		$.ajax({
			url: '<c:url value="/wm/vomImgFileSel"/>',
			type: 'GET',
			data:{
				'vomIdx' : vomIdx
			},
			beforsSend: function(){
				$('#my-spinner').show();
			},
			success : function(res){
				if(res.result == "ok"){
					data = res.data;
					if(data != null){
						imageIdx = data.idx
						$('#image1').attr('src','data:image/jpeg;base64'+data.vomImage1);
						$('#image2').attr('src','data:image/jpeg;base64'+data.vomImage2);
						$('#image3').attr('src','data:image/jpeg;base64'+data.vomImage3);
						$('#image4').attr('src','data:image/jpeg;base64'+data.vomImage4);
					}else{
						imageIdx = '';
						$('#image1').attr('src','');
						$('#image2').attr('src','');
						$('#image3').attr('src','');
						$('#image4').attr('src','');
					}
				} else if(res.result == 'fail'){
					toastr.warning(res.message);
				} else{
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
// 		vomImageTable.ajax.reload();
		vomFileTable.ajax.reload();
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnImageFileSave').attr('disabled', false);
		$('#btnImage1').attr('disabled', false);
		$('#btnImage2').attr('disabled', false);
		$('#btnImage3').attr('disabled', false);
		$('#btnImage4').attr('disabled', false);
		$('#btnImageDel1').attr('disabled', false);
		$('#btnImageDel2').attr('disabled', false);
		$('#btnImageDel3').attr('disabled', false);
		$('#btnImageDel4').attr('disabled', false);
		$('#btnVomFileAdd').attr('disabled', false);
		$('#btnVomFileEdit').attr('disabled', false);
		$('#btnVomFileDel').attr('disabled', false);
		
	});
		
	//vom요청 등록
	$('#btnSave').on('click', function(){
		let state = true;
		if(!state){
			return false;
		}
		$.ajax({
			url : '<c:url value="/wm/vomIU"/>',
			type : 'POST',
			data : {
				'idx'				:	vomIdx,
				'projectCd'			:	$('#projectCd').val(),
				'projectNm'			:	$('#projectNm').val(),
				'serialNo'			:	$('#serialNo').val(),
				'vomSite'			:	$('#site').val(),
				'userIdx'			:	$('#useDepart').val(),
				'userDepartment'	:	$('#userNm').val(),
				'inspectDate'		:	($('#inspectDate').val()==''?'':moment($('#inspectDate').val()).format('YYYYMMDD')),
				'reqDate'			:	($('#reqDate').val()==''?'':moment($('#reqDate').val()).format('YYYYMMDD')),
				'goodsNm'			:	$('#goodsNm').val(),
				'goodsType'			:	$('#goodsType').val(),
				'unit'				:	$('#unit').val(),
				'module'			:	$('#moduleNm').val(),
				'drawNo'			:	$('#drawNo').val(),
				'faultyCause'		:	$('#faultyCause').val(),
				'faultyType'		:	$('#faultyType').val(),
				'statusAndProblem'	:	$('#statusProblem').val(),
// 				'reqResult'			:	$('#').val(),
// 				'solution'			:	$('#').val(),
// 				'actDepartment'		:	$('#').val(),
// 				'actChargr'			:	$('#').val(),
// 				'actStartDate'		:	$('#').val(),
// 				'actEndDate'		:	$('#').val(),
// 				'procDays'			:	$('#').val(),
// 				'procResult'		:	$('#').val(),
// 				'vomDesc'			:	$('#').val()
			},
			beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
 					$('#vomModal').modal('hide');
 					vomTable.ajax.reload();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#btnDel').on('click', function() {
		if($('#vomTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		vomIdx = vomTable.row('.selected').data().idx;
		$.ajax({
			url : '<c:url value="/wm/vomDel"/>',
			type : 'POST',
			data : {
				'idx'	:	vomIdx
			},
			beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					vomTable.ajax.reload();
					vomFileTable.ajax.reload();
					$('#image1').attr('src','');
					$('#imageFile1').val('');
					$('#image2').attr('src','');
					$('#imageFile2').val('');
					$('#image3').attr('src','');
					$('#imageFile3').val('');
					$('#image4').attr('src','');
					$('#imageFile4').val('');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	//=====================================================================================================
	
	// 품목조회----------------------------------------------------------------------------------------------
	$('#btnGoodsSelect').on('click', function(){
		$('#goodsNmModal').modal('show');
		setTimeout(function() {
			goodsNmModalTable.ajax.reload(function() {});
		}, 200);
	});
	
	//제품유형 모달 조회
	$('#goodsNmModalTable thead tr').clone(true).addClass('filters').appendTo('#goodsNmModalTable thead'); // filter 생성
	let goodsNmModalTable = $('#goodsNmModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'p>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
	    fixedHeader: false,
        scrollY: '80vh',
        scrollX: true,
        scrollCollapse: true,
		pageLength: 10000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/goodsTypeDtlLst"/>',
			type : 'POST',
			data : {
				'goodsTypeCd' 	: function() { return ''; },
				'useYn'	  		: function() { return '001';},
			},
		},
        rowId: 'idx',
		columns : [
			{ //제품유형구분
				data: 'goodsGubun', className : 'text-center', name: 'goodsGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //제품유형코드
				data: 'goodsTypeCd', className : 'text-center', name: 'goodsTypeCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //제품유형명
				data: 'goodsTypeNm', className : 'text-center', name: 'goodsTypeNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //No
				render: function(data, type, row, meta) {
					return meta.row+1;
				},
				className : 'text-center',
			},
			{ //제품명
				data: 'goodsNm', className : 'text-center', name: 'goodsNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'goodsDesc', className : 'text-center', name: 'goodsDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
		],
		columnDefs : [
		],
		buttons : [
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#goodsNmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('overflow','auto');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#goodsNmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#goodsNmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	goodsNmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = goodsTypeModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#goodsNmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnGoodsNmModalPaste').on('click',function(){
		if(!$('#goodsNmModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let data = goodsNmModalTable.row('.selected').data();
// 		$('#goodsTypeCd').val(data.goodsTypeCd);
		$('#goodsType').val(data.goodsTypeNm);
		$('#goodsNm').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});

	$('#goodsNmModalTable tbody').on('dblclick','tr',function(){
		let data = goodsNmModalTable.row('.selected').data();
// 		$('#goodsTypeCd').val(data.goodsTypeCd);
		$('#goodsType').val(data.goodsTypeNm);
		$('#goodsNm').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});
	
	//-----------------------------------------------------------------------------------------------------
	
	//프로젝트 모달--------------------------------------------------------------------------------------------
	let now = new Date();
	let now_year = now.getFullYear();
	$('#btnProjectSelect').on('click', function(){
		$('#bizOrderAdmModal').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});

	// 품목정보 목록조회
	$('#bizOrderAdmModalTable1 thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable1 thead'); // filter 생성
	let bizOrderAdmModalTable1 = $('#bizOrderAdmModalTable1').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '68vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
        	url : '/bs/bizOrderAdmLst',
			type : 'POST',
			data : {
				startDate 	: function() { return moment($('#bizStartDate1').val()).format('YYYYMMDD'); },
				endDate 	: function() { return moment($('#bizEndDate1').val()).format('YYYYMMDD'); },
				nowYear		: function() { return now_year; },
			},
		},
        rowId: 'itemCd',
		columns : [
			//품목유형
			{ data: 'goodsTypeNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//품목유형명
			{ data: 'goodsNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//수주관리번호
			{ data: 'bizOrdNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//고객발주No
			{ data: 'customerNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//Project No.
			{ data: 'prjCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//프로젝트명
			{ data: 'prjNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
		],
		columnDefs : [
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
			//	}
			//}
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrderAdmModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 223)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnBizOrderAdmModalSearch1').on('click',function(){
		bizOrderAdmModalTable1.ajax.reload(function() {});
	});

	$('#bizOrderAdmModalTable1 tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable1.row(this).data();
		$('#projectCd').val(data.prjCd);
		$('#projectNm').val(data.prjNm);
		$('#bizOrderAdmModal').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#projectCd').val(data.prjCd);
		$('#projectNm').val(data.prjNm);
		$('#bizOrderAdmModal').modal('hide');
		
	});
	
	//=====================================================================================================
	
	// user select-----------------------------------------------------------------------------------------
	function userSel(value) {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
		}, 200);
		inputStatus = value;
	}

	// 사용자정보 목록조회
	$('#userModalTable thead tr').clone(true).addClass('filters').appendTo('#userModalTable thead'); // filter 생성
	let userModalTable = $('#userModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/sm/userLst"/>',
			type : 'POST',
			data : {
				userStateCd: function() { return $('#SearchUserStateCd').val(); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'userId', className : 'text-center'},
			{ data: 'userName', className : 'text-center'},
			{ data: 'userDepartmentNm', className : 'text-center'},
			{ data: 'userPositionNm', className : 'text-center'},
			{ data: 'userJobNm', className : 'text-center'},
		],
		columnDefs : [
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#userModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 197)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#userModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	userModalTable.on('column-reorder', function( e, settings, details ) {
		let api = userModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 사용자모달 조회 버튼 click
	$('#btnUserModalSearch').on('click', function() {
		userModalTable.ajax.reload(function(){});
	});
	
	// 사용자목록 적용 버튼 click
	$('#btnUserModalPaste').on('click', function(){
		if( !$('#userModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = userModalTable.row('.selected').data();
		console.log(data);

		if(inputStatus == 'FILE') {
			$('#vomFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#vomFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#vomFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		} else if(inputStatus == 'REQ') {
			$('#userIdx').val(data.idx);
			$('#userNm').val(data.userName);
			$('#useDepart').val(data.userDepartmentNm);
		}
		$('#userModal').modal('hide');
	});

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let data = userModalTable.row('.selected').data();
		console.log(data);

		if(inputStatus == 'FILE') {
			$('#vomFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#vomFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#vomFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		} else if(inputStatus == 'REQ') {
			$('#userIdx').val(data.idx);
			$('#userNm').val(data.userName);
			$('#useDepart').val(data.userDepartmentNm);
		}
		$('#userModal').modal('hide');
	});
	//======================================================================================================
</script>

</body>
</html>