<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbarH rightcolT'
																									'leftcol dragbarH dragbarV'
																									'leftcol dragbarH rightcolB';
																		  grid-template-rows: 5fr 4px 5fr;
																		  grid-template-columns: 9fr 4px 5fr;">
																	
	<div id="leftcol">	
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center justify-content-end">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">접수일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate"> 
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate"> 
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">구분</label>
					<select class="form-select w-auto h-100 me-1" id="approvalSrh">
						<option value="" selected>전체</option>
						<option value="001">처리완료</option>
						<option value="002">접수</option>
<!-- 						<option value="003">진행</option> -->
					</select>
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">고객사명</label> -->
<!-- 					<input type="text" class="form-control w-auto h-100 me-1" id="companySrh"> -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">전화번호</label> -->
<!-- 					<input type="text" class="form-control w-auto h-100 me-1" id="numberSrh"> -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">담당자</label> -->
<!-- 					<input type="text" class="form-control w-auto h-100 me-1" id="receiveChargrSrh"> -->
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="receiveTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">메일전송</th>
							<th class="text-center">취소</th>
							<th class="text-center">구분</th>
							<th class="text-center">접수일자</th>
							<th class="text-center">AS번호</th>
							<th class="text-center">고사객명</th>
							<th class="text-center">전화번호</th>
							<th class="text-center">접수자</th>
							<th class="text-center">담당자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarH" onmousedown="StartDrag('H')"></div>
	<div id="rightcolT">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightBody">
				<div style="width: 100%;">
					<div id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<div class="d-flex align-items-center justify-content-end w-100" style="margin-bottom:5px;">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"disabled><i class="fa-regular fa-pen-to-square"></i></button>
<!-- 										<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button> -->
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
										<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
									</div>									
								</div>
								<table class="table table-bordered p-0 m-0" id="companyInfoTable">
									<colgroup>
										<col width="15%">
										<col width="17%">
										<col width="20%">
										<col width="18%">
										<col width="10%">
										<col width="20%">
									</colgroup>
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">고객사명</th>
											<th class="text-center align-middle">전화번호</th>
											<th class="text-center align-middle">주소</th>
											<th class="text-center align-middle">담당자</th>
											<th class="text-center align-middle">불량유형</th>
											<th class="text-center align-middle">상세내용</th>
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
	<div id="dragbarV" onmousedown="StartDrag('V')" ondblclick="minimum(this)"></div>
	<div id="rightcolB">
		<div class="container-fluid" style="padding: 5px;">
			<div class="row">
				<div style="width: 100%;">
					<div id="nav-tabContent2">
						<div class="tab-pane fade show active" id="tab5">
							<div class="row" style="padding: 5px;">
								<div class="d-flex align-items-center justify-content-end w-100" style="margin-bottom:5px;">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
									</div>									
								</div>
								<table class="table table-bordered p-0 m-0" id="itemTable">
									<thead class="table-light">
										<tr>
											<th class="text-center">품목구분1</th>
											<th class="text-center">품목구분2</th>
											<th class="text-center">모듈명</th>
											<th class="text-center">제품시리얼번호</th>
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
<div class="modal fade" id="itemAddEditModal" tabindex="-1"
	aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog" style="max-width: 35vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">등록정보</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						data-bs-dismiss="modal" style="font-size: 20px !important;">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="padding: 1rem;">
				<div class="container-fluid p-0 h-100">
					<div class="row" style="padding-bottom: 5px;">
						<table class="table table-bordered p-0 m-0">
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>고객사명</th>
								<td>
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="companyNmae" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnCompanySelect">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">전화번호</th>
								<td>
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control inputGroup" id="phoneNumber">
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">주소</th>
								<td class="text-center align-middle">
								<input type="text" class="form-control inputGroup" id="address">
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>접수자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control inputGroup" id="rcvChargr" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnRcvUserSel">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>담당자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="receiveChargr" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnReceiveUserSel">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>불량유형</th>
								<td class="text-center align-middle"><select
									class="form-select w-100 inputGroup" id="faultyType"></select></td>
							</tr>
							<tr>
								<th class="text-center align-middle">상세내용</th>
								<td class="text-center align-middle">
									<textArea class="form-control inputGroup textarea" id="detail" style="max-width: 100%; resize: none; min-height: 0px !important;"></textArea>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>프로젝트코드</th>
								<td class="text-center align-middle">
									<div class="input-group w-auto h-100">
										<input type=text class="form-control" id="projectCd">
										<button type="button" id="btnDelProjectCd" 
											style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 1px 23px; margin-left: 0px; border: none;">
											<i class="fa-solid fa-xmark"></i>
										</button>
										<button type="button" style="padding: 1px 4px; margin-left: 0px;" 
												class="btn btn-primary input-sub-search"
												id="btnSearchProjectCd">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">시리얼번호</th>
								<td class="text-center align-middle">
									<div class="input-group w-auto h-100">
										<input type=text class="form-control" id="serialNo">
										<button type="button" id="btnDelProjectCd" 
											style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 1px 23px; margin-left: 0px; border: none;">
											<i class="fa-solid fa-xmark"></i>
										</button>
										<button type="button" style="padding: 1px 4px; margin-left: 0px;" 
												class="btn btn-primary input-sub-search"
												id="btnSearchSerialNo">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-body" style="padding: 1rem;">
				<div class="container-fluid p-0 h-100">
					<div class="row" style="padding-bottom: 5px;">
						<div class="d-flex align-items-center justify-content-end w-100" style="margin-bottom:5px;">
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="addBtn"><i class="fa-solid fa-plus"></i></button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="editBtn"><i class="fa-regular fa-pen-to-square"></i></button>
								<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="delBtn"><i class="fa-solid fa-trash-can"></i></button>
							</div>									
						</div>
						<table class="table table-bordered p-0 m-0" id="itemListTable">
							<colgroup>
