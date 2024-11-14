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
																		  grid-template-columns: 1fr 4px 3fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 37px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
<!-- 					<div class="btn-group" role="group" aria-label="Small button group"> -->
						
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnLargeNew"><i class="fa-solid fa-plus"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLargeSave" disabled><i class="fa-regular fa-floppy-disk"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnLargeEdit"><i class="fa-regular fa-pen-to-square"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnLargeDel"><i class="fa-solid fa-trash-can"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnLargeCancel" disabled><i class="fa-solid fa-xmark"></i></button> -->
<!-- 					</div> -->
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="projectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주처</th>
							<th class="text-center">품명</th>
							<th class="text-center">납기일</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="dragbarL" onmousedown="StartDrag('L')" ondblclick="minimum(this)"></div>
	
	<div id="centercol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px; width:100%;">
				<div class="d-flex align-items-center d-flex">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 15px !important;" id="btnRowAdd" disabled>행 추가</button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 15px !important;" id="btnRowDel" disabled>행 삭제</button>				
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnLargeSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnMediumNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMediumSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnMediumEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnMediumDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMediumCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="goodsTypeDtlTable" style="width:100%;">
<%-- 					<colgroup> --%>
<%-- 							<col width="4%"> --%>
<%-- 							<col width="1%"> --%>
<%-- 							<col width="1%"> --%>
<%-- 							<col width="19%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="10%"> --%>
<%-- 							<col width="15%"> --%>
<%-- 					</colgroup> --%>
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle" rowspan="2">ID</th>
							<th class="text-center align-middle" colspan="3" id="prcNm">Process Name</th>
							<th class="text-center align-middle" rowspan="2">Period<br>(Day)</th>
							<th class="text-center align-middle" colspan="2">계획</th>
							<th class="text-center align-middle" colspan="2">실적</th>
							<th class="text-center align-middle" rowspan="2">Completion<br>Rate</th>
							<th class="text-center align-middle" rowspan="2">비고</th>
						</tr>
						<tr>
							<th class="text-center" id="lmsCol"></th>
							<th class="text-center" id="lmsCol1"></th>
							<th class="text-center" id="lmsCol2"></th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
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
// 		if(type == 'L') { isDraggingL = true; SetCursor("ew-resize");}
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
// 		let id = $(node).attr('id');

// 		if(id == 'dragbarL') {
// 			let dragbarWidth = 4;

// 			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// // 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 500;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 800;	// 가운데 가로 최소길이
// // 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cols = [];

// 			//최소화기능만 적용
// 			cols = [
// 				page_width - centercol_min_width - dragbarWidth*2,
// 				dragbarWidth,
// 				centercol_min_width
// // 				dragbarWidth
// // 				rightcol_width
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-columns', newColDefn);
			
// 		} else if(id == 'dragbarR') {
// 			let dragbarWidth = 4;

// 			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// // 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 270;	// 가운데 가로 최소길이
// // 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cols = [];

// 			cols = [
// 				leftcol_width,
// 				dragbarWidth,
// 				page_width - leftcol_width - dragbarWidth*2
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-columns', newColDefn);
// 		}

// 		dataTableDrawAll(); // dataTable 전체 reload
	}
	
	function OnDrag(event) {
		if (isDraggingL) {
// 			let dragbarWidth = 4;
			
// 			let page_width = parseInt($('#page').width()); 			// 전체 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// // 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 400;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 600;	// 가운데 가로 최소길이
// // 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cursorX = event.clientX;	// 현재 cursor x좌표

// 			let cols = [
// 				Math.min(Math.max(leftcol_min_width, cursorX), page_width - centercol_min_width - dragbarWidth*2),
// 				dragbarWidth,
// 				page_width - dragbarWidth*2 - Math.min(Math.max(leftcol_min_width, cursorX), page_width - centercol_min_width - dragbarWidth*2)
// 			];

	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

// 			$('#page').css('grid-template-columns', newColDefn);
	
// 			event.preventDefault();
		}
	}

</script>
<script>
	WM_init('LARGE');
	WM_init('MEDIUM');
	
	let goodsTypeAdmIdx = '';
	let goodsTypeCdVal = '';
	let goodsTypeDtlIdx = '';
