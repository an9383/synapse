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
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">제품코드</label>
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="itemNm" style="width: 200px;" disabled>
						<button type="button" class="btnInputDel" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<input type="hidden" id="itemIdx">
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchItem">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래처</label>
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="searchDealCorpNm" disabled> 
						<button type="button" id="btnSearchDealCorpDel" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<input type="hidden" id="searchDealCorpIdx">
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchDealCorp">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					
					<!-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">차량배정</label>
					<select class="form-select w-auto h-100 me-3" id="carAssignment" style="min-width: 70px;">
					</select> -->
					<!-- <input type="text" class="form-control w-auto h-100 me-1" id="searchAllDtl" placeholder="통합검색" > -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCopy"><i class="fa-regular fa-copy"></i></button> -->
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" ><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button> -->
					<!-- 	<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button> -->
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrdOutProdTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">출고처</th>
							<th class="text-center align-middle">출고일자</th>
							<th class="text-center align-middle">출고전표번호</th>
							<th class="text-center align-middle">수주상세</th>
							<th class="text-center align-middle">품목</th>
							<th class="text-center align-middle">자재코드</th>
							<th class="text-center align-middle">버전</th>
							
							<th class="text-center align-middle">출고요청일자</th>
							<th class="text-center align-middle">실제출고일자</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle">출고량</th>
							<th class="text-center align-middle">명세서출력번호</th>
						</tr>
					</thead>
					<tfoot id="bizOrdOutProdTableTfoot">
						<tr>
							<th colspan="9">TOTAL</th>
							<th id="footOrdQty">수주수량</th>
							<th id="footOutQty">출고수량</th>
							<th colspan="1"></th>
						</tr>
					</tfoot>
				</table>
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
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		$('#page').css('grid-template-columns', '1fr 4px 3fr');
		$('#rightcol').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		$('#page').css('grid-template-columns', '1fr');
		$('#rightcol').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정s
	
	let dealCorpIdxVal = '';

	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	let pageLengthCnt = parseInt(getCommonCode('시스템', '025')[0].commonCd); //페이징수량
	
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태

	let workplaceList = new Array();	// 사업장 리스트
	let locationList = new Array();
	
	//창고정보 조회
	$.ajax({

		url : '<c:url value="/bm/locationAdmList"/>',
		type : 'GET',
		async : false,
		data : {
			itemGubun	:	'',
			'lcTypeOutput' : function() { return 'Y'; }
		},
		success : function(res) {
			if (res.result == "ok") { //응답결과
				let data = res.data;
				data.forEach((item) => {
					var locationData = new Object();
					locationData.id = item.idx;
					locationData.text = item.lcNm;
					locationList.push(locationData);
				});
			} else if(res.result == 'fail') {
				toastr.warning(res.message);
			} else {
				toastr.error(res.message);
			}
		}
	});

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	// 수주처 목록 조회 버튼 click
	$('#btnSearch').on('click', function() {
		bizOrdOutProdTable.ajax.reload(function() {});
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		$('#btnDel').attr('disabled',false);
		$('#btnCancel').attr('disabled',true);
		WM_action_OFF('new');
	});

	// 수주상세목록조회
	$('#bizOrdOutProdTable thead tr').clone(true).addClass('filters').appendTo('#bizOrdOutProdTable thead'); // filter 생성
	let bizOrdOutProdTable = $('#bizOrdOutProdTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
			url : '<c:url value="/stock/bizOrderProdOutLst"/>',
			type : 'POST',
			data : {
				'startDate' 	: function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				'endDate' 		: function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				'itemIdx'		: function() { return $('#itemIdx').val(); },
				'dealCorpIdx'	: function() { return $('#searchDealCorpIdx').val(); },
			},
		},
        rowId: 'rowNumber',
        columns : [
        	{ data : 'outProdDealCorpNm', className : 'text-center align-middle', name: 'outProdDealCorpNm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//납품처
			{ data : 'outDate', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},//출고일자
			{ data : 'outSlipIdx', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//출고번호
			{ data : 'bizOrdDtlNo', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//수주상세
			{ data : 'itemNm', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//품목

			
			{ data : 'paperType', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//자재명
			{ data : 'versionNm', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//버전
			{ data : 'bizOrdOutReqDate', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},//출고요청일자
			{ data : 'outDate', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},//실제출고일자
			{ data : 'bizOrdQty', className : 'text-end align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},//수주수량
			{ data : 'outQty', className : 'text-end align-middle', name : 'outQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},//출고수량
			
			{ data : 'outProdEtc4', className : 'text-center align-middle', name : 'outProdEtc4',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//명세서출력번호
		],
		columnDefs : [
			{
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
		],
		buttons : [
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrdOutProdTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#bizOrdOutProdTable_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 80)+'px');
			
			$('#bizOrdOutProdTable_filter').addClass('d-none');

			//합계표 생성		
 			let dataArray = api.rows({page:'current'}).data().toArray();
			if( dataArray.length != 0 ){
				//맨밑에 최종합계
				let totalOutQtySum = _.sumBy(dataArray, v=> parseFloat(v.outQty));
				let totalOrdQtySum = _.sumBy(dataArray, v=> parseFloat(v.bizOrdQty));
				
				$('#footOrdQty').html(addCommas(totalOrdQtySum));
				$('#footOutQty').html(addCommas(totalOutQtySum));
				
				let dealCorpUniq = _.uniqBy(dataArray, 'outProdDealCorpIdx'); // 출고처별로 uniq한 리스트

				for(var i=0; i<dealCorpUniq.length;i++){
					let filterLst = _.filter(dataArray, v=> v.outProdDealCorpIdx == dealCorpUniq[i].outProdDealCorpIdx);//해당 거래처 데이터값
					let outDateMonthUniq = _.uniqBy(filterLst, v=>v.outDate.substr(0,6)); // 거래처의 출고월별로 uniq한 리스트
					for(var j = 0; j < outDateMonthUniq.length; j++){
						//출고처의 월별로 값 sum
						let outQtySumFilterLst = _.filter(filterLst, v=> v.outDate.substr(0,6) == outDateMonthUniq[j].outDate.substr(0,6));
						let bizOrdQtySum =  _.sumBy(outQtySumFilterLst, v=> parseFloat(v.bizOrdQty));
						let outQtySum = _.sumBy(outQtySumFilterLst, v=> parseFloat(v.outQty));

						let html = '';
						html += '<tr class="bg-success bg-gradient bg-opacity-25">';
						html += '	<td class="text-center" colspan="4">'+dealCorpUniq[i].outProdDealCorpNm + ' ' + moment(outDateMonthUniq[j].outDate).endOf('month').format('YYYY-MM-DD').slice(0,-3) +'월 합계</td>';
						html += '	<td class="text-center align-middle" colspan="5"></td>';
						html += '	<td class="text-end align-middle">'+addCommas(bizOrdQtySum)+'</td>';//수주수량
						html += '	<td class="text-end align-middle">'+addCommas(outQtySum)+'</td>';//출고량
						html += '	<td class="text-center" colspan="1"></td>';
						html += '</tr>';
						
						let lastRowNumber = _.maxBy(outQtySumFilterLst, (v => parseInt(v.rowNumber))).rowNumber;
						let lastNode = api.row('#'+lastRowNumber).node();
						$(lastNode).after(html);
					}					
					let outDateDayUniq = _.uniqBy(filterLst, 'outDate'); // 거래처의 출고일자별로 uniq한 리스트
					for(var j = 0; j < outDateDayUniq.length; j++){
						//출고처의 일자별로 값 sum
						let outQtySumFilterLst = _.filter(filterLst, v=> v.outDate == outDateDayUniq[j].outDate);
						let bizOrdQtySum =  _.sumBy(outQtySumFilterLst, v=> parseFloat(v.bizOrdQty));
						let outQtySum = _.sumBy(outQtySumFilterLst, v=> parseFloat(v.outQty));

						let html = '';
						html += '<tr class="bg-success bg-gradient bg-opacity-10">';
						html += '	<td class="text-center" colspan="4">'+dealCorpUniq[i].outProdDealCorpNm + ' ' + moment(outDateDayUniq[j].outDate).format('YYYY-MM-DD') +'일  합계</td>';
						html += '	<td class="text-center align-middle" colspan="5"></td>';
						html += '	<td class="text-end align-middle">'+addCommas(bizOrdQtySum)+'</td>';//수주수량
						html += '	<td class="text-end align-middle">'+addCommas(outQtySum)+'</td>';//출고량
						html += '	<td class="text-center" colspan="2"></td>';
						html += '</tr>';
						
						let lastRowNumber = _.maxBy(outQtySumFilterLst, (v => parseInt(v.rowNumber))).rowNumber;
						let lastNode = api.row('#'+lastRowNumber).node();
						$(lastNode).after(html);
					}
					
				} 

				
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrdOutProdTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrdOutProdTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrdOutProdTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrdOutProdTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrdOutProdTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	
	/* 거래처 모달 */
	
	// 거래처조회 버튼 click
	$('#btnSearchDealCorp').on('click', function() {
		$('#dealCorpModal').modal('show');
		$('#dealCorpModal').data('type','search');
	});

	$(document).on('click','button[name=btnDealCorpSel]',function(){
		$('#dealCorpModal').modal('show');
		$('#dealCorpModal').data('type','edit');
	});
	
	$('#dealCorpModal').on('shown.bs.modal', function() {
		dealCorpModalTable.ajax.reload(function() {});
	});


	
	// 거래처조회 x 버튼 click
	$('#btnSearchDealCorpDel').on('click', function() {
		$('#searchDealCorpNm').val('');
		$('#searchDealCorpIdx').val('');
	});

	// 거래처관리 목록조회
	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			
			let htmlHeight = parseFloat($('html').css('height'));
			//let middlecolT_height = parseFloat($('#middlecolT').css('height'));
			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#dealCorpModalTable_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 230)+'px');
			
			$('#dealCorpModalTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAllAdm').off('keyup',function() {});
			$('#searchAllAdm').on('keyup',function() {
				$('#dealCorpModalTable_filter').find('input').val($(this).val());
				$('#dealCorpModalTable_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title.replaceAll('*','') + '" />');
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

	// 거래처 모달 조회 버튼 click
	$('#btnDealCorpModalSearch').on('click', function() {
		$('#my-spinner').show();
		dealCorpModalTable.ajax.reload(function() {});
		
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 거래처 모달 붙여넣기 버튼 click
	$('#btnDealCorpModalPaste').on('click', function() {
		if(!$('#dealCorpModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let type = $('#dealCorpModal').data('type');
		let data = dealCorpModalTable.row('.selected').data();
		if(type =='search'){
			$('#searchDealCorpNm').val(data.dealCorpNm);
			$('#searchDealCorpIdx').val(data.idx);
		} else if(type == 'edit'){
			let node = bizOrdOutProdTable.row('.selected').node();

			$(node).find('td').eq(bizOrdOutProdTable.column('outProdDealCorpNm:name').index()).find('input[type=hidden]').val(data.idx);
			$(node).find('td').eq(bizOrdOutProdTable.column('outProdDealCorpNm:name').index()).find('input[type=text]').val(data.dealCorpNm);
		}
		$('#dealCorpModal').modal('hide');
	});

	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let type = $('#dealCorpModal').data('type');
		let data = dealCorpModalTable.row(this).data();
		if(type =='search'){
			$('#searchDealCorpNm').val(data.dealCorpNm);
			$('#searchDealCorpIdx').val(data.idx);
		} else if(type == 'edit'){
			let node = bizOrdOutProdTable.row('.selected').node();

			$(node).find('td').eq(bizOrdOutProdTable.column('outProdDealCorpNm:name').index()).find('input[type=hidden]').val(data.idx);
			$(node).find('td').eq(bizOrdOutProdTable.column('outProdDealCorpNm:name').index()).find('input[type=text]').val(data.dealCorpNm);
		}
		$('#dealCorpModal').modal('hide');
	});
	
	/* 제품코드 모달  */
	
	$('#btnSearchItem').on('click',function(){
		
		$('#itemCodeModal').modal('show');
		setTimeout(function() {
			itemCodeModalTable.ajax.reload(function() {itemCodeModalTable.draw(false);});
		}, 200);
	});

	//제품정보 목록(모달)조회
	$('#itemCodeModalTable thead tr').clone(true).addClass('filters').appendTo('#itemCodeModalTable thead'); // filter 생성
	let itemCodeModalTable = $('#itemCodeModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex col-sm'B><'me-lg-auto div-align-center col-sm'p><'d-flex align-items-center justify-content-end col-sm'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: true,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '100vh',
        scrollX: true,
		pageLength: pageLengthCnt,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemInfoDtlListAll"/>',
			type : 'GET',
			data : {
				useYnCd : function(){return 'Y';},
				//itemGubun : function(){return $('#searchItemGubun').val();},
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'customerNm', className : 'text-center align-middle'},	//고객사
			{ data: 'itemNm', className : 'text-center align-middle'}, 		//제품명
			{ data: 'relayNotice', className : 'text-start align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space:pre-line;width:330px;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//건별전달사항
			{ data: 'knifeTipSize', className : 'text-center align-middle'},	//칼끝규격
			{ data: 'customerItemCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//자재코드	
			{ data: 'versionNum', className : 'text-center align-middle'},	//버전번호
			{ data: 'paperType', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//재질	
			{ data: 'cutQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//절수	
			{ data: 'eaQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//개수			
			{ data: 'itemColor', className : 'text-center align-middle'},	//color		
			{ data: 'frequencyNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//도수
			{ data: 'itemSize', className : 'text-center align-middle'},		//사이즈
			{ data: 'coatingMethod', className : 'text-center align-middle'},//코팅방법
			{ data: 'specialNotice', className : 'text-start align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space:pre-line;width:330px;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},//특이사항
			{ data: 'moldingMethod', className : 'text-center align-middle'},//성형방식
			{ data: 'moldingContents', className : 'text-center align-middle'},//성형내용
			{ data: 'bundleMethodNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},//묶음법
			{ data: 'bundleUnit', className : 'text-center align-middle'},	//묶음단위
			{ data: 'packMethodNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			}, //포장박스
			{ data: 'packUnit', className : 'text-center align-middle'},		//포장단위
			{ data: 'etc1Nm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//호기(기타1)	
			{ data: 'woodenCareNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//목형번호			
			{ data: 'holeWoodenCd', className : 'text-center align-middle'},	//타공목형번호
			{ data: 'resinBoardNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//수지판번호	
			{ data: 'pressMethod', className : 'text-center align-middle'},	//동판번호
			{ data: 'stock', className : 'text-end  align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},		//현재고량		
			{ data: 'inspectMethodNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//검수방법
			{ data: 'printingYnCheckNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},//착인여부			
			{ data: 'useYnCd', className : 'text-center align-middle',		//사용여부
				render : function(data, type, row, meta) {
					if(data == 'Y'){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">사용</div>';
					} else if (data == 'N'){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미사용</div>';
					} else {
						return "";
					}
				}			
			},			
			{ data: 'detailDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data,'YYYY-MM-DD').format('YYYY-MM-DD')+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//일자	
			{ data: 'etc2Cd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						
					} else {
						return "";
					}
				}	
			},	//후가공판번호	
			{ data: 'etc3', className : 'text-center align-middle'},	//부분UV	
			{ data: 'etc4', className : 'text-center align-middle'},	//FOIL	
			{ data: 'etc5', className : 'text-center align-middle'},	//FOIL COLOR	
			{ data: 'etc6', className : 'text-center align-middle'},	//형압
			{ data: 'etc7', className : 'text-center align-middle'},	//기타1
			{ data: 'etc8', className : 'text-center align-middle'},	//기타2
			{ data: 'etc9', className : 'text-center align-middle'},	//기타3
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemCodeModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 250)+'px');
			
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
				let cell = $('#itemCodeModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemCodeModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	itemCodeModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemCodeModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemCodeModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnItemCodeModalPaste').on('click',function(){
		if( !$('#itemCodeModalTable tbody tr').hasClass('selected') ){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}

		let data = itemCodeModalTable.row('.selected').data();
		$('#itemNm').val(data.itemNm);
		$('#itemIdx').val(data.idx);
		$('#itemCodeModal').modal('hide');
	});

	$('#itemCodeModalTable tbody').on('dblclick','tr',function(){
		let data = itemCodeModalTable.row(this).data();
		$('#itemNm').val(data.itemNm);
		$('#itemIdx').val(data.idx);
		$('#itemCodeModal').modal('hide');
	});

	// 모든 체크박스 체크/해제 되도록
	$(document).on('change','input:checkbox[name=btnCheck]', function(){
		if( $('input:checkbox[name=btnCheck]').length == $('input:checkbox[name=btnCheck]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
			$('#btnAllCheck').prop('checked',true);
		} else{
			$('#btnAllCheck').prop('checked',false);
		}
 	});

	//모든 체크박스 선택
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=btnCheck]').prop('checked',true);
		}else{
			$('input:checkbox[name=btnCheck]').prop('checked',false);
		}
	});
	
</script>

</body>
</html>
