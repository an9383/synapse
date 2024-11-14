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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">요청구분</label>
					<select class="form-select w-auto h-100 me-3" id="searchRequestGubun" style="min-width: 70px;"></select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">입고구분</label>
					<select class="form-select w-auto h-100 me-3" id="searchInOutGubun" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="P" selected>미입고</option>
						<option value="I">입고완료</option>
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">상신여부</label>
					<select class="form-select w-auto h-100 me-3" id="searchUpvoteYn" style="min-width: 70px;">
						<option value="" selected>전체</option>
						<option value="Y">상신완료</option>
						<option value="N">미상신</option>
					</select>
					<div class="btn-group me-2" role="group" aria-label="Small button group">
<!-- 						<button type="button" class="btn btn-outline-light w-auto" id="btnEditPrice" disabled>단가 수정</button> -->
<!-- 						<button type="button" class="btn btn-outline-danger w-auto" id="btnSavePrice" disabled>단가 저장</button> -->
					</div>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">입고예정일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-2" id="batchPreInDate">
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnBatchApply">
								적용
							</button>
						</div>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSavePrice" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEditPrice" disabled><i class="fa-regular fa-pen-to-square"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
<!-- 							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th> -->
							<th class="text-center align-middle">유형</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">요청구분</th>
							<th class="text-center align-middle">요청번호</th>
<!-- 							<th class="text-center align-middle">부서</th> -->
<!-- 							<th class="text-center align-middle">품목구분</th> -->
							<th class="text-center align-middle">구분1</th>
							<th class="text-center align-middle">구분2</th>
							<th class="text-center align-middle">거래처</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">MAKER</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">입고수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">입고창고</th>
							<th class="text-center align-middle">입고일</th>
							<th class="text-center align-middle">입고예정일</th>
							<th class="text-center align-middle">발주일</th>
							<th class="text-center align-middle">납기일</th>
							<th class="text-center align-middle">납기지연</th>
							<th class="text-center align-middle">비고</th>
<!-- 							<th class="text-center align-middle">수불상태</th> -->
							<th class="text-center align-middle">상신완료</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
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
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트코드</label>
						<input type="text" class="form-control w-auto h-100 me-1" id="projectSearch">
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
<!-- textArea 전장 모달 -->
<div class="modal fade" id="request006Modal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 35vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					SPEC
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="request006Table">
					<thead class="table-light">
						<tr>
							<td><textArea id="request006Text" class="form-control inputGroup textarea" style="max-width: 100%; resize: none; !important;" disabled></textArea></td>
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
	
	//전장 textArea 모달길이 자동 맞춤 
	var textArea = document.getElementById('request006Text');
	textArea.style.overflowY = 'hidden';
	textArea.style.height = 'auto';
</script>

