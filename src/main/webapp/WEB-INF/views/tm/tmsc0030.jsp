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
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">폐기일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품목</label>
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="searchItemNm" disabled>
						<button type="button" class="btnInputDel" id="btnSearchItemDel" style="background-color: transparent; border-color: transparent; position: absolute;
							top: 0; right:0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<input type="hidden" id="searchItemIdx">
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchItem">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit">
							<i class="fa-regular fa-pen-to-square"></i>
						</button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled="disabled">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnPrint">라벨출력</button> -->
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="itemDisposal">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">고객사</th>
							<th class="text-center align-middle">제품명</th>
							<th class="text-center align-middle">버전번호</th>
							<th class="text-center align-middle">사이즈</th>
							<th class="text-center align-middle" style="max-width:80px;">현재고량</th>
							<th class="text-center align-middle" style="max-width:80px;">폐기량</th>
							<th class="text-center align-middle">폐기사유</th>
							<th class="text-center align-middle">폐기일자</th>
							<th class="text-center align-middle" style="min-width:120px;">비고사항</th>
							<th class="text-center align-middle" style="max-width:106px;">담당자</th>
							<th class="text-center align-middle" style="max-width:80px;">담당자확인</th>
							<th class="text-center align-middle" style="max-width:106px;">제조책임자</th>
							<th class="text-center align-middle" style="max-width:110px;">제조책임자확인</th>
							<th class="text-center align-middle" style="max-width:80px;">폐기코드</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 입고라벨 모달 ====================================================================================-->
