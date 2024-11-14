<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbarL centercol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr 4px 1fr;">
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
				<table class="table table-bordered p-0 m-0" id="goodsTypeTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">유형코드</th>
							<th class="text-center">유형명</th>
							<th class="text-center">사용유무</th>
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
				<table class="table table-bordered p-0 m-0" id="goodsTypeDtlTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">No</th>
							<th class="text-center">제품명</th>
							<th class="text-center">비고</th>
							<th class="text-center">사용유무</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
<!-- 	<div id="dragbarR" onmousedown="StartDrag('R')" ondblclick="minimum(this)"></div> -->
	
<!-- 	<div id="rightcol"> -->
<!-- 		<div class="container-fluid h-100" style="padding: 3px;"> -->
<!-- 			<div class="row" id="leftHeader" style="padding-bottom: 5px;"> -->
<!-- 				<div class="d-flex align-items-center d-flex"> -->
<!-- 				</div> -->
<!-- 				<div class="me-lg-auto"></div> -->
<!-- 				<div class="d-flex align-items-center justify-content-end"> -->
<!-- 					<div class="btn-group" role="group" aria-label="Small button group"> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSmallNew"><i class="fa-solid fa-plus"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSmallSave" disabled><i class="fa-regular fa-floppy-disk"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSmallEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnSmallDel" disabled><i class="fa-solid fa-trash-can"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSmallCancel" disabled><i class="fa-solid fa-xmark"></i></button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<table class="table table-bordered p-0 m-0" id="smallInfoAdmTable"> -->
<!-- 					<thead class="table-light"> -->
<!-- 						<tr> -->
<!-- 							<th class="text-center">사용여부</th> -->
<!-- 							<th class="text-center">소분류코드</th> -->
<!-- 							<th class="text-center">소분류명</th> -->
<!-- 							<th class="text-center">판정구분</th> -->
<!-- 						</tr> -->
<!-- 					</thead> -->
<!-- 				</table> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

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
// 		if(type == 'R') { isDraggingR = true; SetCursor("ew-resize");}
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
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cols = [];

			//최소화기능만 적용
			cols = [
				page_width - centercol_min_width - dragbarWidth*2,
				dragbarWidth,
				centercol_min_width
// 				dragbarWidth
// 				rightcol_width
			];
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-columns', newColDefn);
			
		} else if(id == 'dragbarR') {
			let dragbarWidth = 4;

			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cols = [];

			cols = [
				leftcol_width,
				dragbarWidth,
				page_width - leftcol_width - dragbarWidth*2
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
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

			let cursorX = event.clientX;	// 현재 cursor x좌표

			let cols = [
				Math.min(Math.max(leftcol_min_width, cursorX), page_width - centercol_min_width - dragbarWidth*2),
				dragbarWidth,
				page_width - dragbarWidth*2 - Math.min(Math.max(leftcol_min_width, cursorX), page_width - centercol_min_width - dragbarWidth*2)
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
	
	let goodsTypeAdmIdx = '';
	let goodsTypeCdVal = 'empty';
	let goodsTypeDtlIdx = '';

 	let useYnList = getCommonCode('시스템', '000'); // 사용유무
 	let goodsTypeList = getCommonCode('시스템', '046'); // 제품유형구분
	    
    selectBoxAppend(useYnList, 'useYn', '', '2');
	
	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'LARGE') { // 대분류코드 수정중이나 신규등록중이였을 경우
			$('#btnLargeSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'MEDIUM') { // 중분류코드 수정중이나 신규등록중이였을 경우
			$('#btnMediumSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'SMALL') { // 소분류코드 수정중이나 신규등록중이였을 경우
			$('#btnSmallSave').trigger('click');
			return false;
		} else {
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if (WMlastIdx == 'LARGE') { // 대분류코드 수정중이나 신규등록중이였을 경우
			WM_action_OFF(WMlastIdx);
			$('#btnLargeSearch').trigger('click');
			if (WM_close_check()) {
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'MEDIUM') { // 중분류코드 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				goodsTypeTable.row('#'+idx).select();
				$(goodsTypeTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'SMALL') { // 소분류코드 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				goodsTypeTable.row('#'+idx).select();
				$(goodsTypeTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				goodsTypeDtlTable.row('#'+idx).select();
				$(goodsTypeDtlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
		let goodsTypeCd = '';
		let check = true;
		
		if ( deleteType == 'LARGE' ) {
			idx = goodsTypeTable.row('.selected').data().idx;
			goodsTypeCd = goodsTypeTable.row('.selected').data().goodsTypeCd;

			if (check) {
				$.ajax({
					url: '<c:url value="/bm/goodsTypeAdmDel"/>',
		            type: 'POST',
		            data: {
		                'idx'		:	idx,
		                'goodsTypeCd'	:	goodsTypeCd,
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") {
							toastr.success('삭제되었습니다.');
							goodsTypeDtlTable.clear().draw();
//							goodsTypeDtlTable.ajax.reload();
							goodsTypeTable.row('.selected').remove().draw(false);
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
		} else if ( deleteType == 'MEDIUM' ) {
			idx = goodsTypeDtlTable.row('.selected').data().idx;

			if (check) {
				$.ajax({
					url: '<c:url value="/bm/goodsTypeDtlDel"/>',
		            type: 'POST',
		            data: {
		                'idx'		:	idx,
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") {
							toastr.success('삭제되었습니다.');
							goodsTypeDtlTable.row('.selected').remove().draw(false);
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
		} else {
			check = false;
			return false;
		}
		
	});
	
	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if (cancelType == 'LARGE') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('LARGE');

			$('#btnLargeSearch').trigger('click'); // 조회 버튼 click
			
			goodsTypeTable.colReorder.enable();
			
			$('#btnLargeNew').attr('disabled', false); // 신규 버튼
			$('#btnLargeSave').attr('disabled', true); // 저장 버튼
			$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
			$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
			$('#btnLargeCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'MEDIUM') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('MEDIUM');

			goodsTypeDtlTable.ajax.reload();
			goodsTypeDtlTable.colReorder.disable();
			
			$('#btnMediumNew').attr('disabled', false); // 신규 버튼
			$('#btnMediumSave').attr('disabled', true); // 저장 버튼
			$('#btnMediumEdit').attr('disabled', false); // 수정 버튼
			$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
			$('#btnMediumCancel').attr('disabled', true); // 취소 버튼
		} else {
			console.error("예상치 못한 오류 발생: btnCancelModalY onClick");
		}
	});
	
	// 제품유형별 테이블
	$('#goodsTypeTable thead tr').clone(true).addClass('filters').appendTo('#goodsTypeTable thead'); // filter 생성
	let goodsTypeTable = $('#goodsTypeTable').DataTable({
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
			url : '<c:url value="/bm/goodsTypeAdmLst"/>',
			type : 'POST',
			data : {
				'useYn'		:	'',
			},
		},
        rowId: 'idx',
		columns : [
			{ //구분
				data: 'goodsGubun', className : 'text-center', name: 'goodsGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						var goodsTypeName = '';
						goodsTypeList.forEach(function(item){
						    if(item.commonCd == data){
						    	goodsTypeName = item.commonNm;
						    }
						});
						return goodsTypeName;
					} else {
						let html = '';
						html += '<select class="form-select" name="goodsGubun">';
						html +='	<option value="">선택</option>';
						goodsTypeList.forEach(function(item) {
							html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});							
						html += '</select>';
						return html;
					}
				}
			},
			{ //대분류코드
				data: 'goodsTypeCd', className : 'text-center', name: 'goodsTypeCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //대분류명
				data: 'goodsTypeNm', className : 'text-center', name: 'goodsTypeNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //사용유무
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == '001') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="001" selected>사용</option><option value="002">미사용</option></select><span class="d-none">'+data+'</span>';
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
				let cell = $('#goodsTypeTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#goodsTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	goodsTypeTable.on('column-reorder', function( e, settings, details ) {
		let api = goodsTypeTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#goodsTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 제품목록 테이블
	$('#goodsTypeDtlTable thead tr').clone(true).addClass('filters').appendTo('#goodsTypeDtlTable thead'); // filter 생성
	let goodsTypeDtlTable = $('#goodsTypeDtlTable').DataTable({
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
			url : '<c:url value="/bm/goodsTypeDtlLst"/>',
			type : 'POST',
			data : {
				'goodsTypeCd' 	: function() { return goodsTypeCdVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //No
				render: function(data, type, row, meta) {
					return meta.row+1;
				},
				className : 'text-center',
			},
			{ //제품유형코드
				data: 'goodsNm', className : 'text-center', name: 'goodsNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //제품명
				data: 'goodsDesc', className : 'text-center', name: 'goodsDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == '001') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="001" selected>사용</option><option value="002">미사용</option></select><span class="d-none">'+data+'</span>';
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
				let cell = $('#goodsTypeDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#goodsTypeDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	goodsTypeDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = goodsTypeDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#goodsTypeDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 대분류코드 테이블 행 클릭시
	$('#goodsTypeTable tbody').on('click','tr', function() {
		let idx = goodsTypeTable.row(this).data().idx;
// 		let commonType = goodsTypeTable.row(this).data().commonType;
		goodsTypeAdmIdx = idx;
		goodsTypeCdVal = goodsTypeTable.row(this).data().goodsTypeCd;
// 		commonTypeVal = commonType;
		
		if(WMCheck('MEDIUM')) { //중분류코드 등록/수정중일 시
			setWM('MEDIUM', 'idx', idx);
			return false;
		}

		goodsTypeDtlTable.ajax.reload(function() {
			$('#btnMediumNew').attr('disabled', false); //  신규 버튼
			$('#btnMediumSave').attr('disabled', true); //  저장 버튼
			$('#btnMediumEdit').attr('disabled', false); //  수정 버튼
			$('#btnMediumDel').attr('disabled', false); //  삭제 버튼
			$('#btnMediumCancel').attr('disabled', true); //  취소 버튼
		});

		$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});
	
	// 메뉴정보관리 ADM 조회 버튼 click
	$('#btnLargeSearch').on('click', function() {
		if(WMCheck('LARGE')) {
			return false;
		}
		$('#my-spinner').show();

		goodsTypeTable.clear().draw();
		goodsTypeTable.ajax.reload(function() {
			goodsTypeTable.rowReorder.disable();
		});
		
		$('#goodsTypeTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		goodsTypeDtlTable.clear().draw();
		goodsTypeDtlTable.ajax.reload(function() {
			goodsTypeCdVal = 'empty';
			goodsTypeDtlTable.rowReorder.disable();
		});
		
		$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
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
		goodsTypeTable.row.add({
			'idx'			:	'',
			'goodsGubun'	:	col_filter_text[0],
			'goodsTypeCd'	:	col_filter_text[1],
			'goodsTypeNm'	:	col_filter_text[2],
			'useYn'			:	col_filter_text[3],
		}).draw(false);
		
		goodsTypeTable.colReorder.disable();

		$('#btnLargeNew').attr('disabled', false); // 신규 버튼
		$('#btnLargeSave').attr('disabled', false); // 저장 버튼
		$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
		$('#btnLargeCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 공통코드관리 ADM 수정 버튼 click
	$('#btnLargeEdit').on('click', function() {
		WM_action_ON('LARGE', 'workingWarningModal');
		$('#goodsTypeTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#goodsTypeTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == goodsTypeTable.column('goodsGubun:name').index()) {
						let value = goodsTypeTable.row(tr).data().goodsGubun;
						if(value == '001') {
							$(td).html('<select class="form-select"><option value="001" selected>구분1</option><option value="002">구분2</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="001">구분1</option><option value="002" selected>구분2</option></select>');
						}
						
					} else if(index_td == goodsTypeTable.column('useYn:name').index()) {
						let value = goodsTypeTable.row(tr).data().useYn;
						if(value == '001') {
							$(td).html('<select class="form-select"><option value="001" selected>사용</option><option value="002">미사용</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="001">사용</option><option value="002" selected>미사용</option></select>');
						}
						
					} else {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				}
			})
		});

		goodsTypeTable.colReorder.disable();

		$('#btnLargeNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnLargeSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnLargeEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnLargeCancel').attr('disabled', false); // ADM 취소 버튼
	});
	
	// 대분류코드 저장 버튼 클릭시
	$('#btnLargeSave').on('click', function() {
		let array = [];
		let state = true;
		$('#goodsTypeTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = goodsTypeTable.row($(item)).data().idx;
				let useYn = $(td).eq(goodsTypeTable.column('useYn:name').index()).find('select').val();
				let goodsGubun = $(td).eq(goodsTypeTable.column('goodsGubun:name').index()).find('select').val();
				let goodsTypeCd = $(td).eq(goodsTypeTable.column('goodsTypeCd:name').index()).find('input').val();
				let goodsTypeNm = $(td).eq(goodsTypeTable.column('goodsTypeNm:name').index()).find('input').val();

				if(goodsGubun == '') {
					toastr.warning('구분을 선택해주세요.');
					$(td).eq(goodsTypeTable.column('goodsGubun:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(goodsTypeCd == '') {
					toastr.warning('유형코드를 입력해주세요.');
					$(td).eq(goodsTypeTable.column('goodsTypeCd:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(goodsTypeNm == '') {
					toastr.warning('유형명을 입력해주세요.');
					$(td).eq(goodsTypeTable.column('goodsTypeNm:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(useYn == '') {
					toastr.warning('사용여부를 선택해주세요.');
					$(td).eq(goodsTypeTable.column('useYn:name').index()).find('select').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.goodsGubun = goodsGubun;
				obj.goodsTypeCd = goodsTypeCd;
				obj.goodsTypeNm = goodsTypeNm;
				obj.goodsNm = '';
				obj.goodsDesc = '';
				obj.useYn = useYn;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'goodsTypeCd').length) {
			toastr.warning('중복되는 유형코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, goodsTypeTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/goodsTypeAdmIU"/>',
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
	
	// 대분류코드 삭제 버튼 클릭시
	$('#btnLargeDel').on('click', function() {
		if($('#goodsTypeTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 대분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = goodsTypeTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','LARGE');
		} else {
			goodsTypeTable.row('.selected').remove().draw();
		}
	});
	
	// 대분류코드 취소 버튼 클릭시
	$('#btnLargeCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'LARGE');
	});
	
	//중분류////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 중분류코드 테이블 행 클릭시
	$('#goodsTypeDtlTable tbody').on('click','tr', function() {
		let idx = goodsTypeDtlTable.row(this).data().idx;
// 		let commonType = goodsTypeTable.row(this).data().commonType;
		goodsTypeDtlIdx = idx;
// 		commonTypeVal = commonType;
		
		if(WMCheck('LARGE')) { //대분류코드 등록/수정중일 시
			setWM('LARGE', 'idx', idx);
			return false;
		}
	});
	
	// 중분류코드 등록 버튼 클릭시
	$('#btnMediumNew').on('click', function() {
		if(goodsTypeTable.row('.selected').data() == undefined) {
			toastr.warning('대분류코드 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('MEDIUM', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		goodsTypeDtlTable.row.add({
			'idx'			:	'',
			'goodsNm'		:	col_filter_text[0],
			'goodsDesc'		:	col_filter_text[1],
			'useYn'			:	col_filter_text[2],
			
			
		}).draw(false);

		goodsTypeDtlTable.colReorder.disable();

		$('#btnMediumNew').attr('disabled', false); // 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // 저장 버튼
		$('#btnMediumEdit').attr('disabled', false); // 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 중분류코드 수정 버튼 클릭시
	$('#btnMediumEdit').on('click', function() {
		WM_action_ON('MEDIUM', 'workingWarningModal');
		
		$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == goodsTypeDtlTable.column('useYn:name').index()) {
						let value = goodsTypeDtlTable.row(tr).data().useYn;
						if(value == '001') {
							$(td).html('<select class="form-select"><option value="001" selected>사용</option><option value="002">미사용</option></select>');
						} else {
							$(td).html('<select class="form-select"><option value="001">사용</option><option value="002" selected>미사용</option></select>');
						}
					} else {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				}
			})
		});

		goodsTypeDtlTable.colReorder.disable();

		$('#btnMediumNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnMediumEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// 중분류코드 저장 버튼 클릭시
	$('#btnMediumSave').on('click', function() {
		let array = [];
		let state = true;
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = goodsTypeDtlTable.row($(item)).data().idx;
				let goodsNm = $(td).eq(goodsTypeDtlTable.column('goodsNm:name').index()).find('input').val();
				let goodsDesc = $(td).eq(goodsTypeDtlTable.column('goodsDesc:name').index()).find('input').val();
				let useYn = $(td).eq(goodsTypeDtlTable.column('useYn:name').index()).find('select').val();

				if(useYn == '') {
					toastr.warning('사용여부를 선택해주세요.');
					$(td).eq(goodsTypeDtlTable.column('useYn:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(goodsNm == '') {
					toastr.warning('제품명을 입력해주세요.');
					$(td).eq(goodsTypeDtlTable.column('goodsNm:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.goodsTypeCd = goodsTypeCdVal;
				obj.goodsNm = goodsNm;
				obj.goodsDesc = goodsDesc;
				obj.useYn = useYn;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'goodsNm').length) {
			toastr.warning('중복되는 제품명이 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, goodsTypeDtlTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/goodsTypeDtlIU"/>',
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

					goodsTypeDtlTable.clear().draw();
					goodsTypeDtlTable.ajax.reload(function() {
						$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					goodsTypeDtlTable.colReorder.enable();

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
	
	// 중분류코드 삭제 버튼 클릭시
	$('#btnMediumDel').on('click', function() {
		if($('#goodsTypeDtlTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 중분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = goodsTypeDtlTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'MEDIUM');
		} else {
			goodsTypeDtlTable.row('.selected').remove().draw();
		}
	});
	
	// 중분류코드 취소 버튼 클릭시
	$('#btnMediumCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'MEDIUM');
	});
	
	//소분류////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
// 	// -------------------------------------------------------- 판정구분 모달 -------------------------------------------------------- //
// 	// 판정구분 모달
// 	$(document).on('click', "#btnAcctSel", function() {
// 		$("#acctModal").modal("show");
// 		setTimeout(function() {
// 			acctModalTable.columns.adjust();
// 		}, 200)
		
// 	})
	
// 	// 판정구분 목록조회
// 	$('#acctModalTable thead tr').clone(true).addClass('filters').appendTo('#acctModalTable thead'); // filter 생성
// 	let acctModalTable = $('#acctModalTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
// 		language: lang_kor,
// 		info: false,
// 		ordering: true,
// 		processing: true,
// 		paging: false,
// 		lengthChange: false,
// 		searching: true,
// 		autoWidth: false,
// 		orderCellsTop: true,
//         fixedHeader: false,
//         scrollY: '50vh',
//         scrollX: true,
// 		pageLength: 100000000,
// 		colReorder: true,
// 		select: {
//             style: 'single',
//             toggleable: false,
//             items: 'row',
//             info: false
//         },
//         ajax : {
// 			url : '<c:url value="/bm/accountSubjectLst"/>',
// 			type : 'POST',
// 			data : {
// // 				'useYnCd' : function() { return ''; }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'judgeGubun', className : 'text-center'},
// 			{ data: 'judgeGubunNm', className : 'text-center'},
// 			{ data: 'acctTypeNm', className : 'text-center'},
// 			{ data: 'acctDepartNm', className : 'text-center'},
// 			{ data: 'acctProjectNm', className : 'text-center'},
// 			{ data: 'groupCd', className : 'text-center'},
// 			{ data: 'groupNm', className : 'text-center'},
// 		],
// 		columnDefs : [
// 			{
// 				targets: '_all',
// 				render: function(data) {
// 					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 				}
// 			}
// 		],
// 		buttons : [],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#acctModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 80)+'px');
			
// 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			$('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#'+table_id+'_filter').find('input').val($(this).val());
// 				$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			});
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#acctModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control"/>');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup change').on('change', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('change');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	acctModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = acctModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup change').on('change', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('change');
// 			});
// 		});
// 	});

// 	// 판정구분 조회 버튼 click
// 	$('#btnAcctModalSearch').on('click', function() {
// 		acctModalTable.ajax.reload(function(){});
// 	});
	
// 	// 판정구분 적용 버튼 click
// 	$('#btnAcctModalLoad').on('click', function(){
// 		let data = acctModalTable.row('.selected').data();
// 		let isSelected = false;
// 		$.each($("#smallInfoAdmTable tbody tr"), function(i, e) {
// 			if ($(e).find("#judgeGubun").val() == data.judgeGubun) {
// 				isSelected = true;
// 			}
// 		})
// 		if (isSelected) {
// 			toastr.warning("이미 선택된 판정구분입니다.");
// 		} else {
// 			$(smallInfoAdmTable.row(".selected").node()).find("#judgeGubun").val(data.judgeGubun);
// 			$(smallInfoAdmTable.row(".selected").node()).find("#judgeGubunNm").val(data.judgeGubunNm);
// 			$('#acctModal').modal('hide');
// 		}
// 	});
	
// 	// 판정구분 더블클릭
// 	$(document).on('dblclick', '#acctModalTable tbody tr', function() {
// 		let data = acctModalTable.row('.selected').data();
// 		if (data == null || data == undefined) {
// 			return false;
// 		}
// 		let isSelected = false;
// 		$.each($("#smallInfoAdmTable tbody tr"), function(i, e) {
// 			if ($(e).find("#judgeGubun").val() == data.judgeGubun) {
// 				isSelected = true;
// 			}
// 		})
// 		if (isSelected) {
// 			toastr.warning("이미 선택된 판정구분입니다.");
// 		} else {
// 			$(smallInfoAdmTable.row(".selected").node()).find("#judgeGubun").val(data.judgeGubun);
// 			$(smallInfoAdmTable.row(".selected").node()).find("#judgeGubunNm").val(data.judgeGubunNm);
// 			$('#acctModal').modal('hide');
// 		}
// 	})
</script>

</body>
</html>