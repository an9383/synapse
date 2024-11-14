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
		<div class="nav nav-tabs" id="nav-tab">
			<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1" style="border-left:1px solid white; border-top:1px solid white; border-right:1px solid white;">월별실적</button>
			<button class="nav-link" id="tab2Nav" data-bs-toggle="tab" data-bs-target="#tab2" style="border-left:1px solid white; border-top:1px solid white; border-right:1px solid white;">기간별실적</button>
	  	</div>
	  	<div class="tab-content" id="nav-tabContent" style="height: 96.3vh;">
			<div class="tab-pane fade show active" id="tab1">
				<div class="container-fluid h-100" style="padding: 5px;">
					<div class="row" id="leftHeader" style="padding-bottom: 5px;">
						<div class="d-flex align-items-center d-flex">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주년도</label>
							<select class="form-select w-auto h-100 me-3 monthAdjust" id="yearAdjust">
							</select>
							<input type="text" class="d-none form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
							<!-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-warning bg-gradient">작업진행</label>
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-primary bg-info">작업완료</label> -->
						</div>
						<div class="me-lg-auto"></div>
						<div class="d-flex align-items-center justify-content-end">
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
							</div>
						</div>
					</div>
					<div class="row">
						<table class="table table-bordered p-0 m-0" id="bizOrderAdmYearMonTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle"><span id="thisYearVal"></span></th>
									<th class="text-center align-middle">수주</th>
									<th class="text-center align-middle"><span id="beforeCarry"></span>이전 계산서발행금액</th>
									<th class="text-center align-middle">이월수주잔액</th>
									<th class="text-center align-middle"><span id="afterCarry"></span>계산서발행금액</th>
									<th class="text-center align-middle">수주잔액</th>
									<th class="text-center align-middle"><span id="beforeCollect"></span>이전 수금합계</th>
									<th class="text-center align-middle"><span id="thisCollect"></span>수금합계</th>
									<th class="text-center align-middle">수금합계</th>
									<th class="text-center align-middle">미수잔액</th>
									<th class="text-center align-middle">미완료잔액</th>
								</tr>
							</thead>
						<tfoot>
							<tr style="background-color: #f8acac; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #f8acac;">소계</td>
								<td id="sumOrdAmt" style="background-color: #f8acac;"></td>
								<td id="sumLastYearAmt" style="background-color: #f8acac;"></td>
								<td id="sumCarriedAmt" style="background-color: #f8acac;"></td>
								<td id="sumThisYearAmt" style="background-color: #f8acac;"></td>
								<td id="sumRemainAmt" style="background-color: #f8acac;"></td>
								<td id="sumLastYearCollectAmt" style="background-color: #f8acac;"></td>
								<td id="sumThisYearCollectAmt" style="background-color: #f8acac;"></td>
								<td id="sumCollectAmt" style="background-color: #f8acac;"></td>
								<td id="sumRemainPublishAmt" style="background-color: #f8acac;"></td>
								<td id="sumInCompleteAmt" style="background-color: #f8acac;"></td>
							</tr>
							<tr style="background-color: #6fdb65; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #6fdb65;">합계</td>
								<td class="text-end align-middle" id="totalOrdAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCarriedAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearCollectAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearCollectAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCollectAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainPublishAmt" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalInCompleteAmt" style="background-color: #6fdb65;"></td>
							</tr>
						</tfoot>
						</table>
					</div>
				</div>
			</div>
			<!-- tab 2 -->
			<div class="tab-pane fade" id="tab2">
				<div class="container-fluid h-100" style="padding: 5px;">
					<div class="row" id="leftHeader" style="padding-bottom: 5px;">
						<div class="d-flex align-items-center d-flex">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주년도</label>
							<select class="form-select w-auto h-100 me-3 monthAdjust" id="yearAdjust1">
							</select>
							<input type="text" class="d-none form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
							<!-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-warning bg-gradient">작업진행</label>
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-primary bg-info">작업완료</label> -->
						</div>
						<div class="me-lg-auto"></div>
						<div class="d-flex align-items-center justify-content-end">
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch1"><i class="fa-regular fa-clipboard"></i></button>
							</div>
						</div>
					</div>
					<div class="row">
						<table class="table table-bordered p-0 m-0" id="bizOrderAdmQuarterTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle"><span id="thisYearValQ"></span></th>
									<th class="text-center align-middle">수주</th>
									<th class="text-center align-middle"><span id="beforeCarryQ"></span>이전 계산서발행금액</th>
									<th class="text-center align-middle">이월수주잔액</th>
									<th class="text-center align-middle"><span id="afterCarryQ"></span>계산서발행금액</th>
									<th class="text-center align-middle">수주잔액</th>
									<th class="text-center align-middle"><span id="beforeCollectQ"></span>이전 수금합계</th>
									<th class="text-center align-middle"><span id="thisCollectQ"></span>수금합계</th>
									<th class="text-center align-middle">수금합계</th>
									<th class="text-center align-middle">미수잔액</th>
									<th class="text-center align-middle">미완료잔액</th>
								</tr>
							</thead>
						<tfoot>
							<tr style="background-color: #f8acac; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #f8acac;">소계</td>
								<td id="sumOrdAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumLastYearAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumCarriedAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumThisYearAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumRemainAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumLastYearCollectAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumThisYearCollectAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumCollectAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumRemainPublishAmtQ" style="background-color: #f8acac;"></td>
								<td id="sumInCompleteAmtQ" style="background-color: #f8acac;"></td>
							</tr>
							<tr style="background-color: #6fdb65; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #6fdb65;">총합계</td>
								<td class="text-end align-middle" id="totalOrdAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCarriedAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearCollectAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearCollectAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCollectAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainPublishAmtQ" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalInCompleteAmtQ" style="background-color: #6fdb65;"></td>
							</tr>
						</tfoot>
						</table>
					</div>
					<div style="height:4vh;"></div>
					<hr>
					<div style="height:4vh;"></div>
					<div class="row">
						<table class="table table-bordered p-0 m-0" id="bizOrderAdmHalfTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle"><span id="thisYearValH"></span></th>
									<th class="text-center align-middle">수주</th>
									<th class="text-center align-middle"><span id="beforeCarryH"></span>이전 계산서발행금액</th>
									<th class="text-center align-middle">이월수주잔액</th>
									<th class="text-center align-middle"><span id="afterCarryH"></span>계산서발행금액</th>
									<th class="text-center align-middle">수주잔액</th>
									<th class="text-center align-middle"><span id="beforeCollectH"></span>이전 수금합계</th>
									<th class="text-center align-middle"><span id="thisCollectH"></span>수금합계</th>
									<th class="text-center align-middle">수금합계</th>
									<th class="text-center align-middle">미수잔액</th>
									<th class="text-center align-middle">미완료잔액</th>
								</tr>
							</thead>
						<tfoot>
							<tr style="background-color: #f8acac; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #f8acac;">소계</td>
								<td id="sumOrdAmtH" style="background-color: #f8acac;"></td>
								<td id="sumLastYearAmtH" style="background-color: #f8acac;"></td>
								<td id="sumCarriedAmtH" style="background-color: #f8acac;"></td>
								<td id="sumThisYearAmtH" style="background-color: #f8acac;"></td>
								<td id="sumRemainAmtH" style="background-color: #f8acac;"></td>
								<td id="sumLastYearCollectAmtH" style="background-color: #f8acac;"></td>
								<td id="sumThisYearCollectAmtH" style="background-color: #f8acac;"></td>
								<td id="sumCollectAmtH" style="background-color: #f8acac;"></td>
								<td id="sumRemainPublishAmtH" style="background-color: #f8acac;"></td>
								<td id="sumInCompleteAmtH" style="background-color: #f8acac;"></td>
							</tr>
							<tr style="background-color: #6fdb65; border: 1px solid black;">
								<td class="text-center align-middle" style="background-color: #6fdb65;">합계</td>
								<td class="text-end align-middle" id="totalOrdAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCarriedAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalLastYearCollectAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalThisYearCollectAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalCollectAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalRemainPublishAmtH" style="background-color: #6fdb65;"></td>
								<td class="text-end align-middle" id="totalInCompleteAmtH" style="background-color: #6fdb65;"></td>
							</tr>
						</tfoot>
						</table>
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
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

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

	var remainPubVal = 0;
	var inCompleteVal = 0;
	var remainPubValQ = 0;
	var inCompleteValQ = 0;
	var remainPubValH = 0;
	var inCompleteValH = 0;

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let now = new Date();
	let now_year = now.getFullYear();
	$('#thisYearVal').text(now_year);
	$('#beforeCarry').text(now_year+'년이전 ');
	$('#afterCarry').text(now_year+'년이후 ');
	$('#beforeCollect').text(now_year+'년이전 ');
	$('#thisCollect').text(now_year+'년 ');
	
	$('#thisYearValQ').text(now_year);
	$('#beforeCarryQ').text(now_year+'년이전 ');
	$('#afterCarryQ').text(now_year+'년이후 ');
	$('#beforeCollectQ').text(now_year+'년이전 ');
	$('#thisCollectQ').text(now_year+'년 ');

	$('#thisYearValH').text(now_year);
	$('#beforeCarryH').text(now_year+'년이전 ');
	$('#afterCarryH').text(now_year+'년이후 ');
	$('#beforeCollectH').text(now_year+'년이전 ');
	$('#thisCollectH').text(now_year+'년 ');
	
	// 2005년 부터 올해까지
	for(var i = now_year; i >= 2005; i--){
		if(i == now_year){
			$("#yearAdjust").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
			$("#yearAdjust1").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
		} else {
			$("#yearAdjust").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
			$("#yearAdjust1").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
		}
	}

	$('#yearAdjust').on('change', function(){
		$('#thisYearVal').text($('#yearAdjust').val());
		$('#beforeCarry').text($('#yearAdjust').val()+'년이전 ');
		$('#afterCarry').text($('#yearAdjust').val()+'년이후 ');
		$('#beforeCollect').text($('#yearAdjust').val()+'년이전 ');
		$('#thisCollect').text($('#yearAdjust').val()+'년 ');
		remainPubVal = 0; 
		inCompleteVal = 0;
		
		bizOrderAdmYearMonTable.ajax.reload(function(){});
	});

	$('#yearAdjust1').on('change', function(){
		$('#thisYearValQ').text($('#yearAdjust1').val());
		$('#beforeCarryQ').text($('#yearAdjust1').val()+'년이전 ');
		$('#afterCarryQ').text($('#yearAdjust1').val()+'년이후 ');
		$('#beforeCollectQ').text(yearAdjust1+'년이전 ');
		$('#thisCollectQ').text(yearAdjust1+'년 ');
		remainPubValQ = 0; 
		inCompleteValQ = 0;

		$('#thisYearValH').text($('#yearAdjust1').val());
		$('#beforeCarryH').text($('#yearAdjust1').val()+'년이전 ');
		$('#afterCarryH').text($('#yearAdjust1').val()+'년이후 ');
		$('#beforeCollectH').text(yearAdjust1+'년이전 ');
		$('#thisCollectH').text(yearAdjust1+'년 ');
		remainPubValH = 0; 
		inCompleteValH = 0;

		bizOrderAdmQuarterTable.ajax.reload(function(){});
		bizOrderAdmHalfTable.ajax.reload(function(){});
	});

	$('#bizOrderAdmYearMonTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmYearMonTable thead'); // filter 생성
	let bizOrderAdmYearMonTable = $('#bizOrderAdmYearMonTable').DataTable({
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
//        scrollY: '74vh',
//        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/bizOrderAdmLstGroupByYearMon"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust").val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'yearMon', className : 'text-center align-middle', //연월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(data == '0'){
							return '<span><b>이월미수금</b></span>';
						} else if(data == '1'){
							return '<span><b>이월수주</b></span>';
						} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //수주
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearAmt', className : 'text-end align-middle', //기준년도 이전 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'carriedAmt', className : 'text-end align-middle', //이월수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearAmt', className : 'text-end align-middle', //기준년도 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainAmt', className : 'text-end align-middle', //수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearCollectAmt', className : 'text-end align-middle', // 기준년도 이전 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearCollectAmt', className : 'text-end align-middle', // 기준년도 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'collectAmt', className : 'text-end align-middle', //수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainPublishAmt', className : 'text-end align-middle', //미완료잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['yearMon'] == '0' || row['yearMon'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							remainPubVal = remainPubVal + parseFloat(row['thisYearAmt']) - parseFloat(row['collectAmt']);
							return addCommas(remainPubVal);
						}
					} else {
						return '0';
					}
				}
			},
			{ data: 'inCompleteAmt', className : 'text-end align-middle', //미수잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['yearMon'] == '0' || row['yearMon'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							inCompleteVal = inCompleteVal + parseFloat(row['ordAmt']) - parseFloat(row['collectAmt']);
							return addCommas(inCompleteVal);
						}
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/* {
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}  */
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
			let theadHeight = parseFloat($('#bizOrderAdmYearMonTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#bizOrderAdmYearMonTable tbody tr').eq(0).attr('style', 'background-color: #b4b4b4 !important;');
			$('#bizOrderAdmYearMonTable tbody tr').eq(1).attr('style', 'background-color: #ffe3d3 !important;');
			
 			let data = api.data();

			let sumOrdAmt = 0;
			let sumLastYearAmt = 0;
			let sumCarriedAmt = 0;
			let sumThisYearAmt = 0;
			let sumRemainAmt = 0;
			let sumLastYearCollectAmt = 0;
			let sumThisYearCollectAmt = 0;
			let sumCollectAmt = 0;
			let sumRemainPublishAmt = 0;
			let sumInCompleteAmt = 0;

			let totalOrdAmt = 0;
			let totalLastYearAmt = 0;
			let totalCarriedAmt = 0;
			let totalThisYearAmt = 0;
			let totalRemainAmt = 0;
			let totalLastYearCollectAmt = 0;
			let totalThisYearCollectAmt = 0;
			let totalCollectAmt = 0;
			let totalRemainPublishAmt = 0;
			let totalInCompleteAmt = 0;
			
 			for(var i=0; i<data.length; i++){
				if(!(data[i].yearMon == '0' || data[i].yearMon == '1')){
					sumOrdAmt += parseFloat(data[i].ordAmt);
					sumLastYearAmt += parseFloat(data[i].lastYearAmt);
					sumCarriedAmt += parseFloat(data[i].carriedAmt);
					sumThisYearAmt += parseFloat(data[i].thisYearAmt);
					sumRemainAmt += parseFloat(data[i].remainAmt);
					sumLastYearCollectAmt += parseFloat(data[i].lastYearCollectAmt);
					sumThisYearCollectAmt += parseFloat(data[i].thisYearCollectAmt);
					sumCollectAmt += parseFloat(data[i].collectAmt);
				} else if(data[i].yearMon == '1'){
					totalOrdAmt += parseFloat(data[i].ordAmt);
					totalLastYearAmt += parseFloat(data[i].lastYearAmt);
					totalCarriedAmt += parseFloat(data[i].carriedAmt);
					totalThisYearAmt += parseFloat(data[i].thisYearAmt);
					totalRemainAmt += parseFloat(data[i].remainAmt);
					totalLastYearCollectAmt += parseFloat(data[i].lastYearCollectAmt);
					totalThisYearCollectAmt += parseFloat(data[i].thisYearCollectAmt);
					totalCollectAmt += parseFloat(data[i].collectAmt);
				}
 	 		}
 	 		
 			sumRemainPublishAmt = sumLastYearAmt + sumThisYearAmt - sumCollectAmt;
			sumInCompleteAmt = sumOrdAmt - sumCollectAmt;
			
 			totalOrdAmt += sumOrdAmt;
 			totalLastYearAmt += sumLastYearAmt;
 			totalCarriedAmt += sumCarriedAmt;
 			totalThisYearAmt += sumThisYearAmt;
 			totalRemainAmt += sumRemainAmt;
 			totalLastYearCollectAmt += sumLastYearCollectAmt;
 			totalThisYearCollectAmt += sumThisYearCollectAmt;
 			totalCollectAmt += sumCollectAmt;
 			totalRemainPublishAmt = totalLastYearAmt + totalThisYearAmt - totalCollectAmt;
			totalInCompleteAmt = totalOrdAmt - totalCollectAmt;

 			$('#sumOrdAmt').text(addCommas(sumOrdAmt));
 			$('#sumLastYearAmt').text(addCommas(sumLastYearAmt));
 			$('#sumCarriedAmt').text(addCommas(sumCarriedAmt));
 			$('#sumThisYearAmt').text(addCommas(sumThisYearAmt));
 			$('#sumRemainAmt').text(addCommas(sumRemainAmt));
 			$('#sumLastYearCollectAmt').text(addCommas(sumLastYearCollectAmt));
 			$('#sumThisYearCollectAmt').text(addCommas(sumThisYearCollectAmt));
 			$('#sumCollectAmt').text(addCommas(sumCollectAmt));
 			$('#sumRemainPublishAmt').text(addCommas(sumRemainPublishAmt));
 			$('#sumInCompleteAmt').text(addCommas(sumInCompleteAmt));

 			$('#totalOrdAmt').text(addCommas(totalOrdAmt));
 			$('#totalLastYearAmt').text(addCommas(totalLastYearAmt));
 			$('#totalCarriedAmt').text(addCommas(totalCarriedAmt));
 			$('#totalThisYearAmt').text(addCommas(totalThisYearAmt));
 			$('#totalRemainAmt').text(addCommas(totalRemainAmt));
 			$('#totalLastYearCollectAmt').text(addCommas(totalLastYearCollectAmt));
 			$('#totalThisYearCollectAmt').text(addCommas(totalThisYearCollectAmt));
 			$('#totalCollectAmt').text(addCommas(totalCollectAmt));
 			$('#totalRemainPublishAmt').text(addCommas(totalRemainPublishAmt));
 			$('#totalInCompleteAmt').text(addCommas(totalInCompleteAmt));
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmYearMonTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmYearMonTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmYearMonTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmYearMonTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmYearMonTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//***********************************tab2**************************************//
	
	$('#bizOrderAdmQuarterTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmQuarterTable thead'); // filter 생성
	let bizOrderAdmQuarterTable = $('#bizOrderAdmQuarterTable').DataTable({
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
//        scrollY: '74vh',
//        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/bizOrderAdmLstGroupByQuarter"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust1").val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'quarter', className : 'text-center align-middle', //연월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(data == '0'){
							return '<span><b>이월미수금</b></span>';
						} else if(data == '1'){
							return '<span><b>이월수주</b></span>';
						} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //수주
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearAmt', className : 'text-end align-middle', //기준년도 이전 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'carriedAmt', className : 'text-end align-middle', //이월수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearAmt', className : 'text-end align-middle', //기준년도 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainAmt', className : 'text-end align-middle', //수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearCollectAmt', className : 'text-end align-middle', // 기준년도 이전 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearCollectAmt', className : 'text-end align-middle', // 기준년도 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'collectAmt', className : 'text-end align-middle', //수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainPublishAmt', className : 'text-end align-middle', //미완료잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['quarter'] == '0' || row['quarter'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							remainPubValQ = remainPubValQ + parseFloat(row['thisYearAmt']) - parseFloat(row['collectAmt']);
							return addCommas(remainPubValQ);
						}
					} else {
						return '0';
					}
				}
			},
			{ data: 'inCompleteAmt', className : 'text-end align-middle', //미수잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['quarter'] == '0' || row['quarter'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							inCompleteValQ = inCompleteValQ + parseFloat(row['ordAmt']) - parseFloat(row['collectAmt']);
							return addCommas(inCompleteValQ);
						}
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/* {
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}  */
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
			let theadHeight = parseFloat($('#bizOrderAdmQuarterTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#bizOrderAdmQuarterTable tbody tr').eq(0).attr('style', 'background-color: #b4b4b4 !important;');
			$('#bizOrderAdmQuarterTable tbody tr').eq(1).attr('style', 'background-color: #ffe3d3 !important;');
			
 			let data = api.data();

			let sumOrdAmtQ = 0;
			let sumLastYearAmtQ = 0;
			let sumCarriedAmtQ = 0;
			let sumThisYearAmtQ = 0;
			let sumRemainAmtQ = 0;
			let sumLastYearCollectAmtQ = 0;
			let sumThisYearCollectAmtQ = 0;
			let sumCollectAmtQ = 0;
			let sumRemainPublishAmtQ = 0;
			let sumInCompleteAmtQ = 0;

			let totalOrdAmtQ = 0;
			let totalLastYearAmtQ = 0;
			let totalCarriedAmtQ = 0;
			let totalThisYearAmtQ = 0;
			let totalRemainAmtQ = 0;
			let totalLastYearCollectAmtQ = 0;
			let totalThisYearCollectAmtQ = 0;
			let totalCollectAmtQ = 0;
			let totalRemainPublishAmtQ = 0;
			let totalInCompleteAmtQ = 0;
			
 			for(var i=0; i<data.length; i++){
				if(!(data[i].quarter == '0' || data[i].quarter == '1')){
					sumOrdAmtQ += parseFloat(data[i].ordAmt);
					sumLastYearAmtQ += parseFloat(data[i].lastYearAmt);
					sumCarriedAmtQ += parseFloat(data[i].carriedAmt);
					sumThisYearAmtQ += parseFloat(data[i].thisYearAmt);
					sumRemainAmtQ += parseFloat(data[i].remainAmt);
					sumLastYearCollectAmtQ += parseFloat(data[i].lastYearCollectAmt);
					sumThisYearCollectAmtQ += parseFloat(data[i].thisYearCollectAmt);
					sumCollectAmtQ += parseFloat(data[i].collectAmt);
				} else if(data[i].quarter == '1'){
					totalOrdAmtQ += parseFloat(data[i].ordAmt);
					totalLastYearAmtQ += parseFloat(data[i].lastYearAmt);
					totalCarriedAmtQ += parseFloat(data[i].carriedAmt);
					totalThisYearAmtQ += parseFloat(data[i].thisYearAmt);
					totalRemainAmtQ += parseFloat(data[i].remainAmt);
					totalLastYearCollectAmtQ += parseFloat(data[i].lastYearCollectAmt);
					totalThisYearCollectAmtQ += parseFloat(data[i].thisYearCollectAmt);
					totalCollectAmtQ += parseFloat(data[i].collectAmt);
				}
 	 		}
 	 		
 			sumRemainPublishAmtQ = sumLastYearAmtQ + sumThisYearAmtQ - sumCollectAmtQ;
			sumInCompleteAmtQ = sumOrdAmtQ - sumCollectAmtQ;
			
 			totalOrdAmtQ += sumOrdAmtQ;
 			totalLastYearAmtQ += sumLastYearAmtQ;
 			totalCarriedAmtQ += sumCarriedAmtQ;
 			totalThisYearAmtQ += sumThisYearAmtQ;
 			totalRemainAmtQ += sumRemainAmtQ;
 			totalLastYearCollectAmtQ += sumLastYearCollectAmtQ;
 			totalThisYearCollectAmtQ += sumThisYearCollectAmtQ;
 			totalCollectAmtQ += sumCollectAmtQ;
 			totalRemainPublishAmtQ = totalLastYearAmtQ + totalThisYearAmtQ - totalCollectAmtQ;
			totalInCompleteAmtQ = totalOrdAmtQ - totalCollectAmtQ;

 			$('#sumOrdAmtQ').text(addCommas(sumOrdAmtQ));
 			$('#sumLastYearAmtQ').text(addCommas(sumLastYearAmtQ));
 			$('#sumCarriedAmtQ').text(addCommas(sumCarriedAmtQ));
 			$('#sumThisYearAmtQ').text(addCommas(sumThisYearAmtQ));
 			$('#sumRemainAmtQ').text(addCommas(sumRemainAmtQ));
 			$('#sumLastYearCollectAmtQ').text(addCommas(sumLastYearCollectAmtQ));
 			$('#sumThisYearCollectAmtQ').text(addCommas(sumThisYearCollectAmtQ));
 			$('#sumCollectAmtQ').text(addCommas(sumCollectAmtQ));
 			$('#sumRemainPublishAmtQ').text(addCommas(sumRemainPublishAmtQ));
 			$('#sumInCompleteAmtQ').text(addCommas(sumInCompleteAmtQ));

 			$('#totalOrdAmtQ').text(addCommas(totalOrdAmtQ));
 			$('#totalLastYearAmtQ').text(addCommas(totalLastYearAmtQ));
 			$('#totalCarriedAmtQ').text(addCommas(totalCarriedAmtQ));
 			$('#totalThisYearAmtQ').text(addCommas(totalThisYearAmtQ));
 			$('#totalRemainAmtQ').text(addCommas(totalRemainAmtQ));
 			$('#totalLastYearCollectAmtQ').text(addCommas(totalLastYearCollectAmtQ));
 			$('#totalThisYearCollectAmtQ').text(addCommas(totalThisYearCollectAmtQ));
 			$('#totalCollectAmtQ').text(addCommas(totalCollectAmtQ));
 			$('#totalRemainPublishAmtQ').text(addCommas(totalRemainPublishAmtQ));
 			$('#totalInCompleteAmtQ').text(addCommas(totalInCompleteAmtQ));
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmQuarterTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmQuarterTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmQuarterTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmQuarterTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmQuarterTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//***********************************tab3**************************************//
	
	$('#bizOrderAdmHalfTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmHalfTable thead'); // filter 생성
	let bizOrderAdmHalfTable = $('#bizOrderAdmHalfTable').DataTable({
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
//        scrollY: '74vh',
//        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/bizOrderAdmLstGroupByHalf"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust1").val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'half', className : 'text-center align-middle', //연월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(data == '0'){
							return '<span><b>이월미수금</b></span>';
						} else if(data == '1'){
							return '<span><b>이월수주</b></span>';
						} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //수주
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearAmt', className : 'text-end align-middle', //기준년도 이전 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'carriedAmt', className : 'text-end align-middle', //이월수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearAmt', className : 'text-end align-middle', //기준년도 계산서발행액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainAmt', className : 'text-end align-middle', //수주잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'lastYearCollectAmt', className : 'text-end align-middle', // 기준년도 이전 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'thisYearCollectAmt', className : 'text-end align-middle', // 기준년도 수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'collectAmt', className : 'text-end align-middle', //수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'remainPublishAmt', className : 'text-end align-middle', //미완료잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['quarter'] == '0' || row['quarter'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							remainPubValH = remainPubValH + parseFloat(row['thisYearAmt']) - parseFloat(row['collectAmt']);
							return addCommas(remainPubValH);
						}
					} else {
						return '0';
					}
				}
			},
			{ data: 'inCompleteAmt', className : 'text-end align-middle', //미수잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						if(row['half'] == '0' || row['half'] == '1'){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						}else {
							inCompleteValH = inCompleteValH + parseFloat(row['ordAmt']) - parseFloat(row['collectAmt']);
							return addCommas(inCompleteValH);
						}
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/* {
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}  */
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
			let theadHeight = parseFloat($('#bizOrderAdmHalfTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#bizOrderAdmHalfTable tbody tr').eq(0).attr('style', 'background-color: #b4b4b4 !important;');
			$('#bizOrderAdmHalfTable tbody tr').eq(1).attr('style', 'background-color: #ffe3d3 !important;');
			
 			let data = api.data();

			let sumOrdAmtH = 0;
			let sumLastYearAmtH = 0;
			let sumCarriedAmtH = 0;
			let sumThisYearAmtH = 0;
			let sumRemainAmtH = 0;
			let sumLastYearCollectAmtH = 0;
			let sumThisYearCollectAmtH = 0;
			let sumCollectAmtH = 0;
			let sumRemainPublishAmtH = 0;
			let sumInCompleteAmtH = 0;

			let totalOrdAmtH = 0;
			let totalLastYearAmtH = 0;
			let totalCarriedAmtH = 0;
			let totalThisYearAmtH = 0;
			let totalRemainAmtH = 0;
			let totalLastYearCollectAmtH = 0;
			let totalThisYearCollectAmtH = 0;
			let totalCollectAmtH = 0;
			let totalRemainPublishAmtH = 0;
			let totalInCompleteAmtH = 0;
			
 			for(var i=0; i<data.length; i++){
				if(!(data[i].half == '0' || data[i].half == '1')){
					sumOrdAmtH += parseFloat(data[i].ordAmt);
					sumLastYearAmtH += parseFloat(data[i].lastYearAmt);
					sumCarriedAmtH += parseFloat(data[i].carriedAmt);
					sumThisYearAmtH += parseFloat(data[i].thisYearAmt);
					sumRemainAmtH += parseFloat(data[i].remainAmt);
					sumLastYearCollectAmtH += parseFloat(data[i].lastYearCollectAmt);
					sumThisYearCollectAmtH += parseFloat(data[i].thisYearCollectAmt);
					sumCollectAmtH += parseFloat(data[i].collectAmt);
				} else if(data[i].half == '1'){
					totalOrdAmtH += parseFloat(data[i].ordAmt);
					totalLastYearAmtH += parseFloat(data[i].lastYearAmt);
					totalCarriedAmtH += parseFloat(data[i].carriedAmt);
					totalThisYearAmtH += parseFloat(data[i].thisYearAmt);
					totalRemainAmtH += parseFloat(data[i].remainAmt);
					totalLastYearCollectAmtH += parseFloat(data[i].lastYearCollectAmt);
					totalThisYearCollectAmtH += parseFloat(data[i].thisYearCollectAmt);
					totalCollectAmtH += parseFloat(data[i].collectAmt);
				}
 	 		}
 	 		
 			sumRemainPublishAmtH = sumLastYearAmtH + sumThisYearAmtH - sumCollectAmtH;
			sumInCompleteAmtH = sumOrdAmtH - sumCollectAmtH;
			
 			totalOrdAmtH += sumOrdAmtH;
 			totalLastYearAmtH += sumLastYearAmtH;
 			totalCarriedAmtH += sumCarriedAmtH;
 			totalThisYearAmtH += sumThisYearAmtH;
 			totalRemainAmtH += sumRemainAmtH;
 			totalLastYearCollectAmtH += sumLastYearCollectAmtH;
 			totalThisYearCollectAmtH += sumThisYearCollectAmtH;
 			totalCollectAmtH += sumCollectAmtH;
 			totalRemainPublishAmtH = totalLastYearAmtH + totalThisYearAmtH - totalCollectAmtH;
			totalInCompleteAmtH = totalOrdAmtH - totalCollectAmtH;

 			$('#sumOrdAmtH').text(addCommas(sumOrdAmtH));
 			$('#sumLastYearAmtH').text(addCommas(sumLastYearAmtH));
 			$('#sumCarriedAmtH').text(addCommas(sumCarriedAmtH));
 			$('#sumThisYearAmtH').text(addCommas(sumThisYearAmtH));
 			$('#sumRemainAmtH').text(addCommas(sumRemainAmtH));
 			$('#sumLastYearCollectAmtH').text(addCommas(sumLastYearCollectAmtH));
 			$('#sumThisYearCollectAmtH').text(addCommas(sumThisYearCollectAmtH));
 			$('#sumCollectAmtH').text(addCommas(sumCollectAmtH));
 			$('#sumRemainPublishAmtH').text(addCommas(sumRemainPublishAmtH));
 			$('#sumInCompleteAmtH').text(addCommas(sumInCompleteAmtH));

 			$('#totalOrdAmtH').text(addCommas(totalOrdAmtH));
 			$('#totalLastYearAmtH').text(addCommas(totalLastYearAmtH));
 			$('#totalCarriedAmtH').text(addCommas(totalCarriedAmtH));
 			$('#totalThisYearAmtH').text(addCommas(totalThisYearAmtH));
 			$('#totalRemainAmtH').text(addCommas(totalRemainAmtH));
 			$('#totalLastYearCollectAmtH').text(addCommas(totalLastYearCollectAmtH));
 			$('#totalThisYearCollectAmtH').text(addCommas(totalThisYearCollectAmtH));
 			$('#totalCollectAmtH').text(addCommas(totalCollectAmtH));
 			$('#totalRemainPublishAmtH').text(addCommas(totalRemainPublishAmtH));
 			$('#totalInCompleteAmtH').text(addCommas(totalInCompleteAmtH));
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmHalfTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmHalfTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmHalfTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmHalfTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmHalfTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#tab1Nav').on('click', function(){
		remainPubVal = 0; 
		inCompleteVal = 0;
		setTimeout(function() {
			bizOrderAdmYearMonTable.ajax.reload(function() { });
		}, 100)
	});

	$('#tab2Nav').on('click', function(){
		remainPubValQ = 0; 
		inCompleteValQ = 0;
		remainPubValH = 0; 
		inCompleteValH = 0;
		setTimeout(function() {
			bizOrderAdmQuarterTable.ajax.reload(function() { });
			bizOrderAdmHalfTable.ajax.reload(function() { });
		}, 100)
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		remainPubVal = 0; 
		inCompleteVal = 0;
		bizOrderAdmYearMonTable.ajax.reload(function() { });

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 조회 버튼 click
	$('#btnSearch1').on('click', function() {
		remainPubValQ = 0; 
		inCompleteValQ = 0;
		remainPubValH = 0; 
		inCompleteValH = 0;
		
		$('#my-spinner').show();
		bizOrderAdmQuarterTable.ajax.reload(function() { });
		bizOrderAdmHalfTable.ajax.reload(function() { });
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	
</script>

</body>
</html>
