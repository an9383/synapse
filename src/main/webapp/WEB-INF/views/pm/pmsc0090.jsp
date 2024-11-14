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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">요청일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">상태</label> -->
<!-- 					<select class="form-select w-auto h-100 me-3" id="searchConfirmDesign" style="min-width: 70px;"> -->
<!-- 						<option value="" selected>전체</option> -->
<!-- 						<option value="001">요청</option> -->
<!-- 						<option value="002">발주</option> -->
<!-- 					</select> -->
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">부서</label>
					<select class="form-select w-auto h-100 me-3" id="searchUserDepartment" style="min-width: 70px;"></select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">구매사유</label>
					<select class="form-select w-auto h-100 me-3" id="searchBuyReason" style="min-width: 70px;"></select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">요청구분</label>
					<select class="form-select w-auto h-100 me-3" id="searchRequestGubun" style="min-width: 70px;">
						<option value="">전체</option>
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">납기요청일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-3" id="batchOrderDate">
					<div class="d-flex align-items-center justify-content-end me-2">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnBatchApply">
								적용
							</button>
						</div>
					</div>
					<div class="input-group w-auto h-100 me-3">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트코드</label>
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
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
							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">담당자</th>
							<th class="text-center align-middle">요청일</th>
							<th class="text-center align-middle">요청구분</th>
							<th class="text-center align-middle">구매사유</th>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">품목구분1</th>
							<th class="text-center align-middle">품목구분2</th>
							<th class="text-center align-middle">MAKER</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">요청수량</th>
							<th class="text-center align-middle">납기요청일</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">비고</th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">요청번호</th>
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
							<th class="text-center align-middle">프로젝트코드</th>
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
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
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
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let userDepartmentList = getCommonCode('시스템', '002'); //부서
	let requestGubunList = getCommonCode('시스템', '048'); //요청구분
	let buyReasonList = getCommonCode('시스템', '049'); // 구매사유

	selectBoxAppend(userDepartmentList, 'searchUserDepartment', '', '1'); //부서
	selectBoxAppend(buyReasonList, 'searchBuyReason', '', '1'); //구매사유
	requestGubunList.forEach(function(item) {
		if(item.etc1 != 'N'){
			$('#searchRequestGubun').append($("<option value="+item.commonCd+">"+item.commonNm+"</option>"));
		}
	});
	 
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
			url : '<c:url value="/pm/purchaseOrderAdmLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate		: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				inputGubun	: function() { return 'D';},
				projectCd	: function() { return $('#batchProjectCd').val(); },