<%-- 								<col width="10%"> --%>
								<col width="20%">
								<col width="20%">
								<col width="25%">
								<col width="35%">
							</colgroup>
							<thead class="table-light">
								<tr>
<!-- 									<th class="text-center align-middle">삭제</th> -->
									<th class="text-center align-middle">품목구분1</th>
									<th class="text-center align-middle">품목구분2</th>
									<th class="text-center align-middle">모듈명</th>
									<th class="text-center align-middle">제품시리얼</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="bizOrderAdmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					수주 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste">
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
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable">
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
<div class="modal fade" id="outReqSerialModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 40vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSerialModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="outReqSerialTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">.NO</th>
							<th class="text-center align-middle">시리얼번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="outReqSerialModal2" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 40vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSerialModalPaste2">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="outReqSerialTable2">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">.NO</th>
							<th class="text-center align-middle">시리얼번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="deleteCheckModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i>
					<spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>
					작업한 내용이 전부 삭제되고 삭제된 내용은 복구할 수 없습니다.<br>삭제하시겠습니까?
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnDelChkModalY"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnDelChkModalN"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 화면설정 script -->
<script>
	let isDragging = false;
	let isDraggingV = false; // 세로 드래그 여부
	let isDraggingH = false; // 가로 드레그 여부
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
		//if(type == 'VT') { isDraggingVT = true; SetCursor("n-resize");}
		//if(type == 'VB') { isDraggingVB = true; SetCursor("n-resize");}
		if(type == 'V') { isDraggingV = true; SetCursor("n-resize");}
		if(type == 'H') { isDraggingH = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingV || isDraggingH) {
			dataTableDrawAll(); // dataTable 전체 reload
			//isDraggingVT = false;
			//isDraggingVB = false;
			isDraggingV = false;
			isDraggingH = false;
			SetCursor("auto");
		}
	}
	
	function OnDrag(event) {
		if (isDraggingH) { // 좌우 스크롤
			let page = document.getElementById("page");
			let leftcol = document.getElementById("leftcol"); // 좌측
			let rightcolT = document.getElementById("rightcolT"); // 우측 상단
			//let rightcolM = document.getElementById("rightcolM"); // 우측 중단
			let rightcolB = document.getElementById("rightcolB"); // 우측 하단
			let dragbarWidth = 4;
			let leftcolMinWidth = 20; // leftcol 최소사이즈
			$('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			});
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = page.clientWidth - parseInt(Math.max(leftcolMinWidth + 120, event.clientX));
			
			let cols = [
				parseInt(Math.max(leftcolMinWidth, page.clientWidth - dragbarWidth - parseInt(Math.max(rightColWidth, rightcolMinWidth)))),
				dragbarWidth,
				parseInt(Math.max(rightColWidth, rightcolMinWidth))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			//console.log(newColDefn);
	
			page.style.gridTemplateColumns = newColDefn;
	
			event.preventDefault();
		} else if (isDraggingV) { // rightcolT와 rightcolB 사이
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
			//console.log(cursorY);
			//console.log(page_height - rightcolB_height - dragbarWidth);
			
			let cols = [
				Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_min_height - dragbarWidth),
				dragbarWidth,
				page_height - dragbarWidth - Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_min_height - dragbarWidth),
			];
			
			//console.log(cols);
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault();
		}
	}

	function minimum(node) {
		let id = $(node).attr('id');

		if(id == 'dragbarV') {
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let dragbarV_height = 4;

			let cols = [];

			//최소화기능만 적용
			cols = [
				page_height - rightcolB_min_height - dragbarWidth,
				dragbarWidth,
				rightcolB_min_height
			];
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-rows',newColDefn);
		} else if(id == 'dragbarVB') {
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
// 			let rightcolM_height = parseInt($('#rightcolM').height());	// 우측 중단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolM_min_height = 34;	// 우측 중단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let dragbarV_height = 4;

			let cols = [];

			cols = [
				rightcolT_height,
				dragbarWidth,
				page_height - rightcolT_height - rightcolB_min_height - dragbarWidth*2,
				dragbarWidth,
				rightcolB_min_height
			];
			
			/* if(rightcolB_height == rightcolB_min_height) { // 원위치
				cols = [
					rightcolT_height,
					dragbarWidth,
					rightcolM_min_height,
					dragbarWidth,
					page_height - rightcolT_height - rightcolM_min_height - dragbarWidth*2
				];
			} else { // 최소화
				cols = [
					rightcolT_height,
					dragbarWidth,
					page_height - rightcolT_height - rightcolB_min_height - dragbarWidth*2,
					dragbarWidth,
					rightcolB_min_height
				];
			} */
			
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-rows',newColDefn);
		}
		
		dataTableDrawAll(); // dataTable 전체 reload */
	}
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		$('#page').css('grid-template-columns', '9fr 4px 5fr');
// 		$('#rightcol').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		$('#page').css('grid-template-columns', '1fr 4px 0fr');
// 		$('#rightcol').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');
	WM_init('dealNew');
	WM_init('attachDataNew');

	// 공통코드 조회
	let userName = "${userName}";

	let FtCdList = getFtCode();
	selectBoxAppend2(FtCdList, 'faultyType', '', '2');
	
	let equipIdxVal = '';
	let tableChoice = 0;
	let asNoVal = '';
	let tableIdx;
	let iSGubun = 'S';

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
	
	let cmplnDateVal = moment().format('YYYYMMDD');
	
	$('input[name="dealGubun"]').attr('disabled', true);
	
	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		receiveTable.ajax.reload();
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100);
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
// 	$('#btnWorkingWarningModalN').on('click', function() {
// 		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
// 			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
// 				let idx = getWM(WMlastIdx, 'idx');
// 				WM_action_OFF(WMlastIdx);
// 				setWM(WMlastIdx, 'idx', '');
// // 				console.log('tableChoice : ' + tableChoice)
// 				if(tableChoice==1) {
// // 					console.log("idx : " + idx)
// 					receiveTable.row('#'+idx).select();
// 					$(receiveTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
// 				} else {
// 					itemTable.row('#'+idx).select();
// 					$(itemTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
// 				}
// 			} else {
// 				WM_action_OFF(WMlastIdx);
// 				if(window.location != window.parent.location) { // tab일 경우
// 					// 부모 탭 닫기버튼 click
// 					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
// 			    }
				
