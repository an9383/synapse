<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 5fr 4px 5fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-1 monthAdjust" id="monthAdjust">
					</select>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label>
					<select class="form-select w-auto h-100 me-3" id="searchStatus" style="min-width: 70px;">
						<option value="" >전체</option>
						<option value="P" selected>미입고</option>
					</select>
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnEdit" ><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center" style="padding: 0px;">
								<input class="form-check-input d-none" type="checkbox" id="checkAll" style="margin: 0px; width: 25px; height: 25px;">
							</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">요청번호</th>
							<th class="text-center align-middle">요청구분</th>
							<th class="text-center align-middle">프로젝트번호</th>
							<th class="text-center align-middle">거래처명</th>
							<th class="text-center align-middle">출력번호</th>
							<th class="text-center align-middle">상신상태</th>
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
					<div class="btn-group me-1" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnUpvoteY">상신완료</button>
						<button type="button" class="btn btn-outline-danger w-auto" id="btnUpvoteN">상신취소</button>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-auto">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;"
								id="btnGmail" onclick="window.open('about:blank').location.href='https://mail.google.com/mail/u/0/?tab=rm#inbox?compose=new'">
							<img class="w-auto" src="<c:url value='/resources/assets/images/gmail_icon.jpg?ver=1'/>" style="height: 14px; margin-bottom: 3px;">
						</button>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDownload"><i class="fa-solid fa-download"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrint"><i class="fa-solid fa-print"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
				  	<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">발주서</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<table id="purchasePaperTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr>
										<td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n">
										<td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n">
										<td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bd-n">
										<td class="bd-n"><td class="bd-n"><td class="bd-n"><td class="bl-n bt-n bb-n">
										<td colspan="2" class="bb-b text-center align-middle">작&nbsp;성</td>
										<td colspan="2" class="bb-b text-center align-middle">검&nbsp;토</td>
										<td colspan="2" class="bb-b text-center align-middle">검&nbsp;토</td>
										<td colspan="2" class="bb-b text-center align-middle">대&nbsp;표</td>
									</tr>
									<tr>
										<td colspan='13' class="bd-n"></td>
										<td colspan='6' class="fs-20 text-center bt-n bl-n br-n bb-n">발&nbsp;&nbsp;&nbsp;&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;서</td>
										<td colspan='2' class="bd-n"></td><td rowspan="2" class="bl-n bt-n bb-n"></td>
										<td colspan="2" rowspan="2" class="bb-b text-center align-middle"></td>
										<td colspan="2" rowspan="2" class="bb-b text-center align-middle"></td>
										<td colspan="2" rowspan="2" class="bb-b text-center align-middle"></td>
										<td colspan="2" rowspan="2" class="bb-b text-center align-middle"></td>
									</tr>
									<tr>
										<td colspan='30' class="fs-15 text-center bd-n"></td>
									</tr>
									<tr>
										<td colspan='22' class="bd-n h-30"></td>
										<td colspan='8' rowspan="2" class="bd-n h-30"><span><img class="bi mx-2 mt-2" src="/resources/assets/images/header_logo2.png?ver=3" style="height: 35px;float: right;"></span></td>
									</tr>
									<tr>
										<td colspan="5" class="bt-2 bl-2 text-center">상&nbsp;&nbsp;&nbsp;호</td>
										<td colspan="12" class="bt-2 br-2 text-center">시냅스이미징㈜</td>
										<td colspan="5" class="bd-n"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 text-center">주&nbsp;&nbsp;&nbsp;소</td>
										<td colspan="12" class="fs-8 br-2 text-center">경기 군포시 고산로 166 SK벤티움 102동 505호/납품주소 하단</td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bt-2 bl-2 text-center">거래처명</td>
										<td colspan="3" class="fs-8 bt-2 text-center" id="dealCorpNmPrint"></td>
										<td colspan="3" class="fs-8 bt-2 text-center">거래처코드</td>
										<td colspan="3" class="fs-8 bt-2 br-2 text-center" id="dealCorpCdPrint"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 text-center">연락처</td>
										<td colspan="5" class="fs-8 text-center">031-608-9304</td>
										<td colspan="3" class="text-center">팩&nbsp;&nbsp;스</td>
										<td colspan="4" class="fs-8 br-2 text-center">031-341-3450</td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bl-2 text-center">사업자번호</td>
										<td colspan="3" class="fs-8 text-center" id="companyNumPrint"></td>
										<td colspan="3" class="fs-8 text-center">대표자명</td>
										<td colspan="3" class="fs-8 br-2 text-center" id="representativePrint"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 text-center">발주번호</td>
										<td colspan="5" class="fs-8 text-center" id="orderDtlNoPrint"></td>
										<td colspan="3" class="text-center">발주일자</td>
										<td colspan="4" class="fs-8 br-2 text-center" id="deliveryOrderDatePrint"></td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bl-2 text-center">주소</td>
										<td colspan="9" class="fs-8 br-2 text-center" id="addressAdmPrint"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 text-center">발주자</td>
										<td colspan="12" class="fs-8 br-2 text-center"><input type="text" id="deliveryOrderUserPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bl-2 text-center">전화번호</td>
										<td colspan="3" class="fs-8 text-center" id="companyCallNumPrint"></td>
										<td colspan="3" class="fs-8 text-center">팩스</td>
										<td colspan="3" class="fs-8 br-2 text-center" id="faxNumberPrint"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 text-center">프로젝트</td>
										<td colspan="12" class="fs-8 br-2 text-center"><input type="text" id="projectCdPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bl-2 text-center">담당자</td>
										<td colspan="3" class="fs-8 text-center" id="salesManagerPrint"></td>
										<td colspan="3" class="fs-8 text-center">담당자번호</td>
										<td colspan="3" class="fs-8 br-2 text-center" id="phoneNumberPrint"></td>
									</tr>
									<tr>
										<td colspan="5" class="bl-2 bb-2 text-center">특이사항</td>
										<td colspan="12" class="fs-8 br-2 bb-2 text-center"><input type="text" id="descPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td colspan="1" class="bd-n"></td>
										<td colspan="3" class="fs-8 bl-2 bb-2 text-center">발주금액</td>
										<td colspan="9" class="fs-8 br-2 bb-2 text-center" id="orderDtlAmtPrint"></td>
									</tr>
									<tr>
										<td colspan='30' class="fs-15 text-center bd-n"></td>
									</tr>
									<tr id="trAppendTarget" class="bt-2">
										<td class="bl-2 bg-gray fs-8 text-center align-middle not-left theadFirstCol">NO</td>
										<td colspan='4' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">CODE</td>
										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">구분1</td>
										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">구분2</td>
										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">MAKER</td>
										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">품명</td>
										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">규격</td>
										<td class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">단위</td>
										<td class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">수량</td>
										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">단가</td>
										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">금액</td>
										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">납기</td>
										<td colspan='3' class="br-2 bg-gray fs-8 text-center align-middle not-left theadFirstCol">비고</td>
									</tr>
									<tr class="bt-2" style="height:25px;">
										<td colspan='19' class="bl-2 bb-2 fs-8 text-center align-middle not-left theadFirstCol"></td>
										<td colspan='2' class="fs-8 bb-2 text-center align-middle not-left theadFirstCol">TOTAL</td>
										<td colspan='3' class="fs-8 bb-2 text-end align-middle not-left theadFirstCol" id="sumOrderDtlAmtPrint"></td>
										<td colspan='6' class="br-2 bb-2 fs-8 text-center align-middle not-left theadFirstCol"></td>
									</tr>
									<tr>
										<td colspan='30' class="fs-15 text-center bd-n"></td>
									</tr>
									<tr>
										<td rowspan="2" colspan="5" class="bl-2 bt-2 bb-2 text-center align-middle">납품장소</td>
										<td rowspan="2" colspan="16" class="bt-2 bb-2 fs-10 text-center align-middle"><input type="text" id="deliveryLocPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td rowspan="2" colspan="3" class="bt-2 bb-2 fs-10 text-center align-middle">도면 및 규격 문의</td>
										<td rowspan="2" colspan="2" class="bt-2 bb-2 fs-8 text-center align-middle"><input type="text" class="text-center p-0 fs-8" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td rowspan="2" colspan="4" class="bt-2 br-2 bb-2 fs-8 text-center align-middle"><input type="text" class="text-center p-0 fs-8" style="border:none !important;width:100%; font-weight: 900;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
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
			let rightcolMinWidth = 700; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

			//console.log(Math.max(rightColWidth, rightcolMinWidth));
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
			$('#page').css('grid-template-columns', '5fr 4px 5fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 5fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '5fr 4px 5fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '5fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정s
	
	let paperLineCountList = getCommonCode('시스템', '019'); //발주서라인수
	let paperLineCount = parseInt(paperLineCountList[0].commonNm);
	let requestGubunList = getCommonCode('시스템', '048'); //요청구분
		
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	
	// 사용자정보 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
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
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/pm/purchaseOrderPrintUpvoteLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				status : function() { return $('#searchStatus').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ 	className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['orderDtlNo'] != null){
						let html = '<input class="form-check-input" type="checkbox" id="'+row['orderDtlNo']+'" name="purchasePrint" style="margin: 0px; width: 25px; height: 25px;">';
						if(row['printNo'] != null && row['printNo'] != ''){
							html += '<span name="purchasePrint" class="d-none" data-idx="'+row['printNo']+'">'+row['printNo']+'</span>';
						} else {
							html += '<span name="purchasePrint" class="d-none" data-idx="'+row['idx']+'">noPrint</span>';
						}
						return html;
					} else return '';
					
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:120px;white-space:nowrap;">'+data+'</div>';
					} else return '';							
				}
			},
			{ data: 'orderNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:120px;white-space:nowrap;">'+data+'</div>';
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
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+requestGubun+'</div>';
					} else return '';
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return data;
					} else {
						return '';
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null) {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'printNo', className : 'text-center align-middle', //출력번호
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="min-width:100px;white-space:nowrap;">'+data+'</div>';
					} else {
						return '';				
					}
				}
			},
			{ data: 'upvoteYn', className : 'text-center align-middle', //상신여부
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data == 'Y'){
							return '<div style="min-width:60px;white-space:nowrap;">상신완료</div>';
						} else return '<div style="min-width:60px;white-space:nowrap;"></div>';
					} else {
						return '';				
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
			{ "targets": [0], "orderable": false },
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
		/* rowsGroup: [
			'checkbox:name'
	 	], */
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			//입고상태인 경우 회색으로 표시
			for(var i=0;i<api.data().count();i++) {
				let data = api.row(i).data();
				let node = api.row(i).node();
				
				let status = data.status; // 상태
				if(status == '003'){
					$(node).addClass('bg-secondary bg-gradient bg-opacity-10');
				} 
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
				if(colIdx > 0){
					$(cell).html('<input type="text" class="form-control" placeholder="" />');
					$(cell).css('padding','2px');
				} else {
					$(cell).html('');
					$(cell).css('padding','2px');
				}

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			
			$('#btnEdit').trigger('click');
		},
	});

	// 모든 체크박스 선택
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop("checked")) {
			//$('input[name=purchasePrintprintNoValcked",true);
			$('input[name=purchasePrint]').prop("checked",false);
			$('input[name=purchasePrint]').each(function(index,item){
				if(purchaseOrderAdmTable.row($(this).parent().parent()).data().printNo == null || purchaseOrderAdmTable.row($(this).parent().parent()).data().printNo == ''){
					$(this).prop("checked",true);
					$(this).trigger('change');
				}
			});
			
		} else{
			for(var i=0; i< $('input[name=purchasePrint]:checked').length; i++){
				var row = $('.dtlList').eq(i);
			    row.find('td').empty();
			}
			
			$('input[name=purchasePrint]').prop("checked",false);
			$('input[name=purchasePrint]').eq(0).trigger('change');
		}
		
		
	});

	// 모든 체크박스 체크/해제 되도록
	$(document).on('change','input:checkbox[name=purchasePrint]', function(){
		if( $('input:checkbox[name=purchasePrint]').length == $('input:checkbox[name=purchasePrint]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
			$('#checkAll').prop("checked",true);
		} else{
			$('#checkAll').prop("checked",false);
		}
 	});

	let tempList = [];
	// 발주항목 체크
	$(document).on('change','input[name=purchasePrint]', function() {
		if(!$(this).is(':checked')){
		    $('.dtlList').find('td').empty();
		}
		let checkArray = [];
		
		$('.dtlList').find('.not-edit').html('&nbsp;');
		$('.dtlList').find('.edit').find('input').val('');
		let dataList = [];
		let status = true;
		for(var i=0;i<purchaseOrderAdmTable.data().count();i++) {
			let node = purchaseOrderAdmTable.row(i).node();
			let data = purchaseOrderAdmTable.row(i).data();
			let orgDtlNo = data.orderDtlNo;
			let printData;

			let check = false;
			
			if(status){
				//체크할땐 span태그의 data-idx값으로 체크하고
				//배열에 값을 넣을땐 span의 text로 값을 넣어줌 -> 발주서출력번호가 없는 경우는 noPrint라는 값으로 통일하기 위해서 text로 넣음
				if( $(node).find('td').eq(0).find('input').prop('checked') || checkArray.includes($(node).find('span[name=purchasePrint]').data('idx')) ){
					check = true;
					if(!$(node).find('td').eq(0).find('input').is(':checked')){
						$(node).find('td').eq(0).find('input').prop('checked', true);
					}
					
				}
				if(check) {
					let checkFin = true;
					//체크할때 유니크한 배열값으로 체크
					checkArray.push($(node).find('span[name=purchasePrint]').text());
					let set = new Set(checkArray);
					let uniqueArr = [...set];

					//리스트 출력
					$.ajax({
						url: '<c:url value="/pm/purchaseOrderPrintLst"/>',
			            type: 'POST',
			            async: false,
			            data: {    
			            	startDate 	: function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
							endDate 	: function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
							status 		: function() { return $('#searchStatus').val(); },
							orderDtlNo	: function() { return data.orderDtlNo;}
			            },
			            beforeSend: function() {
			            	$('#my-spinner').show();
			            },
						success : function(res) {
							if (res.result == "ok") { //응답결과
								printData = res.data;
							} else if(res.result == 'fail') {
								toastr.warning(res.message);
							} else {
								toastr.error(res.message);
							}
							$('#my-spinner').hide();

						}
					});
					/* if(uniqueArr.length > 1){
						toastr.warning('이미 출력된 발주서입니다.');
						status=false;
						checkFin=false;
						dataList = _.cloneDeep(tempList);
						$(this).prop("checked",false);
						// 모든 체크박스 체크/해제 되도록
						$(document).on('change','input:checkbox[name=purchasePrint]', function(){
							if( $('input:checkbox[name=purchasePrint]').length == $('input:checkbox[name=purchasePrint]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
								$('#checkAll').prop("checked",true);
							} else{
								$('#checkAll').prop("checked",false);
							}
					 	});
					} else{ */
						for(var j=0;j<printData.length;j++){
							let printNoList = _.uniqBy(dataList, function(elem){
								return [elem.printNo, elem.orderDtlNo].join();
								});
							
							//현재 for문 돌고있는 자재식별자
							let filterList = _.find(printNoList, v=>v.orderDtlNo == printData[j].orderDtlNo);
							//해당 식별자의 납기일과 일치하는지+ filterList가 있는 경우엔 예외처리 타도록 , 빈값일 경우 -> 첫번째 클릭인경우
							//↑↑↑↑↑ 자재별의 납기일 체크로직 넣어달라해서 추가했었던 것
							if(isEmptyCheck(filterList)){
							let obj = {}; // 그냥 data를 넣으면 아래쪽에서 값을 계산하는 과정에서 해당 data의 원본의 값이 변경되기 때문에 일일이 따로 입력
							obj.orderDtlNo = printData[j].orderDtlNo;
							obj.realDtlNo = orgDtlNo;
							obj.dealCorpIdx = printData[j].dealCorpIdx;
							obj.dealCorpCd = printData[j].dealCorpCd;
							obj.dealCorpNm = printData[j].dealCorpNm;
							obj.representative = printData[j].representative
							obj.addressAdm = printData[j].addressAdm;   
							obj.phoneNumber = printData[j].phoneNumber;  
							obj.faxNumber = printData[j].faxNumber;    
							obj.itemCd = printData[j].itemCd;
							obj.itemNm = printData[j].itemNm;
							obj.itemGubun1Nm = printData[j].itemGubun1Nm;
							obj.itemGubun2Nm = printData[j].itemGubun2Nm;
							obj.maker = printData[j].maker;
							obj.itemDc = printData[j].itemDc;
							obj.unitDc = printData[j].unitDc;
							obj.orderDtlQty = printData[j].orderDtlQty;
							obj.price = printData[j].price;
							obj.supplyAmt = printData[j].supplyAmt;
							obj.requestDate = printData[j].requestDate;
							obj.orderDtlDesc = printData[j].orderDtlDesc;
							obj.deliveryUserNm = printData[j].deliveryUserNm;
							obj.projectCd = printData[j].projectCd;
							obj.remark = printData[j].remark;
							
							//발주서 출력번호
							obj.printNo = printData[j].printNo != '' && printData[j].printNo != null ? printData[j].printNo : 'notPrint';
							
							dataList.push(obj);
							} else {
							//if(filterList.purchaseInDueDate == printData[i].purchaseInDueDate){
							let obj = {}; // 그냥 data를 넣으면 아래쪽에서 값을 계산하는 과정에서 해당 data의 원본의 값이 변경되기 때문에 일일이 따로 입력
							obj.orderDtlNo = printData[j].orderDtlNo;
							obj.realDtlNo = orgDtlNo;
							obj.dealCorpIdx = printData[j].dealCorpIdx;
							obj.dealCorpCd = printData[j].dealCorpCd;
							obj.dealCorpNm = printData[j].dealCorpNm;
							obj.representative = printData[j].representative
							obj.addressAdm = printData[j].addressAdm;   
							obj.phoneNumber = printData[j].phoneNumber;  
							obj.faxNumber = printData[j].faxNumber; 
							obj.itemCd = printData[j].itemCd;
							obj.itemNm = printData[j].itemNm;
							obj.itemGubun1Nm = printData[j].itemGubun1Nm;
							obj.itemGubun2Nm = printData[j].itemGubun2Nm;
							obj.maker = printData[j].maker;
							obj.itemDc = printData[j].itemDc;
							obj.unitDc = printData[j].unitDc;
							obj.orderDtlQty = printData[j].orderDtlQty;
							obj.price = printData[j].price;
							obj.supplyAmt = printData[j].supplyAmt;
							obj.requestDate = printData[j].requestDate;
							obj.orderDtlDesc = printData[j].orderDtlDesc;
							obj.deliveryUserNm = printData[j].deliveryUserNm;
							obj.projectCd = printData[j].projectCd;
							obj.remark = printData[j].remark;
							
							//발주서 출력번호
							obj.printNo = printData[j].printNo != '' && printData[j].printNo != null ? printData[j].printNo : 'notPrint';
							
							dataList.push(obj);
							//} else {
							/*	toastr.warning('입고예정일이 다른 발주입니다.');
							status=false;
							checkFin=false;
							dataList = _.cloneDeep(tempList);
							$(this).prop("checked",false);
							// 모든 체크박스 체크/해제 되도록
							$(document).on('change','input:checkbox[name=purchasePrint]', function(){
							if( $('input:checkbox[name=purchasePrint]').length == $('input:checkbox[name=purchasePrint]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
							$('#checkAll').prop("checked",true);
							} else{
							$('#checkAll').prop("checked",false);
							}
							});
							}*/
							
							}
						}
						

						//dataList에 밀어넣고나서 발주처 중복 체크
						let dealCorpUniqLst = _.uniqBy(dataList, v=> v.dealCorpIdx);
						if(dealCorpUniqLst.length > 1){
							toastr.warning('발주처가 다른 항목입니다.');
							status=false;
							checkFin=false;
							dataList = _.cloneDeep(tempList);
							$(this).prop("checked",false);
							// 모든 체크박스 체크/해제 되도록
							$(document).on('change','input:checkbox[name=purchasePrint]', function(){
								if( $('input:checkbox[name=purchasePrint]').length == $('input:checkbox[name=purchasePrint]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
									$('#checkAll').prop("checked",true);
								} else{
									$('#checkAll').prop("checked",false);
								}
						 	});
						}

						//dataList에 밀어넣고나서 발주처 중복 체크
						let dtlNoUniqLst = _.uniqBy(dataList, v=> v.realDtlNo);
						if(dtlNoUniqLst.length > 1){
							toastr.warning('발주번호가 다른 항목입니다.');
							status=false;
							checkFin=false;
							dataList = _.cloneDeep(tempList);
							$(this).prop("checked",false);
							// 모든 체크박스 체크/해제 되도록
							$(document).on('change','input:checkbox[name=purchasePrint]', function(){
								if( $('input:checkbox[name=purchasePrint]').length == $('input:checkbox[name=purchasePrint]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
									$('#checkAll').prop("checked",true);
								} else{
									$('#checkAll').prop("checked",false);
								}
						 	});
						}
					//}

				}
			}
			
		}
		if(!status){
			dataList = _.cloneDeep(tempList);
		} else{
			tempList = _.cloneDeep(dataList);
		}
		
		//자재, 발주서출력번호, 입고예정일별 유니크한 리스트
		let printNoList = _.sortBy(_.uniqBy(dataList, function(elem){
														return [elem.printNo, elem.orderDtlNo, elem.dealCorpIdx].join();
														 }) , v=> v.orderDtlNo ); //출력번호별 목록
		for(var i=0;i<printNoList.length;i++) {
			let printNo = printNoList[i].printNo;
			let itemCd = printNoList[i].itemCd;
		}
		
		let result = printNoList;

		if(result.length > 0){
			$('#orderDtlNoPrint').text(result[0].realDtlNo);
			$('#deliveryOrderDatePrint').text(moment(result[0].deliveryOrderDate).format('YYYY-MM-DD'));
			$('#dealCorpNmPrint').text(result[0].dealCorpNm);
			$('#dealCorpCdPrint').text(result[0].dealCorpCd);
			$('#representativePrint').text(result[0].representative);
			$('#addressAdmPrint').text(result[0].addressAdm);
			$('#companyNumPrint').text(result[0].phoneNumber);
			$('#faxNumberPrint').text(result[0].faxNumber);
			$('#deliveryOrderUserPrint').val(result[0].deliveryUserNm);
			$('#projectCdPrint').val(result[0].projectCd);
			$('#descPrint').val(result[0].remark);
		} else if(result.length == 0){
			$('#orderDtlNoPrint').text('');
			$('#deliveryOrderDatePrint').text('');
			$('#dealCorpNmPrint').text('');
			$('#dealCorpCdPrint').text('');
			
			$('#representativePrint').text('');
			$('#addressAdmPrint').text('');
			$('#companyNumPrint').text('');
			$('#faxNumberPrint').text('');
			$('#deliveryOrderUserPrint').val('');
			$('#projectCdPrint').val('');
			$('#descPrint').val('');
		}

		let sumOrderDtlAmtPrintVal = 0;
		
		for(var i=0;i<result.length;i++) {
			let orderDtlNo = result[i].orderDtlNo;
			let itemCd = result[i].itemCd;
			let itemNm = result[i].itemNm;
			let itemGubun1Nm = result[i].itemGubun1Nm;
			let itemGubun2Nm = result[i].itemGubun2Nm;
			let maker = result[i].maker;
			let itemDc = result[i].itemDc;
			let unitDc = result[i].unitDc;
			let orderDtlQty = result[i].orderDtlQty;
			let price = result[i].price;
			let supplyAmt = result[i].supplyAmt;
			let requestDate = result[i].requestDate;
			let orderDtlDesc = result[i].orderDtlDesc;

			$('.dtlList').eq(i).attr('id', orderDtlNo);
			$('.dtlList').eq(i).find('td').eq(0).html(i+1);
			$('.dtlList').eq(i).find('td').eq(1).html(itemCd);
			$('.dtlList').eq(i).find('td').eq(2).html(itemGubun1Nm);
			$('.dtlList').eq(i).find('td').eq(3).html(itemGubun2Nm);
			$('.dtlList').eq(i).find('td').eq(4).html(maker);
			$('.dtlList').eq(i).find('td').eq(5).html(itemNm);
			$('.dtlList').eq(i).find('td').eq(6).html(itemDc);
			$('.dtlList').eq(i).find('td').eq(7).html(unitDc);
			$('.dtlList').eq(i).find('td').eq(8).html(addCommas(parseInt(orderDtlQty)));
			$('.dtlList').eq(i).find('td').eq(9).html(addCommas(parseInt(price)));
			$('.dtlList').eq(i).find('td').eq(10).html(addCommas(parseInt(supplyAmt)));
			$('.dtlList').eq(i).find('td').eq(11).html(requestDate == '' ? '' : moment(requestDate).format('YYYY-MM-DD'));
			$('.dtlList').eq(i).find('td').eq(12).html(orderDtlDesc);

			sumOrderDtlAmtPrintVal += parseInt(supplyAmt);
		}

		$('#sumOrderDtlAmtPrint').text(addCommas(parseInt(sumOrderDtlAmtPrintVal)));
		$('#orderDtlAmtPrint').text('KRW ' + addCommas(parseInt(sumOrderDtlAmtPrintVal)));
	});

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {

		$('#my-spinner').show();
		purchaseOrderAdmTable.row('.selected').deselect();
		purchaseOrderAdmTable.ajax.reload(function() {
			$('#btnEdit').trigger('click');
		});
		$('#checkAll').prop("checked",false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		$('#btnCancel').attr('disabled',true);
		
		$('.dtlList').find('.not-edit').html('&nbsp;');
		$('.dtlList').find('.edit').find('input').val('');
		tempList = [];
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 상신완료 버튼 click
	$('#btnUpvoteY').on('click',function() {
		printUpd('Y');
	});

	// 상신완료 버튼 click
	$('#btnUpvoteN').on('click',function() {
		printUpd('N');
	});

	// 출력번호 수정
	function printUpd(printYnVal){
		$('#my-spinner').show();
		_promise_().then((value)=>{
			let updDtlNo = '';
			let status = false;
			let printYn = 'N';
			/* $('#purchaseOrderAdmTable tbody tr').each(function(index){
				let data = purchaseOrderAdmTable.row(index).data();
				let node = purchaseOrderAdmTable.row(index).node();
				let checkboxIdx = purchaseOrderAdmTable.column('checkbox:name').index();
				if( $(node).find('td').eq(checkboxIdx).find('input[name=purchasePrint]').prop('checked') ){
					updDtlNo += data.idx +', ';
					if(data.printNo != null && data.printNo !=''){
						printYn='Y';
					}
				}	
			}); */
			$('input[name=purchasePrint]:checked').each(function(index, item){
				let tr = $(item).parent().parent();
				let node = purchaseOrderAdmTable.row(tr).node();
				let data = purchaseOrderAdmTable.row(tr).data();
				updDtlNo += data.orderDtlNo +',';
				//if(data.printNo != null && data.printNo !=''){
				//	printYn='Y';
				//}				
			});
			if(updDtlNo != '' && updDtlNo != null && printYn == 'N'){
				updDtlNo = updDtlNo.slice(0,-1);
				$.ajax({
					url: '<c:url value="/pm/purchasePaperUpd"/>',
		            type: 'POST',
		            async: false,
		            data: {    
			            'updDtlNo'			:	function(){return updDtlNo;},
			            'printYn'			:	function(){return printYnVal;},
			            'printDate'			:	function(){return moment().format('YYYYMMDD');},
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							//toastr.success('발주서 출력번호 수정되었습니다.');
							cssChange(); // css반영
							
// 							$('#purchasePaperTable').print({
// 								globalStyles: true,
// 								mediaPrint: true
// 							});
							$('#btnSearch').trigger('click');
							$('#checkAll').prop("checked",false);
							status = true;
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
							$('#btnSearch').trigger('click');
							$('#checkAll').prop("checked",false);
							status = false;
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();

					}
				});
			} else {
				cssChange(); // css반영
				
				$('#purchasePaperTable').print({
					globalStyles: true,
					mediaPrint: true
				});
				status = true;
			}
			return status;
		}).then((value)=>{
			setTimeout(function() {

				$('#my-spinner').hide();
			}, 200);
		});
	} 

	$('#btnPrint').on('click', function(){
		$('#purchasePaperTable').print({
			globalStyles: true,
			mediaPrint: true
		});
	});
	
	// 작업인쇄 모달이 띄워지면 인쇄
	$('#workOrderPaperModal').on('shown.bs.modal', function (e) {
		$('#purchasePaperTable').print({
			globalStyles: true,
			mediaPrint: true
		});
		$('#workOrderPaperModal').modal('hide');
		$('#my-spinner').hide();
	});

	// 발주서 다운로드 버튼 click
	$('#btnDownload').on('click', function() {
		cssChange(); // css반영
		html2canvas($('#purchasePaperTable')[0], {
			allowTaint : true,	// cross-origin allow
			useCORS: true,		// CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale : 2			// 기본 96dpi에서 해상도를 두 배로 증가
		}).then(function(canvas) {
			var element = document.getElementById('purchasePaperTable');
			var opt = {
			  margin:       3,
			  filename:     moment().format('YYYYMMDD')+'_발주서.pdf',
			  image:        { type: 'jpeg', quality: 0.98 },
			  html2canvas:  { scale: 1 },
			  jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait'}
			};

			// New Promise-based usage:
			html2pdf().from(element).set(opt).save().then(() => {
				
			});
		});
	});












	// 초기 셋팅
	$(document).ready(function() {
		$('#purchasePrintDate').html('일자 : '+moment().format('YYYY년 MM월 DD일'));
		for(var i=0;i<paperLineCount;i++) { // 발주상세 빈공간 생성
			$('#trAppendTarget').after(makeEmptyTr());
		}
		
		cssChange();
		$('#my-spinner').hide();
		$('#purchasePaperTable').removeClass('d-none');

		$('input').attr('autocomplete','one-time-code');
	});

	// make empty tr
	function makeEmptyTr() {
		let html = '';
			html += '<tr class="dtlList" style="height:25px;">';
			html += '	<td class="bl-2 fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="4" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="2" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="3" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="3" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="2" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="2" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td class=" fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td class=" fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="2" class="fs-8 text-end align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="3" class="fs-8 text-end align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="3" class="fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '	<td colspan="3" class="br-2 fs-8 text-center align-middle not-left theadFirstCol"></td>';
			html += '</tr>';

		return html;
	}

	function cssChange() {
		$('#purchasePaperTable').find('td').css('font-weight', '900');
		$('#purchasePaperTable').find('td').css('border', '1px solid black');
		$('#purchasePaperTable').find('td').css('padding', '0.1rem');
		$('#purchasePaperTable').find('td').css('color', '#000000');

		$('#purchasePaperTable').find('.bg-gray').css('background-color', '#f2f2f2');
		
		$('#purchasePaperTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#purchasePaperTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#purchasePaperTable').find('.fs-6').css('font-size', '6px');
		$('#purchasePaperTable').find('.fs-8').css('font-size', '8px');
		$('#purchasePaperTable').find('.fs-10').css('font-size', '10px');
		$('#purchasePaperTable').find('.fs-13').css('font-size', '13px');
		$('#purchasePaperTable').find('.fs-15').css('font-size', '15px');
		$('#purchasePaperTable').find('.fs-20').css('font-size', '20px');
		$('#purchasePaperTable').find('.fs-30').css('font-size', '30px');
		$('#purchasePaperTable').find('.fs-50').css('font-size', '50px');
		$('#purchasePaperTable').find('.fc-red').css('color', '#ff0000');
		$('#purchasePaperTable').find('.bt-2').css('border-top', '2px solid black');
		$('#purchasePaperTable').find('.bl-2').css('border-left', '2px solid black');
		$('#purchasePaperTable').find('.br-2').css('border-right', '2px solid black');
		$('#purchasePaperTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#purchasePaperTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#purchasePaperTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bb-b').css('border', '1px solid black');
		$('#purchasePaperTable').find('.h-5').css('height', '5px');
		$('#purchasePaperTable').find('.h-10').css('height', '10px');
		$('#purchasePaperTable').find('.h-20').css('height', '20px');
		$('#purchasePaperTable').find('.h-30').css('height', '30px');
		$('#purchasePaperTable').find('.h-40').css('height', '40px');
		$('#purchasePaperTable').find('.h-55').css('height', '55px');
		$('#purchasePaperTable').find('.h-70').css('height', '70px');
		$('#purchasePaperTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#purchasePaperTable').find('td').length;i++) {
			let tdStyle = $('#purchasePaperTable').find('td').eq(i).attr('style') == undefined?'':$('#purchasePaperTable').find('td').eq(i).attr('style');
			$('#purchasePaperTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}
	}

	//수정버튼
	$('#btnEdit').on('click',function(){
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).hasClass('editNode') && $(td).find('input').length != 1) {
					if(index_td == purchaseOrderAdmTable.column('purchaseInDueDate:name').index()) {
						let data = purchaseOrderAdmTable.row(tr).data();
						let value = data.purchaseInDueDate;
						let ordQty = parseInt(data.purchaseOrdQty);
						let cutQty = parseInt(data.cutQty);
						let eaQty = parseInt(data.eaQty);
						let extraQty = parseInt(data.extraQty);
						let extraPackQty = parseInt(data.extraPackQty);
						let inQty = data.inQty != null && data.inQty != '' ? data.inQty : 0;
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty);
							
						
						value = moment(value).format('YYYY-MM-DD');
						//원래 입고다된 항목은 수정 못하는 거였는데 출력된경우 수정못하도록 변경됨
						//출력했더라도 입고가 안된 경우는 수정할 수 있게끔 변경됨
						//if( parseInt(pressQty) > parseInt(inQty) ){
						if( data.printNo == null || data.printNo == '' || parseInt(inQty) == 0 ){
							$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
						} else {
							$(td).html('<input disabled type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
						}
					} else if(index_td == purchaseOrderAdmTable.column('printNo:name').index()){
						let inQty = purchaseOrderAdmTable.row(tr).data().inQty != null && purchaseOrderAdmTable.row(tr).data().inQty != '' ? purchaseOrderAdmTable.row(tr).data().inQty : 0;
						if(inQty == 0 && purchaseOrderAdmTable.row(tr).data().printNo != null && purchaseOrderAdmTable.row(tr).data().printNo !=''){

							let html = '';
							html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';												
							html += '<input type="text" class="form-control inputGroup inputNm" name="printNo"  style="min-width:110px;max-width:110px;border-top-right-radius :0.375rem;border-bottom-right-radius :0.375rem;" value="'+purchaseOrderAdmTable.row(tr).data().printNo+'" disabled="">';
							html +=	'<button type="button" class="inputGroup" name="btnDealCorpDelete" style="background-color: transparent;border-color: transparent;position: absolute;top: 0;right:0;margin: 1px 5px;margin-left: 0px;border: none;">';
							html +=	'	<i class="fa-solid fa-xmark"></i>';
							html +=	'</button>';												
							html +=	'<input type="hidden" id="customerIdx" class="inputIdx">';
							html += '</div>';
							$(td).html(html);							
						}
						
					}
						
				}
			})
		});

		$('#btnSave').attr('disabled',false);
		$('#btnEdit').attr('disabled',true);
		$('#btnCancel').attr('disabled',false);

		purchaseOrderAdmTable.draw(false);
	});

