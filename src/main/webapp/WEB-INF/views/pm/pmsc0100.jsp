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
																		  grid-template-columns: 3fr 4px 7fr;">
																		  
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">구매요청일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="orderNoStartDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="orderNoEndDate">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnOrderNoSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmOrderNoTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">구매요청번호</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">요청자</th>
							<th class="text-center align-middle">요청구분</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-2 monthAdjust" id="monthAdjust">
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주상태</label>
					<select class="form-select w-auto h-100 me-2" id="searchStatus" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="001" selected>미발주</option>
						<option value="002">발주완료</option>
					</select>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">요청구분</label>
					<select class="form-select w-auto h-100 me-2" id="searchRequestGubun" style="min-width: 70px;">
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출력여부</label>
					<select class="form-select w-auto h-100 me-2" id="searchPrintYn" style="min-width: 70px;">
						<option value="" selected>전체</option>
						<option value="001">미출력</option>
						<option value="002">출력</option>
					</select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">발주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-2" id="batchDeliveryOrderDate">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">납기가능일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-2" id="batchDeliveryPossibleDate">
					<!-- 
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">프로젝트</label>
					<input type="text" class="form-control w-auto h-100 me-1" id="batchProjectCd">
					 -->
					<!-- 
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					 -->
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnBatchApply">
								적용
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="leftHeader1" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">거래처명</label>
					<div class="input-group w-auto h-100 me-2">
						<input type="text" class="form-control" id="selDealCorpNm" disabled>
						<input type="hidden" id="selDealCorpIdx">
						<button type="button" id="btnDelDealCorp" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;" title="취소">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchDealCorp">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnBatchDealCorpApply">
								적용
							</button>
						</div>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group me-1" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" id="btnComplete">발주종료</button>
				</div>
				<div class="btn-group me-1" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" id="btnConfirmY">발주확정</button>
					<button type="button" class="btn btn-outline-danger w-auto" id="btnConfirmN">확정취소</button>
				</div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">요청일</th>
							<th class="text-center align-middle">요청부서</th>
							<th class="text-center align-middle">요청담당</th>
							<th class="text-center align-middle">구매사유</th>
							<th class="text-center align-middle">BOM</th>
							<th class="text-center align-middle">차수</th>
							<th class="text-center align-middle">이미지</th>
							<th class="text-center align-middle">문서</th>
							<th class="text-center align-middle">요청사항</th>
							<th class="text-center align-middle">거래처명</th>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">품목구분1</th>
							<th class="text-center align-middle">품목구분2</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">요청수량</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">공급가액</th>
							<th class="text-center align-middle">부가세</th>
							<th class="text-center align-middle">합계</th>
							<th class="text-center align-middle">기발주수량</th>
							<th class="text-center align-middle">납기요청일</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">구매요청번호</th>
							<th class="text-center align-middle">순번</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">순번</th>
							<th class="text-center align-middle">납기가능일</th>
							<th class="text-center align-middle">발주일</th>
							<th class="text-center align-middle">입고예정일</th>
							<th class="text-center align-middle">입고일</th>
							<th class="text-center align-middle">입고수량</th>
							<th class="text-center align-middle">입고창고</th>
							<th class="text-center align-middle">출력여부</th>
							<th class="text-center align-middle">종료여부</th>
							<th class="text-center align-middle">확정여부</th>
							<th class="text-center align-middle">상신여부</th>
							<th class="text-center align-middle">ERP NO</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 수주 모달 -->
<div class="modal fade" id="bizOrderAdmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					수주 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주등록일</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품목유형명</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
						</tr>
					</thead>
				</table>
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
				<div class="row" style="padding-bottom: 5px;">
					<!-- 
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래상태</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealCorpStatus" style="min-width: 70px;"></select>
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">거래구분</label>
						<select class="form-select w-auto h-100 me-3" id="modalDealGubun" style="min-width: 70px;"></select>
					</div>
					 -->
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnitemInfoAdmModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
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
							<th class="text-center align-middle">거래처명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 종료사유 모달 -->
<div class="modal fade" id="completeYnModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					발주종료 사유 등록
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCompleteYnSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex"></div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end"></div>
				</div>
				<table class="table table-bordered p-0 m-0" id="completeYnModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">요청번호</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">미발주수량</th>
							<th class="text-center align-middle">종료사유</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 이미지 업로드 모달 -->
