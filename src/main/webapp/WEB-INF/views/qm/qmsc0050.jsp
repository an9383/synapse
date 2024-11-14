<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">접수일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
				</div>
				<div class="d-flex align-items-center d-flex">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnFile">문서</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 18px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="issueTalbe">
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="6%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="3%">
						<col width="6%">
						<col width="6%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead class="table-light">
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">호기</th>
							<th class="text-center">고객사</th>
							<th class="text-center">번호</th>
							<th class="text-center">SITE</th>
							<th class="text-center">부서</th>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">시리얼번호</th>
							<th class="text-center">발생구분</th>
							<th class="text-center">불량구분</th>
							<th class="text-center">요청사항</th>
							<th class="text-center">조치내용</th>
							<th class="text-center">상태</th>
							<th class="text-center">접수자</th>
							<th class="text-center">처리자</th>
							<th class="text-center">접수일</th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
							<th class="text-center">처리일</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="issueAddEditModal" tabindex="-1"
	aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog" style="max-width: 70vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">등록정보</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" data-bs-dismiss="modal" style="font-size: 20px !important;">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="padding: 1rem;">
				<div class="container-fluid p-0 h-100">
					<div class="row" style="padding-bottom: 5px;">
						<table class="table table-bordered p-0 m-0" id="issueAddTalbe">
							<tr>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>구분
								</th>
								<td>
									<select class="form-select" id="gubun">
										<option value="">선택</option>
										<option value="01">CM</option>
										<option value="02">VARO</option>
									</select>
								</td>
								
								<th class="text-center align-middle">호기</th>
								<td class="text-center align-middle">
									<input type=text class="form-control" id="unit">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>고객사
								</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="company" disabled>
										<input type="hidden" class="inputGroup" id="companyIdx">
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnDealCorpSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="number">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>site
								</th>
								<td class="text-center align-middle">
									<input type=text class="form-control" id="site">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>부서
								</th>
								<td class="text-center align-middle">
									<select class="form-select" id="department">
									</select>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">프로젝트번호</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="projectNo" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnUserSel">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								
								<th class="text-center align-middle">시리얼번호</th>
								<td class="text-center align-middle">
									<input type=text class="form-control" id="serialNo">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>발생구분
								</th>
								<td class="text-center align-middle">
									<select class="form-select" id="request">
										<option value="">선택</option>
										<option value="01">고객요청</option>
										<option value="02">내부</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>불량구분
								</th>
								<td class="text-center align-middle">
									<select class="form-select" id="faultyReason">
									</select>
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>요청사항
								</th>
								<td class="text-center align-middle">
									<textArea class="form-control textarea" style="max-width: 100%; resize: none; min-height: 0px !important;" id="requirement"></textArea>
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>조치내용
								</th>
								<td class="text-center align-middle">
									<textArea class="form-control textarea" style="max-width: 100%; resize: none; min-height: 0px !important;" id="measure"></textArea>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">상태</th>
								<td class="text-center align-middle">
<!-- 									<input type=text class="form-control" id="tksxo"> -->
									<div>
										<span id="status">접수</span>
									</div>
								</td>
								
								<th class="text-center align-middle">접수자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="rcvChargr" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												onclick="userSel('RCV')"
												id="btnUserSel">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								
								<th class="text-center align-middle">처리자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type=text class="form-control" id="processUser" disabled>
										<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												onclick="userSel('PROCESS')"
												id="btnUserSel">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">접수일</th>
								<td class="text-center align-middle">
									<input type="date" max="9999-12-31" class="form-control" id="receiptDate">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>시작일
								</th>
								<td class="text-center align-middle">
									<input type="date" max="9999-12-31" class="form-control" id="workStartDate">
								</td>
								
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>종료일
								</th>
								<td class="text-center align-middle">
									<input type="date" max="9999-12-31" class="form-control" id="workEndDate">
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">처리일</th>
								<td class="text-center align-middle">
									<input type="date" max="9999-12-31" class="form-control" id="processDate">
