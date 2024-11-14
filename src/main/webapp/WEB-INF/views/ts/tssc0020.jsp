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
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)"
	style="grid-template-areas: 'leftcol dragbarL centercol dragbarR rightcol'; grid-template-rows: 1fr; grid-template-columns: 5fr 2px 0fr 2px 4fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<!-- 				<div class="d-flex align-items-center d-flex"> -->
				<!-- 				</div> -->


				<div class="d-flex align-items-center d-flex">
					<label
						class="form-label d-flex align-items-center header-label m-0 me-1 h-100">접수일</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="startDate"> <label
						class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="endDate"> <label
						class="form-label d-flex align-items-center header-label m-0 me-1 h-100">처리일</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="startPrsDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="endPrsDate"> <label
						class="form-label d-flex align-items-center header-label m-0 me-1 h-100">비용</label>
					<select class="form-select w-auto h-100 me-1" id="paidFreeSrh">
						<option value="" selected>전체</option>
						<option value="001">유상</option>
						<option value="002">무상</option>
					</select>
					<!-- 					<div class="input-group w-auto h-100 me-3"> -->
					<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">담당자</label> -->
					<!-- 					<input type="text" class="form-control w-auto h-100 me-1" id="receiveChargrSrh" disabled> -->
					<!-- 					<button type="button" id="btnDelUserNm" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;"> -->
					<!-- 						<i class="fa-solid fa-xmark"></i> -->
					<!-- 					</button> -->
					<!-- 					<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchUserNm"> -->
					<!-- 						<i class="fa-solid fa-magnifying-glass"></i> -->
					<!-- 					</button> -->
					<!-- 					</div> -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto "
						style="font-size: 18px !important;" id="btnCsSearch">
						<i class="fa-regular fa-clipboard"></i>
					</button>
					<button type="button" class="btn btn-outline-danger w-auto"
						style="font-size: 17px !important;" id="btnCsDel">
						<i class="fa-solid fa-trash-can"></i>
					</button>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="csListTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">접수일자</th>
							<th class="text-center">프로젝트코드</th>
							<th class="text-center">시리얼번호</th>
							<th class="text-center">처리일자</th>
							<th class="text-center">유/무상</th>
							<th class="text-center">A/S번호</th>
							<th class="text-center">고객사명</th>
							<th class="text-center">전화번호</th>
							<th class="text-center">접수자</th>
							<th class="text-center">담당자</th>
							<th class="text-center">처리자</th>
							<th class="text-center">합계</th>
						</tr>
					</thead>
					<tfoot>
						<tr style="border: 1px solid black;">
							<th class="text-center align-middle">A/S유상합계</th>
							<td colspan="2" id="paidTotal"></td>
							<th class="text-center align-middle">A/S무상합계</th>
							<td colspan="2" id="freeTotal"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>

	<div id="dragbarL" onmousedown="StartDrag('L')"
		ondblclick="minimum(this)"></div>

	<div id="centercol" class="d-none">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto"
							style="font-size: 18px !important;" id="btnClose">
							<i class="fa-solid fa-caret-left"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0">
					<thead class="table-light">
						<tr>
							<th class="text-center">고객사명</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="companyNmae" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center">전화번호</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="phoneNumber" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center">주소</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="address" disabled></td>
						</tr>
						<tr>
							<th class="text-center">담당자</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="receiveChargr" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center">불량유형</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="faultyType" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center">상세내용</th>
							<td class="text-center align-middle"><textArea
									class="form-control inputGroup textarea"
									style="max-width: 100%; resize: none; min-height: 0px !important;"
									id="detail" disabled></textArea></td>
						</tr>
					</thead>
				</table>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="itemGubunTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">품목구분1</th>
							<th class="text-center">품목구분2</th>
							<th class="text-center">모듈명</th>
							<th class="text-center">제품시리얼번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>

	<div id="dragbarR" onmousedown="StartDrag('R')"
		ondblclick="minimum(this)"></div>

	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 3px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex"></div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto"
							style="font-size: 18px !important;" id="btnNew">
							<i class="fa-solid fa-plus"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto"
							style="font-size: 20px !important;" id="btnSave" disabled>
							<i class="fa-regular fa-floppy-disk"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto"
							style="font-size: 18px !important;" id="btnEdit" disabled>
							<i class="fa-regular fa-pen-to-square"></i>
						</button>
						<button type="button" class="btn btn-outline-danger w-auto"
							style="font-size: 17px !important;" id="btnDel" disabled>
							<i class="fa-solid fa-trash-can"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto"
							style="font-size: 20px !important;" id="btnSmallCancel" disabled>
							<i class="fa-solid fa-xmark"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="itemCostTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">품목코드</th>
							<th class="text-center">품목명</th>
							<th class="text-center">규격</th>
							<th class="text-center">재고수량</th>
							<th class="text-center">소모수량</th>
							<th class="text-center">유/무상</th>
							<th class="text-center">단가</th>
							<th class="text-center">수리비</th>
							<th class="text-center">기타비용</th>
							<th class="text-center">출장비</th>
							<th class="text-center">금액</th>
							<th class="text-center">처리사항</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="tataible">
					<thead class="table-light">
						<tr>
							<th class="text-center">유/무상</th>
							<td colspan="3" class="text-center align-middle"><select
								class="form-select" id="paidFree" disabled>
							</select></td>
						</tr>
						<tr>
							<th class="text-center">처리일자</th>
							<td class="text-center align-middle"><input type="date"
								class="form-control inputGroup" id="processDate" disabled>
							</td>
							<th class="text-center">처리자</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control inputGroup" id="processUser" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center">자재비</th>
							<td class="text-center align-middle"><input type="text"
								class="form-control text-end inputGroup" id="materialCost"
								onkeyup="numberFormat(this,'int')" disabled></td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="itemGubunModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 34vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemGubunModalTitle">품목정보 선택</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnItemGubunPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="itemGubunModalTable"
					style="width: 100%;">
					<thead class="table-light">
						<tr>
							<th class="text-center">품번</th>
							<th class="text-center">품명</th>
							<th class="text-center">규격</th>
							<!-- 						<th class="text-center">바코드</th> -->
							<!-- 						<th class="text-center">창고</th> -->
							<th class="text-center">재고량</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="deleteCheckModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i>
					<spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<p>
					작업한 내용이 전부 삭제되고 삭제된 내용은 복구할 수 없습니다.<br>삭제하시겠습니까?
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnDelChkModalY"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnDelChkModalN"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
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
	$(document).on('click','#csListTable tbody tr', function(){
		if($('#centercol').hasClass('d-none') || $('#csListTable tbody').find('tr.selected').length != 0){
// 			console.log('이프');
			$('#page').css('grid-template-columns', '6fr 4px 3fr 4px 5fr');
			$('#centercol').removeClass('d-none');
		}
		dataTableDrawAll();
	});
	$('#btnClose').on('click', function(){
		$('#page').css('grid-template-columns', '5fr 2px 0fr 2px 4fr');
		$('#centercol').addClass('d-none');
		dataTableDrawAll();
	});
	$('#btnDelUserNm').on('click', function(){
		$('#batchProjectCd').val('');
	});
