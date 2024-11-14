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
			<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1" style="border-left:1px solid white; border-top:1px solid white; border-right:1px solid white;">거래처별</button>
			<button class="nav-link" id="tab2Nav" data-bs-toggle="tab" data-bs-target="#tab2" style="border-left:1px solid white; border-top:1px solid white; border-right:1px solid white;">장비유형별</button>
	  	</div>
	  	<div class="tab-content" id="nav-tabContent">
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
						<table class="table table-bordered p-0 m-0" id="bizOrderAdmDealCorpTable">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">거래처명</th>
									<th class="text-center align-middle">최초수주액</th>
									<th class="text-center align-middle"><span id="beforeCarry"></span>이전 계산서발행액</th>
									<th class="text-center align-middle">이월수주잔액</th>
									<th class="text-center align-middle"><span id="afterCarry"></span>이후 계산서발행액</th>
									<th class="text-center align-middle">수주잔액</th>
									<th class="text-center align-middle">수금합계</th>
									<th class="text-center align-middle">만기미도래 어음</th>
									<th class="text-center align-middle">미수잔액</th>
									<th class="text-center align-middle">미완료잔액</th>
								</tr>
							</thead>
						<tfoot>
							<tr style="background-color: #6fdb65; border: 1px solid black;">
								<td style="background-color: #6fdb65;">총합계</td>
								<td id="totalOrdAmt" style="background-color: #6fdb65;"></td>
								<td id="totalLastYearAmt" style="background-color: #6fdb65;"></td>
								<td id="totalCarriedAmt" style="background-color: #6fdb65;"></td>
								<td id="totalThisYearAmt" style="background-color: #6fdb65;"></td>
								<td id="totalRemainAmt" style="background-color: #6fdb65;"></td>
								<td id="totalCollectAmt" style="background-color: #6fdb65;"></td>
								<td id="totalNoteCollectAmt" style="background-color: #6fdb65;"></td>
								<td id="totalRemainPublishAmt" style="background-color: #6fdb65;"></td>
								<td id="totalInCompleteAmt" style="background-color: #6fdb65;"></td>
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
						<table class="table table-bordered p-0 m-0" id="bizOrderAdmGoodsTypeTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle" style="min-width:70px;">장비유형명</th>
									<th class="text-center align-middle">최초수주액</th>
									<th class="text-center align-middle"><span id="beforeCarry1"></span> 계산서발행액</th>
									<th class="text-center align-middle">이월수주잔액</th>
									<th class="text-center align-middle"><span id="afterCarry1"></span> 계산서발행액</th>
									<th class="text-center align-middle">수주잔액</th>
									<th class="text-center align-middle">수금합계</th>
									<th class="text-center align-middle">만기미도래 어음</th>
									<th class="text-center align-middle">미수잔액</th>
									<th class="text-center align-middle">미완료잔액</th>
								</tr>
							</thead>
						<tfoot>
							<tr style="background-color: #6fdb65; border: 1px solid black;">
								<td style="background-color: #6fdb65;">총합계</td>
								<td id="totalOrdAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalLastYearAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalCarriedAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalThisYearAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalRemainAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalCollectAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalNoteCollectAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalRemainPublishAmt1" style="background-color: #6fdb65;"></td>
								<td id="totalInCompleteAmt1" style="background-color: #6fdb65;"></td>
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

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let now = new Date();
	let now_year = now.getFullYear();
	$('#beforeCarry').text(now_year+'년이전 ');
	$('#afterCarry').text(now_year+'년이후 ');
	$('#beforeCarry1').text(now_year+'년이전 ');
	$('#afterCarry1').text(now_year+'년이후 ');
	
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
		$('#beforeCarry').text($('#yearAdjust').val()+'년이전 ');
		$('#afterCarry').text($('#yearAdjust').val()+'년이후 ');

		bizOrderAdmDealCorpTable.ajax.reload(function(){
			setTimeout(function(){
				myCallBack();
			}, 100);
		});
	});

	$('#yearAdjust1').on('change', function(){
		$('#beforeCarry1').text($('#yearAdjust1').val()+'년이전 ');
		$('#afterCarry1').text($('#yearAdjust1').val()+'년이후 ');

		bizOrderAdmGoodsTypeTable.ajax.reload(function(){
			setTimeout(function(){
				myCallBack1();
			}, 100);
		});
	});
	

//	$('#bizOrderAdmDealCorpTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmDealCorpTable thead'); // filter 생성
	let bizOrderAdmDealCorpTable = $('#bizOrderAdmDealCorpTable').DataTable({
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
        scrollY: '79vh',
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
			url : '<c:url value="/bs/bizOrderAdmLstGroupByDealCorp"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust").val(); },
				'nowDate'	: function() { return moment(now).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealCorpNm', className : 'text-center align-middle', //거래처명
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //최초수주액
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
			{ data: 'thisYearAmt', className : 'text-end align-middle', //기준년도 이전 계산서발행액
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
			{ data: 'collectAmt', className : 'text-end align-middle', //수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'noteCollectAmt', className : 'text-end align-middle', //만기미도래 어음
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'remainPublishAmt', className : 'text-end align-middle', //미수잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'inCompleteAmt', className : 'text-end align-middle', //미완료잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
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
			let theadHeight = parseFloat($('#bizOrderAdmDealCorpTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			let data = api.data();

			let totalOrdAmt = 0;
			let totalLastYearAmt = 0;
			let totalCarriedAmt = 0;
			let totalThisYearAmt = 0;
			let totalRemainAmt = 0;
			let totalCollectAmt = 0;
			let totalNoteCollectAmt = 0;
			let totalRemainPublishAmt = 0;
			let totalInCompleteAmt = 0;

			for(var i=0; i<data.length; i++){
				totalOrdAmt += parseInt(data[i].ordAmt);         
				totalLastYearAmt += parseInt(data[i].lastYearAmt);       
				totalCarriedAmt += parseInt(data[i].carriedAmt);        
				totalThisYearAmt += parseInt(data[i].thisYearAmt);       
				totalRemainAmt += parseInt(data[i].remainAmt);         
				totalCollectAmt += parseInt(data[i].collectAmt);        
				totalNoteCollectAmt += parseInt(data[i].noteCollectAmt);    
				totalRemainPublishAmt += parseInt(data[i].remainPublishAmt);  
				totalInCompleteAmt += parseInt(data[i].inCompleteAmt);     
			}

			$('#totalOrdAmt').text(addCommas(totalOrdAmt));
			$('#totalLastYearAmt').text(addCommas(totalLastYearAmt));
			$('#totalCarriedAmt').text(addCommas(totalCarriedAmt));
			$('#totalThisYearAmt').text(addCommas(totalThisYearAmt));
			$('#totalRemainAmt').text(addCommas(totalRemainAmt));
			$('#totalCollectAmt').text(addCommas(totalCollectAmt));
			$('#totalNoteCollectAmt').text(addCommas(totalNoteCollectAmt));
			$('#totalRemainPublishAmt').text(addCommas(totalRemainPublishAmt));
			$('#totalInCompleteAmt').text(addCommas(totalInCompleteAmt));
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmDealCorpTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmDealCorpTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			
			setTimeout(function(){
				myCallBack();
				$('#bizOrderAdmDealCorpTable tfoot').remove();
			},100);
		},
	});
	// dataTable colReorder event
	bizOrderAdmDealCorpTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmDealCorpTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmDealCorpTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	function myCallBack(){
		var cOrdAmt = 0;
		var cLastYearAmt = 0;
		var cCarriedAmt = 0;
		var cThisYearAmt = 0;
		var cRemainAmt = 0;
		var cCollectAmt = 0;
		var cNoteCollectAmt = 0;
		var cRemainPublishAmt = 0;
		var cInCompleteAtm = 0;

		var ncOrdAmt = 0;
		var ncLastYearAmt = 0;
		var ncCarriedAmt = 0;
		var ncThisYearAmt = 0;
		var ncRemainAmt = 0;
		var ncCollectAmt = 0;
		var ncNoteCollectAmt = 0;
		var ncRemainPublishAmt = 0;
		var ncInCompleteAtm = 0;

		var tyOrdAmt = 0;
		var tyLastYearAmt = 0;
		var tyCarriedAmt = 0;
		var tyThisYearAmt = 0;
		var tyRemainAmt = 0;
		var tyCollectAmt = 0;
		var tyNoteCollectAmt = 0;
		var tyRemainPublishAmt = 0;
		var tyInCompleteAmt = 0;

		for(var i=0; i<bizOrderAdmDealCorpTable.data().length; i++){
			if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'C'){
				cOrdAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().ordAmt);
				cLastYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().lastYearAmt);
				cCarriedAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().carriedAmt);
				cThisYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().thisYearAmt);
				cRemainAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainAmt);
				cCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().collectAmt);
				cNoteCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().noteCollectAmt);
				cRemainPublishAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainPublishAmt);
				cInCompleteAtm += parseInt(bizOrderAdmDealCorpTable.row(i).data().inCompleteAmt);
			} else if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'NC'){
				ncOrdAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().ordAmt);
				ncLastYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().lastYearAmt);
				ncCarriedAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().carriedAmt);
				ncThisYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().thisYearAmt);
				ncRemainAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainAmt);
				ncCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().collectAmt);
				ncNoteCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().noteCollectAmt);
				ncRemainPublishAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainPublishAmt);
				ncInCompleteAtm += parseInt(bizOrderAdmDealCorpTable.row(i).data().inCompleteAmt);
			} else if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'TY'){
				tyOrdAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().ordAmt);
				tyLastYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().lastYearAmt);
				tyCarriedAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().carriedAmt);
				tyThisYearAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().thisYearAmt);
				tyRemainAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainAmt);
				tyCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().collectAmt);
				tyNoteCollectAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().noteCollectAmt);
				tyRemainPublishAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().remainPublishAmt);
				tyInCompleteAmt += parseInt(bizOrderAdmDealCorpTable.row(i).data().inCompleteAmt);
			}
			
		}

		let html = '';
		html += '<tr id="cTr">';
		html += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnCShow">';
		html += '			<i id="cI" class="fa-solid fa-minus"></i>';
		html += '		</button>';
		html += '	이월미수금</th>';
		html += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html += '</tr>';
		html += '<tr id="cSum">';
		html += '	<td class="text-center align-middle" style="background-color:#f8acac;">이월미수금 요약</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cOrdAmt">'+addCommas(parseFloat(cOrdAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cLastYearAmt">'+addCommas(parseFloat(cLastYearAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cCarriedAmt">'+addCommas(parseFloat(cCarriedAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cThisYearAmt">'+addCommas(parseFloat(cThisYearAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cRemainAmt">'+addCommas(parseFloat(cRemainAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cCollectAmt">'+addCommas(parseFloat(cCollectAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cNoteCollectAmt">'+addCommas(parseFloat(cNoteCollectAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cRemainPublishAmt">'+addCommas(parseFloat(cRemainPublishAmt))+'</td>';
		html += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cInCompleteAtm">'+addCommas(parseFloat(cInCompleteAtm))+'</td>';
		html += '</tr>';
		
		$(bizOrderAdmDealCorpTable.row(0).node()).before(html);
		
		let html1 = '';
		html1 += '<tr id="ncTr">';
		html1 += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html1 += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnNcShow">';
		html1 += '			<i id="ncI" class="fa-solid fa-minus"></i>';
		html1 += '		</button>';
		html1 += '	이월수주</td>';
		html1 += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html1 += '</tr>';
		html1 += '<tr id="ncSum">';
		html1 += '	<td class="text-center align-middle" style="background-color:#f8acac;">이월수주 요약</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncOrdAmt">'+addCommas(parseFloat(ncOrdAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncLastYearAmt">'+addCommas(parseFloat(ncLastYearAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncCarriedAmt">'+addCommas(parseFloat(ncCarriedAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncThisYearAmt">'+addCommas(parseFloat(ncThisYearAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncRemainAmt">'+addCommas(parseFloat(ncRemainAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncCollectAmt">'+addCommas(parseFloat(ncCollectAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncNoteCollectAmt">'+addCommas(parseFloat(ncNoteCollectAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncRemainPublishAmt">'+addCommas(parseFloat(ncRemainPublishAmt))+'</td>';
		html1 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncInCompleteAtm">'+addCommas(parseFloat(ncInCompleteAtm))+'</td>';
		html1 += '</tr>';

		$(bizOrderAdmDealCorpTable.row(0).node()).before(html1);

		let html2 = '';
		html2 += '<tr id="tyTr">';
		html2 += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html2 += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnTyShow">';
		html2 += '			<i id="tyI" class="fa-solid fa-minus"></i>';
		html2 += '		</button>';
		html2 += '	'+now_year+'수주</th>';
		html2 += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html2 += '</tr>';
		html2 += '<tr id="tySum">';
		html2 += '	<td class="text-center align-middle" style="background-color:#f8acac;">'+now_year+'수주 요약</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyOrdAmt">'+addCommas(parseFloat(tyOrdAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyLastYearAmt">'+addCommas(parseFloat(tyLastYearAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyCarriedAmt">'+addCommas(parseFloat(tyCarriedAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyThisYearAmt">'+addCommas(parseFloat(tyThisYearAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyRemainAmt">'+addCommas(parseFloat(tyRemainAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyCollectAmt">'+addCommas(parseFloat(tyCollectAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyNoteCollectAmt">'+addCommas(parseFloat(tyNoteCollectAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyRemainPublishAmt">'+addCommas(parseFloat(tyRemainPublishAmt))+'</td>';
		html2 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyInCompleteAmt">'+addCommas(parseFloat(tyInCompleteAmt))+'</td>';
		html2 += '</tr>';

		$(bizOrderAdmDealCorpTable.row(0).node()).before(html2);

		for(var i=0; i<bizOrderAdmDealCorpTable.data().length; i++){
			if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'C'){
				$(bizOrderAdmDealCorpTable.row(i).node()).attr('name', 'C');
				var thisRow = document.getElementById('cTr');
				$(thisRow).after(bizOrderAdmDealCorpTable.row(i).node());
				
			} else if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'NC'){
				$(bizOrderAdmDealCorpTable.row(i).node()).attr('name', 'NC');
				var thisRow = document.getElementById('ncTr');
				$(thisRow).after(bizOrderAdmDealCorpTable.row(i).node());
				
			} else if(bizOrderAdmDealCorpTable.row(i).data().gubun == 'TY'){
				$(bizOrderAdmDealCorpTable.row(i).node()).attr('name', 'TY');
				var thisRow = document.getElementById('tyTr');
				$(thisRow).after(bizOrderAdmDealCorpTable.row(i).node());
				
			}
		}

		$('#bizOrderAdmDealCorpTable tfoot').remove();
		$('.filter').attr('disabled', true);
	}

	$(document).on('click', '#btnCShow', function(){
		if($('#cI').attr('class') == 'fa-solid fa-minus'){
			$('[name=C]').addClass('d-none');
			$('#cSum').addClass('d-none');
			$('#cI').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=C]').removeClass('d-none');
			$('#cSum').removeClass('d-none');
			$('#cI').attr('class', 'fa-solid fa-minus');
		}
	});

	$(document).on('click', '#btnNcShow', function(){
		if($('#ncI').attr('class') == 'fa-solid fa-minus'){
			$('[name=NC]').addClass('d-none');
			$('#ncSum').addClass('d-none');
			$('#ncI').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=NC]').removeClass('d-none');
			$('#ncSum').removeClass('d-none');
			$('#ncI').attr('class', 'fa-solid fa-minus');
		}
	});

	$(document).on('click', '#btnTyShow', function(){
		if($('#tyI').attr('class') == 'fa-solid fa-minus'){
			$('[name=TY]').addClass('d-none');
			$('#tySum').addClass('d-none');
			$('#tyI').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=TY]').removeClass('d-none');
			$('#tySum').removeClass('d-none');
			$('#tyI').attr('class', 'fa-solid fa-minus');
		}
	});

	//***********************************tab2**************************************//
	
//	$('#bizOrderAdmGoodsTypeTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmGoodsTypeTable thead'); // filter 생성
	let bizOrderAdmGoodsTypeTable = $('#bizOrderAdmGoodsTypeTable').DataTable({
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
        scrollY: '79vh',
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
			url : '<c:url value="/bs/bizOrderAdmLstGroupByGoodsType"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust1").val(); },
				'nowDate'	: function() { return moment(now).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'goodsTypeNm', className : 'text-center align-middle', //장비유형명
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //최초수주액
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
			{ data: 'thisYearAmt', className : 'text-end align-middle', //기준년도 이전 계산서발행액
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
			{ data: 'collectAmt', className : 'text-end align-middle', //수금합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'noteCollectAmt', className : 'text-end align-middle', //만기미도래 어음
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'remainPublishAmt', className : 'text-end align-middle', //미수잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'inCompleteAmt', className : 'text-end align-middle', //미완료잔액
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
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
			let theadHeight = parseFloat($('#bizOrderAdmGoodsTypeTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			let data = api.data();

			let totalOrdAmt = 0;
			let totalLastYearAmt = 0;
			let totalCarriedAmt = 0;
			let totalThisYearAmt = 0;
			let totalRemainAmt = 0;
			let totalCollectAmt = 0;
			let totalNoteCollectAmt = 0;
			let totalRemainPublishAmt = 0;
			let totalInCompleteAmt = 0;

			for(var i=0; i<data.length; i++){
				totalOrdAmt += parseInt(data[i].ordAmt);         
				totalLastYearAmt += parseInt(data[i].lastYearAmt);       
				totalCarriedAmt += parseInt(data[i].carriedAmt);        
				totalThisYearAmt += parseInt(data[i].thisYearAmt);       
				totalRemainAmt += parseInt(data[i].remainAmt);         
				totalCollectAmt += parseInt(data[i].collectAmt);        
				totalNoteCollectAmt += parseInt(data[i].noteCollectAmt);    
				totalRemainPublishAmt += parseInt(data[i].remainPublishAmt);  
				totalInCompleteAmt += parseInt(data[i].inCompleteAmt);     
			}

			$('#totalOrdAmt1').text(addCommas(totalOrdAmt));
			$('#totalLastYearAmt1').text(addCommas(totalLastYearAmt));
			$('#totalCarriedAmt1').text(addCommas(totalCarriedAmt));
			$('#totalThisYearAmt1').text(addCommas(totalThisYearAmt));
			$('#totalRemainAmt1').text(addCommas(totalRemainAmt));
			$('#totalCollectAmt1').text(addCommas(totalCollectAmt));
			$('#totalNoteCollectAmt1').text(addCommas(totalNoteCollectAmt));
			$('#totalRemainPublishAmt1').text(addCommas(totalRemainPublishAmt));
			$('#totalInCompleteAmt1').text(addCommas(totalInCompleteAmt));
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmGoodsTypeTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmGoodsTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
//			$('.filters').attr('disabled', true);
			
			setTimeout(function(){
				myCallBack1();
				$('#bizOrderAdmGoodsTypeTable tfoot').remove();
			},150);
		},
	});
	// dataTable colReorder event
	bizOrderAdmGoodsTypeTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmGoodsTypeTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmGoodsTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	function myCallBack1(){
		var cOrdAmt = 0;
		var cLastYearAmt = 0;
		var cCarriedAmt = 0;
		var cThisYearAmt = 0;
		var cRemainAmt = 0;
		var cCollectAmt = 0;
		var cNoteCollectAmt = 0;
		var cRemainPublishAmt = 0;
		var cInCompleteAtm = 0;

		var ncOrdAmt = 0;
		var ncLastYearAmt = 0;
		var ncCarriedAmt = 0;
		var ncThisYearAmt = 0;
		var ncRemainAmt = 0;
		var ncCollectAmt = 0;
		var ncNoteCollectAmt = 0;
		var ncRemainPublishAmt = 0;
		var ncInCompleteAtm = 0;

		var tyOrdAmt = 0;
		var tyLastYearAmt = 0;
		var tyCarriedAmt = 0;
		var tyThisYearAmt = 0;
		var tyRemainAmt = 0;
		var tyCollectAmt = 0;
		var tyNoteCollectAmt = 0;
		var tyRemainPublishAmt = 0;
		var tyInCompleteAmt = 0;

		for(var i=0; i<bizOrderAdmGoodsTypeTable.data().length; i++){
			if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'C'){
				cOrdAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().ordAmt);
				cLastYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().lastYearAmt);
				cCarriedAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().carriedAmt);
				cThisYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().thisYearAmt);
				cRemainAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainAmt);
				cCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().collectAmt);
				cNoteCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().noteCollectAmt);
				cRemainPublishAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainPublishAmt);
				cInCompleteAtm += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().inCompleteAmt);
			} else if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'NC'){
				ncOrdAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().ordAmt);
				ncLastYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().lastYearAmt);
				ncCarriedAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().carriedAmt);
				ncThisYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().thisYearAmt);
				ncRemainAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainAmt);
				ncCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().collectAmt);
				ncNoteCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().noteCollectAmt);
				ncRemainPublishAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainPublishAmt);
				ncInCompleteAtm += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().inCompleteAmt);
			} else if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'TY'){
				tyOrdAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().ordAmt);
				tyLastYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().lastYearAmt);
				tyCarriedAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().carriedAmt);
				tyThisYearAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().thisYearAmt);
				tyRemainAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainAmt);
				tyCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().collectAmt);
				tyNoteCollectAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().noteCollectAmt);
				tyRemainPublishAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().remainPublishAmt);
				tyInCompleteAmt += parseInt(bizOrderAdmGoodsTypeTable.row(i).data().inCompleteAmt);
			}
			
		}

		let html3 = '';
		html3 += '<tr id="cTr1">';
		html3 += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html3 += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnCShow1">';
		html3 += '			<i id="cI1" class="fa-solid fa-minus"></i>';
		html3 += '		</button>';
		html3 += '	이월미수금</th>';
		html3 += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html3 += '</tr>';
		html3 += '<tr id="cSum1">';
		html3 += '	<td class="text-center align-middle" style="background-color:#f8acac;">이월미수금 요약</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cOrdAmt1">'+addCommas(parseFloat(cOrdAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cLastYearAmt1">'+addCommas(parseFloat(cLastYearAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cCarriedAmt1">'+addCommas(parseFloat(cCarriedAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cThisYearAmt1">'+addCommas(parseFloat(cThisYearAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cRemainAmt1">'+addCommas(parseFloat(cRemainAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cCollectAmt1">'+addCommas(parseFloat(cCollectAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cNoteCollectAmt1">'+addCommas(parseFloat(cNoteCollectAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cRemainPublishAmt1">'+addCommas(parseFloat(cRemainPublishAmt))+'</td>';
		html3 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="cInCompleteAtm1">'+addCommas(parseFloat(cInCompleteAtm))+'</td>';
		html3 += '</tr>';
		
		$(bizOrderAdmGoodsTypeTable.row(0).node()).before(html3);
		
		let html4 = '';
		html4 += '<tr id="ncTr1">';
		html4 += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html4 += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnNcShow1">';
		html4 += '			<i id="ncI1" class="fa-solid fa-minus"></i>';
		html4 += '		</button>';
		html4 += '	이월수주</td>';
		html4 += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html4 += '</tr>';
		html4 += '<tr id="ncSum1">';
		html4 += '	<td class="text-center align-middle" style="background-color:#f8acac;">이월수주 요약</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncOrdAmt1">'+addCommas(parseFloat(ncOrdAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncLastYearAmt1">'+addCommas(parseFloat(ncLastYearAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncCarriedAmt1">'+addCommas(parseFloat(ncCarriedAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncThisYearAmt1">'+addCommas(parseFloat(ncThisYearAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncRemainAmt1">'+addCommas(parseFloat(ncRemainAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncCollectAmt1">'+addCommas(parseFloat(ncCollectAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncNoteCollectAmt1">'+addCommas(parseFloat(ncNoteCollectAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncRemainPublishAmt1">'+addCommas(parseFloat(ncRemainPublishAmt))+'</td>';
		html4 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="ncInCompleteAtm1">'+addCommas(parseFloat(ncInCompleteAtm))+'</td>';
		html4 += '</tr>';

		$(bizOrderAdmGoodsTypeTable.row(0).node()).before(html4);

		let html5 = '';
		html5 += '<tr id="tyTr1">';
		html5 += '	<td class="text-start align-middle" style="background-color:#aed3ec;">';
		html5 += '		<button type="button" class="btn btn-outline-light w-auto" style="font-size: 8px !important;" id="btnTyShow1">';
		html5 += '			<i id="tyI1" class="fa-solid fa-minus"></i>';
		html5 += '		</button>';
		html5 += '	'+now_year+'수주</th>';
		html5 += '	<td colspan="9" class="text-center align-middle" style="background-color:#aed3ec"></td>';
		html5 += '</tr>';
		html5 += '<tr id="tySum1">';
		html5 += '	<td class="text-center align-middle" style="background-color:#f8acac;">'+now_year+'수주 요약</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyOrdAmt1">'+addCommas(parseFloat(tyOrdAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyLastYearAmt1">'+addCommas(parseFloat(tyLastYearAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyCarriedAmt1">'+addCommas(parseFloat(tyCarriedAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyThisYearAmt1">'+addCommas(parseFloat(tyThisYearAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyRemainAmt1">'+addCommas(parseFloat(tyRemainAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyCollectAmt1">'+addCommas(parseFloat(tyCollectAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyNoteCollectAmt1">'+addCommas(parseFloat(tyNoteCollectAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyRemainPublishAmt1">'+addCommas(parseFloat(tyRemainPublishAmt))+'</td>';
		html5 += '	<td class="text-end align-middle" style="background-color:#f8acac;" id="tyInCompleteAmt1">'+addCommas(parseFloat(tyInCompleteAmt))+'</td>';
		html5 += '</tr>';

		$(bizOrderAdmGoodsTypeTable.row(0).node()).before(html5);

		for(var i=0; i<bizOrderAdmGoodsTypeTable.data().length; i++){
			if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'C'){
				$(bizOrderAdmGoodsTypeTable.row(i).node()).attr('name', 'C');
				var thisRow = document.getElementById('cTr1');
				$(thisRow).after(bizOrderAdmGoodsTypeTable.row(i).node());
				
			} else if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'NC'){
				$(bizOrderAdmGoodsTypeTable.row(i).node()).attr('name', 'NC');
				var thisRow = document.getElementById('ncTr1');
				$(thisRow).after(bizOrderAdmGoodsTypeTable.row(i).node());
				
			} else if(bizOrderAdmGoodsTypeTable.row(i).data().gubun == 'TY'){
				$(bizOrderAdmGoodsTypeTable.row(i).node()).attr('name', 'TY');
				var thisRow = document.getElementById('tyTr1');
				$(thisRow).after(bizOrderAdmGoodsTypeTable.row(i).node());
				
			}
		}
		
		$('#bizOrderAdmGoodsTypeTable tfoot').remove();
	}

	$(document).on('click', '#btnCShow1', function(){
		if($('#cI1').attr('class') == 'fa-solid fa-minus'){
			$('[name=C]').addClass('d-none');
			$('#cSum1').addClass('d-none');
			$('#cI1').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=C]').removeClass('d-none');
			$('#cSum1').removeClass('d-none');
			$('#cI1').attr('class', 'fa-solid fa-minus');
		}
	});

	$(document).on('click', '#btnNcShow1', function(){
		if($('#ncI1').attr('class') == 'fa-solid fa-minus'){
			$('[name=NC]').addClass('d-none');
			$('#ncSum1').addClass('d-none');
			$('#ncI1').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=NC]').removeClass('d-none');
			$('#ncSum1').removeClass('d-none');
			$('#ncI1').attr('class', 'fa-solid fa-minus');
		}
	});

	$(document).on('click', '#btnTyShow1', function(){
		if($('#tyI1').attr('class') == 'fa-solid fa-minus'){
			$('[name=TY]').addClass('d-none');
			$('#tySum1').addClass('d-none');
			$('#tyI1').attr('class', 'fa-solid fa-plus');
		} else {
			$('[name=TY]').removeClass('d-none');
			$('#tySum1').removeClass('d-none');
			$('#tyI1').attr('class', 'fa-solid fa-minus');
		}
	});

	$('#tab1Nav').on('click', function(){
		setTimeout(function() {
			bizOrderAdmDealCorpTable.ajax.reload(function() { myCallBack(); });
		}, 100)
	});

	$('#tab2Nav').on('click', function(){
		setTimeout(function() {
			bizOrderAdmGoodsTypeTable.ajax.reload(function() { myCallBack1(); });
		}, 100)
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		bizOrderAdmDealCorpTable.ajax.reload(function() { myCallBack(); });

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 조회 버튼 click
	$('#btnSearch1').on('click', function() {
		$('#my-spinner').show();
		bizOrderAdmGoodsTypeTable.ajax.reload(function() { myCallBack1(); });

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	
</script>

</body>
</html>