// 				$('.inputGroup').attr('disabled', true); // 입력항목
// 				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
// 				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
// 				$('#btnNew').attr('disabled', false); // 신규 버튼
// 				$('#btnSave').attr('disabled', true); // 저장 버튼
// 				$('#btnEdit').attr('disabled', true); // 수정 버튼
// 				$('#btnDel').attr('disabled', true); // 삭제 버튼
// 				$('#btnCancel').attr('disabled', true); // 취소 버튼

// 				// 사진선택 버튼
// 				$('#btnBeforeImage').attr('disabled', true);
// 				$('#btnAfterImage').attr('disabled', true);

// 				// 사진삭제 버튼 
// 				$('#btnBeforeImageDel').attr('disabled', true);
// 				$('#btnAfterImageDel').attr('disabled', true);
// 			}
			
// 			return false;
// 		}
// 	});

	$('#receiveTable thead tr').clone(true).addClass('filters').appendTo('#receiveTable thead'); // filter 생성
	let receiveTable = $('#receiveTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'>>"
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
			url : '<c:url value="/ts/CmplnReceiveList"/>',
			type : 'POST',
			data : {
				startDate	:	function(){return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate		:	function(){return moment($('#endDate').val()).format('YYYYMMDD'); },
				startPrsDate	:	function(){return '';},
				endPrsDate		:	function(){return '';},
				paidFree	: function(){return '';},
				resultGubun	:	function(){return $('#approvalSrh').val();},
			},
		},
        rowId: 'idx',
		columns : [
			{
				render : function(data, type, row, meta){
					return '<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 14px;" onclick="delbutton()" disabled>메일전송</button>'; 
				}, className : 'text-center align-middle'
			},
			{
				render : function(data, type, row, meta){
					return '<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 14px;" id="deleteBtn'+row['idx']+'" onclick="delbutton('+row['idx']+')">취소</button>';
				}, className : 'text-center align-middle'
			},
			{ data: 'resultGubun', className : 'text-center align-middle',
				render : function(data, type, row, meta){
// 					if(row['result'] != 0){
// 						if(row['cnt'] > row['result']){
// 							return '진행중';
// 						} else if(row['cnt'] = row['result']){
// 							return '처리완료';
// 						} 
// 					}else {
// 						return '접수';
// 					}
					if(data == '001'){
						return '처리완료';
					}else{
						return '접수';
					}
				}
			},
			{ data: 'cmplnDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'asNo', className : 'text-center align-middle'},
			{ data: 'companyNm', className : 'text-center align-middle'},
			{ data: 'phoneNumber', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return data;
					} else {
						return '-';
					}
				}
			},
			{ data: 'rcvChargr', className : 'text-center align-middle'},
			{ data: 'receiveChargr', className : 'text-center align-middle'},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
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
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#receiveTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let	topHeight = parseFloat($('#rightcolT').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#receiveTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#receiveTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});

	$('#receiveTable tbody').on('click', 'tr', function() {
		let data = receiveTable.row(this).data();
		asNoVal = data.asNo;
		tableIdx = data.idx;
		companyInfoTable.ajax.reload();
		itemTable.ajax.reload();
// 		console.log(asNoVal,  tableIdx);
		$('#btnEdit').attr('disabled', false);
	});

	let companyInfoTable = $('#companyInfoTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'>>"
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
	    scrollY: '35vh',
		pageLength: 100000000,
		ajax : {
			url : '<c:url value="/ts/csReceiveAdmRead"/>',
			type : 'POST',
			data : {
				'asNo' : function(){return asNoVal;},
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'companyNm', className : 'text-center align-middle'},
			{ data: 'phoneNumber', className : 'text-center align-middle'},
			{ data: 'addressAdm', className : 'text-center align-middle'},
			{ data: 'receiveChargr', className : 'text-center align-middle'},
			{ data: 'faultyNm', className : 'text-center align-middle'},
			{ data: 'dtlDesc', className : 'text-center align-middle'},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
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
	});

	let idxT=0;


	
	let itemTable = $('#itemTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'><'col-md-12 col-md-6'>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '35vh',
		pageLength: 100000000,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/ts/csReceiveDtlList"/>',
			type : 'POST',
			data : {
				'asNo' : function(){return asNoVal},
			},
		},
        rowId: 'idx',
		columns : [
			{
				data : 'itemGubun1', name : 'itemGubun1', className : 'text-center'
			},
			{
				data : 'itemGubun2', name : 'itemGubun2', className : 'text-center'
			},
			{
				data : 'moduleNm', name : 'moduleNm', className : 'text-center'
			},
			{
				data : 'serialNo', name : 'serialNo', className : 'text-center'
			},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
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
// 		order : [[0,'asc']],
	});

	$('#itemTable tbody').on('click','tr',function(){
		$('#btnDel').attr('disabled', false);
	});

	
	let itemListTable = $('#itemListTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'><'col-md-12 col-md-6'>>"
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
        scrollY: '30vh',
		pageLength: 100000000,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/ts/csReceiveDtlList"/>',
			type : 'POST',
			data : {
				'asNo' : function(){return asNoVal},
			},
		},
        rowId: 'idx',
		columns : [
			{
				data : 'itemGubun1', name : 'itemGubun1'
				,render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null){
						return data;
					}else{
						return '<input type="text" class="form-control"/>';
					}
				}, className : 'text-center'
			},
			{
				data : 'itemGubun2', name : 'itemGubun2'
				,render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return data;
					}else{
						return '<input type="text" class="form-control"/>';
					}
				}, className : 'text-center'
			},
			{
				data : 'moduleNm', name : 'moduleNm'
				,render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return data;
					}else{
						return '<input type="text" class="form-control"/>';
					}
				}, className : 'text-center'
			},
			{
				data : 'serialNo', name : 'serialNo'
				,render: function(data, type, row, meta) {
					let html = '<div class="input-group w-auto h-100 me-3">';
					if(data != null && data != ''){
						html += '<input type=text class="form-control" name="serialNo" value="'+data+'" disabled>';
						html += '<button type="button" style="padding: 1px 4px; margin-left: 0px;"'
							+ 'class="btn btn-primary input-sub-search" name="serialSrhBtn" onclick="serialSearch()" disabled>';
					}else{
						html += '<input type=text class="form-control" name="serialNo" value="">';
						html += '<button type="button" style="padding: 1px 4px; margin-left: 0px;"'
							+ 'class="btn btn-primary input-sub-search" name="serialSrhBtn" onclick="serialSearch()">';
					}
					html += '<i class="fa-solid fa-magnifying-glass"></i>'
					html += '</button></div>';
					return html;
				}, className : 'text-center'
			},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
		],
		buttons : [],
		order : [[0,'asc']],
	});

	

	// 거래처정보 목록 조회
	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
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
        scrollY: '70vh',
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
			url : '<c:url value="/bm/dealCorpAdmList"/>',
			type : 'POST',
			data : {
				dealGubun : function(){ return $('#modalDealGubun').val();},
				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealGubunNm', className : 'text-center'},
			{ data: 'dealCorpCd', className : 'text-center'},
			{ data: 'initial', className : 'text-center'},
			{ data: 'dealCorpNm', className : 'text-center'},
			{ data: 'representative', className : 'text-center'},
			{ data: 'companyNumber', className : 'text-center'},
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
			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});

	$('#btnDealCorpModalPaste').on('click',function(){
		if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
			
		let data = dealCorpModalTable.row('.selected').data();
		$('#companyNmae').val(data.dealCorpNm);
		$('#phoneNumber').val(data.phoneNumber);
		$('#address').val(data.addressAdm);
		$('#dealCorpModal').modal('hide');
	});
	
	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
			
		let data = dealCorpModalTable.row('.selected').data();
		$('#companyNmae').val(data.dealCorpNm);
		$('#phoneNumber').val(data.phoneNumber);
		$('#address').val(data.addressAdm);
		$('#dealCorpModal').modal('hide');
	});

	$('#btnCompanySelect').on('click', function() {
// 		dealCorpModalGubun = 'bizOrder';
		$('#dealCorpModal').modal('show');
		setTimeout(function(){
			dealCorpModalTable.ajax.reload();
		}, 150);
	});


	// 신규 버튼 click
	$('#btnNew').on('click', function() {
// 		WM_action_ON('new', 'workingWarningModal');
		asNoVal = '';
		tableIdx = '';
		$('#itemListTable tbody tr').empty();
		$('#receiveChargr').val(userName);
		$('#companyNmae').val('');
		$('#phoneNumber').val('');
		$('#address').val('');
		$('#rcvChargr').val('');
		$('#faultyType').val('');
		$('#detail').val('');
		$('#projectCd').val('');
		receiveTable.row('.selected').deselect();
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#itemAddEditModal').modal('show');
		setTimeout(function(){
			$('#itemListTable').DataTable().ajax.reload();
			dataTableDrawAll();
		}, 150);
	});

	$('#addBtn').on('click', function() {
		if(iSGubun == 'S'){
			itemListTable.row.add({
				'idx'			:	'',
				'itemGubun1'	:	'',
				'itemGubun2'	:	'',
				'moduleNm'		:	'',
				'serialNo'		:	'',
			}).draw(false);
		}else{
			$('#outReqSerialModal2').modal('show');
			setTimeout(function(){
				outReqSerialTable2.ajax.reload();
			}, 150);
		}
	});
	
	$('#editBtn').on('click', function(){
		$('#itemListTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					let value = $(td).text();
					$(td).html('<input type="text" class="form-control" value="'+value+'">');
				}
			});
		});
		$('input[name=serialNo]').attr('disabled',false);
		$('button[name=serialSrhBtn]').attr('disabled',false);
	});
	
	let itemIdx = '';
	$('#delBtn').on('click', function(){
		delArea = 'modal';
// 		idxP = $('#btnDel'+idx).closest('tr').index();
		asNoVal = itemListTable.row('.selected').data().asNo;
		itemIdx = itemListTable.row('.selected').data().idx;
		if(itemIdx != null && itemIdx != ''){
			$('#deleteModal').modal('show');
		}else{
			itemListTable.row('.selected').remove().draw();
		}
	});
	function delbutton(idx){
		delArea = 'main';
		let tableIdx = $('#deleteBtn'+idx).closest('tr').index();
		asNoVal = receiveTable.row(tableIdx).data().asNo;
		itemIdx = receiveTable.row(tableIdx).data().idx;
		if(receiveTable.row(tableIdx).data().resultGubun == '001'){
			$('#deleteCheckModal').modal('show');
		}else{
			$('#deleteModal').modal('show');
		}
		
	}

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		if($('#companyNmae').val() == ''){
			toastr.warning('고객사명을 선택해주세요.');
			$('#btnCompanySelect').focus();
			return false;
		}
		if($('#rcvChargr').val() == ''){
			toastr.warning('접수자를 입력해주세요.');
			$('#rcvChargr').focus();
			return false;
		}
		if($('#receiveChargr').val() == ''){
			toastr.warning('담당자를 선택해주세요.');
			$('#btnUserSel').focus();
			return false;
		}
		if($('#faultyType').val() == ''){
			toastr.warning('불량증상을 선택해주세요.');
			$('#faultyType').focus();
			return false;
		}
		if($('#projectCd').val() == ''){
			toastr.warning('프로젝트번호를 선택해주세요.');
			$('#projectCd').focus();
			return false;
		}
		$('#itemListTable').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0){
				let td = $(item).find('td');
				let asNo = itemListTable.row($(item)).data().asNo;
				let idx = itemListTable.row($(item)).data().idx;
				let itemGubun1 = $(td).eq(itemListTable.column('itemGubun1:name').index()).find('input').val();
				let itemGubun2 = $(td).eq(itemListTable.column('itemGubun2:name').index()).find('input').val();
				let moduleNm = $(td).eq(itemListTable.column('moduleNm:name').index()).find('input').val();
				let serialNo = $(td).eq(itemListTable.column('serialNo:name').index()).find('input').val();
				
				if(moduleNm == '') {
					toastr.warning('모듈명을 입력해주세요.');
					$(td).eq(itemListTable.column('moduleNm:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(serialNo == '') {
					toastr.warning('제품시리얼을 입력해주세요.');
					$(td).eq(itemListTable.column('serialNo:name').index()).find('input').focus();
					state = false;
					return false;
				}
				
				let obj = new Object();
// 				obj.asNo = asNoVal;
				obj.idx = idx;
				obj.serialNo = serialNo;
				obj.moduleNm = moduleNm;
				obj.itemGubun1 = itemGubun1;
				obj.itemGubun2 = itemGubun2;
				obj.cmplnDate = cmplnDateVal;
			    array.push(obj);
			}
		});
		
		if(!state) {
			return false;
		}

		$.ajax({
			url: '<c:url value="/ts/csReceiveIU"/>',
            type: 'POST',
            data: {
                'companyNm' : $('#companyNmae').val(),
                'phoneNumber' : $('#phoneNumber').val(),
                'addressAdm' : $('#address').val(),
                'rcvChargr' : $('#rcvChargr').val(),
                'receiveChargr' : $('#receiveChargr').val(),
                'faultyType' : $('#faultyType').val(),
                'dtlDesc' : $('#detail').val(),
                'prjCd' : $('#projectCd').val(),
                'resultGubun' : '002',
                'idx' : tableIdx,
                'cmplnDate' : cmplnDateVal,
                'asNo' : asNoVal,
                'arrayData'	:	JSON.stringify(array)
            },
			beforeSend: function() {
            	$('#my-spinner').show();
            },
            success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					$('#itemAddEditModal').modal('hide');
					receiveTable.ajax.reload();
					companyInfoTable.ajax.reload();
					itemTable.ajax.reload();
// 					WM_action_OFF('ADM');

					$('#btnSearch').trigger('click'); // 조회버튼 click
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 수정 버튼 click 좌표
	$('#btnEdit').on('click', function() {
// 		WM_action_ON('edit', 'workingWarningModal');
		$('#itemListTable tbody tr').empty();
		let data = receiveTable.row('.selected').data();
		asNoVal = data.asNo;
		tableIdx = data.idx;
		$('#companyNmae').val(data.companyNm);
		$('#phoneNumber').val(data.phoneNumber);
		$('#address').val(data.addressAdm);
		$('#rcvChargr').val(data.rcvChargr);
		$('#receiveChargr').val(data.receiveChargr);
		$('#faultyType').val(data.faultyType);
		$('#detail').val(data.dtlDesc);
		$('#projectCd').val(data.prjCd);
		$('#itemAddEditModal').modal('show');
		setTimeout(function(){
			$('#itemListTable').DataTable().ajax.reload();
			dataTableDrawAll();
		}, 150);
	});

	let delArea = '';
	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		delArea = 'modal';
		asNoVal = itemTable.row('.selected').data().asNo;
		itemIdx = itemTable.row('.selected').data().idx;
		$('#deleteModal').modal('show');
	});

	$('#btnDelChkModalY').on('click', function(){
		$('#btnDeleteModalY').trigger('click');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		if(delArea == 'main'){
			$.ajax({
				url: '<c:url value="/ts/admCsDelete"/>',
		        type: 'POST',
		        //async: false,
		        data: {
		            'asNo'	:	asNoVal,
		            'idx':	tableIdx,
		        },
		        beforeSend: function() {
		        	$('#my-spinner').show();
		        },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						receiveTable.ajax.reload();
						companyInfoTable.ajax.reload();
						itemTable.ajax.reload();
						itemListTable.ajax.reload();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		}else if(delArea =='modal'){
			$.ajax({
				url: '<c:url value="/ts/dtlCsDelete"/>',
		        type: 'POST',
		        //async: false,
		        data: {
		            'asNo'	:	asNoVal,
		            'idx':	itemIdx,
		        },
		        beforeSend: function() {
		        	$('#my-spinner').show();
		        },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						receiveTable.ajax.reload();
						companyInfoTable.ajax.reload();
						itemTable.ajax.reload();
						itemListTable.ajax.reload();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		}
	});

	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');

		$('.inputGroup').attr('disabled', true); // 입력항목
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		
	});


	$("#btnReceiveUserSel").on("click",function(){
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
		}, 200);
		$('#userModal').data('userType','receive');
	});
	
	$("#btnRcvUserSel").on("click",function(){
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
		}, 200);
		$('#userModal').data('userType','rcv');
	});

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

	// 사용자목록 적용 버튼 click
	$('#btnUserModalPaste').on('click', function(){
		if( !$('#userModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		let userType = $('#userModal').data('userType');
		let data = userModalTable.row('.selected').data();
		if(userType == 'receive'){
			$('#receiveChargr').val(data.userName);
		}else if(userType == 'rcv'){
			$('#rcvChargr').val(data.userName);
		}
		$('#userModal').modal('hide');
	});
	
	// 사용자목록 적용 버튼 click
	$('#userModalTable tbody').on('dblclick', 'tr', function(){
		let userType = $('#userModal').data('userType');
		let data = userModalTable.row(this).data();
		if(userType == 'receive'){
			$('#receiveChargr').val(data.userName);
		}else if(userType == 'rcv'){
			$('#rcvChargr').val(data.userName);
		}
		$('#userModal').modal('hide');
	});

	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});


	// 품목정보 목록조회
	$('#bizOrderAdmModalTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable thead'); // filter 생성
	let bizOrderAdmModalTable = $('#bizOrderAdmModalTable').DataTable({
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
				startDate 	: function() { return moment($('#bizStartDate').val()).format('YYYYMMDD'); },
				endDate 	: function() { return moment($('#bizEndDate').val()).format('YYYYMMDD'); },
				nowYear		: function() { return '2023'; },
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
			let theadHeight = parseFloat($('#bizOrderAdmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#bizOrderAdmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnBizOrderAdmModalSearch').on('click',function(){
		bizOrderAdmModalTable.ajax.reload(function() {});
	});

	$('#bizOrderAdmModalTable tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable.row(this).data();
		outReqSerialTable.ajax.reload();
		$('#projectCd').val(data.prjCd);
		$('#projectCd').attr('disabled', true);
		iSGubun = 'K';
		$('#bizOrderAdmModal').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row($('tr.selected')).data();
		outReqSerialTable.ajax.reload();
		$('#projectCd').val(data.prjCd);
		$('#projectCd').attr('disabled', true);
		iSGubun = 'K';
		$('#bizOrderAdmModal').modal('hide');
		
	});

	$('#btnDelProjectCd').on('click', function(){
		iSGubun = 'S';
		$('#projectCd').val('');
		$('#projectCd').attr('disabled', false);
	});

// 	$('#btnDelProjectCd').on('click', function(){
// 		$('#projectCd').val('');
// 	});
	let tableRow = 0;
	let outReqSerialTable = $('#outReqSerialTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '15vh',
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
			url : '<c:url value="/bs/outReqDtlSerialLst"/>',
			type : 'POST',
			data : {
 				'prjCd'		: function() { return $('#projectCd').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'serialNo', className : 'text-center align-middle', name: 'serialNo', //Serial No
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" name="serialNo" class="form-control text-center">';
					}
				}
			},
		],
		columnDefs : [
		],
		buttons : [
		],
		order : [],
	});

	function serialSearch(){
		$('#outReqSerialModal').modal('show');
		setTimeout(function(){
			outReqSerialTable.ajax.reload();
		}, 150);
	}

	$('#outReqSerialTable tbody').on('dblclick','tr',function(){
		let data = outReqSerialTable.row(this).data();
		$('#itemListTable').DataTable().$('tr.selected').find('input[name=serialNo]').val(data.serialNo);
		$('#outReqSerialModal').modal('hide');
	});
	
	$('#btnSerialModalPaste').on('click',function(){
		let data = outReqSerialTable.row($('tr.selected')).data();
		$('#itemListTable').DataTable().$('tr.selected').find('input[name=serialNo]').val(data.serialNo);
		$('#outReqSerialModal').modal('hide');
		
	});

	let outReqSerialTable2 = $('#outReqSerialTable2').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '15vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'multiple',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/outReqDtlSerialLst"/>',
			type : 'POST',
			data : {
 				'prjCd'		: function() { return $('#projectCd').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'serialNo', className : 'text-center align-middle', name: 'serialNo', //Serial No
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" name="serialNo" class="form-control text-center">';
					}
				}
			},
		],
		columnDefs : [
		],
		buttons : [
		],
		order : [],
	});

	$('#btnSerialModalPaste2').on('click', function(){
		$('#my-spinner').show();

		for(var i=0; i<$('#outReqSerialTable2').DataTable().$('tr.selected').length; i++){
			
	 		let data = $('#outReqSerialTable2').DataTable().row($('#outReqSerialTable2').DataTable().$('tr.selected')[i]).data();

	 		itemListTable.row.add({
	 			'idx'			:	'',
				'itemGubun1'	:	'',
				'itemGubun2'	:	'',
				'moduleNm'		:	'',
				'serialNo'		:	data.serialNo,
	 		}).draw(false);

	 		$('#btnNew').attr('disabled', false); // 신규 버튼
	 		$('#btnSave').attr('disabled', false); // 저장 버튼
	 		$('#btnEdit').attr('disabled', false); // 수정 버튼
	 		$('#btnDel').attr('disabled', false); // 삭제 버튼
	 		$('#btnCancel').attr('disabled', false); // 취소 버튼

	 		
		}

		setTimeout(function() {
			$('#outReqSerialModal2').modal('hide');
			$('input[name=serialNo]').attr('disabled',false);
			$('button[name=serialSrhBtn]').attr('disabled',false);
			$('#my-spinner').hide();
		}, 100)
	});
	
	
	function getFtCode() {
		let result = [];
		$.ajax({
			url: '<c:url value="/bm/baseInfoFtLst"/>',
            type: 'GET',
            async: false,
            data: {
//             	'baseInfoType'	:	baseInfoType,
//                 'baseInfoSeq'	:	baseInfoSeq
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
// 					console.log(res.result, res.data);
					let data = res.data;
					if(data.length != 0) {
						result = data;
					}
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		return result;
	}

	function selectBoxAppend2(list, id, sVal, flag)
	{
		$('#'+id).empty();
		let html = '';

		if(flag == '1') {
			html += '<option value="">'+ '전체' +'</option>';
		} else if(flag == '2') {
			html += '<option value="">'+ '선택' +'</option>';
		}
		for(var i=0;i<list.length;i++) {
			if(list[i].baseInfoCd == sVal) {
				html += '<option value='+list[i].baseInfoCd+' selected>'+list[i].baseInfoNm+'</option>';
			} else {
				html += '<option value='+list[i].baseInfoCd+'>'+list[i].baseInfoNm+'</option>';
			}
		}
		$('#'+id).append(html);
	}
	
</script>
</body>
</html>