// 				status		: function() { return $('#searchConfirmDesign').val();}
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle', name : "admCheckBox", //체크박스
				render: function(data, type, row, meta) {
					if(row['orderNo']!=null) {
						return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					} else {
						return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					}
				}
			},
			{ data: 'orderUserDepartment', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="orderUserDepartment">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="orderUserDepartment">'+userDepartmentNm+'</div>';
					}
				}
			}, //부서
			{ data: 'orderUserIdx', className : 'text-center align-middle', name: 'orderUserIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return row['orderUserName'];
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="orderUserIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="orderUserName" value="'+userName+'" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="userSel()" name="btnUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			}, //담당자
			{ data: 'requestDate', className : 'text-center align-middle', name: 'requestDate',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						let html = '';
						html += '<input type="date" name="requestDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			}, //요청일
			{ data: 'requestGubun', className : 'text-center align-middle', name: 'requestGubun',
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data != null && data != ''){
							var requestGubunNm = '';
							requestGubunList.forEach(function(item) {
								if(data == item.commonCd){
									requestGubunNm = item.commonNm;
								}
							});
							return requestGubunNm;
						} else return '';
					} else {
						let html = '';
						html += '<select class="form-select" name="requestGubun">';
						if(data==null) {
							requestGubunList.forEach(function(item) {
								if(item.etc1 != 'N'){
									html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
								}
							});
						} else {
							requestGubunList.forEach(function(item) {
								if(item.etc1 != 'N'){
									html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
								}
							});		
						}					
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			}, //요청구분
// 			{ data: 'orderNo', className : 'text-center align-middle',
// 				render: function(data, type, row, meta) {
// 					if(data!=null) {
// 						let orderSeq = data.split('-');
// 						return orderSeq[1];
// 					} else {
// 						return '';
// 					}
// 				}
// 			}, //SEQ		
			{ data: 'buyReason', className : 'text-center align-middle', name: 'buyReason',
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data != null && data != ''){
							var buyReasonNm = '';
							buyReasonList.forEach(function(item) {
								if(data == item.commonCd){
									buyReasonNm = item.commonNm;
								}
							});
							return buyReasonNm;
						} else return '';
					} else {
						let html = '';
						html += '<select class="form-select">';
						if(data==null || data == '') {
							buyReasonList.forEach(function(item) {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});
						}
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			}, //구매사유
			{ data: 'itemGubunNm', className : 'text-center align-middle', name: 'itemGubunNm',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx">'+row['itemGubunIdx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm"></div>';
						return html;
					}
				}
			}, //품목구분1
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx">'+row['itemGubun1Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm"></div>';
						return html;
					}
				}
			}, //품목구분1
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx">'+row['itemGubun2Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm"></div>';
						return html;
					}
				}
			}, //품목구분2
			{ data: 'maker', className : 'text-center align-middle', name: 'maker', 
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="maker">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="maker"></div>';
					}
				}
			}, //MAKER
			{ data: 'itemCd', className : 'text-center align-middle', name: 'itemCd',
				render: function(data, type, row, meta) {
					if(data!=null) {
						if(row['orderNo'] != '' && row['orderNo'] != null){
							return data;
						} else {
							let html = '';
							html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="text" class="form-control inputGroup" name="itemCd" value="'+data+'" title="'+data+'" disabled>';
							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel()" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							return html;
						}
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="itemCd" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel()" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			}, //품번
			{ data: 'itemNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="itemNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="itemNm"></div>';
					}
				}
			}, //품명
			{ data: 'itemDc', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="itemDc">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="itemDc"></div>';
					}
				}
			}, //규격
			{ data: 'unitDc', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="unitDc">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="unitDc"></div>';
					}
				}
			}, //단위
			{ data: 'orderQty', className : 'text-end align-middle', name: 'orderQty',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseInt(data));
					} else {
						return '<input type="text" name="orderQty" onkeyup="numberFormat(this, \'int\')" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			}, //구매요청수량
			{ data: 'orderDate', className : 'text-center align-middle', name: 'orderDate',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						let html = '';
						html += '<input type="date" name="orderDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			}, //납기요청일
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data!=null){
							return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="projectCd" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			}, //프로젝트코드
			{ data: 'orderDesc', className : 'text-center align-middle', name: 'orderDesc',
				render : function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none"></span>';				
					}
				}
			},  //비고
			{ data: 'status', className : 'text-center align-middle', 
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data=='001') {
							return '요청';
						} else if(data=='002') {
							return '발주';
						} else if(data=='003') {
							return '입고'
						}
					} else {
						return '요청';
					}
				}
			}, //상태
			{ data: 'orderNo', className : 'text-center align-middle', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return data;
					} else {
						return '';
					}
				}
			},//요청번호
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
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			if($(td).find('input').length > 1 && $(item).find('td').find('select').length != 0){
				if($(item).find('td').find('input').length != 1 && $(item).find('td').find('select').length != 0) {
					let orderUserDepartment = purchaseOrderAdmTable.row(index).data().orderUserDepartment;
					let orderUserIdx = $(td).eq(purchaseOrderAdmTable.column('orderUserIdx:name').index()).find('input').val();
					let orderUserName = purchaseOrderAdmTable.row(index).data().orderUserName;
					let requestDate = $(td).eq(purchaseOrderAdmTable.column('requestDate:name').index()).find('input').val();
					let requestGubun = $(td).eq(purchaseOrderAdmTable.column('requestGubun:name').index()).find('select').val();
					let buyReason = $(td).eq(purchaseOrderAdmTable.column('buyReason:name').index()).find('select').val();
					let itemGubunIdx = $(td).find('div[name=itemGubunIdx]').text();
					let itemGubun1Idx = $(td).find('div[name=itemGubun1Idx]').text();
					let itemGubun2Idx = $(td).find('div[name=itemGubun2Idx]').text();
					let maker = $(td).find('div[name=maker]').text();
					let itemCd = $(td).eq(purchaseOrderAdmTable.column('itemCd:name').index()).find('input').val();
					let itemNm = $(td).find('div[name=itemNm]').text();
					let itemDc = $(td).find('div[name=itemDc]').text();
					let unitDc = $(td).find('div[name=unitDc]').text();
					let orderQty = $(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').val();
					//let orderDate = $(td).eq(purchaseOrderAdmTable.column('orderDate:name').index()).find('input').val().replace(/-/g,"");
					let orderDate = $(td).eq(purchaseOrderAdmTable.column('orderDate:name').index()).find('input').val();
					let projectCd = $(td).eq(purchaseOrderAdmTable.column('projectCd:name').index()).find('input').val();
					let orderDesc = $(td).eq(purchaseOrderAdmTable.column('orderDesc:name').index()).find('input').val();
					let status = purchaseOrderAdmTable.row($(item)).data().status;
					let orderNo = purchaseOrderAdmTable.row($(item)).data().orderNo;
					
					if(itemCd == '') {
						toastr.warning('자재를 선택해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('itemCd:name').index()).find('button').focus();
						state = false;
						return false;
					}
	
					if(orderQty == '') {
						toastr.warning('요청수량을 입력해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').focus();
						state = false;
						return false;
					}

					if(projectCd == '') {
						toastr.warning('프로젝트 코드를 선택해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('projectCd:name').index()).find('button').focus();
						state = false;
						return false;
					}
	
					let obj = new Object();
					obj.orderUserDepartment = orderUserDepartment;
					obj.orderUserIdx 		= orderUserIdx;
					obj.orderUserName 		= orderUserName;
					obj.requestDate 		= requestDate.replace(/-/g,"");
					obj.requestGubun		= requestGubun;
					obj.buyReason 			= buyReason;
					obj.itemGubunIdx 		= itemGubunIdx;
					obj.itemGubun1Idx 		= itemGubun1Idx;
					obj.itemGubun2Idx 		= itemGubun2Idx;
					obj.maker 				= maker;
					obj.itemCd 				= itemCd;
					obj.itemNm 				= itemNm;
					obj.itemDc 				= itemDc;
					obj.unitDc 				= unitDc;
					obj.orderQty 			= orderQty.replaceAll(/,/g,'');
					obj.orderDate 			= orderDate.replace(/-/g,"");
					obj.projectCd  			= projectCd;
					obj.orderDesc 			= orderDesc;
					obj.status 				= status;
					obj.orderNo 			= orderNo;
					obj.inputGubun 			= 'D';
					obj.version				= '';
					obj.bomGubun			= '';
					obj.bomOrderGubun		= '';
					obj.endDate 			= null;
					obj.startDate 			= null;
					obj.iudtype 			= null;
					obj.regDate 			= null;
					obj.regIdx 				= null;
					obj.updDate 			= null;
					obj.updIdx 				= null;
					obj.orderDtlNo 			= null;
					obj.orderDtlQty		 	= null;
					obj.price 				= null;
					obj.deliveryPossibleDate= null;
					obj.deliveryOrderDate	= null;
					obj.dealCorpNm 			= null;
					obj.dealCorpIdx 		= null;
					obj.alreadyOrderDtlQty 	= null;
					obj.orderDtlDesc 		= null;
					obj.departmentCd 		= null;
					obj.alreadyInWhsQty 	= null;
				    array.push(obj);
		    	}
			}
		});

		if(!state) {
			return false;
		}

		console.log(array)
		console.log(purchaseOrderAdmTable.data().toArray())
		array = _.differenceWith(array, purchaseOrderAdmTable.data().toArray(), _.isEqual);
		console.log(array)
		
		$.ajax({
			url: '<c:url value="/pm/purchaseOrderAdmIU"/>',
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
		if($('[name=admCheckBox]:checked').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		
		WM_action_ON('ADM','workingWarningModal');
		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).find('[name=admCheckBox]').is(':checked')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == purchaseOrderAdmTable.column('lcQualityGubun:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().lcQualityGubun;
							let html = '';
							html += '<select class="form-select">';
							lcQualityGubunList.forEach(function(item) {
								if(item.commonCd==value) {
									html +='<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else {
									html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
								}
							});
							html += '</select>';
							$(td).html(html);
						} else if(index_td == purchaseOrderAdmTable.column('requestGubun:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().requestGubun;
							let html = '';
							html += '<select class="form-select">';
							requestGubunList.forEach(function(item) {
								if(item.etc1 != 'N'){
									if(item.commonCd==value) {
										html +='<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
									} else {
										html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
									}
								}
							});
							html += '</select>';
							$(td).html(html);
							
						} else if(index_td == purchaseOrderAdmTable.column('buyReason:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().buyReason;
							let html = '';
							html += '<select class="form-select">';
							buyReasonList.forEach(function(item) {
								if(item.commonCd==value) {
									html +='<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else {
									html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
								}
							});
							html += '</select>';
							$(td).html(html);
							
						} else if(index_td == purchaseOrderAdmTable.column('orderUserIdx:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().orderUserIdx;
							let value2 = purchaseOrderAdmTable.row(tr).data().orderUserName;
							let html = '';
							html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="hidden" name="orderUserIdx" value="'+value+'">';
							html += '<input type="text" class="form-control inputGroup" name="orderUserName" value="'+value2+'" disabled>';
							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="userSel()" name="btnUserSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							$(td).html(html);
						} else if(index_td == purchaseOrderAdmTable.column('itemCd:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().itemCd;
							let html = '';
							html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="text" class="form-control inputGroup" name="itemCd" value="'+value+'" disabled>';
							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel()" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							$(td).html(html);
						} else if(index_td == purchaseOrderAdmTable.column('requestDate:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().requestDate;
							console.log(value)
							$(td).html('<input type="date" max="9999-12-31" name="requestDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == purchaseOrderAdmTable.column('orderDate:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().orderDate;
							console.log(value)
							$(td).html('<input type="date" max="9999-12-31" name="orderDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == purchaseOrderAdmTable.column('orderQty:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == purchaseOrderAdmTable.column('projectCd:name').index()) {
							let value = purchaseOrderAdmTable.row(tr).data().projectCd;
							let html = '';
							html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="text" class="form-control inputGroup" name="projectCd" value="'+value+'" disabled>';
							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							$(td).html(html);
						} else if(index_td == purchaseOrderAdmTable.column('orderDesc:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" class="form-control" value="'+value+'">');
						}
					}
				});
			}
		});
		$('input[name=admCheckBox]').attr('disabled', true);
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
		
		
		purchaseOrderAdmTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
	});

	// 수주별발주 삭제 버튼 click
	$('#btnDel').on('click', function() {
		let check = true;
		if($('#purchaseOrderAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			check = false;
			return false;
		}
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			let data = purchaseOrderAdmTable.row($(item)).data();

			if($(td).find('input[name=admCheckBox]').is(':checked')){
				if(data.inOutGubun == '1'){
					toastr.warning('발주가 진행된 요청번호가 있습니다.');
					check = false;
					return false;
				}
			}
		});

		if(check){
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				let node = $(item);
				let tr = $(node).parent().parent();
				let td = $(item).find('td');
				let data = purchaseOrderAdmTable.row($(item)).data();
				if($(td).find('input[name=admCheckBox]').is(':checked')){
					let orderNo = data.orderNo;
					if(orderNo==null || orderNo=='') {
						purchaseOrderAdmTable.row($(item)).remove().draw(false);
						toastr.success('삭제되었습니다.');
					} else {
						$.ajax({
							url: '<c:url value="/pm/purchaseOrderAdmDel"/>',
				            type: 'POST',
				            data: {
				                'orderNo'	:	orderNo
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
							success : function(res) {
								if (res.result == "ok") { //응답결과
									toastr.success('삭제되었습니다.');
		
									//purchaseOrderAdmTable.ajax.reload(function(){},false);
									purchaseOrderAdmTable.row($(item)).remove().draw(false);
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
			});
		}
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
		}
	});

	//전체선택클릭
	$('#admAllCheckBox').on('click',function(){
		if ( $('#admAllCheckBox').prop("checked") ) {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=admCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=admCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=admCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=admCheckBox]').prop("checked", false);
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
			if($(this).find('input[name=admCheckBox]').is(':checked')) {
				$(this).find('select[name=requestGubun]').val($('#searchRequestGubun').val());
				$(this).find('input[name=orderDate]').val($('#batchOrderDate').val());
			}
		});
	});

	//담당자====================================================================================
	
	function userSel() {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#userModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
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

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let data = userModalTable.row(this).data();
		console.log(data)
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserName]').val(data.userName);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=orderUserDepartment]').text(data.userDepartmentNm);
		
		$('#userModal').modal('hide');
	});

	//자재 row마다 수정====================================================================================
	
	function itemInfoAdmSel() {
		$('#itemInfoAdmModal').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}
	

	// 품목정보 목록조회
	$('#itemInfoAdmModalTable thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmModalTable thead'); // filter 생성
	let itemInfoAdmModalTable = $('#itemInfoAdmModalTable').DataTable({
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
        	url: '<c:url value="/bm/itemInfoAdmLst"/>',
            type: 'GET',
            data: {
                
            },
		},
        rowId: 'itemCd',
		columns : [
			{ data: 'itemCd', className : 'text-center'},
			{ data: 'itemNm', className : 'text-center'},
			{ data: 'itemDc', className : 'text-center'},
			{ data: 'itemGubunNm', className : 'text-center'},
			{ data: 'unitDc', className : 'text-center'},
			{ data: 'useYnNm', className : 'text-center'},
			{ data: 'inspectYnNm', className : 'text-center'},
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
			let theadHeight = parseFloat($('#itemInfoAdmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemInfoAdmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	itemInfoAdmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemInfoAdmModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 거래처모달 조회 버튼 click
	$('#btnitemInfoAdmModalSearch').on('click', function() {
		itemInfoAdmModalTable.ajax.reload(function(){});
	});

	$('#itemInfoAdmModalTable tbody').on('dblclick','tr',function(){
		let data = itemInfoAdmModalTable.row(this).data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunIdx]').text(data.itemGubunIdx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Idx]').text(data.itemGubun1Idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Idx]').text(data.itemGubun2Idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunNm]').text(data.itemGubunNm);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Nm]').text(data.itemGubun1Nm);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Nm]').text(data.itemGubun2Nm);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=maker]').text(data.maker);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(data.itemCd);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemNm]').text(data.itemNm);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemDc]').text(data.itemDc);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=unitDc]').text(data.unitDc);
		$('#itemInfoAdmModal').modal('hide');
	});

	//자재 초기 + 클릭 시==============================================================================
	
	
	// 품목정보 목록조회
	$('#itemInfoAdmModalTable1 thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmModalTable1 thead'); // filter 생성
	let itemInfoAdmModalTable1 = $('#itemInfoAdmModalTable1').DataTable({
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
            style: 'multiple',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
        	url: '<c:url value="/bm/itemInfoAdmLst"/>',
            type: 'GET',
            data: {
                
            },
		},
        rowId: 'itemCd',
		columns : [
			{ data: 'itemGubunNm', className : 'text-center'},
			{ data: 'itemGubun1Nm', className : 'text-center'},
			{ data: 'itemGubun2Nm', className : 'text-center'},
			{ data: 'itemCd', className : 'text-center'},
			{ data: 'itemNm', className : 'text-center'},
			{ data: 'itemDc', className : 'text-center'},
			{ data: 'unitDc', className : 'text-center'},
			{ data: 'dealCorpNm', className : 'text-center'},
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
			let theadHeight = parseFloat($('#itemInfoAdmModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemInfoAdmModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemInfoAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	itemInfoAdmModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = itemInfoAdmModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemInfoAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 거래처모달1 조회 버튼 click
	$('#btnitemInfoAdmModalSearch1').on('click', function() {
		itemInfoAdmModalTable1.ajax.reload(function(){});
	});

	$('#btnItemInfoAdmModalPaste1').on('click', function(){
		$('#my-spinner').show();

		for(var i=0; i<$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').length; i++){
			
	 		let data = $('#itemInfoAdmModalTable1').DataTable().row($('#itemInfoAdmModalTable1').DataTable().$('tr.selected')[i]).data();

	 		let col_filter_text = [];
	 		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
	 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
	 			col_filter_text.push($(item).find('input').val());
	 		});
	 		
	 		purchaseOrderAdmTable.row.add({
	 			'orderNo'		:	null,
	 			'buyReason'		:	null,
	 			'itemGubunIdx'	:	data.itemGubunIdx,
	 			'itemGubun1Idx'	:	data.itemGubun1Idx,
	 			'itemGubun2Idx'	:	data.itemGubun2Idx,
	 			'itemGubunNm'	:	data.itemGubunNm,
	 			'itemGubun1Nm'	:	data.itemGubun1Nm,
	 			'itemGubun2Nm'	:	data.itemGubun2Nm,
	 			'itemCd'		:	data.itemCd,
	 			'itemNm'		:	data.itemNm,
	 			'itemDc'		:	data.itemDc,
	 			'unitDc'		:	data.unitDc,
	 			'maker'			:	data.maker,
	 			'orderQty'		:	col_filter_text[14],
	 			'orderDesc'		:	col_filter_text[16],
	 			'status'		:	'001'
	 		}).draw(false);

	 		purchaseOrderAdmTable.colReorder.disable();

	 		$('#btnNew').attr('disabled', false); // 신규 버튼
	 		$('#btnSave').attr('disabled', false); // 저장 버튼
	 		$('#btnEdit').attr('disabled', false); // 수정 버튼
	 		$('#btnDel').attr('disabled', false); // 삭제 버튼
	 		$('#btnCancel').attr('disabled', false); // 취소 버튼

	 		
		}

		setTimeout(function() {
			$('#itemInfoAdmModal1').modal('hide');
			$('#my-spinner').hide();
		}, 100)
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
			//프로젝트코드
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
			//프로젝트코드
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
		$('#batchProjectCd').val(data.prjCd);
		$('#bizOrderAdmModal1').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#bizOrderAdmModal1').modal('hide');
		
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#batchProjectCd').val('');
	});
	
</script>

</body>
</html>