// 	$('#btnSave').on('click',function(){
// 		let array = [];
// 		let state = true;
// 		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
// 			let td = $(item).find('td');
// 			let data = purchaseOrderAdmTable.row($(item)).data();
// 			let purchaseInDueDate = $(td).eq(purchaseOrderAdmTable.column('purchaseInDueDate:name').index()).find('input').val().replaceAll('-','');
// 			let printNo = $(td).eq(purchaseOrderAdmTable.column('printNo:name').index()).find('input[name=printNo]').val();
			
// 			let obj = new Object();
// 			obj.idx = data.idx;
// 			obj.purchaseInDueDate = purchaseInDueDate;
// 			obj.printNo = printNo;
// 		    array.push(obj);
// 		});

// 		let tableData = [];
// 		for(var i=0;i<purchaseOrderAdmTable.data().count();i++) {
// 			let obj = {};
// 			obj.idx = purchaseOrderAdmTable.row(i).data().idx;
// 			obj.purchaseInDueDate = purchaseOrderAdmTable.row(i).data().purchaseInDueDate;
// 			obj.printNo = purchaseOrderAdmTable.row(i).data().printNo;
// 			tableData.push(obj);
// 		}

// 		array = _.differenceWith(array, tableData, _.isEqual);
// 		//console.log(JSON.stringify(array));
// 		$.ajax({
// 			url: '<c:url value="/pm/purchaseOrderInDueDateAdmUpd"/>',
//             type: 'POST',
//             data: {
//                 'updateJson'	:	JSON.stringify(array)
//             },
//             beforeSend: function() {
//             	$('#my-spinner').show();
//             },
// 			success : function(res) {
// 				if (res.result == "ok") { //응답결과
// 					toastr.success('수정되었습니다.');
// 					$('#btnSearch').trigger('click');
// 					/* WM_action_OFF('ADM');
					
