<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbarL centercol dragbarR rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr 4px 1fr 4px 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnLargeSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnLargeNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLargeSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnLargeEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnLargeDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLargeCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="largeInfoAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">사용여부</th>
							<th class="text-center">품목구분</th>
							<th class="text-center">품목구분명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="dragbarL" onmousedown="StartDrag('L')" ondblclick="minimum(this)"></div>
	
	<div id="centercol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnMediumNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMediumSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnMediumEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnMediumDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMediumCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="mediumInfoAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">사용여부</th>
							<th class="text-center">품목구분1</th>
							<th class="text-center">품목구분명1</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="dragbarR" onmousedown="StartDrag('R')" ondblclick="minimum(this)"></div>
	
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSmallNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSmallSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSmallEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnSmallDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSmallCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="smallInfoAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">사용여부</th>
							<th class="text-center">품목구분2</th>
							<th class="text-center">품목구분명2</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

</div>

<style>
#dragbarL {
	background-color: #cccccc;
	grid-area: dragbarL;
	cursor: ew-resize;
}
#dragbarR {
	background-color: #cccccc;
	grid-area: dragbarR;
	cursor: ew-resize;
}
</style>

<!-- 화면설정 script -->
<script>
	let isDraggingL = false; // 왼쪽 드레그 여부
	let isDraggingR = false; // 오른쪽 드레그 여부
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
		if(type == 'L') { isDraggingL = true; SetCursor("ew-resize");}
		if(type == 'R') { isDraggingR = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingL || isDraggingR) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDraggingL = false;
			isDraggingR = false;
			SetCursor("auto");
		}
	}
	
	function minimum(node) {
		let id = $(node).attr('id');

		if(id == 'dragbarL') {
			let dragbarWidth = 4;

			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cols = [];

			//최소화기능만 적용
			cols = [
				page_width - rightcol_width - centercol_min_width - dragbarWidth*2,
				dragbarWidth,
				centercol_min_width,
				dragbarWidth,
				rightcol_width
			];
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-columns', newColDefn);
			
		} else if(id == 'dragbarR') {
			let dragbarWidth = 4;

			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cols = [];

			cols = [
				leftcol_width,
				dragbarWidth,
				page_width - leftcol_width - rightcol_min_width - dragbarWidth*2,
				dragbarWidth,
				rightcol_min_width
			];
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-columns', newColDefn);
		}

		dataTableDrawAll(); // dataTable 전체 reload
	}
	
	function OnDrag(event) {
		if (isDraggingL) {
			let dragbarWidth = 4;
			
			let page_width = parseInt($('#page').width()); 			// 전체 길이
			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cursorX = event.clientX;	// 현재 cursor x좌표

			let cols = [
				Math.min(Math.max(leftcol_min_width, cursorX), page_width - rightcol_width - centercol_min_width - dragbarWidth*2),
				dragbarWidth,
				page_width - rightcol_width - dragbarWidth*2 - Math.min(Math.max(leftcol_min_width, cursorX), page_width - rightcol_width - centercol_min_width - dragbarWidth*2),
				dragbarWidth,
				rightcol_width
			];

	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

			$('#page').css('grid-template-columns', newColDefn);
	
			event.preventDefault();
		} else if (isDraggingR) {
			let dragbarWidth = 4;

			let page_width = parseInt($('#page').width()); 			// 전체 길이
			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cursorX = event.clientX;	// 현재 cursor x좌표
			
			let cols = [
				leftcol_width,
				dragbarWidth,
				Math.min(Math.max(cursorX - leftcol_width - dragbarWidth, centercol_min_width), page_width - leftcol_width - dragbarWidth*2 - rightcol_min_width),
				dragbarWidth,
				Math.max(rightcol_min_width, page_width - leftcol_width - dragbarWidth*2 - Math.max(cursorX - leftcol_width - dragbarWidth, centercol_min_width))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			$('#page').css('grid-template-columns', newColDefn);
	
			event.preventDefault();
		}
	}

</script>
<script>
	WM_init('LARGE');
	WM_init('MEDIUM');
	WM_init('SMALL');
	
	let largeIdxVal = '';
	let mediumIdxVal = '';

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'LARGE') { // 품목구분 수정중이나 신규등록중이였을 경우
			$('#btnLargeSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'MEDIUM') { // 품목구분1 수정중이나 신규등록중이였을 경우
			$('#btnMediumSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'SMALL') { // 품목구분2 수정중이나 신규등록중이였을 경우
			$('#btnSmallSave').trigger('click');
			return false;
		} else {
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if (WMlastIdx == 'LARGE') { // 품목구분 수정중이나 신규등록중이였을 경우
			WM_action_OFF(WMlastIdx);
			$('#btnLargeSearch').trigger('click');
			if (WM_close_check()) {
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'MEDIUM') { // 품목구분1 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				largeInfoAdmTable.row('#'+idx).select();
				$(largeInfoAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'SMALL') { // 품목구분2 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				largeInfoAdmTable.row('#'+idx).select();
				$(largeInfoAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				mediumInfoAdmTable.row('#'+idx).select();
				$(mediumInfoAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else {
			return false;
		}
	});
	
	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		let idx = '';
		let lmsType = '';
		let check = true;
		
		if ( deleteType == 'LARGE' ) {
			idx = largeInfoAdmTable.row('.selected').data().idx;
			lmsType = largeInfoAdmTable.row('.selected').data().lmsType;
		} else if ( deleteType == 'MEDIUM' ) {
			idx = mediumInfoAdmTable.row('.selected').data().idx;
			lmsType = mediumInfoAdmTable.row('.selected').data().lmsType;
		} else if ( deleteType == 'SMALL' ) {
			idx = smallInfoAdmTable.row('.selected').data().idx;
			lmsType = smallInfoAdmTable.row('.selected').data().lmsType;
		} else {
			check = false;
			return false;
		}
		
		if (check) {
			$.ajax({
				url: '<c:url value="/bm/itemGubunLmsAdmDel"/>',
	            type: 'POST',
	            data: {
	                'idx'		:	idx,
	                'lmsType'	:	lmsType,
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") {
						toastr.success('삭제되었습니다.');
						
						if ( deleteType == 'LARGE' ) {
							mediumInfoAdmTable.clear().draw();
							mediumInfoAdmTable.ajax.reload();
							smallInfoAdmTable.clear().draw();
							smallInfoAdmTable.ajax.reload();
							largeInfoAdmTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'MEDIUM' ) {
							smallInfoAdmTable.clear().draw();
							smallInfoAdmTable.ajax.reload();
							mediumInfoAdmTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'SMALL' ) {
							smallInfoAdmTable.row('.selected').remove().draw(false);
						}
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				},
				complete: function() {
					$('#my-spinner').hide();
		        },
			});
		}
	});
	
	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if (cancelType == 'LARGE') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('LARGE');

			$('#btnLargeSearch').trigger('click'); // 조회 버튼 click
			
			largeInfoAdmTable.colReorder.enable();
			
			$('#btnLargeNew').attr('disabled', false); // 신규 버튼
			$('#btnLargeSave').attr('disabled', true); // 저장 버튼
			$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
			$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
			$('#btnLargeCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'MEDIUM') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('MEDIUM');

			mediumInfoAdmTable.ajax.reload();
			mediumInfoAdmTable.colReorder.disable();
			
			$('#btnMediumNew').attr('disabled', false); // 신규 버튼
			$('#btnMediumSave').attr('disabled', true); // 저장 버튼
			$('#btnMediumEdit').attr('disabled', false); // 수정 버튼
			$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
			$('#btnMediumCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'SMALL') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('SMALL');

			smallInfoAdmTable.ajax.reload();
			smallInfoAdmTable.colReorder.disable();
			
			$('#btnSmallNew').attr('disabled', false); // 신규 버튼
			$('#btnSmallSave').attr('disabled', true); // 저장 버튼
			$('#btnSmallEdit').attr('disabled', false); // 수정 버튼
			$('#btnSmallDel').attr('disabled', false); // 삭제 버튼
			$('#btnSmallCancel').attr('disabled', true); // 취소 버튼
		} else {
			console.error("예상치 못한 오류 발생: btnCancelModalY onClick");
		}
	});
	
	// 품목구분 테이블
	$('#largeInfoAdmTable thead tr').clone(true).addClass('filters').appendTo('#largeInfoAdmTable thead'); // filter 생성
	let largeInfoAdmTable = $('#largeInfoAdmTable').DataTable({
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
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'L'; },
				'largeIdx' 		: function() { return largeIdxVal; },
				'mediumIdx' 	: function() { return mediumIdxVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분
				data: 'itemGubun', className : 'text-center', name: 'itemGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분명
				data: 'itemGubunNm', className : 'text-center', name: 'itemGubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
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
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
	                	selected:null
	        		},
	        	},
	        },
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true,
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#largeInfoAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#largeInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	largeInfoAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = largeInfoAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#largeInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 품목구분1 테이블
	$('#mediumInfoAdmTable thead tr').clone(true).addClass('filters').appendTo('#mediumInfoAdmTable thead'); // filter 생성
	let mediumInfoAdmTable = $('#mediumInfoAdmTable').DataTable({
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
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'M'; },
				'largeIdx' 		: function() { return largeIdxVal; },
				'mediumIdx' 	: function() { return mediumIdxVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분1
				data: 'itemGubun1', className : 'text-center', name: 'itemGubun1',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분명1
				data: 'itemGubun1Nm', className : 'text-center', name: 'itemGubun1Nm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
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
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
	                	selected:null
	        		},
	        	},
	        },
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true,
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#mediumInfoAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#mediumInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	mediumInfoAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = mediumInfoAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#mediumInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 품목구분2 테이블
	$('#smallInfoAdmTable thead tr').clone(true).addClass('filters').appendTo('#smallInfoAdmTable thead'); // filter 생성
	let smallInfoAdmTable = $('#smallInfoAdmTable').DataTable({
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
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'S'; },
				'largeIdx' 		: function() { return largeIdxVal; },
				'mediumIdx' 	: function() { return mediumIdxVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
				}
			},
			{//품목구분2
				data: 'itemGubun2', className : 'text-center', name: 'itemGubun2',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{//품목구분명2
				data: 'itemGubun2Nm', className : 'text-center', name: 'itemGubun2Nm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
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
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
	                	selected:null
	        		},
	        	},
	        },
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true,
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#smallInfoAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#smallInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	smallInfoAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = smallInfoAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#smallInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 품목구분 테이블 행 클릭시
	$('#largeInfoAdmTable tbody').on('click','tr', function() {
		let idx = largeInfoAdmTable.row(this).data().idx;
// 		let commonType = largeInfoAdmTable.row(this).data().commonType;
		largeIdxVal = idx;
// 		commonTypeVal = commonType;
		
		if(WMCheck('MEDIUM')) { //품목구분1 등록/수정중일 시
			setWM('MEDIUM', 'idx', idx);
			return false;
		}
		if(WMCheck('SMALL')) { //품목구분2 등록/수정중일 시
			setWM('SMALL', 'idx', idx);
			return false;
		}

		mediumInfoAdmTable.ajax.reload(function() {
			$('#btnMediumNew').attr('disabled', false); //  신규 버튼
			$('#btnMediumSave').attr('disabled', true); //  저장 버튼
			$('#btnMediumEdit').attr('disabled', false); //  수정 버튼
			$('#btnMediumDel').attr('disabled', false); //  삭제 버튼
			$('#btnMediumCancel').attr('disabled', true); //  취소 버튼
		});
		smallInfoAdmTable.clear().draw();

		$('#mediumInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});
	
	// 메뉴정보관리 ADM 조회 버튼 click
	$('#btnLargeSearch').on('click', function() {
		if(WMCheck('LARGE')) {
			return false;
		}
		$('#my-spinner').show();

		largeInfoAdmTable.clear().draw();
		largeInfoAdmTable.ajax.reload(function() {
			largeInfoAdmTable.rowReorder.disable();
		});
		
		$('#largeInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnLargeNew').attr('disabled', false); // 신규 버튼
		$('#btnLargeSave').attr('disabled', true); // 저장 버튼
		$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
		$('#btnLargeCancel').attr('disabled', true); // 취소 버튼

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	
	// 메뉴정보관리 ADM 신규 버튼 click
	$('#btnLargeNew').on('click', function() {
		WM_action_ON('LARGE', 'workingWarningModal');
		let col_filter_text = [];
		$('#largeInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		largeInfoAdmTable.row.add({
			'idx'			:	'',
			'useYn'			:	col_filter_text[0],
			'itemGubun'		:	col_filter_text[1],
			'itemGubunNm'		:	col_filter_text[2]
		}).draw(false);
		
		largeInfoAdmTable.colReorder.disable();

		$('#btnLargeNew').attr('disabled', false); // 신규 버튼
		$('#btnLargeSave').attr('disabled', false); // 저장 버튼
		$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
		$('#btnLargeCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 공통코드관리 ADM 수정 버튼 click
	$('#btnLargeEdit').on('click', function() {
		WM_action_ON('LARGE', 'workingWarningModal');
		$('#largeInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#largeInfoAdmTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == largeInfoAdmTable.column('useYn:name').index()) {
						let value = largeInfoAdmTable.row(tr).data().useYn;
						if(value == 'Y') {
							$(td).html('<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="Y">사용</option><option value="N" selected>미사용</option></select>');
						}
						
					} else {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				}
			})
		});

		largeInfoAdmTable.colReorder.disable();

		$('#btnLargeNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnLargeSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnLargeEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnLargeCancel').attr('disabled', false); // ADM 취소 버튼
	});
	
	// 품목구분 저장 버튼 클릭시
	$('#btnLargeSave').on('click', function() {
		let array = [];
		let state = true;
		$('#largeInfoAdmTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = largeInfoAdmTable.row($(item)).data().idx;
				let useYn = $(td).eq(largeInfoAdmTable.column('useYn:name').index()).find('select').val();
				let itemGubun = $(td).eq(largeInfoAdmTable.column('itemGubun:name').index()).find('input').val();
				let itemGubunNm = $(td).eq(largeInfoAdmTable.column('itemGubunNm:name').index()).find('input').val();

				if(useYn == '') {
					toastr.warning('사용여부를 선택해주세요.');
					$(td).eq(largeInfoAdmTable.column('useYn:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(itemGubun == '') {
					toastr.warning('대분류코드를 입력해주세요.');
					$(td).eq(largeInfoAdmTable.column('itemGubun:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(itemGubunNm == '') {
					toastr.warning('대분류명을 입력해주세요.');
					$(td).eq(largeInfoAdmTable.column('itemGubunNm:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.lmsType = 'L';
				obj.itemGubun = itemGubun;
				obj.itemGubunNm = itemGubunNm;
				obj.largeIdx = '';
				obj.itemGubun1 = '';
				obj.itemGubun1Nm = '';
				obj.mediumIdx = '';
				obj.itemGubun2 = '';
				obj.itemGubun2Nm = '';
				obj.useYn = useYn;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'itemGubun').length) {
			toastr.warning('중복되는 대분류코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, largeInfoAdmTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/itemGubunLmsAdmIU"/>',
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

					WM_action_OFF('LARGE');

					$('#btnLargeSearch').trigger('click'); // 조회버튼 click

					$('#btnLargeNew').attr('disabled', false); // 신규 버튼
					$('#btnLargeSave').attr('disabled', true); // 저장 버튼
					$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
					$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
					$('#btnLargeCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// 품목구분 삭제 버튼 클릭시
	$('#btnLargeDel').on('click', function() {
		if($('#largeInfoAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 품목구분 항목을 선택해주세요.');
			return false;
		}

		let data = largeInfoAdmTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','LARGE');
		} else {
			largeInfoAdmTable.row('.selected').remove().draw();
		}
	});
	
	// 품목구분 취소 버튼 클릭시
	$('#btnLargeCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'LARGE');
	});
	
	//중분류////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 품목구분1 테이블 행 클릭시
	$('#mediumInfoAdmTable tbody').on('click','tr', function() {
		let idx = mediumInfoAdmTable.row(this).data().idx;
// 		let commonType = largeInfoAdmTable.row(this).data().commonType;
		mediumIdxVal = idx;
// 		commonTypeVal = commonType;
		
		if(WMCheck('LARGE')) { //품목구분 등록/수정중일 시
			setWM('LARGE', 'idx', idx);
			return false;
		}
		if(WMCheck('SMALL')) { //품목구분2 등록/수정중일 시
			setWM('SMALL', 'idx', idx);
			return false;
		}

		smallInfoAdmTable.ajax.reload(function() {
			$('#btnSmallNew').attr('disabled', false); //  신규 버튼
			$('#btnSmallSave').attr('disabled', true); //  저장 버튼
			$('#btnSmallEdit').attr('disabled', false); //  수정 버튼
			$('#btnSmallDel').attr('disabled', false); //  삭제 버튼
			$('#btnSmallCancel').attr('disabled', true); //  취소 버튼
		});

		$('#smallInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});
	
	// 품목구분1 등록 버튼 클릭시
	$('#btnMediumNew').on('click', function() {
		if(largeInfoAdmTable.row('.selected').data() == undefined) {
			toastr.warning('품목구분 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('MEDIUM', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#mediumInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		mediumInfoAdmTable.row.add({
			'idx'		:	'',
			'largeIdx'	:	largeInfoAdmTable.row('.selected').data().idx,
			'useYn'		:	col_filter_text[0],
			'itemGubun1'	:	col_filter_text[1],
			'itemGubun1Nm'	:	col_filter_text[2]
		}).draw(false);

		mediumInfoAdmTable.colReorder.disable();

		$('#btnMediumNew').attr('disabled', false); // 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // 저장 버튼
		$('#btnMediumEdit').attr('disabled', false); // 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 품목구분1 수정 버튼 클릭시
	$('#btnMediumEdit').on('click', function() {
		WM_action_ON('MEDIUM', 'workingWarningModal');
		
		$('#mediumInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#mediumInfoAdmTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == mediumInfoAdmTable.column('useYn:name').index()) {
						let value = mediumInfoAdmTable.row(tr).data().useYn;
						if(value == 'Y') {
							$(td).html('<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="Y">사용</option><option value="N" selected>미사용</option></select>');
						}
					} else {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				}
			})
		});

		mediumInfoAdmTable.colReorder.disable();

		$('#btnMediumNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnMediumEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// 품목구분1 저장 버튼 클릭시
	$('#btnMediumSave').on('click', function() {
		let array = [];
		let state = true;
		$('#mediumInfoAdmTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = mediumInfoAdmTable.row($(item)).data().idx;
				let largeIdx = largeInfoAdmTable.row('.selected').data().idx;
				let useYn = $(td).eq(mediumInfoAdmTable.column('useYn:name').index()).find('select').val();
				let itemGubun1 = $(td).eq(mediumInfoAdmTable.column('itemGubun1:name').index()).find('input').val();
				let itemGubun1Nm = $(td).eq(mediumInfoAdmTable.column('itemGubun1Nm:name').index()).find('input').val();

				if(useYn == '') {
					toastr.warning('사용여부를 선택해주세요.');
					$(td).eq(mediumInfoAdmTable.column('useYn:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(itemGubun1 == '') {
					toastr.warning('중분류코드를 입력해주세요.');
					$(td).eq(mediumInfoAdmTable.column('itemGubun1:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(itemGubun1Nm == '') {
					toastr.warning('중분류명을 입력해주세요.');
					$(td).eq(mediumInfoAdmTable.column('itemGubun1Nm:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.lmsType = 'M';
				obj.itemGubun = '';
				obj.itemGubunNm = '';
				obj.largeIdx = largeIdx;
				obj.itemGubun1 = itemGubun1;
				obj.itemGubun1Nm = itemGubun1Nm;
				obj.mediumIdx = '';
				obj.itemGubun2 = '';
				obj.itemGubun2Nm = '';
				obj.useYn = useYn;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'itemGubun1').length) {
			toastr.warning('중복되는 중분류코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, mediumInfoAdmTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/itemGubunLmsAdmIU"/>',
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

					WM_action_OFF('MEDIUM');

					mediumInfoAdmTable.clear().draw();
					mediumInfoAdmTable.ajax.reload(function() {
						$('#mediumInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					mediumInfoAdmTable.colReorder.enable();

					$('#btnMediumNew').attr('disabled', false); // 신규 버튼
					$('#btnMediumSave').attr('disabled', true); // 저장 버튼
					$('#btnMediumEdit').attr('disabled', false); // 수정 버튼
					$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
					$('#btnMediumCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// 품목구분1 삭제 버튼 클릭시
	$('#btnMediumDel').on('click', function() {
		if($('#mediumInfoAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 품목구분1 항목을 선택해주세요.');
			return false;
		}

		let data = mediumInfoAdmTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'MEDIUM');
		} else {
			mediumInfoAdmTable.row('.selected').remove().draw();
		}
	});
	
	// 품목구분1 취소 버튼 클릭시
	$('#btnMediumCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'MEDIUM');
	});
	
	//소분류////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 품목구분2 테이블 행 클릭시
	$('#smallInfoAdmTable tbody').on('click','tr', function() {
		if(WMCheck('LARGE')) { //품목구분 등록/수정중일 시
			setWM('LARGE', 'idx', idx);
			return false;
		}
		if(WMCheck('MEDIUM')) { //품목구분1 등록/수정중일 시
			setWM('MEDIUM', 'idx', idx);
			return false;
		}
	});
	
	// 품목구분2 등록 버튼 클릭시
	$('#btnSmallNew').on('click', function() {
		if(mediumInfoAdmTable.row('.selected').data() == undefined) {
			toastr.warning('품목구분1 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('SMALL', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#smallInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		smallInfoAdmTable.row.add({
			'idx'		:	'',
			'largeIdx'	:	mediumInfoAdmTable.row('.selected').data().largeIdx,
			'mediumIdx'	:	mediumInfoAdmTable.row('.selected').data().idx,
			'useYn'		:	col_filter_text[0],
			'itemGubun2'	:	col_filter_text[1],
			'itemGubun2Nm'	:	col_filter_text[2]
		}).draw(false);

		smallInfoAdmTable.colReorder.disable();

		$('#btnSmallNew').attr('disabled', false); // 신규 버튼
		$('#btnSmallSave').attr('disabled', false); // 저장 버튼
		$('#btnSmallEdit').attr('disabled', false); // 수정 버튼
		$('#btnSmallDel').attr('disabled', false); // 삭제 버튼
		$('#btnSmallCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 품목구분2 수정 버튼 클릭시
	$('#btnSmallEdit').on('click', function() {
		WM_action_ON('SMALL', 'workingWarningModal');
		
		$('#smallInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#smallInfoAdmTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == smallInfoAdmTable.column('useYn:name').index()) {
						let value = smallInfoAdmTable.row(tr).data().useYn;
						if(value == 'Y') {
							$(td).html('<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="Y">사용</option><option value="N" selected>미사용</option></select>');
						}
						
					}  else {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				}
			})
		});

		smallInfoAdmTable.colReorder.disable();

		$('#btnSmallNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnSmallSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnSmallEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnSmallDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnSmallCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// 품목구분2 저장 버튼 클릭시
	$('#btnSmallSave').on('click', function() {
		let array = [];
		let state = true;
		$('#smallInfoAdmTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = smallInfoAdmTable.row($(item)).data().idx;
				let largeIdx = largeInfoAdmTable.row('.selected').data().idx;
				let mediumIdx = mediumInfoAdmTable.row('.selected').data().idx;
				let useYn = $(td).eq(smallInfoAdmTable.column('useYn:name').index()).find('select').val();
				let itemGubun2 = $(td).eq(smallInfoAdmTable.column('itemGubun2:name').index()).find('input').val();
				let itemGubun2Nm = $(td).eq(smallInfoAdmTable.column('itemGubun2Nm:name').index()).find('input').val();

				if(useYn == '') {
					toastr.warning('사용여부를 선택해주세요.');
					$(td).eq(smallInfoAdmTable.column('useYn:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(itemGubun2 == '') {
					toastr.warning('소분류코드를 입력해주세요.');
					$(td).eq(smallInfoAdmTable.column('itemGubun2:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(itemGubun2Nm == '') {
					toastr.warning('소분류명을 입력해주세요.');
					$(td).eq(smallInfoAdmTable.column('itemGubun2Nm:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.lmsType = 'S';
				obj.itemGubun = '';
				obj.itemGubunNm = '';
				obj.largeIdx = largeIdx;
				obj.itemGubun1 = '';
				obj.itemGubun1Nm = '';
				obj.mediumIdx = mediumIdx;
				obj.itemGubun2 = itemGubun2;
				obj.itemGubun2Nm = itemGubun2Nm;
				obj.useYn = useYn;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'itemGubun2').length) {
			toastr.warning('중복되는 소분류코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, smallInfoAdmTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/itemGubunLmsAdmIU"/>',
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

					WM_action_OFF('SMALL');

					smallInfoAdmTable.clear().draw();
					smallInfoAdmTable.ajax.reload(function() {
						$('#smallInfoAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					smallInfoAdmTable.colReorder.enable();

					$('#btnSmallNew').attr('disabled', false); // 신규 버튼
					$('#btnSmallSave').attr('disabled', true); // 저장 버튼
					$('#btnSmallEdit').attr('disabled', false); // 수정 버튼
					$('#btnSmallDel').attr('disabled', false); // 삭제 버튼
					$('#btnSmallCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// 품목구분2 삭제 버튼 클릭시
	$('#btnSmallDel').on('click', function() {
		if($('#smallInfoAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 품목구분2 항목을 선택해주세요.');
			return false;
		}

		let data = smallInfoAdmTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'SMALL');
		} else {
			smallInfoAdmTable.row('.selected').remove().draw();
		}
	});
	
	// 품목구분2 취소 버튼 클릭시
	$('#btnSmallCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'SMALL');
	});
	
</script>

</body>
</html>