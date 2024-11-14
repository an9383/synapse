<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbarL centercol dragbarLM rightcol dragbarRM leftcolM';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr 4px 1fr 4px 1fr 4px 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="PrdGroup button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnPrjSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrjNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrjSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrjEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnPrjDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrjCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="prjTable">
					<thead class="table-light">
						<tr>
							<th colspan="3" class="text-center">Project(①)</th>
						</tr>
						<tr>
							<th class="text-center">코드명</th>
							<th class="text-center">코드</th>
							<th class="text-center">비고</th>
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
					<div class="btn-group" role="group" aria-label="PrdGroup button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdTypeNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdTypeSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdTypeEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnPrdTypeDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdTypeCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="prdTypeTable">
					<thead class="table-light">
						<tr>
							<th colspan="3" class="text-center">ProductType(②)</th>
						</tr>
						<tr>
							<th class="text-center">코드명</th>
							<th class="text-center">코드</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="dragbarLM" onmousedown="StartDrag('LM')" ondblclick="minimum(this)"></div>
	
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="PrdGroup button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdGroupNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdGroupSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdGroupEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnPrdGroupDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdGroupCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="prdGroupTable">
					<thead class="table-light">
						<tr>
							<th colspan="3" class="text-center">ProductGroup(③)</th>
						</tr>
						<tr>
							<th class="text-center">코드명</th>
							<th class="text-center">코드</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	
	<div id="dragbarRM" onmousedown="StartDrag('RM')" ondblclick="minimum(this)"></div>
	
	<div id="leftcolM">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="yearAdjust"></select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="PrdGroup button group">
<!-- 						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnPrdListSearch"><i class="fa-regular fa-clipboard"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdListNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdListSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrdListEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnPrdListDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPrdListCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="prdListTable">
					<thead class="table-light">
						<tr>
							<th colspan="3" class="text-center">ProductList(④)</th>
						</tr>
						<tr>
							<th class="text-center">기준년도</th>
							<th class="text-center">코드</th>
							<th class="text-center">비고</th>
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
#dragbarLM {
	background-color: #cccccc;
	grid-area: dragbarLM;
	cursor: ew-resize;
}
#dragbarRM {
	background-color: #cccccc;
	grid-area: dragbarRM;
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
// 		let page = document.getElementById("page");
// 		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
// 		if(type == 'L') { isDraggingL = true; SetCursor("ew-resize");}
// 		if(type == 'R') { isDraggingR = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingL || isDraggingR) {
// 			dataTableDrawAll(); // dataTable 전체 reload
// 			isDraggingL = false;
// 			isDraggingR = false;
// 			SetCursor("auto");
		}
	}
	
	function minimum(node) {
		let id = $(node).attr('id');

		if(id == 'dragbarL') {
// 			let dragbarWidth = 4;

// 			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cols = [];

// 			//최소화기능만 적용
// 			cols = [
// 				page_width - rightcol_width - centercol_min_width - dragbarWidth*2,
// 				dragbarWidth,
// 				centercol_min_width,
// 				dragbarWidth,
// 				rightcol_width
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-columns', newColDefn);
			
		} else if(id == 'dragbarR') {
// 			let dragbarWidth = 4;

// 			let page_width = parseInt($('#page').width()); 			// 전체 가로 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cols = [];

// 			cols = [
// 				leftcol_width,
// 				dragbarWidth,
// 				page_width - leftcol_width - rightcol_min_width - dragbarWidth*2,
// 				dragbarWidth,
// 				rightcol_min_width
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-columns', newColDefn);
		}

		dataTableDrawAll(); // dataTable 전체 reload
	}
	
	function OnDrag(event) {
		if (isDraggingL) {
// 			let dragbarWidth = 4;
			
// 			let page_width = parseInt($('#page').width()); 			// 전체 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cursorX = event.clientX;	// 현재 cursor x좌표

// 			let cols = [
// 				Math.min(Math.max(leftcol_min_width, cursorX), page_width - rightcol_width - centercol_min_width - dragbarWidth*2),
// 				dragbarWidth,
// 				page_width - rightcol_width - dragbarWidth*2 - Math.min(Math.max(leftcol_min_width, cursorX), page_width - rightcol_width - centercol_min_width - dragbarWidth*2),
// 				dragbarWidth,
// 				rightcol_width
// 			];

	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

// 			$('#page').css('grid-template-columns', newColDefn);
	
// 			event.preventDefault();
		} else if (isDraggingR) {
// 			let dragbarWidth = 4;

// 			let page_width = parseInt($('#page').width()); 			// 전체 길이
// 			let leftcol_width = parseInt($('#leftcol').width());	// 왼쪽 가로
// 			let centercol_width = parseInt($('#centercol').width());	// 가운데 가로
// 			let rightcol_width = parseInt($('#rightcol').width());	// 오른쪽 가로

// 			let leftcol_min_width = 300;	// 왼쪽 가로 최소길이
// 			let centercol_min_width = 270;	// 가운데 가로 최소길이
// 			let rightcol_min_width = 270;	// 오른쪽 가로 최소길이

// 			let cursorX = event.clientX;	// 현재 cursor x좌표
			
// 			let cols = [
// 				leftcol_width,
// 				dragbarWidth,
// 				Math.min(Math.max(cursorX - leftcol_width - dragbarWidth, centercol_min_width), page_width - leftcol_width - dragbarWidth*2 - rightcol_min_width),
// 				dragbarWidth,
// 				Math.max(rightcol_min_width, page_width - leftcol_width - dragbarWidth*2 - Math.max(cursorX - leftcol_width - dragbarWidth, centercol_min_width))
// 			];
	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
// 			$('#page').css('grid-template-columns', newColDefn);
	
// 			event.preventDefault();
		}
	}