<!-- 									<div class="input-group w-auto h-100"> -->
<!-- 										<input type=text class="form-control" id="projectCd"> -->
<!-- 										<button type="button" id="btnDelProjectCd"  -->
<!-- 											style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 1px 23px; margin-left: 0px; border: none;"> -->
<!-- 											<i class="fa-solid fa-xmark"></i> -->
<!-- 										</button> -->
<!-- 										<button type="button" style="padding: 1px 4px; margin-left: 0px;"  -->
<!-- 												class="btn btn-primary input-sub-search" -->
<!-- 												id="btnSearchProjectCd"> -->
<!-- 											<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
								</td>
<!-- 									<div id="fileNm"> -->
							</tr>
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
<div class="modal fade" id="issueFileModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					문서 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="issueFile" multiple="">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnIssueFileAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnIssueFileSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnIssueFileEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnIssueFileDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="issueFileTable">
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
</script>
<script>
	WM_init('new');
	WM_init('edit');


	let tableIdx = '';
	let issueIdx = '';
	let fileNumber = 0;
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let inputStatus = '';
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	
	$('#userModal').draggable({handle: ".modal-header"});

	let faultyReasonList = getCommonCode('일반', '052'); // 불량구분
	let departmentList = getCommonCode('일반', '051'); // 부서구분
	
	selectBoxAppend(faultyReasonList, 'faultyReason', '', '2'); //불량구분
	selectBoxAppend(departmentList, 'department', '', '2'); //불량구분
	
	// 사용자정보 목록조회
	$('#issueTalbe thead tr').clone(true).addClass('filters').appendTo('#issueTalbe thead'); // filter 생성
	let issueTalbe = $('#issueTalbe').DataTable({
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
			url : '<c:url value="/qm/customerIssueLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'gubun',
				render : function(data, type, row, meta) {
					if(data != null){
						if(data == '01'){
							return 'CM';
						}else if(data == '02'){
							return 'VARO';
						}else{
							return '';
						}
					}else{
						return '';
					}
				},className : 'text-center'
			},
			{ data: 'unit', className : 'text-center'},
			{ data: 'companyNm', className : 'text-center'},
			{ data: 'number', className : 'text-center'},
			{ data: 'issueSite', className : 'text-center'},
			{ data: 'departmentGubun',
				render : function(data, type, row, meta) {
					var departmentGubun = '';
					departmentList.forEach(function(item){
					    if(item.commonCd == data){
					    	departmentGubun = item.commonNm;
					    }
					});
					return departmentGubun;
				}, className : 'text-center'
			},
			{ data: 'projectNo', className : 'text-center'},
			{ data: 'serialNo', className : 'text-center'},
			{ data: 'requestGubun',
				render : function(data, type, row, meta) {
					if(data != null){
						if(data == '01'){
							return '고객요청';
						}else if(data == '02'){
							return '내부';
						}else{
							return '';
						}
					}else{
						return '';
					}
				},className : 'text-center'
			},
			{ data: 'faultyReason',
				render : function(data, type, row, meta) {
					var faultyGubun = '';
					faultyReasonList.forEach(function(item){
					    if(item.commonCd == data){
					    	faultyGubun = item.commonNm;
					    }
					});
					return faultyGubun;
				}, className : 'text-center'
			},
			{ data: 'requirement', className : 'text-center'},
			{ data: 'measure', className : 'text-center'},
			{ data: 'issueStatus', className : 'text-center'},
			{ data: 'rcvChargr', className : 'text-center'},
			{ data: 'processUser', className : 'text-center'},
			{ data: 'receiptDate',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-'
					}
				}, className : 'text-center'
			},
			{ data: 'workStartDate', 
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-'
					}
				}, className : 'text-center'
			},
			{ data: 'workEndDate', 
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-'
					}
				}, className : 'text-center'
			},
			{ data: 'processDate', 
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-'
					}
				}, className : 'text-center'
			},
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#issueTalbe_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
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
				let cell = $('#issueTalbe_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#issueTalbe_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	issueTalbe.on('column-reorder', function( e, settings, details ) {
		let api = issueTalbe;
		api.columns().eq(0).each(function (colIdx) {
			$('#issueTalbe_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#issueTalbe tbody').on('click','tr', function() {
		issueIdx = issueTalbe.row(this).data().idx;
	});

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		issueTalbe.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	
	$('#btnNew').on('click', function() {
		$('#issueAddEditModal').modal('show');
		tableIdx = '';

		$('#gubun').val('');
		$('#unit').val('');
		$('#company').val('');
		$('#number').val('');
		$('#site').val('');
		$('#department').val('');
		$('#projectNo').val('');
		$('#serialNo').val('');
		$('#request').val('');
		$('#faultyReason').val('');
		$('#requirement').val('');
		$('#measure').val('');
		$('#status').text('접수');
		$('#rcvChargr').val(userName);
		$('#processUser').val(userName);
		$('#receiptDate').val(moment().format('YYYY-MM-DD'));
		$('#workStartDate').val('');
		$('#workEndDate').val('');
		$('#processDate').val('');
	});

	$('#btnEdit').on('click', function(){
		if(issueIdx=='') {
			toastr.warning('이슈사향을 선택해 주세요.');
			return false;
		}
		let data = issueTalbe.row('.selected').data();
		tableIdx = data.idx;

		$('#gubun').val(data.gubun);
		$('#unit').val(data.unit);
		$('#company').val(data.companyNm);
		$('#number').val(data.number);
		$('#site').val(data.issueSite);
		$('#department').val(data.departmentGubun);
		$('#projectNo').val(data.projectNo);
		$('#serialNo').val(data.serialNo);
		$('#request').val(data.requestGubun);
		$('#faultyReason').val(data.faultyReason);
		$('#requirement').val(data.requirement);
		$('#measure').val(data.measure);
		$('#status').text(data.issueStatus);
		$('#rcvChargr').val(data.rcvChargr);
		$('#processUser').val(data.processUser);
		$('#receiptDate').val(moment(data.receiptDate).format('YYYY-MM-DD'));
		$('#workStartDate').val(moment(data.workStartDate).format('YYYY-MM-DD'));
		$('#workEndDate').val(moment(data.workEndDate).format('YYYY-MM-DD'));
		$('#processDate').val(moment(data.processDate).format('YYYY-MM-DD'));
		
		$('#issueAddEditModal').modal('show');
	});

	

	// 수주관리 메인 삭제버튼 click
	$('#btnDel').on('click', function() {
		if($('#issueTalbe tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		$.ajax({
			url: '<c:url value="/qm/customerIssueDel"/>',
            type: 'POST',
            data: {
                'idx'	:	issueIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					issueTalbe.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});


	// 거래처 조회-------------------------------------------------------------------------------------------
	$('#btnDealCorpSelect').on('click', function() {
// 		dealCorpModalGubun = 'bizOrder';
		$('#dealCorpModal').modal('show');
	});
	$('#dealCorpModal').on('shown.bs.modal', function() {
		dealCorpModalTable.ajax.reload(function() {});
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
        scrollY: '67vh',
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
	// dataTable colReorder event
	dealCorpModalTable.on('column-reorder', function( e, settings, details ) {
		let api = dealCorpModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnDealCorpModalSearch').on('click',function(){
		dealCorpModalTable.ajax.reload(function() {});
	});

	// 수주등록/수정 고객사 모달 붙여넣기 버튼 click
	let dealCorpModalGubun = '';
	$('#btnDealCorpModalPaste').on('click',function(){
		if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}	
		let data = dealCorpModalTable.row('.selected').data();
		workPlaceIdxVal = data.workPlaceIdx;
		customerIdxVal = data.idx;
		$('#companyIdx').val(data.idx);
		$('#company').val(data.dealCorpNm)
		$('#dealCorpModal').modal('hide');
	});


	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row('.selected').data();
		workPlaceIdxVal = data.workPlaceIdx;
		customerIdxVal = data.idx;
		$('#companyIdx').val(data.idx);
		$('#company').val(data.dealCorpNm)
		$('#dealCorpModal').modal('hide');
	});

	//====================================================================================================
	
	// 프로젝트번호 조회---------------------------------------------------------------------------------------
	
	$('#btnUserSel').on('click', function(){
		$('#bizOrderAdmModal').modal('show');
		$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
		$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
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
        	url : '<c:url value="/bs/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				startDate 	: function() { return moment($('#bizStartDate').val()).format('YYYYMMDD'); },
				endDate 	: function() { return moment($('#bizEndDate').val()).format('YYYYMMDD'); },
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
		$('#projectNo').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row($('tr.selected')).data();
		$('#projectNo').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
		
	});
	
	//====================================================================================================
	
	//문서----------------------------------------------------------------------------------------------
	
	$('#btnFile').on('click',function() { // 기술문서 버튼 클릭
		if(issueIdx=='') {
			toastr.warning('이슈사향을 선택해 주세요.');
			return false;
		}
		$('#issueFileModal').modal('show');

		setTimeout(function() {
			issueFileTable.ajax.reload(function() {});
		}, 150)
		
		$('#btnIssueFileEdit').attr('disabled', false);
		$('#btnIssueFileSave').attr('disabled', true);
		fileFormData = new FormData();
		$('#issueFile').val('');
	});
	
	let issueFileTable = $('#issueFileTable').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
        fixedHeader: false,
        scrollY: '50vh',
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
			url : '<c:url value="/qm/issueFileLst"/>',
			type : 'GET',
			data : {
				issueIdx : function() { return issueIdx; },
				inputGubun	 :	'001'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					fileNumber++;
					return '<div name="fileIndex">'+fileNumber+'</div>';
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

	$('#btnIssueFileEdit').on('click', function() {
		if( $('#issueFileTable').DataTable().rows().count()==0 ){
			toastr.warning('수정할 데이터가 없습니다.');
			return false;
		}
		$('#issueFileTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == issueFileTable.column('documentNm:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
					} else if(index_td == issueFileTable.column('fileDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:300px;" class="form-control" value="'+value+'">');
					} else if(index_td == issueFileTable.column('userIdx:name').index()) {
						let value = issueFileTable.row(tr).data().userIdx;
						let value2 = issueFileTable.row(tr).data().userNm;
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
		$('#btnIssueFileSave').attr('disabled', false);
	});

	// 관련파일 추가 버튼 클릭
	$('#btnIssueFileAdd').on('click', function() {
		$('#issueFile').trigger('click');
	});

	// 파일 선택
	$('#issueFile').on('change',function() {
		let fileInput = document.getElementById("issueFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#issueFileTable').DataTable().row.add({
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
    	$('#issueFileTable tbody tr').each(function(index, item){
    		$(this).find("div[name=fileIndex]").text(fileNumber);
    		fileNumber++;
        });
    	$('#btnIssueFileSave').attr('disabled', false);
    	$('#issueFile').val('');
	})
	
	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	// 관련파일 삭제 버튼 클릭
	$('#btnIssueFileDel').on('click', function() {
		if( !$('#issueFileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#issueFileTable').DataTable().row('.selected').data().idx!=null) {
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = issueFileTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#issueFileTable').DataTable().row('.selected').remove().draw();
			fileNumber = 1;
	    	$('#issueFileTable tbody tr').each(function(index, item){
	    		$(this).find("div[name=fileIndex]").text(fileNumber);
	    		fileNumber++;
	        });
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		idx = issueFileTable.row('.selected').data().idx;
		
		let uuid = $('#issueFileTable').DataTable().row('.selected').data().uuid;
		let ext = $('#issueFileTable').DataTable().row('.selected').data().fileExt;
		fileDelete({uuid:uuid,ext:ext}).then( (value) => {
			$.ajax({
				url: '<c:url value="/qm/issueFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'		:	idx,
	                'issueIdx'	:	issueIdx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#issueFileTable').DataTable().row('.selected').remove().draw();
						fileNumber = 1;
				    	$('#issueFileTable tbody tr').each(function(index, item){
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
		})
		.catch( (error) => {
			//오류처리에 대한 코드 작성
			toastr.warning(error);
		});
		
	});

	// 저장 버튼 click
	$('#btnIssueFileSave').on('click', function() {
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
				fileUpload(saveFileFormData).then( (value) => {
					$('#issueFileTable tbody').find('tr').each(function(index, item) {
						let td = $(item).find('td');
						let data = issueFileTable.row($(item)).data();
						let node = issueFileTable.row($(item)).node();
						
						let idx = issueFileTable.row($(item)).data().idx;
						let documentNm = $(td).eq(issueFileTable.column('documentNm:name').index()).find('input').val();
						let userIdx = $(td).eq(issueFileTable.column('userIdx:name').index()).find('input').val();
						let uuid = issueFileTable.row($(item)).data().uuid;
						let fileName = issueFileTable.row($(item)).data().fileName;
						let fileExt = issueFileTable.row($(item)).data().fileExt;
						let fileDesc = $(td).eq(issueFileTable.column('fileDesc:name').index()).find('input').val();

						let obj = new Object();
						obj.issueIdx = issueIdx;
						obj.idx = idx;
						obj.inputGubun = "001";
						obj.documentNm = documentNm == undefined ? data.documentNm : documentNm;
						obj.userIdx = userIdx == undefined ? data.userIdx : userIdx;
						if(idx != null && idx != ''){
							obj.uuid = uuid;
						} else {
							obj.uuid = value + uuid;
						}
						obj.fileName = fileName;
						obj.fileExt = fileExt;
						obj.fileDesc = fileDesc == undefined ? data.fileDesc : fileDesc;
						array.push(obj);
					});

					//원본 데이터
					let tableData = [];
					$('#issueFileTable tbody').find('tr').each(function(index, item) {
						let obj = {};
						let data = issueFileTable.row(index).data();
						obj.issueIdx = issueIdx;
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
						url: '<c:url value="/qm/issueFileInsUpd"/>',
						type : 'POST',
						async: false,
						datatype: 'json',
						data: JSON.stringify(array),
						contentType : "application/json; charset=UTF-8",
						beforeSend: function() {
			            	//$('#my-spinner').show();
			            },
						success : function(res) {
							fileNumber = 0;
							fileFormData = new FormData();
							issueFileTable.ajax.reload(function() {});
							$('#btnIssueFileSave').attr('disabled', true);
							toastr.success('저장되었습니다.');
							$('#my-spinner').hide();
							$('#issueFile').val('');
						},
					});
				})
				.catch( (error) => {
					toasrt.warning(error);												
				});
			},100)
		})
	});
	//=============================================================================================

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let state = true;
		if($('#gubun').val() == '') {
			toastr.warning('구분을 선택해주세요.');
			$('#gubun').focus();
			state = false;
			return false;
		}
		if($('#company').val() == '') {
			toastr.warning('고객사를 선택해주세요.');
			$('#btnDealCorpSelect').focus();
			state = false;
			return false;
		}
		if($('#site').val() == '') {
			toastr.warning('site를 입력해주세요.');
			$('#site').focus();
			state = false;
			return false;
		}
		if($('#department').val() == '') {
			toastr.warning('부서를 선택해주세요.');
			$('#department').focus();
			state = false;
			return false;
		}
		if($('#request').val() == '') {
			toastr.warning('발생구분을 선택해주세요.');
			$('#request').focus();
			state = false;
			return false;
		}
		if($('#faultyReason').val() == '') {
			toastr.warning('불량구분을 선택해주세요.');
			$('#faultyReason').focus();
			state = false;
			return false;
		}
		if($('#requirement').val() == '') {
			toastr.warning('요청사항을 입력해주세요.');
			$('#requirement').focus();
			state = false;
			return false;
		}
		if($('#measure').val() == '') {
			toastr.warning('조치내용을 입력해주세요.');
			$('#measure').focus();
			state = false;
			return false;
		}
		if($('#workStartDate').val() == '') {
			toastr.warning('시작일을 입력해주세요.');
			$('#workStartDate').focus();
			state = false;
			return false;
		}
		if($('#workEndDate').val() == '') {
			toastr.warning('종욜일을 입력해주세요.');
			$('#workEndDate').focus();
			state = false;
			return false;
		}
		if(state) {
			$.ajax({
				url: '<c:url value="/qm/customerIssueIns"/>',
	            type: 'POST',
	            data: {
		            'idx'				: tableIdx,
	            	'gubun'				: $('#gubun').val(),
	    			'unit'				: $('#unit').val(),
	    			'companyNm'			: $('#company').val(),
	    			'number'			: $('#number').val(),
	    			'issueSite'			: $('#site').val(),
	    			'departmentGubun'	: $('#department').val(),
	    			'projectNo'			: $('#projectNo').val(),
	    			'serialNo'			: $('#serialNo').val(),
	    			'requestGubun'		: $('#request').val(),
	    			'faultyReason'		: $('#faultyReason').val(),
	    			'requirement'		: $('#requirement').val(),
	    			'measure'			: $('#measure').val(),
	    			'issueStatus'		: $('#status').text(),
	    			'rcvChargr'			: $('#rcvChargr').val(),
	    			'processUser'		: $('#processUser').val(),
	    			'receiptDate'		: moment($('#receiptDate').val()).format('YYYYMMDD'),
	    			'workStartDate'		: moment($('#workStartDate').val()).format('YYYYMMDD'),
	    			'workEndDate'		: moment($('#workEndDate').val()).format('YYYYMMDD'),
	    			'processDate'		: moment($('#processDate').val()).format('YYYYMMDD'),
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('저장되었습니다.');
						$('#issueAddEditModal').modal('hide');
						issueTalbe.ajax.reload();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
						state = false;
					} else {
						toastr.error(res.message);
						state = false;
					}
					$('#my-spinner').hide();
				}
			});
		}
		
	});

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
			// 통합검색
			//$('#searchAll').off('keyup',function() {});
			//$('#searchAll').on('keyup',function() {
			//	$('#'+table_id+'_filter').find('input').val($(this).val());
			//	$('#'+table_id+'_filter').find('input').trigger('keyup');
			//});
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
		
		let data = userModalTable.row('.selected').data();

		if(inputStatus == 'RCV') {
// 			$('#userIdx').val(data.idx);
			$('#rcvChargr').val(data.userName);
// 			$('#userDepartmentNm').val(data.userDepartmentNm);
		} else if(inputStatus == 'FILE') {
			$('#issueFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#issueFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#issueFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		} else if(inputStatus == 'PROCESS') {
// 			$('#userIdx').val(data.idx);
			$('#processUser').val(data.userName);
// 			$('#userDepartmentNm').val(data.userDepartmentNm);
		}
		$('#userModal').modal('hide');
	});
	
	$('#userModalTable tbody').on('dblclick','tr',function(){
		let data = userModalTable.row('.selected').data();

		if(inputStatus == 'RCV') {
			$('#rcvChargr').val(data.userName);
		} else if(inputStatus == 'FILE') {
			$('#issueFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#issueFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#issueFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		} else if(inputStatus == 'PROCESS') {
			$('#processUser').val(data.userName);
		}
		$('#userModal').modal('hide');
	});


	$('#processDate').on('change',function(){
		if($('#processDate').val() != null && $('#processDate').val() != ''){
			$('#status').text('완료');
		}else{
			$('#status').text('접수');
		}
	});
</script>

</body>
</html>