<div class="modal fade" id="projectImageViewModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					이미지 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="projectImageViewTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">이미지</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- 문서 업로드 모달 -->
<div class="modal fade" id="projectDocumentViewModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					기술문서 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="projectDocumentViewTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">문서명</th>
							<th class="text-center align-middle">파일명</th>
							<th class="text-center align-middle">작성자</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">비고</th>
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
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	let requestGubunList = getCommonCode('시스템', '048'); // 요청구분
	let buyReasonList = getCommonCode('시스템', '049'); // 구매사유
	
	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	selectBoxAppend(dealGubunList, 'modalDealGubun1', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus1', '', '1'); //거래상태

	$('#orderNoStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#orderNoEndDate').val(moment().format('YYYY-MM-DD'));
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));

	$('#batchDeliveryOrderDate').val(moment().format('YYYY-MM-DD'));
	$('#batchDeliveryPossibleDate').val(moment().format('YYYY-MM-DD'));

	let groupOrderNo = '';
	let groupProjectCd = '';

	let projectIdx = '';
	let projectDtlIdx = '';
	let groupIdx = '';
	let dtlNoArray = [];
	
	// 요청번호별 목록조회
	$('#purchaseOrderAdmOrderNoTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmOrderNoTable thead'); // filter 생성
	let purchaseOrderAdmOrderNoTable = $('#purchaseOrderAdmOrderNoTable').DataTable({
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
			url : '<c:url value="/pm/purchaseOrderAdmOrderNoLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return moment($('#orderNoStartDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate		: function() { return moment($('#orderNoEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ data: 'orderNo', className : 'text-center align-middle', //요청번호
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data.substring(2)+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data!=null){
							return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="projectCd" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'orderUserIdx', className : 'text-center align-middle', name: 'orderUserIdx', //요청담당
				render: function(data, type, row, meta) {
					if(data!=null) {
						let html = '';
						html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserIdx" class="d-none">'+data+'</div>';
						html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserName">'+row['orderUserName']+'</div>';
						return html;
					} else {
						return '';
					}
				}
			},
			{ data: 'requestGubun', className : 'text-center align-middle', name: 'requestGubun', //요청담당
				render: function(data, type, row, meta) {
					if(data!=null) {
						var requestGubun = '';
						requestGubunList.forEach(function(item){
						    if(item.commonCd == data){
						    	requestGubun = item.commonNm;
						    }
						});
						return '<div style="min-width:100px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+requestGubun+'</div>';
					} else {
						return '';
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
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmOrderNoTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#purchaseOrderAdmOrderNoTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#purchaseOrderAdmOrderNoTable_filter').addClass('d-none');
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
					let selectData = purchaseOrderAdmOrderNoTable.row(item).data();
					if( purchaseOrderAdmOrderNoTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(purchaseOrderAdmOrderNoTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(purchaseOrderAdmOrderNoTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#purchaseOrderAdmOrderNoTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmOrderNoTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	purchaseOrderAdmOrderNoTable.on('column-reorder', function( e, settings, details ) {
		let api = purchaseOrderAdmOrderNoTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseOrderAdmOrderNoTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	

	// 조회 버튼 click
	$('#btnOrderNoSearch').on('click', function() {
		$('#my-spinner').show();
		purchaseOrderAdmOrderNoTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 요청번호별 선택
	$('#purchaseOrderAdmOrderNoTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmOrderNoTable.row(this).data();
		groupOrderNo = data.orderNo;
		groupProjectCd = data.projectCd;

// 		$('#btnComplete').attr('disabled', true); 
// 		$('#btnConfirmY').attr('disabled', true); 
// 		$('#btnConfirmN').attr('disabled', true); 
		
// 		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
 		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false); // 검색 필터 disabled
		});

		purchaseOrderAdmTable.colReorder.enable();
		purchaseOrderAdmTable.ajax.reload();
	});

	//일자 따라가기
	$('#orderNoStartDate').on('change', function(){
		var date = $(this).val();

		$('#startDate').val(date);
	});

	//일자 따라가기
	$('#orderNoEndDate').on('change', function(){
		var date = $(this).val();

		$('#endDate').val(date);
	});
	
	// 수주관리 전체 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		orderMulti: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: true,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '77vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'os',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/pm/purchaseOrderAdmInsertLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate		: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				requestGubun: function() { return $('#searchRequestGubun').val();},
				status		: function() { return $('#searchStatus').val();},
				orderNo		: function() { return groupOrderNo;},
				projectCd	: function() { return groupProjectCd;},
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle', name : "admCheckBox", //체크박스
				render: function(data, type, row, meta) {
					if(row['orderNo']!=null) {
						if(row['printYn'] == 'Y'){
							return '';
						} else {
							return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
						}
					} else {
						return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
					}
				}
			},
			{ data: 'status', className : 'text-center align-middle', //상태
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data=='001') {
							return '<span style="font-size: 11px; font-weight: bold; color:#ff0000">요청</span>';
						} else if(data=='002') {
							if(row['confirmYn'] =='Y'){
								return '<span style="font-size: 11px; font-weight: bold; color:#0044ff;">발주<br>확정</span>';
							} else return '<span style="font-size: 11px; font-weight: bold;">발주대기</span>';
						} else if(data =='003') {
							return '입고';
						}
					} else {
						return '요청';
					}
				}
			},
			{ data: 'requestDate', className : 'text-center align-middle', name: 'requestDate',//요청일
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="requestDate">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
// 						let html = '';
// 						html += '<input type="date" name="requestDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
// 						html += '<span class="d-none">'+data+'</span>';
						return '';
					}
				}
			},
			{ data: 'orderUserDepartment', className : 'text-center align-middle', //요청부서
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="orderUserDepartment">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderUserIdx', className : 'text-center align-middle', name: 'orderUserIdx', //요청담당
				render: function(data, type, row, meta) {
					if(data!=null) {
						let html = '';
						html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserIdx" class="d-none">'+data+'</div>';
						html += '<div style="min-width:150px;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderUserName">'+row['orderUserName']+'</div>';
						return html;
					} else {
						let html = '';
// 						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
// 						html += '<input type="hidden" name="orderUserIdx" value="'+userIdx+'">';
// 						html += '<input type="text" class="form-control inputGroup" name="orderUserName" value="'+userName+'" disabled>';
// 						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="userSel()" name="btnUserSel" style="padding: 1px 4px; margin-left: 0px;">';
// 						html += '<i class="fa-solid fa-magnifying-glass"></i>';
// 						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'buyReason', className : 'text-center align-middle', name: 'buyReason', //구매사유
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data != null && data != ''){
							var buyReasonNm = '';
							buyReasonList.forEach(function(item) {
								if(data == item.commonCd){
									buyReasonNm = item.commonNm;
								}
							});
							return buyReasonNm;
						} else return '';
					} else {
						let html = '';
						html += '<select class="form-select">';
						if(data==null || data == '') {
							buyReasonList.forEach(function(item) {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});
						}
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			}, 
			{ data: 'bomGubun', className : 'text-center align-middle', name: 'bomGubun', //BOM 설계 구분
				render: function(data, type, row, meta) {
					if(data!=null) {
						if(data == '001'){
							return '기구';
						} else if(data == '002'){
							return '광학';
						} else if(data == '003'){
							return '전장';
						}
					} else {
						return '';
					}
				}
			},
			{ data: 'version', className : 'text-center align-middle', name: 'version', //차수
				render: function(data, type, row, meta) {
					if(data!=null) {
						return data;
					} else {
						return '';
					}
				}
			},
			{ data: 'imageCount', className : 'text-center align-middle', //이미지 수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data>0) {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="imageModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">X</button>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'documentCount', className : 'text-center align-middle', //문서 수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						if(data>0) {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">O</button>';
						} else {
							return '<button type="button" class="btn btn-outline-light w-auto" onclick="documentModal('+row['projectIdx']+', '+row['projectDtlIdx']+')">X</button>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'orderRemark', className : 'text-center align-middle', name: 'orderRemark', //비고
				render : function(data, type, row, meta) {
					if(data!=null && data!='') {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="orderRemarkModal('+row['projectIdx']+', '+row['projectDtlIdx']+', '+row['groupIdx']+')">O</button>';
					} else {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="orderRemarkModal('+row['projectIdx']+', '+row['projectDtlIdx']+', '+row['groupIdx']+')">X</button>';
					}
					
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle', name: 'dealCorpNm', //거래처명
				render: function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							var html = '<div class="d-none" style="white-space:nowrap;" name="dealCorpIdx">'+row['dealCorpIdx']+'</div>';
							html += '<div style="white-space:nowrap;" name="dealCorpNm">'+data+'</div>';
							return html;
						} else return '';
					} else {
						let html = '';
						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="dealCorpIdx">';
						html += '<input type="text" class="form-control inputGroup" name="dealCorpNm" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="dealCorpAdmSel()" name="btnDealCorpAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'itemGubunNm', className : 'text-center align-middle', name: 'itemGubunNm', //품목구분1
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx">'+row['itemGubunIdx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm"></div>';
						return html;
					}
				}
			}, 
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx">'+row['itemGubun1Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm"></div>';
						return html;
					}
				}
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx">'+row['itemGubun2Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm"></div>';
						return html;
					}
				}
			},
			{ data: 'itemCd', className : 'text-center align-middle', name: 'itemCd', //품번
				render: function(data, type, row, meta) {
					if(data!=null) {
						if(row['orderNo'] != null && row['orderNo'] != ''){
							return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else {
							let html = '';
							html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="text" class="form-control inputGroup" name="itemCd" value="'+data+'" disabled>';
							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel(\'input\')" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							return html;
						}
					} else {
						let html = '';
						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="itemCd" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel(\'input\')" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle', //품명
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="itemNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="itemNm"></div>';
					}
				}
			},
			{ data: 'itemDc', className : 'text-center align-middle', //규격
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="itemDc">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="itemDc"></div>';
					}
				}
			},
			{ data: 'unitDc', className : 'text-center align-middle', //단위
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="unitDc">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="unitDc"></div>';
					}
				}
			},
			{ data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null) {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="price">'+addCommas(parseInt(data))+'</div>';
						} else {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';							
						}
					} else {
						if(data!=null) {
							return '<input type="text"   onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="price" class="form-control text-end" value="'+addCommas(parseInt(data))+'"><span class="d-none"></span>';	
						} else return '<input type="text"   onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="price" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			},
			{ data: 'orderQty', className : 'text-end align-middle', name: 'orderQty', //요청수량
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
						} else return '';
					} else {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="orderQty" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			},
			{ data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
						} else return '';							
					} else {
						return '<input type="text"   onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="orderDtlQty" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			},
			{ data: 'supplyAmt', className : 'text-end align-middle', name: 'supplyAmt', //공급가액
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
						} else return '';
					} else {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="supplyAmt" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			},
			{ data: 'vat', className : 'text-end align-middle', name: 'vat', //부가세
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
						} else return '';
					} else {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="vat" class="form-control text-end"><span class="d-none"></span>';						
					}
				}
			},
			{
				className : 'text-end align-middle',
				render : function(data, type, row, meta) { //합계
					var totalAmt = 0;
					totalAmt = parseFloat(row['supplyAmt']) + parseFloat(row['vat']);
					return '<div name="totalAmt" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(totalAmt))+'</div>';							
				}
			},
			{ data: 'alreadyOrderDtlQty', className : 'text-end align-middle', name: 'alreadyOrderDtlQty', //기발주수량
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data!=null){
							return '<div style="white-space: min-width:100px; nowrap; text-overflow: ellipsis; overflow: hidden;" name="alreadyOrderDtlQty">'+addCommas(parseInt(data))+'</div>';
						} else return '';
					} else {
						return '<div style="white-space:nowrap;" name="alreadyOrderDtlQty">0</div>';				
					}
				}
			},
			{ data: 'orderDate', className : 'text-center align-middle', name: 'orderDate',//납기요청일
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						let html = '';
						html += '<input type="date" name="orderDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						if(data!=null){
							return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="projectCd" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'orderNo', className : 'text-center align-middle', //요청번호
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data.substring(2, 12)+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderNo', className : 'text-center align-middle', //요청번호 시퀀스
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+parseInt(data.split('-')[2])+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle', name: 'orderDtlNo',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; min-width:100px; text-overflow: ellipsis; overflow: hidden;">'+data.substring(2, 12)+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null && data!='') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" name="orderDtlSeq">'+parseInt(data.split('-')[2])+'</div>';
					} else {
						return '';
					}
				}
			},