// 					itemDisposal.ajax.reload(function() {});
// 					$('#itemDisposal_wrapper').find('.filters th').each(function(index, item) {
// 						$(item).find('input').attr('disabled', false); // 검색 필터 disabled
// 					});
// 					itemDisposal.colReorder.enable();
        
// 					$('#btnSave').attr('disabled', true); // 저장 버튼
// 					$('#btnEdit').attr('disabled', false); // 수정 버튼
// 					$('#btnDel').attr('disabled', false); // 삭제 버튼
// 					$('#btnCancel').attr('disabled', true); // 취소 버튼 */
// 				} else if(res.result == 'fail') {
// 					toastr.warning(res.message);
// 				} else {
// 					toastr.error(res.message);
// 				}
// 				$('#my-spinner').hide();
// 			}
// 		}); 
// 	});

// 	$('#btnCancel').on('click',function(){
// 		$('#cancelModal').modal('show');
// 		$('#cancelModal').data('type','ADM');
// 	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let type = $('#cancelModal').data('type');
		if(type == 'ADM'){
			toastr.success('취소되었습니다.');
			$('#btnSearch').trigger('click');
		}
	});
	
// 	//출력번호삭제기능
// 	$(document).on('click','button[name=btnDealCorpDelete]',function(){
//  		let tr = $(this).parent().parent().parent();
//  		let data = purchaseOrderAdmTable.row(tr).data();

//  		$(this).prev().val('');
//  		/* $('#deleteModal').data('deleteType','ADM');
//  		$('#deleteModal').data('idx',data.idx);
// 		$('#deleteModal').modal('show'); */
 		
// 	});

	$('#btnDeleteModalY').on('click',function(){
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM'){
			let idx = $('#deleteModal').data('idx');
			$.ajax({
				url: '<c:url value="/pm/purchasePaperDel"/>',
	            type: 'POST',
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#btnSearch').trigger('click');
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


</script>
</body>
</html>
