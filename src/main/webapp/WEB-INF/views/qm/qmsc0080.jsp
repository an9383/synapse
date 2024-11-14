<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
	<input type="file" id="fileFake" style="display:none;" value="" multiple> 
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">검사일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="prcssInspectAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">공정명</th>
							<th class="text-center">검사자</th>
							<th class="text-center">검사수량</th>
							<th class="text-center">검사일자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightHeader">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-100">
					
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button></form>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
					
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
					<div class="row" style="padding: 5px;" id="upperRow">
						<table class="table table-bordered p-0 m-0">
							<colgroup>
								<col width="16%">
								<col width="34%">
								<col width="16%">
								<col width="34%">
							</colgroup>
							<tr>
								<th class="text-center align-middle">프로젝트번호</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">												
										<input type="hidden" class="inputGroup" id="bizOrdAdmIdx" disabled>
										<input type="text" class="form-control inputGroup" id="prjCd" disabled>											
										<button type="button" class="btn btn-primary input-sub-search disGroup" id="btnProjectSel" onclick="prjSel()" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>								</td>
								<th class="text-center align-middle">프로젝트명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control inputGroup" id="prjNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">공정코드</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">												
										<input type="hidden" class="inputGroup" id="prcssIdx" disabled>
										<input type="text" class="form-control inputGroup" id="prcssCd" disabled>												
										<button type="button" class="btn btn-primary input-sub-search disGroup" id="btnPrcssSel" onclick="prcssSel()" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">공정명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control inputGroup" id="prcssNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">검사자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;">												
										<input type="hidden" class="inputGroup" id="inspectUserIdx" disabled>
										<input type="text" class="form-control inputGroup" id="inspectUserNm" disabled>												
										<button type="button" class="btn btn-primary input-sub-search disGroup" id="btnInspectUserSel" onclick="userSel()" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">검사수량</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control inputGroup disGroup" style="text-align:right;" onkeyup="numberFormat(this,'int')" id="inspectQty" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">검사일자</th>
								<td class="text-center align-middle">
								<input type="date" class="form-control inputGroup disGroup" id="inspectDate" disabled>
								</td>
								<th class="text-center align-middle">비고</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control inputGroup disGroup" id="inspectDesc" disabled>
								</td>
							</tr>
						</table>
					</div>
				  	<div class="row">
				  		<div class="d-flex align-items-center justify-content-end w-100 mb-1">
				  			<input type="file" class="d-none" id="inspectFile" name="inspectFile">
					  		<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnFileNew" disabled><i class="fa-solid fa-plus"></i></button>
								<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnFileDel" disabled><i class="fa-solid fa-trash-can"></i></button>
<!-- 								<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btninspectFile" disabled><i class="fa-solid fa-folder"></i></button> -->
							</div>
						</div>
						<table class="table table-bordered p-0 m-0" id="inspectFileTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">순번</th>
									<th class="text-center align-middle">첨부파일</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 모달 -->