<div class="modal fade" id="printModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content overflow-auto" style="height: calc(100vh - 5em);">
			<div class="modal-body">
				<div class="grid" id="printPaper" style="padding-top: 0px; padding-right:40px; padding-left: 40px;">
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

			console.log(Math.max(rightColWidth, rightcolMinWidth));
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

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let disposalCd = getCommonCode('일반', '038'); // 폐기구분
	let pageLengthCnt = parseInt(getCommonCode('시스템', '025')[0].commonCd); //페이징수량
	

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	// 입고내역 목록조회
	$('#itemDisposal thead tr').clone(true).addClass('filters').appendTo('#itemDisposal thead'); // filter 생성
	let itemDisposal = $('#itemDisposal').DataTable({
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
            style: 'multi',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/stock/itemDisposalAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				itemIdx : function() { return $('#searchItemIdx').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'customerNm', className : 'text-center align-middle'},//고객사
			{ data: 'itemNm', className : 'text-center align-middle'},//제품명
			{ data: 'itemVersion', className : 'text-center align-middle'},//버전번호
			{ data: 'itemSize', className : 'text-center align-middle'},//사이즈
			{ data: 'spQty', className : 'text-end align-middle', //현재고량
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseInt(data));
					} else {
						return '0';
					}
				}
			},
			{ data: 'disposalQty', className : 'text-end align-middle',name:'disposalQty',//폐기량
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = '';
							html += '<input disabled type="text" style="text-align:right;" class="form-control inputGroup" name="disposalQty" onkeyup="numberFormat(this,\'int\')" value="'+addCommas(parseFloat(data))+'">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
							html += '<input disabled type="text" style="text-align:right;" class="form-control inputGroup" name="disposalQty" onkeyup="numberFormat(this,\'int\')" value="0">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'disposalReason', className : 'text-center align-middle',name:'disposalReason',//폐기사유
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = '';
							html += '<textarea disabled class="form-control inputGroup" style="resize: none;min-width:300px;min-height:39px;" name="disposalReason">'+data+'</textarea>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
							html += '<textarea disabled class="form-control inputGroup" style="resize: none;min-width:300px;min-height:39px;" name="disposalReason"></textarea>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'disposalDate', className : 'text-center align-middle',name:'disposalDate',//폐기일자
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = '';
							html += '<input disabled type="date" class="inputGroup form-control" name="disposalDate" value="'+moment(data).format('YYYY-MM-DD')+'">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
							html += '<input disabled type="date" class="inputGroup form-control" name="disposalDate" value="">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'disposalDesc', className : 'text-center align-middle',name:'disposalDesc',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = '';
							html += '<input disabled type="text" class="inputGroup form-control" id="disposalDesc" value="'+data+'">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
							html += '<input disabled type="text" class="inputGroup form-control" id="disposalDesc" value="">';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},//비고사항
			{ data: 'mangerNm', className : 'text-center align-middle',name:'mangerNm',//담당자
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = '';
							html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
							html += '	<input type="text" class="form-control" value="'+data+'"  disabled>';
							html += '	<button type="button" class="btnInputDel inputGroup" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="'+row['mangerIdx']+'">';
							html += '	<button type="button" data-type="manger" style="padding: 1px 4px; margin-left: 0px;" class="inputGroup btn btn-primary btnUserModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
						html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
						html += '	<input type="text" class="form-control" value=""  disabled>';
						html += '	<button type="button" class="btnInputDel inputGroup" style="background-color: transparent;';
						html += '		border-color: transparent; position: absolute;';
						html += '		top: 0; right:0;';
						html += '		margin: 1px 23px; margin-left: 0px;';
						html += '		border: none;';
						html += '		" disabled>';
						html += '		<i class="fa-solid fa-xmark"></i>';
						html += '	</button>';
						html += '	<input type="hidden" value="">';
						html += '	<button type="button" data-type="manger" style="padding: 1px 4px; margin-left: 0px;" class="inputGroup btn btn-primary btnUserModalShow" disabled>';
						html += '		<i class="fa-solid fa-magnifying-glass"></i>';
						html += '	</button>';
						html += '</div>';
						html += '<span class="d-none"></span>';
					return html;
					}
				}
			},
			{ data: 'workYn', className : 'text-center align-middle',name:'workYn',//담당자확인
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						if(data == 'Y') {
							let html = '';
							html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
							html += '		data-type="workYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
							html += '		data-size="small"';
							html += '		checked>';
							return html;
						} else {
							let html = '';
							html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
							html += '		data-type="workYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
							html += '		data-size="small"';
							html += '		>';
							return html;
						}
					} else {
						let html = '';
						html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
						html += '		data-type="workYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
						html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
						html += '		data-size="small"';
						html += '		>';
						return html;
					}
				}
			},
			{ data: 'produceMangerNm', className : 'text-center align-middle',name:'produceMangerNm',
				render: function(data, type, row, meta){
					if(data != null && data != ''){
						let html = '';
							html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
							html += '	<input type="text" class="form-control" value="'+data+'"  disabled>';
							html += '	<button type="button" class="inputGroup btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="'+row['produceMangerIdx']+'">';
							html += '	<button type="button" data-type="produceManger" style="padding: 1px 4px; margin-left: 0px;" class="inputGroup btn btn-primary btnUserModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else {
						let html = '';
							html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
							html += '	<input type="text" class="form-control" value=""  disabled>';
							html += '	<button type="button" class="inputGroup btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="">';
							html += '	<button type="button" data-type="produceManger" style="padding: 1px 4px; margin-left: 0px;" class="inputGroup btn btn-primary btnUserModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none"></span>';
						return html;
					}
				}
			},//제조책임자
			{ data: 'finalCheckYn', className : 'text-center align-middle',name:'finalCheckYn',//제조책임자확인
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						if(data == 'Y') {
							let html = '';
							html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
							html += '		data-type="finalCheckYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
							html += '		data-size="small"';
							html += '		checked>';
							return html;
						} else {
							let html = '';
							html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
							html += '		data-type="finalCheckYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
							html += '		data-size="small"';
							html += '		>';
							return html;
						}
					} else {
						let html = '';
						html += '<input type="checkbox" class="bootstrapToggle checkToggle p-0" data-toggle="toggle"';
						html += '		data-type="finalCheckYn" data-itemIdx="'+row['itemIdx']+'" data-idx="'+row['idx']+'"';
						html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
						html += '		data-size="small"';
						html += '		>';
						return html;
					}
				}
			},
			{ data: 'disposalCd', className : 'text-center align-middle',name:'disposalCd',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let html = selectBoxHtml(disposalCd, 'disposalCd'+meta.row, 'disposalCd', data, '선택', { disabled: true });
						return html;
					} else {
						return selectBoxHtml(disposalCd, 'disposalCd'+meta.row, 'disposalCd', '', '선택', { disabled: true });
					}
				}
			},//폐기코드
			/* { className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<input class="form-control text-end" type="number" value="1" max="99" min="1">';
				}
			}, */

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
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemDisposal_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			$('.bootstrapToggle').bootstrapToggle();
			
			let data = api.data();
			let node = api.nodes();
			if(data.length > 0){
				$(node).find('tbody tr').each(function(index, item) {
					if( itemDisposal.row(item).data().finalCheckYn == 'Y' ) {
						$(itemDisposal.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(itemDisposal.row(item).node()).addClass('notEdit');
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
				let cell = $('#itemDisposal_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemDisposal_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	itemDisposal.on('column-reorder', function( e, settings, details ) {
		let api = itemDisposal;
		$('.bootstrapToggle').bootstrapToggle();
		api.columns().eq(0).each(function (colIdx) {
			$('#itemDisposal_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		itemDisposal.ajax.reload(function() {});
		itemDisposal.colReorder.enable();
		$('#itemDisposal_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false); // 검색 필터 disabled
		});
		WM_action_OFF('ADM');
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		$('#btnDel').attr('disabled',false);
		$('#btnCancel').attr('disabled',true);
		$('.workYn').bootstrapToggle('enable');
		$('.finalCheckYn').bootstrapToggle('enable');
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	$('#btnEdit').on('click',function(){
		$('#btnSave').attr('disabled',false);
		$('#btnEdit').attr('disabled',true);
		$('#btnDel').attr('disabled',false);
		$('#btnCancel').attr('disabled',false);
		
		WM_action_ON('ADM','workingWarningModal');


		$('#itemDisposal tbody tr').each(function(index,item){
			let data = itemDisposal.row(index).data();
			let node = itemDisposal.row(index).node();
			if(data.finalCheckYn != 'Y'){
				$(node).find('td').find('.inputGroup').attr('disabled',false);
				$(node).find('td').find('select[name=disposalCd]').attr('disabled',false);
				$(node).find('td').find('.workYn').bootstrapToggle('enable');
				$(node).find('td').find('.finalCheckYn').bootstrapToggle('enable');
			} else {
				$(node).find('td').find('.inputGroup').attr('disabled',true);
				$(node).find('td').find('select[name=disposalCd]').attr('disabled',true);
				$(node).find('td').find('.workYn').bootstrapToggle('disable');
				$(node).find('td').find('.finalCheckYn').bootstrapToggle('disable');
			}
		});

		$('#itemDisposal_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		itemDisposal.colReorder.disable();
	});

	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'ADM');
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'ADM') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		} 
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'ADM') { // 등록중이거나 수정중이였을 경우
			WM_action_OFF('ADM');
			if(window.location != window.parent.location) { // tab일 경우
				// 부모 탭 닫기버튼 click
				$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
		    }
			
			$('.inputGroup').attr('disabled', true); // 입력항목
			$('#btnSave').attr('disabled',true);
			$('#btnEdit').attr('disabled',false);
			$('#btnDel').attr('disabled',false);
			$('#btnCancel').attr('disabled',true);

			$('.workYn').bootstrapToggle('enable');
			$('.finalCheckYn').bootstrapToggle('enable');
		}
			
			return false;
	});
	
	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if(cancelType == 'ADM') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('ADM');

			$('#btnSearch').trigger('click'); // 조회 버튼 click
			
		}
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('#itemDisposal tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = itemDisposal.row('.selected').data();

		$('#deleteModal').modal('show');
		$('#deleteModal').data('deleteType','ADM');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let data = itemDisposal.rows('.selected').data();
			let deleteIdx = '';
			for(var i = 0; i < data.length; i++){
				deleteIdx += data[i].idx + ', ';
			}
			deleteIdx = deleteIdx.slice(0,-2);
			
			$.ajax({
				url: '<c:url value="/stock/itemDisposalAdmDel"/>',
	            type: 'POST',
	            data: {
	            	'idx'		:	deleteIdx,
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						itemDisposal.clear().draw();
						itemDisposal.ajax.reload();
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

	// 저장버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#itemDisposal tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let data = itemDisposal.row($(item)).data();
			
			let disposalQty = $(td).eq(itemDisposal.column('disposalQty:name').index()).find('input').val();
			let disposalReason = $(td).eq(itemDisposal.column('disposalReason:name').index()).find('textarea').val();
			let disposalDate = $(td).eq(itemDisposal.column('disposalDate:name').index()).find('input').val().replaceAll('-','');
			let disposalDesc = $(td).eq(itemDisposal.column('disposalDesc:name').index()).find('input').val();
			let mangerIdx = $(td).eq(itemDisposal.column('mangerNm:name').index()).find('input[type=hidden]').val();
			let produceMangerIdx = $(td).eq(itemDisposal.column('produceMangerNm:name').index()).find('input[type=hidden]').val();
			let disposalCd = $(td).eq(itemDisposal.column('disposalCd:name').index()).find('select').val();

			if(state){
				if(disposalQty == '' || disposalQty == '0') {
					toastr.warning('폐기량을 입력해주세요.');
					$(td).eq(itemDisposal.column('disposalQty:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(disposalDate == '' || disposalDate == '0'){
					toastr.warning('폐기일자를 선택해주세요.');
					$(td).eq(itemDisposal.column('disposalDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(mangerIdx == '' || mangerIdx == '0'){
					toastr.warning('담당자를 선택해주세요.');
					$(td).eq(itemDisposal.column('mangerNm:name').index()).find('.btnUserModalShow').focus();
					state = false;
					return false;
				}
				if(produceMangerIdx == '' || produceMangerIdx == '0'){
					toastr.warning('제조책임자를 선택해주세요.');
					$(td).eq(itemDisposal.column('produceMangerNm:name').index()).find('.btnUserModalShow').focus();
					state = false;
					return false;
				}
				if(disposalCd == '' || disposalCd == '0'){
					toastr.warning('폐기코드를 선택해주세요.');
					$(td).eq(itemDisposal.column('disposalCd:name').index()).find('select').focus();
					state = false;
					return false;
				}
			}
			
			let obj = new Object();
			obj.idx = itemDisposal.row($(item)).data().idx;
			obj.disposalQty = parseFloat(removeCommas(disposalQty));
			obj.disposalReason = disposalReason;
			obj.disposalDate = disposalDate;
			obj.disposalDesc = disposalDesc;
			obj.mangerIdx = mangerIdx;
			obj.produceMangerIdx = produceMangerIdx;
			obj.disposalCd = disposalCd;
		    array.push(obj);
		    
		});

		if(!state) {
			return false;
		}

		let tableData = [];
		for(var i=0;i<itemDisposal.data().count();i++) {
			let obj = {};
			obj.idx = itemDisposal.row(i).data().idx;
			obj.disposalQty = parseFloat(itemDisposal.row(i).data().disposalQty);
			obj.disposalReason = itemDisposal.row(i).data().disposalReason;
			obj.disposalDate = itemDisposal.row(i).data().disposalDate;
			obj.disposalDesc = itemDisposal.row(i).data().disposalDesc;
			obj.mangerIdx = itemDisposal.row(i).data().mangerIdx;
			obj.produceMangerIdx = itemDisposal.row(i).data().produceMangerIdx;
			obj.disposalCd = itemDisposal.row(i).data().disposalCd;
			tableData.push(obj);
		}

		array = _.differenceWith(array, tableData, _.isEqual);
		
		$.ajax({
			url: '<c:url value="/stock/itemDisposalAdmUpd"/>',
            type: 'POST',
            data: {
                'updateJson'	:	JSON.stringify(array)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('수정되었습니다.');
					$('#btnSearch').trigger('click');
					/* WM_action_OFF('ADM');
					
					itemDisposal.ajax.reload(function() {});
					$('#itemDisposal_wrapper').find('.filters th').each(function(index, item) {
						$(item).find('input').attr('disabled', false); // 검색 필터 disabled
					});
					itemDisposal.colReorder.enable();
        
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼 */
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		}); 
	});

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
		$('#searchItemNm').val(data.itemNm);
		$('#searchItemIdx').val(data.idx);
		$('#itemCodeModal').modal('hide');
	});

	$('#itemCodeModalTable tbody').on('dblclick','tr',function(){
		let data = itemCodeModalTable.row(this).data();
		$('#searchItemNm').val(data.itemNm);
		$('#searchItemIdx').val(data.idx);
		$('#itemCodeModal').modal('hide');
	});
	
	// 사용자모달 버튼 click
	$(document).on('click', '.btnUserModalShow', function() {
		$('#userModal').data('selectType',$(this).data('type'));
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
			{ data: 'userDepartmentCd', className : 'text-center'},
			{ data: 'userPositionCd', className : 'text-center'},
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
		let selectType = $('#userModal').data('selectType');
		
		let node = itemDisposal.row('.selected').node();
		let data = itemDisposal.row('.selected').data();
		let selectNodeModalData = userModalTable.row('.selected').data();

		let mangerNmCol = itemDisposal.column('mangerNm:name').index();
		let produceMangerCol = itemDisposal.column('produceMangerNm:name').index();
		
		if(selectType == 'manger' ){
			$(node).find('td').eq(mangerNmCol).find('input[type=hidden]').val(selectNodeModalData.idx);
			$(node).find('td').eq(mangerNmCol).find('input[type=text]').val(selectNodeModalData.userName);
		} else if(selectType == 'produceManger'){
			$(node).find('td').eq(produceMangerCol).find('input[type=hidden]').val(selectNodeModalData.idx);
			$(node).find('td').eq(produceMangerCol).find('input[type=text]').val(selectNodeModalData.userName);
		}
		$('#userModal').modal('hide');
	});

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let selectType = $('#userModal').data('selectType');
		
		let node = itemDisposal.row('.selected').node();
		let data = itemDisposal.row('.selected').data();
		let selectNodeModalData = userModalTable.row(this).data();

		let mangerNmCol = itemDisposal.column('mangerNm:name').index();
		let produceMangerCol = itemDisposal.column('produceMangerNm:name').index();
		
		if(selectType == 'manger' ){
			$(node).find('td').eq(mangerNmCol).find('input[type=hidden]').val(selectNodeModalData.idx);
			$(node).find('td').eq(mangerNmCol).find('input[type=text]').val(selectNodeModalData.userName);
		} else if(selectType == 'produceManger'){
			$(node).find('td').eq(produceMangerCol).find('input[type=hidden]').val(selectNodeModalData.idx);
			$(node).find('td').eq(produceMangerCol).find('input[type=text]').val(selectNodeModalData.userName);
		}
		$('#userModal').modal('hide');
	});

	$(document).off('change','#itemDisposal .checkToggle');
	$(document).on('change','#itemDisposal .checkToggle', function() {
		let data = itemDisposal.row($(this).parent().parent()).data();
		let idx = $(this).data('idx');
		let itemIdx = $(this).data('itemidx');
		let type = $(this).data('type');
		let check = $(this).prop('checked');
		
		let ajaxData = {};
		ajaxData.idx = idx;
		ajaxData.itemIdx = itemIdx;
		ajaxData.disposalQty = parseInt(removeCommas(data.disposalQty != null && data.disposalQty != ''  ? data.disposalQty : 0));
		if(type == 'workYn') { // 담당자
			ajaxData.workYn = (check?'Y':'N');
		} else if(type == 'finalCheckYn') { // 제조책임자
			ajaxData.finalCheckYn = (check?'Y':'N');
			if(!check){
				toastr.warning('제조책임자확인은<br>취소할 수 없습니다.');
				itemDisposal.ajax.reload();
				return false;
			}
		}

		
		$.ajax({
			url: '<c:url value="/stock/itemDisposalAdmCheckYnUpd"/>',
			type: 'POST',
			data: ajaxData,
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					//if(check) {
						toastr.success('처리되었습니다.');
					//} else {
					//	toastr.success('취소처리되었습니다.');
					//}
					itemDisposal.ajax.reload();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					itemDisposal.ajax.reload();
					itemDisposal.ajax.reload();
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
