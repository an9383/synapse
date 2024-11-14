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
																		  grid-template-columns: 3fr 4px 7fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<select class="form-label d-flex align-items-center header-label m-0 me-1 h-100" id="searchRqmt">
						<option value="001">수주일자</option>
						<option value="002">프로젝트</option>
					</select>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1 dDayte" onchange="search()" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100 dDayte">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1 dDayte" onchange="search()" id="endDate">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" onchange="search()" id="batchProjectCd">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주번호</th>
							<th class="text-center">고객발주번호</th>
							<th class="text-center">수주일자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-100">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnProjectReqst">구매요청</button>
					</div>
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnProjectFile">기술문서</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">
						<input type="file" class="d-none" id="excelUploadFile" name="excelfile">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button></form>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
					<div class="row" style="padding: 5px;">
						<table class="table table-bordered p-0 m-0">
							<colgroup>
								<col width="11%">
								<col width="22%">
								<col width="11%">
								<col width="22%">
								<col width="11%">
								<col width="22%">
							</colgroup>
							<tr>
								<th class="text-center align-middle">수주일자</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="ordDate" disabled>
								</td>
								<th class="text-center align-middle">수주번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="bizOrdNo" disabled>
								</td>
								<th class="text-center align-middle">프로젝트번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="prjCd" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">작성자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">												
										<input type="hidden" id="userIdx" disabled>
										<input type="text" class="form-control inputGroup" id="userNm" disabled>
										<button type="button" class="inputGroup" id="btnSalesManagerDelete" style="background-color: transparent;
																											border-color: transparent;
																											position: absolute;
																											top: 0;
																											right:0;
																											margin: 1px 23px;
																											margin-left: 0px;
																											border: none;
																											" disabled>
											<i class="fa-solid fa-xmark"></i>
										</button>												
										<button type="button" class="btn btn-primary input-sub-search inputGroup" id="btnUserSel" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">부서</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="userDepartmentNm" disabled>
								</td>
								<th class="text-center align-middle">상위품명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="goodsNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">수주수량</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="ordQty" disabled>
								</td>
								<th class="text-center align-middle">차수</th>
								<td class="text-center align-middle">
									<select class="form-select w-100 h-100 me-3 d-none" onchange="changeVersion()" id="selectVersion"></select>
									<input type="text" class="form-control" id="textVersion" disabled>
								</td>
								<th class="text-center align-middle">변경사유</th>
								<td colspan="3" class="text-center align-middle">
									<select class="form-select w-100 h-100 me-3" id="changeReason" disabled></select>
								</td>
							</tr>
						</table>
					</div>
					<div class="nav nav-tabs" id="moduleTabs">
					<!-- 
						<button class="nav-link active" id="tab1Nav" value="abc" data-bs-toggle="tab" data-bs-target="#tab1">기본정보</button>
						<button class="nav-link" id="tab2Nav" value="def" data-bs-toggle="tab" data-bs-target="#tab2">관련자료</button>
					 -->
				  	</div>
				  	<div class="row">
						<table class="table table-bordered p-0 m-0" id="projectDtlTable">
							<thead class="table-light">
								<tr>
									<th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
									<th class="text-center align-middle">No</th>
									<th class="text-center align-middle">이미지</th>
									<th class="text-center align-middle">문서</th>
									<th class="text-center align-middle">분류</th>
									<th class="text-center align-middle">구매사유</th>
									<th class="text-center align-middle">Part No</th>
									<th class="text-center align-middle">Part Name</th>
									<th class="text-center align-middle">Spec(전장,광학)-세부규격</th>
									<th class="text-center align-middle">규격</th>
									<th class="text-center align-middle">Maker</th>
									<th class="text-center align-middle">소요수량</th>
									<th class="text-center align-middle">요청일자</th>
									<th class="text-center align-middle">요청수량</th>
									<th class="text-center align-middle">기요청수량</th>
									<th class="text-center align-middle">미요청수량</th>
									<th class="text-center align-middle">재고수량</th>
									<th class="text-center align-middle">Supplier</th>
									<th class="text-center align-middle">Remark</th>
								</tr>
							</thead>
						</table>
						<div id="imageTab" class="d-none" style="min-width:100%">
							<div class="row">
								<div style="width: 49%;padding: 5px; margin-left: 5px;">
									<table class="table table-bordered p-0 m-0" id="projectImagePartNoTable">
										<thead class="table-light">
											<tr>
												<th class="text-center align-middle">순번</th>
												<th class="text-center align-middle">partNo/Code</th>
												<th class="text-center align-middle">partName/품명</th>
											</tr>
										</thead>
									</table>								
								</div>
								<div style="width:50%;padding: 5px; margin-left: 5px;">
									<table class="table table-bordered p-0 m-0" id="projectImageViewTable">
										<thead class="table-light">
											<tr>
												<th class="text-center align-middle">순번</th>
												<th class="text-center align-middle">이미지</th>
												<th class="text-center align-middle">등록자</th>
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
</div>
<!-- 구매요청 모달 -->
<div class="modal fade" id="projectReqstModal" tabindex="-1" aria-hidden="true" style="z-index: 9998;">
	<div class="modal-dialog" style="max-width: 56vw;">
		<div class="modal-content" style="height: calc(80vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					구매요청 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
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
						<div class="btn-group me-3" role="group"
						aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" onclick="designApprovalYn('001')"
							id="btndesignApprovalY">승인</button>
						<button type="button" class="btn btn-outline-light w-auto" onclick="designApprovalYn('002')"
							id="btndesignApprovalN">승인취소</button>
						</div>
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 17px !important;" id="btnProjectReqstSave" disabled>
								<i class="fa-regular fa-floppy-disk"></i>
							</button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 17px !important;" id="btnProjectReqstEdit">
								<i class="fa-regular fa-pen-to-square"></i>
							</button>
							<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnProjectReqstDel">
								<i class="fa-solid fa-trash-can"></i>
							</button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 17px !important;" id="btnProjectReqstCancel" disabled>
							<i class="fa-solid fa-xmark"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectReqstTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">
								<input class="form-check-input" type="checkbox" id="reqAllCheckBox" style="margin: 0px; width: 25px; height: 25px;">
							</th>
							<th class="text-center align-middle">승인여부</th>
							<th class="text-center align-middle">차수</th>
							<th class="text-center align-middle">partNo</th>
							<th class="text-center align-middle">part Name</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">요청일자</th>
							<th class="text-center align-middle">요청수량</th>
							<th class="text-center align-middle">특이사항</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 구매요청 script -->