</script>
<script>
	WM_init('RESULT');
	
	let csIdxVal = '';
	let gubunIdx = '5';
	let idxVal = '';
	let asNoVal = '';
	let subAsNoVal = '';
	let dtlAsNo = '';
	let dtlIdx = '';
	let modalGubun = '';

	let paidFreeGubun = getCommonCode('일반','050'); // 유무상 구분
    selectBoxAppend(paidFreeGubun, 'paidFree', '', ''); // 유무상 구분

    $('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
    $('#startPrsDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endPrsDate').val(moment().format('YYYY-MM-DD'));
	
	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'RESULT') { // 소분류코드 수정중이나 신규등록중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		} else {
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'RESULT') { // 소분류코드 수정중이나 신규등록중이였을 경우
			if ( getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined ) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				
				csListTable.row('#'+idx).select();
				$(csListTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				itemGubunTable.row('#'+idx).select();
				$(itemGubunTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
		let asNo = '';
		let check = true;
		if ( modalGubun == 'resultM' ) {
				idx = itemCostTable.row('.selected').data().idx;
				asNo = itemCostTable.row('.selected').data().asNo;
		} else if(modalGubun == 'receiveM'){
				asNo = csListTable.row('.selected').data().asNo;
		}else{
			check = false;
			return false;
		}
		
		if (check) {
			if(modalGubun == 'resultM'){
				$.ajax({
					url: '<c:url value="/ts/csResultD"/>',
		            type: 'POST',
		            data: {
		                'idx'	:	idx,
		                'asNo'	:	asNo,
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") {
							toastr.success('삭제되었습니다.');
							
							if ( deleteType == 'RESULT' ) {
								itemCostTable.row('.selected').remove().draw(false);
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
			}else if(modalGubun == 'receiveM'){
				$.ajax({
					url: '<c:url value="/ts/admCsDelete"/>',
		            type: 'POST',
		            data: {
		                'asNo'	:	asNo
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") {
							toastr.success('삭제되었습니다.');
							
							if ( deleteType == 'RESULT' ) {
								csListTable.row('.selected').remove().draw(false);
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
		}
	});
	
	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if (cancelType == 'RESULT') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('RESULT');

			itemCostTable.ajax.reload();
			itemCostTable.colReorder.disable();
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnSmallCancel').attr('disabled', true); // 취소 버튼
		} else {
			console.error("예상치 못한 오류 발생: btnCancelModalY onClick");
		}
	});
	
	// 삭제 경고창 삭제 버튼 click
	$('#btnDelChkModalY').on('click', function() {
		$('#btnDeleteModalY').trigger('click');
	});
	
	
	// 대분류관리 테이블
	$('#csListTable thead tr').clone(true).addClass('filters').appendTo('#csListTable thead'); // filter 생성
	let csListTable = $('#csListTable').DataTable({
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
        scrollY: '79vh',
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
			url : '<c:url value="/ts/CmplnReceiveList"/>',
			type : 'POST',
			data : {
				startDate	:	function(){return moment($('#startDate').val()).format('YYYYMMDD');},
				endDate		:	function(){return moment($('#endDate').val()).format('YYYYMMDD');},
				startPrsDate	:	function(){return moment($('#startPrsDate').val()).format('YYYYMMDD');},
				endPrsDate		:	function(){return moment($('#endPrsDate').val()).format('YYYYMMDD');},
				paidFree	: function(){return $('#paidFreeSrh').val();},
// 				companyNm	:	function(){return "";},
// 				phoneNumber	:	function(){return "";},
// 				receiveChargr	:	function(){return $('#receiveChargrSrh').val();},
				resultGubun	:	function(){return "";},
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'cmplnDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{data : 'prjCd','className' : 'text-center align-middle'},
			{	render : function(data, type, row, meta) {
					return "";
				},'className' : 'text-center align-middle'
			},
			{data : 'processDate','className' : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{data : 'paidFree','className' : 'text-center align-middle',
				render : function(data, type, row, meta){
					let paidFree = '';
					paidFreeGubun.forEach(function(item) {
						if(data == item.commonCd){
							paidFree = item.commonNm;
						}
					});
					return paidFree;
				}
			},
			{data : 'asNo','className' : 'text-center align-middle'},
			{data : 'companyNm','className' : 'text-center align-middle'},
			{data : 'phoneNumber','className' : 'text-center align-middle'},
			{data : 'rcvChargr','className' : 'text-center align-middle'},
			{data : 'receiveChargr','className' : 'text-center align-middle'},
			{data : 'processUser','className' : 'text-center align-middle'},
			{data : 'totalCost','className' : 'text-end align-middle',
				render : function(data, type, row, meta){
					return addCommas(data);
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
			

			let data = api.data();

			let paidTotal = 0;
			let freeTotal = 0;
			
	 		for(var i=0; i<data.length; i++){
				if(data[i].paidFree=='001'){
					paidTotal += parseFloat(data[i].totalCost);
				}else{
					freeTotal += parseFloat(data[i].totalCost);
				}
	 			
	 	 	}

	 		$('#paidTotal').text(addCommas(paidTotal));
	 		$('#freeTotal').text(addCommas(freeTotal));

	 		setTimeout(function(){
	 	 		$('#csListTable tfoot').remove();
	 	 	}, 150);
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#csListTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#csListTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	csListTable.on('column-reorder', function( e, settings, details ) {
		let api = csListTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#csListTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 중분류관리 테이블
	$('#itemGubunTable thead tr').clone(true).addClass('filters').appendTo('#itemGubunTable thead'); // filter 생성
	let itemGubunTable = $('#itemGubunTable').DataTable({
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
        scrollY: '56vh',
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
			url : '<c:url value="/ts/csReceiveDtlList"/>',
			type : 'POST',
			data : {
				'asNo' : function(){return asNoVal},
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'itemGubun1', className : 'text-center', name: 'itemGubun1'
			},
			{ //중분류코드
				data: 'itemGubun2', className : 'text-center', name: 'itemGubun2'
			},
			{ //중분류명
				data: 'moduleNm', className : 'text-center', name: 'moduleNm'
			},
			{ //중분류명
				data: 'serialNo', className : 'text-center', name: 'serialNo'
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
// 			{ 
// 				extend: 'excel', text: 'Excel', charset: 'UTF-8', bom: true ,
// 	        	exportOptions: {
// 	            columns: ':visible',
// 	                modifier: {                      
// 	                	selected:null
// 	        		},                   
// 	        	},
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	},
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
				let cell = $('#itemGubunTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemGubunTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	itemGubunTable.on('column-reorder', function( e, settings, details ) {
		let api = itemGubunTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#itemGubunTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 소분류관리 테이블
	$('#itemCostTable thead tr').clone(true).addClass('filters').appendTo('#itemCostTable thead'); // filter 생성
	let itemCostTable = $('#itemCostTable').DataTable({
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
        scrollY: '56vh',
        scrollX: true,
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'os',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/ts/csResultList"/>',
			type : 'POST',
			data : {
				asNo	:	function() {return asNoVal;},
			},
		},
        rowId: 'idx',
		columns : [
			{ //품목코드
				data: 'itemCd', className : 'text-center', name: 'itemCd',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemCdIdx">'+row['idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemCd">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemCdIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemCd"></div>';
						return html;
					}
				}
			},
			{//품목명
				data: 'itemNm', className : 'text-center', name: 'itemNm',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemNmIdx">'+row['idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemNm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemNmIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemNm"></div>';
						return html;
					}
				}
			},
			{//규격
				data: 'itemDc', className : 'text-center', name: 'itemDc',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemDcIdx">'+row['idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemDc">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemDcIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemDc"></div>';
						return html;
					}
				}
			},
			{//재고수량
				data: 'stockQty', className : 'text-center', name: 'stockQty',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="stockQtyIdx">'+row['idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="stockQty">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemIdx"></div>';
						html += '<div style="white-space:nowrap;" name="stockQty"></div>';
						return html;
					}
				}
			},
			{ //소모수량
				data: 'consumption', className : 'text-center', name: 'consumption',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<div style="white-space:nowrap;" name="consumption">'+addCommas(parseInt(data))+'<div>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="consumption" onkeyup="numberFormat(this,\'int\')">';
						return html;
					}
				}
			},
			{//유/무상
				data: 'paidFree', className : 'text-center', name: 'paidFree',
				render: function(data, type, row, meta) {
					let html = '';
					if(row['idx'] != '' && row['idx'] != null) {
						if(data != null && data != ''){
							html = '<select class="form-select" name="paidFree" disabled>';
							paidFreeGubun.forEach(function(item) {
								html += '<option value="'+item.commonCd+'"';
								if(data == item.commonCd){
									html += 'selected'
								}
								html += '>'+item.commonNm+'</option>';
							});
						}
					} else {
						html = '<select class="form-select" name="paidFree">';
						paidFreeGubun.forEach(function(item) {
							html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});
					}
					html += '</select>';
					return html;
				}
			},
			{//단가
				data: 'priceCost', className : 'text-center', name: 'priceCost',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<div style="white-space:nowrap;" name="priceCost">'+addCommas(parseInt(data))+'<div>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="priceCost" onkeyup="numberFormat(this,\'int\')">';
						return html;
					}
				}
			},
			{//수리비
				data: 'repairCost', className : 'text-center', name: 'repairCost',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<div style="white-space:nowrap;" name="repairCost">'+addCommas(parseInt(data))+'<div>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="priceCost" onkeyup="numberFormat(this,\'int\')">';
						return html;
					}
				}
			},
			{//기타비용
				data: 'etcCost', className : 'text-center', name: 'etcCost',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<div style="white-space:nowrap;" name="totalCost">'+addCommas(parseInt(data))+'<div>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="etcCost" onkeyup="numberFormat(this,\'int\')">';
						return html;
					}
				}
			},
			{//출장비
				data: 'travelExpense', className : 'text-center', name: 'travelExpense',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<div style="white-space:nowrap;" name="travelExpense">'+addCommas(parseInt(data))+'<div>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="travelExpense" onkeyup="numberFormat(this,\'int\')">';
						return html;
					}
				}
			},
			{//금액
				data: 'totalCost', className : 'text-center', name: 'totalCost',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						var html = '<input type="text" class="form-control text-end" value="'+addCommas(parseInt(data))+'" name="totalCost" onkeyup="numberFormat(this,\'int\')" disabled>';
						return html;
					} else {
						var html = '<input type="text" class="form-control text-end" value="0" name="totalCost" onkeyup="numberFormat(this,\'int\')" disabled>';
						return html;
					}
				}
			},
			{//처리사항
				data: 'processing', className : 'text-center', name: 'processing',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						return '<div style="white-space:pre-line;min-width:200px;">'+data+'</div>';
					} else {
						return '<textarea class="form-control" style="min-width:200px; resize: none;" ></textarea>';
					}
				}
			},
			{//비고
				data: 'resultDesc', className : 'text-center', name: 'resultDesc',
				render: function(data, type, row, meta) {
					if(row['idx'] != null && row['idx'] != ''){
						return '<div style="white-space:pre-line;min-width:200px;">'+data+'</div>';
					} else {
						return '<textarea class="form-control" style="min-width:200px; resize: none;" ></textarea>';
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
		buttons : [],
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
				let cell = $('#itemCostTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemCostTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	itemCostTable.on('column-reorder', function( e, settings, details ) {
		let api = itemCostTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#itemCostTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 대분류코드 테이블 행 클릭시
	$('#csListTable tbody').on('click','tr', function() {
		if(WMCheck('RESULT')) { // 메뉴정보관리 DTL 수정중이거나 등록중일 경우
			setWM('RESULT', 'idx', idxVal);
			return false;
		}
		
		$('#btnEdit').attr('disabled', false);
		let data = csListTable.row(this).data();
		asNoVal = data.asNo;
		idxVal = data.idx;
		itemCostTable.ajax.reload();
		itemGubunTable.ajax.reload();
		
		$('#companyNmae').val(data.companyNm);
		$('#phoneNumber').val(data.phoneNumber);
		$('#address').val(data.addressAdm);
		$('#receiveChargr').val(data.receiveChargr);
		$('#faultyType').val(data.faultyNm);
		$('#detail').val(data.dtlDesc);
		$('#complete').val(data.processing);
		$('#desc').val(data.resultDesc);
		$('#paidFree').val(data.paidFree);
		$('#processDate').val(moment(data.processDate).format('YYYY-MM-DD'));
		$('#processUser').val(data.processUser);
		$('#materialCost').val(addCommas(data.totalCost));
	});
	
	// 메뉴정보관리 ADM 조회 버튼 click
	$('#btnCsSearch').on('click', function() {
		$('#my-spinner').show();

		csListTable.clear().draw();
		csListTable.ajax.reload(function() {
			csListTable.rowReorder.disable();
		});
		
		$('#csListTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});

		$('#btnCsDel').attr('disabled', false); // 삭제 버튼

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	
	
	
	// 대분류코드 삭제 버튼 클릭시
	$('#btnCsDel').on('click', function() {
		if($('#csListTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 cs등록 정보를 선택해주세요.');
			return false;
		}

		modalGubun = 'receiveM';

		if(csListTable.row('.selected').data().resultGubun == '001'){
			$('#deleteCheckModal').modal('show');
			$('#deleteCheckModal').data('deleteType', 'RESULT');
		}else{
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'RESULT');
		}
	});
	
	//중분류////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 중분류코드 테이블 행 클릭시
	$('#itemGubunTable tbody').on('click','tr', function() {
		let data = itemGubunTable.row(this).data();
		subAsNoVal = data.subAsNo;
		dtlAsNo = data.asNo;
		dtlIdx = data.idx;
		
// 		if(WMCheck('RESULT')) { //소분류코드 등록/수정중일 시
// 			setWM('RESULT', 'idx', idx);
// 			return false;
// 		}

// 		itemCostTable.ajax.reload(function() {});
		$('#btnNew').attr('disabled', false); //  신규 버튼
		$('#btnSave').attr('disabled', true); //  저장 버튼
		$('#btnEdit').attr('disabled', false); //  수정 버튼
		$('#btnDel').attr('disabled', false); //  삭제 버튼
		$('#btnSmallCancel').attr('disabled', true); //  취소 버튼

		$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});
	
	
	
	
	//소분류////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// 소분류코드 테이블 행 클릭시
	$('#itemCostTable tbody').on('click','tr', function() {
		$('#btnDel').attr('disabled', false);
	});
	
	// 소분류코드 등록 버튼 클릭시
	$('#btnNew').on('click', function() {
		if(csListTable.row('.selected').data() == undefined) {
			toastr.warning('cs건을 선택해주세요.');
			return false;
		}
		$('#itemGubunModal').modal('show');
		setTimeout(function(){
			itemGubunModalTable.ajax.reload();
		},150);
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnSmallCancel').attr('disabled', false); // 취소 버튼
		
// 		$('#materialCost').attr('disabled', false);
	});
	
	$('#btnItemGubunPaste').on('click', function() {
		$('#my-spinner').show();

		for(var i=0; i<$('#itemGubunModalTable').DataTable().$('tr.selected').length; i++){
			
	 		let data = $('#itemGubunModalTable').DataTable().row($('#itemGubunModalTable').DataTable().$('tr.selected')[i]).data();

	 		let col_filter_text = [];
	 		$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
	 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
	 			col_filter_text.push($(item).find('input').val());
	 		});

	 		itemCostTable.row.add({
	 			'itemCd'		:	data.itemCd,
	 			'itemNm'		:	data.itemNm,
	 			'itemDc'		:	data.itemDc,
	 			'stockQty'		:	data.safetyStock,
	 			'consumption'	:	'',
	 			'paidFree'		:	'',
	 			'priceCost'		:	'',
	 			'repairCost'	:	'',
	 			'etc'	:	'',
	 			'travelExpense'	:	'',
	 			'totalCost'		:	'',
	 			'complete'	:	'',
	 			'desc'	:	'',
	 		}).draw(false);

	 		itemCostTable.colReorder.disable();
		}

		WM_action_ON('RESULT', 'workingWarningModal');
		$('#complete').attr('disabled', false);
		$('#desc').attr('disabled', false);
		$('#paidFree').attr('disabled', false);
		$('#processDate').attr('disabled', false);
		$('#processUser').attr('disabled', false);
		$('#repairCost').attr('disabled', false);
		$('#etc').attr('disabled', false);
		$('#travelExpense').attr('disabled', false);

		setTimeout(function() {
			$('#itemGubunModal').modal('hide');
			$('#my-spinner').hide();
		}, 100)
	});
	
	
	$(document).on('keyup',"input[name=consumption], input[name=priceCost]",function(evt) {  //인원입력시 콤마 추가
		console.log('rorkxdmsCanyon');
		let totalVal = 0;
		$('#itemCostTable tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let consumption = $(td).eq(itemCostTable.column('consumption:name').index()).find('input').val().replace(/,/g, '');
			let priceCost = $(td).eq(itemCostTable.column('priceCost:name').index()).find('input').val().replace(/,/g, '');
			var totalCostData = parseInt(consumption) * parseInt(priceCost);
			if($(td).eq(itemCostTable.column('paidFree:name').index()).find('select').val() == '002'){
				totalCostData = 0;
			}
			totalVal += totalCostData;
			$(td).eq(itemCostTable.column('totalCost:name').index()).find('input').val(addCommas(totalCostData));
		});
		$('#materialCost').val(addCommas(totalVal));
		
    });

	$(document).on('change','select[name=paidFree]',function(){
		let totalVal = 0;
		$('#itemCostTable tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let consumption = $(td).eq(itemCostTable.column('consumption:name').index()).find('input').val().replace(/,/g, '');
			let priceCost = $(td).eq(itemCostTable.column('priceCost:name').index()).find('input').val().replace(/,/g, '');
			var totalCostData = parseInt(consumption) * parseInt(priceCost);
			if($(td).eq(itemCostTable.column('paidFree:name').index()).find('select').val() == '002'){
				totalCostData = 0;
			}
			totalVal += totalCostData;
			$(td).eq(itemCostTable.column('totalCost:name').index()).find('input').val(addCommas(totalCostData));
		});
		$('#materialCost').val(addCommas(totalVal));
	});

	
	// 소분류코드 수정 버튼 클릭시
	$('#btnEdit').on('click', function() {
		if(csListTable.row('.selected').data() == undefined) {
			toastr.warning('cs건을 선택해주세요.');
			return false;
		}
		WM_action_ON('RESULT', 'workingWarningModal');
		$('select[name=paidFree]').attr('disabled',false)
		
		$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});

		$('#itemCostTable tbody').find('tr').each(function(index_tr, tr) {
			let dtlQty = 0;
			let priceVal = 0;
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == itemCostTable.column('consumption:name').index()) {
						let value = addCommas(parseInt($(td).text()));
						$(td).html('<input type="text" class="form-control text-end" name="consumption" onkeyup="numberFormat(this,\'int\')" value="'+value+'">');
						
					} else if(index_td == itemCostTable.column('priceCost:name').index()) {
						let value = addCommas(parseInt($(td).text()));
						$(td).html('<input type="text" class="form-control text-end" name="priceCost" onkeyup="numberFormat(this,\'int\')" value="'+value+'">');
						
					} else if(index_td == itemCostTable.column('repairCost:name').index()) {
						let value = addCommas(parseInt($(td).text()));
						$(td).html('<input type="text" class="form-control text-end" name="repairCost" onkeyup="numberFormat(this,\'int\')" value="'+value+'">');
						
					} else if(index_td == itemCostTable.column('etcCost:name').index()) {
						let value = addCommas(parseInt($(td).text()));
						$(td).html('<input type="text" class="form-control text-end" name="etcCost" onkeyup="numberFormat(this,\'int\')" value="'+value+'">');
						
					} else if(index_td == itemCostTable.column('travelExpense:name').index()) {
						let value = addCommas(parseInt($(td).text()));
						$(td).html('<input type="text" class="form-control text-end" name="travelExpense:name" onkeyup="numberFormat(this,\'int\')" value="'+value+'">');
						
					} else if(index_td == itemCostTable.column('processing:name').index()) {
						let value = $(td).text();
						$(td).html('<textarea class="form-control" style="min-width:200px; resize: none;">'+value+'</textarea>');
						
					} else if(index_td == itemCostTable.column('resultDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<textarea class="form-control" style="min-width:200px; resize: none;">'+value+'</textarea>');
					}
				}
			});
		});

		$('#paidFree').attr('disabled', false);
		$('#processDate').attr('disabled', false);
		$('#processUser').attr('disabled', false);

		itemCostTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // DTL 신규 버튼
		$('#btnSave').attr('disabled', false); // DTL 저장 버튼
		$('#btnEdit').attr('disabled', true); // DTL 수정 버튼
		$('#btnDel').attr('disabled', false); // DTL 삭제 버튼
		$('#btnSmallCancel').attr('disabled', false); // DTL 취소 버튼
	});
	
	// 소분류코드 저장 버튼 클릭시
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#itemCostTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = itemCostTable.row($(item)).data().idx;
				let csIdx = csListTable.row('.selected').data().idx;
				let itemCd = $(td).find('div[name=itemCd]').text();
				let itemNm = $(td).find('div[name=itemNm]').text();
				let itemDc = $(td).find('div[name=itemDc]').text();
				let stockQty = $(td).find('div[name=stockQty]').text();;
				let consumption = $(td).eq(itemCostTable.column('consumption:name').index()).find('input').val().replaceAll(/,/g, '');
				let paidFree = $(td).eq(itemCostTable.column('paidFree:name').index()).find('select').val().replaceAll(/,/g, '');
				let priceCost = $(td).eq(itemCostTable.column('priceCost:name').index()).find('input').val().replaceAll(/,/g, '');
				let repairCost = $(td).eq(itemCostTable.column('repairCost:name').index()).find('input').val().replaceAll(/,/g, '');
				let etcCost = $(td).eq(itemCostTable.column('etcCost:name').index()).find('input').val().replaceAll(/,/g, '');
				let travelExpense = $(td).eq(itemCostTable.column('travelExpense:name').index()).find('input').val().replaceAll(/,/g, '');
				let totalCost = $(td).eq(itemCostTable.column('totalCost:name').index()).find('input').val().replaceAll(/,/g, '');
				let processing = $(td).eq(itemCostTable.column('processing:name').index()).find('textArea').val();
				let resultDesc = $(td).eq(itemCostTable.column('resultDesc:name').index()).find('textArea').val();
				
				let obj = new Object();
				obj.asNo = asNoVal;
				obj.subAsNo = subAsNoVal;
				obj.idx = idx!=null?idx:'';
				obj.itemCd = itemCd;
				obj.itemNm = itemNm;
				obj.itemDc = itemDc;
				obj.stockQty = stockQty;
				obj.consumption = consumption;
				obj.paidFree = paidFree;
				obj.priceCost = priceCost;
				obj.repairCost = repairCost;
				obj.etcCost = etcCost;
				obj.travelExpense = travelExpense;
				obj.totalCost = totalCost;
				obj.processing = processing;
				obj.resultDesc = resultDesc;

			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		