// 	let newAddVal = 'empty';
	let prjCdVal = '';
	let lmsTypeVal = '';

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
				
				projectTable.row('#'+idx).select();
				$(projectTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
				
				projectTable.row('#'+idx).select();
				$(projectTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
		let prjCdVal = '';
		let check = true;
		
		if ( deleteType == 'MEDIUM' ) {
			idx = projectTable.row('.selected').data().idx;
			prjCdVal = projectTable.row('.selected').data().prjCd;
			
			if (check) {
				$.ajax({
					url: '<c:url value="/bs/projectPlanDel"/>',
		            type: 'POST',
		            data: {
		                'prjCd'		:	prjCdVal,
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") {
							toastr.success('삭제되었습니다.');
							goodsTypeDtlTable.ajax.reload();

							//컬럼 재정렬
							if(goodsTypeDtlTable.data().length != 0){
								for(var i = 0; i < $('#goodsTypeDtlTable tbody tr').length; i++) {
									if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() != ''){
										if(emptyRow != 0){
											$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
											$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
											$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
										}
										rowIndex = i;
										emptyRow = 0;
									}

									if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() == ''){
										if(emptyRow != 0){
											$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).addClass('d-none');
										}
										emptyRow++;
									}

									if(i == $('#goodsTypeDtlTable tbody tr').length-1){
										$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
										$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
										$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
									}
								}
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
			
			projectTable.colReorder.enable();
			
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
	$('#projectTable thead tr').clone(true).addClass('filters').appendTo('#projectTable thead'); // filter 생성
	let projectTable = $('#projectTable').DataTable({
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
			url : '<c:url value="/bs/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				
			},
		},
        rowId: 'idx',
		columns : [
			{ //프로젝트번호
				data: 'prjCd', className : 'text-center', name: 'prjCd'
			},
			{ //수주처
				data: 'dealCorpNm', className : 'text-center', name: 'dealCorpNm'
			},
			{ //품명
				data: 'goodsNm', className : 'text-center', name: 'goodsNm'
			},
			{ //사용유무
				data: 'dueDate', className : 'text-center', name: 'dueDate',
				render: function(data, type, row, meta) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return "";
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
			{ 
				extend: 'excel', text: 'Excel', charset: 'UTF-8', bom: true ,
	        	exportOptions: {
	            columns: ':visible',
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
				let cell = $('#projectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#projectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	projectTable.on('column-reorder', function( e, settings, details ) {
		let api = projectTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#projectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	var idCnt = 0;
	// 제품목록 테이블
//	$('#goodsTypeDtlTable thead tr').clone(true).addClass('filters').appendTo('#goodsTypeDtlTable thead'); // filter 생성
	let goodsTypeDtlTable = $('#goodsTypeDtlTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1 bottomRow'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: true,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '83vh',
        scrollX: true,
		pageLength: -1,
//		colReorder: true,
		select: {
            style: 'single',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/projectPlanLst"/>',
			type : 'POST',
			data : {
				'prjCd'			: function() { return prjCdVal; },
			},
		},
		beforeSend: function() {
			idCnt = 0;
        },
        rowId: 'idx',
		columns : [
			{ //No
				name: 'rowspan',
				render: function(data, type, row, meta) {
					if(row['lmsType'] == 'L'){
						idCnt++;
						return idCnt;
					} else return '';
				},
 				className : 'text-center',
			},
			{ //프로세스 대분류
				data: 'largeNm', name: 'largeNm',
				render: function(data, type, row, meta) {
					if(data != '' && data != null){
						return '<div style="width:100%">'+data+'</div>';
					} else {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="largeNm" disabled><span class="d-none">'+data+'</span>';
					}
				},
			},
			{ //프로세스 중분류
				data: 'mediumNm', name: 'mediumNm',
				render: function(data, type, row, meta) {
					if(data != '' && data != null){
						return '<div style="width:100%">&emsp;&emsp;'+data+'</div>';
					} else {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="mediumNm" disabled><span class="d-none">'+data+'</span>';
					}
				},
			},
			{ //프로세스 소분류
				data: 'smallNm', name: 'smallNm',
				render: function(data, type, row, meta) {
					if(data != '' && data != null){
						return '<div style="width:100%">&emsp;&emsp;&emsp;&emsp;'+data+'</div>';
					} else {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="smallNm" disabled><span class="d-none">'+data+'</span>';
					}
				},
			},
			{ //Period
				className : 'text-center', name: 'period',
				render: function(data, type, row, meta) {
					if(row['planStartDate'] != '' && row['planStartDate'] != null && row['planEndDate'] != '' && row['planEndDate'] != null) {
						var diff = getDateDiff(moment(row['planStartDate'],'YYYYMMDD').format('YYYY-MM-DD'), moment(row['planEndDate'],'YYYYMMDD').format('YYYY-MM-DD'));
						return diff +'일';
					} else {
						return '';
					}
				}
			},
			{ //계획 -시작일
				data: 'planStartDate', className : 'text-center', name: 'planStartDate',
				render: function(data, type, row, meta) {
					if(row['planStartDate'] != '' && row['planStartDate'] != null) {
						return '<input type="date" class="form-control inputGroup" name="planStartDate" value="'+moment(data,"YYYYMMDD").format("YYYY-MM-DD")+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="date" class="form-control inputGroup" name="planStartDate" disabled><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //계획 -종료일
				data: 'planEndDate', className : 'text-center', name: 'planEndDate',
				render: function(data, type, row, meta) {
					if(row['planEndDate'] != '' && row['planEndDate'] != null) {
						return '<input type="date" class="form-control inputGroup" name="planEndDate" value="'+moment(data,"YYYYMMDD").format("YYYY-MM-DD")+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="date" class="form-control inputGroup" name="planEndDate" disabled><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //실적 -시작일
				data: 'performStartDate', className : 'text-center', name: 'performStartDate',
				render: function(data, type, row, meta) {
					if(row['performStartDate'] != '' && row['performStartDate'] != null) {
						return '<input type="date" class="form-control inputGroup" name="performStartDate" value="'+moment(data,"YYYYMMDD").format()+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="date" class="form-control inputGroup" name="performStartDate" disabled><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //실적 -종료일
				data: 'performEndDate', className : 'text-center', name: 'performEndDate',
				render: function(data, type, row, meta) {
					if(row['performEndDate'] != '' && row['performEndDate'] != null) {
						return '<input type="date" class="form-control inputGroup" name="performEndDate" value="'+moment(data,"YYYYMMDD").format()+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="date" class="form-control inputGroup" name="performEndDate" disabled><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //completionRate
				data: 'completionRate', className : 'text-center', name: 'completionRate',
				render: function(data, type, row, meta) {
					if(row['completionRate'] != '' && row['completionRate'] != null) {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="completionRate" value="'+data+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="completionRate" disabled><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'projectPlanDesc', className : 'text-center', name: 'projectPlanDesc',
				render: function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="projectPlanDesc" value="'+data+'" disabled><span class="d-none">'+data+'</span>';
					} else {
						return '<input type="text" class="form-control inputGroup" style="width:100%;" name="projectPlanDesc" disabled><span class="d-none">'+data+'</span>';
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
			{ 
				extend: 'excel', text: 'Excel', charset: 'UTF-8', bom: true ,
	        	exportOptions: {
	            columns: ':visible',
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
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			$('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#'+table_id+'_filter').find('input').val($(this).val());
// 				$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			});
			
			var	rowIndex = 0;
			var emptyRow = 0;

			if(data.length != 0){
				for(var i = 0; i < data.length; i++) {
					//대분류
					if(goodsTypeDtlTable.row(i).data().lmsType == 'L'){
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');

						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(1).attr('colspan','3');
						$('#goodsTypeDtlTable tbody tr').eq(i).attr('style', 'background-color:#B8CCE4 !important');
					}
					//중분류
					if(goodsTypeDtlTable.row(i).data().lmsType == 'M'){
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');

						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(2).attr('colspan','3');
// 						var html = '<input type="text" class="form-control inputGroup" name="mediumNm" value="&emsp;&emsp;'+goodsTypeDtlTable.row(i).data().mediumNm+'" disabled>';
// 						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(2).html(html);
						$('#goodsTypeDtlTable tbody tr').eq(i).attr('style', 'background-color:#FFFF00 !important');
					}
					//소분류
					if(goodsTypeDtlTable.row(i).data().lmsType == 'S'){
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');

						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(3).attr('colspan','3');
// 						var html = '<input type="text" class="form-control inputGroup" name="smallNm" value="&emsp;&emsp;&emsp;&emsp;'+goodsTypeDtlTable.row(i).data().smallNm+'" disabled>';
// 						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(3).html(html);
					}

					if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() != ''){
						if(emptyRow != 0){
							$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
							$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
							$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
						}
						rowIndex = i;
						emptyRow = 0;
					}

					if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() == ''){
						if(emptyRow != 0){
							$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).addClass('d-none');
						}
						emptyRow++;
					}

					if(i == data.length-1){
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
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
// 			$('.dataTables_scrollHeadInner').attr('style',"box-sizing: content-box; width: 989.438px;");

			if($('#goodsTypeDtlTable').DataTable().data().length != 0){
				$('#lmsCol').addClass('d-none');
				$('#lmsCol1').addClass('d-none');
				$('#lmsCol2').addClass('d-none');
				$('#prcNm').attr('rowspan',2);
			}

			$('.bottomRow').attr('style', 'width:100% !important;');
		},
	});
	
	// dataTable colReorder event
// 	goodsTypeDtlTable.on('column-reorder', function( e, settings, details ) {
// 		let api = goodsTypeDtlTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			 $('#goodsTypeDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});
	
	//계획 -시작일
	$(document).on('change', 'input[name=planStartDate]', function(){
		
		if($(this).parent().parent().find('input[name=planEndDate]').val() != ''){
			if($(this).parent().parent().find('input[name=planEndDate]').val() < $(this).val()){
				toastr.warning('시작일은 종료일을 넘을 수 없습니다.');
				$(this).val('');
				return false;
			}
			var diff = getDateDiff($(this).val(), $(this).parent().parent().find('input[name=planEndDate]').val());
			$(this).parent().parent().find('td').eq(4).text(diff+'일');
		}
		
	});

	//계획 -종료일
	$(document).on('change', 'input[name=planEndDate]', function(){

		if($(this).parent().parent().find('input[name=planStartDate]').val() != ''){
			if($(this).val() < $(this).parent().parent().find('input[name=planStartDate]').val()){
				toastr.warning('시작일은 종료일을 넘을 수 없습니다.');
				$(this).val('');
				return false;
			}
			var diff = getDateDiff($(this).parent().parent().find('input[name=planStartDate]').val(), $(this).val());
			$(this).parent().parent().find('td').eq(4).text(diff+'일');
		}
		
	});
	
	// 대분류코드 테이블 행 클릭시
	$('#projectTable tbody').on('click','tr td:not(:first-child)', function() {
		let idx = projectTable.row(this).data().idx;
		goodsTypeAdmIdx = idx;
		goodsTypeCdVal = projectTable.row(this).data().goodsTypeCd;
		prjCdVal = projectTable.row(this).data().prjCd;

		if(WMCheck('MEDIUM')) { //중분류코드 등록/수정중일 시
			setWM('MEDIUM', 'idx', idx);
			return false;
		}
		
		idCnt = 0;

		$('#prcNm').attr('rowspan',1);
		$('#lmsCol').removeClass('d-none');
		$('#lmsCol1').removeClass('d-none');
		$('#lmsCol2').removeClass('d-none');
		
		$('#goodsTypeDtlTable').DataTable().ajax.reload(function() {
			$('#lmsCol').addClass('d-none');
			$('#lmsCol1').addClass('d-none');
			$('#lmsCol2').addClass('d-none');
			$('#prcNm').attr('rowspan',2);
		});

		var	rowIndex = 0;
		var emptyRow = 0;
		
		//컬럼 재정렬
		if(goodsTypeDtlTable.data().length != 0){
			for(var i = 0; i < $('#goodsTypeDtlTable tbody tr').length; i++) {
				if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() != ''){
					if(emptyRow != 0){
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
					}
					rowIndex = i;
					emptyRow = 0;
				}

				if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() == ''){
					if(emptyRow != 0){
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).addClass('d-none');
					}
					emptyRow++;
				}

				if(i == $('#goodsTypeDtlTable tbody tr').length-1){
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
				}
			}
		}

		$('#btnRowAdd').attr('disabled', true);
		$('#btnRowDel').attr('disabled', true);
		$('#btnMediumNew').attr('disabled', false); //  신규 버튼
		$('#btnMediumSave').attr('disabled', true); //  저장 버튼
		$('#btnMediumEdit').attr('disabled', false); //  수정 버튼
		$('#btnMediumDel').attr('disabled', false); //  삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); //  취소 버튼
	});
	
	// 메뉴정보관리 ADM 조회 버튼 click
	$('#btnLargeSearch').on('click', function() {
		$('#my-spinner').show();

		projectTable.clear().draw();
		projectTable.ajax.reload(function() {
			projectTable.rowReorder.disable();
		});
		
		$('#projectTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

// 		goodsTypeDtlTable.clear().draw();
// 		goodsTypeDtlTable.ajax.reload(function() {
// 			goodsTypeDtlTable.rowReorder.disable();
// 		});

		$('#btnLargeNew').attr('disabled', false); // 신규 버튼
		$('#btnLargeSave').attr('disabled', true); // 저장 버튼
		$('#btnLargeEdit').attr('disabled', false); // 수정 버튼
		$('#btnLargeDel').attr('disabled', false); // 삭제 버튼
		$('#btnLargeCancel').attr('disabled', true); // 취소 버튼

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	
	//중분류////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 중분류코드 테이블 행 클릭시
	$('#goodsTypeDtlTable tbody').on('click','tr', function() {
		if($('#goodsTypeDtlTable tbody tr').hasClass('selected')){
			$('#goodsTypeDtlTable tbody tr').removeClass('selected');
			$(this).addClass('selected');
		} else {
			$(this).addClass('selected');
		}
		let idx = '';
		goodsTypeDtlIdx = idx;

		if($(this).attr('style') == 'background-color:#B8CCE4 !important'){
			lmsTypeVal = 'L'
		} else if($(this).attr('style') == 'background-color:#FFFF00 !important'){
			lmsTypeVal = 'M'
		} else {
			lmsTypeVal = 'S'
		}
		
		if(WMCheck('LARGE')) { //대분류코드 등록/수정중일 시
			setWM('LARGE', 'idx', idx);
			return false;
		}
	});

	//행 추가
	$('#btnRowAdd').on('click', function(){
		var	rowIndex = 0;
		var emptyRow = 0;
		var tIdx = 0;
		var largeTr = null;
		var mediumTr = null;
		var smallTr = null;

		//tr clone create
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index, item) {
			if($(this).hasClass('selected')){
				rowIndex = index;
			}
			tIdx = index;

			if(largeTr == null || mediumTr == null || smallTr == null){
				if(goodsTypeDtlTable.row(tIdx).data().lmsType == 'L'){
					largeTr = $('#goodsTypeDtlTable tbody tr').eq(tIdx);
				} else if(goodsTypeDtlTable.row(tIdx).data().lmsType == 'M'){
					mediumTr = $('#goodsTypeDtlTable tbody tr').eq(tIdx);
				} else if(goodsTypeDtlTable.row(tIdx).data().lmsType == 'S'){
					smallTr = $('#goodsTypeDtlTable tbody tr').eq(tIdx);
				}
			}
			
		});
		
		//행 선택 안되어 있을 때
		if(!$('#goodsTypeDtlTable tbody tr').hasClass('selected')){
			var cloneTr = $(largeTr).clone();
			cloneTr.data().lmsType = 'L';

			var idVal = 0;
			$('#goodsTypeDtlTable tbody').find('tr').each(function(index, item) {
				if($(this).find('td').eq(0).text() != ''){
					idVal++;
				}
			});

			cloneTr.find('td').eq(0).text(idVal+1);
			cloneTr.find('td').eq(4).text('');
			cloneTr.find('input[type=date]').val('');
			cloneTr.insertAfter($('#goodsTypeDtlTable tbody tr').eq($('#goodsTypeDtlTable tbody tr').length-1)).find('input:text').val('');
			
		//행 선택 시
		} else{

			//중분류
	 		if(lmsTypeVal == 'L'){
	 			var cloneTr = $(mediumTr).clone();
	 			cloneTr.data().lmsType = 'M';

	 			for(var i = rowIndex+1; i<$('#goodsTypeDtlTable tbody tr').length; i++){
					if($('#goodsTypeDtlTable tbody tr').eq(i).attr('style') == 'background-color:#B8CCE4 !important'){
						cloneTr.find('td').eq(4).text('');
						cloneTr.find('input[type=date]').val('');
						cloneTr.insertAfter($('#goodsTypeDtlTable tbody tr').eq(i-1)).find('input:text').val('');
						break;
					}
		 		}

		 		//맨 마지막 줄
	 			if(rowIndex+1 == $('#goodsTypeDtlTable tbody tr').length){
	 				cloneTr.find('td').eq(4).text('');
					cloneTr.find('input[type=date]').val('');
					cloneTr.insertAfter($('#goodsTypeDtlTable tbody tr').eq(rowIndex)).find('input:text').val('');
		 		}
	 		}else if(lmsTypeVal == 'M'){
	 			var cloneTr = $(smallTr).clone();
	 			cloneTr.data().lmsType = 'S';

	 			for(var i = rowIndex+1; i<$('#goodsTypeDtlTable tbody tr').length; i++){
					if($('#goodsTypeDtlTable tbody tr').eq(i).attr('style') == 'background-color:#FFFF00 !important' || $('#goodsTypeDtlTable tbody tr').eq(i).attr('style') == 'background-color:#B8CCE4 !important'){
						cloneTr.find('td').eq(4).text('');
						cloneTr.find('input[type=date]').val('');
						cloneTr.insertAfter($('#goodsTypeDtlTable tbody tr').eq(i-1)).find('input:text').val('');
						break;
					}
		 		}

	 			//맨 마지막 줄
	 			if(rowIndex+1 == $('#goodsTypeDtlTable tbody tr').length){
	 				cloneTr.find('td').eq(4).text('');
					cloneTr.find('input[type=date]').val('');
					cloneTr.insertAfter($('#goodsTypeDtlTable tbody tr').eq(rowIndex)).find('input:text').val('');
		 		}
			}
		}
			
		//컬럼 재정렬
		if(goodsTypeDtlTable.data().length != 0){
			for(var i = 0; i < $('#goodsTypeDtlTable tbody tr').length; i++) {
				if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() != ''){
					if(emptyRow != 0){
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
						$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
					}
					rowIndex = i;
					emptyRow = 0;
				}

				if($('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).text() == ''){
					if(emptyRow != 0){
						$('#goodsTypeDtlTable tbody tr').eq(i).find('td').eq(0).addClass('d-none');
					}
					emptyRow++;
				}

				if(i == $('#goodsTypeDtlTable tbody tr').length-1){
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('rowspan', emptyRow);
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('style', 'background-color:#fff !important');
					$('#goodsTypeDtlTable tbody tr').eq(rowIndex+1).find('td').eq(0).attr('onclick', 'event.cancelBubble=true');
				}
			}
		}

		
// 		goodsTypeDtlTable.row.add({
// 			'idx'				:	'',
// 			'lmsType'			:	lmsTypeVal,
// 			'largeNm'			:	'',
// 			'mediumNm'			:	'',
// 			'smallNm'			:	'',
// 			'planStartDate'		:	'',
// 			'planEndDate'		:	'',
// 			'performStartDate'	:	'',
// 			'performEndDate'	:	'',
// 			'completionRate'	:	'',
// 			'projectPlanDesc'	:	''
// 		}).draw(false);

// 		setTimeout(function(){
// 			if(lmsTypeVal == 'S'){
// 				$('#goodsTypeDtlTable tbody tr').eq(rowIdx).find('td').eq(1).addClass('d-none');
// 				$('#goodsTypeDtlTable tbody tr').eq(rowIdx).find('td').eq(2).addClass('d-none');

// 				$('#goodsTypeDtlTable tbody tr').eq(rowIdx).find('td').eq(3).attr('colspan','3');
// 				var html = '<input type="text" class="form-control inputGroup" name="mediumNm" value="&emsp;&emsp;&emsp;&emsp;'+goodsTypeDtlTable.row(i).data().smallNm+'" disabled>';
// 				$('#goodsTypeDtlTable tbody tr').eq(rowIdx).find('td').eq(3).html(html);
// 			}
// 		}, 150);
		
	});

	$('#btnRowDel').on('click', function() {
		if(!$('#goodsTypeDtlTable tbody tr').hasClass('selected')){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}

		var	rowIndex = 0;
		var rowMother = '';
		var state = 0;

		//클릭한 행 rowIndex 구하기
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index, item) {
			if(($(this).attr('style') == 'background-color:#B8CCE4 !important' || $(this).attr('style') == 'background-color:#FFFF00 !important') && state == 0){
				rowMother = index;
			}
			if($(this).hasClass('selected')){
				rowIndex = index;
				state = 1;
				return false;
			}
		});

		var rowSpanCnt = $('#goodsTypeDtlTable tbody tr').eq(rowMother).children().eq(0).attr('rowspan');
		$('#goodsTypeDtlTable tbody tr').eq(rowMother).children().eq(0).attr('rowspan', rowSpanCnt-1);
		$('#goodsTypeDtlTable tbody tr').eq(rowIndex).remove();
	});
	
	// 중분류코드 등록 버튼 클릭시
	$('#btnMediumNew').on('click', function() {
		if(projectTable.row('.selected').data() == undefined) {
			toastr.warning('프로젝트를 선택해주세요.');
			return false;
		}
		WM_action_ON('MEDIUM', 'workingWarningModal');

// 		let col_filter_text = [];
// 		$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
// 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
// 			col_filter_text.push($(item).find('input').val());
// 		});
// 		goodsTypeDtlTable.row.add({
// 			'idx'			:	'',
// 			'goodsNm'		:	col_filter_text[0],
// 			'goodsDesc'		:	col_filter_text[1],
// 			'useYn'			:	col_filter_text[2],
			
			
// 		}).draw(false);

// 		goodsTypeDtlTable.colReorder.disable();
		$('.inputGroup').attr('disabled', false);

		$('#btnMediumNew').attr('disabled', false); // 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // 저장 버튼
		$('#btnMediumEdit').attr('disabled', true); // 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 중분류코드 수정 버튼 클릭시
	$('#btnMediumEdit').on('click', function() {
		if(projectTable.row('.selected').data() == undefined) {
			toastr.warning('프로젝트를 선택해주세요.');
			return false;
		}
		
		WM_action_ON('MEDIUM', 'workingWarningModal');

		$('#btnRowAdd').attr('disabled', false);
		$('#btnRowDel').attr('disabled', false);

		//수정중임..
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == goodsTypeDtlTable.column('largeNm:name').index()) {
						let value = goodsTypeDtlTable.row(tr).data().largeNm;
						if(value == '' || value == null) {
							$(td).html('<input type="text" class="form-control inputGroup" name="largeNm" value="" >');
						} else {
							$(td).html('<input type="text" class="form-control inputGroup" name="largeNm" value="'+value+'" >');
						}
						
					} else if(index_td == goodsTypeDtlTable.column('mediumNm:name').index()) {
						let value = goodsTypeDtlTable.row(tr).data().mediumNm;
						if(value == '' || value == null) {
							$(td).html('<input type="text" class="form-control inputGroup" name="mediumNm" value="&emsp;&emsp;" >');
						} else {
							$(td).html('<input type="text" class="form-control inputGroup" name="mediumNm" value="&emsp;&emsp;'+value+'" >');
						}
						
					} else if(index_td == goodsTypeDtlTable.column('smallNm:name').index()){
						let value = goodsTypeDtlTable.row(tr).data().smallNm;
						if(value == '' || value == null) {
							$(td).html('<input type="text" class="form-control inputGroup" name="smallNm" value="&emsp;&emsp;&emsp;&emsp;" >');
						} else {
							$(td).html('<input type="text" class="form-control inputGroup" name="smallNm" value="&emsp;&emsp;&emsp;&emsp;'+value+'" >');
						}
					}
				}
			})
		});
		//
		
		$('.inputGroup').attr('disabled', false);

		$('#btnMediumNew').attr('disabled', false); // 신규 버튼
		$('#btnMediumSave').attr('disabled', false); // 저장 버튼
		$('#btnMediumEdit').attr('disabled', true); // 수정 버튼
		$('#btnMediumDel').attr('disabled', false); // 삭제 버튼
		$('#btnMediumCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 중분류코드 저장 버튼 클릭시
	$('#btnMediumSave').on('click', function() {
		let array = [];
		let state = true;
		var tIdx = 0;
		$('#goodsTypeDtlTable tbody').find('tr').each(function(index, item) {
			tIdx = index;
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let lmsType = '';
				if($(this).attr('style') == 'background-color:#B8CCE4 !important'){
					lmsType = 'L'
				} else if($(this).attr('style') == 'background-color:#FFFF00 !important'){
					lmsType = 'M'
				} else {
					lmsType = 'S'
				}
				let largeNm = '';
				let mediumNm = '';
				let smallNm = '';
				
				if(lmsType == 'L'){
					largeNm = $(td).eq(goodsTypeDtlTable.column('largeNm:name').index()).find('input').val().trim();
					if(largeNm == ''){
						state = false;
					}
				} else if(lmsType == 'M'){
					mediumNm = $(td).eq(goodsTypeDtlTable.column('mediumNm:name').index()).find('input').val().trim();
					if(mediumNm == ''){
						state = false;
					}
				} else if(lmsType == 'S'){
					smallNm = $(td).eq(goodsTypeDtlTable.column('smallNm:name').index()).find('input').val().trim();
					if(smallNm == ''){
						state = false;
					}
				}
				let period = $(td).eq(goodsTypeDtlTable.column('period:name').index()).find('input').val();
				let planStartDate = $(td).eq(goodsTypeDtlTable.column('planStartDate:name').index()).find('input').val();
				let planEndDate = $(td).eq(goodsTypeDtlTable.column('planEndDate:name').index()).find('input').val();
				let performStartDate = $(td).eq(goodsTypeDtlTable.column('performStartDate:name').index()).find('input').val();
				let performEndDate = $(td).eq(goodsTypeDtlTable.column('performEndDate:name').index()).find('input').val();
				let completionRate = $(td).eq(goodsTypeDtlTable.column('completionRate:name').index()).find('input').val();
				let projectPlanDesc = $(td).eq(goodsTypeDtlTable.column('projectPlanDesc:name').index()).find('input').val();
				
// 				let goodsDesc = $(td).eq(goodsTypeDtlTable.column('goodsDesc:name').index()).find('input').val();
// 				let useYn = $(td).eq(goodsTypeDtlTable.column('useYn:name').index()).find('select').val();

// 				if(useYn == '') {
// 					toastr.warning('사용여부를 선택해주세요.');
// 					$(td).eq(goodsTypeDtlTable.column('useYn:name').index()).find('select').focus();
// 					state = false;
// 					return false;
// 				}
// 				if(goodsNm == '') {
// 					toastr.warning('제품명을 입력해주세요.');
// 					$(td).eq(goodsTypeDtlTable.column('goodsNm:name').index()).find('input').focus();
// 					state = false;
// 					return false;
// 				}

				let obj = new Object();
				obj.idx = '';
				obj.prjCd = prjCdVal;
				obj.lmsType = lmsType;
				obj.largeNm = largeNm;
				obj.mediumNm = mediumNm;
				obj.smallNm = smallNm;
				obj.period = period;
				obj.planStartDate = planStartDate.replace(/-/g, '');
				obj.planEndDate = planEndDate.replace(/-/g, '');
				obj.performStartDate = performStartDate.replace(/-/g, '');
				obj.performEndDate = performEndDate.replace(/-/g, '');
				obj.completionRate = completionRate;
				obj.projectPlanDesc = projectPlanDesc;
				
			    array.push(obj);
		    }
		});

		if(!state) {
			toastr.warning('Process Name을 입력해주세요.');
			return false;
		}
		
// 		if(array.length != _.uniqBy(array, 'goodsNm').length) {
// 			toastr.warning('중복되는 제품명이 존재합니다.');
// 			return false;
// 		}

		array = _.differenceWith(array, goodsTypeDtlTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bs/projectPlanIUD"/>',
            type: 'POST',
            data: {
                'prjCd'		:	prjCdVal,
                'jsonArray'	:	JSON.stringify(array),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					idCnt = 0;
					WM_action_OFF('MEDIUM');

					$('#prcNm').attr('rowspan',1);
					$('#lmsCol').removeClass('d-none');
					$('#lmsCol1').removeClass('d-none');
					$('#lmsCol2').removeClass('d-none');

					goodsTypeDtlTable.clear().draw();
					goodsTypeDtlTable.ajax.reload(function() {
						$('#goodsTypeDtlTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
						$('#lmsCol').addClass('d-none');
						$('#lmsCol1').addClass('d-none');
						$('#lmsCol2').addClass('d-none');
						$('#prcNm').attr('rowspan',2);
					});
					
					goodsTypeDtlTable.colReorder.enable();

					$('#btnMediumNew').attr('disabled', false); // 신규 버튼
					$('#btnMediumSave').attr('disabled', true); // 저장 버튼
					$('#btnMediumEdit').attr('disabled', true); // 수정 버튼
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

		let data = goodsTypeDtlTable.row('.selected').data();
		$('#deleteModal').modal('show');
		$('#deleteModal').data('deleteType', 'MEDIUM');
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

function getDateDiff(d1, d2){
  var date1 = new Date(d1);
  var date2 = new Date(d2);
  
  var diffDate = date1.getTime() - date2.getTime();
  
  return Math.abs(diffDate / (1000 * 60 * 60 * 24)) + 1; // 밀리세컨 * 초 * 분 * 시 = 일
}
</script>

</body>
</html>