<!-- 삭제 경고 -->
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
<div class="modal fade" id="imageDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
				<button type="button" class="btn btn-danger" id="btnImageDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnImageDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="documentDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
				<button type="button" class="btn btn-danger" id="btnDocumentDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnDocumentDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
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
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 7fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '3fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');
	WM_init('reqst');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let departmentList = getCommonCode('시스템', '002'); // 부서
	let changeReasonList = getCommonCode('일반', '057'); // 변경사유

	selectBoxAppend(changeReasonList, 'changeReason', '', '2'); // 변경사유
	
	$('#userModal').draggable({handle: ".modal-header"});

	let idx = '';
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let formData = new FormData();
	let deleteData = '';
	let maxVersion = '';

	let projectCd = '';
	let bizOrdAdmIdx = '';
	let projectIdx = '';
	let projectDtlIdx = '';
	let moduleGubun = '';
	let fileName = '';
	let status = '001';

	let fileFormData = new FormData();
	let fileNumber = 0;

	let dataList = new Array();

	let documentFormData = new FormData();
	let documentNumber = 0;

	let itemGubun1List = new Array();

	let itemGubunIdx = '';
	let itemGubun = '';
	let itemGubunNm = '';
	
	$.ajax({
		url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
		type : 'POST',
		data : {
			'lmsType' 		: function() { return 'L'; },
			'largeIdx' 		: function() { return ''; },
			'mediumIdx' 	: function() { return ''; },
		},
		success : function(res) {
			let data = res.data;
			for(let i = 0; i<data.length; i++) {
				if(data[i].idx==1) {
					itemGubun = data[i].itemGubun;
					itemGubunNm = data[i].itemGubunNm;
					itemGubunIdx = data[i].idx;
					return false;
				}
			}
		}
	});
	
	$.ajax({
		url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
		type : 'POST',
		data : {
			'lmsType' 		: function() { return 'M'; },
			'largeIdx' 		: function() { return '1'; },
			'mediumIdx' 	: function() { return ''; },
		},
		success : function(res) {
			let data = res.data;
			var itemGubunData = new Object();
			itemGubunData.idx = '';
			itemGubunData.itemGubun = '';
			itemGubunData.itemGubunNm = '선택';
			itemGubun1List.push(itemGubunData);
			for(let i = 0; i<data.length; i++) {
				var itemGubunData = new Object();
				itemGubunData.idx = data[i].idx;
				itemGubunData.itemGubun = data[i].itemGubun1;
				itemGubunData.itemGubunNm = data[i].itemGubun1Nm;
				itemGubun1List.push(itemGubunData);
			}
		}
	});

	let userList = new Array();
	
	$.ajax({
		url : '<c:url value="/sm/userLst"/>',
		type : 'POST',
		data : {
			userStateCd: function() { return ''; }
		},
		success : function(res) {
			let data = res.data;
			for(let i = 0; i<data.length; i++) {
				var userData = new Object();
				userData.idx = data[i].idx;
				userData.departmentCd = data[i].userDepartmentCd;
				userData.name = data[i].userName;
				userList.push(userData);
			}
		}
	});
	
	// 수주 목록 조회
	$('#bizOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmTable thead'); // filter 생성
	let bizOrderAdmTable = $('#bizOrderAdmTable').DataTable({
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
			url : '<c:url value="/bs/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return $('#startDate').val() == ''?'':moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return $('#endDate').val() == ''?'':moment($('#endDate').val()).format('YYYYMMDD'); },
				prjCd : function() { return $('#batchProjectCd').val();}
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'prjCd', className : 'text-center'},
			{ data: 'bizOrdNo', className : 'text-center'},
			{ data: 'customerNo', className : 'text-center'},
			{ data: 'ordDate', className : 'text-center'},
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
		order : [[3,'desc']],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#bizOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		bizOrderAdmTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주 데이터 click
	$('#bizOrderAdmTable tbody').on('click','tr', function() {
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}
		
		$('#goodsNm').val(bizOrderAdmTable.row(this).data().goodsNm);
		$('#ordDate').val(moment(bizOrderAdmTable.row(this).data().ordDate).format('YYYY-MM-DD'));
		$('#bizOrdNo').val(bizOrderAdmTable.row(this).data().bizOrdNo);
		$('#prjCd').val(bizOrderAdmTable.row(this).data().prjCd);
		$('#ordQty').val(addCommas(parseInt(bizOrderAdmTable.row(this).data().ordQty)));
		$('#selectVersion').removeClass('d-none');
		$('#textVersion').addClass('d-none');

		$('.batchText').addClass('d-none');
		$('#batchQty').addClass('d-none');
		$('#batchOrderDate').addClass('d-none');
		$('#btnBatchApply').addClass('d-none');
		$('#imageTab').addClass('d-none');
		$('#projectDtlTable_wrapper').removeClass('d-none');
		$('#dtlAllCheckBox').prop('checked', false);
		status = '001';
		bizOrdAdmIdx = bizOrderAdmTable.row(this).data().idx;
		projectAdmSel();
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		$('#changeReason').attr('disabled', true);
		projectDtlTable.ajax.reload(function() {});
		WM_close_OFF();
	});

	function projectAdmSel() {
		$.ajax({
			url: '<c:url value="/rm/projectAdmLst"/>',
            type: 'GET',
            async: false,
            data: {
                'bizOrdAdmIdx'	:	bizOrdAdmIdx,
                'inputGubun'	:	'002',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					dataList = new Array();
					$('#selectVersion').removeClass('d-none');
					$('#textVersion').addClass('d-none');
					$('#selectVersion').empty();
					let html = '';
					if(data!=null && data.length>0) {
						for(let i = 0; i<data.length; i++) {
							var idData = new Object();
							idData.idx = data[i].idx;
							idData.version = data[i].version;
							dataList.push(idData);
							if(i==(data.length-1)) {
								html += '<option value="'+data[i].version+'" selected>'+data[i].version+'</option>';
							} else {
								html += '<option value="'+data[i].version+'">'+data[i].version+'</option>';
							}
						}
						maxVersion = parseInt(data[data.length-1].version) + 1;
						projectIdx = data[data.length-1].idx;
						$.ajax({
							url: '<c:url value="/rm/projectSheetNameLst"/>',
				            type: 'GET',
				            async: false,
				            data: {
				                'idx'	:	projectIdx,
				            },
							success : function(res) {
								console.log(res.data)
								tabCreate(res.data);
							}
						});
						$('#userNm').val(data[data.length-1].userNm);
						$('#userIdx').val(data[data.length-1].userIdx);
						$('#userDepartmentNm').val(data[data.length-1].userDepartmentNm);
						$('#changeReason').val(data[data.length-1].changeReason);
						if(data[data.length-1].projectDesc!=null) {
							$('#projectDesc').val(data[data.length-1].projectDesc);
						} else {
							$('#projectDesc').val('');
						}
					} else {
						$('#userNm').val('');
						$('#userIdx').val('');
						$('#userDepartmentNm').val('');
						$('#changeReason').val('');
						html += '<option value="">미등록 상태입니다.</option>';
						projectIdx = '';
						$('#moduleTabs').empty();
					}
					$('#selectVersion').append(html);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	}

	function changeVersion() {
		for(let i = 0; i<dataList.length; i++) {
			if(dataList[i].version == $('#selectVersion').val()) {
				projectIdx = dataList[i].idx;
			}
		}
		
		$.ajax({
			url: '<c:url value="/rm/projectAdmLst"/>',
            type: 'GET',
            async: false,
            data: {
                'bizOrdAdmIdx'	:	bizOrdAdmIdx,
                'inputGubun'	:	'002',
                'idx'		:	projectIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					$('#userNm').val(data[0].userNm);
					$('#userIdx').val(data[0].userIdx);
					$('#userDepartmentNm').val(data[0].userDepartmentNm);
					$('#changeReason').val(data[0].changeReason);
					if(data[0].projectDesc!=null) {
						$('#projectDesc').val(data[0].projectDesc);
					} else {
						$('#projectDesc').val('');
					}
					$('#imageTab').addClass('d-none');
					$('#projectDtlTable_wrapper').removeClass('d-none');
					projectDtlTable.ajax.reload(function() {});
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	}
	
	// 수주관리 전체 목록조회
	let projectDtlTable = $('#projectDtlTable').DataTable({
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
        scrollY: '67.5vh',
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
			url : '<c:url value="/rm/projectDtlLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx	: function() { return bizOrdAdmIdx;},
				inputGubun		: function() { return '002';},
				version			: function() { return $('#selectVersion').val();},
				moduleGubun		: function() { return moduleGubun;},
				fileName		: function() { return fileName;},
				status			: function() { return status;},
				idx				: function() { return projectIdx;}
			},
		},
        //rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle', name : "dtlCheckBox", //체크박스
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<input class="form-check-input" type="checkbox" name="dtlCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					} else {
						return '<input class="form-check-input" type="checkbox" name="dtlCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					}
				}
			},
			{  //순번
				className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+(meta.row+1)+'</div>';
				}
			},
			{ data: 'imageCount', className : 'text-center align-middle', //이미지 수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data>0) {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['idx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['idx']+')">X</button>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'documentCount', className : 'text-center align-middle', //문서 수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data>0) {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['idx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['idx']+')">X</button>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'positionGubun', className : 'text-center align-middle', name: 'positionGubun', // 분류
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'purchaseGubun', className : 'text-center align-middle', name: 'purchaseGubun', //구매사유
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partCd', className : 'text-center align-middle', name: 'partCd', // partCd/품번
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partNm', className : 'text-center align-middle', name: 'partNm', // part 이름 / 품명
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'surfaceTreatment', className : 'text-center align-middle', name: 'surfaceTreatment', // 세부규격
				render : function(data, type, row, meta) {
					return '<div style="min-width:400px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partDc', className : 'text-center align-middle', name: 'partDc', // 규격
				render : function(data, type, row, meta) {
					return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'maker', className : 'text-center align-middle', name: 'maker', // 가공처
				render : function(data, type, row, meta) {
					return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'needQty', className : 'text-end align-middle', name: 'needQty', // 필요수량
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ className : 'text-center align-middle', name: 'orderDate',
				render : function(data, type, row, meta) {
					return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ className : 'text-end align-middle', name: 'orderQty', // 요청수량
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'orderQty', className : 'text-end align-middle', name: 'existOrderQty', // 기요청수량
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ className : 'text-end align-middle', name: 'notOrderQty', // 미요청수량
				render : function(data, type, row, meta) {
					let value = parseInt(row['needQty']) * parseInt($('#ordQty').val()) - parseInt(row['orderQty']);
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(value)+'</div>';
				}
			},
			{ data: 'ssQty', className : 'text-end align-middle', name: 'ssQty', // 재고수량
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ data: 'supplier', className : 'text-center align-middle', name: 'supplier', // supplier
				render : function(data, type, row, meta) {
					return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'remark', className : 'text-center align-middle', name: 'remark', //비고
				render : function(data, type, row, meta) {
					return '<div style="white-space:pre-line;min-width:300px;">'+data+'</div>';
				}
			},
		],
		columnDefs : [
			{targets: '_all', className: "dynamicColumn"},
			{
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}
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
			{ extend: 'colvis',	text: 'Select Col',
		        columns: ':not(:first-child)'
			},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let theadHeight = parseFloat($('#projectDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#projectDtlTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#projectDtlTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			$('.bootstrapToggle').bootstrapToggle();

			let data = api.data();
			let node = api.rows().nodes();
			if(data.length > 0){
				$(node).each(function(index, item) {
					let selectData = projectDtlTable.row(item).data();
					if( projectDtlTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(projectDtlTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(projectDtlTable.row(item).node()).addClass('notEdit');
					}
				});
			}
			
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#projectDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#projectDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	projectDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = projectDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#projectDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 수주별발주 수정 버튼 click
	$('#btnEdit').on('click', function() {

		if($('#selectVersion').val()=='') {
			toastr.warning('등록 먼저 해주세요.');
			return false;
		} 
		projectDtlTable.columns('.dynamicColumn').visible(true);
		$('#newItemTable').DataTable().clear().draw();
		let newItemCheck = false;
		
		WM_action_ON('edit','workingWarningModal');
		WM_close_ON();

		$('#btnNew').attr('disabled', true);
		$('#btnSalesManagerDelete').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);
		$('#changeReason').attr('disabled', false);
		$('#selectVersion').addClass('d-none');
		$('#textVersion').removeClass('d-none');
		$('#textVersion').val($('#selectVersion').val());

		$('.batchText').removeClass('d-none');
		$('#batchQty').removeClass('d-none');
		$('#batchOrderDate').removeClass('d-none');
		$('#btnBatchApply').removeClass('d-none');
		$('#batchQty').val($('#ordQty').val());
		
		$('#projectDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#projectDtlTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
						if(index_td == projectDtlTable.column('positionGubun:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('purchaseGubun:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:100px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('orderGubun:name').index()) {
							let value = projectDtlTable.row(tr).data().orderGubun;
							let html = '';
							html += '<select style="min-width:100px;" class="form-select">';
							if(value=="001") {
								html +='<option value="001" selected>가공</option>';
								html +='<option value="002">구매</option>';
							} else {
								html +='<option value="001">가공</option>';
								html +='<option value="002" selected>구매</option>';
							}
							html += '</select>';
							$(td).html(html);
						} else if(index_td == projectDtlTable.column('partCd:name').index()) {
							let value = $(td).text();
							if(value=='') {
								newItemCheck = true;
								$('#newItemTable').DataTable().row.add({
									'idx'			: projectDtlTable.row(tr).data().idx,
									'maker'			: projectDtlTable.row(tr).data().maker,
									'partDc'		: projectDtlTable.row(tr).data().partDc,
									'dtlRowId'		: index_tr,
									'projectDtlIdx'	: projectDtlTable.row(tr).data().idx
								}).draw(false);
							}
							$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('partGubun:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:80px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('partNm:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('material:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('surfaceTreatment:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:400px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('partDc:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:300px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('maker:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('needQty:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('inventoryQty:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('orderDate:name').index()) {
							$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
						} else if(index_td == projectDtlTable.column('orderQty:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" name="orderQty" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('supplier:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:130px;" class="form-control" value="'+value+'">');
						} else if(index_td == projectDtlTable.column('remark:name').index()) {
							let value = $(td).text();
							let height = $(td).height()+5;
							$(td).html('<textarea class="form-control" style="min-width:300px; resize: none; min-height: '+height+'px;" >'+value+'</textarea>');
						}
					}
				})
			}
		});
		
		$('input[name=admCheckBox]').attr('disabled', false);
		
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
		
		
		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼

		if(newItemCheck) {
			$('#newItemModal').modal('show');
			setTimeout(function() {
				$('#newItemTable').DataTable().draw();
			}, 200);
		}
	});
	
	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				bizOrderAdmTable.row('#'+idx).select();
				$(bizOrderAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				
				$('#btnManagerAdd').attr('disabled', true); // 추가 버튼
				$('#btnManagerDel').attr('disabled', true); // 삭제 버튼
				$('#btnFileAdd').attr('disabled', true); // 추가 버튼
				$('#btnFileDel').attr('disabled', true); // 삭제 버튼
				formData = new FormData();
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
				$('#btnManagerAdd').attr('disabled', true); // 추가 버튼
				$('#btnManagerDel').attr('disabled', true); // 삭제 버튼
				$('#btnFileAdd').attr('disabled', true); // 추가 버튼
				$('#btnFileDel').attr('disabled', true); // 삭제 버튼
				formData = new FormData();
			}
			
			return false;
		}
	});

	// 신규 버튼 click
	$('#btnNew').on('click', function() {
		if(bizOrdAdmIdx=='') {
			toastr.warning('수주를 선택해 주세요.');
			return false;
		}
        $('#excelUploadFile').trigger('click');
	});

	
	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
// 		let duplicate = {};
		let state = true;
		let saveCheck = true;
		let orderDataCheck = false;
// 		let duplicateState = true;
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				if($('#userIdx').val() == '') {
					toastr.warning('작성자를 선택해주세요.');
					$('#btnUserSel').select();
					state = false;
					$('#my-spinner').hide();
					return false;
				}
				if(state) {
					if(status=='001') {		//수정
						$('#projectDtlTable tbody').find('tr').each(function(index, item) {
							if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
								let td = $(item).find('td');
								let data = projectDtlTable.row($(item)).data();
								let node = projectDtlTable.row($(item)).node();
								
								let idx = projectDtlTable.row($(item)).data().idx;
								let positionGubun = $(td).eq(projectDtlTable.column('positionGubun:name').index()).find('input').val();
								let purchaseGubun = $(td).eq(projectDtlTable.column('purchaseGubun:name').index()).find('input').val();
								let partCd = $(td).eq(projectDtlTable.column('partCd:name').index()).find('input').val();
								let partNm = $(td).eq(projectDtlTable.column('partNm:name').index()).find('input').val();
								let surfaceTreatment = $(td).eq(projectDtlTable.column('surfaceTreatment:name').index()).find('input').val();
								let partDc = $(td).eq(projectDtlTable.column('partDc:name').index()).find('input').val();
								let maker = $(td).eq(projectDtlTable.column('maker:name').index()).find('input').val();
								let needQty = $(td).eq(projectDtlTable.column('needQty:name').index()).find('input').val();
								let orderDate = $(td).eq(projectDtlTable.column('orderDate:name').index()).find('input').val();
								let orderQty = $(td).eq(projectDtlTable.column('orderQty:name').index()).find('input').val();
								//let inventoryQty = $(td).eq(projectDtlTable.column('inventoryQty:name').index()).find('input').val();
								let supplier = $(td).eq(projectDtlTable.column('supplier:name').index()).find('input').val();
								let remark = $(td).eq(projectDtlTable.column('remark:name').index()).find('textarea').val();
// 								let chk = partCd;
// 								if(duplicate[chk]){
// 									toastr.warning('이미 존재하는 코드입니다.');
// 									duplicateState = false;
// 									saveCheck = false;
// 									$('#my-spinner').hide();
// 									return false;
// 								}else{
// 									duplicate[chk] = true;
// 								}

								let obj = new Object();
								obj.projectIdx = projectIdx;
								obj.idx = idx;
								obj.userIdx = $('#userIdx').val();
								obj.changeReason = $('#changeReason').val();
								obj.positionGubun = positionGubun;
								obj.purchaseGubun = purchaseGubun;
								obj.orderGubun = "002";
								obj.partCd = partCd;
								obj.partNm = partNm;
								obj.surfaceTreatment = surfaceTreatment;
								obj.partDc = partDc;
								obj.maker = maker;
								obj.needQty = needQty.replace(/,/g, '');
								obj.orderDate = orderDate.replace(/-/g, '');
								obj.orderQty = orderQty.replace(/,/g, '');
								//obj.inventoryQty = inventoryQty.replace(/,/g, '');
								obj.supplier = supplier;
								obj.remark = remark;
								obj.inputGubun = '002';
								obj.orderRemark = '';
								array.push(obj);
								if(orderDate!='' && orderQty != '') {
									orderDataCheck = true;
									saveCheck = false;
// 									duplicateState = true;
								}
							}
						});

						//원본 데이터
						let tableData = [];
						$('#projectDtlTable tbody').find('tr').each(function(index, item) {
							if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
								let obj = {};

								let data = projectDtlTable.row(index).data();
								obj.projectIdx = projectIdx;
								obj.idx = data.idx;
								obj.userIdx = $('#userIdx').val();
								obj.changeReason = $('#changeReason').val();
								obj.positionGubun = data.positionGubun;
								obj.purchaseGubun = data.purchaseGubun;
								obj.orderGubun = "002";
								obj.partCd = data.partCd;
								obj.partNm = data.partNm;
								obj.surfaceTreatment = data.surfaceTreatment;
								obj.partDc = data.partDc;
								obj.maker = data.maker;
								obj.needQty = data.needQty;
								obj.orderDate = moment().format('YYYYMMDD');
								obj.orderQty = '';
								//obj.inventoryQty = data.inventoryQty;
								obj.supplier = data.supplier;
								obj.remark = data.remark;
								obj.inputGubun = '002';
								obj.orderRemark = '';
								tableData.push(obj);
							}
						});
						console.log(array)
						console.log(tableData)
						array = _.differenceWith(array, tableData, _.isEqual);
						console.log(array)
						
						if(array.length==0) {
							let obj = {};
							obj.projectIdx = projectIdx;
							obj.idx = "x";
							obj.userIdx = $('#userIdx').val();
							obj.changeReason = $('#changeReason').val();
							obj.inputGubun = '002';
							array.push(obj);
						}
						if(saveCheck) {
							$.ajax({
								url: '<c:url value="/rm/projectUpd"/>',
					            type: 'POST',
					            data: {
					            	'jsonArray'	:	JSON.stringify(array)
					            },
					            beforeSend: function() {
					            	$('#my-spinner').show();
					            },
								success : function(res) {
									if (res.result == "ok") { //응답결과
										toastr.success('수정되었습니다.');
										WM_action_OFF('edit');
										projectDtlTable.rows('.selected').deselect();
	
										projectDtlTable.ajax.reload();
										$('#btnNew').attr('disabled',false);
										$('#btnSave').attr('disabled',true);
										$('#btnEdit').attr('disabled',false);
										$('#btnDel').attr('disabled',false);
										$('#btnCancel').attr('disabled',true);
										$('#my-spinner').hide();
										$('#selectVersion').removeClass('d-none');
										$('#textVersion').addClass('d-none');
										$('#btnUserSel').attr('disabled', true);
										$('#changeReason').attr('disabled', true);
	
										$('.batchText').addClass('d-none');
										$('#batchQty').addClass('d-none');
										$('#batchOrderDate').addClass('d-none');
										$('#btnBatchApply').addClass('d-none');
									} else if(res.result == 'fail') {
										toastr.warning(res.message);
									} else {
										toastr.error(res.message);
									}
									$('#my-spinner').hide();
								}
							});
						} else {
							$('#my-spinner').hide();
							$('#orderRemark').val('');
							$('#orderRemarkModal').modal('show');
						}
					} else {				//등록
						$.ajax({
							url: '<c:url value="/rm/projectExcelIns"/>',
				            type: 'POST',
				            async: false,
				            data: {
				                'bizOrdAdmIdx'		:	bizOrdAdmIdx,
				                'inputGubun'		:	"002",
				                'version'			:	$('#textVersion').val(),
				                'userIdx'			:	$('#userIdx').val(),
				                'changeReason'		:	$('#changeReason').val(),
				                'fileName'			:	fileName,
				            },
				            beforeSend: function() {
				            	//$('#my-spinner').show();
				            },
							success : function(res) {
								if (res.result == "ok") { //응답결과
									toastr.success('등록되었습니다.');
									WM_action_OFF('new');
									projectDtlTable.rows('.selected').deselect();

									status = '001';
									projectAdmSel();
									projectDtlTable.ajax.reload();
									
									$('#btnNew').attr('disabled',false);
									$('#btnSave').attr('disabled',true);
									$('#btnEdit').attr('disabled',false);
									$('#btnDel').attr('disabled',false);
									$('#btnCancel').attr('disabled',true);
									$('#my-spinner').hide();
									$('#selectVersion').removeClass('d-none');
									$('#textVersion').addClass('d-none');
									$('#btnUserSel').attr('disabled', true);
									$('#changeReason').attr('disabled', true);
								} else if(res.result == 'fail') {
									$('#my-spinner').hide();
									managerCheck = false;
									fileCheck = false;
									toastr.warning(res.message);
								} else {
									toastr.error(res.message);
								}
							}
						});
					}
				}
			},100)
		})
		$('#my-spinner').hide();
		WM_close_OFF();
	});

	$('#btnOrderRemarkSave').on('click', function() {
		let array = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				$('#projectDtlTable tbody').find('tr').each(function(index, item) {
					if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
						let td = $(item).find('td');
						let data = projectDtlTable.row($(item)).data();
						let node = projectDtlTable.row($(item)).node();
						
						let idx = projectDtlTable.row($(item)).data().idx;
						let positionGubun = $(td).eq(projectDtlTable.column('positionGubun:name').index()).find('input').val();
						let purchaseGubun = $(td).eq(projectDtlTable.column('purchaseGubun:name').index()).find('input').val();
						let partCd = $(td).eq(projectDtlTable.column('partCd:name').index()).find('input').val();
						let partNm = $(td).eq(projectDtlTable.column('partNm:name').index()).find('input').val();
						let surfaceTreatment = $(td).eq(projectDtlTable.column('surfaceTreatment:name').index()).find('input').val();
						let partDc = $(td).eq(projectDtlTable.column('partDc:name').index()).find('input').val();
						let maker = $(td).eq(projectDtlTable.column('maker:name').index()).find('input').val();
						let needQty = $(td).eq(projectDtlTable.column('needQty:name').index()).find('input').val();
						let orderDate = $(td).eq(projectDtlTable.column('orderDate:name').index()).find('input').val();
						let orderQty = $(td).eq(projectDtlTable.column('orderQty:name').index()).find('input').val();
						//let inventoryQty = $(td).eq(projectDtlTable.column('inventoryQty:name').index()).find('input').val();
						let supplier = $(td).eq(projectDtlTable.column('supplier:name').index()).find('input').val();
						let remark = $(td).eq(projectDtlTable.column('remark:name').index()).find('textarea').val();

						let obj = new Object();
						obj.projectIdx = projectIdx;
						obj.idx = idx;
						obj.userIdx = $('#userIdx').val();
						obj.changeReason = $('#changeReason').val();
						obj.positionGubun = positionGubun;
						obj.purchaseGubun = purchaseGubun;
						obj.orderGubun = "002";
						obj.partCd = partCd;
						obj.partNm = partNm;
						obj.surfaceTreatment = surfaceTreatment;
						obj.partDc = partDc;
						obj.maker = maker;
						obj.needQty = needQty.replace(/,/g, '');
						obj.orderDate = orderDate.replace(/-/g, '');
						obj.orderQty = orderQty.replace(/,/g, '');
						//obj.inventoryQty = inventoryQty.replace(/,/g, '');
						obj.supplier = supplier;
						obj.remark = remark;
						obj.inputGubun = '002';
						obj.orderRemark = $('#orderRemark').val();
						array.push(obj);
					}
				});

				//원본 데이터
				let tableData = [];
				$('#projectDtlTable tbody').find('tr').each(function(index, item) {
					if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
						let obj = {};

						let data = projectDtlTable.row(index).data();
						obj.projectIdx = projectIdx;
						obj.idx = data.idx;
						obj.userIdx = $('#userIdx').val();
						obj.changeReason = $('#changeReason').val();
						obj.positionGubun = data.positionGubun;
						obj.purchaseGubun = data.purchaseGubun;
						obj.orderGubun = "002";
						obj.partCd = data.partCd;
						obj.partNm = data.partNm;
						obj.surfaceTreatment = data.surfaceTreatment;
						obj.partDc = data.partDc;
						obj.maker = data.maker;
						obj.needQty = data.needQty;
						obj.orderDate = moment().format('YYYYMMDD');
						obj.orderQty = '';
						//obj.inventoryQty = data.inventoryQty;
						obj.supplier = data.supplier;
						obj.remark = data.remark;
						obj.inputGubun = '002';
						obj.orderRemark = $('#orderRemark').val();
						tableData.push(obj);
					}
				});
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)
				$.ajax({
					url: '<c:url value="/rm/projectUpd"/>',
		            type: 'POST',
		            data: {
		            	'jsonArray'	:	JSON.stringify(array)
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							$('#orderRemarkModal').modal('hide');
							toastr.success('수정되었습니다.');
							WM_action_OFF('edit');
							projectDtlTable.rows('.selected').deselect();

							projectDtlTable.ajax.reload();
							$('#btnNew').attr('disabled',false);
							$('#btnSave').attr('disabled',true);
							$('#btnEdit').attr('disabled',false);
							$('#btnDel').attr('disabled',false);
							$('#btnCancel').attr('disabled',true);
							$('#my-spinner').hide();
							$('#selectVersion').removeClass('d-none');
							$('#textVersion').addClass('d-none');
							$('#btnUserSel').attr('disabled', true);
							$('#changeReason').attr('disabled', true);
							$('#orderRemarkModal').modal('show');
							$('.batchText').addClass('d-none');
							$('#batchQty').addClass('d-none');
							$('#batchOrderDate').addClass('d-none');
							$('#btnBatchApply').addClass('d-none');
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			},100)
		});
	});
	
	/*
	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		deleteData = 'ADM';
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		idx = bizOrderAdmTable.row('.selected').data().idx;
		if(deleteData=='ADM') {
			if( $('#dealCorpFileTable').DataTable().rows().count()>0 ){
				$('#dealCorpFileTable tbody tr').each(function(index, item){
					if(dealCorpFileTable.row(this).data().insertYn=='001') {
						let uuid = dealCorpFileTable.row(this).data().uuid;
						let ext = dealCorpFileTable.row(this).data().fileExt;
						fileDelete({uuid:uuid,ext:ext});
					}
				});
			}
			$.ajax({
				url: '<c:url value="/bm/dealCorpAdmDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						$('#btnSearch').trigger('click'); // 조회버튼 click

						$('.inputGroup').val('');
						
						$('.inputGroup').attr('disabled', true); // 입력항목
						$('#salesManager').val('');
						$('#salesManagerNm').val('');
						dealGubunReset();
						$('input[name="dealGubun"]').attr('disabled', true);						

						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
						$('#btnManagerAdd').attr('disabled', true); // 추가 버튼
						$('#btnManagerDel').attr('disabled', true); // 삭제 버튼
						$('#btnFileAdd').attr('disabled', true); // 추가 버튼
						$('#btnFileDel').attr('disabled', true); // 삭제 버튼
						$('#dealCorpManagerTable').DataTable().clear().draw();	//담당자 테이블 초기화
						$('#dealCorpFileTable').DataTable().clear().draw();	//관련파일 테이블 초기화
						$('#my-spinner').hide();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				}
			});
		} else {
			$.ajax({
				url: '<c:url value="/bm/dealCorpFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'admIdx'	:	idx,
	                'idx'		:	$('#dealCorpFileTable').DataTable().row('.selected').data().idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					let uuid = $('#dealCorpFileTable').DataTable().row('.selected').data().uuid;;
					let ext = $('#dealCorpFileTable').DataTable().row('.selected').data().fileExt;
					fileDelete({uuid:uuid,ext:ext});
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#dealCorpFileTable').DataTable().row('.selected').remove().draw();
						fileNumber = 1;
				    	$('#dealCorpFileTable tbody tr').each(function(index, item){
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
		}
	});
	*/
	
	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'edit');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');
		toastr.success('취소되었습니다.');
		
		if(cancelType == 'reqst') {
			WM_action_OFF('reqst');
			$('input[name=reqCheckBox]').attr('disabled', false);
			$('#btnProjectReqstSave').attr('disabled', true); // ADM 저장 버튼
			$('#btnProjectReqstEdit').attr('disabled', false); // ADM 수정 버튼
			$('#btnProjectReqstCancel').attr('disabled', true); // ADM 취소 버튼
			$('#btndesignApprovalY').attr('disabled', false); // 승인 버튼
			$('#btndesignApprovalN').attr('disabled', false); // 승인취소 버튼
			
			projectReqstTable.ajax.reload(function(){});
			projectReqstTable.colReorder.enable();
		}else{
			WM_action_OFF('new');
			WM_action_OFF('edit');

			$('.inputGroup').attr('disabled', true); // 입력항목
			$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
			$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
	
// 			dealCorpManagerTable.ajax.reload(function() {});
// 			dealCorpFileTable.ajax.reload(function() {});
			projectAdmSel();
			$('#btnNew').attr('disabled', false);
			$('#btnSave').attr('disabled', true); // ADM 저장 버튼
			$('#btnEdit').attr('disabled', false); // ADM 수정 버튼
			$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
			$('#btnCancel').attr('disabled', true); // ADM 취소 버튼
			$('#btnSalesManagerDelete').attr('disabled', true);
			$('#btnUserSel').attr('disabled', true);
			$('#changeReason').attr('disabled', true);
			$('#selectVersion').removeClass('d-none');
			$('#textVersion').addClass('d-none');
			$('#textVersion').val('');

			$('.batchText').addClass('d-none');
			$('#batchQty').addClass('d-none');
			$('#batchOrderDate').addClass('d-none');
			$('#btnBatchApply').addClass('d-none');
			$('#batchQty').val('');
			
			$('#projectDtlTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			projectDtlTable.ajax.reload(function(){});
			$('input[name=admCheckBox]').attr('disabled', false);
			$('#dtlAllCheckBox').attr('disabled', false);
			$('#dtlAllCheckBox').prop('checked', false);
		}
	});

	$("#btnUserSel").on("click",function(){
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
		}, 200);
		inputStatus = 'ADM';
	});

	function userSel(value) {
		console.log("123")
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

		if(inputStatus == 'ADM') {
			$('#userIdx').val(data.idx);
			$('#userNm').val(data.userName);
			$('#userDepartmentNm').val(data.userDepartmentNm);
		} else if(inputStatus == 'FILE') {
			$('#projectFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#projectFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#projectFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		} else if(inputStatus == 'DOCUMENT') {
			$('#projectDocumentTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
			$('#projectDocumentTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
			$('#projectDocumentTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		}
		$('#userModal').modal('hide');
	});

	// 본사영업담당 삭제
	$('#btnUserDelete').on('click', function() {
		$('#userIdx').val('');
		$('#userNm').val('');
		$('#userDepartmentNm').val('');
	});


	//파일 선택
	$('#excelUploadFile').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);
	
		var str = $('#excelUploadFile').val();
	
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="/rm/projectBomOpticsFileload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if(res.result=='ok') {
						$('#excelUploadFile').val("");
						let data = res.data;
						fileName = res.fileName;
						status = '002';
						tabCreate(data[0].sheetNameList);
						$('#btnUserSel').attr('disabled', false);
						$('#changeReason').attr('disabled', false);
						$('#selectVersion').addClass('d-none');
						$('#textVersion').removeClass('d-none');
						if($('#selectVersion').val()!='') {
							$('#textVersion').val(maxVersion);
						} else {
							$('#textVersion').val(1);
						}
						
						$('#projectDtlTable').DataTable().ajax.reload(function(){});

						$('#userIdx').val("${userIdx}");
						$('#userNm').val("${userNm}");
						$('#userDepartmentNm').val("${userDepartmentNm}");
						$('#changeReason').val('');
						
						$('#btnNew').attr('disabled', true); // ADM 신규 버튼
						$('#btnSave').attr('disabled', false); // ADM 저장 버튼
						$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
						$('#btnDel').attr('disabled', true); // ADM 삭제 버튼
						$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
						WM_action_ON('new','workingWarningModal');
						$('#my-spinner').hide();
					} else {
						toastr.error('오류가 발생했습니다.');
						$('#my-spinner').hide();
					}
				},
				complete : function() {
				}
			});

		} else {
			toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}
	});

	//전체선택클릭
	$('#dtlAllCheckBox').on('click',function(){
		if ( $('#dtlAllCheckBox').prop("checked") ) {
			$('#projectDtlTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#projectDtlTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", false);
				}
			});
		}
	});

	function tabCreate(nameList) {
		let sheetName = nameList.split('%/%');
		let tabHtml = '';
		$('#moduleTabs').empty();
		for(let i = 0; i<sheetName.length; i++) {
			let moduleName = sheetName[i].split('-');
			if(i==0) {
				tabHtml += '<button class="nav-link active" onclick="tableReload(\''+moduleName[0]+'\')" id="tab'+(i+1)+'Nav" value="'+moduleName[0]+'" data-bs-toggle="tab">'+moduleName[0] + ' : ' + moduleName[1] +'</button>';
				console.log(moduleName[0])
				moduleGubun = moduleName[0];
			} else {
				tabHtml += '<button class="nav-link" onclick="tableReload(\''+moduleName[0]+'\')" id="tab'+(i+1)+'Nav" value="'+moduleName[0]+'" data-bs-toggle="tab">'+moduleName[0] + ' : ' + moduleName[1] +'</button>';
			}
			if(i+1 == sheetName.length) {
				tabHtml += '<button class="nav-link" onclick="ImageReload()" data-bs-toggle="tab">이미지</button>';
				tabHtml += '<label class="batchText form-label d-flex align-items-center header-label m-0 me-1 d-none">설비대수</label>';
				tabHtml += '<input type="text" onkeyup="numberFormat(this, \'int\')" style="text-align:right;" class="form-control w-auto me-1 d-none" id="batchQty">';
				tabHtml += '<label class="batchText form-label d-flex align-items-center header-label m-0 me-1 d-none">요청일자</label>';
				tabHtml += '<div class="btn-group" id="batchDiv" role="group" aria-label="Small button group justify-content-end">';
				tabHtml += '<input type="date" max="9999-12-31" value="'+moment().format('YYYY-MM-DD')+'" class="form-control w-auto h-100 me-1 d-none" id="batchOrderDate">';
				tabHtml += '<button type="button" class="btn btn-outline-light w-auto d-none" onclick="batchApply()" id="btnBatchApply">적용</button>';
				tabHtml+= '</div>';
			}
		}
		$('#moduleTabs').html(tabHtml);
	}

	function batchApply() {
		$('#projectDtlTable tbody tr').each(function(index, item){
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				$(this).find('input[name=orderDate]').val($('#batchOrderDate').val());
				let data = projectDtlTable.row(index).data();
				let orderQty = parseInt(data.needQty) * parseInt($('#batchQty').val());
				$(this).find('input[name=orderQty]').val(orderQty);
			}
		});
	}
	

	function tableReload(value) {
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}
		moduleGubun = value;
		$('#imageTab').addClass('d-none');
		$('#projectDtlTable_wrapper').removeClass('d-none');
		$('#projectDtlTable').DataTable().ajax.reload(function(){});
	}


	//요청-----------------------------------------------------------
	$('#btnProjectReqst').on('click',function() { // 구매요청 버튼 클릭
		if(bizOrdAdmIdx=='') {
			toastr.warning('프로젝트를 선택해 주세요.');
			return false;
		}
		projectCd = bizOrderAdmTable.row('.selected').data().prjCd;
		$('#projectReqstModal').modal('show');

		$('#reqAllCheckBox').prop('checked', false);
		$('input[name=reqCheckBox]').attr('disabled', false);
		$('#btnProjectReqstSave').attr('disabled', true); // ADM 저장 버튼
		$('#btnProjectReqstEdit').attr('disabled', false); // ADM 수정 버튼
		$('#btnProjectReqstCancel').attr('disabled', true); // ADM 취소 버튼
		$('#btndesignApprovalY').attr('disabled', false); // 승인 버튼
		$('#btndesignApprovalN').attr('disabled', false); // 승인취소 버튼
		setTimeout(function() {
			projectReqstTable.ajax.reload(function() {});
		}, 150);
	});

	//전체선택클릭
	$('#reqAllCheckBox').on('click',function(){
		if ( $('#reqAllCheckBox').prop("checked") ) {
			$('#projectReqstTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=reqCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=reqCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#projectReqstTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=reqCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=reqCheckBox]').prop("checked", false);
				}
			});
		}
	});


	let projectReqstTable = $('#projectReqstTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
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
			url : '<c:url value="/rm/projectDtlOrderLst"/>',
			type : 'GET',
			data : {
				'inputGubun'	: function() { return '002';},
				'projectCd'		: function() { return projectCd; },
				'version'		: function() { return $('#version').val(); },
			},
		},
		columns : [
			{ className : 'text-center align-middle', name : "reqCheckBox", //체크박스
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<input class="form-check-input" type="checkbox" name="reqCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					} else {
						return '<input class="form-check-input" type="checkbox" name="reqCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					}
				}
			},
			{ data: 'designApprovalYn', className : 'text-center align-middle', name: 'designApprovalYn', //승인여부
				render : function(data, type, row, meta) {
					if(data=='001') {
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">승인</div>';
					} else {
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미승인</div>';
					}
				}
			},
			{ data: 'version', className : 'text-center align-middle', name: 'version',  //차수
				className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partCd', className : 'text-center align-middle', name: 'partCd', // partCd/품번
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partNm', className : 'text-center align-middle', name: 'partNm', // part 이름 / 품명
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'partDc', className : 'text-center align-middle', name: 'partDc', // 규격
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'orderDate', className : 'text-center align-middle', name: 'orderDate',
				render : function(data, type, row, meta) {
					return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
				}
			},
			{ data: 'orderQty', className : 'text-end align-middle', name: 'orderQty', // 요청수량
				render : function(data, type, row, meta) {
					return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ data: 'orderRemark', className : 'text-end align-middle', name: 'orderRemark', // 특이사항
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else{
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			
		],
	});

	function designApprovalYn(value) {
		if($('[name=reqCheckBox]:checked').length == 0){
			toastr.warning('요청 데이터를 선택해 주세요..');
			return false;
		}
		let check = false;
		let array = [];
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let td = $(item).find('td');
				let data = projectReqstTable.row($(item)).data();
				if(value == '001'){
					if(data.designApprovalYn=='001') {
						toastr.warning("이미 승인된 데이터가 있습니다.");
						check = false;
						return false;
					}
				}else if(value == '002'){
					if(data.designApprovalYn=='002') {
						toastr.warning("미승인된 데이터가 있습니다.");
						check = false;
						return false;
					}
				}
				let node = projectReqstTable.row($(item)).node();
				
				let projectIdx = projectReqstTable.row($(item)).data().projectIdx;
				let projectDtlIdx = projectReqstTable.row($(item)).data().projectDtlIdx;
				let groupIdx = projectReqstTable.row($(item)).data().groupIdx;
				let idx = projectReqstTable.row($(item)).data().idx;

				let obj = new Object();
				obj.projectIdx = projectIdx;
				obj.projectDtlIdx = projectDtlIdx;
				obj.groupIdx = groupIdx;
				obj.idx = idx;
				obj.designApprovalYn = value;
				obj.inputGubun = '002';
				array.push(obj);
				check = true;
			}
		});
		let tableData = [];
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let obj = new Object();
				let data = projectReqstTable.row(index).data();
				obj.projectIdx = data.projectIdx;
				obj.projectDtlIdx = data.projectDtlIdx;
				obj.groupIdx = data.groupIdx;
				obj.idx = data.idx;
				obj.designApprovalYn = data.designApprovalYn;
				obj.inputGubun = '002';
				tableData.push(obj);
			}
		});
		console.log(array)
		array = _.differenceWith(array, tableData, _.isEqual);
		console.log(tableData)
		console.log(array)
		if(check) {
			$.ajax({
				url: '<c:url value="/rm/projectDtlOrderUpd"/>',
	            type: 'POST',
	            data: {
	                'jsonArray'	:	JSON.stringify(array)
	            },
				beforeSend: function() {
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('승인되었습니다.');
						$('#reqAllCheckBox').prop('checked', false);
						$('input[name=reqCheckBox]').attr('disabled', false);
						projectReqstTable.ajax.reload(function() {});
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		}
	}

	// 수주별발주 저장 버튼 click
	$('#btnProjectReqstSave').on('click', function() {
		let array = [];
		let state = true;
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let td = $(item).find('td');
				let data = projectReqstTable.row($(item)).data();
				let node = projectReqstTable.row($(item)).node();
				
				let projectIdx = projectReqstTable.row($(item)).data().projectIdx;
				let version = projectReqstTable.row($(item)).data().version;
				let orderGubun = projectReqstTable.row($(item)).data().orderGubun;
				let projectDtlIdx = projectReqstTable.row($(item)).data().projectDtlIdx;
				let groupIdx = projectReqstTable.row($(item)).data().groupIdx;
				let idx = projectReqstTable.row($(item)).data().idx;
				let orderDate = $(td).eq(projectReqstTable.column('orderDate:name').index()).find('input').val();
				let orderQty = $(td).eq(projectReqstTable.column('orderQty:name').index()).find('input').val();
				let remark = $(td).eq(projectReqstTable.column('orderRemark:name').index()).find('input').val();

				let obj = new Object();
				obj.projectIdx = projectIdx;
				obj.version = version;
				obj.orderGubun = orderGubun;
				obj.projectDtlIdx = projectDtlIdx;
				obj.groupIdx = groupIdx;
				obj.idx = idx;
				obj.orderDate = orderDate.replace(/-/g, '');
				obj.orderQty = orderQty.replace(/,/g, '');
				obj.remark = remark;
				obj.inputGubun = '002';
				obj.designApprovalYn = null;
				array.push(obj);
			}
		});

		let tableData = [];
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let obj = {};

				let data = projectReqstTable.row(index).data();
				obj.projectIdx = data.projectIdx;
				obj.version = data.version;
				obj.orderGubun = data.orderGubun;
				obj.projectDtlIdx = data.projectDtlIdx;
				obj.groupIdx = data.groupIdx;
				obj.idx = data.idx;
				obj.orderDate = data.orderDate;
				obj.orderQty = data.orderQty;
				obj.remark = data.orderRemark;
				obj.inputGubun = '002';
				obj.designApprovalYn = null;
				tableData.push(obj);
			}
		});
		console.log(array)
		array = _.differenceWith(array, tableData, _.isEqual);
		console.log(tableData)
		console.log(array)
		
		$.ajax({
			url: '<c:url value="/rm/projectDtlOrderUpd"/>',
            type: 'POST',
            data: {
                'jsonArray'	:	JSON.stringify(array)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					projectReqstTable.ajax.reload(function() {});
					projectReqstTable.colReorder.enable();

					$('input[name=reqCheckBox]').attr('disabled', false);
					$('#btnProjectReqstSave').attr('disabled', true); // ADM 저장 버튼
					$('#btnProjectReqstEdit').attr('disabled', false); // ADM 수정 버튼
					$('#btnProjectReqstCancel').attr('disabled', true); // ADM 취소 버튼
					$('#btndesignApprovalY').attr('disabled', false); // 승인 버튼
					$('#btndesignApprovalN').attr('disabled', false); // 승인취소 버튼
					
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	});

	// 수주별발주 수정 버튼 click
	$('#btnProjectReqstEdit').on('click', function() {
		if($('[name=reqCheckBox]:checked').length == 0){
			toastr.warning('수정할 데이터를 선택해 주세요.');
			return false;
		}
		$('input[name=reqCheckBox]').attr('disabled', true);
		$('#btnProjectReqstSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnProjectReqstEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnProjectReqstCancel').attr('disabled', false); // ADM 취소 버튼
		$('#btndesignApprovalY').attr('disabled', true); // 승인 버튼
		$('#btndesignApprovalN').attr('disabled', true); // 승인취소 버튼
		
// 		$('#projectReqstTable tbody').find('tr').each(function(index_tr, tr) {
// 			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
// 				if(projectReqstTable.row(index_tr).data().designApprovalYn=='001') {
// 					toastr.warning('승인된 데이터는 수정할 수 없습니다.');
// 					return false;
// 				}
// 			}
// 		});
		
		$('#projectReqstTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				if(projectReqstTable.row(index_tr).data().designApprovalYn=='001') {
					toastr.warning('승인된 데이터는 수정할 수 없습니다.');
					$('input[name=reqCheckBox]').attr('disabled', false);
					$('#btnProjectReqstSave').attr('disabled', true); // ADM 저장 버튼
					$('#btnProjectReqstEdit').attr('disabled', false); // ADM 수정 버튼
					$('#btnProjectReqstCancel').attr('disabled', true); // ADM 취소 버튼
					$('#btndesignApprovalY').attr('disabled', false); // 승인 버튼
					$('#btndesignApprovalN').attr('disabled', false); // 승인취소 버튼
					return false;
				} else{
					$(tr).find('td').each(function(index_td, td) {
						if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
							if(index_td == projectReqstTable.column('orderDate:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
							} else if(index_td == projectReqstTable.column('orderQty:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == projectReqstTable.column('orderRemark:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="text" style="min-width:100px;" class="form-control" value="'+value+'">');
							}
						}
					})
				}
			}
		});
		//애네뭐지..
		//$('.lcTypeOutputToggle').attr('disabled', false);
		//$('.lcTypeInputToggle').attr('disabled', false);
		//$('.lcTypeReturnToggle').attr('disabled', false);
		//$('.lcTypeQcToggle').attr('disabled', false);
		//$('.lcTypeOutsourcingToggle').attr('disabled', false);
		
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
	});

	// 요청 삭제 버튼 click
	$('#btnProjectReqstDel').on('click', function() {
		let check = true;
		if($('[name=reqCheckBox]:checked').length == 0){
			toastr.warning('수정할 데이터를 선택해 주세요.');
			check = false;
			return false;
		}
		
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let data = projectReqstTable.row(index).data();
				if(data.designApprovalYn=='001') {
					toastr.warning("승인된 데이터는 삭제할 수 없습니다.");
					check = false;
					return false;
				} 
			}
		});
		if(check) {
			$('#deleteModal').modal('show');
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let array = [];
		$('#projectReqstTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=reqCheckBox]').is(':checked')) {
				let obj = {};
				let data = projectReqstTable.row(index).data();
				obj.projectIdx = data.projectIdx;
				obj.projectDtlIdx = data.projectDtlIdx;
				obj.groupIdx = data.groupIdx;
				obj.idx = data.idx;
				array.push(obj);
			}
		});
		$.ajax({
			url: '<c:url value="/rm/projectDtlOrderDel"/>',
            type: 'POST',
            data: {
                'jsonArray'	:	JSON.stringify(array)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					projectReqstTable.ajax.reload(function() {});
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 수주별발주 취소 버튼 click
	$('#btnProjectReqstCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'reqst');
	});
	//끝

	//기술문서----------------------------------------------------------------------------------------------
	$('#btnProjectFile').on('click',function() { // 기술문서 버튼 클릭
		if(bizOrdAdmIdx=='') {
			toastr.warning('프로젝트를 선택해 주세요.');
			return false;
		}
		$('#projectFileModal').modal('show');

		setTimeout(function() {
			projectFileTable.ajax.reload(function() {});
		}, 150)
		
		$('#btnProjectFileEdit').attr('disabled', false);
		$('#btnProjectFileSave').attr('disabled', true);
		fileFormData = new FormData();
		$('#projectFile').val('');
	});

	// 프로젝트 파일 조회
	let projectFileTable = $('#projectFileTable').DataTable({
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
			url : '<c:url value="/rm/projectFileLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx : function() { return bizOrdAdmIdx; },
				inputGubun	 :	'002'
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
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:150px;" class="form-control">';
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
						return '<div style="min-width:100px; white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="min-width:100px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
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
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:150px;" class="form-control">';
					}
				}
			},
			{ data: 'checkDepartmentCd', className : 'text-center align-middle', name: 'checkDepartmentCd', 
				render: function(data, type, row, meta) {
					if(data != null){
						if(row['checkDepartmentNm']!=null) {
							return '<div style="min-width:110px;white-space:nowrap;">'+row['checkDepartmentNm']+'</div>';
						} else {
							return '<div style="min-width:110px;white-space:nowrap;"></div>';
						}
						
					} else {
						let html = '';
						html += '<select style="min-width:110px;" name="checkDepartmentCd" onchange="checkDepartmentCdChange()" class="form-select">';
						html +='	<option value="">선택</option>';
						departmentList.forEach(function(item) {
							html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});
						html += '</select>';
						return html;
					}
				}
			},
			{ data: 'checkUserIdx', className : 'text-center align-middle', name: 'checkUserIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						if(row['checkUserNm']!=null) {
							return '<div style="min-width:130px;white-space:nowrap;">'+row['checkUserNm']+'</div>';
						} else {
							return '<div style="min-width:130px;white-space:nowrap;"></div>';
						}
						
					} else {
						let html = '';
						html += '<select style="min-width:120px;" name="checkUserIdx" class="form-select">';
						html +='	<option value="">부서를 선택해 주세요.</option>';
						html += '</select>';
						return html;
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

	$('#btnProjectFileEdit').on('click', function() {
		if( $('#projectFileTable').DataTable().rows().count()==0 ){
			toastr.warning('수정할 데이터가 없습니다.');
			return false;
		}
		$('#projectFileTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == projectFileTable.column('documentNm:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectFileTable.column('fileDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectFileTable.column('userIdx:name').index()) {
						let value = projectFileTable.row(tr).data().userIdx;
						let value2 = projectFileTable.row(tr).data().userNm;
						let html = '';
						html += '<div style="min-width:100px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+value+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+value2+'" disabled>';
						html += '<button type="button" onclick="userSel(\'FILE\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					} else if(index_td == projectFileTable.column('checkDepartmentCd:name').index()) {
						let value = projectFileTable.row(tr).data().checkDepartmentCd;
						let html = '';
						html += '<select style="min-width:110px;" name="checkDepartmentCd" onchange="checkDepartmentCdChange()" class="form-select">';
						html +='	<option value="">선택</option>';
						departmentList.forEach(function(item) {
							if(value==item.commonCd) {
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
						});
						html += '</select>';
						$(td).html(html);
					} else if(index_td == projectFileTable.column('checkUserIdx:name').index()) {
						let value = projectFileTable.row(tr).data().checkUserIdx;
						let value2 = projectFileTable.row(tr).data().checkDepartmentCd;
						let html = '';
						html += '<select style="min-width:130px;" name="checkUserIdx" class="form-select">';
						console.log(value2)
						if(value2!='') {
							html +='	<option value="">전체</option>';
							let checkUserList = new Array();
							for(let i = 0; i<userList.length; i++) {
								if(value2==userList[i].departmentCd) {
									var userData = new Object();
									userData.idx = userList[i].idx;
									userData.name = userList[i].name;
									checkUserList.push(userData);
								}
							}
							console.log(checkUserList)
							checkUserList.forEach(function(item) {
								if(value==item.idx) {
									html +='	<option value="'+item.idx+'" selected>'+item.name+'</option>';
								} else {
									html +='	<option value="'+item.idx+'">'+item.name+'</option>';
								}
							});
						} else {
							html +='	<option value="">부서를 선택해 주세요.</option>';
						}
						html += '</select>';
						$(td).html(html);
					}
				}
			})
		});
		$('#btnProjectFileSave').attr('disabled', false);
	});

	// 관련파일 추가 버튼 클릭
	$('#btnProjectFileAdd').on('click', function() {
		$('#projectFile').trigger('click');
	});

	// 파일 선택
	$('#projectFile').on('change',function() {
		let fileInput = document.getElementById("projectFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#projectFileTable').DataTable().row.add({
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
    	$('#projectFileTable tbody tr').each(function(index, item){
    		$(this).find("div[name=fileIndex]").text(fileNumber);
    		fileNumber++;
        });
    	$('#btnProjectFileSave').attr('disabled', false);
    	$('#projectFile').val('');
	})
	
	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	// 관련파일 삭제 버튼 클릭
	$('#btnProjectFileDel').on('click', function() {
		if( !$('#projectFileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#projectFileTable').DataTable().row('.selected').data().idx!=null) {
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = projectFileTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#projectFileTable').DataTable().row('.selected').remove().draw();
			fileNumber = 1;
	    	$('#projectFileTable tbody tr').each(function(index, item){
	    		$(this).find("div[name=fileIndex]").text(fileNumber);
	    		fileNumber++;
	        });
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		idx = projectFileTable.row('.selected').data().idx;
		
		$.ajax({
			url: '<c:url value="/rm/projectFileDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	idx,
                'bizOrdAdmIdx'	:	bizOrdAdmIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let uuid = $('#projectFileTable').DataTable().row('.selected').data().uuid;;
				let ext = $('#projectFileTable').DataTable().row('.selected').data().fileExt;
				fileDelete({uuid:uuid,ext:ext});
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#projectFileTable').DataTable().row('.selected').remove().draw();
					fileNumber = 1;
			    	$('#projectFileTable tbody tr').each(function(index, item){
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

	// 저장 버튼 click
	$('#btnProjectFileSave').on('click', function() {
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

				$('#projectFileTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = projectFileTable.row($(item)).data();
					let node = projectFileTable.row($(item)).node();
					
					let idx = projectFileTable.row($(item)).data().idx;
					let documentNm = $(td).eq(projectFileTable.column('documentNm:name').index()).find('input').val();
					let userIdx = $(td).eq(projectFileTable.column('userIdx:name').index()).find('input').val();
					let uuid = projectFileTable.row($(item)).data().uuid;
					let fileName = projectFileTable.row($(item)).data().fileName;
					let fileExt = projectFileTable.row($(item)).data().fileExt;
					let fileDesc = $(td).eq(projectFileTable.column('fileDesc:name').index()).find('input').val();
					let checkDepartmentCd = $(td).eq(projectFileTable.column('checkDepartmentCd:name').index()).find('select').val();
					let checkUserIdx = $(td).eq(projectFileTable.column('checkUserIdx:name').index()).find('select').val();
					
					let obj = new Object();
					obj.bizOrdAdmIdx = bizOrdAdmIdx;
					obj.idx = idx;
					obj.inputGubun = "002";
					obj.documentNm = documentNm==undefined?data.documentNm:documentNm;
					obj.userIdx = userIdx==undefined?data.userIdx:userIdx;
					obj.uuid = uuid;
					obj.fileName = fileName;
					obj.fileExt = fileExt;
					obj.fileDesc = fileDesc==undefined?data.fileDesc:fileDesc;
					obj.checkDepartmentCd = checkDepartmentCd;
					obj.checkUserIdx = checkUserIdx;
					obj.moduleCd = '002';
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#projectFileTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = projectFileTable.row(index).data();
					obj.bizOrdAdmIdx = bizOrdAdmIdx;
					obj.idx = data.idx;
					obj.inputGubun = '002';
					obj.documentNm = data.documentNm;
					obj.userIdx = data.userIdx;
					obj.uuid = data.uuid;
					obj.fileName = data.fileName;
					obj.fileExt = data.fileExt;
					obj.fileDesc = data.fileDesc;
					obj.checkDepartmentCd = data.checkDepartmentCd;
					obj.checkUserIdx = data.checkUserIdx;
					obj.moduleCd = '002';
					tableData.push(obj);
				});
				
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)

				$.ajax({
					url: '<c:url value="/rm/projectFileInsUpd"/>',
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
						projectFileTable.ajax.reload(function() {});
						toastr.success('저장되었습니다.');
						$('#btnProjectFileSave').attr('disabled', true);
						$('#my-spinner').hide();
						$('#projectFile').val('');
					},
				});
			},100)
		})
	});

	//이미지 모달------------------------------------------------------------------------------------
	
	
	function imageModal(projectDtlIdxValue) {
		if(WM_close_check()){
			$('#btnProjectImageAdd').attr('disabled', true);
			$('#btnProjectImageSave').attr('disabled', true);
			$('#btnProjectImageEdit').attr('disabled', true);
			$('#btnProjectImageDel').attr('disabled', true);
		}else{
			$('#btnProjectImageAdd').attr('disabled', false);
			$('#btnProjectImageSave').attr('disabled', true);
			$('#btnProjectImageEdit').attr('disabled', false);
			$('#btnProjectImageDel').attr('disabled', false);
		}
		$('#projectImageModal').modal('show');
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectImageTable.ajax.reload(function() {});
		}, 150)
		$('#projectImageFile').val('');
	}

	// 프로젝트 이미지 조회
	let projectImageTable = $('#projectImageTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
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
			url : '<c:url value="/rm/projectImageLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; },
				projectDtlIdx : function() { return projectDtlIdx; }
			},
		},
		columns : [
			{ className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return (meta.row+1);
				}
			},
			{ data: 'projectImage', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<img class="card-img-bottom" id="signImage" src="data:image/jpeg;base64,'+data+'" style="border: 1px solid #000000;width:400px;height:300px;">';
				}
			},
			{ data: 'userNm', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;">'+userName+'</div>';
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
			{ data: 'projectDesc', className : 'text-center align-middle', name : "projectDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="white-space:pre-line;min-width:400px;">'+data+'</div>';
					} else {
						return '<textarea class="form-control" style="min-width:400px;min-height:300px; resize: none; min-height: 300px;" ></textarea>';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : [],
		drawCallback: function() {
		},
	});

	// 사진선택 버튼 click
	$('#btnProjectImageAdd').on('click', function() {
		$('#projectImageFile').trigger('click');
	});
	
	// 파일 선택
	$('#projectImageFile').on('change',function(e) {
		let imageFormData = new FormData();
		let fileInput = document.getElementById("projectImageFile"); //id로 파일 태그를 호출
		let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		let fileType = files[0].type;
		for(let i=0; i<files.length; i++ ) {
			let fileNameList = files[i].type;

			if(fileType.split('/')[0] != 'image') {
				toastr.warning('사진파일을 선택해주세요.');
				$('#projectImageFile').val('');
				return false;
			}
		}

		for(let i=0; i<files.length; i++ ) {

			let bases64 = getImgBase64(files[i]);
			
			$('#projectImageTable').DataTable().row.add({
				'idx'			: null,
				'userNm'		: null,
				'userDepartNm'	: '',
				'projectDesc'	: null,
				'projectImage'	: bases64,
			}).draw(false);
			if(files.length-1==i) {
				$('#btnProjectImageSave').attr('disabled', false);
			} 
		}
		$('#projectImageFile').val('');
	})

	$('#btnProjectImageEdit').on('click',function() { // 이미지 수정 버튼 클릭
		$('#projectImageTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if(index_td == projectImageTable.column('projectDesc:name').index()) {
					let value = $(td).text();
					$(td).html('<textarea class="form-control" style="min-width:300px; resize: none; min-height: 300px;" >'+value+'</textarea>');
				}
			});
		});
		$('#btnProjectImageSave').attr('disabled', false);
		$('#btnProjectImageEdit').attr('disabled', true);
	});

	// 저장 버튼 click
	$('#btnProjectImageSave').on('click', function() {

		if( $('#projectImageTable').DataTable().rows().count()==0 ){
			toastr.warning('저장할 데이터가 없습니다.');
			return false;
		}
		
		let array = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				$('#projectImageTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = projectImageTable.row($(item)).data();
					let node = projectImageTable.row($(item)).node();
					
					let idx = projectImageTable.row($(item)).data().idx;
					let projectImage = projectImageTable.row($(item)).data().projectImage;
					let projectDesc = $(td).eq(projectImageTable.column('projectDesc:name').index()).find('textarea').val();

					let obj = new Object();
					obj.idx = idx;
					obj.projectIdx = projectIdx;
					obj.projectDtlIdx = projectDtlIdx;
					obj.projectImage = projectImage;
					obj.projectDesc = projectDesc;
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#projectImageTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = projectImageTable.row(index).data();
					obj.idx = data.idx;
					obj.projectIdx = projectIdx;
					obj.projectDtlIdx = projectDtlIdx;
					obj.projectImage = data.projectImage;
					obj.projectDesc = data.projectDesc;
					
					tableData.push(obj);
				});
				
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)

				
				$.ajax({
					url: '<c:url value="/rm/projectImageInsUpd"/>',
					type : 'POST',
					async: false,
					datatype: 'json',
					data: JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
						projectImageTable.ajax.reload(function() {});
						projectDtlTable.ajax.reload(function() {});
						$('#btnProjectImageSave').attr('disabled', true);
						toastr.success('저장되었습니다.');
						$('#btnProjectImageEdit').attr('disabled', false);
						$('#my-spinner').hide();
					},
				});
				
			},100)
		})
	});
	

	// 이미지 버튼 click
	$('#btnProjectImageDel').on('click', function() {
		if( !$('#projectImageTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#projectImageTable').DataTable().row('.selected').data().idx!=null) {
			$('#imageDeleteModal').modal('show');
		} else {
			$('#projectImageTable').DataTable().row('.selected').remove().draw();
		}
	});

	$('#btnImageDeleteModalY').on('click', function() {
		
		if(projectImageTable.row('.selected').data().idx==null) {
			$('#projectImageTable').DataTable().row('.selected').remove().draw();
		} else {
			$.ajax({
				url: '<c:url value="/rm/projectImageDel"/>',
	            type: 'POST',
	            data: {
	                'idx'		:	projectImageTable.row('.selected').data().idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						//projectImageTable.ajax.reload(function() {});
						$('#projectImageTable').DataTable().row('.selected').remove().draw();
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

	//이미지 탭 클릭---------------------------------------------------------------------------------
	
	let imagePartNoIdx = '';
	
	function ImageReload() {
		$('#imageTab').removeClass('d-none');
		$('#projectDtlTable_wrapper').addClass('d-none');
		imagePartNoIdx = '';
		projectImagePartNoTable.rows('.selected').deselect();
		projectImageViewTable.rows('.selected').deselect();
		setTimeout(function() {
			projectImagePartNoTable.ajax.reload(function() {});
			projectImageViewTable.ajax.reload(function() {});
		}, 150)
	}

	// 이미지가 저장된 품번 테이블
	let projectImagePartNoTable = $('#projectImagePartNoTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '67.5vh',
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
			url : '<c:url value="/rm/projectImagePartNoLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; }
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return (meta.row+1);
				}
			},
			{ data: 'partCd', className : 'text-center'},
			{ data: 'partNm', className : 'text-center'},
		],
		columnDefs : [
		],
		buttons : [],
		order : [],
		drawCallback: function() {
		},
	});

	// 이미지가 저장된 품번 테이블 click
	$('#projectImagePartNoTable tbody').on('click','tr', function() {
		imagePartNoIdx = projectImagePartNoTable.row(this).data().idx;
		projectImageViewTable.ajax.reload(function() {});		
	});

	// 프로젝트 이미지 조회
	let projectImageViewTable = $('#projectImageViewTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '67.5vh',
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
			url : '<c:url value="/rm/projectImageLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; },
				projectDtlIdx : function() { return imagePartNoIdx; }
			},
		},
		columns : [
			{ className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return (meta.row+1);
				}
			},
			{ data: 'projectImage', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<img class="card-img-bottom" id="signImage" src="data:image/jpeg;base64,'+data+'" style="border: 1px solid #000000;width:200px;height:150px;">';
				}
			},
			{ data: 'userNm', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;">'+userName+'</div>';
					}
				}
			},
			{ data: 'projectDesc', className : 'text-center align-middle', name : "projectDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="white-space:pre-line;min-width:300px;">'+data+'</div>';
					} else {
						return '<textarea class="form-control" style="min-width:300px;min-height:150px; resize: none;" ></textarea>';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : [],
		drawCallback: function() {
		},
	});

	//품목별 문서 ----------------------------------------------------------------------------------------------
	function documentModal(projectDtlIdxValue) {
		if(WM_close_check()){
			$('#btnProjectDocumentAdd').attr('disabled', true);
			$('#btnProjectDocumentSave').attr('disabled', true);
			$('#btnProjectDocumentEdit').attr('disabled', true);
			$('#btnProjectDocumentDel').attr('disabled', true);
		}else{
			$('#btnProjectDocumentAdd').attr('disabled', false);
			$('#btnProjectDocumentEdit').attr('disabled', false);
			$('#btnProjectDocumentSave').attr('disabled', true);
			$('#btnProjectDocumentDel').attr('disabled', false);
		}
		$('#projectDocumentModal').modal('show');
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectDocumentTable.ajax.reload(function() {});
		}, 150);
		documentFormData = new FormData();
		$('#projectDocumentFile').val('');
	}

	// 프로젝트 문서 조회
	let projectDocumentTable = $('#projectDocumentTable').DataTable({
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
			url : '<c:url value="/rm/projectDocumentLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; },
				projectDtlIdx : function() { return projectDtlIdx; }
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					documentNumber++;
					return '<div name="documentIndex">'+documentNumber+'</div>';
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
						html += '<button type="button" onclick="userSel(\'DOCUMENT\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
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
			{ data: 'documentDesc', className : 'text-center align-middle', name : "documentDesc",
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

	$('#btnProjectDocumentEdit').on('click', function() {
		if( $('#projectDocumentTable').DataTable().rows().count()==0 ){
			toastr.warning('수정할 데이터가 없습니다.');
			return false;
		}
		$('#projectDocumentTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == projectDocumentTable.column('documentNm:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectDocumentTable.column('documentDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:300px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectDocumentTable.column('userIdx:name').index()) {
						let value = projectDocumentTable.row(tr).data().userIdx;
						let value2 = projectDocumentTable.row(tr).data().userNm;
						let html = '';
						html += '<div style="width:200px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+value+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+value2+'" disabled>';
						html += '<button type="button" onclick="userSel(\'DOCUMENT\')" class="btn btn-primary input-sub-search inputGroup" name="documentUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					}
				}
			})
		});
		$('#btnProjectDocumentSave').attr('disabled', false);
	});

	// 관련파일 추가 버튼 클릭
	$('#btnProjectDocumentAdd').on('click', function() {
		$('#projectDocumentFile').trigger('click');
	});

	// 파일 선택
	$('#projectDocumentFile').on('change',function() {
		let fileInput = document.getElementById("projectDocumentFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#projectDocumentTable').DataTable().row.add({
				'idx'		: null,
				'documentNm': '',
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1)
			}).draw(false);
			
			documentFormData.append('file-'+uuid,files[i]);
			documentFormData.append('uuid-'+uuid,uuid);
			documentFormData.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
		documentNumber = 1;
    	$('#projectDocumentTable tbody tr').each(function(index, item){
    		$(this).find("div[name=documentIndex]").text(documentNumber);
    		documentNumber++;
        });
    	$('#btnProjectDocumentSave').attr('disabled', false);
    	$('#projectDocumentFile').val('');
	})

	// 관련파일 삭제 버튼 클릭
	$('#btnProjectDocumentDel').on('click', function() {
		if( !$('#projectDocumentTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#projectDocumentTable').DataTable().row('.selected').data().idx!=null) {
			$('#documentDeleteModal').modal('show');
		} else {
			let uuid = projectDocumentTable.row('.selected').data().uuid;
			documentFormData.delete('file-'+uuid);
			documentFormData.delete('uuid-'+uuid);
			documentFormData.delete('ext-'+uuid);
			$('#projectDocumentTable').DataTable().row('.selected').remove().draw();
			documentNumber = 1;
	    	$('#projectDocumentTable tbody tr').each(function(index, item){
	    		$(this).find("div[name=documentIndex]").text(documentNumber);
	    		documentNumber++;
	        });
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDocumentDeleteModalY').on('click', function() {
		$.ajax({
			url: '<c:url value="/rm/projectDocumentDel"/>',
            type: 'POST',
            data: {
                'idx'		:	projectDocumentTable.row('.selected').data().idx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					let uuid = $('#projectDocumentTable').DataTable().row('.selected').data().uuid;;
					let ext = $('#projectDocumentTable').DataTable().row('.selected').data().fileExt;
					fileDelete({uuid:uuid,ext:ext});
					$('#projectDocumentTable').DataTable().row('.selected').remove().draw();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 저장 버튼 click
	$('#btnProjectDocumentSave').on('click', function() {
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
				for (var key of documentFormData.keys()) {
					if(fileSubKeyIndex==1) {
						saveFileFormData.append(key, documentFormData.get(key));
					} else if(fileSubKeyIndex==2) {
						saveFileFormData.append('uuid', documentFormData.get(key));
					} else {
						saveFileFormData.append('ext', documentFormData.get(key));
					} 
					fileSubKeyIndex++;
					if(fileSubKeyIndex==3) {
						fileSubKeyIndex = 0;
						fileKeyIndex++;
					}
				}
				fileUpload(saveFileFormData);

				$('#projectDocumentTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = projectDocumentTable.row($(item)).data();
					let node = projectDocumentTable.row($(item)).node();
					
					let idx = projectDocumentTable.row($(item)).data().idx;
					let documentNm = $(td).eq(projectDocumentTable.column('documentNm:name').index()).find('input').val();
					let userIdx = $(td).eq(projectDocumentTable.column('userIdx:name').index()).find('input').val();
					let uuid = projectDocumentTable.row($(item)).data().uuid;
					let fileName = projectDocumentTable.row($(item)).data().fileName;
					let fileExt = projectDocumentTable.row($(item)).data().fileExt;
					let documentDesc = $(td).eq(projectDocumentTable.column('documentDesc:name').index()).find('input').val();

					let obj = new Object();
					obj.idx = idx;
					obj.projectIdx = projectIdx;
					obj.projectDtlIdx = projectDtlIdx;
					obj.documentNm = documentNm==undefined?data.documentNm:documentNm;
					obj.userIdx = userIdx==undefined?data.userIdx:userIdx;
					obj.uuid = uuid;
					obj.fileName = fileName;
					obj.fileExt = fileExt;
					obj.documentDesc = documentDesc==undefined?data.documentDesc:documentDesc;
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#projectDocumentTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = projectDocumentTable.row(index).data();
					obj.idx = data.idx;
					obj.projectIdx = projectIdx;
					obj.projectDtlIdx = projectDtlIdx;
					obj.documentNm = data.documentNm;
					obj.userIdx = data.userIdx;
					obj.uuid = data.uuid;
					obj.fileName = data.fileName;
					obj.fileExt = data.fileExt;
					obj.documentDesc = data.documentDesc;
					
					tableData.push(obj);
				});
				
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)

				
				$.ajax({
					url: '<c:url value="/rm/projectDocumentInsUpd"/>',
					type : 'POST',
					async: false,
					datatype: 'json',
					data: JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
						documentNumber = 0;
						documentFormData = new FormData();
						projectDocumentTable.ajax.reload(function() {});
						projectDtlTable.ajax.reload(function() {});
						$('#btnProjectDocumentSave').attr('disabled', true);
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide();
						$('#projectDocumentFile').val('');
					},
				});
				
			},100)
		})
	});


	//품목 등록----------------------------------------------------------------------------------------
	
	// 품목등록 테이블
	let newItemTable = $('#newItemTable').DataTable({
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
		columns : [
// 			{
// 				render: function(data, type, row, meta) {
// 					return (meta.row+1);
// 				}, "className": "text-center align-middle"
// 			},
			{
				render: function(data, type, row, meta) {
					return row['maker'];
				}, "className": "text-center align-middle"
			},
			{
				render: function(data, type, row, meta) {
					return row['partDc'];
				}, "className": "text-center align-middle"
			},
			{ data: 'itemCd', "className": "text-center align-middle", name : "itemCd",
				render: function(data, type, row, meta) {
					return '<input type="text" style="min-width:200px;" class="form-control" name="itemCd" value="'+itemGubun+'-" disabled>';
				}
			},
			{ data: 'itemGubun1', className : 'text-center align-middle', name : "itemGubun1",
				render: function(data, type, row, meta) {
					let html = '';
					html += '<select class="form-select" name="itemGubun1" onchange="smallGubunChange()">';
					itemGubun1List.forEach(function(item) {
						html +='	<option value="'+item.idx+'-'+item.itemGubun+'">'+item.itemGubunNm+'</option>';
					});
					html += '</select>';
					return html;
				}
			},
			{ data: 'itemGubun2', className : 'text-center align-middle', name : "itemGubun2",
				render: function(data, type, row, meta) {
					let html = '';
					html += '<select class="form-select" name="itemGubun2" onchange="itemGubun2Change()">';
					html += '<option>품목구분1을 선택해 주세요.</option></select>';
					return html;
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
	
	function smallGubunChange() {
		let itemGubun2List = new Array();
		let mediumValueList = $('#newItemTable').DataTable().$('tr.selected').find('select[name=itemGubun1]').val().split('-');
		let mediumIdx = mediumValueList[0];
		let itemGubun1Select = '-'+(mediumValueList[1].split('/').pop());
		let itemGubun2Select = '';
		let itemCdSeq = '';
		$.ajax({
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			async: false,
			data : {
				'lmsType' 		: function() { return 'S'; },
				'largeIdx' 		: function() { return '1'; },
				'mediumIdx' 	: function() { return mediumIdx; },
			},
			success : function(res) {
				let data = res.data;
				let html = '';
				$('#newItemTable').DataTable().$('tr.selected').find('select[name=itemGubun2]').empty();
				for(let i = 0; i<data.length; i++) {
					html +='	<option value="'+data[i].idx+'-'+data[i].itemGubun2+'">'+data[i].itemGubun2Nm+'</option>';
				}
				if(html=='') {
					html = '<option value="">등록된 데이터가 없습니다.</option>';
				}
				itemGubun2Select = '-'+((data[0].itemGubun2).split('/').pop());
				$('#newItemTable').DataTable().$('tr.selected').find('select[name=itemGubun2]').append(html);
			}
		});
		$('#newItemTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(itemGubun.split('/').pop()+itemGubun1Select+itemGubun2Select);
	}
	
	function itemGubun2Change(){
		let itemGubun1List = $('#newItemTable').DataTable().$('tr.selected').find('select[name=itemGubun1]').val().split('-');
		let itemGubun1Select = '-'+(itemGubun1List[1].split('/').pop());
		let itemGubun2List = $('#newItemTable').DataTable().$('tr.selected').find('select[name=itemGubun2]').val().split('-');
		let itemGubun2Select = '-'+(itemGubun2List[1].split('/').pop());
		$('#newItemTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(itemGubun.split('/').pop()+itemGubun1Select+itemGubun2Select);
	}

	// 저장 버튼 click
	$('#btnNewItemSave').on('click', function() {
		let array = [];
		let check = true;
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				$('#newItemTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = newItemTable.row($(item)).data();
					let node = newItemTable.row($(item)).node();
					let projectDtlIdx = newItemTable.row($(item)).data().projectDtlIdx;
					let itemCd = $(td).eq(newItemTable.column('itemCd:name').index()).find('input').val();
					if(itemCd == '') {
						toastr.warning('품번을 입력해주세요.');
						$(td).eq(newItemTable.column('itemCd:name').index()).find('input').select();
						check = false;
						$('#my-spinner').hide();
						return false;
					}
					let itemGubun1 = $(td).eq(newItemTable.column('itemGubun1:name').index()).find('select').val();
					if(itemGubun1 == '' || itemGubun1 == '-') {
						toastr.warning('품목구분1을 선택해주세요.');
						$(td).eq(newItemTable.column('itemGubun1:name').index()).find('select').select();
						check = false;
						$('#my-spinner').hide();
						return false;
					}
					itemGubun1 = itemGubun1.split('-');
					let itemGubun2 = $(td).eq(newItemTable.column('itemGubun2:name').index()).find('select').val();
					if(itemGubun2 == '' || itemGubun2 == '-') {
						toastr.warning('품목구분2를 선택해주세요.');
						$(td).eq(newItemTable.column('itemGubun2:name').index()).find('select').select();
						check = false;
						$('#my-spinner').hide();
						return false;
					}
					itemGubun2 = itemGubun2.split('-');
					
					let obj = new Object();
					obj.projectDtlIdx = projectDtlIdx;
					obj.projectIdx = projectIdx;
					obj.itemCd = itemCd;
					obj.itemGubunIdx = itemGubunIdx;
					obj.itemGubun = itemGubun;
					obj.itemGubun1Idx = itemGubun1[0];
					obj.itemGubun1 = itemGubun1[1];
					obj.itemGubun2Idx = itemGubun2[0];
					obj.itemGubun2 = itemGubun2[1];
					array.push(obj);
				});
				console.log(array)
				if(check) {
					$('#newItemTable tbody').find('tr').each(function(index, item) {
						let td = $(item).find('td');
						let data = newItemTable.row($(item)).data();
						let node = newItemTable.row($(item)).node();
						let dtlRowId = newItemTable.row($(item)).data().dtlRowId;
						let itemCd = $(td).eq(newItemTable.column('itemCd:name').index()).find('input').val();
						$.ajax({
							url : '<c:url value="/bm/itemInfoAdmGetCd"/>',
							type : 'POST',
							async: false,
							data : {
								'itemCd' : function(){ return itemCd; }
							},
							success : function(res) {
								if (res.result == "ok") { //응답결과
									$('#projectDtlTable tbody tr').eq(dtlRowId).find('td').eq(6).find('input').val(res.itemCdSeq);
								} else {
									toastr.error(res.message);
								}
							}
						});
					});
					
					$.ajax({
						url: '<c:url value="/rm/newItemIns"/>',
			            type: 'POST',
			            data: {
			            	'jsonArray'	:	JSON.stringify(array)
			            },
			            beforeSend: function() {
			            	$('#my-spinner').show();
			            },
						success : function(res) {
							if (res.result == "ok") { //응답결과
								toastr.success('저장었습니다.');
								$('#newItemModal').modal('hide');
								$('#my-spinner').hide();
							} else if(res.result == 'fail') {
								toastr.warning(res.message);
							} else {
								toastr.error(res.message);
							}
							$('#my-spinner').hide();
						}
					});
				}
			},100)
		})
		$('#my-spinner').hide();
	});

	function checkDepartmentCdChange() {
		let checkDepartmentCd = $('#projectFileTable').DataTable().$('tr.selected').find('select[name=checkDepartmentCd]').val();
		console.log(checkDepartmentCd)
		let checkUserList = new Array();
				
		var userData = new Object();
		userData.idx = '';
		userData.name = '전체';
		checkUserList.push(userData);
		if(checkDepartmentCd!='') {
			for(let i = 0; i<userList.length; i++) {
				if(checkDepartmentCd==userList[i].departmentCd) {
					var userData = new Object();
					userData.idx = userList[i].idx;
					userData.name = userList[i].name;
					checkUserList.push(userData);
				}
			}
		}
		
		console.log(checkUserList)
		let html = '';
		if(checkUserList.length<2) {
			html +='	<option value="">부서를 선택해 주세요.</option>';
		} else {
			for(let i = 0; i<checkUserList.length; i++) {
				html +='	<option value="'+checkUserList[i].idx+'">'+checkUserList[i].name+'</option>';
			}
		}
		
		$('#projectFileTable').DataTable().$('tr.selected').find('select[name=checkUserIdx]').empty();
		$('#projectFileTable').DataTable().$('tr.selected').find('select[name=checkUserIdx]').append(html);
	}

	//검색조건 변경
	$('#searchRqmt').on('change', function(){
		if($('#searchRqmt').val() == '001'){
			$('#batchProjectCd').addClass('d-none');
			$('.dDayte').removeClass('d-none');
			$('#batchProjectCd').val('');
			$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
			$('#endDate').val(moment().format('YYYY-MM-DD'));
		}else{
			$('.dDayte').addClass('d-none');
			$('#batchProjectCd').removeClass('d-none');
			$('#startDate').val('');
			$('#endDate').val('');
			$('#batchProjectCd').val('');
		}
	});

	function search() {
		$('#btnSearch').trigger('click');
	}
</script>

</body>
</html>