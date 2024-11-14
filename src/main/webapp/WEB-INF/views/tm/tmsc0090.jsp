<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 3.5fr 4px 6.5fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품번</label>
					<div style="display: flex; flex-wrap: 1 1 auto;width: 200px;" class="input-group me-1 h-100">
						<input type="text" placeholder="" class="form-control" id="itemCd" name="itemCd" disabled>
						<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selItem" onclick="itemSel()" style="padding: 1px 4px; margin-left: 0px;">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품명</label>
					<div style="display: flex; flex-wrap: 1 1 auto;width: 200px;" class="h-100">
						<input type="text" placeholder="" class="form-control" id="itemNm" name="itemNm" disabled>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="stockPaymentAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">잔량</th>
							<th class="text-center align-middle">창고</th>
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
					<!-- rightcol 좌측상단 -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">				
					<div class="btn-group" role="group" aria-label="Small button group">		
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto d-none" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- .card-header -->
				<div class="card-body p-0">
					<div style="width: 100%;">		
					  	<div class="row">
							<table class="table table-bordered p-0 m-0" id="matrlSelectTable">
								<thead class="table-light">
									<tr>
										<th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
										<th class="text-center align-middle">전표번호</th>
										<th class="text-center align-middle">품번</th>
										<th class="text-center align-middle">품명</th>
										<th class="text-center align-middle">총입고수량</th>
										<th class="text-center align-middle">현재수량</th>
										<th class="text-center align-middle">출고수량</th>
										<th class="text-center align-middle">입고창고</th>
										<th class="text-center align-middle">출고창고</th>
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
<!-- 화면설정 script -->
<script>
	let isDragging = false;
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag() {
		isDragging = true;
		SetCursor("n-resize");
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
			let leftcolMinWidth = 1000; // leftcol 최소사이즈
			/* $('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			}); */
			let rightcolMinWidth = 400; // rightcol 최소사이즈
	
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
	WM_init('ADM');
	WM_init('DTL');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	let pageLengthCnt = parseInt(getCommonCode('시스템', '025')[0].commonCd); //페이징수량

	let locationList = new Array();
    $(document).ready(function(){
        $('#moveDate').val(moment().format('YYYY-MM-DD'));
        $.ajax({
        	url : '<c:url value="/bm/locationAdmList"/>',
    		type : 'GET',
    		async : false,
    		data : {
    		},
    		success : function(res) {
    			if (res.result == "ok") { //응답결과
    				let data = res.data;
    				data.forEach((item) => {
    					var locationData = new Object();
    					locationData.commonCd = item.lcCd;
    					locationData.commonNm = item.lcNm;
    					locationData.idx = item.idx;
    					locationList.push(locationData);
    				});
    			} else if(res.result == 'fail') {
    				toastr.warning(res.message);
    			} else {
    				toastr.error(res.message);
    			}
        	}
        });
        selectBoxAppend2(locationList, 'outWhs', '', '2');
    })
	
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	selectBoxAppend(locationList, 'outWhs', '', '2');
	
	
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#startDate2').val(moment().subtract('M',3).format('YYYY-MM-DD'));
	$('#endDate2').val(moment().format('YYYY-MM-DD'));

	let itemCdVal = '';
	let inSlipNoVal = '';
	let inSlipSeqVal = '';
	let matrlVal = '';
	let whsVal = '';
	
	let bizOrdDtlIdxVal = '';
	let ordQtyVal = '';
	let itemIdxVal = '';
	

	// 수주관리 전체 목록조회
	$('#stockPaymentAdmTable thead tr').clone(true).addClass('filters').appendTo('#stockPaymentAdmTable thead'); // filter 생성
	let stockPaymentAdmTable = $('#stockPaymentAdmTable').DataTable({
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
			url : '<c:url value="/stock/stockPaymentMatrlOutLst"/>',
			type : 'POST',
			data : {
				itemCd : function(){ return itemCdVal; }
			},
		},
		columns : [
			{ data: 'itemCd', className : 'text-center align-middle',//품번
			},
			{ data: 'itemNm', className : 'text-center align-middle', //품명
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					} else {
						return '';
					}
				}
			},
			{ data: 'remainQty', className : 'text-center align-middle', //잔량
				render : function(data, type, row, meta) {
					return addCommas(data);
				}
			},
			{ data: 'whsNm', className : 'text-center align-middle', //창고
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					} else {
						return '';
					}
				}
			}
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
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#stockPaymentAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#stockPaymentAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#stockPaymentAdmTable_filter').addClass('d-none');
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
					let selectData = stockPaymentAdmTable.row(item).data();
					if( stockPaymentAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(stockPaymentAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(stockPaymentAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#stockPaymentAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#stockPaymentAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	stockPaymentAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = stockPaymentAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#stockPaymentAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 자재 목록 조회
	$('#matrlSelectTable thead tr').clone(true).addClass('filters').appendTo('#matrlSelectTable thead'); // filter 생성
	let matrlSelectTable = $('#matrlSelectTable').DataTable({
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
        	url : '<c:url value="/stock/inProdWhsAdmList"/>',
			type : 'POST',
			data : {
				startDate	: function() { return '19000101'; },
				endDate		: function() { return '22001231'; },
				itemCd : function(){ return matrlVal; },
				remainStatus : function() { return 'Z'; },
				whsIdx :  function(){ return whsVal; }
			}
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle', name : "dtlCheckBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="dtlCheckBox" onclick="btnChange()" style="margin: 0px; width: 25px; height: 25px;">';	
				}
			},
			{ data: 'inSlipNo', className : 'text-center'}, // 입고전표
			{ data: 'itemCd', className : 'text-center'}, //품번
			{ data: 'itemNm', className : 'text-center'}, //품명
			{ data: 'inQty', className : 'text-center',
				render : function(data){
					return addCommas(parseInt(data));
				}
			},//입고수량
			
			{ data: 'remainQty', className : 'text-center',
				render : function(data){
					return addCommas(parseInt(data));
				}
			}, //잔량
			{ //출고수량 
				className : 'text-center',
				render : function(data, type, row, meta){
					return '<input type="text" style="text-align:right;" name="matrlOutput" class="form-control" onkeyup="numberFormat(this, \'int\')" disabled>';
				}
			}, 
			{ className : 'text-center',
				render : function(data, type, row, meta){
					return '<select class="form-select" id="outWhs" name="outWhs" disabled></select>';
				} 
			},
			{ data: 'whsNm', className : 'text-center'},//창고
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();

	        selectBoxAppend2(locationList, 'outWhs', '', '2');
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let headerTableHeight = parseFloat($('#headerTable').css('height'));
			let headerHeight = parseFloat($('#rightHeader').css('height'));
			let theadHeight = parseFloat($('#matrlSelectTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#matrlSelectTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - headerHeight - theadHeight - 40)+'px');
			
			$('#matrlSelectTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#matrlSelectTable_filter').find('input').val($(this).val());
				$('#matrlSelectTable_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#matrlSelectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#matrlSelectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});

		},
	});
	// dataTable colReorder event
	matrlSelectTable.on('column-reorder', function( e, settings, details ) {
		let api = matrlSelectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#matrlSelectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		stockPaymentAdmTable.ajax.reload(function() {}, false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 선점재고 선택
	$('#stockPaymentAdmTable tbody').on('click', 'tr', function() {
		let data = stockPaymentAdmTable.row(this).data();
		/* if(WMCheck('ADM')) {
			setWM('ADM', 'idx', idx);
			return false;
		} */

		matrlVal = data.itemCd; 
		whsVal = data.whsIdx;
	
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#stockPaymentAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		}); 
		matrlSelectTable.ajax.reload(function() {
			matrlSelectTable.select.style('multi');
			matrlSelectTable.select.toggleable(true);
		}, false);
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
				stockPaymentAdmTable.row('#'+idx).select();
				$(stockPaymentAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
		}
	});

	
	// 수량 계산
	$(document).on('keyup','input[name=ordQty]', function(e) {
		let tr = $(e.target).parent().parent();
		let td = $(tr).find('td');
		let ordQty = removeCommas($(td).eq(stockPaymentAdmTable.column('purchaseOrdQtyInput:name').index()).find('input[name=ordQty]').val());
		let ordQtyVal = parseInt(ordQty/500) + 'R' + parseInt(ordQty%500);
		
		$(td).eq(stockPaymentAdmTable.column('extraPackQtyR:name').index()).html((ordQtyVal));

		let data = stockPaymentAdmTable.row(tr).data();

		let purchaseOrdQty = parseFloat(data.purchaseOrdQty); // 주문수량(제품)
		let cutQty = parseFloat(data.cutQty); // 절수
		let eaQty = parseFloat(data.eaQty); // 개수
		let extraQty = parseFloat(data.extraQty); // 여유분
		let extraPackQty = parseFloat(ordQty); // 포장단위여분
		//let printPressQty = Math.ceil(purchaseOrdQty/eaQty);
		let printPressQty = Math.ceil(purchaseOrdQty/(cutQty*eaQty)) * cutQty;
		let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty);
		let R = parseInt(pressQty / 500); // R로 환산
		let finalPurchaseQty = R + "R" + (pressQty % 500);
		

		$(td).eq(stockPaymentAdmTable.column('purchaseOrdQty:name').index()).html((addCommas(parseFloat(pressQty))));
		$(td).eq(stockPaymentAdmTable.column('purchaseOrdQtyR:name').index()).html(finalPurchaseQty);

		stockPaymentAdmTable.columns.adjust();
		
	}); 



	$('#btnMatrlSelectReSearch').on('click',function(){
		matrlSelectTable.ajax.reload(function(){},false);
	});
	
	// 선점재고 선택 붙여넣기 버튼 click
	$('#btnMatrlSelectModalPaste').on('click', function() {
		let dataList = matrlSelectTable.rows('.selected').data().toArray();

		let col_filter_text = [];
		$('#preemptiveDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});

		let addList = [];
		for(var i=0;i<dataList.length;i++) {
			let obj = {};
			obj.spSourceNo = inSlipNoVal;
			obj.spSourceSeq = inSlipSeqVal;
			obj.inDate = moment().format('YYYYMMDD');
			obj.inSlipNo = dataList[i].inSlipNo;
			obj.itemCd = dataList[i].itemCd;
			obj.itemNm = dataList[i].itemNm;
			obj.remainQty = dataList[i].remainQty;
			obj.whsIdx = dataList[i].whsIdx;
			obj.whsNm = dataList[i].whsNm;
			obj.preemptiveQty = '0';
			obj.dataType = 'new';
			addList.push(obj);
		}
		$(preemptiveDtlTable.rows().nodes()).find('.bootstrapToggle').bootstrapToggle('disable');
		preemptiveDtlTable.rows.add(addList).draw(false);

		$('#matrlSelectModal').modal('hide'); 
		
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
		$('[name=preemptiveQtyInput]').attr('disabled', false);
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let check = true;
		$('#matrlSelectTable tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let data = matrlSelectTable.row($(item)).data();
			if(td.find('[name=matrlOutput]').val()!=''&&td.find('[name=dtlCheckBox]').is(':checked')){
				if(td.find('[name=matrlOutput]').val().replace(/,/g,'')>parseInt(data.remainQty)){ //수량체크
					toastr.warning('출고수량이 현재수량보다 많습니다.');
					td.find('[name=matrlOutput]').focus();
					check = false;
					return false;
				}
				if(data.whsCd == '999'||data.whsCd == '005'){ //창고체크
					toastr.warning('출고할 수 없는 창고입니다.');
					td.focus();
					check=false;
					return false;
				}
				let obj = new Object();
				obj.spSourceNo = data.inSlipNo;
				obj.spDate = moment().format('YYYYMMDD');
				obj.inDate = data.inDate;
				obj.itemCd = data.itemCd;
				obj.itemNm = data.itemNm;
				obj.remainQty = data.remainQty;
				obj.whsIdx = data.whsIdx;
				obj.whsCd = data.whsCd;
				obj.whsNm = data.whsNm;
				obj.outQty = td.find('[name=matrlOutput]').val().replace(/,/g,'');
				obj.outWhs = td.find('[name=outWhs] option:selected').data('idx');
				obj.outWhsCd = td.find('[name=outWhs]').val();
				array.push(obj);
			}
		});

		if(check){
			$.ajax({
				url: '<c:url value="/stock/matrlShipment"/>',
	            type: 'POST',
	            data: {
	                'jsonArray'	:	JSON.stringify(array)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('출고처리되었습니다.');
	        
						stockPaymentAdmTable.clear().draw();
						stockPaymentAdmTable.ajax.reload(function() {},false);
						matrlSelectTable.clear().draw();
						matrlSelectTable.ajax.reload(function(){}, false);
	
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnCancel').attr('disabled', true);
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

	// 취소 버튼 click
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

			stockPaymentAdmTable.ajax.reload(function(){},false);
			stockPaymentAdmTable.colReorder.enable();

			matrlVal = '';
			whsVal = '';
			matrlSelectTable.ajax.reload(function(){},false);
			matrlSelectTable.colReorder.enable();

			$('#stockPaymentAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});

			$('#preemptiveDtlTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
	});

	//전체체크
	$('#dtlAllCheckBox').on('click', function(){
		if($(this).is(':checked')){
			$('[name=dtlCheckBox]').prop('checked', true);
		} else {
			$('[name=dtlCheckBox]').prop('checked', false);
		}
	})

	//제품 선택
	function itemSel() {
		$('#itemInfoAdmModal1').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}

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

	// 자재모달 조회 버튼 click
	$('#btnitemInfoAdmModalSearch1').on('click', function() {
		itemInfoAdmModalTable1.ajax.reload(function(){});
	});

	$('#btnItemInfoAdmModalPaste1').on('click',function(){
		if( !$('#itemInfoAdmModalTable1 tbody tr').hasClass('selected') ){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}

		let data = itemInfoAdmModalTable1.row('.selected').data();

		$('#itemCd').val(data.itemCd);
		$('#itemNm').val(data.itemNm);
		itemIdxVal = data.itemIdxVal;

		$('#itemInfoAdmModal1').modal('hide');
	});


	//자재 출고 체크시 저장버튼 활성화
	function btnChange(){
		$('#btnSave').prop('disabled', $('input[name=dtlCheckBox]:checked').length==0);
		$('#btnCancel').prop('disabled', $('input[name=dtlCheckBox]:checked').length==0);
		$('[name=matrlOutput]').prop('disabled',  $('input[name=dtlCheckBox]:checked').length==0);
		$('[name=outWhs]').prop('disabled',  $('input[name=dtlCheckBox]:checked').length==0);
	}

	function selectBoxAppend2(list, id, sVal, flag)
	{
		$('[name='+id+']').empty();
		let option = '';

		if(flag == '1') {
			option += '<option value="">전체</option>';
		} else if(flag == '2') {
			option += '<option value="">선택</option>';
		}
		for(var i=0;i<list.length;i++) {
			if(list[i].commonCd == sVal) {
				option += "<option value="+list[i].commonCd+" data-idx="+list[i].idx+" selected>"+list[i].commonNm+"</option>";
			} else {
				option += "<option value="+list[i].commonCd+" data-idx="+list[i].idx+">"+list[i].commonNm+"</option>";
			}
		}
		$('[name='+id+']').append(option);
	}
</script>

</body>
</html>