<div class="modal fade" id="projectModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
					<div class="col-6">
						<h5 class="modal-title">
							프로젝트 조회
						</h5>
					</div>
					<div class="col-6 d-flex justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectModalPaste">
								<i class="fa-regular fa-paste"></i>
							</button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
								<i class="fa-solid fa-xmark"></i>
							</button>
						</div>
					</div>

			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center m-1">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주일자</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startBizDate">
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endBizDate">
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주번호</th>
							<th class="text-center">고객발주번호</th>
							<th class="text-center">수주일자</th>
							<th class="text-center">품목유형</th>
							<th class="text-center">품명</th>
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
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		if($('#rightcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '4fr 4px 6fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 6fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '4fr 4px 6fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '4fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#startBizDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endBizDate').val(moment().format('YYYY-MM-DD'));
	$('#inspectDate').val(moment().format('YYYY-MM-DD'));
	
	let departmentList = getCommonCode('시스템', '002'); // 부서
	
	$('#userModal').draggable({handle: ".modal-header"});
	
	let idx = '';
	let fileIdx = '';
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let formData = new FormData();

	let bizOrdAdmIdx = '';
	let serialNoIdx = 0;
	let inspectAdmIdx = '';
	let inspectDtlIdx = '';
	let statusGubun = 'update';
	let deleteGubun = 'adm';
	
	let fileName = '';
	let fileFormData = new FormData();
	let fileNumber = 0;

	let dataList = new Array();

	// 수주 목록 조회
	$('#prcssInspectAdmTable thead tr').clone(true).addClass('filters').appendTo('#prcssInspectAdmTable thead'); // filter 생성
	let prcssInspectAdmTable = $('#prcssInspectAdmTable').DataTable({
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
			url : '<c:url value="/qm/prcssInspectAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'bizOrdNo', className : 'text-center align-middle'},
			{ data: 'prcssNm', className : 'text-center align-middle'},
			{ data: 'inspectUserNm', className : 'text-center align-middle'},
			{ data: 'inspectQty', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(data)+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data : 'inspectDate', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			}
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
			let theadHeight = parseFloat($('#prcssInspectAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#prcssInspectAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prcssInspectAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	prcssInspectAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = prcssInspectAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#prcssInspectAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		prcssInspectAdmTable.ajax.reload(function() {});
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 검사 데이터 click
	$('#prcssInspectAdmTable tbody').on('click','tr', function() {
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}

		$('.disGroup').attr('disabled', true);

		$('#btnNew').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').attr('disabled', true);
		$('#btnCancel').attr('disabled', true);
		

		$('#btnFileDel').attr('disabled', true);
		$('#btnFileNew').attr('disabled', true);
		
		$('#bizOrdAdmIdx').val(prcssInspectAdmTable.row(this).data().bizOrdAdmIdx);
		$('#prjCd').val(prcssInspectAdmTable.row(this).data().prjCd);
		$('#prjNm').val(prcssInspectAdmTable.row(this).data().prjNm);
		
		$('#prcssIdx').val(prcssInspectAdmTable.row(this).data().prcssIdx);
		$('#prcssCd').val(prcssInspectAdmTable.row(this).data().prcssCd);
		$('#prcssNm').val(prcssInspectAdmTable.row(this).data().prcssNm);

		$('#inspectUserIdx').val(prcssInspectAdmTable.row(this).data().inspectUserIdx);
		$('#inspectUserNm').val(prcssInspectAdmTable.row(this).data().inspectUserNm);
		$('#inspectQty').val(addCommas(prcssInspectAdmTable.row(this).data().inspectQty));
		$('#inspectDate').val(moment(prcssInspectAdmTable.row(this).data().inspectDate).format('YYYY-MM-DD'));
		$('#inspectDesc').val(prcssInspectAdmTable.row(this).data().inspectDesc);
		
		$('#btnProjectSel').attr('disabled', true);
		$('#btnPrcssSel').attr('disabled', true);
		$('#btnInspectUserSel').attr('disabled', true);
		
		status = '001';
		idx = prcssInspectAdmTable.row(this).data().idx;
		statusGubun = 'UPDATE';
		fileFormData = new FormData();
		inspectFileTable.ajax.reload(function() {});
	});
	
	// 검사 항목 목록조회
	let inspectFileTable = $('#inspectFileTable').DataTable({
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
        scrollY: '68.5vh',
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
			url : '<c:url value="/qm/prcssInspectFileLst"/>',
			type : 'POST',
			data : {
				'idx'	: function() { return idx; },
			},
		},
        //rowId: 'idx',
		columns : [
			{  //순번
				render: function(data, type, row, meta) {
					return '<div name="fileIndex">'+(meta.row+1)+'</div>';
				}, "className": "text-center align-middle"
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
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
		buttons : [],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let headerHeight = parseFloat($('#rightHeader').css('height'));
			let theadHeight = parseFloat($('#inspectFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let upperHeight = parseFloat($('#upperRow').css('height'));
			let btnHeight = parseFloat($('#inspectFile').parent().css('height'));
			
			$('#inspectFileTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - headerHeight - upperHeight - btnHeight - 44)+'px');
			
			$('#inspectFileTable_filter').addClass('d-none');
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
					let selectData = inspectFileTable.row(item).data();
					if( inspectFileTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(inspectFileTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(inspectFileTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#inspectFileTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inspectFileTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	inspectFileTable.on('column-reorder', function( e, settings, details ) {
		let api = inspectFileTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inspectFileTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//테이블 클릭
	$('#inspectFileTable tbody').on('click','tr', function() {
		$('#btnFileDel').attr('disabled',false);
	});

	//등록 버튼 클릭
	$('#btnNew').on('click', function() {
		WM_action_ON('new', 'workingWarningModal');
		statusGubun = 'CREATE';
		idx='';
		inspectFileTable.ajax.reload(function() {});
		$('.inputGroup').val('');
		$('.disGroup').attr('disabled', false);
		$('#inspectDate').val(moment().format('YYYY-MM-DD'));

		$('#btnNew').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#btnCancel').attr('disabled', false);
		

		$('#btnFileDel').attr('disabled', true);
		$('#btnFileNew').attr('disabled', false);
	});

	//수정 버튼 클릭
	$('#btnEdit').on('click', function() {
		WM_action_ON('edit', 'workingWarningModal');
		statusGubun = 'UPDATE';
		$('.disGroup').attr('disabled', false);

		$('#btnNew').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#btnCancel').attr('disabled', false);
		

		$('#btnFileDel').attr('disabled', true);
		$('#btnFileNew').attr('disabled', false);
	});
	
	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		let saveCheck = true;
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				if($('#bizOrdAdmIdx').val() == '') {
					toastr.warning('프로젝트를 선택해주세요.');
					$('#btnProjectSel').select();
					state = false;
					$('#my-spinner').hide();
					return false;
				}
				if($('#prcssIdx').val() == '') {
					toastr.warning('공정을 선택해주세요.');
					$('#btnPrcssSel').select();
					state = false;
					$('#my-spinner').hide();
					return false;
				}
				if($('#inspectUserIdx').val() == '') {
					toastr.warning('작성자를 선택해주세요.');
					$('#btnInspectUserSel').select();
					state = false;
					$('#my-spinner').hide();
					return false;
				}
				if(state) {
					let url = '';
					if(statusGubun == 'CREATE'){
						url = '<c:url value="/qm/prcssInspectAdmIns"/>';
					} else {
						url = '<c:url value="/qm/prcssInspectAdmUpd"/>';
					}
					$.ajax({
						url : url,
						type : 'POST', 
						data : {
							'idx'			: function(){ return statusGubun=='UPDATE'?prcssInspectAdmTable.row('.selected').data().idx:'';},
							'bizOrdAdmIdx' 	: function(){ return $('#bizOrdAdmIdx').val(); },
							'prcssIdx'		: function(){ return $('#prcssIdx').val(); },
							'inspectUserIdx': function(){ return $('#inspectUserIdx').val(); },
							'inspectQty'	: function(){ return $('#inspectQty').val().replace(/,/g,''); },
							'inspectDate'	: function(){ return $('#inspectDate').val().replace(/-/g,''); },
							'inspectDesc'	: function(){ return $('#inspectDesc').val(); }
						},
			            success : function(res) {
							if (res.result == "ok") { 
								if($('#inspectFileTable').DataTable().rows().count()>0) {
									let admIdx='';
									if(statusGubun == 'CREATE'){
										admIdx = res.data;
										idx = res.data;
									} else {
										admIdx = prcssInspectAdmTable.row('.selected').data().idx;
									}
									let fileString = [];
									let i=0;
									let formData2 = new FormData();
									let entries = formData.entries();
									for (let pair of entries) {
										if(i%3 == 0){
											formData2.append(pair[0].split('+')[0]+'-'+pair[0].split('+')[1],pair[1]);
										} else {
											formData2.append(pair[0].split('+')[0],pair[1]);
										}
										i++;
									}
									i=0;
									$('#inspectFileTable tbody').find('tr').each(function(index, item) {
										if( inspectFileTable.row(this).data() != undefined && inspectFileTable.row(this).data() != null){
											if( inspectFileTable.row(this).data().idx == '' || inspectFileTable.row(this).data().idx == undefined ){ 
												//파일스트링 만드는곳					
												let fileArr = formData2.getAll('file-'+formData2.getAll('uuid')[i])[0].name.split('.');
												let fileNm = _.slice(fileArr, 0, -1).join('.');
												
												let obj = {};
												obj.uuid = formData2.getAll('uuid')[i];
												obj.fileName = fileNm;
												obj.fileExt = formData2.getAll('ext')[i];
												fileString.push(obj);
												i++;
											}
										}
									});

									$.ajax({
										url: '<c:url value="/qm/prcssInspectFileIns"/>',
							            type: 'POST',
							            //async: false,
							            data: {    
								            'admIdx'			:	function(){return admIdx;},
							            	'fileString'		:	JSON.stringify(fileString),
							            },

										success : function(res) {
											if (res.result == "ok") { //응답결과
												if(fileString != ''){
													fileUpload(formData2); // 파일 업로드
												}
												formData = new FormData();
											} else if(res.result == 'fail') {
												toastr.warning(res.message);
											} else {
												toastr.error(res.message);
											}
										}
									});
								}

								toastr.success('저장되었습니다.');
								
								$('.disGroup').attr('disabled', true);

								$('#btnNew').attr('disabled', false);
								$('#btnEdit').attr('disabled', true);
								$('#btnDel').attr('disabled', true);
								$('#btnSave').attr('disabled', true);

								$('#btnFileDel').attr('disabled', true);
								$('#btnFileNew').attr('disabled', true);
							} else {
								toastr.error(res.message);
							}
						},
						complete : function() {
							$('#my-spinner').hide();
							statusGubun=='CREATE'?WM_action_OFF('new'):WM_action_OFF('edit');
							prcssInspectAdmTable.ajax.reload();
							inspectFileTable.ajax.reload();
						}
					})
					
				}
			},100)
		})
	});

	//파일 추가
	$('#btnFileNew').on('click', function() {
		$('#fileFake').trigger('click');
	});

	//파일 선택
	
	$('#fileFake').on('change',function(e) {
		let fileInput = document.getElementById('fileFake'); 
		if(fileInput.files.length>0){
			let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
	
			for(let i = 0; i < document.querySelector('#fileFake').files.length; i++){
				//폼데이터 넣는곳
				let uuid = uuid_v4();
				formData.append('file+'+uuid,files[i]);
				formData.append('uuid+'+uuid,uuid);
				formData.append('ext+'+uuid,files[i].name.split('.').at(-1));
				
				//페이크 업로드파일로부터 추가된 행에 데이터 옮겨주기
				let fileData =  document.querySelector('#fileFake').files[i];

				//파일명
				let fileArr = files[i].name.split('.');
				let fileNm = _.slice(fileArr, 0, -1).join('.');
				 
				inspectFileTable.row.add({
					'fileExt'     	: files[i].name.split('.').at(-1),
		 			'fileName'	:	files[i].name.split('.').at(0),
		 			'uuid' 		: uuid,

				}).draw(false);
			}
		}
		$('#fileFake').val('');
	});

	// 공정검사 삭제 버튼 클릭
	$('#btnDel').on('click', function(){
		if(!$('#prcssInspectAdmTable tbody tr').hasClass('selected')){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		deleteGubun = 'adm';
		$('#deleteModal').modal('show');
	})
	
	// 관련파일 삭제 버튼 클릭
	$('#btnFileDel').on('click', function() {
		if( !$('#inspectFileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#inspectFileTable').DataTable().row('.selected').data().idx!=null) {
			deleteGubun = 'file';
			$('#deleteModal').modal('show');
		} else {
			let uuid = inspectFileTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#inspectFileTable').DataTable().row('.selected').remove().draw();
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		if(deleteGubun=='adm'){
			idx = prcssInspectAdmTable.row('.selected').data().idx;
			$.ajax({
				url : '<c:url value="/qm/prcssInspectAdmDel"/>',
				type : 'POST',
				async : false,
				data : {
					'idx' : function(){ return idx; }
				},
				beforeSend: function() {
	            	$('#my-spinner').show();
	            },
	            success : function(res){
		            if(res.result == 'ok'){
			            let data = res.data;
			            let uuid = '';
			            let ext = '';
			            if(data.length>0){
				            for(var i=0;i<data.length;i++){
					            uuid = data[i].uuid;
					            ext = data[i].fileExt;
					            fileDelete({uuid:uuid,ext:ext});
					        }
				            inspectFileTable.ajax.reload();
				        }
			            toastr.success('삭제되었습니다.');
			            prcssInspectAdmTable.ajax.reload();
			        } else {
				        toastr.error(res.message);
				    }
		        },
		        complete : function() {
			        $('#my-spinner').hide();
			    }
			})
		} else if(deleteGubun=='file'){
			fileIdx = inspectFileTable.row('.selected').data().idx;
			
			$.ajax({
				url: '<c:url value="/qm/prcssInspectFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	function(){return fileIdx},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					let uuid = $('#inspectFileTable').DataTable().row('.selected').data().uuid;;
					let ext = $('#inspectFileTable').DataTable().row('.selected').data().fileExt;
					fileDelete({uuid:uuid,ext:ext});
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#inspectFileTable').DataTable().row('.selected').remove().draw();
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

// 	$('#btnApproval').on('click', function() {
// 		let approvalCd = '';
// 		let approvalDate = $('#insertApprovalDate').val().replace(/-/g, '');
// 		if($('#btnApproval').text()=='승인') {
// 			approvalCd = '001';
// 		} else {
// 			approvalCd = '002';
// 			approvalDate = '';
// 		}

// 		$.ajax({
// 			url: '<c:url value="/qm/inspectAdmApprovalUpd"/>',
//             type: 'POST',
//             async: false,
//             data: {
//                 'idx'			:	inspectAdmIdx,
//                 'serialNoIdx'	:	serialNoIdx,
//                 'approvalYn'	:	approvalCd,
//                 'approvalDate'	:	approvalDate
//             },
//             beforeSend: function() {
//             	$('#my-spinner').show();
//             },
// 			success : function(res) {
// 				if (res.result == "ok") { //응답결과
// 					if(approvalCd=='001') {
// 						toastr.success('승인되었습니다');
// 						$('#approvalYn').val('승인');
// 						$('#btnApproval').text('미승인');
// 						$('#approvalDate').val(moment(approvalDate).format('YYYY-MM-DD'));
// 					} else {
// 						toastr.success('미승인되었습니다');
// 						$('#approvalYn').val('미승인');
// 						$('#btnApproval').text('승인');
// 						$('#approvalDate').val('');
// 					}
// 				} else if(res.result == 'fail') {
// 					toastr.warning(res.message);
// 				} else {
// 					toastr.error(res.message);
// 				}
// 				$('#my-spinner').hide();
// 			}
// 		});
// 	});

	let inputStatus = '';

	function prjSel() {
		$('#projectModal').modal('show');
		setTimeout(function(){
			projectModalTable.rows('.selected').deselect();
			projectModalTable.ajax.reload(function(){});
		}, 200);
	}
	
	function prcssSel() {
		$('#prcssModal').modal('show');
		setTimeout(function(){
			prcssModalTable.rows('.selected').deselect();
			prcssModalTable.ajax.reload(function(){});
		}, 200);
	}
	
	function userSel() {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.rows('.selected').deselect();
			userModalTable.ajax.reload(function() {});
		}, 200);
	}
	
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
			{ data: 'userJobNm', className : 'text-center'},
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
			let theadHeight = parseFloat($('#userModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 197)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			//$('#searchAll').off('keyup',function() {});
			//$('#searchAll').on('keyup',function() {
			//	$('#'+table_id+'_filter').find('input').val($(this).val());
			//	$('#'+table_id+'_filter').find('input').trigger('keyup');
			//});
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

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
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
		if( !$('#userModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = userModalTable.row('.selected').data();

		$('#inspectUserIdx').val(data.idx);
		$('#inspectUserNm').val(data.userName);
		
		$('#userModal').modal('hide');
	});


	//공정정보모달 조회
	$('#prcssModalTable thead tr').clone(true).addClass('filters').appendTo('#prcssModalTable thead'); // filter 생성
	let prcssModalTable = $('#prcssModalTable').DataTable({
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
			url : '<c:url value="/bm/prcssListAll"/>',
			type : 'GET',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'prcssCd', className : 'text-center'},
			{ data: 'prcssNm', className : 'text-center'},
			{ data: 'qtyUnitNm', className : 'text-center'},
			{ data: 'initial', className : 'text-center'},
			{ data: 'prcssDesc', className : 'text-center'},
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
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#prcssModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#prcssModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prcssModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	prcssModalTable.on('column-reorder', function( e, settings, details ) {
		let api = prcssModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#prcssModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//공정목록 적용 버튼 클릭
	$('#btnPrcssModalPaste').on('click', function(){
		if( !$('#prcssModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = prcssModalTable.row('.selected').data();

		$('#prcssIdx').val(data.idx);
		$('#prcssCd').val(data.prcssCd);
		$('#prcssNm').val(data.prcssNm);
		$('#prcssModal').modal('hide');
	});

	// 수주 목록 조회
	$('#projectModalTable thead tr').clone(true).addClass('filters').appendTo('#projectModalTable thead'); // filter 생성
	let projectModalTable = $('#projectModalTable').DataTable({
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
			url : '<c:url value="/bs/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startBizDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endBizDate').val()).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'prjCd', className : 'text-center align-middle'},
			{ data: 'bizOrdNo', className : 'text-center align-middle'},
			{ data: 'customerNo', className : 'text-center align-middle'},
			{ data: 'ordDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'goodsTypeNm', className : 'text-center align-middle'},
			{ data: 'goodsNm', className : 'text-center align-middle'},
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
			let theadHeight = parseFloat($('#projectModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#projectModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#projectModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	projectModalTable.on('column-reorder', function( e, settings, details ) {
		let api = projectModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#projectModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 프로젝트목록 적용 버튼 click
	$('#btnProjectModalPaste').on('click', function(){
		if( !$('#projectModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = projectModalTable.row('.selected').data();

 		$('#bizOrdAdmIdx').val(data.idx);
 		$('#prjCd').val(data.prjCd);
 		$('#prjNm').val(data.prjNm);
		
		$('#projectModal').modal('hide');
	});

	//취소 버튼 클릭
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		WM_action_OFF('new');
		WM_action_OFF('edit');

		toastr.success('취소되었습니다.');

		$('#btnSearch').trigger('click'); // 조회 버튼 click

		$('.inputGroup').val('');
		$('.disGroup').attr('disabled', true);
		$('#inspectDate').val(moment().format('YYYY-MM-DD'));
		
		idx ='';
		fileIdx='';
		prcssInspectAdmTable.ajax.reload();
		inspectFileTable.ajax.reload();
		$('#btnNew').attr('disabled', false);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').attr('disabled', true);
		$('#btnCancel').attr('disabled', true);

		$('#btnFileDel').attr('disabled', true);
		$('#btnFileNew').attr('disabled', true);
		
	});

	// 프로젝트 조회 모달 날짜 변경
	$(document).on('change','#startBizDate, #endBizDate', function(){
		projectModalTable.ajax.reload();
 	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});
 	
	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				prcssInspectAdmTable.row('#'+idx).select();
				$(prcssInspectAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				
				$('#btnNew').attr('disabled', false);
				$('#btnEdit').attr('disabled', true);
				$('#btnDel').attr('disabled', true);
				$('#btnSave').attr('disabled', true);
				$('#btnCancel').attr('disabled', true);

				$('#btnFileDel').attr('disabled', true);
				$('#btnFileNew').attr('disabled', true);
				formData = new FormData();
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').val('');
				$('.disGroup').attr('disabled', true);
				$('#inspectDate').val(moment().format('YYYY-MM-DD'));
				
				idx ='';
				fileIdx='';
				prcssInspectAdmTable.ajax.reload();
				inspectFileTable.ajax.reload();
				$('#btnNew').attr('disabled', false);
				$('#btnEdit').attr('disabled', true);
				$('#btnDel').attr('disabled', true);
				$('#btnSave').attr('disabled', true);
				$('#btnCancel').attr('disabled', true);

				$('#btnFileDel').attr('disabled', true);
				$('#btnFileNew').attr('disabled', true);
				formData = new FormData();
			}
			
			return false;
		}
	});
	
	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}
</script>

</body>
</html>