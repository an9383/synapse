<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<div class="input-group w-auto h-100 me-3">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트코드</label>
						<input type="hidden" id="projectIdx">
						<input type="text" class="form-control" id="projectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">차수</label>
					<select class="form-select w-auto h-100 me-3" id="selectVersion" style="min-width: 70px;">
					<option value="">전체</option>
					</select>
					
				</div>
				<div class="me-lg-auto"></div>
					<div class="btn-group me-3" role="group"
						aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" onclick="approval('001')"
							id="btnApproval001">승인</button>
						<button type="button" class="btn btn-outline-light w-auto" onclick="approval('002')"
							id="btnApproval002">승인취소</button>
					</div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center align-middle">승인여부</th>
							<th class="text-center align-middle">프로젝트번호</th>
							<th class="text-center align-middle">차수</th>
							<th class="text-center align-middle">요청번호</th>
							<th class="text-center align-middle">이미지</th>
							<th class="text-center align-middle">문서</th>
							<th class="text-center align-middle">요청사항</th>
							<th class="text-center align-middle">Module Gubun</th>
							<th class="text-center align-middle">Module Name</th>
							<th class="text-center align-middle">분류</th>
							<th class="text-center align-middle">구매사유</th>
							<th class="text-center align-middle">Part No</th>
							<th class="text-center align-middle">Part Name</th>
							<th class="text-center align-middle">Spec(전장, 광학)-세부규격</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">Maker</th>
							<th class="text-center align-middle">소요수량</th>
							<th class="text-center align-middle">요청일자</th>
							<th class="text-center align-middle">요청수량</th>
							<th class="text-center align-middle">재고수량</th>
							<th class="text-center align-middle">Supplier</th>
							<th class="text-center align-middle">Remark</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 자재 모달 -->