// 			{ data: 'orderDtlNo', className : 'text-center align-middle',
// 				render: function(data, type, row, meta) {
// 					if(data!=null) {
// 						let orderDtlSeq = data.split('-');
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+orderDtlSeq[1]+'</div>';
// 						//return orderDtlSeq[1];
// 					} else {
// 						return '';
// 					}
// 				}
// 			},
			{ data: 'deliveryPossibleDate', className : 'text-center align-middle', name: 'deliveryPossibleDate', //납기가능일
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data != '' && data != null){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<input type="date" name="deliveryPossibleDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'deliveryOrderDate', className : 'text-center align-middle', name: 'deliveryOrderDate', //발주일
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data != '' && data != null){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<input type="date" name="deliveryOrderDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'preInDate', className : 'text-center align-middle', name: 'preInDate', //입고예정일
				render : function(data, type, row, meta) {
					if(row['orderNo'] != null && row['orderNo'] != ''){
						if(data != '' && data != null){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
						} else return '';
					} else {
						let html = '';
						html += '<input type="date" name="preInDate"max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						html += '<span class="d-none">'+data+'</span>';
						return html;
					}
				}
			},
			{ data: 'inDate', className : 'text-end align-middle',//입고일
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else return '';
				}
			},
			{ data: 'inQty', className : 'text-end align-middle', //입고수량
				render : function(data, type, row, meta) {
					if(data != '' && data != null){
						return addCommas(parseInt(data));
					} else {
						return '';						
					}
				}
			},
			{ data: 'inWhsNm', className : 'text-end align-middle',//입고창고
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return data;
					} else return '';
				}
			},
			{ data: 'printYn', className : 'text-end align-middle', name: 'printYn', //출력여부
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="min-width:50px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<span class="d-none"></span>';				
					}
				}
			},
			{ data: 'completeYn', className : 'text-center align-middle', //종료여부
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						if(data == 'Y'){
							return '<div style="white-space:nowrap;">종료</div>';
						} else return '<div style="white-space:nowrap;"></div>';
					} else {
						return '<div style="white-space:nowrap;"></div>';
					}
				}
			},
			{ data: 'confirmYn', className : 'text-center align-middle', //확정여부
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						if(data == 'Y'){
							return '<div style="white-space:nowrap;">확정</div>';
						} else return '<div style="white-space:nowrap;">미확정</div>';
					} else {
						return '<div style="white-space:nowrap;">미확정</div>';
					}
				}
			},
			{ data: 'upvoteYn', className : 'text-center align-middle', //상신여부
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						if(data == 'Y'){
							return '<div style="white-space:nowrap;">상신</div>';
						} else return '<div style="white-space:nowrap;">미상신</div>';
					} else {
						return '<div style="white-space:nowrap;">미상신</div>';
					}
				}
			},
			{ //ERP NO
				render : function(data, type, row, meta) {
					return '';
				}
			},
			{ data: 'orderDtlDesc', className : 'text-end align-middle', name: 'orderDtlDesc', //비고
				render : function(data, type, row, meta) {
					if(row['orderNo'] != '' && row['orderNo'] != null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					} else {
						return '<input style="min-width:200px; type="text" class="form-control"><span class="d-none"></span>';				
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
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#purchaseOrderAdmTable_filter').addClass('d-none');
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
					let selectData = purchaseOrderAdmTable.row(item).data();
					if( purchaseOrderAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(purchaseOrderAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(purchaseOrderAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#purchaseOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
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
		purchaseOrderAdmTable.ajax.reload(function() {}, false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주목록 선택
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();
		let idx = data.idx;
		/* if(WMCheck('ADM')) {
			setWM('ADM', 'idx', idx);
			return false;
		} */

		/* purchaseOrderAdmTable.clear().draw();
		purchaseOrderAdmTable.ajax.reload(); */
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
// 		$('#btnSave').attr('disabled', true); // 저장 버튼
// 		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});

	// 공통코드관리 ADM 신규 버튼 click
	$('#btnNew').on('click', function() {
		WM_action_ON('ADM','workingWarningModal');

		$('#itemInfoAdmModal1').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
		
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






	// 수주별발주 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			if($(item).find('td').find('input').length >= 1) {
				if(purchaseOrderAdmTable.row($(item)).data().alreadyOrderDtlQty == purchaseOrderAdmTable.row($(item)).data().orderQty){
					toastr.warning('미발주 수량이 없습니다.');
					state = false;
					return false;
				}
				
				//구매요청
				let orderNo = purchaseOrderAdmTable.row($(item)).data().orderNo;
				let status = purchaseOrderAdmTable.row($(item)).data().status;
				let requestDate = $(td).find('div[name=requestDate]').text();
				let projectCd = $(td).eq(purchaseOrderAdmTable.column('projectCd:name').index()).find('input').val();
				let itemGubunIdx = $(td).find('div[name=itemGubunIdx]').text();
				let itemGubun1Idx = $(td).find('div[name=itemGubun1Idx]').text();
				let itemGubun2Idx = $(td).find('div[name=itemGubun2Idx]').text();
				let orderUserIdx = $(td).find('div[name=orderUserIdx]').text();
//  			let maker = $(td).eq(purchaseOrderAdmTable.column('orderMaker:name').index()).find('input').val();
				let itemCd = $(td).eq(purchaseOrderAdmTable.column('itemCd:name').index()).find('input').val();
				let orderQty = $(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').val();
				let orderDate = $(td).eq(purchaseOrderAdmTable.column('orderDate:name').index()).find('input').val();
				if(itemCd == '') {
					toastr.warning('자재를 선택해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('itemCd:name').index()).find('button').focus();
					state = false;
					return false;
				}

				if(orderQty == '') {
					toastr.warning('요청수량을 입력해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('orderQty:name').index()).find('input').focus();
					state = false;
					return false;
				}

				if(projectCd == '') {
					toastr.warning('프로젝트 코드를 선택해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('projectCd:name').index()).find('button').focus();
					state = false;
					return false;
				}

				//발주등록
				let orderDtlNo = purchaseOrderAdmTable.row($(item)).data().orderDtlNo;
				let price = $(td).eq(purchaseOrderAdmTable.column('price:name').index()).find('input').val();
				let supplyAmt = $(td).eq(purchaseOrderAdmTable.column('supplyAmt:name').index()).find('input').val();
				let vat = $(td).eq(purchaseOrderAdmTable.column('vat:name').index()).find('input').val();
				let orderDtlQty = $(td).eq(purchaseOrderAdmTable.column('orderDtlQty:name').index()).find('input').val();
				let deliveryPossibleDate = $(td).eq(purchaseOrderAdmTable.column('deliveryPossibleDate:name').index()).find('input').val();
				let preInDate = $(td).eq(purchaseOrderAdmTable.column('preInDate:name').index()).find('input').val();
				let deliveryOrderDate = $(td).eq(purchaseOrderAdmTable.column('deliveryOrderDate:name').index()).find('input').val();
				let dealCorpIdx = $(td).find('input[name=dealCorpIdx]').val();
				let alreadyOrderDtlQty = $(td).find('div[name=alreadyOrderDtlQty]').text();
				let orderDtlDesc = $(td).eq(purchaseOrderAdmTable.column('orderDtlDesc:name').index()).find('input').val();
// 				if(price == '') {
// 					toastr.warning('단가를 입력해주세요.');
// 					$(td).eq(purchaseOrderAdmTable.column('price:name').index()).find('input').focus();
// 					state = false;
// 					return false;
// 				}

				if(orderDtlQty == '') {
					toastr.warning('발주수량을 입력해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('orderDtlQty:name').index()).find('input').focus();
					state = false;
					return false;
				}

				if(dealCorpIdx == '' || dealCorpIdx == 0) {
					toastr.warning('거래처를 선택해주세요.');
					$(td).eq(purchaseOrderAdmTable.column('dealCorpIdx:name').index()).find('button').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.orderNo = orderNo;
				obj.status = status;
				obj.requestDate = requestDate.replace(/-/g,"");
				obj.projectCd = projectCd;
				obj.itemGubunIdx = itemGubunIdx;
				obj.itemGubun1Idx = itemGubun1Idx;
				obj.itemGubun2Idx = itemGubun2Idx;
				obj.orderUserIdx = orderUserIdx;
				obj.maker = '';
				obj.buyReason = '';
				obj.itemCd = itemCd;
				obj.orderQty = orderQty.replaceAll(/,/g,'');
				obj.orderDate = orderDate.replace(/-/g,"");

				obj.orderDtlNo = orderDtlNo;
				obj.price = price.replaceAll(/,/g,'');
				obj.supplyAmt = supplyAmt.replaceAll(/,/g,'');
				obj.vat = vat.replaceAll(/,/g,'');
				obj.orderDtlQty = orderDtlQty.replaceAll(/,/g,'');
				obj.deliveryPossibleDate = deliveryPossibleDate.replace(/-/g,"");
				obj.preInDate = preInDate.replace(/-/g,"");
				obj.deliveryOrderDate = deliveryOrderDate.replace(/-/g,"");
				obj.alreadyOrderDtlQty = alreadyOrderDtlQty.replaceAll(/,/g,'');
				obj.dealCorpIdx = dealCorpIdx;
				obj.orderDtlDesc = orderDtlDesc;
				
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		console.log(array);
		
		array.sort(function(a, b) {
		  return a.dealCorpIdx - b.dealCorpIdx;
		});
		console.log(array);
		
		$.ajax({
			url: '<c:url value="/pm/purchaseOrderDtlIU"/>',
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
					purchaseOrderAdmTable.ajax.reload(function() {
						$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					purchaseOrderAdmTable.colReorder.enable();
					$('#btnNew').attr('disabled', false); // 신규 버튼
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

	// 수주별발주 수정 버튼 click
	$('#btnEdit').on('click', function() {
		dtlNoArray = [];
		let state = true;
		if($('[name=admCheckBox]:checked').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		
		WM_action_ON('ADM','workingWarningModal');
		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});

// 		for(var i=0; i<$('#purchaseOrderAdmTable').DataTable().data().length; i++){
// 			let data = $('#purchaseOrderAdmTable').DataTable().row(i).data();
// 			if($('#purchaseOrderAdmTable').DataTable().row(i).data().status != '001'){
// 				let obj = new Object();

// 				obj.dealCorpIdx = data.dealCorpIdx;
// 				obj.orderDtlNo = data.orderDtlNo;

// 				dtlNoArray.push(obj);
// 			}
// 		}
// 		let obj1 = new Object();

// 		obj1.dealCorpIdx = '';
// 		obj1.orderDtlNo = '신규';

// 		dtlNoArray.push(obj1);
		
// 		dtlNoArray.sort(function(a, b) {
// 		  return a.orderDtlNo - b.orderDtlNo;
// 		});
		
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).find('[name=admCheckBox]').is(':checked')){
				if(purchaseOrderAdmTable.row($(tr)).data().confirmYn == 'Y'){
					state = false;
					$(tr).find('[name=admCheckBox]').prop('checked', false);
				} else {
					let dtlQty = 0;
					let priceVal = 0;
					$(tr).find('td').each(function(index_td, td) {
						if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
//	 						if(index_td == purchaseOrderAdmTable.column('orderUserIdx:name').index()) {
//	 							let value = purchaseOrderAdmTable.row(tr).data().orderUserIdx;
//	 							let value2 = purchaseOrderAdmTable.row(tr).data().orderUserName;
//	 							let html = '';
//	 							html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
//	 							html += '<input type="hidden" name="orderUserIdx" value="'+value+'">';
//	 							html += '<input type="text" class="form-control inputGroup" name="orderUserName" value="'+value2+'" disabled>';
//	 							html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="userSel()" name="btnUserSel" style="padding: 1px 4px; margin-left: 0px;">';
//	 							html += '<i class="fa-solid fa-magnifying-glass"></i>';
//	 							html += '</button></div>';
//	 							$(td).html(html);
//							} else 
							if(index_td == purchaseOrderAdmTable.column('itemCd:name').index()) {
								let value = purchaseOrderAdmTable.row(tr).data().itemCd;
								let html = '';
								html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
								html += '<input type="text" class="form-control inputGroup" name="itemCd" value="'+value+'" disabled>';
								html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="itemInfoAdmSel(\'input\')" name="btnItemInfoAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
								html += '<i class="fa-solid fa-magnifying-glass"></i>';
								html += '</button></div>';
								$(td).html(html);
							} else if(index_td == purchaseOrderAdmTable.column('projectCd:name').index()) {
								let value = purchaseOrderAdmTable.row(tr).data().projectCd;
								let html = '';
								html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
								html += '<input type="text" class="form-control inputGroup" name="projectCd" value="'+value+'" disabled>';
								html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
								html += '<i class="fa-solid fa-magnifying-glass"></i>';
								html += '</button></div>';
								$(td).html(html);
							} else if(index_td == purchaseOrderAdmTable.column('dealCorpNm:name').index()) {
								let value = purchaseOrderAdmTable.row(tr).data().dealCorpIdx == null ? '' : purchaseOrderAdmTable.row(tr).data().dealCorpIdx;
								let value2 = purchaseOrderAdmTable.row(tr).data().dealCorpNm == null ? '' : purchaseOrderAdmTable.row(tr).data().dealCorpNm;
								let html = '';
								html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
								html += '<input type="text" class="form-control inputGroup" name="dealCorpNm" value="'+value2+'" disabled>';
								html += '<input type="hidden" name="dealCorpIdx" value="'+value+'">';
								html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="dealCorpAdmSel()" name="btnDealCorpAdmSel" style="padding: 1px 4px; margin-left: 0px;">';
								html += '<i class="fa-solid fa-magnifying-glass"></i>';
								html += '</button></div>';
								$(td).html(html);
//	 						} else if(index_td == purchaseOrderAdmTable.column('requestDate:name').index()) {
//	 							let value = purchaseOrderAdmTable.row(tr).data().requestDate;
//	 							$(td).html('<input type="date" max="9999-12-31" name="requestDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
							} else if(index_td == purchaseOrderAdmTable.column('orderDate:name').index()) {
								let value = purchaseOrderAdmTable.row(tr).data().orderDate;
								$(td).html('<input type="date" max="9999-12-31" name="orderDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
							} else if(index_td == purchaseOrderAdmTable.column('deliveryPossibleDate:name').index()) {
								$(td).html('<input type="date" max="9999-12-31" name="deliveryPossibleDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
							} else if(index_td == purchaseOrderAdmTable.column('preInDate:name').index()) {
								$(td).html('<input type="date" max="9999-12-31" name="preInDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
							} else if(index_td == purchaseOrderAdmTable.column('deliveryOrderDate:name').index()) {
								$(td).html('<input type="date" max="9999-12-31" name="deliveryOrderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
							} else if(index_td == purchaseOrderAdmTable.column('orderMaker:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('orderQty:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('orderDtlQty:name').index()) {
								let value = addCommas(parseInt(purchaseOrderAdmTable.row(tr).data().orderQty) - parseInt(purchaseOrderAdmTable.row(tr).data().alreadyOrderDtlQty));
								dtlQty = parseInt(purchaseOrderAdmTable.row(tr).data().orderQty) - parseInt(purchaseOrderAdmTable.row(tr).data().alreadyOrderDtlQty);
								$(td).html('<input type="text" name="orderDtlQty" style="min-width:100px;"   onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('price:name').index()) {
								let value = $(td).text();
								priceVal = parseInt(value.replaceAll(/,/g, ''));
								$(td).html('<input type="text" name = "price" style="min-width:100px;"   onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('supplyAmt:name').index()) {
								let value = $(td).text();
								var price = purchaseOrderAdmTable.row(tr).data().price == null ? 0 : purchaseOrderAdmTable.row(tr).data().price;
								value = addCommas(parseInt(dtlQty) * parseInt(price));
								$(td).html('<input type="text" name = "supplyAmt" style="min-width:100px;" onchange="getSupplyAmt()" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('vat:name').index()) {
								let value = $(td).text();
								var price = purchaseOrderAdmTable.row(tr).data().price == null ? 0 : purchaseOrderAdmTable.row(tr).data().price;
								value = addCommas(parseInt(dtlQty) * parseInt(price) * 0.1);
								$(td).html('<input type="text" name = "vat" style="min-width:100px;" onchange="getVat()" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
							} else if(index_td == purchaseOrderAdmTable.column('orderDtlNo:name').index()) {
// 								let value = purchaseOrderAdmTable.row($(tr)).data().orderDtlNo;

// 								var html = '';
// 								html += '<select class="form-select" name="selDtlNo">';
// 								for (var i = 0; i < dtlNoArray.length; i++) {
// 									if(dtlNoArray[i].orderDtlNo == value){
// 										html += '<option value="'+dtlNoArray[i].orderDtlNo+'" data-dealCorpIdx="'+dtlNoArray[i].dealCorpIdx+'" selected>'+dtlNoArray[i].orderDtlNo.substring(2, 12)+'</option>';
// 									} else {
// 										if(dtlNoArray[i].orderDtlNo == '신규'){
// 											html += '<option value="" data-dealCorpIdx="">신규</option>';
// 										} else {
// 											html += '<option value="'+dtlNoArray[i].orderDtlNo+'" data-dealCorpIdx="'+dtlNoArray[i].dealCorpIdx+'">'+dtlNoArray[i].orderDtlNo.substring(2, 12)+'</option>';
// 										}
										
// 									}
// 								}
// 								html += '</select>';

// 								$(td).html(html);
							} else if(index_td == purchaseOrderAdmTable.column('orderDtlDesc:name').index()) {
								let value = $(td).text();
								$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
							}
						}
					});
					$(tr).find('div[name=totalAmt]').text(addCommas(dtlQty*priceVal));
				}
			}
		});

		if(!state){
			toastr.warning('발주확정된 데이터는 수정할 수 없습니다.');
			purchaseOrderAdmTable.draw();
			purchaseOrderAdmTable.colReorder.disable();
			return false;
		}
		
		$('input[name=admCheckBox]').attr('disabled', true);
		//애네뭐지..
		//$('.lcTypeOutputToggle').attr('disabled', false);
		//$('.lcTypeInputToggle').attr('disabled', false);
		//$('.lcTypeReturnToggle').attr('disabled', false);
		//$('.lcTypeQcToggle').attr('disabled', false);
		//$('.lcTypeOutsourcingToggle').attr('disabled', false);
		purchaseOrderAdmTable.draw();
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
		
		
		purchaseOrderAdmTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
		
	});

	// 수주별발주 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('[name=admCheckBox]:checked').length == 0){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('[name=admCheckBox]:checked').length > 1){
			toastr.warning('한 개씩 삭제할 수 있습니다.');
			return false;
		}

		let data = purchaseOrderAdmTable.row('.selected').data();

		if(data.orderDtlNo != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		} else {
			toastr.warning('발주데이터를 선택해주세요.');
			return false;
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let orderDtlNo = purchaseOrderAdmTable.row('.selected').data().orderDtlNo;
			if(orderDtlNo==null) {
				toastr.warning('발주데이터를 선택해주세요.');
				return false;
			} else {
				$.ajax({
					url: '<c:url value="/pm/purchaseOrderDtlDel"/>',
		            type: 'POST',
		            data: {
		                'orderDtlNo'	:	orderDtlNo
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');

							purchaseOrderAdmTable.ajax.reload(function(){},false);
							purchaseOrderAdmTable.row('.selected').remove().draw(false);
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			}
			
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

			purchaseOrderAdmTable.ajax.reload(function(){},false);
			purchaseOrderAdmTable.colReorder.enable();

			$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			//$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
	});

	//전체선택클릭
	$('#admAllCheckBox').on('click',function(){
		if ( $('#admAllCheckBox').prop("checked") ) {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=admCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=admCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=admCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=admCheckBox]').prop("checked", false);
				}
			});
		}
	});

	//일괄적용
	$('#btnBatchApply').on('click',function(){
		if($('#batchDeliveryOrderDate').val()=='') {
			toastr.warning('발주일자를 지정해주세요.');
			$('#batchOrderDate').focus();
		}
		if($('#batchDeliveryPossibleDate').val()=='') {
			toastr.warning('납기가능일 지정해주세요.');
			$('#batchOrderDate').focus();
		}
		
		$('#purchaseOrderAdmTable tbody tr').each(function(index, item){
			if($(this).find('input[name=admCheckBox]').is(':checked')) {
				$(this).find('input[name=deliveryOrderDate]').val($('#batchDeliveryOrderDate').val());
				$(this).find('input[name=deliveryPossibleDate]').val($('#batchDeliveryPossibleDate').val());
				$(this).find('input[name=preInDate]').val($('#batchDeliveryPossibleDate').val());
			}
		});
	});

	//종료사유 등록 모달====================================================================================
	let completeArray = [];
		
	$('#btnComplete').on('click',function(){
		completeArray = [];
		setTimeout(function() {
			completeYnModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
					let node = $(item);
					let tr = $(node).parent().parent();
					let td = $(item).find('td');
					if($(this).find('[name=admCheckBox]').is(':checked')){
						let orderNo = purchaseOrderAdmTable.row($(item)).data().orderNo;
						let orderDtlNo = purchaseOrderAdmTable.row($(item)).data().orderDtlNo;
						let orderQty = purchaseOrderAdmTable.row($(item)).data().orderQty;
						let alreadyOrderDtlQty = purchaseOrderAdmTable.row($(item)).data().alreadyOrderDtlQty;

						if((parseFloat(orderQty) - parseFloat(alreadyOrderDtlQty)) == 0){
							let obj = new Object();
							obj.orderDtlNo 			= orderDtlNo;
							obj.completeYn			= 'Y';
							obj.completeDesc		= '';

							completeArray.push(obj);
						} else {
							completeYnModalTable.row.add({
								'orderNo'				:	orderNo,
								'orderDtlNo'			:	orderDtlNo,
								'orderQty'				:	orderQty,
								'alreadyOrderDtlQty'	:	alreadyOrderDtlQty,
							}).draw(false);
						}
						
					}
				});
			}, 200);
		}, 150);

		$('#completeYnModal').modal('show');
	});

	$('#completeYnModalTable thead tr').clone(true).addClass('filters').appendTo('#completeYnModalTable thead'); // filter 생성
	let completeYnModalTable = $('#completeYnModalTable').DataTable({
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
        scrollY: '65vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
        ajax : {
			url : '<c:url value="/pm/purchaseOrderAdmInsertLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return '19000101'; },
				endDate		: function() { return '19000102'; },
				departmentCd: function() { return 'dep';},
				status		: function() { return 'sta';},
			},
		},
        rowId: 'orderNo',
		columns : [
			{ data: 'orderNo', className : 'text-center align-middle', //요청번호
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ 	className : 'text-end align-middle',	//미발주수량
				render : function(data, type, row, meta) {
					var notOrderQty = 0;
					notOrderQty = parseFloat(row['orderQty']) - parseFloat(row['alreadyOrderDtlQty']);
					return addCommas(parseFloat(notOrderQty));
				}
			},
			{ data: 'completeDesc', className : 'text-end align-middle', name: 'completeDesc', //비고
				render : function(data, type, row, meta) {
					return '<input style="min-width:200px; type="text" name="completeDesc" class="form-control"><span class="d-none"></span>';		
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
			let middlecolT_height = parseFloat($('#rightcol').css('height'));
			let theadHeight = parseFloat($('#completeYnModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#completeYnModalTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#completeYnModalTable_filter').addClass('d-none');
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
					let selectData = completeYnModalTable.row(item).data();
					if( completeYnModalTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(completeYnModalTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(completeYnModalTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#completeYnModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#completeYnModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	completeYnModalTable.on('column-reorder', function( e, settings, details ) {
		let api = completeYnModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#completeYnModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnCompleteYnSave').on('click', function(){
		let state = true;
		$('#completeYnModalTable tbody').find('tr').each(function(index, item) {
			if($(this).find($('input[name=completeDesc]')).val() == ''){
                toastr.warning('종료사유를 입력해주세요.');
                $(this).find($('input[name=completeDesc]')).focus();
                state = false;
                return false;
            }
		});

		if(!state) {
			return false;
		} else {
			$('#completeYnModalTable tbody').find('tr').each(function(index, item) {
				let node = $(item);
				let tr = $(node).parent().parent();
				let td = $(item).find('td');

				let orderDtlNo = completeYnModalTable.row($(item)).data().orderDtlNo;
				let completeDesc = $(td).eq(completeYnModalTable.column('completeDesc:name').index()).find('input').val();
				
				let obj = new Object();
				obj.orderDtlNo 			= orderDtlNo;
				obj.completeYn			= 'Y';
				obj.completeDesc		= completeDesc;

				completeArray.push(obj);
			});
		}

		$.ajax({
			url: '<c:url value="/pm/completeYnUpd"/>',
            type: 'POST',
            data: {
                'jsonArray'	:	JSON.stringify(completeArray)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					purchaseOrderAdmTable.ajax.reload(function() {
						$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					purchaseOrderAdmTable.colReorder.enable();

					$('#completeYnModal').modal('hide');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	//발주확정
	$('#btnConfirmY').on('click', function(){
		if($('[name=admCheckBox]:checked').length == 0){
			toastr.warning('발주 확정할 행을 선택해주세요.');
			return false;
		}
		if($('#purchaseOrderAdmTable tbody tr').length != $('#purchaseOrderAdmTable tbody tr').find('input').length){
			toastr.warning('수정 중입니다.');
			return false;
		}

		confirmUpd('Y');
	});

	//발주확정 취소
	$('#btnConfirmN').on('click', function(){
		if($('[name=admCheckBox]:checked').length == 0){
			toastr.warning('발주 확정할 행을 선택해주세요.');
			return false;
		}
		if($('#purchaseOrderAdmTable tbody tr').length != $('#purchaseOrderAdmTable tbody tr').find('input').length){
			toastr.warning('수정 중입니다.');
			return false;
		}

		confirmUpd('N');
	});

	function confirmUpd(confirmYn){
		let state = true;
		let confirmArray = [];
		let itemCostArray = [];

		if(confirmYn == 'Y'){
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				if($(item).find('input[name=admCheckBox]').is(':checked')){
					var status = purchaseOrderAdmTable.row($(item)).data().status;
	
					if(status != '002'){
						toastr.warning('발주상태인 데이터만 확정할 수 있습니다.');
						state = false;
						return false;
					}
				}
			});
		} else if(confirmYn == 'N'){
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				if($(item).find('input[name=admCheckBox]').is(':checked')){
					var status = purchaseOrderAdmTable.row($(item)).data().status;
					var confirmYnVal = purchaseOrderAdmTable.row($(item)).data().confirmYn;
	
					if(confirmYnVal != 'Y'){
						toastr.warning('발주확정된 데이터만 취소할 수 있습니다.');
						state = false;
						return false;
					} else if(status != '002'){
						toastr.warning('입고상태인 데이터는 취소할 수 없습니다.');
						state = false;
						return false;
					}
				}
			});
		}
		
		if(!state) {
			return false;
		} else {
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				let node = $(item);
				let tr = $(node).parent().parent();
				let td = $(item).find('td');
	
				if($(item).find('input[name=admCheckBox]').is(':checked')){
					let orderDtlNo = purchaseOrderAdmTable.row($(item)).data().orderDtlNo;

					let obj = new Object();
					obj.orderDtlNo 			= orderDtlNo;
					obj.confirmYn			= confirmYn;
	
					confirmArray.push(obj);

					//단가 저장/삭제
					if(purchaseOrderAdmTable.row($(item)).data().price != purchaseOrderAdmTable.row($(item)).data().recentPrice){
						let itemCdVal1 			= purchaseOrderAdmTable.row($(item)).data().itemCd;
						let deliveryOrderDate 	= purchaseOrderAdmTable.row($(item)).data().deliveryOrderDate.replace(/-/g, '');
						let dealCorpCd 			= purchaseOrderAdmTable.row($(item)).data().dealCorpCd;
						let price 				= purchaseOrderAdmTable.row($(item)).data().price;
						
	 					let costObj = new Object();
	 					costObj.idx			= '';
	 					costObj.orderDtlNo 	= orderDtlNo;
	 					costObj.itemCd		= itemCdVal1;
	 					costObj.costDate	= deliveryOrderDate;
	 					costObj.dealCorpCd	= dealCorpCd;
	 					costObj.cost		= price;
	 					costObj.costUnit	= 'KRW';
	 					if(confirmYn == 'Y'){
	 						costObj.costDesc	= '';
	 					} else if (confirmYn == 'N'){
	 						costObj.costDesc	= 'delete';
	 					}
	 					
	 					itemCostArray.push(costObj);
					}
	            }
			});
	
			$.ajax({
				url: '<c:url value="/pm/confirmYnUpd"/>',
	            type: 'POST',
	            data: {
	                'jsonArray'	:	JSON.stringify(confirmArray)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('저장되었습니다.');

						//단가 이력 등록
						if(itemCostArray.length != 0){
							$.ajax({
								url: '<c:url value="/bm/itemCostIU"/>',
					            type: 'POST',
					            data: {
					                'jsonArray'	:	JSON.stringify(itemCostArray)
					            },
								success : function(res) {
									if (res.result == "ok") { //응답결과
										
									} else if(res.result == 'fail') {
										toastr.warning(res.message);
									} else {
										toastr.error(res.message);
									}
								}
							});
						}
						
						purchaseOrderAdmTable.ajax.reload(function() {
							$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
								$(item).find('input').attr('disabled', false);// 검색 필터 enable
							});
						});
						purchaseOrderAdmTable.colReorder.enable();
	
						$('#completeYnModal').modal('hide');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});

		}
	}

	
	//담당자====================================================================================
	
	function userSel() {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#userModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
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

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let data = userModalTable.row(this).data();
		console.log(data)
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderUserName]').val(data.userName);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=orderUserDepartment]').text(data.userDepartmentNm);
		
		$('#userModal').modal('hide');
	});

	//자재====================================================================================
	
	$('#searchItemCdDel').on('click', function() {
		$('#searchItemCd').val('');
	});
	
	let itemInfoAdmSearch = 'search';
	
	function itemInfoAdmSel(value) {
		itemInfoAdmSearch = value;
		$('#itemInfoAdmModal').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}
	

	// 품목정보 목록조회
	$('#itemInfoAdmModalTable thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmModalTable thead'); // filter 생성
	let itemInfoAdmModalTable = $('#itemInfoAdmModalTable').DataTable({
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
        	url: '<c:url value="/bm/itemInfoAdmLst"/>',
            type: 'GET',
            data: {
                
            },
		},
        rowId: 'itemCd',
		columns : [
			{ data: 'itemCd', className : 'text-center'},
			{ data: 'itemNm', className : 'text-center'},
			{ data: 'itemDc', className : 'text-center'},
			{ data: 'itemGubunNm', className : 'text-center'},
			{ data: 'unitDc', className : 'text-center'},
			{ data: 'useYnNm', className : 'text-center'},
			{ data: 'inspectYnNm', className : 'text-center'},
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
			let theadHeight = parseFloat($('#itemInfoAdmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemInfoAdmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	itemInfoAdmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemInfoAdmModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemInfoAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//품목 조회 버튼 click
	$('#btnitemInfoAdmModalSearch').on('click', function() {
		itemInfoAdmModalTable.ajax.reload(function(){});
	});

	$('#btnItemInfoAdmModalPaste').on('click', function() {
		let data = itemInfoAdmModalTable.row('selected').data();
		if(itemInfoAdmSearch=='input') {
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunIdx]').text(data.itemGubunIdx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Idx]').text(data.itemGubun1Idx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Idx]').text(data.itemGubun2Idx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunNm]').text(data.itemGubunNm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Nm]').text(data.itemGubun1Nm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Nm]').text(data.itemGubun2Nm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(data.itemCd);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemNm]').text(data.itemNm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemDc]').text(data.itemDc);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=unitDc]').text(data.unitDc);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').text(data.cost);
		} else {
			$('#searchItemCd').val(data.itemCd);
		}
		purchaseOrderAdmTable.draw();
		$('#itemInfoAdmModal').modal('hide');
	});

	$('#itemInfoAdmModalTable tbody').on('dblclick','tr',function(){
		let data = itemInfoAdmModalTable.row(this).data();
		if(itemInfoAdmSearch=='input') {
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunIdx]').text(data.itemGubunIdx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Idx]').text(data.itemGubun1Idx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Idx]').text(data.itemGubun2Idx);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubunNm]').text(data.itemGubunNm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun1Nm]').text(data.itemGubun1Nm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemGubun2Nm]').text(data.itemGubun2Nm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=itemCd]').val(data.itemCd);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemNm]').text(data.itemNm);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=itemDc]').text(data.itemDc);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=unitDc]').text(data.unitDc);
			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').text(data.cost);
		} else {
			$('#searchItemCd').val(data.itemCd);
		}
		purchaseOrderAdmTable.draw();
		$('#itemInfoAdmModal').modal('hide');
	});

	// 고객사 검색 버튼 click
	function dealCorpAdmSel() {
		$('#dealCorpModal').modal('show');
	}

	$('#dealCorpModal').on('shown.bs.modal', function() {
		dealCorpModalTable.ajax.reload(function() {});
	});

	// 거래처정보 목록 조회
	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
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
			url : '<c:url value="/bm/dealCorpAdmList"/>',
			type : 'POST',
			data : {
				dealGubun : function(){ return $('#modalDealGubun').val();},
				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealGubunNm', className : 'text-center'},
			{ data: 'dealCorpCd', className : 'text-center'},
			{ data: 'initial', className : 'text-center'},
			{ data: 'dealCorpNm', className : 'text-center'},
			{ data: 'representative', className : 'text-center'},
			{ data: 'companyNumber', className : 'text-center'},
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
			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			
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
				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	dealCorpModalTable.on('column-reorder', function( e, settings, details ) {
		let api = dealCorpModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnDealCorpModalSearch').on('click',function(){
		dealCorpModalTable.ajax.reload(function() {});
	});

	$('#btnDealCorpModalPaste').on('click', function(){
		let data = dealCorpModalTable.row('.selected').data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpNm]').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row(this).data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpIdx]').val(data.idx);
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=dealCorpNm]').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

	// 거래처명 일괄등록 =================================================================================

	$('#btnSearchDealCorp').on('click', function(){
		$('#dealCorpModal1').modal('show');
	});

	$('#dealCorpModal1').on('shown.bs.modal', function() {
		dealCorpModalTable1.ajax.reload(function() {});
	});

	// 거래처정보 목록 조회
	$('#dealCorpModalTable1 thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable1 thead'); // filter 생성
	let dealCorpModalTable1 = $('#dealCorpModalTable1').DataTable({
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
			url : '<c:url value="/bm/dealCorpAdmList"/>',
			type : 'POST',
			data : {
				dealGubun : function(){ return $('#modalDealGubun').val();},
				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealGubunNm', className : 'text-center'},
			{ data: 'dealCorpCd', className : 'text-center'},
			{ data: 'initial', className : 'text-center'},
			{ data: 'dealCorpNm', className : 'text-center'},
			{ data: 'representative', className : 'text-center'},
			{ data: 'companyNumber', className : 'text-center'},
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
			let theadHeight = parseFloat($('#dealCorpModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			
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
				let cell = $('#dealCorpModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#dealCorpModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	dealCorpModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = dealCorpModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#dealCorpModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnDealCorpModalSearch1').on('click',function(){
		dealCorpModalTable1.ajax.reload(function() {});
	});

	$('#btnDealCorpModalPaste1').on('click', function(){
		let data = dealCorpModalTable1.row('.selected').data();
		$('#selDealCorpIdx').val(data.idx);
		$('#selDealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal1').modal('hide');
	});

	$('#dealCorpModalTable1 tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable1.row(this).data();
		$('#selDealCorpIdx').val(data.idx);
		$('#selDealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal1').modal('hide');
	});
	
	$('#btnBatchDealCorpApply').on('click', function(){
		if($('#selDealCorpIdx').val() == ''){
			toastr.waring('거래처를 선택해주세요.');
			return false;
		}

		for(var i=0; i<$('#purchaseOrderAdmTable').DataTable().$('tr.selected').length; i++){
			$($('#purchaseOrderAdmTable').DataTable().$('tr.selected')[i]).find('input[name=dealCorpIdx]').val($('#selDealCorpIdx').val());
			$($('#purchaseOrderAdmTable').DataTable().$('tr.selected')[i]).find('input[name=dealCorpNm]').val($('#selDealCorpNm').val());
		}
	});

	//품목정보 모달 ===================================================================================
	
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

	//품목정보 조회 버튼 click
	$('#btnitemInfoAdmModalSearch1').on('click', function() {
		itemInfoAdmModalTable1.ajax.reload(function(){});
	});

	$('#btnItemInfoAdmModalPaste1').on('click', function(){
		$('#my-spinner').show();

		for(var i=0; i<$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').length; i++){
			
	 		let data = $('#itemInfoAdmModalTable1').DataTable().row($('#itemInfoAdmModalTable1').DataTable().$('tr.selected')[i]).data();

	 		let col_filter_text = [];
			$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', true); // 검색 필터 disabled
				col_filter_text.push($(item).find('input').val());
			});
			purchaseOrderAdmTable.row.add({
				'status'		:	'002',
				'orderNo'		:	null,
				'orderSeq'		:	null,
				'itemGubunIdx'	:	data.itemGubunIdx,
	 			'itemGubun1Idx'	:	data.itemGubun1Idx,
	 			'itemGubun2Idx'	:	data.itemGubun2Idx,
	 			'itemGubunNm'	:	data.itemGubunNm,
	 			'itemGubun1Nm'	:	data.itemGubun1Nm,
	 			'itemGubun2Nm'	:	data.itemGubun2Nm,
	 			'itemCd'		:	data.itemCd,
	 			'itemNm'		:	data.itemNm,
	 			'itemDc'		:	data.itemDc,
	 			'unitDc'		:	data.unitDc,
	 			'price'			:	data.cost,
	 			'supplyAmt'		:	'0',
	 			'vat'			:	'0',
				'projectCd'		:	null,
				'orderMaker'	:	col_filter_text[7],
				'orderQty'		:	col_filter_text[12],
				'orderDesc'		:	col_filter_text[13]
			}).draw(false);

			purchaseOrderAdmTable.colReorder.disable();

			$('input[name=admCheckBox]').attr('disabled', true);

			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', false); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', false); // 취소 버튼
		}

		setTimeout(function() {
			$('#itemInfoAdmModal1').modal('hide');
			$('#my-spinner').hide();
		}, 100)
	});


	//프로젝트코드====================================================================================
	
	let now = new Date();
	let now_year = now.getFullYear();
	
	function bizOrderPrjCdSel() {
		$('#bizOrderAdmModal').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}
	
	// 품목정보 목록조회
	$('#bizOrderAdmModalTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable thead'); // filter 생성
	let bizOrderAdmModalTable = $('#bizOrderAdmModalTable').DataTable({
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
        scrollY: '68vh',
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
        	url : '/bs/bizOrderAdmLst',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#bizStartDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#bizEndDate').val()).format('YYYYMMDD'); },
				nowYear	: function() { return now_year; },
			},
		},
        rowId: 'itemCd',
		columns : [
			//품목유형
			{ data: 'goodsTypeNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//품목유형명
			{ data: 'goodsNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//수주관리번호
			{ data: 'bizOrdNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//고객발주No
			{ data: 'customerNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//프로젝트코드
			{ data: 'prjCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//프로젝트명
			{ data: 'prjNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
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
			let theadHeight = parseFloat($('#bizOrderAdmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#bizOrderAdmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnBizOrderAdmModalSearch').on('click',function(){
		bizOrderAdmModalTable.ajax.reload(function() {});
	});

	$('#bizOrderAdmModalTable tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable.row(this).data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
	});

	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row('selected').data();
		$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
		
	});
	
	//프로젝트코드====================================================================================	
	
		//이미지 모달------------------------------------------------------------------------------------
	
	
	function imageModal(projectIdxValue, projectDtlIdxValue) {
		$('#projectImageViewModal').modal('show');
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectImageViewTable.ajax.reload(function() {});
		}, 150)
	}

	// 프로젝트 이미지 조회
	let projectImageViewTable = $('#projectImageViewTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '70vh',
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
			url : '<c:url value="/rm/projectImageLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; },
				projectDtlIdx : function() { return projectDtlIdx; }
			},
		},
		columns : [
			{ className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return (meta.row+1);
				}
			},
			{ data: 'projectImage', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<img class="card-img-bottom" id="signImage" src="data:image/jpeg;base64,'+data+'" style="border: 1px solid #000000;width:400px;height:300px;">';
				}
			},
			{ data: 'userNm', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;">'+userName+'</div>';
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'projectDesc', className : 'text-center align-middle', name : "projectDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="white-space:pre-line;min-width:400px;">'+data+'</div>';
					} else {
						return '<textarea class="form-control" style="min-width:400px;min-height:300px; resize: none; min-height: 300px;" ></textarea>';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [],
		order : [],
		drawCallback: function() {
		},
	});

	//품목별 문서 ----------------------------------------------------------------------------------------------
	function documentModal(projectIdxValue, projectDtlIdxValue) {

		$('#projectDocumentViewModal').modal('show');
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		setTimeout(function() {
			projectDocumentViewTable.ajax.reload(function() {});
		}, 150);
	}

	// 프로젝트 문서 조회
	let projectDocumentViewTable = $('#projectDocumentViewTable').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
        fixedHeader: false,
        scrollY: '50vh',
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
			url : '<c:url value="/rm/projectDocumentLst"/>',
			type : 'GET',
			data : {
				projectIdx : function() { return projectIdx; },
				projectDtlIdx : function() { return projectDtlIdx; }
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return (meta.row+1);
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
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
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel(\'DOCUMENT\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'documentDesc', className : 'text-center align-middle', name : "documentDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	//요청사항----------------------------------------------------------------------------------------------
	function orderRemarkModal(projectIdxValue, projectDtlIdxValue, groupIdxValue) {
		$('#orderRemarkEditModal').modal('show');
		
		var html = '';
		html += '<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">';
		html +=	'	<i class="fa-solid fa-xmark"></i>';
		html +=	'</button>';

		$('#orderRemarkEditModal').find('.btn-group').html(html);
		
		projectIdx = projectIdxValue;
		projectDtlIdx = projectDtlIdxValue;
		groupIdx = groupIdxValue;
		$('#btnRemarkSave').attr('disabled',true);
		setTimeout(function() {
			$('#remark').val($('#purchaseOrderAdmTable').DataTable().row('.selected').data().orderRemark);
			$('#remark').attr('disabled', true);
			
		}, 150);
	}

	
// 	function getTotalPrice() {
// 		if($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val()!='' && $('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val() != '') {
// 			console.log($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val());
// 			console.log($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val());
// 			let totalPrice = parseInt(removeCommas($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=price]').val())) * parseInt(removeCommas($('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('input[name=orderDtlQty]').val()));
// 			$('#purchaseOrderAdmTable').DataTable().$('tr.selected').find('div[name=totalPrice]').text(addCommas(totalPrice));
// 		}
// 	}
	$(document).on('change', 'input[name=price]', function(){
		var tr = $(this).parent().parent();
		var price = $(this).val().replaceAll(/,/g, '');
		var orderDtlQty = tr.find('input[name=orderDtlQty]').val().replaceAll(/,/g, '');

		var supplyAmt = parseFloat(price) * parseFloat(orderDtlQty);
		var vat = parseFloat(supplyAmt) * 0.1;
		tr.find('input[name=supplyAmt]').val(addCommas(supplyAmt));
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=orderDtlQty]', function(){
		var tr = $(this).parent().parent();
		var price = tr.find('input[name=price]').val().replaceAll(/,/g, '');
		var orderDtlQty = $(this).val().replaceAll(/,/g, '');

		var supplyAmt = parseFloat(price) * parseFloat(orderDtlQty);
		var vat = parseFloat(supplyAmt) * 0.1;
		tr.find('input[name=supplyAmt]').val(addCommas(supplyAmt));
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=supplyAmt]', function(){
		var tr = $(this).parent().parent();
		var supplyAmt = $(this).val().replaceAll(/,/g, '');
		var vat = parseFloat(supplyAmt) * 0.1;
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=vat]', function(){
		var tr = $(this).parent().parent();
		var supplyAmt = tr.find('input[name=supplyAmt]').val().replaceAll(/,/g, '');
		var vat = $(this).val().replace(/,/g, '');
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});
	
	$(document).on('change', 'input[name=deliveryPossibleDate]', function(){
		var tr = $(this).parent().parent();
		tr.find('input[name=preInDate]').val(tr.find('input[name=deliveryPossibleDate]').val());
// 		console.log(tr.find('div[name=preInDate]').val());
	});
	
</script>

</body>
</html>