</script>
<script>
	WM_init('Prj');
	WM_init('PrdType');
	WM_init('PrdGroup');
	WM_init('PrdList');
	
	let prjIdxVal = '';
	let prdTypeIdxVal = '';
	let gubunIdx = '';

 	let judgeGubunList = getCommonCode('시스템', '041'); // 판단구분
	    
    selectBoxAppend(judgeGubunList, 'judgeGubun', '', '2');

    let now = new Date();
	let now_year = now.getFullYear();

	let yearList = new Array();
	
	// 2010년 부터 올해까지
	for(var i = now_year; i >= 2010; i--){
		if(i == now_year){
			$("#yearAdjust").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
			
		} else {
			$("#yearAdjust").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
		}
	}
	
	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'Prj') { // 대분류코드 수정중이나 신규등록중이였을 경우
			$('#btnPrjSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'PrdType') { // 중분류코드 수정중이나 신규등록중이였을 경우
			$('#btnPrdTypeSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'PrdGroup') { // 소분류코드 수정중이나 신규등록중이였을 경우
			$('#btnPrdGroupSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'PrdList') { // 소분류코드 수정중이나 신규등록중이였을 경우
			$('#btnPrdListSave').trigger('click');
			return false;
		} else {
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if (WMlastIdx == 'Prj') { // project 수정중이나 신규등록중이였을 경우
			WM_action_OFF(WMlastIdx);
			$('#btnPrjSearch').trigger('click');
			if (WM_close_check()) {
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'PrdType') { // productType 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				prjTable.row('#'+idx).select();
				$(prjTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'PrdGroup') { // productGroup 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				prjTable.row('#'+idx).select();
				$(prjTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				prdTypeTable.row('#'+idx).select();
				$(prdTypeTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
			}
			return false;
		} else if(WMlastIdx == 'PrdList') { // productList 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				prjTable.row('#'+idx).select();
				$(prjTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				prdTypeTable.row('#'+idx).select();
				$(prdTypeTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				prdGroupTable.row('#'+idx).select();
				$(prdGroupTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
		let prjNumberGubun = '';
		let check = true;
		
		if ( deleteType == 'Prj' ) {
			idx = prjTable.row('.selected').data().idx;
			prjNumberGubun = prjTable.row('.selected').data().prjNumberGubun;
		} else if ( deleteType == 'PrdType' ) {
			idx = prdTypeTable.row('.selected').data().idx;
			prjNumberGubun = prdTypeTable.row('.selected').data().prjNumberGubun;
		} else if ( deleteType == 'PrdGroup' ) {
			idx = prdGroupTable.row('.selected').data().idx;
			prjNumberGubun = prdGroupTable.row('.selected').data().prjNumberGubun;
		} else if ( deleteType == 'PrdList' ) {
			idx = prdListTable.row('.selected').data().idx;
			prjNumberGubun = prdListTable.row('.selected').data().prjNumberGubun;
		} else {
			check = false;
			return false;
		}
		if (check) {
			$.ajax({
				url: '<c:url value="/bm/projectNumberDel"/>',
	            type: 'POST',
	            data: {
	                'idx'				:	idx,
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {

					if (res.result == "ok") {
						toastr.success('삭제되었습니다.');
						
						if ( deleteType == 'Prj' ) {
							prdTypeTable.clear().draw();
							prdTypeTable.ajax.reload();
							prdGroupTable.clear().draw();
							prdGroupTable.ajax.reload();
							prjTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'PrdType' ) {
							prdGroupTable.clear().draw();
							prdGroupTable.ajax.reload();
							prdTypeTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'PrdGroup' ) {
							prdGroupTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'PrdList' ) {
// 							toastr.success('삭제되었습니다.');
							prdListTable.row('.selected').remove().draw(false);
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
			/*
			$.ajax({
				url: '<c:url value="/bm/lmsInfoAdmDel"/>',
	            type: 'POST',
	            data: {
	                'idx'				:	idx,
	                'prjNumberGubun'	:	prjNumberGubun,
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") {
						toastr.success('삭제되었습니다.');
						
						if ( deleteType == 'Prj' ) {
							prdTypeTable.clear().draw();
							prdTypeTable.ajax.reload();
							prdGroupTable.clear().draw();
							prdGroupTable.ajax.reload();
							prjTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'PrdType' ) {
							prdGroupTable.clear().draw();
							prdGroupTable.ajax.reload();
							prdTypeTable.row('.selected').remove().draw(false);
						} else if ( deleteType == 'PrdGroup' ) {
							prdGroupTable.row('.selected').remove().draw(false);
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
			*/
		}
	});
	
	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if (cancelType == 'Prj') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('Prj');

			$('#btnPrjSearch').trigger('click'); // 조회 버튼 click
			
			prjTable.colReorder.enable();
			
			$('#btnPrjNew').attr('disabled', false); // 신규 버튼
			$('#btnPrjSave').attr('disabled', true); // 저장 버튼
			$('#btnPrjEdit').attr('disabled', false); // 수정 버튼
			$('#btnPrjDel').attr('disabled', false); // 삭제 버튼
			$('#btnPrjCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'PrdType') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('PrdType');

			prdTypeTable.ajax.reload();
			prdTypeTable.colReorder.disable();
			
			$('#btnPrdTypeNew').attr('disabled', false); // 신규 버튼
			$('#btnPrdTypeSave').attr('disabled', true); // 저장 버튼
			$('#btnPrdTypeEdit').attr('disabled', false); // 수정 버튼
			$('#btnPrdTypeDel').attr('disabled', false); // 삭제 버튼
			$('#btnPrdTypeCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'PrdGroup') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('PrdGroup');

			prdGroupTable.ajax.reload();
			prdGroupTable.colReorder.disable();
			
			$('#btnPrdGroupNew').attr('disabled', false); // 신규 버튼
			$('#btnPrdGroupSave').attr('disabled', true); // 저장 버튼
			$('#btnPrdGroupEdit').attr('disabled', false); // 수정 버튼
			$('#btnPrdGroupDel').attr('disabled', false); // 삭제 버튼
			$('#btnPrdGroupCancel').attr('disabled', true); // 취소 버튼
		} else if (cancelType == 'PrdList') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('PrdList');

			prdListTable.ajax.reload();
			prdListTable.colReorder.disable();
			
			$('#btnPrdListNew').attr('disabled', false); // 신규 버튼
			$('#btnPrdListSave').attr('disabled', true); // 저장 버튼
			$('#btnPrdListEdit').attr('disabled', false); // 수정 버튼
			$('#btnPrdListDel').attr('disabled', false); // 삭제 버튼
			$('#btnPrdListCancel').attr('disabled', true); // 취소 버튼
		} else {
			console.error("예상치 못한 오류 발생: btnCancelModalY onClick");
		}
	});
	
	// project 테이블
	$('#prjTable thead tr:not(:first-child)').clone(true).addClass('filters').appendTo('#prjTable thead'); // filter 생성
	let prjTable = $('#prjTable').DataTable({
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
			url : '<c:url value="/bm/projectNumberLst"/>',
			type : 'POST',
			data : {
				'prjNumberGubun' : function() { return '001'; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //코드명
				data: 'gubunNm', className : 'text-center', name: 'gubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunNm"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //코드
				data: 'gubunCd', className : 'text-center', name: 'gubunCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunCd"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'gubunDesc', className : 'text-center', name: 'gubunDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunDesc"><span class="d-none">'+data+'</span>';
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
				let cell = $('#prjTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prjTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	prjTable.on('column-reorder', function( e, settings, details ) {
		let api = prjTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#prjTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// product Type 테이블
	$('#prdTypeTable thead tr:not(:first-child)').clone(true).addClass('filters').appendTo('#prdTypeTable thead'); // filter 생성
	let prdTypeTable = $('#prdTypeTable').DataTable({
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
			url : '<c:url value="/bm/projectNumberLst"/>',
			type : 'POST',
			data : {
				'prjNumberGubun' : function() { return '002'; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //코드명
				data: 'gubunNm', className : 'text-center', name: 'gubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunNm"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //코드
				data: 'gubunCd', className : 'text-center', name: 'gubunCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunCd"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'gubunDesc', className : 'text-center', name: 'gubunDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunDesc"><span class="d-none">'+data+'</span>';
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
				let cell = $('#prdTypeTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prdTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	prdTypeTable.on('column-reorder', function( e, settings, details ) {
		let api = prdTypeTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#prdTypeTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// product Group 테이블
	$('#prdGroupTable thead tr:not(:first-child)').clone(true).addClass('filters').appendTo('#prdGroupTable thead'); // filter 생성
	let prdGroupTable = $('#prdGroupTable').DataTable({
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
			url : '<c:url value="/bm/projectNumberLst"/>',
			type : 'POST',
			data : {
				'prjNumberGubun' : function() { return '003'; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //코드명
				data: 'gubunNm', className : 'text-center', name: 'gubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunNm"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //코드
				data: 'gubunCd', className : 'text-center', name: 'gubunCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunCd"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'gubunDesc', className : 'text-center', name: 'gubunDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunDesc"><span class="d-none">'+data+'</span>';
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
				let cell = $('#prdGroupTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prdGroupTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	prdGroupTable.on('column-reorder', function( e, settings, details ) {
		let api = prdGroupTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#prdGroupTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// product List 테이블
	$('#prdListTable thead tr:not(:first-child)').clone(true).addClass('filters').appendTo('#prdListTable thead'); // filter 생성
	let prdListTable = $('#prdListTable').DataTable({
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
			url : '<c:url value="/bm/projectNumberLst"/>',
			type : 'POST',
			data : {
				'prjNumberGubun' 	: function() { return '004'; },
				'selYear'			: function() { return  $('#yearAdjust').val(); },
				'gubunIdx'			: function() { return  gubunIdx; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //코드명
				data: 'gubunNm', className : 'text-center', name: 'gubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						var now = new Date();
						var now_year = now.getFullYear();
						
						var html = '<select class="form-select" name="baseYear"><span class="d-none">'+data+'</span>';
						html +=	'<option value="">선택</option>';
						// 2005년 부터 올해까지
						for(var i = now_year; i >= 2005; i--){
							if(i == data){
								html +=	'<option value='+i+' selected>'+i+'년</option>';
							} else html +=	'<option value='+i+'>'+i+'년</option>"';
						}
						html += '</select>'
						return html;
					}
				}
			},
			{ //코드
				data: 'gubunCd', className : 'text-center', name: 'gubunCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunCd"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'gubunDesc', className : 'text-center', name: 'gubunDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control" name="gubunDesc"><span class="d-none">'+data+'</span>';
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
				let cell = $('#prdListTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#prdListTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	prdListTable.on('column-reorder', function( e, settings, details ) {
		let api = prdGroupTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#prdListTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#yearAdjust').on('change', function(){
		prdListTable.ajax.reload();
	});

	//project 테이블 행 클릭시
	$('#prjTable tbody').on('click','tr', function() {
		let idx = prjTable.row(this).data().idx;
// 		let commonType = prjTable.row(this).data().commonType;
		prjIdxVal = idx;
// 		commonTypeVal = commonType;
		
		if(WMCheck('PrdType')) { //중분류코드 등록/수정중일 시
			setWM('PrdType', 'idx', idx);
			return false;
		}
		if(WMCheck('PrdGroup')) { //소분류코드 등록/수정중일 시
			setWM('PrdGroup', 'idx', idx);
			return false;
		}

		$('#btnPrjEdit').attr('disabled', false);
		$('#btnPrjDel').attr('disabled', false);
	});
	
	// project 조회 버튼 click
	$('#btnPrjSearch').on('click', function() {
		if(WMCheck('Prj')) {
			return false;
		}
		$('#my-spinner').show();

		//1
		prjTable.clear().draw();
		prjTable.ajax.reload(function() {
			prjTable.rowReorder.disable();
		});
		
		$('#prjTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnPrjNew').attr('disabled', false); // 신규 버튼
		$('#btnPrjSave').attr('disabled', true); // 저장 버튼
		$('#btnPrjEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrjDel').attr('disabled', true); // 삭제 버튼
		$('#btnPrjCancel').attr('disabled', true); // 취소 버튼

		//2
		prdTypeTable.clear().draw();
		prdTypeTable.ajax.reload(function() {
			prdTypeTable.rowReorder.disable();
		});
		
		$('#prdTypeTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnPrdTypeNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdTypeSave').attr('disabled', true); // 저장 버튼
		$('#btnPrdTypeEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrdTypeDel').attr('disabled', true); // 삭제 버튼
		$('#btnPrdTypeCancel').attr('disabled', true); // 취소 버튼

		//3
		prdGroupTable.clear().draw();
		prdGroupTable.ajax.reload(function() {
			prdGroupTable.rowReorder.disable();
		});
		
		$('#prdGroupTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnPrdGroupNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdGroupSave').attr('disabled', true); // 저장 버튼
		$('#btnPrdGroupEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrdGroupDel').attr('disabled', true); // 삭제 버튼
		$('#btnPrdGroupCancel').attr('disabled', true); // 취소 버튼

		//4
		prdListTable.clear().draw();
		prdListTable.ajax.reload(function() {
			prdListTable.rowReorder.disable();
		});
		
		$('#prdListTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnPrdListNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdListSave').attr('disabled', true); // 저장 버튼
		$('#btnPrdListEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrdListDel').attr('disabled', true); // 삭제 버튼
		$('#btnPrdListCancel').attr('disabled', true); // 취소 버튼

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	
	// project 신규 버튼 click
	$('#btnPrjNew').on('click', function() {
		WM_action_ON('Prj', 'workingWarningModal');
		let col_filter_text = [];
		$('#prjTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		prjTable.row.add({
			'idx'			:	'',
			'gubunNm'		:	col_filter_text[0],
			'gubunCd'		:	col_filter_text[1],
			'gubunDesc'		:	col_filter_text[2],
		}).draw(false);
		
		prjTable.colReorder.disable();

		$('#btnPrjNew').attr('disabled', false); // 신규 버튼
		$('#btnPrjSave').attr('disabled', false); // 저장 버튼
		$('#btnPrjEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrjDel').attr('disabled', false); // 삭제 버튼
		$('#btnPrjCancel').attr('disabled', false); // 취소 버튼
	});
	
	// project 수정 버튼 click
	$('#btnPrjEdit').on('click', function() {
		if($('#prjTable').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('Prj', 'workingWarningModal');
		$('#prjTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#prjTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				});
			}
		});

		prjTable.colReorder.disable();

		$('#btnPrjNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnPrjSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnPrjEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnPrjDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnPrjCancel').attr('disabled', false); // ADM 취소 버튼
	});
	
	// project 저장 버튼 클릭시
	$('#btnPrjSave').on('click', function() {
		let array = [];
		let state = true;
		$('#prjTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = prjTable.row($(item)).data().idx;
				let gubunNm = $(td).eq(prjTable.column('gubunNm:name').index()).find('input').val();
				let gubunCd = $(td).eq(prjTable.column('gubunCd:name').index()).find('input').val();
				let gubunDesc = $(td).eq(prjTable.column('gubunDesc:name').index()).find('input').val();

				if(gubunNm == '') {
					toastr.warning('코드명을 입력해주세요.');
					$(td).eq(prjTable.column('gubunNm:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(gubunCd == '') {
					toastr.warning('코드를 입력해주세요.');
					$(td).eq(prjTable.column('gubunCd:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.prjNumberGubun = '001';
				obj.gubunIdx = '';
				obj.gubunCd = gubunCd;
				obj.gubunNm = gubunNm;
				obj.gubunDesc = gubunDesc;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'gubunCd').length) {
			toastr.warning('중복되는 대분류코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, prjTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/projectNumberIU"/>',
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

					WM_action_OFF('Prj');

					$('#btnPrjSearch').trigger('click'); // 조회버튼 click

					$('#btnPrjNew').attr('disabled', false); // 신규 버튼
					$('#btnPrjSave').attr('disabled', true); // 저장 버튼
					$('#btnPrjEdit').attr('disabled', true); // 수정 버튼
					$('#btnPrjDel').attr('disabled', true); // 삭제 버튼
					$('#btnPrjCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// project 삭제 버튼 클릭시
	$('#btnPrjDel').on('click', function() {
		if($('#prjTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 대분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = prjTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','Prj');
		} else {
			prjTable.row('.selected').remove().draw();
		}
	});
	
	// project 취소 버튼 클릭시
	$('#btnPrjCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'Prj');
	});
	
	//Product Type////////////////////////////////////////////////////////////////////////////////////////////////
	
	// Product Type 테이블 행 클릭시
	$('#prdTypeTable tbody').on('click','tr', function() {
		let idx = prdTypeTable.row(this).data().idx;
// 		let commonType = prjTable.row(this).data().commonType;
		prdTypeIdxVal = idx;
// 		commonTypeVal = commonType;
		
		if(WMCheck('Prj')) { //project 등록/수정중일 시
			setWM('Prj', 'idx', idx);
			return false;
		}
		if(WMCheck('PrdGroup')) { //prd Group 등록/수정중일 시
			setWM('PrdGroup', 'idx', idx);
			return false;
		}

		$('#btnPrdTypeEdit').attr('disabled', false);
		$('#btnPrdTypeDel').attr('disabled', false);
	});
	
	// Product Type 등록 버튼 클릭시
	$('#btnPrdTypeNew').on('click', function() {
		
		WM_action_ON('PrdType', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#prdTypeTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		prdTypeTable.row.add({
			'idx'			:	'',
			'gubunNm'		:	col_filter_text[0],
			'gubunCd'		:	col_filter_text[1],
			'gubunDesc'		:	col_filter_text[2],
		}).draw(false);

		prdTypeTable.colReorder.disable();

		$('#btnPrdTypeNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdTypeSave').attr('disabled', false); // 저장 버튼
		$('#btnPrdTypeEdit').attr('disabled', true); // 수정 버튼
		$('#btnPrdTypeDel').attr('disabled', false); // 삭제 버튼
		$('#btnPrdTypeCancel').attr('disabled', false); // 취소 버튼
	});
	
	// Product Type 수정 버튼 클릭시
	$('#btnPrdTypeEdit').on('click', function() {
		if($('#prdTypeTable').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('PrdType', 'workingWarningModal');
		
		$('#prdTypeTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#prdTypeTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				});
			}
		});

		prdTypeTable.colReorder.disable();

		$('#btnPrdTypeNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnPrdTypeSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnPrdTypeEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnPrdTypeDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnPrdTypeCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// Product Type 저장 버튼 클릭시
	$('#btnPrdTypeSave').on('click', function() {
		let array = [];
		let state = true;
		$('#prdTypeTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = prdTypeTable.row($(item)).data().idx;
				let gubunNm = $(td).eq(prdTypeTable.column('gubunNm:name').index()).find('input').val();
				let gubunCd = $(td).eq(prdTypeTable.column('gubunCd:name').index()).find('input').val();
				let gubunDesc = $(td).eq(prdTypeTable.column('gubunDesc:name').index()).find('input').val();

				if(gubunNm == '') {
					toastr.warning('코드명을 입력해주세요.');
					$(td).eq(prdTypeTable.column('gubunNm:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(gubunCd == '') {
					toastr.warning('코드를 입력해주세요.');
					$(td).eq(prdTypeTable.column('gubunCd:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.prjNumberGubun = '002';
				obj.gubunIdx = '';
				obj.gubunCd = gubunCd;
				obj.gubunNm = gubunNm;
				obj.gubunDesc = gubunDesc;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'gubunCd').length) {
			toastr.warning('중복되는 중분류코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, prdTypeTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/projectNumberIU"/>',
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

					WM_action_OFF('PrdType');

					prdTypeTable.clear().draw();
					prdTypeTable.ajax.reload(function() {
						$('#prdTypeTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					prdTypeTable.colReorder.enable();

					$('#btnPrdTypeNew').attr('disabled', false); // 신규 버튼
					$('#btnPrdTypeSave').attr('disabled', true); // 저장 버튼
					$('#btnPrdTypeEdit').attr('disabled', true); // 수정 버튼
					$('#btnPrdTypeDel').attr('disabled', true); // 삭제 버튼
					$('#btnPrdTypeCancel').attr('disabled', true); // 취소 버튼
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
	$('#btnPrdTypeDel').on('click', function() {
		if($('#prdTypeTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 중분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = prdTypeTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'PrdType');
		} else {
			prdTypeTable.row('.selected').remove().draw();
		}
	});
	
	// 중분류코드 취소 버튼 클릭시
	$('#btnPrdTypeCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'PrdType');
	});
	
	//product Group////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// product Group 테이블 행 클릭시
	$('#prdGroupTable tbody').on('click','tr', function() {
		if(WMCheck('Prj')) { //대분류코드 등록/수정중일 시
			setWM('Prj', 'idx', idx);
			return false;
		}
		if(WMCheck('PrdType')) { //중분류코드 등록/수정중일 시
			setWM('PrdType', 'idx', idx);
			return false;
		}

		gubunIdx = prdGroupTable.row(this).data().idx;
		prdListTable.ajax.reload();
		$('#btnPrdGroupEdit').attr('disabled', false);
		$('#btnPrdGroupDel').attr('disabled', false);
	});
	
	// product Group 등록 버튼 클릭시
	$('#btnPrdGroupNew').on('click', function() {
		
		WM_action_ON('PrdGroup', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#prdGroupTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		prdGroupTable.row.add({
			'idx'			:	'',
			'gubunNm'		:	col_filter_text[0],
			'gubunCd'		:	col_filter_text[1],
			'gubunDesc'		:	col_filter_text[2],
		}).draw(false);

		prdGroupTable.colReorder.disable();

		$('#btnPrdGroupNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdGroupSave').attr('disabled', false); // 저장 버튼
		$('#btnPrdGroupEdit').attr('disabled', false); // 수정 버튼
		$('#btnPrdGroupDel').attr('disabled', false); // 삭제 버튼
		$('#btnPrdGroupCancel').attr('disabled', false); // 취소 버튼
	});
	
	// product Group 수정 버튼 클릭시
	$('#btnPrdGroupEdit').on('click', function() {
		if($('#prdGroupTable').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('PrdGroup', 'workingWarningModal');
		
		$('#prdGroupTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#prdGroupTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						let value = $(td).text();
						$(td).html('<input type="text" class="form-control" value="'+value+'">');
					}
				});
			}
		});

		prdGroupTable.colReorder.disable();

		$('#btnPrdGroupNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnPrdGroupSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnPrdGroupEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnPrdGroupDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnPrdGroupCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// product Group 저장 버튼 클릭시
	$('#btnPrdGroupSave').on('click', function() {
		let array = [];
		let state = true;
		$('#prdGroupTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = prdGroupTable.row($(item)).data().idx;
				let gubunNm = $(td).eq(prdGroupTable.column('gubunNm:name').index()).find('input').val();
				let gubunCd = $(td).eq(prdGroupTable.column('gubunCd:name').index()).find('input').val();
				let gubunDesc = $(td).eq(prdGroupTable.column('gubunDesc:name').index()).find('input').val();

				if(gubunNm == '') {
					toastr.warning('코드명을 입력해주세요.');
					$(td).eq(prdGroupTable.column('gubunNm:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(gubunCd == '') {
					toastr.warning('코드를 입력해주세요.');
					$(td).eq(prdGroupTable.column('gubunCd:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.prjNumberGubun = '003';
				obj.gubunIdx = '';
				obj.gubunCd = gubunCd;
				obj.gubunNm = gubunNm;
				obj.gubunDesc = gubunDesc;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'gubunCd').length) {
			toastr.warning('중복되는 코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, prdGroupTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/projectNumberIU"/>',
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

					WM_action_OFF('PrdGroup');

					prdGroupTable.clear().draw();
					prdGroupTable.ajax.reload(function() {
						$('#prdGroupTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					prdGroupTable.colReorder.enable();

					$('#btnPrdGroupNew').attr('disabled', false); // 신규 버튼
					$('#btnPrdGroupSave').attr('disabled', true); // 저장 버튼
					$('#btnPrdGroupEdit').attr('disabled', false); // 수정 버튼
					$('#btnPrdGroupDel').attr('disabled', false); // 삭제 버튼
					$('#btnPrdGroupCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// product Group 삭제 버튼 클릭시
	$('#btnPrdGroupDel').on('click', function() {
		if($('#prdGroupTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 소분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = prdGroupTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'PrdGroup');
		} else {
			prdGroupTable.row('.selected').remove().draw();
		}
	});
	
	// product Group 취소 버튼 클릭시
	$('#btnPrdGroupCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'PrdGroup');
	});

	//product List////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// product List 테이블 행 클릭시
	$('#prdListTable tbody').on('click','tr', function() {
		if(WMCheck('Prj')) { //대분류코드 등록/수정중일 시
			setWM('Prj', 'idx', idx);
			return false;
		}
		if(WMCheck('PrdType')) { //중분류코드 등록/수정중일 시
			setWM('PrdType', 'idx', idx);
			return false;
		}

		$('#btnPrdListEdit').attr('disabled', false);
		$('#btnPrdListDel').attr('disabled', false);
	});
	
	// product List 등록 버튼 클릭시
	$('#btnPrdListNew').on('click', function() {
		if(gubunIdx == ''){
			toastr.warning('추가할 대메뉴를 선택해주세요.');
			return false;
		}
		
		WM_action_ON('PrdList', 'workingWarningModal');
		
		let col_filter_text = [];
		$('#prdListTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		prdListTable.row.add({
			'idx'			:	'',
			'gubunNm'		:	$('#yearAdjust').val(),
			'gubunCd'		:	col_filter_text[0],
			'gubunDesc'		:	col_filter_text[1],
		}).draw(false);

		prdListTable.colReorder.disable();

		$('#btnPrdListNew').attr('disabled', false); // 신규 버튼
		$('#btnPrdListSave').attr('disabled', false); // 저장 버튼
		$('#btnPrdListEdit').attr('disabled', false); // 수정 버튼
		$('#btnPrdListDel').attr('disabled', false); // 삭제 버튼
		$('#btnPrdListCancel').attr('disabled', false); // 취소 버튼
	});
	
	// 소분류코드 수정 버튼 클릭시
	$('#btnPrdListEdit').on('click', function() {
		if($('#prdListTable').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		WM_action_ON('PrdList', 'workingWarningModal');
		
		$('#prdListTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#prdListTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == prdListTable.column('gubunNm:name').index()) {
							let value = prdListTable.row(tr).data().gubunNm;
							var now = new Date();
							var now_year = now.getFullYear();
							
							var html = '<select class="form-select" name="baseYear"><span class="d-none">'+value+'</span>';
							html +=	'<option value="">선택</option>';
							// 2005년 부터 올해까지
							for(var i = now_year; i >= 2005; i--){
								if(i == value){
									html +=	'<option value='+i+' selected>'+i+'년</option>';
								} else html +=	'<option value='+i+'>'+i+'년</option>"';
							}
							html += '</select>'
							$(td).html(html);
						} else if(index_td == prdListTable.column('gubunCd:name').index()) {
							let value = prdListTable.row(tr).data().gubunCd;
							$(td).html('<input type="text" class="form-control inputGroup" name="gubunCd" value="'+value+'" >');
						} else {
							let value = prdListTable.row(tr).data().gubunDesc;
							if(value == '' || value == null) {
								$(td).html('<input type="text" class="form-control inputGroup" name="gubunDesc" value="" >');
							} else {
								$(td).html('<input type="text" class="form-control inputGroup" name="gubunDesc" value="'+value+'" >');
							}
						}
					}
				});
			}
			
		});

		prdListTable.colReorder.disable();

		$('#btnPrdListNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnPrdListSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnPrdListEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnPrdListDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnPrdListCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// 소분류코드 저장 버튼 클릭시
	$('#btnPrdListSave').on('click', function() {
		let array = [];
		let state = true;
		$('#prdListTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0 || $(item).find('td').find('select').length) {
				let td = $(item).find('td');
				let idx = prdListTable.row($(item)).data().idx;
				let gubunNm = $(td).eq(prdListTable.column('gubunNm:name').index()).find('select').val();
				let gubunCd = $(td).eq(prdListTable.column('gubunCd:name').index()).find('input').val();
				let gubunDesc = $(td).eq(prdListTable.column('gubunDesc:name').index()).find('input').val();

				if(gubunNm == '') {
					toastr.warning('기준년도를 선택해주세요.');
					$(td).eq(prdListTable.column('gubunNm:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(gubunCd == '') {
					toastr.warning('코드를 입력해주세요.');
					$(td).eq(prdListTable.column('gubunCd:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.prjNumberGubun = '004';
				obj.gubunIdx = gubunIdx;
				obj.gubunCd = gubunCd;
				obj.gubunNm = gubunNm;
				obj.gubunDesc = gubunDesc;
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
		if(array.length != _.uniqBy(array, 'gubunCd').length) {
			toastr.warning('중복되는 코드가 존재합니다.');
			return false;
		}

		array = _.differenceWith(array, prdGroupTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bm/projectNumberIU"/>',
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

					WM_action_OFF('PrdGroup');

					prdListTable.clear().draw();
					prdListTable.ajax.reload(function() {
						$('#prdListTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					
					prdListTable.colReorder.enable();

					$('#btnPrdListNew').attr('disabled', false); // 신규 버튼
					$('#btnPrdListSave').attr('disabled', true); // 저장 버튼
					$('#btnPrdListEdit').attr('disabled', false); // 수정 버튼
					$('#btnPrdListDel').attr('disabled', false); // 삭제 버튼
					$('#btnPrdListCancel').attr('disabled', true); // 취소 버튼
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// 소분류코드 삭제 버튼 클릭시
	$('#btnPrdListDel').on('click', function() {
		if($('#prdListTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 소분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = prdListTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'PrdList');
		} else {
			prdListTable.row('.selected').remove().draw();
		}
	});
	
	// 소분류코드 취소 버튼 클릭시
	$('#btnPrdListCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'PrdList');
	});

	function setDateSelectBox(value){
		var now = new Date();
		var now_year = now.getFullYear();
		
		$("select[name=baseYear]").append("<option value=''>선택</option>");
		
		// 2005년 부터 올해까지
		for(var i = now_year; i >= 2005; i--){
			if(i == value){
				$("select[name=baseYear]").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
			} else $("select[name=baseYear]").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
		}
	}
	
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
// 		$.each($("#prdGroupTable tbody tr"), function(i, e) {
// 			if ($(e).find("#judgeGubun").val() == data.judgeGubun) {
// 				isSelected = true;
// 			}
// 		})
// 		if (isSelected) {
// 			toastr.warning("이미 선택된 판정구분입니다.");
// 		} else {
// 			$(prdGroupTable.row(".selected").node()).find("#judgeGubun").val(data.judgeGubun);
// 			$(prdGroupTable.row(".selected").node()).find("#judgeGubunNm").val(data.judgeGubunNm);
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
// 		$.each($("#prdGroupTable tbody tr"), function(i, e) {
// 			if ($(e).find("#judgeGubun").val() == data.judgeGubun) {
// 				isSelected = true;
// 			}
// 		})
// 		if (isSelected) {
// 			toastr.warning("이미 선택된 판정구분입니다.");
// 		} else {
// 			$(prdGroupTable.row(".selected").node()).find("#judgeGubun").val(data.judgeGubun);
// 			$(prdGroupTable.row(".selected").node()).find("#judgeGubunNm").val(data.judgeGubunNm);
// 			$('#acctModal').modal('hide');
// 		}
// 	})
</script>

</body>
</html>