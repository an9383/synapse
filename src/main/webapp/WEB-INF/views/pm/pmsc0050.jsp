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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">입고일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">원단</label>
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="searchMatrlNm" disabled>
						<button type="button" class="btnInputDel" style="background-color: transparent;
							border-color: transparent; position: absolute;
							top: 0; right:0;
							margin: 5px 23px; margin-left: 0px;
							border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<input type="hidden" id="searchMatrlIdx">
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchMatrl">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label>
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="exteriorInspect">
					</select>
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnPrint">라벨출력</button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="inMatrWhsTable">
					<thead class="table-light">
						<tr>
							<th class="text-center" style="padding: 0px;">
								<input class="form-check-input" type="checkbox" id="checkAll" style="margin: 0px; width: 25px; height: 25px;">
							</th>
							<th class="text-center align-middle">출력매수</th>
							<th class="text-center align-middle">입고번호</th>
							<th class="text-center align-middle">시퀀스</th>
							<th class="text-center align-middle">입고처</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">장*폭</th>
							<th class="text-center align-middle">발주일자</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">입고예정일</th>
							<th class="text-center align-middle">입고일자</th>
							<th class="text-center align-middle">입고수량</th>
							<th class="text-center align-middle">®</th>
							<th class="text-center align-middle">입고창고</th>
							<th class="text-center align-middle" style="min-width:80px;">외관검사</th>
							<th class="text-center align-middle">판정자</th>
							<th class="text-center align-middle" style="min-width:110px;">판정일자</th>
							<th class="text-center align-middle" style="min-width:280px;">비고</th>
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
	
	let exteriorInspect = getCommonCode('일반', '032'); // 외관검사
	
	selectBoxAppend(exteriorInspect, 'exteriorInspect', '', '1'); //외관검사
	

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	// 입고내역 목록조회
	$('#inMatrWhsTable thead tr').clone(true).addClass('filters').appendTo('#inMatrWhsTable thead'); // filter 생성
	let inMatrWhsTable = $('#inMatrWhsTable').DataTable({
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
			url : '<c:url value="/stock/inMatrWhsAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				matrlIdx : function() { return $('#searchMatrlIdx').val(); },
				inMatrEtc1 : function() { return $('#exteriorInspect').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['inMatrEtc1'] != '' && row['inMatrEtc1'] != null) {
						return '<input class="form-check-input" type="checkbox" name="labelPrint" style="margin: 0px; width: 25px; height: 25px;">';
					} else {
						return '<input class="form-check-input" type="checkbox" name="labelPrint" style="margin: 0px; width: 25px; height: 25px;" disabled>';
					}
					
				}
			},
			{ className : 'text-center align-middle', name: 'printCnt',
				render: function(data, type, row, meta) {
					return '<input class="form-control text-end" type="number" value="1" max="99" min="1">';
				}
			},
			{ data: 'inSlipNo', className : 'text-center align-middle', name: 'inSlipNo'},
			{ data: 'inSlipSeq', className : 'text-center align-middle', name: 'inSlipSeq'},
			{ data: 'dealCorpNm', className : 'text-center align-middle', name: 'dealCorpNm'},
			{ data: 'paperType', className : 'text-center align-middle', name: 'paperType'},
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return row['sizeX']+'*'+row['sizeY'];
				}
			},
			{ data: 'purchaseOrdDate', className : 'text-center align-middle', name: 'purchaseOrdDate',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
				}
			},
			{ data: 'purchaseOrdNo', className : 'text-center align-middle', name: 'purchaseOrdNo'},
			{ data: 'purchaseInDueDate', className : 'text-center align-middle', name: 'purchaseInDueDate',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
				}
			},
			{ data: 'inDate', className : 'text-center align-middle editNode', name: 'inDate',
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'inQty', className : 'text-end align-middle editNode', name: 'inQty',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return addCommas(parseInt(data));
					} else {
						return '';
					}
				}
			},
			{ data: 'inQty', className : 'text-end align-middle editNode', name: 'inQtyR',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						let returnValue = parseInt(data/500) + 'R' + parseInt(data%500);
						return returnValue;
					} else {
						return '0R0';
					}
				}
			},
			{ data: 'lcNm', className : 'text-center align-middle editNode', name: 'lcNm',
				render : function(data, type, row, meta) {
					if(data != '' && data != null){
						return data;
					} else {
						return '-';
					}
					/* if(row['inSlipNo'] != '' && row['inSlipNo'] != '자동채번' && row['inSlipNo'] != null) {
						let html = '';
							html += '<div class="input-group" style="min-width: 120px;max-width: 120px;">';
							html += '	<input type="text" class="form-control" value="'+data+'"  disabled>';
							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="'+row['whsIdx']+'">';
							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnLocationModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else { // 등록되어있지 않는 값
						let html = '';
							html += '<div class="input-group" style="min-width: 120px;max-width: 120px;">';
							html += '	<input type="text" class="form-control" value="'+data+'" disabled>';
							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		">';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="'+row['whsIdx']+'">';
							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnLocationModalShow">';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} */
					
				}
			},
			{ data:'inMatrEtc1Nm', className : 'text-center align-middle editNode', name: 'inMatrEtc1',
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						return data;
						//return selectBoxHtml(exteriorInspect, 'exteriorInspect', 'exteriorInspect', data, '선택', { disabled: true }); //외관검사
					} else {
						return '';
					}
				}
			},
			{ data:'inMatrEtc2Nm', className : 'text-center align-middle editNode', name: 'inMatrEtc2',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return data;
					} else {
						return '-';
					}
					/* if(row['inMatrEtc2'] != '' && row['inMatrEtc2'] != null) {
						let html = '';
							html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
							html += '	<input type="text" class="form-control" value="'+data+'"  disabled>';
							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="'+row['inMatrEtc2']+'">';
							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnUserModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none">'+data+'</span>';
						return html;
					} else { // 등록되어있지 않는 값
						let html = '';
							html += '<div class="input-group" style="min-width: 105px;max-width: 105px;">';
							html += '	<input type="text" class="form-control" value="" disabled>';
							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
							html += '		border-color: transparent; position: absolute;';
							html += '		top: 0; right:0;';
							html += '		margin: 1px 23px; margin-left: 0px;';
							html += '		border: none;';
							html += '		" disabled>';
							html += '		<i class="fa-solid fa-xmark"></i>';
							html += '	</button>';
							html += '	<input type="hidden" value="">';
							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary btnUserModalShow" disabled>';
							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
							html += '	</button>';
							html += '</div>';
							html += '<span class="d-none"></span>';
						return html;
					} */
					
				}
			},
			{ data:'inMatrEtc3', className : 'text-center align-middle editNode', name: 'inMatrEtc3',
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						return moment(data,'YYYYMMDD').format('YYYY-MM-DD');
					} else {
						return '';//'<input disabled type="date" max="9999-12-31" class="form-control text-center" value="'+moment().format('YYYY-MM-DD')+'">';
					}
				}
			},
			{ data: 'inDesc', className : 'text-center align-middle editNode', name: 'inDesc',
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';//'<input disabled type="text" class="form-control text-start" value="">';
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
			},
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#inMatrWhsTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
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


				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inMatrWhsTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
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

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		inMatrWhsTable.ajax.reload(function() {});
		WM_action_OFF('ADM');
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수정 버튼 click
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
					} /* else if(index_td == inMatrWhsTable.column('lcNm:name').index()) { // 입고창고
						let value = inMatrWhsTable.row(tr).data().lcNm;
						$(td).find('button').attr('disabled',false);
					} else if(index_td == inMatrWhsTable.column('inDesc:name').index()) { // 비고
						let value = (inMatrWhsTable.row(tr).data().inDesc==null?'':inMatrWhsTable.row(tr).data().inDesc);
						$(td).html('<input type="text" class="form-control text-start" value="'+value+'">');
					} else if(index_td == inMatrWhsTable.column('inMatrEtc1:name').index()) { // 외관검사
						let value = (inMatrWhsTable.row(tr).data().inMatrEtc1==null?'':inMatrWhsTable.row(tr).data().inMatrEtc1);
						$(td).html(selectBoxHtml(exteriorInspect, 'exteriorInspect', 'exteriorInspect', value, '선택', { disabled: false }));
					} else if(index_td == inMatrWhsTable.column('inMatrEtc2:name').index()) { // 외관검사
						let value = inMatrWhsTable.row(tr).data().inMatrEtc2;
						$(td).find('button').attr('disabled',false);
					} else if(index_td == inMatrWhsTable.column('inMatrEtc3:name').index()) { // 판정일자
						let value = inMatrWhsTable.row(tr).data().inMatrEtc3;
						value = moment(value).format('YYYY-MM-DD');
						$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
					} */
				}
			})
		});

		inMatrWhsTable.colReorder.disable();
		inMatrWhsTable.draw();

		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
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

			inMatrWhsTable.clear();
			inMatrWhsTable.ajax.reload();
			inMatrWhsTable.colReorder.enable();
			
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('#inMatrWhsTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = inMatrWhsTable.row('.selected').data();

		$('#deleteModal').modal('show');
		$('#deleteModal').data('deleteType','ADM');
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

	// 창고모달 버튼 click
	$(document).on('click', '.btnLocationModalShow', function() {
		$('#locationModal').modal('show');
	});
	$('#locationModal').on('shown.bs.modal', function() {
		locationModalTable.ajax.reload(function() {});
	});

	// 사용자모달 버튼 click
	$(document).on('click', '.btnUserModalShow', function() {
		$('#userModal').modal('show');
	});
	$('#userModal').on('shown.bs.modal', function() {
		userModalTable.ajax.reload(function() {});
	});

	// 저장버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#inMatrWhsTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length > 1 || $(item).find('td').find('select').length > 1) {
				let td = $(item).find('td');
				let data = inMatrWhsTable.row($(item)).data();
				
				let inDate = $(td).eq(inMatrWhsTable.column('inDate:name').index()).find('input').val();
				let inQty = $(td).eq(inMatrWhsTable.column('inQty:name').index()).find('input').val();
				let whsIdx = $(td).eq(inMatrWhsTable.column('lcNm:name').index()).find('input[type=hidden]').val();
				let inMatrEtc1 = $(td).eq(inMatrWhsTable.column('inMatrEtc1:name').index()).find('select').val();
				let inMatrEtc2 = $(td).eq(inMatrWhsTable.column('inMatrEtc2:name').index()).find('input[type=hidden]').val();
				let inMatrEtc3 = $(td).eq(inMatrWhsTable.column('inMatrEtc3:name').index()).find('input').val();
				let inDesc = $(td).eq(inMatrWhsTable.column('inDesc:name').index()).find('input').val();

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
				
				if(inMatrEtc1 != '' || inMatrEtc2 != '' || inMatrEtc3 != '') {
					if(inMatrEtc1 == '') {
						toastr.warning('외관검사를 선택해주세요.');
						$(td).eq(inMatrWhsTable.column('inMatrEtc1:name').index()).find('select').focus();
						state = false;
						return false;
					}
					if(inMatrEtc2 == '') {
						toastr.warning('판정자를 선택해주세요.');
						$(td).eq(inMatrWhsTable.column('inMatrEtc2:name').index()).find('button').eq(1).focus();
						state = false;
						return false;
					}
					if(inMatrEtc3 == '') {
						toastr.warning('판정일자를 선택해주세요.');
						$(td).eq(inMatrWhsTable.column('inMatrEtc3:name').index()).find('input').focus();
						state = false;
						return false;
					}
				}
				

				let obj = new Object();
				obj.inQty = inQty.replaceAll(/,/g,'');
				obj.inDate = moment(inDate).format('YYYYMMDD');
				obj.whsIdx = inMatrWhsTable.row($(item)).data().whsIdx;
				obj.inDesc = inMatrWhsTable.row($(item)).data().inDesc;
				obj.inMatrEtc1 = inMatrWhsTable.row($(item)).data().inMatrEtc1;
				obj.inMatrEtc2 = inMatrWhsTable.row($(item)).data().inMatrEtc2;
				obj.inMatrEtc3 = inMatrWhsTable.row($(item)).data().inMatrEtc3;

				obj.inSlipNo = inMatrWhsTable.row($(item)).data().inSlipNo;
				obj.inSlipSeq = inMatrWhsTable.row($(item)).data().inSlipSeq;
				obj.itemGubun = inMatrWhsTable.row($(item)).data().itemGubun;
				obj.matrlIdx = inMatrWhsTable.row($(item)).data().matrlIdx;
				obj.whsGubun = inMatrWhsTable.row($(item)).data().whsGubun;
				obj.lotNo = inMatrWhsTable.row($(item)).data().lotNo;
				obj.purchaseOrdNo = inMatrWhsTable.row($(item)).data().purchaseOrdNo;
				   
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}

		let inMatrWhsTableData = [];
		for(var i=0;i<inMatrWhsTable.data().count();i++) {
			let obj = {};
			obj.inQty = String(parseInt(inMatrWhsTable.row(i).data().inQty));
			obj.inDate = inMatrWhsTable.row(i).data().inDate;
			obj.whsIdx = inMatrWhsTable.row(i).data().whsIdx;
			obj.inDesc = inMatrWhsTable.row(i).data().inDesc;
			obj.inMatrEtc1 = (inMatrWhsTable.row(i).data().inMatrEtc1==null?'':inMatrWhsTable.row(i).data().inMatrEtc1);
			obj.inMatrEtc2 = (inMatrWhsTable.row(i).data().inMatrEtc2==null?'':inMatrWhsTable.row(i).data().inMatrEtc2);
			obj.inMatrEtc3 = (inMatrWhsTable.row(i).data().inMatrEtc3==null?'':inMatrWhsTable.row(i).data().inMatrEtc3);

			obj.inSlipNo = inMatrWhsTable.row(i).data().inSlipNo;
			obj.inSlipSeq = inMatrWhsTable.row(i).data().inSlipSeq;
			obj.itemGubun = inMatrWhsTable.row(i).data().itemGubun;
			obj.matrlIdx = inMatrWhsTable.row(i).data().matrlIdx;
			obj.whsGubun = inMatrWhsTable.row(i).data().whsGubun;
			obj.lotNo = inMatrWhsTable.row(i).data().lotNo;
			obj.purchaseOrdNo = inMatrWhsTable.row(i).data().purchaseOrdNo;
			inMatrWhsTableData.push(obj);
		}

		array = _.differenceWith(array, inMatrWhsTableData, _.isEqual);

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
					
					inMatrWhsTable.clear().draw();
					inMatrWhsTable.ajax.reload(function() {});
        
					inMatrWhsTable.colReorder.enable();
        
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








	

	// 모든 체크박스 선택
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop("checked")) {
			$('input[name=labelPrint]').not(':disabled').prop("checked",true);
		} else{
			$('input[name=labelPrint]').not(':disabled').prop("checked",false);
		}
		$('input[name=labelPrint]').eq(0).trigger('change');
	});

	// 라벨출력 버튼 click
	$('#btnPrint').on('click',function() {
		if($('input[name=labelPrint]:checked').length == 0) {
			toastr.warning('출력할 항목을 체크해주세요.');
			return false;
		}
		$('#my-spinner').show();

		$('#printPaper').empty();

		$('input[name=labelPrint]').each(function(index, item) {
			if($(this).prop('checked')) {
				let tr = $(this).parent().parent();
				let data = inMatrWhsTable.row(tr).data();
				let printCntIndex = inMatrWhsTable.column('printCnt:name').index();
				let printCnt = $(tr).find('td').eq(printCntIndex).find('input').val();
				let html = '';

				html +='<div style="display: grid;';
				html +='			grid-template-columns: repeat(2, 1fr);';
				html +='			gap: 9px 44px;';
				html +='			padding-top: 60px; page-break-after: always;">';
				for(var i=0;i<printCnt;i++) {
				html += 	labelMaker(data);
					if((i+1)%10 == 0 && (i+1) != printCnt) {
				html +='</div>';
				html +='<div style="display: grid;';
				html +='			grid-template-columns: repeat(2, 1fr);';
				html +='			gap: 9px 44px;';
				html +='			padding-top: 60px; page-break-after: always;">';
					}
				}
				html += '</div>';
				$('#printPaper').append(html);
			}
		});

		cssChange();

		//$('#printModal').modal('show');
		
		setTimeout(function() {
			$('#my-spinner').hide();
			$('#printPaper').print({
				globalStyles: true,
				mediaPrint: true
			});
		}, 200);
	});
	// 작업인쇄 모달이 띄워지면 인쇄
	//$('#printModal').on('shown.bs.modal', function (e) {
	//	$('#printPaper').print({
	//		globalStyles: true,
	//		mediaPrint: true
	//	});
	//	$('#printModal').modal('hide');
	//	$('#my-spinner').hide();
	//});

	// 라벨 HTML
	function labelMaker(data) {
		let html = '';
			html += '<table class="table table-bordered p-0 m-0">';
			html += '	<colgroup>';
			html += '		<col width="8%"><col width="8%"><col width="8%"><col width="8%">';
			html += '		<col width="8%"><col width="8%"><col width="8%"><col width="8%">';
			html += '		<col width="8%"><col width="8%"><col width="8%"><col width="8%">';
			html += '	</colgroup>';
			html += '	<tr>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">점검항목</td>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">점검결과</td>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">판&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정</td>';
			html += '	</tr>';
			html += '	<tr>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">';
			html += '			원<span style="position: absolute; color: #002766; font-size: 80px; font-weight: 900; opacity: 0.6;">적&nbsp;&nbsp;합</span>지명';
			html += '		</td>';
			html += '		<td colspan="4" class="text-center align-middle">'+data.paperType+'</td>';
			html += '		<td colspan="4" class="text-center align-middle" style="font-size: 8px; color: #bbbbbb;">';
			html += '			<span style="border: 1px solid #000000; border-radius: 10px; padding: 2px;">적합</span>';
			html += '			&nbsp;&nbsp;&nbsp;&nbsp;부적합';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">규  격</td>';
			html += '		<td colspan="4" class="text-center align-middle">'+data.sizeX+'x'+data.sizeY+'</td>';
			html += '		<td colspan="4" class="text-center align-middle" style="font-size: 8px; color: #bbbbbb;">';
			html += '			<span style="border: 1px solid #000000; border-radius: 10px; padding: 2px;">적합</span>';
			html += '			&nbsp;&nbsp;&nbsp;&nbsp;부적합';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">입고량</td>';
			html += '		<td colspan="4" class="text-center align-middle">'+parseInt(parseInt(data.inQty)/500)+'R'+(parseInt(data.inQty)%500==0?'':parseInt(data.inQty)%500)+'</td>';
			html += '		<td colspan="4" class="text-center align-middle" style="font-size: 8px; color: #bbbbbb;">';
			html += '			<span style="border: 1px solid #000000; border-radius: 10px; padding: 2px;">적합</span>';
			html += '			&nbsp;&nbsp;&nbsp;&nbsp;부적합';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr>';
			html += '		<td colspan="4" class="text-center align-middle fs-17">외  관</td>';
			html += '		<td colspan="4" class="text-center align-middle">'+data.inMatrEtc1Nm+'</td>';
			html += '		<td colspan="4" class="text-center align-middle" style="font-size: 8px; color: #bbbbbb;">';
			html += '			<span style="border: 1px solid #000000; border-radius: 10px; padding: 2px;">적합</span>';
			html += '			&nbsp;&nbsp;&nbsp;&nbsp;부적합';
			html += '		</td>';
			html += '	</tr>';
			html += '	<tr>';
			html += '		<td colspan="3" class="text-center align-middle fs-15">판정자</td>';
			html += '		<td colspan="3" class="text-center align-middle">'+data.inMatrEtc2Nm+'</td>';
			html += '		<td colspan="3" class="text-center align-middle fs-15">판정일자</td>';
			html += '		<td colspan="3" class="text-center align-middle">'+moment(data.inMatrEtc3).format('YY/MM/DD')+'</td>';
			html += '	</tr>';
			html += '</table>';
		return html;
	}

	function cssChange() {
		$('#printPaper').find('td').css('font-weight', '500');
		$('#printPaper').find('td').css('border', '1px solid black');
		$('#printPaper').find('td').css('padding', '2px 10px');
		$('#printPaper').find('td').css('color', '#000000');

		$('#printPaper').find('.bg-gray').css('background-color', '#f2f2f2');
		
		$('#printPaper').find('.theadFirstCol').css('border-top', '0px');
		//$('#printPaper').find('.theadFirstCol').css('border-left', '2px');
		$('#printPaper').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#printPaper').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#printPaper').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#printPaper').find('.tbodyFirstCol').css('border-left', '2px');
		$('#printPaper').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#printPaper').find('.tbodyNotFirstCol').css('border-left', '0px');
		
		$('#printPaper').find('.fs-8').css('font-size', '8px');
		$('#printPaper').find('.fs-10').css('font-size', '10px');
		$('#printPaper').find('.fs-13').css('font-size', '13px');
		$('#printPaper').find('.fs-15').css('font-size', '15px');
		$('#printPaper').find('.fs-17').css('font-size', '17px');
		$('#printPaper').find('.fs-20').css('font-size', '20px');
		$('#printPaper').find('.fs-25').css('font-size', '25px');
		$('#printPaper').find('.fs-30').css('font-size', '30px');
		$('#printPaper').find('.fs-50').css('font-size', '50px');
		$('#printPaper').find('.fc-red').css('color', '#ff0000');
		$('#printPaper').find('.bt-2').css('border-top', '2px solid black');
		$('#printPaper').find('.bd-n').css('border', '1px solid #ffffff');
		$('#printPaper').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#printPaper').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#printPaper').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#printPaper').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#printPaper').find('.h-5').css('height', '5px');
		$('#printPaper').find('.h-10').css('height', '10px');
		$('#printPaper').find('.h-20').css('height', '20px');
		$('#printPaper').find('.h-30').css('height', '30px');
		$('#printPaper').find('.h-40').css('height', '40px');
		$('#printPaper').find('.h-55').css('height', '55px');
		$('#printPaper').find('.h-70').css('height', '70px');
		$('#printPaper').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#printPaper').find('td').length;i++) {
			let tdStyle = $('#printPaper').find('td').eq(i).attr('style') == undefined?'':$('#printPaper').find('td').eq(i).attr('style');
			$('#printPaper').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}
	}















	$('#btnSearchMatrl').on('click', function(){
		$('#matrlModal').modal('show');   	
		setTimeout(function() {
			matrlModalTable.ajax.reload(function() {});
		}, 200);
	});

	$('#btnMatrlModalSearch').on('click',function(){
		matrlModalTable.ajax.reload(function() {});
	});
   	
 	// 투입자재 목록 조회
	$('#matrlModalTable thead tr').clone(true).addClass('filters').appendTo('#matrlModalTable thead'); // filter 생성
	let matrlModalTable = $('#matrlModalTable').DataTable({
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
			url : '<c:url value="/bm/matrlInfoListAll"/>',
			type : 'GET',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'itemGubunNm', className : 'text-center'},
			{ data: 'matrlCd', className : 'text-center'},
			{ data: 'paperType', className : 'text-center'},//재질
			{ data: 'sizeX', className : 'text-center'},//가로
			{ data: 'sizeY', className : 'text-center'},//세로
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
			let theadHeight = parseFloat($('#matrlModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 237)+'px');
			
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
				let cell = $('#matrlModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#matrlModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	matrlModalTable.on('column-reorder', function( e, settings, details ) {
		let api = matrlModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#matrlModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnMatrlModalPaste').on('click',function(){
		if( !$('#matrlModalTable tbody tr').hasClass('selected') ){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}

		let data = matrlModalTable.row('.selected').data();
		$('#searchMatrlNm').val(data.paperType);
		$('#searchMatrlIdx').val(data.idx);
		$('#matrlModal').modal('hide');
	});

	$('#matrlModalTable tbody').on('dblclick','tr',function(){
		let data = matrlModalTable.row(this).data();
		$('#searchMatrlNm').val(data.paperType);
		$('#searchMatrlIdx').val(data.idx);
		$('#matrlModal').modal('hide');
	});
	
	// 창고모달 목록조회
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
		let node = inMatrWhsTable.row('.selected').node();
		let data = inMatrWhsTable.row('.selected').data();
		let selectNodeModalData = locationModalTable.row('.selected').data();
		$(node).find('td').eq(inMatrWhsTable.column('lcNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//창고 식별자
		$(node).find('td').eq(inMatrWhsTable.column('lcNm:name').index()).find('input[type=text]').val(selectNodeModalData.lcNm);		//창고명
		$('#locationModal').modal('hide');
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

	// 사용자모달 조회 버튼 click
	$('#btnUserModalSearch').on('click', function() {
		userModalTable.ajax.reload(function(){});
	});
	
	// 사용자목록 적용 버튼 click
	$('#btnUserModalPaste').on('click', function(){
		if(!$('#userModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let node = inMatrWhsTable.row('.selected').node();
		let data = inMatrWhsTable.row('.selected').data();
		let selectNodeModalData = userModalTable.row('.selected').data();
		$(node).find('td').eq(inMatrWhsTable.column('inMatrEtc2:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);	//사용자 식별자
		$(node).find('td').eq(inMatrWhsTable.column('inMatrEtc2:name').index()).find('input[type=text]').val(selectNodeModalData.userName);		//사용자 이름
		$('#userModal').modal('hide');
	});
</script>

</body>
</html>
