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
					<select class="form-select w-auto h-100 me-2" id="searchRequestGubun" style="min-width: 70px;">
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">입고여부</label>
					<select class="form-select w-auto h-100 me-3" id="searchInGubun" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="001" selected>미입고</option>
						<option value="002">입고</option>
					</select>
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">자재코드</label> -->
<!-- 					<div class="input-group w-auto h-100 me-3"> -->
<!-- 						<input type="text" class="form-control" id="searchItemCd" disabled> -->
<!-- 						<button id="searchItemCdDel" type="button" class="btnInputDel" style="background-color: transparent; border-color: transparent; position: absolute; -->
<!-- 							top: 0; right:0; margin: 5px 23px; margin-left: 0px; border: none;"> -->
<!-- 							<i class="fa-solid fa-xmark"></i> -->
<!-- 						</button> -->
<!-- 						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" onclick="itemInfoAdmSel('search')" id="btnItemInfoAdmSel"> -->
<!-- 							<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트</label> -->
<!-- 					<input type="text" style="min-width: 150px;" class="form-control w-auto h-100 me-1" id="searchProjectCd"> -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주상태</label> -->
<!-- 					<select class="form-select w-auto h-100 me-3" id="searchStatus" style="min-width: 70px;"> -->
<!-- 						<option value="" selected>전체</option> -->
<!-- 						<option value="001">미발주</option> -->
<!-- 						<option value="002">발주완료</option> -->
<!-- 					</select> -->
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">입고일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-3" id="batchOrderDate">
					<!-- 
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">프로젝트</label>
					<input type="text" class="form-control w-auto h-100 me-1" id="batchProjectCd">
					 -->
					<!-- 
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					 -->
					<div class="d-flex align-items-center justify-content-end me-2">
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
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">프로젝트</th>
							<th class="text-center align-middle">요청구분</th>
							<!-- <th class="text-center align-middle">담당자</th> -->
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">구분1</th>
							<th class="text-center align-middle">구분2</th>
							<th class="text-center align-middle">구분3</th>
							<th class="text-center align-middle">거래처명</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">Maker</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">기입고수량</th>
							<th class="text-center align-middle">입고일</th>
							<th class="text-center align-middle">입고수량</th>
							
							<th class="text-center align-middle">단가</th>
							
							
							
							<th class="text-center align-middle">금액</th>
							
							<th class="text-center align-middle">발주일</th>
							
							<th class="text-center align-middle">입고창고</th>
							<th class="text-center align-middle">납기지연</th>
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
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정

 	let requestGubunList = getCommonCode('시스템', '048'); // 요청구분
	
	let itemGubunList = getCommonCode('시스템', '049'); // 품목구분
	let lcGubunList = getCommonCode('시스템', '034'); // 창고분류
	
 	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
 	selectBoxAppend(itemGubunList, 'locationModalItemGubun', '', '1'); //품목구분

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#batchOrderDate').val(moment().format('YYYY-MM-DD'));
	
	let checkRequest = '';

	let defWhsIdx = '';
	let defWhsGubun = '';
	let defWhsIdxNm = '';

	$.ajax({
		url : '<c:url value="/bm/locationAdmList"/>',
		type : 'GET',
		data : {
			'itemGubun'		: function() { return ''; },
			'lcTypeOutput'	: function() { return ''; },
			'lcGubun'		: function() { return ''; },
		},
		success : function(res) {
			let data = res.data;
			for(let i = 0; i<data.length; i++) {
				if(data[i].lcNm == '자재창고') {
					defWhsIdx = data[i].idx;
					defWhsGubun = data[i].lcCd;
					defWhsIdxNm = data[i].lcNm;
					return false;
				}
			}
		}
	});

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
			url : '<c:url value="/pm/purchaseOrderDtlInsertLst"/>',
			type : 'POST',
			data : {
				startDate		: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate			: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				requestGubun	: function() { return $('#searchRequestGubun').val(); },
 				status			: function() { return $('#searchInGubun').val(); },
				
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle', name : "admCheckBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
			{ data: 'status', className : 'text-center align-middle', //상태
				render : function(data, type, row, meta) {
					/*
					if(data!=null) {
						if(data=='001') {
							return '발주';
						} else {
							return '입고';
						}
					} else {
						return '입고';
					}
					*/
					return '발주';
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			/*
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						let orderDtlSeq = data.split('-');
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+orderDtlSeq[1]+'</div>';
						//return orderDtlSeq[1];
					} else {
						return '';
					}
				}
			},
			*/
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					return '<div name="projectCd" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'requestGubun', className : 'text-center align-middle', name: 'requestGubun',
				render: function(data, type, row, meta) {
					var requestGubun = '';
					requestGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	requestGubun = item.commonNm;
					    }
					});
					return '<div name="requestGubun" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+requestGubun+'</div>';
				}
			},
			/* 
			{ data: 'orderUserIdx', className : 'text-center align-middle', name: 'orderUserIdx', //담당자
				render: function(data, type, row, meta) {
					let html = '';
					html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserIdx" class="d-none">'+data+'</div>';
					html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserName">'+row['orderUserName']+'</div>';
					return html;
				}
			},
			 */
			{ data: 'orderUserDepartment', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space:nowrap;" name="orderUserDepartment">'+data+'</div>';
				}
			},
			{ data: 'itemGubunNm', className : 'text-center align-middle', name: 'itemGubunNm', //품목구분1
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
			}, 
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
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
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
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
			},
			{ data: 'dealCorpIdx', className : 'text-center align-middle', name: 'dealCorpIdx', //거래처
				render: function(data, type, row, meta) {
					if(data != null){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+row['dealCorpNm']+'</div>';
					} else return '';
				}
			},
			{ data: 'itemCd', className : 'text-center align-middle', name: 'itemCd', //자재코드
				render: function(data, type, row, meta) {
					return '<div name="itemCd" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle', //자재명
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'itemDc', className : 'text-center align-middle', //규격
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'maker', className : 'text-center align-middle', name: 'maker', //maker
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'unitDc', className : 'text-center align-middle', //단위
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';							
				}
			},
			{ data: 'alreadyInWhsQty', className : 'text-end align-middle', name: 'alreadyInWhsQty', //기발주수량
				render : function(data, type, row, meta) {
					/* 
					if(row['orderNo'] != null && row['orderNo'] != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '<div style="white-space:nowrap;">0</div>';				
					}
					 */
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ data: 'inDate', className : 'text-center align-middle', name: 'inDate',//입고일
				render : function(data, type, row, meta) {
					/*
					if(row['orderNo'] != null && row['orderNo'] != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					} else {
						let html = '';
						html += '<input type="date" name="inDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
					*/
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'orderQty', className : 'text-end align-middle', name: 'orderQty', //입고수량
				render : function(data, type, row, meta) {
					/*
					if(row['orderNo'] != null && row['orderNo'] != ''){
						return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					} else {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="inWhsQty" class="form-control text-end"><span class="d-none"></span>';						
					}
					*/
					return '<div style="background-color:#f8acac;white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					return '<div name="price" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			
			
			{ className : 'text-end align-middle', //금액(계산)
				render : function(data, type, row, meta) {
					return '<div name="totalAmt" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">0</div>';							
				}
			},
			{ data: 'deliveryOrderDate', className : 'text-center align-middle', name: 'orderDate',//납기요청일
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
				}
			},
			{  className : 'text-center align-middle', name: 'whsIdx', //입고창고
				render : function(data, type, row, meta) {
					let html = '';
// 						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
// 						html += '<input type="hidden" name="whsIdx" value="">';
// 						html += '<input type="text" class="form-control inputGroup" name="whsIdxNm" value="" disabled>';
// 						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="whsIdxSel()" name="btnWhsIdxSel" style="padding: 1px 4px; margin-left: 0px;">';
// 						html += '<i class="fa-solid fa-magnifying-glass"></i>';
// 						html += '</button></div>';
					return html;
				}
			},
			{ //납기지연
				render : function(data, type, row, meta) {
					return '';
				}
			},
// 			{ //비고
// 				render : function(data, type, row, meta) {
// 					return '';
// 				}
// 			},
			{ data: 'orderDtlDesc', className : 'text-end align-middle', name: 'orderDtlDesc', //비고
				render : function(data, type, row, meta) {
					return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
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

	//체크박스
	$(document).on('change', 'input[name=admCheckBox]', function(){

		if($('input[name=admCheckBox]:checked').length == 1){
			checkRequest = purchaseOrderAdmTable.row($(this).parent().parent()).data().requestGubun;
		} else if($('input[name=admCheckBox]:checked').length > 1){
			if(checkRequest != purchaseOrderAdmTable.row($(this).parent().parent()).data().requestGubun){
				toastr.warning('요청구분이 다릅니다');
				$(this).prop('checked', false);
				return false;
			}
		}
	});

	// 공통코드관리 ADM 신규 버튼 click
	$('#btnNew').on('click', function() {
		WM_action_ON('ADM','workingWarningModal');
		let col_filter_text = [];
		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		purchaseOrderAdmTable.row.add({
			'orderNo'		:	null,
			'orderSeq'		:	null,
			'orderGubun1'	:	null,
			'orderGubun2'	:	null,
			'orderGubun3'	:	null,
			'pronjectCd'	:	null,
			'maker'	:	col_filter_text[7],
			'orderQty'		:	col_filter_text[12],
			'orderDesc'		:	col_filter_text[13]
		}).draw(false);

		purchaseOrderAdmTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
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
			if($(item).find('td').find('input').length != 1) {
				//구매요청
				let itemCd = $(td).find('div[name=itemCd]').text();
				let price = $(td).find('div[name=price]').text();
				let orderQty = $(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').val();
				let inDate = $(td).eq(purchaseOrderAdmTable.column('inDate:name').index()).find('input').val();
				let dealCorpIdx = purchaseOrderAdmTable.row($(item)).data().dealCorpIdx;
				let orderDtlNo = purchaseOrderAdmTable.row($(item)).data().orderDtlNo;
				let whsIdx = $(td).eq(purchaseOrderAdmTable.column('whsIdx:name').index()).find('input[name=whsIdx]').val();
				let whsGubun = $(td).eq(purchaseOrderAdmTable.column('whsIdx:name').index()).find('input[name=whsGubun]').val();
				let orderUserIdx = $(td).find('div[name=orderUserIdx]').text();
				let orderDtlDesc = $(td).eq(purchaseOrderAdmTable.column('orderDtlDesc:name').index()).find('input').val();
				let totalInQty = parseInt(purchaseOrderAdmTable.row($(item)).data().alreadyInWhsQty) + parseInt(orderQty);

				
				
				if(orderQty == '') {
					toastr.warning('입고수량을 입력해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(inDate == '') {
					toastr.warning('입고일을 입력해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(whsIdx == '') {
					toastr.warning('입고창고를 선택해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('whsIdx:name').index()).find('button').focus();
					state = false;
					return false;
				}

				let inputGubun = purchaseOrderAdmTable.row($(item)).data().inputGubun;

				let obj = new Object();
				obj.inSlipNo = null;
				obj.itemCd = itemCd;
				obj.price = price.replaceAll(/,/g,'');
				obj.inQty = orderQty.replaceAll(/,/g,'');
				obj.inDate = inDate.replace(/-/g,"");
				obj.dealCorpIdx = dealCorpIdx;
				obj.orderDtlNo	= orderDtlNo;
				obj.whsIdx = whsIdx;
				obj.whsGubun = whsGubun;
				obj.inUserIdx = orderUserIdx;
				obj.inDesc = orderDtlDesc;
				obj.inputGubun = inputGubun == null ? '' : inputGubun;
				obj.totalInQty = totalInQty;
				
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		console.log(array)
		$.ajax({
			url: '<c:url value="/pm/inProdWhsAdmIU"/>',
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

					$('input[name=admCheckBox]').attr('disabled', false);
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

		let csWhsIdx = '';
		let csWhsGubun = '';
		let csWhsIdxNm = '';

// 		$('#locationModalTable tbody').find('tr').each(function(index, item) {
// 			let node = $(item);
// 			let data = $('#locationModalTable').DataTable().row($(item)).data();

// 			if(data.lcCd == 'M01'){
// 				defWhsIdx = data.idx;
// 				defWhsGubun = data.lcGubun;
// 				defWhsIdxNm = data.lcNm;
// 			} else if(data.lcCd == 'M02'){
// 				csWhsIdx = data.idx;
// 				csWhsIdxNm = data.lcNm;
// 			}
// 		});
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).find('[name=admCheckBox]').is(':checked')) {
				let data = $('#purchaseOrderAdmTable').DataTable().row($(tr)).data();
				let inQty = 0;
				let priceVal = 0;
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == purchaseOrderAdmTable.column('inDate:name').index()) {
							$(td).html('<input type="date" max="9999-12-31" name="inDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
						} else if(index_td == purchaseOrderAdmTable.column('deliveryOrderDate:name').index()) {
							$(td).html('<input type="date" max="9999-12-31" name="deliveryOrderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
						} else if(index_td == purchaseOrderAdmTable.column('orderQty:name').index()) {
							let value = addCommas(parseInt(purchaseOrderAdmTable.row(tr).data().orderDtlQty) - parseInt(purchaseOrderAdmTable.row(tr).data().alreadyInWhsQty));
							inQty = parseInt(value);
							$(td).html('<input type="text" name="inQty" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						} else if(index_td == purchaseOrderAdmTable.column('orderDtlDesc:name').index()) {
							$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="">');
						} else if(index_td == purchaseOrderAdmTable.column('whsIdx:name').index()) {
							if(purchaseOrderAdmTable.row(index_tr).data().requestGubun == '001'){
								let html = '';
								html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
								html += '<input type="text" class="form-control inputGroup" name="whsIdxNm" value="'+csWhsIdxNm+'" disabled>';
								html += '<input type="hidden" name="whsIdx" value="'+csWhsIdx+'">';
								html += '<input type="hidden" name="whsGubun" value="'+csWhsGubun+'">';
								html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="whsIdxSel()" name="btnWhsIdxSel" style="padding: 1px 4px; margin-left: 0px;">';
								html += '<i class="fa-solid fa-magnifying-glass"></i>';
								html += '</button></div>';

								$(td).html(html);
							} else{
								let html = '';
								html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
								html += '<input type="text" class="form-control inputGroup" name="whsIdxNm" value="'+defWhsIdxNm+'" disabled>';
								html += '<input type="hidden" name="whsIdx" value="'+defWhsIdx+'">';
								html += '<input type="hidden" name="whsGubun" value="'+defWhsGubun+'">';
								html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="whsIdxSel()" name="btnWhsIdxSel" style="padding: 1px 4px; margin-left: 0px;">';
								html += '<i class="fa-solid fa-magnifying-glass"></i>';
								html += '</button></div>';

								$(td).html(html);
							}
						} else if(index_td == purchaseOrderAdmTable.column('price:name').index()) {
								var sum = parseInt(inQty) * parseInt(data.price);

								$($(tr).find('div[name=totalAmt]')).text(addCommas(sum));
						}
					}
				});
			}
		});
		$('input[name=admCheckBox]').attr('disabled', true);
		purchaseOrderAdmTable.draw();
		purchaseOrderAdmTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
	});

	// 수주별발주 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('#purchaseOrderAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = purchaseOrderAdmTable.row('.selected').data();

		if(data.orderNo != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		} else {
			purchaseOrderAdmTable.row('.selected').remove().draw();
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let orderNo = purchaseOrderAdmTable.row('.selected').data().orderNo;
			if(orderNo==null) {
				purchaseOrderAdmTable.row('.selected').remove().draw(false);
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
							purchaseOrderAdmTable.row('.selected').remove().draw(false);
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
		if($('#batchOrderDate').val()=='') {
			toastr.warning('입고일자를 지정해주세요.');
			$('#batchOrderDate').focus();
		}
		$('#purchaseOrderAdmTable tbody tr').each(function(index, item){
			if($(this).find('input[name=admCheckBox]').is(':checked')) {
				$(this).find('input[name=inDate]').val($('#batchOrderDate').val());
			}
		});
	});


	function whsIdxSel() {
		$('#locationModal').modal('show');
		setTimeout(function() {
			locationModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#locationModalTable').DataTable().rows().deselect();
			}, 200);
		}, 200);
	}

	// 발주관리 목록조회
	$('#locationModalTable thead tr').clone(true).addClass('filters').appendTo('#locationModalTable thead'); // filter 생성
	let locationModalTable = $('#locationModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: false,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '60vh',
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
			url : '<c:url value="/bm/locationAdmList"/>',
			type : 'GET',
			data : {
				itemGubun	:	function() { return $('#locationModalItemGubun').val();}
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'lcCd', className : 'text-center align-middle'},
			{ data: 'lcNm', className : 'text-center align-middle'},
			{ data: 'lcGubun', className : 'text-center align-middle', name: 'lcGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						var lcGubunVal = '';
						lcGubunList.forEach(function(item) {
							if(item.commonCd== data) {
								lcGubunVal = item.commonNm;
							}
						});
						return lcGubunVal;
					} else {
						let html = '';
						html += '<select class="form-select">';
						lcGubunList.forEach(function(item) {
							if(item.commonCd=='001') {
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
						});
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			},
			{ data: 'lcOutsourcing', className : 'text-center align-middle', name: 'lcOutsourcing',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return row['lcOutsourcingNm'];
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="lcOutsourcing">'
						html += '<input type="text" class="form-control inputGroup" name="lcOutsourcingNm" disabled>';
						html += '<button type="button" class="inputGroup" onclick="lcOutsourcingDelete()" name="btnLcOutsourcingDelete" style="background-color: transparent;';
						html += 'border-color: transparent;position: absolute;top: 0;right:0;margin: 1px 23px;margin-left: 0px;border: none;"><i class="fa-solid fa-xmark"></i></button>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="dealCorpSel()" name="btnDealCorpSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'itemGubun', className : 'text-center align-middle', name: 'itemGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return row['itemGubunNm'];
					} else {
						let html = '';
						html += '<select class="form-select">';
						if(data==null) {
							itemGubunList.forEach(function(item) {
								if(item.commonNm=='제품') {
									html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else {
									html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
								}
							});
						} else {
							itemGubunList.forEach(function(item) {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});							
						}
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			},
			{ data: 'useYn', className : 'text-center align-middle', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if(data == 'Y') {
							return '사용';
						} else {
							return '미사용';
						}
					} else {
						return '<select onchange="useYnChange()" class="form-select" name="useYn"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#middlecolT').css('height'));
			let theadHeight = parseFloat($('#locationModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#locationModalTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#locationModalTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAllAdm').off('keyup',function() {});
			$('#searchAllAdm').on('keyup',function() {
				$('#locationModalTable_filter').find('input').val($(this).val());
				$('#locationModalTable_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#locationModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title.replaceAll('*','') + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#locationModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	locationModalTable.on('column-reorder', function( e, settings, details ) {
		let api = locationModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#locationModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 창고 모달 조회 버튼 click
	$('#btnLocationSearch').on('click', function() {
		$('#my-spinner').show();
		locationModalTable.ajax.reload(function() {});
		
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 창고 모달 붙여넣기 버튼 click
	$('#btnLocationModalPaste').on('click', function() {
		if(!$('#locationModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let data = locationModalTable.row('.selected').data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsGubun]').val(data.lcGubun);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsIdxNm]').val(data.lcNm);
		$('#locationModal').modal('hide');
	});

	$('#locationModalTable tbody').on('dblclick','tr',function(){
		let data = locationModalTable.row('.selected').data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsGubun]').val(data.lcGubun);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=whsIdxNm]').val(data.lcNm);
		$('#locationModal').modal('hide');
	});

	//담당자====================================================================================
	
// 	function userSel() {
// 		$('#userModal').modal('show');
// 		setTimeout(function() {
// 			userModalTable.ajax.reload(function() {});
// 			setTimeout(function() {
// 				$('#userModalTable').DataTable().$('tr.selected').removeClass('selected');
// 			}, 500);
// 		}, 200);
// 	}

// 	// 사용자정보 목록조회
// 	$('#userModalTable thead tr').clone(true).addClass('filters').appendTo('#userModalTable thead'); // filter 생성
// 	let userModalTable = $('#userModalTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
// 		language: lang_kor,
// 		info: true,
// 		ordering: true,
// 		processing: true,
// 		paging: false,
// 		lengthChange: false,
// 		searching: true,
// 		autoWidth: false,
// 		orderCellsTop: true,
//         fixedHeader: false,
//         scrollY: '100vh',
//         scrollX: true,
// 		pageLength: 100000000,
// 		colReorder: true,
// 		select: {
//             style: 'single',
//             toggleable: false,
//             items: 'row',
//             info: false
//         },
//         ajax : {
// 			url : '<c:url value="/sm/userLst"/>',
// 			type : 'POST',
// 			data : {
// 				userStateCd: function() { return $('#SearchUserStateCd').val(); }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'userId', className : 'text-center'},
// 			{ data: 'userName', className : 'text-center'},
// 			{ data: 'userDepartmentNm', className : 'text-center'},
// 			{ data: 'userPositionNm', className : 'text-center'},
// 			{ data: 'userJobNm', className : 'text-center'},
// 		],
// 		columnDefs : [
// 			//{
// 			//	targets: [0],
// 			//	render: function(data) {
// 			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 			//	}
// 			//}
// 		],
// 		buttons : [
// 			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 				exportOptions: {
// 	                modifier: {
// 	                   selected:null
// 	                },	                
// 	            },
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	},
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#userModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 197)+'px');
			
// 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			//$('#searchAll').off('keyup',function() {});
// 			//$('#searchAll').on('keyup',function() {
// 			//	$('#'+table_id+'_filter').find('input').val($(this).val());
// 			//	$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			//});
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#userModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	userModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = userModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

// 	// 사용자모달 조회 버튼 click
// 	$('#btnUserModalSearch').on('click', function() {
// 		userModalTable.ajax.reload(function(){});
// 	});

// 	$('#userModalTable tbody').on('dblclick','tr',function(){
// 		let data = userModalTable.row(this).data();
// 		console.log(data)
// 		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserIdx]').val(data.idx);
// 		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserName]').val(data.userName);
// 		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=orderUserDepartment]').text(data.userDepartmentNm);
		
// 		$('#userModal').modal('hide');
// 	});

	//자재====================================================================================
	
// 	$('#searchItemCdDel').on('click', function() {
// 		$('#searchItemCd').val('');
// 	});
	
// 	let itemInfoAdmSearch = 'search';
	
// 	function itemInfoAdmSel(value) {
// 		itemInfoAdmSearch = value;
// 		$('#itemInfoAdmModal').modal('show');
// 		setTimeout(function() {
// 			itemInfoAdmModalTable.ajax.reload(function() {});
// 			setTimeout(function() {
// 				$('#itemInfoAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
// 			}, 500);
// 		}, 200);
// 	}
	

// 	// 품목정보 목록조회
// 	$('#itemInfoAdmModalTable thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmModalTable thead'); // filter 생성
// 	let itemInfoAdmModalTable = $('#itemInfoAdmModalTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
// 		language: lang_kor,
// 		info: true,
// 		ordering: true,
// 		processing: true,
// 		paging: false,
// 		lengthChange: false,
// 		searching: true,
// 		autoWidth: false,
// 		orderCellsTop: true,
//         fixedHeader: false,
//         scrollY: '100vh',
//         scrollX: true,
// 		pageLength: 100000000,
// 		colReorder: true,
// 		select: {
//             style: 'single',
//             toggleable: false,
//             items: 'row',
//             info: false
//         },
//         ajax : {
//         	url: '<c:url value="/bm/itemInfoAdmLst"/>',
//             type: 'GET',
//             data: {
                
//             },
// 		},
//         rowId: 'itemCd',
// 		columns : [
// 			{ data: 'itemCd', className : 'text-center'},
// 			{ data: 'itemNm', className : 'text-center'},
// 			{ data: 'itemDc', className : 'text-center'},
// 			{ data: 'itemGubunNm', className : 'text-center'},
// 			{ data: 'unitDc', className : 'text-center'},
// 			{ data: 'useYnNm', className : 'text-center'},
// 			{ data: 'inspectYnNm', className : 'text-center'},
// 		],
// 		columnDefs : [
// 			//{
// 			//	targets: [0],
// 			//	render: function(data) {
// 			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 			//	}
// 			//}
// 		],
// 		buttons : [
// 			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 				exportOptions: {
// 	                modifier: {
// 	                   selected:null
// 	                },	                
// 	            },
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	},
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#itemInfoAdmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 223)+'px');
			
// 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			$('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#'+table_id+'_filter').find('input').val($(this).val());
// 				$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			});
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#itemInfoAdmModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	itemInfoAdmModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = itemInfoAdmModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

// 	//품목 조회 버튼 click
// 	$('#btnitemInfoAdmModalSearch').on('click', function() {
// 		itemInfoAdmModalTable.ajax.reload(function(){});
// 	});

// 	$('#itemInfoAdmModalTable tbody').on('dblclick','tr',function(){
// 		let data = itemInfoAdmModalTable.row(this).data();
// 		if(itemInfoAdmSearch=='input') {
// 			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(data.itemCd);
// 			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemNm]').text(data.itemNm);
// 			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemDc]').text(data.itemDc);
// 			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=unitDc]').text(data.unitDc);
// 		} else {
// 			$('#searchItemCd').val(data.itemCd);
// 		}
		
// 		$('#itemInfoAdmModal').modal('hide');
// 	});

// 	// 고객사 검색 버튼 click
// 	function dealCorpAdmSel() {
// 		$('#dealCorpModal').modal('show');
// 	}
// 	$('#dealCorpModal').on('shown.bs.modal', function() {
// 		dealCorpModalTable.ajax.reload(function() {});
// 	});

// 	// 거래처정보 목록 조회
// 	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
// 	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
// 		language: lang_kor,
// 		info: true,
// 		ordering: true,
// 		processing: true,
// 		paging: false,
// 		lengthChange: false,
// 		searching: true,
// 		autoWidth: false,
// 		orderCellsTop: true,
//         fixedHeader: false,
//         scrollY: '100vh',
//         scrollX: true,
// 		pageLength: 100000000,
// 		colReorder: true,
// 		select: {
//             style: 'single',
//             toggleable: false,
//             items: 'row',
//             info: false
//         },
//         ajax : {
// 			url : '<c:url value="/bm/dealCorpAdmList"/>',
// 			type : 'POST',
// 			data : {
// 				dealGubun : function(){ return $('#modalDealGubun').val();},
// 				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'dealGubunNm', className : 'text-center'},
// 			{ data: 'dealCorpCd', className : 'text-center'},
// 			{ data: 'initial', className : 'text-center'},
// 			{ data: 'dealCorpNm', className : 'text-center'},
// 			{ data: 'representative', className : 'text-center'},
// 			{ data: 'companyNumber', className : 'text-center'},
// 		],
// 		columnDefs : [
// 			//{
// 			//	targets: [0],
// 			//	render: function(data) {
// 			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 			//	}
// 			//}
// 		],
// 		buttons : [
// 			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 				exportOptions: {
// 	                modifier: {
// 	                   selected:null
// 	                },	                
// 	            },
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	},
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			
// 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			$('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#'+table_id+'_filter').find('input').val($(this).val());
// 				$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			});
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	dealCorpModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = dealCorpModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

// 	$('#btnDealCorpModalSearch').on('click',function(){
// 		dealCorpModalTable.ajax.reload(function() {});
// 	});

// 	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
// 		let data = dealCorpModalTable.row(this).data();
// 		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpIdx]').val(data.idx);
// 		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpNm]').val(data.dealCorpNm);
// 		$('#dealCorpModal').modal('hide');
// 	});

	$(document).on('change', 'input[name=inQty]', function(){
		var tr = $(this).parent().parent();
		var price = tr.find('div[name=price]').text().replace(/,/g, '');
		var inQty = $(this).val().replace(/,/g, '');

		var supplyAmt = parseFloat(price) * parseFloat(inQty);
		var vat = parseFloat(supplyAmt) * 0.1;
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)));
	});

	function getTotalPrice() {
		if($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val()!='' && $('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val() != '') {
			console.log($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val());
			console.log($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val());
			let totalPrice = parseInt(removeCommas($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val())) * parseInt(removeCommas($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val()));
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=totalPrice]').text(addCommas(totalPrice));
		}
	}
	
</script>

</body>
</html>