<script>
	WM_init('ADM');
	WM_init('DTL');

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '3', '2'); //날짜조정
	
	let requestGubunList = getCommonCode('시스템', '048'); //요청구분

	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
	
	$('#startDate').val(moment().subtract('M',3).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#batchPreInDate').val(moment().format('YYYY-MM-DD'));

	var selectedRows = [];
	
	// 수주관리 전체 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end me-5 tableCount'><'d-flex align-items-center justify-content-end'i>>",
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
            style: 'os',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/pm/totalPurchaseOrderLst"/>',
			type : 'POST',
			data : {
 				'startDate'		: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
 				'endDate'		: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
 				'inOutGubun'	: function() { return $('#searchInOutGubun').val(); },
 				'requestGubun'	: function() { return $('#searchRequestGubun').val(); },
				'upvoteYn'		: function() { return $('#searchUpvoteYn').val(); },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ data: 'purchaseOrderType', className : 'text-center align-middle', name : "purchaseOrderType", //유형
				render: function(data, type, row, meta) {
					if(data == '001') {
						return '<div style="white-space:nowrap;" name="purchaseOrderType">가공</div>';
					} else {
						return '<div style="white-space:nowrap;" name="purchaseOrderType">구매</div>';
					}
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle', name : 'orderDtlNo', //발주번호
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd', //프로젝트코드
				render: function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '';
				}
			},
			{ data: 'requestGubun', className : 'text-center align-middle', name: 'requestGubun',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var requestGubun = '';
						requestGubunList.forEach(function(item){
						    if(item.commonCd == data){
						    	requestGubun = item.commonNm;
						    }
						});
						return '<div name="requestGubun" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+requestGubun+'</div>';
					} else return '';
				}
			},
			{ data: 'orderNo', className : 'text-center align-middle', //요청번호
				render: function(data, type, row, meta) {
					if(data!=null && data!='') {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
// 			{ data: 'itemGubunNm', className : 'text-center align-middle', name: 'itemGubunNm', //품목구분
// 				render: function(data, type, row, meta) {
// 					if(data!=null) {
// 						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 					} else {
// 						return '';
// 					}
// 				}
// 			},
// 			{ data: 'orderUserDepartment', className : 'text-center align-middle', //부서
// 				render: function(data, type, row, meta) {
// 					if(data!=null) {
// 						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 					} else {
// 						return '';
// 					}
// 				}
// 			},
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle', name: 'dealCorpNm', //거래처
				render: function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:150px; white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '';
				}
			},
			{ data: 'itemCd', className : 'text-center align-middle', name: 'itemCd', //품번
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle', //품명
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'itemDc', className : 'text-center align-middle', //규격
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'maker', className : 'text-center align-middle', name: 'maker',  //MAKER
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'unitDc', className : 'text-center align-middle', //단위
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '';						
					}
				}
			},
			{ 
				data: 'inQty', className : 'text-end align-middle', name: 'inQty', //입고수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '';						
					}
				}
			},
			{ data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '';						
					}
				}
			},
			{ className : 'text-end align-middle', //합계 금액
				render : function(data, type, row, meta) {
					var totalAmt = 0;
					totalAmt = parseFloat(row['orderDtlQty']) * parseFloat(row['price']);
					return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(totalAmt))+'</div>';					
				}
			},
			{ data: 'inWhsNm', className : 'text-center align-middle', //입고창고
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:80px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ 
				data: 'inDate', className : 'text-center align-middle', name: 'inDate', //입고일자
				render : function(data, type, row, meta) {
					if(data!=null && data != ''){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else return '';
				}
			},
			{ 
				data: 'preInDate', className : 'text-center align-middle', name: 'preInDate', //입고예정일
				render : function(data, type, row, meta) {
					if(data!=null && data != ''){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else return '';
				}
			},
			{ data: 'deliveryOrderDate', className : 'text-center align-middle', name: 'deliveryOrderDate', //발주일
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else return '';
				}
			},
			{ data: 'orderDate', className : 'text-center align-middle', name: 'orderDate', //납기일
				render : function(data, type, row, meta) {
					if(data!=null && data != ''){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else return '';
				}
			},
// 			{ data: 'requestDate', className : 'text-center align-middle', name: 'requestDate', //요청일
// 				render : function(data, type, row, meta) {
// 					if(data!=null && data != ''){
// 						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
// 					} else return '';
// 				}
// 			},
			{ //납기지연
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{ data: 'orderDtlDesc', className : 'text-center align-middle', name: 'orderDtlDesc', //비고
				render: function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:150px; white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '';
				}
			},
// 			{ //수불상태
// 				render : function(data, type, row, meta) {
// 					return '';
// 				}
// 			},
			{ //상신완료
				data: 'upvoteYn', className : 'text-center align-middle', name: 'orderDtlDesc', //비고
				render : function(data, type, row, meta) {
					if(data!=null){
						if(data=='Y'){
							return '상신완료';
						} else return '미상신';
					} else return '미상신';
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

	var tableCountHtml = '<div style="padding-top: 0.85em !important; color:red !important;">총&ensp;<span id="tableCnt">0</span> 건 &ensp;&ensp;&ensp;<span id="amtSum">0</span> 원</div>';
	$('.tableCount').html(tableCountHtml);

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		purchaseOrderAdmTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주목록 선택
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();

		$('#btnEditPrice').attr('disabled', false);
	});

	// 행이 선택될 때 이벤트 핸들러 추가
	purchaseOrderAdmTable.on('select', function(e, dt, type, indexes) {
		selectedRows = [];
		var amtSum = 0;
		for(var i=0; i<purchaseOrderAdmTable.rows('.selected').data().length; i++){
			var selectedRowData = purchaseOrderAdmTable.rows('.selected').data()[i];
			selectedRows.push(selectedRowData); // 선택된 행 데이터를 배열에 추가
		}

       
		for (var i = 0; i < selectedRows.length; i++) {
			var amt = parseInt(selectedRows[i].price) * parseInt(selectedRows[i].orderDtlQty);
			amtSum += amt;
		}

		$('#tableCnt').text(addCommas(selectedRows.length));
		$('#amtSum').text(addCommas(amtSum));
	});
	
	// 행이 선택 해제될 때 이벤트 핸들러 추가
	purchaseOrderAdmTable.on('deselect', function(e, dt, type, indexes) {
		selectedRows = [];
		var amtSum = 0;
		for(var i=0; i<purchaseOrderAdmTable.rows('.selected').data().length; i++){
			var selectedRowData = purchaseOrderAdmTable.rows('.selected').data()[i];
			selectedRows.push(selectedRowData); // 선택된 행 데이터를 배열에 추가
		}

       
		for (var i = 0; i < selectedRows.length; i++) {
			var amt = parseInt(selectedRows[i].price) * parseInt(selectedRows[i].orderDtlQty);
			amtSum += amt;
		}

		$('#tableCnt').text(addCommas(selectedRows.length));
		$('#amtSum').text(addCommas(amtSum));
	});

	//전장 데이터 더블클릭시 모달 활성화
	$('#purchaseOrderAdmTable tbody').on('dblclick', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();
		if(data.requestGubun == '006'){
			$('#request006Modal').modal('show');
			$('#request006Text').val(data.partDc);
		}
		setTimeout(function(){
			textArea.style.height = textArea.scrollHeight + 'px';
		},200);
	});

	//단가 수정
	$('#btnEditPrice').on('click', function(){
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).is('.selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == purchaseOrderAdmTable.column('price:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" name="price" style="width:80px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == purchaseOrderAdmTable.column('preInDate:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="date" name="preInDate" style="min-width:150px;" class="form-control" value="'+value+'">');
						}
					}
				});
			}
		});

		$('#btnEditPrice').attr('disabled', true);
		$('#btnSavePrice').attr('disabled', false);

		purchaseOrderAdmTable.colReorder.disable();
	});

	//단가 저장
	$('#btnSavePrice').on('click', function(){
		let dataArray = new Array();
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).find('input').length > 1){
				var obj = new Object();
				
				obj.orderDtlNo = purchaseOrderAdmTable.row($(tr)).data().orderDtlNo;
				obj.cost = $(tr).find('input[name=price]').val().replaceAll(/,/g, '');
				obj.preInDate = $(tr).find('input[name=preInDate]').val().replaceAll(/-/g, '');
				
		        dataArray.push(obj);
			}
		});
		
		$.ajax({
			url: '<c:url value="/bm/itemOnlyCostIU"/>',
            type: 'POST',
            data: {
            	'jsonArray'	:	JSON.stringify(dataArray),
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('수정되었습니다.');

					$('#btnEditPrice').attr('disabled', true);
					$('#btnSavePrice').attr('disabled', true);

					purchaseOrderAdmTable.ajax.reload(function() {});
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	//일괄적용
	$('#btnBatchApply').on('click',function(){
		$('#purchaseOrderAdmTable tbody tr').each(function(index, item){
			if($(this).is('.selected')) {
				$(this).find('input[name=preInDate]').val($('#batchPreInDate').val());
			}
		});
	});
</script>

</body>
</html>