// 		if(array.length != _.uniqBy(array, 'smallCd').length) {
// 			toastr.warning('중복되는 소분류코드가 존재합니다.');
// 			return false;
// 		}

		array = _.differenceWith(array, itemCostTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/ts/admCsUpdate"/>',
            type: 'POST',
            data: {
                'asNo'			:	asNoVal,
                'idx'			:	idxVal,
                'resultGubun'	:	'001',
				'paidFree'		:	$('#paidFree').val(),
				'processDate'	:	moment($('#processDate').val()).format('YYYYMMDD'),
				'processUser'	:	$('#processUser').val(),
				'totalCost'		:	$('#materialCost').val().replaceAll(/,/g, ''),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					state = false;
				} else {
					toastr.error(res.message);
					state = false;
				}
				
			}
		});

		if(!state) {
			$('#my-spinner').hide();
			return false;
		}
		
		$.ajax({
			url: '<c:url value="/ts/csResultIU"/>',
            type: 'POST',
            data: {
                'arrayData'	:	JSON.stringify(array)
            },
            beforeSend: function() {
//             	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');

					WM_action_OFF('RESULT');

					itemCostTable.clear().draw();
					itemCostTable.ajax.reload(function() {
						$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					itemCostTable.colReorder.enable();
					
					csListTable.ajax.reload(function(){});

					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnSmallCancel').attr('disabled', true); // 취소 버튼

					$('#complete').attr('disabled', true);
					$('#desc').attr('disabled', true);
					$('#paidFree').attr('disabled', true);
					$('#processDate').attr('disabled', true);
					$('#processUser').attr('disabled', true);
					$('#repairCost').attr('disabled', true);
					$('#etc').attr('disabled', true);
					$('#travelExpense').attr('disabled', true);
// 					$('#materialCost').attr('disabled', true);
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
	$('#btnDel').on('click', function() {
		if($('#itemCostTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 소분류코드 항목을 선택해주세요.');
			return false;
		}

		let data = itemCostTable.row('.selected').data();
		modalGubun = 'resultM';
		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType', 'RESULT');
		} else {
			itemCostTable.row('.selected').remove().draw();
		}
	});
	
	// 소분류코드 취소 버튼 클릭시
	$('#btnSmallCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'RESULT');
	});

	$('#itemGubunModalTable thead tr').clone(true).addClass('filters').appendTo('#itemGubunModalTable thead'); // filter 생성
    let itemGubunModalTable = $('#itemGubunModalTable').DataTable({
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
	    scrollY: '60vh',
	    scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
	        style: 'single',
	        toggleable: false,
	        items: 'row',
	        info: false
	    },
        ajax: {
            url: '<c:url value="/bm/itemInfoAdmLst"/>',
            type: 'GET',
            data: {
                individualYn	:	'A',
                itemGubunIdx : function(){return gubunIdx;}
            },
        },
        rowId: 'itemCd',
        columns: [
            { data: 'itemCd', 'className' : 'text-center align-middle' },            
            { data: 'itemNm', 'className' : 'text-center align-middle' },
            { data: 'itemDc', 'className' : 'text-center align-middle' },
            { data: 'safetyStock', 'className' : 'text-center align-middle' },
        ],
        columnDefs: [
        	{ targets: "all", className : 'text-center' },
        ],
        order: [
//             [ 0, 'asc' ]
        ],
        buttons: [
        	'copy',
            {
                extend: 'excel',
                title: '품목관리'
            }, 
            'print'
        ],
        drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemGubunModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemGubunModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemGubunModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });

//     $("#btnSearchUserNm").on("click",function(){
// 		$('#userModal').modal('show');
// 		setTimeout(function() {
// 			userModalTable.ajax.reload(function() {});
// 		}, 200);
// 	});

// 	// 사용자정보 목록조회
// 	$('#userModalTable thead tr').clone(true).addClass('filters').appendTo('#userModalTable thead'); // filter 생성
// 	let userModalTable = $('#userModalTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
// 		language: lang_kor,
// 		info: true,
// 		ordering: true,
// 		processing: true,
// 		paging: false,
// 		lengthChange: false,
// 		searching: true,
// 		autoWidth: false,
// 		orderCellsTop: true,
//         fixedHeader: false,
//         scrollY: '100vh',
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
// 			url : '<c:url value="/sm/userLst"/>',
// 			type : 'POST',
// 			data : {
// 				userStateCd: function() { return $('#SearchUserStateCd').val(); }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'userId', className : 'text-center'},
// 			{ data: 'userName', className : 'text-center'},
// 			{ data: 'userDepartmentNm', className : 'text-center'},
// 			{ data: 'userPositionNm', className : 'text-center'},
// 			{ data: 'userJobNm', className : 'text-center'},
// 		],
// 		columnDefs : [
// 		],
// 		buttons : [
// 			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 				exportOptions: {
// 	                modifier: {
// 	                   selected:null
// 	                },	                
// 	            },
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	},
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#userModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 197)+'px');
			
// 			$('#'+table_id+'_filter').addClass('d-none');
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#userModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	userModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = userModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#userModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

// 	// 사용자목록 적용 버튼 click
// 	$('#btnUserModalPaste').on('click', function(){
// 		if( !$('#userModalTable tbody tr').hasClass('selected') ){
// 			toastr.warning('적용할 행을 선택해주세요.');
// 			return false;
// 		}
		
// 		let data = userModalTable.row('.selected').data();
// 		$('#receiveChargrSrh').val(data.userName);
// 		$('#userModal').modal('hide');
// 	});
</script>

</body>
</html>