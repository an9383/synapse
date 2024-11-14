<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)"
	style="grid-template-areas: 'middlecolT' 'dragbarV' 'middlecolB'; grid-template-rows: 3fr 4px 2fr; grid-template-columns: 1fr;">
	<div id="middlecolT">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주서출력일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate"> 
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					 
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch">
							<i class="fa-regular fa-clipboard"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnPurchaseSave">
							<i class="fa-regular fa-floppy-disk"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center">발주서출력번호</th>
							<th class="text-center">발주서출력일</th>
							<th class="text-center">재질</th>
							<th class="text-center">발주수량</th>
							<th class="text-center">®</th>
							<th class="text-center">입고예정수량</th>
							<th class="text-center">®</th>
							<th class="text-center">기입고수량</th>
							<th class="text-center">®</th>
							<th class="text-center" style="max-width:125px;min-width:125px;">입고창고</th>
							<th class="text-center">외관검사</th>
							<th class="text-center" style="max-width:110px;min-width:110px;">판정자</th>
							<th class="text-center">판정일자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarV" onmousedown="StartDrag()"></div>
	<div id="middlecolB">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllDtl" placeholder="통합검색">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled>
							<i class="fa-regular fa-pen-to-square"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled>
							<i class="fa-regular fa-floppy-disk"></i>
						</button>
						<!-- <button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled>
							<i class="fa-solid fa-xmark"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="inMatrWhsTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center">발주서출력번호</th>
							<th class="text-center">발주번호</th>
							<!-- <th class="text-center colvisHide">입고번호</th>
							<th class="text-center colvisHide">입고시퀀스</th> -->
							<th class="text-center">입고처</th>
							<th class="text-center">재질</th>
							<!-- <th class="text-center colvisHide">장</th>
							<th class="text-center colvisHide">폭</th>
							<th class="text-center colvisHide">절수</th>
							<th class="text-center colvisHide">개수</th> -->
							<th class="text-center">발주일자</th>
							<th class="text-center">입고예정일</th>
							<th class="text-center">입고일자</th>
							<th class="text-center">발주수량</th>
							<th class="text-center">®</th>
							<th class="text-center">기입고량</th>
							<th class="text-center">®</th>
							<th class="text-center">입고예정수량</th>
							<th class="text-center">®</th>
							<th class="text-center" style="max-width:125px;min-width:125px;">입고창고</th>
							<th class="text-center">외관검사</th>
							<th class="text-center" style="max-width:110px;min-width:110px;">판정자</th>
							<th class="text-center">판정일자</th>
							<th class="text-center">비고</th>
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

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정s
	
	// 공통코드 조회
	let locationModalItemGubunList = getCommonCode('일반', '022'); // 품목구분
	let exteriorInspect = getCommonCode('일반', '032'); // 외관검사
	
	selectBoxAppend(locationModalItemGubunList, 'locationModalItemGubun', '003', '1');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let relationNoVal = '';
	let purchasePrintNoVal = '';
	let matrlIdxVal = '';
	let sessionUserNm = "${userNm}";//세션에서 가져온 유저이름
	let sessionUserIdx = "${userIdx}";//세션에서 가져온 유저식별자
	
	// 발주관리 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: false,
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
			url : '<c:url value="/pm/purchaseOrderAdmLstByPurchasePrintNo"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); }
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
			{ data: 'purchasePrintNo', className : 'text-center align-middle', name:'rowspan', //발주서출력번호
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'printDate', className : 'text-center align-middle', name:'rowspan', //발주서출력일
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'paperType', className : 'text-center align-middle', //재질
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'purchaseOrdQtySum', className : 'text-end align-middle', //발주수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseInt(data));
					} else {
						return '0';
					}
					/* let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분
					
					if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						let printPressQty = Math.round(ordQty/eaQty);
						let pressQty = Math.round((printPressQty + extraQty + extraPackQty)/cutQty);
						
						let R = parseInt(pressQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (pressQty % 500);
						console.log(printPressQty);
						return addCommas(pressQty);
					} */
				}
			},
			{ data: 'purchaseOrdQtySum', className : 'text-end align-middle',//발주수량R
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						let returnVal = parseInt(data / 500) + "R" + parseInt(data % 500);
						return returnVal;
					} else {
						return '0R0';
					}
					/* let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분
					
					if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						let printPressQty = Math.round(ordQty/eaQty);
						let pressQty = Math.round((printPressQty + extraQty + extraPackQty)/cutQty);
						
						let R = parseInt(pressQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (pressQty % 500);
						
						return finalPurchaseQty;
					} */
				}
			},
			{ className : 'text-end align-middle',//입고예정수량
				render: function(data, type, row, meta) {
					let remainQty = parseFloat(row['purchaseOrdQtySum']) - parseFloat(row['inQtySum']);
					if(remainQty < 0) {
						remainQty = 0;
					}
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ addCommas(remainQty) +'</div>';
				}
			},
			{ className : 'text-end align-middle',//입고예정수량R
				render: function(data, type, row, meta) {
					let remainQty = parseFloat(row['purchaseOrdQtySum']) - parseFloat(row['inQtySum']);
					if(remainQty < 0) {
						remainQty = 0;
					}
					let returnValue = parseInt(remainQty/500) + 'R' + parseInt(remainQty%500);
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ returnValue +'</div>';
				}
			},
			{ data: 'inQtySum', className : 'text-end align-middle',//기입고수량
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseFloat(data));
					} else {
						return '0';
					}
				}
			},
			{ data: 'inQtySum', className : 'text-end align-middle',//기입고수량R
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						let returnValue = parseInt(data/500) + 'R' + parseInt(data%500);
						return returnValue;
					} else {
						return '0R0';
					}
				}
			},
			
			{ className : 'text-end align-middle', name:'lcNm', //입고창고
				render: function(data, type, row, meta) {
					let html = '';
						html += '<div class="input-group" style="min-width: 120px;max-width: 120px;">';
						html += '	<input type="text" class="form-control" value="'+row['locationNm']+'" disabled>';
						html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
						html += '		border-color: transparent; position: absolute;';
						html += '		top: 0; right:0;';
						html += '		margin: 1px 23px; margin-left: 0px;';
						html += '		border: none;';
						html += '		">';
						html += '		<i class="fa-solid fa-xmark"></i>';
						html += '	</button>';
						html += '	<input type="hidden" value="'+row['locationIdx']+'">';
						html += '	<button data-table="purchaseOrderAdmTable" type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnLocationModalShow">';
						html += '		<i class="fa-solid fa-magnifying-glass"></i>';
						html += '	</button>';
						html += '</div>';
						html += '<span class="d-none"></span>';
					return html;
				}
			},
			{ className : 'text-end align-middle', name:'inMatrlEtc1',//외관검사
				render: function(data, type, row, meta) {
					return selectBoxHtml(exteriorInspect, 'exteriorInspect'+meta.row, 'exteriorInspect', 01, '선택', { disabled: false }); //외관검사
				}
			},
			{ className : 'text-end align-middle', name:'inMatrlEtc2',//판정자
				render: function(data, type, row, meta) {
					let html = '';
					html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
					html += '	<input type="text" class="form-control" value="'+sessionUserNm+'" disabled>';
					html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
					html += '		border-color: transparent; position: absolute;';
					html += '		top: 0; right:0;';
					html += '		margin: 1px 23px; margin-left: 0px;';
					html += '		border: none;';
					html += '		">';
					html += '		<i class="fa-solid fa-xmark"></i>';
					html += '	</button>';
					html += '	<input type="hidden" value="'+sessionUserIdx+'">';
					html += '	<button data-table="purchaseOrderAdmTable" type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnUserModalShow">';
					html += '		<i class="fa-solid fa-magnifying-glass"></i>';
					html += '	</button>';
					html += '</div>';
					html += '<span class="d-none"></span>';
					return html;
				}
			},
			{ className : 'text-end align-middle', name:'inMatrlEtc3',//판정일자
				render: function(data, type, row, meta) {
					return '<input type="date" max="9999-12-31" name="inMatrEtc3" class="form-control text-center" value="'+moment().format('YYYY-MM-DD')+'">';
				}
			},
			
		],
		/* rowsGroup: [
			'rowspan:name'
	 	], */
		columnDefs : [
			{
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#middlecolT').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#purchaseOrderAdmTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAllAdm').off('keyup',function() {});
			$('#searchAllAdm').on('keyup',function() {
				$('#purchaseOrderAdmTable_filter').find('input').val($(this).val());
				$('#purchaseOrderAdmTable_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#purchaseOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				if(colIdx > 0){
					$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
					$(cell).css('padding','2px');
				} else {
					$(cell).html('');
					$(cell).css('padding','2px');
				}
				//$(cell).html('<input type="text" class="form-control" placeholder="' + title.replaceAll('*','') + '" />');
				$//(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			api.button(3).trigger();
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
		$('#admAllCheckBox').prop('checked',false);
		$('#dtlAllCheckBox').prop('checked',false)
		purchaseOrderAdmTable.ajax.reload(function() {});
		
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 발주목록 선택
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();
		let idx = data.idx;
		if(WMCheck('ADM')) {
			setWM('ADM', 'idx', idx);
			return false;
		}
		
		relationNoVal = data.purchaseOrdNo;
		purchasePrintNoVal = data.purchasePrintNo;
		matrlIdxVal = data.matrlIdx;
		inMatrWhsTable.clear().draw();
		inMatrWhsTable.ajax.reload();
		$('#dtlAllCheckBox').prop('checked',false);
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
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







	// 입고목록 발주번호별 목록조회
	$('#inMatrWhsTable thead tr').clone(true).addClass('filters').appendTo('#inMatrWhsTable thead'); // filter 생성
	let inMatrWhsTable = $('#inMatrWhsTable').DataTable({
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
			url : '<c:url value="/pm/purchaseOrderDtlLstByPurchasePrintNo"/>',
			type : 'POST',
			data : {
				'purchasePrintNo'	: function() { return purchasePrintNoVal; },
				'matrlIdx'			: function() { return matrlIdxVal; },
			},
		},
        rowId: 'inSlipNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="dtlCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
			{ data: 'purchasePrintNo', className : 'text-center align-middle', name:'rowspan', //발주서출력번호
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'purchaseOrdNo', className : 'text-center align-middle', name:'rowspan', //발주서출력번호
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			/* { data: 'inSlipNo', className : 'text-center align-middle', name: 'inSlipNo'},
			{ data: 'inSlipSeq', className : 'text-center align-middle', name: 'inSlipSeq'}, */
			{ data: 'dealCorpNm', className : 'text-center align-middle', name: 'dealCorpNm'},
			{ data: 'paperType', className : 'text-center align-middle', name: 'paperType'},
			/* { data: 'sizeX', className : 'text-center align-middle', name: 'sizeX'},
			{ data: 'sizeY', className : 'text-center align-middle', name: 'sizeY'},
			{ data: 'cutQty', className : 'text-center align-middle', name: 'cutQty',
				render : function(data, type, row, meta) {
					return addCommas(parseInt(data));
				}
			},
			{ data: 'eaQty', className : 'text-center align-middle', name: 'eaQty',
				render : function(data, type, row, meta) {
					return addCommas(parseInt(data));
				}
			}, */
			{ data: 'purchaseOrdDate', className : 'text-center align-middle', name: 'purchaseOrdDate',//발주일자
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return moment(data,'YYYYMMDD').format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
			{ data: 'purchaseInDueDate', className : 'text-center align-middle', name: 'purchaseInDueDate',//입고예정일
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return moment(data,'YYYYMMDD').format('YYYY-MM-DD');
					} else {
						return '';
					}
				}
			},
			{ data: 'inDate', className : 'text-center align-middle editNode', name: 'inDate',//입고일자 인풋
				render : function(data, type, row, meta) {
					let html = '';
						html += '<input disabled type="date" name="inDate"max="9999-12-31" class="form-control text-center" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
					return html;
				}
			},
			{ data: 'purchaseOrdQtyCnt', className : 'text-end align-middle editNode',//발주수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseInt(data));
					} else {
						return '0';						
					}
				}
			},
			{ data: 'purchaseOrdQtyCnt', className : 'text-end align-middle editNode',//발주수량R
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						let returnVal = parseInt(data/500) + "R" + parseInt(data%500);
						return returnVal;
					} else {
						return '0R0';						
					}
				}
			},
			{ data: 'inQty', className : 'text-end align-middle editNode', //기입고수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseInt(data));
					} else {
						return '0';						
					}
				}
			},
			{ data: 'inQty', className : 'text-end align-middle editNode',//기입고수량R
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						let returnVal = parseInt(data/500) + "R" + parseInt(data%500);
						return returnVal;
					} else {
						return '0R0';						
					}
				}
			},
			{ className : 'text-end align-middle editNode', name: 'inQty', //입고수량
				render : function(data, type, row, meta) {
					let html = '';
						html += '<input disabled type="text" name="inQty" class="form-control text-end calValue" onkeyup="numberFormat(this, \'int\')" value="'+addCommas(parseInt(row['purchaseOrdQtyCnt']) - parseInt(row['inQty']))+'">';
					return html;
				}
			},
			{ className : 'text-end align-middle editNode', name: 'inQtyR',//입고수량R
				render : function(data, type, row, meta) {
					if(row['purchaseOrdQtyCnt'] != null && row['purchaseOrdQtyCnt'] != '' && row['inQty'] != null && row['inQty'] != ''){
						let data = parseInt(row['purchaseOrdQtyCnt']) - parseInt(row['inQty']);
						let returnVal = parseInt(data/500) + "R" + parseInt(data%500);
						return returnVal;
					} else {
						return '0R0';						
					}
				}
			},
			{ data: 'locationNm', className : 'text-center align-middle editNode', name: 'lcNm',
				render : function(data, type, row, meta) {
					let html = '';
						html += '<div class="input-group" style="min-width: 120px;max-width: 120px;">';
						html += '	<input type="text" class="form-control" value="'+data+'" disabled>';
						html += '	<button disabled type="button" class="btnInputDel" style="background-color: transparent;';
						html += '		border-color: transparent; position: absolute;';
						html += '		top: 0; right:0;';
						html += '		margin: 1px 23px; margin-left: 0px;';
						html += '		border: none;';
						html += '		">';
						html += '		<i class="fa-solid fa-xmark"></i>';
						html += '	</button>';
						html += '	<input type="hidden" value="'+row['locationIdx']+'">';
						html += '	<button data-table="inMatrWhsTable" disabled type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnLocationModalShow">';
						html += '		<i class="fa-solid fa-magnifying-glass"></i>';
						html += '	</button>';
						html += '</div>';
						html += '<span class="d-none">'+data+'</span>';
					return html;
					
				}
			},
			{ className : 'text-end align-middle editNode', name:'inMatrlEtc1',//외관검사
				render: function(data, type, row, meta) {
					return selectBoxHtml(exteriorInspect, 'exteriorInspect'+meta.row, 'exteriorInspect', 01, '선택', { disabled: true }); //외관검사
				}
			},
			{ className : 'text-end align-middle editNode', name:'inMatrlEtc2',//판정자
				render: function(data, type, row, meta) {
					let html = '';
					html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
					html += '	<input type="text" class="form-control" value="'+sessionUserNm+'" disabled>';
					html += '	<button disabled type="button" class="btnInputDel" style="background-color: transparent;';
					html += '		border-color: transparent; position: absolute;';
					html += '		top: 0; right:0;';
					html += '		margin: 1px 23px; margin-left: 0px;';
					html += '		border: none;';
					html += '		">';
					html += '		<i class="fa-solid fa-xmark"></i>';
					html += '	</button>';
					html += '	<input type="hidden" value="'+sessionUserIdx+'">';
					html += '	<button disabled data-table="inMatrWhsTable" type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnUserModalShow">';
					html += '		<i class="fa-solid fa-magnifying-glass"></i>';
					html += '	</button>';
					html += '</div>';
					html += '<span class="d-none"></span>';
					return html;
				}
			},
			{ className : 'text-end align-middle editNode', name:'inMatrlEtc3',//판정일자
				render: function(data, type, row, meta) {
					return '<input disabled type="date" max="9999-12-31" name="inMatrEtc3" class="form-control text-center input-group" value="'+moment().format('YYYY-MM-DD')+'">';
				}
			},
			{ data: 'inDesc', className : 'text-center align-middle editNode', name: 'inDesc',
				render : function(data, type, row, meta) {
					let html = '';
						html += '<input disabled name="inDesc" type="text" class="form-control">';
						html += '<span class="d-none">'+data+'</span>';
					return html;
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
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolB_height = parseFloat($('#middlecolB').css('height'));
			let theadHeight = parseFloat($('#inMatrWhsTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#inMatrWhsTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolB_height - theadHeight - 80)+'px');
			
			$('#inMatrWhsTable_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#inMatrWhsTable_filter').find('input').val($(this).val());
				$('#inMatrWhsTable_filter').find('input').trigger('keyup');
			});
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#inMatrWhsTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				if(colIdx > 0){
					$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
					$(cell).css('padding','2px');
				} else {
					$(cell).html('');
					$(cell).css('padding','2px');
				}
				//$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				//$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inMatrWhsTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			api.button(3).trigger();
		},
	});
	// dataTable colReorder event
	inMatrWhsTable.on('column-reorder', function( e, settings, details ) {
		let api = inMatrWhsTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inMatrWhsTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 창고모달 버튼 click
	$(document).on('click', '.btnLocationModalShow', function() {
		$('#locationModal').data('table',$(this).data('table'));
		$('#locationModal').modal('show');
	});
	$('#locationModal').on('shown.bs.modal', function() {
		locationModalTable.ajax.reload(function() {});
	});

	// 입고등록 신규 버튼 click
	$('#btnNew').on('click', function() {
		if(purchaseOrderAdmTable.row('.selected').data() == undefined) {
			toastr.warning('입고할 발주를 선택해주세요.');
			return false;
		}
		WM_action_ON('ADM','workingWarningModal');

		let data = purchaseOrderAdmTable.row('.selected').data();
		
		inMatrWhsTable.colReorder.disable();
		inMatrWhsTable.row.add({
			lotNo				:	'',
			purchaseOrdNo		:	data.purchaseOrdNo,
			inSlipNo			:	'자동채번',
			inSlipSeq			:	'자동채번',
			dealCorpNm			:	data.dealCorpNm,
			itemGubun			:	data.itemGubun,
			matrlIdx			:	data.matrlIdx,
			matrlCd				:	data.matrlCd,
			matrlNm				:	data.matrlNm,
			paperType			:	data.paperType,
			sizeX				:	data.sizeX,
			sizeY				:	data.sizeY,
			cutSize				:	data.cutSize,
			cutQty				:	data.cutQty,
			eaQty				:	data.eaQty,
			purchaseOrdDate		:	data.purchaseOrdDate,
			purchaseInDueDate	:	data.purchaseInDueDate,
			inDate				:	moment().format('YYYYMMDD'),
			inQty				:	'0',
			lcNm				:	'',
			inDesc				:	'',
		}).draw(false);

		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
	});
	
	// 수주별발주 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#inMatrWhsTable tbody').find('tr').each(function(index, item) {
			if( $(item).find('td').find('input[name=dtlCheckBox]').prop('checked') ){
				if($(item).find('td').find('input').length > 2) {
					let td = $(item).find('td');
					let data = inMatrWhsTable.row($(item)).data();
					let node = inMatrWhsTable.row($(item)).node();
					
					let inDate = $(td).eq(inMatrWhsTable.column('inDate:name').index()).find('input').val();
					let inQty = $(td).eq(inMatrWhsTable.column('inQty:name').index()).find('input').val();
					let whsIdx = $(td).eq(inMatrWhsTable.column('lcNm:name').index()).find('input[type=hidden]').val();
					let inDesc = $(td).eq(inMatrWhsTable.column('inDesc:name').index()).find('input').val();
					//외관검사
					let inMatrlEtc1 = $(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc1:name').index()).find('select[name=exteriorInspect]').val();
					//판정자
					let inMatrlEtc2 = $(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc2:name').index()).find('input[type=hidden]').val();
					//판정일자				
					let inMatrlEtc3 = $(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc3:name').index()).find('input[name=inMatrEtc3]').val();
				
					if(inDate == '') {
						toastr.warning('입고일자를 선택해주세요.');
						$(td).eq(inMatrWhsTable.column('inDate:name').index()).find('input').focus();
						state = false;
						return false;
					}
					if(inQty == '0') {
						toastr.warning('입고수량을 입력해주세요.');
						$(td).eq(inMatrWhsTable.column('inQty:name').index()).find('input').focus();
						state = false;
						return false;
					}
					if(whsIdx == '') {
						toastr.warning('입고창고를 선택해주세요.');
						$(td).eq(inMatrWhsTable.column('lcNm:name').index()).find('button').eq(1).focus();
						state = false;
						return false;
					}
					if(inMatrlEtc1 == '' || inMatrlEtc1 == null ){
						toastr.warning('외관검사를 선택해주세요.');
						$(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc1:name').index()).find('select[name=exteriorInspect]').focus();
						state = false;
						return false;
					}
					if(inMatrlEtc2 == '' || inMatrlEtc2 == null ){
						toastr.warning('판정자를 선택해주세요.');
						$(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc2:name').index()).find('button').eq(1).focus();
						state = false;
						return false;
					}
					if(inMatrlEtc3 == '' || inMatrlEtc3 == null ){
						toastr.warning('판정일자를 선택해주세요.');
						$(node).find('td').eq(inMatrWhsTable.column('inMatrlEtc3:name').index()).find('input[name=inMatrEtc3]').focus();
						state = false;
						return false;
					}
	
					let obj = new Object();
					obj.purchaseOrdNo = data.purchaseOrdNo;
					//obj.itemGubun = data.itemGubun;
					obj.itemGubun = '002'; // 자재라서 002
					obj.inGubun = '001';
					obj.matrlIdx = data.matrlIdx;
					obj.inQty = inQty.replaceAll(/,/g,'');
					obj.inDate = moment(inDate).format('YYYYMMDD');
					obj.inCorpCd = data.dealCorpIdx;
					obj.inStatus = 'A';
					//obj.lotNo = data.lotNo;
					obj.lotNo = '';
					obj.relationNo = data.purchaseOrdNo;
					obj.whsGubun = '';
					obj.whsIdx = whsIdx;
					obj.locIdx = '';
					obj.inDesc = inDesc;
	
					//obj.inSlipNo = (inMatrWhsTable.row($(item)).data().inSlipNo=='자동채번'?'':inMatrWhsTable.row($(item)).data().inSlipNo);
					//obj.inSlipSeq = (inMatrWhsTable.row($(item)).data().inSlipSeq=='자동채번'?'':inMatrWhsTable.row($(item)).data().inSlipSeq);
					obj.inSlipNo = '';
					obj.inSlipSeq = '';
					
					obj.cutQty = inMatrWhsTable.row($(item)).data().cutQty;
					obj.cutSize = inMatrWhsTable.row($(item)).data().cutSize;
					obj.dealCorpNm = inMatrWhsTable.row($(item)).data().dealCorpNm;
					obj.eaQty = inMatrWhsTable.row($(item)).data().eaQty;
					obj.lcNm = inMatrWhsTable.row($(item)).data().lcNm;
					obj.locIdx = inMatrWhsTable.row($(item)).data().locIdx;
					obj.matrlNm = inMatrWhsTable.row($(item)).data().matrlNm;
					obj.paperType = inMatrWhsTable.row($(item)).data().paperType;
					obj.preInDate = inMatrWhsTable.row($(item)).data().preInDate;
					obj.preInQty = inMatrWhsTable.row($(item)).data().preInQty;
					obj.purchaseInDueDate = inMatrWhsTable.row($(item)).data().purchaseInDueDate;
					obj.purchaseOrdDate = inMatrWhsTable.row($(item)).data().purchaseOrdDate;
					obj.remainQty = inMatrWhsTable.row($(item)).data().remainQty;
					obj.sizeX = inMatrWhsTable.row($(item)).data().sizeX;
					obj.sizeY = inMatrWhsTable.row($(item)).data().sizeY;
					obj.inMatrEtc1 = inMatrlEtc1;
					obj.inMatrEtc2 = inMatrlEtc2;
					obj.inMatrEtc3 = inMatrlEtc3;
				    array.push(obj);
			    }
			}
		});

		if(!state) {
			return false;
		}

		if(array.length == 0) {
			toastr.warning('입고 등록할 항목을 체크해주세요.');
			state = false;
			return false;
		}

		//array = _.differenceWith(array, inMatrWhsTable.data().toArray(), _.isEqual);

		console.log(array);

		$.ajax({
			url: '<c:url value="/stock/inMatrWhsAdmIU"/>',
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
        
					WM_action_OFF('ADM');

					purchaseOrderAdmTable.ajax.reload();
					inMatrWhsTable.clear().draw();
					inMatrWhsTable.ajax.reload(function() {
						$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
        
					inMatrWhsTable.colReorder.enable();
        
					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼
					$('#dtlAllCheckBox').prop('checked',false);
					$('#admAllCheckBox').prop('checked',false);
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
		WM_action_ON('ADM','workingWarningModal');
		
		$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#inMatrWhsTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).hasClass('editNode') && ($(td).find('input').length == 0 || $(td).find('.input-group').length != 0)) {
					if(index_td == inMatrWhsTable.column('inDate:name').index()) { // 입고일자
						let value = inMatrWhsTable.row(tr).data().inDate;
						value = moment(value).format('YYYY-MM-DD');
						$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
					} else if(index_td == inMatrWhsTable.column('inQty:name').index()) { // 입고수량
						let value = inMatrWhsTable.row(tr).data().inQty;
						value = addCommas(parseInt(value));
						$(td).html('<input type="text" class="form-control text-end" onkeyup="numberFormat(this, \'int\')" value="'+value+'">');
					} else if(index_td == inMatrWhsTable.column('lcNm:name').index()) { // 입고창고
						let value = inMatrWhsTable.row(tr).data().lcNm;
						$(td).find('button').attr('disabled',false);
					} else if(index_td == inMatrWhsTable.column('inDesc:name').index()) { // 비고
						let value = (inMatrWhsTable.row(tr).data().inDesc==null?'':inMatrWhsTable.row(tr).data().inDesc);
						$(td).html('<input type="text" class="form-control text-center" value="'+value+'">');
					} else if(index_td == inMatrWhsTable.column('inMatrlEtc1:name').index()) { // 외관검사
						$(td).find('select[name=exteriorInspect]').attr('disabled',false);
					} else if(index_td == inMatrWhsTable.column('inMatrlEtc2:name').index()) { // 판정자
						$(td).find('button').attr('disabled',false);
					} else if(index_td == inMatrWhsTable.column('inMatrlEtc3:name').index()) { // 판정일자
						$(td).find('input[name=inMatrEtc3]').attr('disabled',false);
					}
				}
			})
		});
		
		inMatrWhsTable.colReorder.disable();
		inMatrWhsTable.draw();
		$('#inMatrWhsTable tbody tr').find('input[name=inDate]').attr('disabled',false);
		$('#inMatrWhsTable tbody tr').find('input[name=inQty]').attr('disabled',false);
		$('#inMatrWhsTable tbody tr').find('input[name=inDesc]').attr('disabled',false);
		
		
		$('#btnNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnCancel').attr('disabled', false); // DTL 취소 버튼
	});

	// 자재입고 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('#inMatrWhsTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = inMatrWhsTable.row('.selected').data();

		if(data.inSlipNo != '자동채번') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		} else {
			inMatrWhsTable.row('.selected').remove().draw();
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let data = inMatrWhsTable.row('.selected').data();
			let inSlipNo = data.inSlipNo;
			let inSlipSeq = data.inSlipSeq;
			let spSourceNo = inSlipNo+'-'+inSlipSeq;
			$.ajax({
				url: '<c:url value="/stock/inMatrWhsAdmDel"/>',
	            type: 'POST',
	            data: {
	            	'inSlipNo'		:	inSlipNo,
	            	'inSlipSeq'		:	inSlipSeq,
	            	'spSourceNo'	:	spSourceNo
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						purchaseOrderAdmTable.ajax.reload();
						inMatrWhsTable.clear().draw();
						inMatrWhsTable.ajax.reload();
						inMatrWhsTable.row('.selected').remove().draw(false);
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

			inMatrWhsTable.ajax.reload();
			inMatrWhsTable.colReorder.enable();

			$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
	});



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
			{ data: 'lcTypeOutput', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			},
			{ data: 'lcTypeInput', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			},
			{ data: 'lcTypeReturn', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			},
			{ data: 'lcTypeQc', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			},
			{ data: 'lcTypeOutsourcing', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			},
			{ data: 'itemGubunNm', className : 'text-center align-middle'},
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
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
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
		let table = $('#'+$('#locationModal').data('table')).dataTable().api();
		let node = table.row('.selected').node();
		let data = table.row('.selected').data();
		let selectNodeModalData = locationModalTable.row('.selected').data();
		$(node).find('td').eq(table.column('lcNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//창고 식별자
		$(node).find('td').eq(table.column('lcNm:name').index()).find('input[type=text]').val(selectNodeModalData.lcNm);		//창고명
		$('#locationModal').modal('hide');
	});

	$('#locationModalTable tbody').on('dblclick','tr',function(){
		let table = $('#'+$('#locationModal').data('table')).dataTable().api();
		let node = table.row('.selected').node();
		let data = table.row('.selected').data();
		let selectNodeModalData = locationModalTable.row(this).data();
		$(node).find('td').eq(table.column('lcNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//창고 식별자
		$(node).find('td').eq(table.column('lcNm:name').index()).find('input[type=text]').val(selectNodeModalData.lcNm);		//창고명
		$('#locationModal').modal('hide');
	});

	//전체 발주
	$('#btnPurchaseSave').on('click',function(){
		let array = [];
		let status = true;
		
		if( $('input:checkbox[name=admCheckBox]:checked').length == 0){
			toastr.warning('입고할 항목을 체크해주세요.');
			return false;
		}
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item){
			if( $(item).find('td').find('input[name=admCheckBox]').prop('checked') ){
				let td = $(item).find('td');
				let data = purchaseOrderAdmTable.row($(item)).data();
				let node = purchaseOrderAdmTable.row($(item)).node();


				//창고
				let lcIdx = $(node).find('td').eq(purchaseOrderAdmTable.column('lcNm:name').index()).find('input[type=hidden]').val();
				//외관검사
				let inMatrlEtc1 = $(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc1:name').index()).find('select[name=exteriorInspect]').val();
				//판정자
				let inMatrlEtc2 = $(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc2:name').index()).find('input[type=hidden]').val();
				//판정일자				
				let inMatrlEtc3 = $(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc3:name').index()).find('input[name=inMatrEtc3]').val();
				
				if(lcIdx == '' || lcIdx == null ){
					toastr.warning('입고할 창고를 선택해주세요.');
					$(node).find('td').eq(purchaseOrderAdmTable.column('lcNm:name').index()).find('button').eq(1).focus();
					status = false;
				}
				if(inMatrlEtc1 == '' || inMatrlEtc1 == null ){
					toastr.warning('외관검사를 선택해주세요.');
					$(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc1:name').index()).find('select[name=exteriorInspect]').focus();
					status = false;
				}
				if(inMatrlEtc2 == '' || inMatrlEtc2 == null ){
					toastr.warning('판정자를 선택해주세요.');
					$(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc2:name').index()).find('button').eq(1).focus();
					status = false;
				}
				if(inMatrlEtc3 == '' || inMatrlEtc3 == null ){
					toastr.warning('판정일자를 선택해주세요.');
					$(node).find('td').eq(purchaseOrderAdmTable.column('inMatrlEtc3:name').index()).find('input[name=inMatrEtc3]').focus();
					status = false;
				}
				let tableData = '';

				//DTL 테이블에 나오는 내용
				$.ajax({
					url: '<c:url value="/pm/purchaseOrderDtlLstByPurchasePrintNo"/>',
		            type: 'POST',
		            async: false,
		            data: {
		                'purchasePrintNo' : 	function(){ return data.purchasePrintNo;},
		                'matrlIdx'		  :		function(){ return data.matrlIdx;},
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							tableData = res.data;
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});

				//DTL테이블 조회하는 쿼리로 조회했을때 한개라도 있을 경우
				if(tableData.length > 0){
					for(var i = 0; i < tableData.length; i++){
						if(tableData[i].purchaseOrdQtyCnt != null && tableData[i].purchaseOrdQtyCnt != ''){
							let inQtyValue = isNaN(tableData[i].inQty) != true ? parseInt(tableData[i].inQty) : 0;
							let ifValue = parseInt(tableData[i].purchaseOrdQtyCnt - inQtyValue);
							if( ifValue > 0){
								let obj = new Object();
								obj.purchaseOrdNo = tableData[i].purchaseOrdNo;
								obj.itemGubun = '002'; // 자재라서 002
								obj.inGubun = '001';
								obj.matrlIdx = tableData[i].matrlIdx;
								obj.inQty = ifValue;
								obj.inDate = moment().format('YYYYMMDD');
								obj.inCorpCd = tableData[i].dealCorpIdx;
								obj.inStatus = 'A';
								//obj.lotNo = data.lotNo;
								obj.lotNo = '';
								obj.relationNo = tableData[i].purchaseOrdNo;
								obj.whsGubun = '';
								obj.whsIdx = lcIdx; //입고창고
								obj.locIdx = '';
								obj.inDesc = ''; //비고
				
								//obj.inSlipNo = (inMatrWhsTable.row($(item)).data().inSlipNo=='자동채번'?'':inMatrWhsTable.row($(item)).data().inSlipNo);
								//obj.inSlipSeq = (inMatrWhsTable.row($(item)).data().inSlipSeq=='자동채번'?'':inMatrWhsTable.row($(item)).data().inSlipSeq);
								obj.inSlipNo = '';
								obj.inSlipSeq = '';
								
								obj.cutQty = tableData[i].cutQty;
								obj.cutSize = tableData[i].cutSize;
								obj.dealCorpNm = tableData[i].dealCorpNm;
								obj.eaQty = tableData[i].eaQty;
								obj.lcNm = tableData[i].lcNm;
								obj.locIdx = tableData[i].locIdx;
								obj.matrlNm = tableData[i].matrlNm;
								obj.paperType = tableData[i].paperType;
								obj.preInDate = tableData[i].preInDate;
								obj.preInQty = tableData[i].preInQty;
								obj.purchaseInDueDate = tableData[i].purchaseInDueDate;
								obj.purchaseOrdDate = tableData[i].purchaseOrdDate;
								obj.remainQty = tableData[i].remainQty;
								obj.sizeX = tableData[i].sizeX;
								obj.sizeY = tableData[i].sizeY;
								obj.inMatrEtc1 = inMatrlEtc1;
								obj.inMatrEtc2 = inMatrlEtc2;
								obj.inMatrEtc3 = inMatrlEtc3;
								
								array.push(obj);
							}
						}
					}

					
				}
				
			}
		});
		if(!status){
			return false;
		}
		
		if(array.length == 0){
			toastr.warning('남은 수량이 0이므로 입고 처리가 불가능합니다.');
			purchaseOrderAdmTable.ajax.reload();
			inMatrWhsTable.clear().draw();
			inMatrWhsTable.ajax.reload(function() {
				$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
					$(item).find('input').attr('disabled', false);// 검색 필터 enable
				});
			});
			inMatrWhsTable.colReorder.enable();
			$('#dtlAllCheckBox').prop('checked',false);
			$('#admAllCheckBox').prop('checked',false);
			
			return false;
		}
	
		$.ajax({
			url: '<c:url value="/stock/inMatrWhsAdmIU"/>',
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
					purchaseOrderAdmTable.ajax.reload();
					inMatrWhsTable.clear().draw();
					inMatrWhsTable.ajax.reload(function() {
						$('#inMatrWhsTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					inMatrWhsTable.colReorder.enable();
					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼
					$('#dtlAllCheckBox').prop('checked',false);
					$('#admAllCheckBox').prop('checked',false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	});
	
	//체크박스	
	//adm
	// 모든 체크박스 체크/해제 되도록
	$(document).on('change','input:checkbox[name=admCheckBox]', function(){
		if( $('input:checkbox[name=admCheckBox]').length == $('input:checkbox[name=admCheckBox]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
			$('#admAllCheckBox').prop('checked',true);
		} else{
			$('#admAllCheckBox').prop('checked',false);
		}
 	});

	//모든 체크박스 선택
	$('#admAllCheckBox').on('click',function(){
		if($('#admAllCheckBox').prop("checked")){
			$('input:checkbox[name=admCheckBox]').prop('checked',true);
		}else{
			$('input:checkbox[name=admCheckBox]').prop('checked',false);
		}
	});

	//dtl
	// 모든 체크박스 체크/해제 되도록
	$(document).on('change','input:checkbox[name=dtlCheckBox]', function(){
		if( $('input:checkbox[name=dtlCheckBox]').length == $('input:checkbox[name=dtlCheckBox]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
			$('#dtlAllCheckBox').prop('checked',true);
		} else{
			$('#dtlAllCheckBox').prop('checked',false);
		}
 	});

	//모든 체크박스 선택
	$('#dtlAllCheckBox').on('click',function(){
		if($('#dtlAllCheckBox').prop("checked")){
			$('input:checkbox[name=dtlCheckBox]').prop('checked',true);
		}else{
			$('input:checkbox[name=dtlCheckBox]').prop('checked',false);
		}
	});



	// 유저모달 버튼 click
	$(document).on('click', '.btnUserModalShow', function() {
		$('#userModal').data('table',$(this).data('table'));
		$('#userModal').modal('show');
	});
	$('#userModal').on('shown.bs.modal', function() {
		userModalTable.ajax.reload(function() {});
	});

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
			{ data: 'userJobCd', className : 'text-center'},
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
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
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
				let cell = $('#userModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
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

	// 사용자목록 적용 버튼 click
	$('#btnUserModalPaste').on('click', function(){
		if(!$('#userModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let table = $('#'+$('#userModal').data('table')).dataTable().api();
		let node = table.row('.selected').node();
		let data = table.row('.selected').data();
		let selectNodeModalData = userModalTable.row('.selected').data();
		$(node).find('td').eq(table.column('inMatrlEtc2:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//사용자 식별자
		$(node).find('td').eq(table.column('inMatrlEtc2:name').index()).find('input[type=text]').val(selectNodeModalData.userName);		//사용자 이름
		$('#userModal').modal('hide');
	});

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let table = $('#'+$('#userModal').data('table')).dataTable().api();
		let node = table.row('.selected').node();
		let data = table.row('.selected').data();
		let selectNodeModalData = userModalTable.row(this).data();
		$(node).find('td').eq(table.column('inMatrlEtc2:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//사용자 식별자
		$(node).find('td').eq(table.column('inMatrlEtc2:name').index()).find('input[type=text]').val(selectNodeModalData.userName);		//사용자 이름
		$('#userModal').modal('hide');
	});
	
	//외관검사 바꿀때
	$(document).on('change','select[name=exteriorInspect]',function(){
		$('#my-spinner').show();
		let attr = this;
		let tableId = $(attr).parent().parent().parent().parent().attr('id');
		$.ajax({
			url : '<c:url value="/bm/locationAdmList"/>',
			type : 'GET',
			//async: false,
			data : {
				itemGubun	:	function() { return '';}
			},
			beforeSend: function() {
	           	$('#my-spinner').show();
        	},
			success : function(res) {
				if (res.result == "ok") { //응답결과
					data = res.data;
					//부적합인경우
					if($(attr).val() == '02'){
						let filterList = _.filter(data, v=> v.lcTypeReturn == 'Y' && v.lcTypeOutput == 'Y' && v.itemGubun == '003' );
						let minObj = _.minBy(filterList, v=> v.idx );
						let node = $('#'+tableId).DataTable().row($(attr).parent().parent()).node();

						if( tableId == 'inMatrWhsTable' ){
							let lcNmCol = inMatrWhsTable.column('lcNm:name').index();
							$(node).find('td').eq(lcNmCol).find('input[type=hidden]').val(minObj.idx);
							$(node).find('td').eq(lcNmCol).find('input[type=text]').val(minObj.lcNm);
							
						} else if( tableId == 'purchaseOrderAdmTable' ){
							let lcNmCol = purchaseOrderAdmTable.column('lcNm:name').index();
							$(node).find('td').eq(lcNmCol).find('input[type=hidden]').val(minObj.idx);
							$(node).find('td').eq(lcNmCol).find('input[type=text]').val(minObj.lcNm);
						}
						console.log('asdf');
					} else {
						
					}
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