<div class="modal fade" id="itemInfoAdmModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					자재 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnItemInfoAdmModalPaste1">
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
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnitemInfoAdmModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="itemInfoAdmModalTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">품목구분1</th>
							<th class="text-center align-middle">품목구분2</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">재고단위</th>
							<th class="text-center align-middle">입고처</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 수주 모달 -->
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
<!-- 수주 모달 -->
<div class="modal fade" id="bizOrderAdmModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
<!-- 이미지 업로드 모달 -->
<div class="modal fade" id="projectImageViewModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
				<table class="table table-bordered p-0 m-0" id="projectImageViewTable">
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
<div class="modal fade" id="projectDocumentViewModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
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
				<table class="table table-bordered p-0 m-0" id="projectDocumentViewTable">
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
<!-- 화면설정 script -->
<script>
	let isDraggingV = false;
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag() {
		isDraggingV = true;
		SetCursor("n-resize");
	}
	
	function EndDrag(e) {
		if(isDraggingV) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDraggingV = false;
			SetCursor("auto");
		}
	}
	
	function OnDrag(event) {
		if (isDraggingV) {
			let dragbarWidth = 4;
	
			let page_height = parseInt($('#page').height()); 				// 전체 높이
			let middlecolT_height = parseInt($('#middlecolT').height());	// 상단
			let middlecolB_height = parseInt($('#middlecolB').height());	// 하단
	
			let middlecolT_min_height = 100;	// 상단 최소높이
			let middlecolB_min_height = 100;	// 하단 최소높이
	
			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
	
			let cols = [
				Math.min(Math.max(middlecolT_min_height, cursorY), page_height - middlecolB_min_height - dragbarWidth),
				dragbarWidth,
				Math.max(page_height - Math.max(middlecolT_min_height, cursorY) - dragbarWidth, middlecolB_min_height)
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault()
		}
	}
</script>

<script>
	WM_init('ADM');
	WM_init('DTL');

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";

	let projectIdx = '';
	let projectDtlIdx = '';
	let groupIdx = '';
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let userDepartmentList = getCommonCode('시스템', '002'); //부서
	let requestGubunList = getCommonCode('시스템', '048'); //요청구분
	let buyReasonList = getCommonCode('시스템', '038'); // 구매사유

	selectBoxAppend(userDepartmentList, 'searchUserDepartment', '', '1'); //부서
	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
	selectBoxAppend(buyReasonList, 'searchBuyReason', '', '1'); //구매사유
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));
	
	// 수주관리 전체 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
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
			url : '<c:url value="/rm/projectDtlOrderLst"/>',
			type : 'GET',
			data : {
				'inputGubun'	: function() { return '002';},
				'projectCd'		: function() { return $('#projectCd').val(); },
				'version'		: function() { return $('#version').val(); },
				'designApprovalYn'	: function() { return '001'; },
// 				status		: function() { return $('#searchConfirmDesign').val();}
			},
		},
        rowId: 'orderNo',
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
			{ data: 'approvalYn', className : 'text-center align-middle', name: 'approvalYn', //승인여부
				render : function(data, type, row, meta) {
					if(data=='001') {
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">승인</div>';
					} else {
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미승인</div>';
					}
				}
			},
			{ data: 'pjtCd', className : 'text-center align-middle', name: 'prjCd', //프로젝트번호
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'version', className : 'text-center align-middle', name: 'version', //차수
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'groupIdx', className : 'text-center align-middle', //요청번호
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+row['projectIdx']+'-'+row['projectDtlIdx']+'-'+data+'-'+row['idx']+'</div>';
				}
			},
			{ data: 'imageCount', className : 'text-center align-middle', //이미지 수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data>0) {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">X</button>';
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
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">X</button>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'orderRemark', className : 'text-center align-middle', name: 'orderRemark', //비고
				render : function(data, type, row, meta) {
					if(data!=null && data!='') {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="orderRemarkModal('+row['projectIdx']+', '+row['projectDtlIdx']+', '+row['groupIdx']+')">O</button>';
					} else {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="orderRemarkModal('+row['projectIdx']+', '+row['projectDtlIdx']+', '+row['groupIdx']+')">X</button>';
					}
					
				}
			},
			{ data: 'moduleGubun', className : 'text-center align-middle', //모듈구분
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'moduleName', className : 'text-center align-middle', //모듈이름
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'positionGubun', className : 'text-center align-middle', name: 'positionGubun', //분류
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'purchaseGubun', className : 'text-center align-middle', name: 'purchaseGubun', //구매사유
				render : function(data, type, row, meta) {
					return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
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
			{ data: 'inventoryQty', className : 'text-end align-middle', name: 'inventoryQty', // 재고수량
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
					return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';				
				}
			},
		],
		columnDefs : [
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
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#purchaseOrderAdmTable_filter').addClass('d-none');
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
					let selectData = purchaseOrderAdmTable.row(item).data();
					if( purchaseOrderAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(purchaseOrderAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(purchaseOrderAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#purchaseOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	purchaseOrderAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = purchaseOrderAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		purchaseOrderAdmTable.ajax.reload(function() {}, false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주목록 선택
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();
		let idx = data.idx;
		/* if(WMCheck('ADM')) {
			setWM('ADM', 'idx', idx);
			return false;
		} */

		/* purchaseOrderAdmTable.clear().draw();
		purchaseOrderAdmTable.ajax.reload(); */
		
		/* $('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		//$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		}); */
	});

	// 공통코드관리 ADM 신규 버튼 click
	$('#btnNew').on('click', function() {
		WM_action_ON('ADM','workingWarningModal');

		$('#itemInfoAdmModal1').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
		
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'ADM') { // 수주별발주 수정중이나 신규등록중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'ADM') { // 수주별발주 수정중이나 신규등록중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				purchaseOrderAdmTable.row('#'+idx).select();
				$(purchaseOrderAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
		}
	});






	// 수주별발주 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				let td = $(item).find('td');
				let data = purchaseOrderAdmTable.row($(item)).data();
				let node = purchaseOrderAdmTable.row($(item)).node();
				
				let projectIdx = purchaseOrderAdmTable.row($(item)).data().projectIdx;
				let version = purchaseOrderAdmTable.row($(item)).data().version;
				let orderGubun = purchaseOrderAdmTable.row($(item)).data().orderGubun;
				let projectDtlIdx = purchaseOrderAdmTable.row($(item)).data().projectDtlIdx;
				let groupIdx = purchaseOrderAdmTable.row($(item)).data().groupIdx;
				let idx = purchaseOrderAdmTable.row($(item)).data().idx;
				let orderDate = $(td).eq(purchaseOrderAdmTable.column('orderDate:name').index()).find('input').val();
				let orderQty = $(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').val();

				let obj = new Object();
				obj.projectIdx = projectIdx;
				obj.version = version;
				obj.orderGubun = orderGubun;
				obj.projectDtlIdx = projectDtlIdx;
				obj.groupIdx = groupIdx;
				obj.idx = idx;
				obj.orderDate = orderDate.replace(/-/g, '');
				obj.orderQty = orderQty.replace(/,/g, '');
				obj.inputGubun = '002';
				array.push(obj);
			}
		});

		let tableData = [];
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				let obj = {};

				let data = purchaseOrderAdmTable.row(index).data();
				obj.projectIdx = data.projectIdx;
				obj.version = data.version;
				obj.orderGubun = data.orderGubun;
				obj.projectDtlIdx = data.projectDtlIdx;
				obj.groupIdx = data.groupIdx;
				obj.idx = data.idx;
				obj.orderDate = data.orderDate;
				obj.orderQty = data.orderQty;
				obj.inputGubun = '002';
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
					purchaseOrderAdmTable.ajax.reload(function() {
						$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					purchaseOrderAdmTable.colReorder.enable();
					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼
					$('#btnApproval001').attr('disabled', false); // 승인 버튼
					$('#btnApproval002').attr('disabled', false); // 승인취소 버튼
					
					
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
	$('#btnEdit').on('click', function() {
		if($('[name=dtlCheckBox]:checked').length == 0){
			toastr.warning('수정할 데이터를 선택해 주세요.');
			return false;
		}
		
		WM_action_ON('ADM','workingWarningModal');
		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				if(purchaseOrderAdmTable.row(index_tr).data().approvalYn=='001') {
					toastr.warning('승인된 데이터는 수정할 수 없습니다.');
					return false;
				}
			}
		});
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
						if(index_td == purchaseOrderAdmTable.column('orderDate:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == purchaseOrderAdmTable.column('orderQty:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						}
					}
				})
			}
		});
		$('input[name=dtlCheckBox]').attr('disabled', true);
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
		
		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
		$('#btnApproval001').attr('disabled', true); // 승인 버튼
		$('#btnApproval002').attr('disabled', true); // 승인취소 버튼
	});

	// 요청 삭제 버튼 click
	$('#btnDel').on('click', function() {
		let check = true;
		if($('[name=dtlCheckBox]:checked').length == 0){
			toastr.warning('수정할 데이터를 선택해 주세요.');
			check = false;
			return false;
		}
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				let data = purchaseOrderAdmTable.row(index).data();
				if(data.approvalYn=='001') {
					toastr.warning("승인된 데이터는 삭제할 수 없습니다.");
					check = false;
					return false;
				} 
			}
		});
		if(check) {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		let array = [];
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				let obj = {};
				let data = purchaseOrderAdmTable.row(index).data();
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
					purchaseOrderAdmTable.ajax.reload(function() {});
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
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'ADM');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if(cancelType == 'ADM') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('ADM');

			$('#btnSearch').trigger('click'); // 조회 버튼 click

			purchaseOrderAdmTable.ajax.reload(function(){},false);
			purchaseOrderAdmTable.colReorder.enable();

			$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			//$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
			$('#btnApproval001').attr('disabled', false); // 승인 버튼
			$('#btnApproval002').attr('disabled', false); // 승인취소 버튼
		}
	});

	//전체선택클릭
	$('#dtlAllCheckBox').on('click',function(){
		if ( $('#dtlAllCheckBox').prop("checked") ) {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", false);
				}
			});
		}
	});

	//일괄적용
	$('#btnBatchApply').on('click',function(){
		if($('#searchRequestGubun').val()=='') {
			toastr.warning('요청구분을 선택해주세요.');
			$('#searchRequestGubun').focus();
		}
		if($('#batchOrderDate').val()=='') {
			toastr.warning('요청일자를 지정해주세요.');
			$('#batchOrderDate').focus();
		}
		
		$('#purchaseOrderAdmTable tbody tr').each(function(index, item){
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				$(this).find('select[name=requestGubun]').val($('#searchRequestGubun').val());
				$(this).find('input[name=orderDate]').val($('#batchOrderDate').val());
			}
		});
	});


	//프로젝트코드====================================================================================
	
	let now = new Date();
	let now_year = now.getFullYear();
	
	function bizOrderPrjCdSel() {
		$('#bizOrderAdmModal').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}
	
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
				startDate : function() { return moment($('#bizStartDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#bizEndDate').val()).format('YYYYMMDD'); },
				nowYear	: function() { return now_year; },
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
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row($('tr.selected')).data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
		
	});



	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal1').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 550);
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
		$('#projectIdx').val(data.idx);
		$('#bizOrderAdmModal1').modal('hide');
		$.ajax({
			url: '<c:url value="/rm/projectAdmLst"/>',
            type: 'GET',
            async: false,
            data: {
                'bizOrdAdmIdx'	:	data.idx,
                'inputGubun'	:	'002',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					dataList = new Array();
					let html = '';
					html += '<option value="" selected>전체</option>';
					if(data!=null && data.length>0) {
						for(let i = 0; i<data.length; i++) {
							html += '<option value="'+data[i].version+'">'+data[i].version+'</option>';
						}
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
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#projectCd').val(data.prjCd);
		$('#projectIdx').val(data.idx);
		$('#bizOrderAdmModal1').modal('hide');
		$.ajax({
			url: '<c:url value="/rm/projectAdmLst"/>',
            type: 'GET',
            async: false,
            data: {
                'bizOrdAdmIdx'	:	data.idx,
                'inputGubun'	:	'002',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					dataList = new Array();
					let html = '';
					$('#selectVersion').empty();
					html += '<option value="" selected>전체</option>';
					if(data!=null && data.length>0) {
						for(let i = 0; i<data.length; i++) {
							html += '<option value="'+data[i].version+'">'+data[i].version+'</option>';
						}
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
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#projectCd').val('');
	});

	function approval(value) {
		if(value=='001') {		//승인처리
			let check = true;
			let array = [];
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
					
					let obj = {};
					let data = purchaseOrderAdmTable.row(index).data();
					if(data.approvalYn=='001') {
						toastr.warning("이미 승인된 데이터가 있습니다.");
						check = false;
						return false;
					} 
					obj.projectIdx = data.projectIdx;
					obj.projectDtlIdx = data.projectDtlIdx;
					obj.groupIdx = data.groupIdx;
					obj.idx = data.idx;

					obj.purchaseGubun = data.purchaseGubun;
					obj.requestGubun = '007';
					obj.projectCd = data.pjtCd;
					obj.orderDate = data.orderDate;
					obj.partCd = data.partCd
					obj.maker = data.maker;
					obj.version = data.version;
					
					obj.orderGubun = data.orderGubun;
					obj.orderQty = data.orderQty;
					obj.bomGubun = '002';
					obj.orderGubun = data.orderGubun;
					
					array.push(obj);
				}
			});
			if(check) {
				$.ajax({
					url: '<c:url value="/rm/projectDtlOrderApproval001Upd"/>',
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
							purchaseOrderAdmTable.ajax.reload(function() {});
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			}
		} else {				//미승인처리
			let check = true;
			let array = [];
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
					let obj = {};
					let data = purchaseOrderAdmTable.row(index).data();
					if(data.approvalYn=='002') {
						toastr.warning("미승인된 데이터가 있습니다.");
						check = false;
						return false;
					} 
					if(parseInt(data.purchaseOrderDtlCount)>0) {
						toastr.warning("이미 발주된 데이터가 있습니다.");
						check = false;
						return false;
					}
					obj.projectIdx = data.projectIdx;
					obj.projectDtlIdx = data.projectDtlIdx;
					obj.groupIdx = data.groupIdx;
					obj.idx = data.idx;
					array.push(obj);
				}
			});
			if(check) {
				$.ajax({
					url: '<c:url value="/rm/projectDtlOrderApproval002Upd"/>',
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
							purchaseOrderAdmTable.ajax.reload(function() {});
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
		
	}

	//이미지 모달------------------------------------------------------------------------------------
	
	
	function imageModal(projectIdxValue, projectDtlIdxValue) {
		$('#projectImageViewModal').modal('show');
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectImageViewTable.ajax.reload(function() {});
		}, 150)
	}

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

	//품목별 문서 ----------------------------------------------------------------------------------------------
	function documentModal(projectIdxValue, projectDtlIdxValue) {

		$('#projectDocumentViewModal').modal('show');
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectDocumentViewTable.ajax.reload(function() {});
		}, 150);
	}

	// 프로젝트 문서 조회
	let projectDocumentViewTable = $('#projectDocumentViewTable').DataTable({
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
					return (meta.row+1);
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

	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	//품목별 문서 ----------------------------------------------------------------------------------------------
	function orderRemarkModal(projectIdxValue, projectDtlIdxValue, groupIdxValue) {
		$('#orderRemarkEditModal').modal('show');
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		groupIdx = groupIdxValue;
		$('#btnRemarkSave').attr('disabled',true);
		setTimeout(function() {
			$('#remark').val($('#purchaseOrderAdmTable').DataTable().row('.selected').data().orderRemark);
			$('#remark').attr('disabled', true);
			
		}, 150);
	}

	$('#btnRemarkEdit').on('click',function(){
		$('#btnRemarkSave').attr('disabled',false);
		$('#remark').attr('disabled',false);
	});

	$('#btnRemarkSave').on('click',function(){
		$.ajax({
			url: '<c:url value="/rm/projectDtlOrderRemarkUpd"/>',
            type: 'POST',
            data: {
                'projectIdx'	:	projectIdx,
                'projectDtlIdx'	:	projectDtlIdx,
                'groupIdx'		:	groupIdx,
				'remark'		:	$('#remark').val(),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { 
					$('#orderRemarkEditModal').modal('hide');
					purchaseOrderAdmTable.ajax.reload(function() {});
					toastr.success('저장되었습니다.');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
</script>

</body>
</html>
