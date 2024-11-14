<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">의뢰일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnSearch">
						<i class="fa-regular fa-clipboard"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 18px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="quotationTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">세부상태</th>
							<th class="text-center align-middle">RFQ유형</th>
							<th class="text-center align-middle">입찰</th>
							<th class="text-center align-middle">유형</th>
							<th class="text-center align-middle">방식</th>
							<th class="text-center align-middle">RFx번호</th>
							<th class="text-center align-middle">차수</th>
							<th class="text-center align-middle">제목</th>
							<th class="text-center align-middle">품목수</th>
							<th class="text-center align-middle">선정방식</th>
							<th class="text-center align-middle">견적번호</th>
							<th class="text-center align-middle">의뢰일자</th>
							<th class="text-center align-middle">마감일자</th>
							<th class="text-center align-middle">제출일자</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- 견적등록/수정 모달 끝  -->
<div class="modal fade" id="quotationAddEditModal" tabindex="-1"
	aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog" style="max-width: 80vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">견적등록/수정</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						data-bs-dismiss="modal" style="font-size: 20px !important;">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="padding: 1rem;">
				<div class="container-fluid p-0 h-100">
					<div class="row" style="padding-bottom: 0px;">
						<table class="table table-bordered" id="quotationAddTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>REQ유형</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="reqType">
										</select>
									</td>
									
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적의뢰제목</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="reqTitle">
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적의뢰번호</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" placeholder="자동채번" id="reqNo" disabled>
									</td>
									<th class="text-center align-middle">차수</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="order">
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>의뢰일자</th>
									<td class="text-center align-middle">
										<input type="date" class="form-control" id="reqDate">
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적마감일시</th>
									<td class="text-center align-middle">
										<input type="datetime-local" max="9999-12-31" class="form-control inputGroup" id="dlDate">
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적유효일자</th>
									<td class="text-center align-middle">
										<input type="date" max="9999-12-31" class="form-control inputGroup" id="expirationDate">
									</td>
									<th class="text-center align-middle">제출일자</th>
									<td class="text-center align-middle">
										<input type="date" class="form-control" id="submitDate">
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">Incoterms</th>
									<td class="text-center align-middle">
										<input type=text class="form-control" id="incoterms">
									</td>
									<th class="text-center align-middle">단가계약여부</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="convenantYn">
											<option value="Y">예</option>
											<option value="N">아니오</option>
										</select>
									</td>
									<th class="text-center align-middle">발주구분</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="receiptGubun">
										</select>
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>고객사</th>
									<td class="text-center align-middle">
										<div style="display: flex; flex-wrap: 1 1 auto;">
											<input type="text" class="form-control" id="dealCorpNm" disabled>
											<input type="hidden" class="form-control" id="dealCorpIdx" disabled>
											<button type="button"
												style="padding: 1px 4px; margin-left: 5px;"
												class="btn btn-primary input-sub-search"
												id="btnDealCorpSelect">
												<i class="fa-solid fa-magnifying-glass"></i>
											</button>
										</div>
										
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">구매담당자이름</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="purchaseChargr">
									</td>
									<th class="text-center align-middle">전화번호</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="phonNum">
									</td>
									<th class="text-center align-middle">구매담당자이메일</th>
									<td class="text-center align-middle">
										 <input type="text" class="form-control" id="purchaseChargrEmail">
									</td>
									<th class="text-center align-middle">RFX방식</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="rfxMethod">
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>업체선정방식</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="companySelection">
										</select>
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적등록유형</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="purchaseType">
									</td>
									<th class="text-center align-middle">
										<span style="color: #ff0000;">*</span>견적등록방식</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="quotationMethod">
									</td>
									<th class="text-center align-middle">견적번호</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="quotationNo">
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">기준통화</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="costUnit">
										</select>
									</td>
									<th class="text-center align-middle">입찰</th>
									<td class="text-center align-middle">
										<input type="text" class="form-control" id="bidding">
									</td>
									<th class="text-center align-middle">부분입찰가능</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="partialBidding">
											<option value="Y">예</option>
											<option value="N">아니오</option>
										</select>
									</td>
									<th class="text-center align-middle">조건변경기능</th>
									<td class="text-center align-middle">
										<select class="form-select inputGroup" id="changeConditions">
											<option value="Y">예</option>
											<option value="N">아니오</option>
										</select>
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">구매자비고</th>
										<td colspan="3" class="text-center align-middle">
										<textarea class="form-control inputGroup" rows="3" id="buyerDesc" style="resize: none;"></textarea>
									</td>
									<th class="text-center align-middle">협력사비고</th>
									<td colspan="3" class="text-center align-middle">
										<textarea  class="form-control inputGroup" rows="3" id="dealCorpDesc" style="resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<th class="text-center align-middle">note</th>
										<td colspan="7" class="text-center align-middle">
										<textarea class="form-control inputGroup" rows="3" id="note" style="resize: none;"></textarea>
									</td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<hr style="margin: 0px;">
			<div id="infoCol" class="modal-body d-none">
				<div class="container-fluid" style="padding: 5px;">
					<div class="row">
						<div class="d-flex align-items-center justify-content-space-between w-100"
							style="margin-bottom: 5px;">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품목정보</label>
							<div class="me-lg-auto"></div>
							<div class="btn-group" role="group"
								aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 18px !important;" id="btnInfoNew">
									<i class="fa-solid fa-plus"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 20px !important;" id="btnInfoSave"
									disabled><!-- 아이디설정  -->
									<i class="fa-regular fa-floppy-disk"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 18px !important;" id="btnInfoEdit">
									<i class="fa-regular fa-pen-to-square"></i>
								</button>
								<button type="button" class="btn btn-outline-danger w-auto"
									style="font-size: 17px !important;" id="btnInfoDel">
									<i class="fa-solid fa-trash-can"></i>
								</button>
							</div>
						</div>
						<table class="table table-bordered p-0 m-0" id="quotationInfoTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">견적항번</th>
									<th class="text-center align-middle">품목유형</th>
									<th class="text-center align-middle">품명</th>
									<th class="text-center align-middle">단위</th>
									<th class="text-center align-middle">수량</th>
									<th class="text-center align-middle">견적단가</th>
									<th class="text-center align-middle">견적금액</th>
									<th class="text-center align-middle">L/T(Day)</th>
									<th class="text-center align-middle">첨부</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<hr style="margin: 0px;">
			<div id="fileCol" class="modal-body d-none">
				<div class="row">
					<button type="button" class="d-none" id="fileSaveBtn"></button>
					<div id="fileLeftcol" style="width:33%; margin-left:4px;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<div class="d-flex align-items-center justify-content-space-between w-100" style="margin-bottom: 5px;">
									<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">첨부(구매자용)</label>
									<div class="me-lg-auto"></div>
									<input type="file" class="d-none" id="quotationFile" multiple="">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 18px !important;" id="btnQuotationFileAdd"
											disabled>
											<i class="fa-solid fa-plus"></i>
										</button>
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 20px !important;" id="btnQuotationFileSave"
											disabled>
											<i class="fa-regular fa-floppy-disk"></i>
										</button>
<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
<!-- 											style="font-size: 18px !important;" id="btnQuotationFileEdit">
<!-- 											<i class="fa-regular fa-pen-to-square"></i> -->
<!-- 										</button> -->
										<button type="button" class="btn btn-outline-danger w-auto"
											style="font-size: 17px !important;" id="btnQuotationFileDel">
											<i class="fa-solid fa-trash-can"></i>
										</button>
									</div>
								</div>
								<table class="table table-bordered p-0 m-0" id="quotationFileTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">.No</th>
											<th class="text-center">파일명</th>
											<th class="text-center">Size(KB)</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="fileCentercol" style="width:33%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<div class="d-flex align-items-center justify-content-space-between w-100"
									style="margin-bottom: 5px;">
									<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">기술검토 첨부(협력사용)</label>
									<div class="me-lg-auto"></div>
									<input type="file" class="d-none" id="quotationFile1" multiple="">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 18px !important;" id="btnQuotationFileAdd1"
											disabled>
											<i class="fa-solid fa-plus"></i>
										</button>
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 20px !important;" id="btnQuotationFileSave1"
											disabled><!-- 아이디설정  -->
											<i class="fa-regular fa-floppy-disk"></i>
										</button>
<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
<!-- 											style="font-size: 18px !important;" id="btnQuotationFileEdit1">
<!-- 											<i class="fa-regular fa-pen-to-square"></i> -->
<!-- 										</button> -->
										<button type="button" class="btn btn-outline-danger w-auto"
											style="font-size: 17px !important;" id="btnQuotationFileDel1">
											<i class="fa-solid fa-trash-can"></i>
										</button>
									</div>
								</div>
								<table class="table table-bordered p-0 m-0" id="quotationFileTable1" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">.No</th>
											<th class="text-center">파일명</th>
											<th class="text-center">Size(KB)</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="fileRightcol" style="width:33%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<div class="d-flex align-items-center justify-content-space-between w-100"
									style="margin-bottom: 5px;">
									<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">가격검토 첨부(협력사용)</label>
									<div class="me-lg-auto"></div>
									<input type="file" class="d-none" id="quotationFile2" multiple="">
									<div class="btn-group" role="group" aria-label="Small button group">
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 18px !important;" id="btnQuotationFileAdd2"
											disabled>
											<i class="fa-solid fa-plus"></i>
										</button>
										<button type="button" class="btn btn-outline-light w-auto"
											style="font-size: 20px !important;" id="btnQuotationFileSave2"
											disabled><!-- 아이디설정  -->
											<i class="fa-regular fa-floppy-disk"></i>
										</button>
<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
<!-- 											style="font-size: 18px !important;" id="btnQuotationFileEdit2">
<!-- 											<i class="fa-regular fa-pen-to-square"></i> -->
<!-- 										</button> -->
										<button type="button" class="btn btn-outline-danger w-auto"
											style="font-size: 17px !important;" id="btnQuotationFileDel2">
											<i class="fa-solid fa-trash-can"></i>
										</button>
									</div>
								</div>
								<table class="table table-bordered p-0 m-0" id="quotationFileTable2" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">.No</th>
											<th class="text-center">파일명</th>
											<th class="text-center">Size(KB)</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 견적등록/수정 모달 끝  -->
<!-- 제품명 모달 -->
<div class="modal fade" id="goodsNmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title" id="goodsNmModalTitle">
					제품명 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnGoodsNmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow:auto;">
				<table class="table table-bordered p-0 m-0" id="goodsNmModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">유형코드</th>
							<th class="text-center">유형명</th>
							<th class="text-center">No</th>
							<th class="text-center">제품명</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 제품명 모달 끝 -->
<!-- 삭제 경고 -->
<div class="modal fade" id="fileDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<spring:message code="modal.deleteGuide" text="default text" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnFileDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnFileDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
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

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";

	let toDay = moment().format('YYYYMMDDHHmm')
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let departmentList = getCommonCode('시스템', '002'); // 부서
	let costUnitList = getCommonCode('시스템', '005'); // 통화

	let produceQtyUnitList = getCommonCode('시스템', '018'); //생산지시단위
	
	let reqTypeList = getCommonCode('시스템', '053'); // RFQ유형
	let rfxMethodList = getCommonCode('시스템', '054'); // RFX방식
	let selectionMethodList = getCommonCode('시스템', '055'); // 업체선정방식
	let receiptGubunList = getCommonCode('시스템', '056'); // 발주구분
	
	selectBoxAppend(costUnitList, 'costUnit', '', '2'); //통화

	selectBoxAppend(reqTypeList, 'reqType', '', '2'); // RFQ유형
	selectBoxAppend(rfxMethodList, 'rfxMethod', '', '2'); // RFX방식
	selectBoxAppend(selectionMethodList, 'companySelection', '', '2'); // 업체선정방식
	selectBoxAppend(receiptGubunList, 'receiptGubun', '', '2'); // 발주구분

	let quotationIdx = '';
	let reqNo = '';
	let infoIdx = '';
	let fileTableId = '';
	let fileSaveId = '#btnQuotationFileSave';

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'INFO') {
			let idx = quotationInfoTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/bs/quotationInfoDel"/>',
	            type: 'POST',
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						quotationInfoTable.clear().draw();
						quotationInfoTable.ajax.reload();
						quotationInfoTable.row('.selected').remove().draw(false);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(deleteType == 'REQ') {
			let req = quotationTable.row('.selected').data().reqNo;
			$.ajax({
				url: '<c:url value="/bs/quotationDel"/>',
	            type: 'POST',
	            data: {
	                'reqNo'	:	req
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						quotationTable.clear().draw();
						quotationTable.ajax.reload();
						quotationTable.row('.selected').remove().draw(false);
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

	$('#btnSearch').on('click',function(){
		$('#my-spinner').show();
		quotationTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	$('#btnNew').on('click', function(){
		$('#infoCol').addClass('d-none');
		$('#fileCol').addClass('d-none');
		$('#quotationAddEditModal').modal('show');
		$('#reqType').val('');
		$('#reqNo').val('');
		$('#reqTitle').val('');
		$('#dlDate').val(moment().subtract('w',-1).format('YYYY-MM-DDT23:59'));
		$('#expirationDate').val('');
		$('#costUnit').val('');
		$('#partialBidding').val('Y');
		$('#changeConditions').val('Y');
		$('#incoterms').val('');
		$('#convenantYn').val('Y');
		$('#receiptGubun').val('');
		$('#dealCorpNm').val('');
		$('#purchaseChargr').val('');
		$('#phonNum').val('');
		$('#purchaseChargrEmail').val('');
		$('#rfxMethod').val('');
		$('#companySelection').val('');
		$('#purchaseType').val('');
		$('#quotationMethod').val('');
		$('#quotationNo').val('');
		
		$('#bidding').val('');
		$('#order').val('1');
		$('#submitDate').val('');
		$('#reqDate').val(moment().format('YYYY-MM-DD'));
		
		$('#buyerDesc').val('');
		$('#dealCorpDesc').val('');
		$('#note').val('');
	});
	
	$('#btnEdit').on('click', function(){
		if(quotationTable.row('.selected').data() == undefined){
			toastr.warning('수정할 데이터를 선택해주세요.');
			return false;
		}
		let data = quotationTable.row('.selected').data();
		
		$('#infoCol').removeClass('d-none');
		$('#fileCol').removeClass('d-none');
		$('#quotationAddEditModal').modal('show');
		quotationIdx = data.idx;
		$('#reqType').val(data.reqType);
		$('#reqNo').val(data.reqNo);
		$('#reqTitle').val(data.reqTitle);
		$('#dlDate').val(moment(data.deadLine, 'YYYY-MM-DDTHH:mm').format('YYYY-MM-DD HH:mm'));
		$('#expirationDate').val(moment(data.expirationDate).format('YYYY-MM-DD'));
		$('#costUnit').val(data.costUnit);
		$('#partialBidding').val(data.partialBidYn);
		$('#changeConditions').val(data.changeConditionsYn);
		$('#incoterms').val(data.incoterms);
		$('#convenantYn').val(data.unitPriceAgreementYn);
		$('#receiptGubun').val(data.orderGubun);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#purchaseChargr').val(data.purchaseChargr);
		$('#phonNum').val(data.phoneNumber);
		$('#purchaseChargrEmail').val(data.chargrEmail);
		$('#rfxMethod').val(data.rfxMethod);
		$('#companySelection').val(data.selectionMethod);
		$('#purchaseType').val(data.purchaseType);
		$('#quotationMethod').val(data.quotationMethod);
		$('#quotationNo').val(data.quotationNo);
		
		$('#bidding').val(data.bidding);
		$('#order').val(data.reqOrder);
		$('#submitDate').val(moment(data.submitDate).format('YYYY-MM-DD'));
		$('#reqDate').val(moment(data.reqDate).format('YYYY-MM-DD'));
		
		$('#buyerDesc').val(data.buyerDesc);
		$('#dealCorpDesc').val(data.dealCorpDesc);
		$('#note').val(data.note);
		uiProc(true);
		setTimeout(function() {
			quotationInfoTable.clear().draw();
			quotationInfoTable.ajax.reload(function(){});
			quotationFileTable.ajax.reload(function(){});
			quotationFileTable1.ajax.reload(function(){});
			quotationFileTable2.ajax.reload(function(){});
		}, 150);
		
	});

	$('#quotationTable thead tr').clone(true).addClass('filters').appendTo('#quotationTable thead'); // filter 생성
	let quotationTable = $('#quotationTable').DataTable({
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
	    scrollY: '82vh',
	    scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select:{
			style: 'single',
            toggleable: false,
            items: 'row',
            info: false
		},
		ajax : {
			url : '<c:url value="/bs/quotationLst"/>',
			type : 'POST',
			data : {
				startDate : function() {return $('#startDate').val();},
				endDate : function() {return $('#endDate').val();},
			},
		},
		columns : [
			{className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(row['deadLine'] > toDay){
						return '진행중';
					}else{
						return '마감';
					}
				}
			},
			{className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(row['submitDate'] != null && row['submitDate'] != ''){
						return '제출';
					} else{
						return '미제출';
					}
				}
			},
			{ data : 'reqType', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						var reqTypeNm = '';
						reqTypeList.forEach(function(item) {
							if(data == item.commonCd){
								reqTypeNm = item.commonNm;
							}
						});
						return reqTypeNm;
					}else return '';
				}
			},
			{ data : 'bidding', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'purchaseType', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'quotationMethod', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'reqNo', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'reqOrder', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'reqTitle', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'reqCt', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else{
						return '0';
					}
				}
			},
			{data : 'selectionMethod', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						var selectionMethodNm = '';
						selectionMethodList.forEach(function(item) {
							if(data == item.commonCd){
								selectionMethodNm = item.commonNm;
							}
						});
						return selectionMethodNm;
					}else return '';
				}
			},
			{ data : 'quotationNo', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return data;
				}
			},
			{ data : 'reqDate', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			{ data : 'deadLine', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data, 'YYYY-MM-DDTHH:mm').format('YYYY-MM-DD HH:mm');
					}else{
						return '-';
					}
				}
			},
			{ data : 'submitDate', className : 'text-center align-middle',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			
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
			let theadHeight = parseFloat($('#quotationTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 197)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#quotationTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#quotationTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	quotationTable.on('column-reorder', function( e, settings, details ) {
		let api = quotationTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#quotationTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#quotationTable').on('click', function(){
// 		let data = quotationTable.row('.selected').data();
	});

	$('#btnSave').on('click',function(){
		status = true;
		if($('#reqType').val() == ''){
			toastr.warning('REQ유형을 선택해주세요');
			$('#reqType').focus();
			status = false;
			return false;
		}
		if($('#reqTitle').val() == ''){
			toastr.warning('REQ제목을 작성해주세요');
			$('#reqTitle').focus();
			status = false;
			return false;
		}
		if($('#purchaseType').val() == ''){
			toastr.warning('유형을 작성해주세요');
			$('#purchaseType').focus();
			status = false;
			return false;
		}
		if($('#quotationMethod').val() == ''){
			toastr.warning('방식을 작성해주세요');
			$('#quotationMethod').focus();
			status = false;
			return false;
		}
		if($('#dealCorpNm').val() == ''){
			toastr.warning('고객사를 선택해주세요');
			$('#btnDealCorpSelect').focus();
			status = false;
			return false;
		}
		if($('#companySelection').val() == ''){
			toastr.warning('업체선정방식을 선택해주세요');
			$('#companySelection').focus();
			status = false;
			return false;
		}
		if($('#reqDate').val() == ''){
			toastr.warning('의뢰일을 지정해주세요');
			$('#reqDate').focus();
			status = false;
			return false;
		}
		if($('#dlDate').val() == ''){
			toastr.warning('마감일을 지정해주세요');
			$('#dlDate').focus();
			status = false;
			return false;
		}
		if($('#expirationDate').val() == ''){
			toastr.warning('견적유효일을 지정해주세요');
			$('#expirationDate').focus();
			status = false;
			return false;
		}

		if(!status){
			
			return false;
		}
		$.ajax({
			url: '<c:url value="/bs/quotationIU"/>',
			type: 'POST',
			data: {
				'idx' : quotationIdx,
				'reqNo' : $('#reqNo').val(),
				'reqType': $('#reqType').val(),
				'reqTitle':$('#reqTitle').val(),
				'reqOrder':$('#order').val(),
				'reqDate':moment($('#reqDate').val()).format('YYYYMMDD'),
				'deadLine':moment($('#dlDate').val()).format('YYYYMMDDHHmm'),
				'submitDate':$('#submitDate').val()==''?'':moment($('#submitDate').val()).format('YYYYMMDD'),
				'expirationDate':moment($('#expirationDate').val()).format('YYYYMMDD'),
				'costUnit': $('#costUnit').val(),
				'bidding': $('#bidding').val(),
				'partialBidYn': $('#partialBidding').val(),
				'incoterms': $('#incoterms').val(),
				'unitPriceAgreementYn': $('#convenantYn').val(),
				'buyerDesc':$('#buyerDesc').val(),
				'dealCorpCd':$('#dealCorpIdx').val(),
				'dealCorpNm':$('#dealCorpNm').val(),
				'purchaseType': $('#purchaseType').val(),
				'purchaseChargr': $('#purchaseChargr').val(),
				'phoneNumber' : $('#phonNum').val(),
				'chargrEmail' : $('#purchaseChargrEmail').val(),
				'rfxMethod' : $('#rfxMethod').val(),
				'selectionMethod':$('#companySelection').val(),
				'quotationMethod':$('#quotationMethod').val(),
				'quotationNo':$('#quotationNo').val(),
				'changeConditionsYn':$('#changeConditions').val(),
				'orderGubun' : $('#receiptGubun').val(),
				'dealCorpDesc':$('#dealCorpDesc').val(),
				'note':$('#note').val(),
			},
			deforeSend: function(){
				$('#my-spinner').show();
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success('저장되었습니다.');
					$('#quotationAddEditModal').modal('hide');
					quotationTable.ajax.reload();
				}else if(res.result == "fail"){
					toastr.warning(res.message);
				}else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#btnDel').on('click', function(){
		if($('#quotationTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#deleteModal').modal('show');
		$('#deleteModal').data('deleteType','REQ');
	});


	// 품목정보 테이블-----------------------------------------------------------------------
	$('#btnInfoNew').on('click',function() {
		$('#quotationInfoTable').DataTable().row.add({
			'idx'			: '',
			'itemType'		: '',
			'itemNm'		: '',
			'produceUnit'	: '',
			'quotationQty'	: '',
			'unitPrice'		: '',
			'quotationPrice': '',
			'leadTime'		: '',
			'attached'		: ''
		}).draw(false);
		$('#btnInfoSave').attr('disabled', false);
	});
	
	let quotationInfoTable = $('#quotationInfoTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
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
		scrollY: '17vh',
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
			url : '<c:url value="/bs/quotationInfoLst"/>',
			type : 'POST',
			data : {
				'reqNo' : function(){return $('#reqNo').val();},
			}
		},
		rowId: 'idx',
		columns : [
			{
				render : function(data, type, row, meta){
					return meta.row+1;
				}, className : 'text-center align-middle', name : 'infoIdx'
			},
			{data : 'itemType', className : 'text-center', name: 'itemType',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return data;
					}else{
						let html = '<input type="text" class="form-control inputGroup" name="itemType" disabled>';
						return html;
					}
				}
			},
			{data : 'itemNm', className : 'text-center align-middle', name : 'itemNm',
				render : function(data, type, row, meta){
					if(data != null && data != ''){
						return data;
					}else{
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="itemNm" disabled>';
						html += '<input type="hidden" name="itemCd">';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="goodsSel()" name="btnGoodsSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{data : 'produceUnit', className : 'text-center align-middle', name : 'produceUnit',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if(data != null && data != ''){
							var produceUnitNm = '';
							produceQtyUnitList.forEach(function(item) {
								if(data == item.commonCd){
									produceUnitNm = item.commonNm;
								}
							});
							return produceUnitNm;
						} else return '';
					} else {
						let html = '';
						html += '<select class="form-select" name="produceUnit">';
						produceQtyUnitList.forEach(function(item) {
							if(item.etc1 != 'N'){
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
						});
						html += '</select><span class="d-none">'+data+'</span>';
					return html;
					}
				}
			},
			{data : 'quotationQty', className : 'text-center align-middle', name : 'quotationQty',
				render : function(data, type, row, meta){
					if(row['idx'] != null && row['idx']){
						if(data != null && data != ''){
							return addCommas(parseFloat(data));
						} else{
							return '0';
						}
					}else{
						let html = '<input type="text" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="0" name="quotationQty">';
						return html;
					}
				}
			},
			{data : 'unitPrice', className : 'text-center align-middle', name : 'unitPrice',
				render : function(data, type, row, meta){
					if(row['idx'] != null && row['idx']){
						if(data != null && data != ''){
							return addCommas(parseFloat(data));
						} else{
							return '0';
						}
					}else{
						let html = '<input type="text" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="0" name="unitPrice">';
						return html;
					}
				}
			},
			{data : 'quotationPrice', className : 'text-center align-middle', name : 'quotationPrice',
				render : function(data, type, row, meta){
					if(row['idx'] != null && row['idx']){
						if(data != null && data != ''){
							return addCommas(parseFloat(data));
						} else{
							return '0';
						}
					}else{
						let html = '<input type="text" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="0" name="quotationPrice">';
						return html;
					}
				}
			},
			{data : 'leadTime', className : 'text-center align-middle', name : 'leadTime',
				render : function(data, type, row, meta){
					if(row['idx'] != null && row['idx']){
						if(data != null && data != ''){
							return addCommas(parseFloat(data));
						} else{
							return '0';
						}
					}else{
						let html = '<input type="text" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="0" name="leadTime">';
						return html;
					}
				}
			},
			{data : 'attached', className : 'text-center align-middle', name : 'attached',
				render : function(data, type,row,meta){
					if(data != null && data != ''){
						return data;
					} else{
						return '-';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#quotationFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#quotationInfoTable tbody').on('click', 'tr', function(){
		infoIdx = quotationInfoTable.row(this).data().idx;
		if(infoIdx != null && infoIdx != ''){
			quotationFileTable.ajax.reload();
			quotationFileTable1.ajax.reload();
			quotationFileTable2.ajax.reload();
			uiProc(false);
		}else{
			uiProc(true);
		}
	});

	$('#btnInfoEdit').on('click', function() {
		$('#btnInfoSave').attr('disabled', false);
		$('#btnInfoEdit').attr('disabled', true);
		$('#quotationInfoTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == quotationInfoTable.column('itemType:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" name="itemType" class="form-control" value="'+value+'" disabled>');
					} else if(index_td == quotationInfoTable.column('itemNm:name').index()) {
						let value = quotationInfoTable.row(tr).data().itemCd;
						let value2 = quotationInfoTable.row(tr).data().itemNm;
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="text" class="form-control inputGroup" name="itemNm" value="'+value2+'" disabled>';
						html += '<input type="hidden" name="itemCd" value="'+value+'">';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="goodsSel()" name="btnGoodsSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					} else if(index_td == quotationInfoTable.column('produceUnit:name').index()) {
						let value = quotationInfoTable.row(tr).data().produceUnit;
						let html = '';
						html += '<select class="form-select" name="produceUnit">';
						produceQtyUnitList.forEach(function(item) {
							if(item.commonCd==value) {
								html +='<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else {
								html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
						});
						html += '</select>';
						$(td).html(html);
					} else if(index_td == quotationInfoTable.column('quotationQty:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" name="quotationQty" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
					} else if(index_td == quotationInfoTable.column('unitPrice:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" name="unitPrice" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
					} else if(index_td == quotationInfoTable.column('quotationPrice:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" name="quotationPrice" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
					} else if(index_td == quotationInfoTable.column('leadTime:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" name="leadTime" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
					}
				}
			});
		});
	});

	$('#btnInfoSave').on('click',function(){
		$('#my-spinner').show();
		let array = [];
		let state = true;
		$('#quotationInfoTable tbody').find('tr').each(function(index, item) {
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			if($(td).find('input').length > 1 && $(item).find('td').find('select').length != 0){
				if($(item).find('td').find('input').length != 1 && $(item).find('td').find('select').length != 0) {
					let td = $(item).find('td');
					let idx = quotationInfoTable.row($(item)).data().idx;
					let itemType = $(td).eq(quotationInfoTable.column('itemType:name').index()).find('input').val();
					let itemNm = $(td).eq(quotationInfoTable.column('itemNm:name').index()).find('input').val();
					let produceUnit = $(td).eq(quotationInfoTable.column('produceUnit:name').index()).find('select').val();
					let quotationQty = $(td).eq(quotationInfoTable.column('quotationQty:name').index()).find('input').val();
					let unitPrice = $(td).eq(quotationInfoTable.column('unitPrice:name').index()).find('input').val();
					let quotationPrice = $(td).eq(quotationInfoTable.column('quotationPrice:name').index()).find('input').val();
					let leadTime = $(td).eq(quotationInfoTable.column('leadTime:name').index()).find('input').val();
	// 				let menuOrder = $(td).eq(menuInfoAdmTable.column('itemType:name').index()).html();
	
					if(itemNm == '') {
						toastr.warning('품명을 선택해주세요.');
						$(td).eq(quotationInfoTable.column('itemNm:name').index()).find('input').focus();
						state = false;
						$('#my-spinner').hide();
						return false;
					}
					
					let obj = new Object();
					obj.idx = idx;
					obj.reqNo = $('#reqNo').val();
					obj.itemType = itemType;
					obj.itemNm = itemNm;
					obj.produceUnit = produceUnit;
					obj.quotationQty = removeCommas(quotationQty);
					obj.unitPrice = removeCommas(unitPrice);
					obj.quotationPrice = removeCommas(quotationPrice);
					obj.leadTime = removeCommas(leadTime);
				    
				    array.push(obj);
			    }
			}
		});

		if(!state) {
			$('#my-spinner').hide();
			return false;
		}
		
		$.ajax({
			url: '<c:url value="/bs/quotationInfoIU"/>',
			type: 'POST',
            async: false,
            datatype: 'json',
            data: JSON.stringify(array),
            contentType : "application/json; charset=UTF-8",
            beforeSend: function() {
            	$('#my-spinner').show();
            },
            success : function(res) {
            	if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					quotationInfoTable.clear().draw();
					quotationInfoTable.ajax.reload();
					$('#btnInfoSave').attr('disabled', true);
					$('#btnInfoEdit').attr('disabled', false);
					uiProc(true);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#btnInfoDel').on('click', function(){
		if($('#quotationInfoTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		let data = quotationInfoTable.row('.selected').data();
		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','INFO');
		} else {
			quotationInfoTable.row('.selected').remove().draw();
		}
	});

	// 품목정보 테이블 끝-------------------------------------------------------------------------

	// 퍼일 테이블----------------------------------------------------------------------------
	let fileFormData = new FormData();
	
	// 관련파일 추가 버튼 클릭
	$('#btnQuotationFileAdd').on('click', function() {
		fileTableId = "quotationFileTable";
// 		fileSaveId = "#btnQuotationFileSave";
		$('#quotationFile').trigger('click');
	});

	// 파일 선택
	$('#quotationFile').on('change',function() {
		let fileInput = document.getElementById("quotationFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
// 		console.log($("#quotationFile")[0].files[0].size);
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#quotationFileTable').DataTable().row.add({
				'idx'		: null,
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1),
				'fileSize'	: Math.ceil(($("#quotationFile")[0].files[i].size)/1024)
			}).draw(false);
			
			fileFormData.append('file-'+uuid,files[i]);
			fileFormData.append('uuid-'+uuid,uuid);
			fileFormData.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
// 		fileNumber = 1;
//     	$('#quotationFileTable tbody tr').each(function(index, item){
//     		$(this).find("div[name=fileIndex]").text(fileNumber);
//     		fileNumber++;
//         });
    	$('#btnQuotationFileSave').attr('disabled', false);
    	$('#quotationFile').val('');
	});

	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	// 관련파일 삭제 버튼 클릭
	$('#btnQuotationFileDel').on('click', function() {
		if( !$('#quotationFileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#quotationFileTable').DataTable().row('.selected').data().idx!=null) {
			fileTableId = 'quotationFileTable';
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = quotationFileTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#quotationFileTable').DataTable().row('.selected').remove().draw();
// 			fileNumber = 1;
// 	    	$('#quotationFileTable tbody tr').each(function(index, item){
// 	    		$(this).find("div[name=fileIndex]").text(fileNumber);
// 	    		fileNumber++;
// 	        });
		}
	});

	let quotationFileTable = $('#quotationFileTable').DataTable({
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
        scrollY: '15vh',
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
			url : '<c:url value="/bs/quotationFileLst"/>',
			type : 'POST',
			data : {
				infoIdx : function() { return infoIdx; },
				inputGubun	 :	'001'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
// 					fileNumber++;
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
			{ data: 'fileSize'},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#quotationFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#btnQuotationFileSave').on('click', function(){
		fileTableId = "quotationFileTable";
		$('#fileSaveBtn').trigger("click");
	});
	
	let fileFormData1 = new FormData();
	
	// 관련파일 추가 버튼 클릭
	$('#btnQuotationFileAdd1').on('click', function() {
		fileTableId = "quotationFileTable1";
// 		fileSaveId = "#btnQuotationFileSave1";
		$('#quotationFile1').trigger('click');
	});

	// 파일 선택
	$('#quotationFile1').on('change',function() {
		let fileInput = document.getElementById("quotationFile1"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
// 		console.log($("#quotationFile")[0].files[0].size);
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#quotationFileTable1').DataTable().row.add({
				'idx'		: null,
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1),
				'fileSize'	: Math.ceil(($("#quotationFile1")[0].files[0].size)/1024)
			}).draw(false);
			
			fileFormData1.append('file-'+uuid,files[i]);
			fileFormData1.append('uuid-'+uuid,uuid);
			fileFormData1.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
// 		fileNumber = 1;
//     	$('#quotationFileTable1 tbody tr').each(function(index, item){
//     		$(this).find("div[name=fileIndex]").text(fileNumber);
//     		fileNumber++;
//         });
    	$('#btnQuotationFileSave1').attr('disabled', false);
    	$('#quotationFile1').val('');
	});



	// 관련파일 삭제 버튼 클릭
	$('#btnQuotationFileDel1').on('click', function() {
		if( !$('#quotationFileTable1 tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#quotationFileTable1').DataTable().row('.selected').data().idx!=null) {
			fileTableId = 'quotationFileTable1';
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = quotationFileTable1.row('.selected').data().uuid;
			fileFormData1.delete('file-'+uuid);
			fileFormData1.delete('uuid-'+uuid);
			fileFormData1.delete('ext-'+uuid);
			$('#quotationFileTable1').DataTable().row('.selected').remove().draw();
// 			fileNumber = 1;
// 	    	$('#quotationFileTable1 tbody tr').each(function(index, item){
// 	    		$(this).find("div[name=fileIndex]").text(fileNumber);
// 	    		fileNumber++;
// 	        });
		}
	});
	
	let quotationFileTable1 = $('#quotationFileTable1').DataTable({
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
        scrollY: '15vh',
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
			url : '<c:url value="/bs/quotationFileLst"/>',
			type : 'POST',
			data : {
				infoIdx : function() { return infoIdx; },
				inputGubun	 :	'002'
			},
		},
        rowId: 'idx',
		columns : [
			{
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
			{ data: 'fileSize'},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#quotationFileTable1_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#btnQuotationFileSave1').on('click', function(){
		fileTableId = "quotationFileTable1";
		$('#fileSaveBtn').trigger("click");
	});
	
	let fileFormData2 = new FormData();
	
	// 관련파일 추가 버튼 클릭
	$('#btnQuotationFileAdd2').on('click', function() {
		$('#quotationFile2').trigger('click');
	});

	// 파일 선택
	$('#quotationFile2').on('change',function() {
		let fileInput = document.getElementById("quotationFile2"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
// 		console.log($("#quotationFile")[0].files[0].size);
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#quotationFileTable2').DataTable().row.add({
				'idx'		: null,
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1),
				'fileSize'	: Math.ceil(($("#quotationFile2")[0].files[0].size)/1024)
			}).draw(false);
			
			fileFormData2.append('file-'+uuid,files[i]);
			fileFormData2.append('uuid-'+uuid,uuid);
			fileFormData2.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
		fileNumber = 1;
    	$('#quotationFileTable2 tbody tr').each(function(index, item){
    		$(this).find("div[name=fileIndex]").text(fileNumber);
    		fileNumber++;
        });
    	$('#btnQuotationFileSave2').attr('disabled', false);
    	$('#quotationFile2').val('');
	});

	// 관련파일 삭제 버튼 클릭
	$('#btnQuotationFileDel2').on('click', function() {
		if( !$('#quotationFileTable2 tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#quotationFileTable2').DataTable().row('.selected').data().idx!=null) {
			fileTableId = 'quotationFileTable2';
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = quotationFileTable2.row('.selected').data().uuid;
			fileFormData2.delete('file-'+uuid);
			fileFormData2.delete('uuid-'+uuid);
			fileFormData2.delete('ext-'+uuid);
			$('#quotationFileTable2').DataTable().row('.selected').remove().draw();
		}
	});

	let quotationFileTable2 = $('#quotationFileTable2').DataTable({
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
        scrollY: '15vh',
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
			url : '<c:url value="/bs/quotationFileLst"/>',
			type : 'POST',
			data : {
				infoIdx : function() { return infoIdx; },
				inputGubun	 :	'003'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return '<div name="fileIndex">'+(meta.row+1)+'</div>';
				}, className: 'text-center align-middle'
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
			{ data: 'fileSize', className : 'text-center align-middle',},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#quotationFileTable2_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#btnQuotationFileSave2').on('click', function(){
		fileTableId = "quotationFileTable2";
		$('#fileSaveBtn').trigger("click");
	});


	let fileData = new FormData
	
	$('#fileSaveBtn').on('click', function() {
		let inputGubun = '';

		if(infoIdx == null || infoIdx == '' || infoIdx == undefined){
			toastr.warning('품목정보를 선택해주세요.');
			return false;
		}
		if(fileTableId == "quotationFileTable"){
			fileData = fileFormData;
			inputGubun = '001';
		}else if(fileTableId == "quotationFileTable1"){
			fileData = fileFormData1;
			inputGubun = '002';
		}else if(fileTableId == "quotationFileTable2"){
			fileData = fileFormData2;
			inputGubun = '003';
		}else{
			return false;
		}
		
		
		let array = [];
		let tableData = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				let saveFileFormData = new FormData();
				let fileSubKeyIndex = 1;
				let fileKeyIndex = 0; 
				for (var key of fileData.keys()) {
					if(fileSubKeyIndex==1) {
						saveFileFormData.append(key, fileData.get(key));
						console.log("fileFormData.get(key) : " + fileData.get(key));
					} else if(fileSubKeyIndex==2) {
						saveFileFormData.append('uuid', fileData.get(key));
						console.log("uuid : " + fileData.get(key));
					} else {
						saveFileFormData.append('ext', fileData.get(key));
						console.log("ext : " + fileData.get(key));
					} 
					fileSubKeyIndex++;
					if(fileSubKeyIndex==3) {
						fileSubKeyIndex = 0;
						fileKeyIndex++;
					}
				}
				fileUpload(saveFileFormData);

				console.log(saveFileFormData);
				
				$('#'+fileTableId+' tbody').find('tr').each(function(index, item) {
					console.log(index);
					let td = $(item).find('td');
					let data = $('#'+fileTableId).DataTable().row($(item)).data();
					let node = $('#'+fileTableId).DataTable().row($(item)).node();
					
					let idx = data.idx;
					let uuid = data.uuid;
					let fileName = data.fileName;
					let fileExt = data.fileExt;
					let fileSize = data.fileSize;
					
					let obj = new Object();
					obj.infoIdx = infoIdx;
					obj.reqNo = $('#reqNo').val();
					obj.idx = idx;
					obj.inputGubun = inputGubun;
					obj.uuid = uuid;
					obj.fileName = fileName;
					obj.fileExt = fileExt;
					obj.fileSize = fileSize;
					array.push(obj);
				});
	
				//원본 데이터
				$('#'+fileTableId+' tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = $('#'+fileTableId).DataTable().row(index).data();
					obj.infoIdx = infoIdx;
					obj.reqNo = $('#reqNo').val();
					obj.idx = data.idx;
					obj.inputGubun = inputGubun;
					obj.uuid = data.uuid;
					obj.fileName = data.fileName;
					obj.fileExt = data.fileExt;
					obj.fileSize = data.fileSize;
					tableData.push(obj);
				});
				
				console.log(array)
// 				console.log(tableData)
// 				array = _.differenceWith(array, tableData, _.isEqual);
// 				console.log(array)

				$.ajax({
					url: '<c:url value="/bs/quotationFileIU"/>',
					type : 'POST',
					async: false,
					datatype: 'json',
					data: JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
						if(res.result == "ok"){
							fileData = new FormData();
							if(fileTableId == "quotationFileTable"){
								fileFormData = new FormData();
								quotationFileTable.ajax.reload(function() {});
								$('#btnQuotationFileSave').attr('disabled', true);
							} else if(fileTableId == "quotationFileTable1"){
								fileFormData1 = new FormData();
								quotationFileTable1.ajax.reload(function() {});
								$('#btnQuotationFileSave1').attr('disabled', true);
							} else if(fileTableId == "quotationFileTable2"){
								fileFormData2 = new FormData();
								quotationFileTable2.ajax.reload(function() {});
								$('#btnQuotationFileSave2').attr('disabled', true);
							}
							quotationInfoTable.clear().draw();
							quotationInfoTable.ajax.reload();
							toastr.success('저장되었습니다.');
						}else if(res.result == 'fail'){
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
// 						$('#projectFile').val('');
					},
				});
			},100)
		})
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		idx = $('#'+fileTableId).DataTable().row('.selected').data().idx
		
		$.ajax({
			url: '<c:url value="/bs/quotationFileDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'		:	idx,
                'infoIdx'	:	infoIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let uuid = $('#'+fileTableId).DataTable().row('.selected').data().uuid;;
				let ext = $('#'+fileTableId).DataTable().row('.selected').data().fileExt;
				fileDelete({uuid:uuid,ext:ext});
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#'+fileTableId).DataTable().row('.selected').remove().draw();
					quotationInfoTable.clear().draw();
					quotationInfoTable.ajax.reload();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	// 파일 테이블 끝------------------------------------------------------------------------- 

	// 고객사 테이블-----------------------------------------------------------------------------------------------------------
	$('#btnDealCorpSelect').on('click', function() {
		dealCorpModalGubun = 'bizOrder';
		$('#dealCorpModal').modal('show');
	});
	$('#dealCorpModal').on('shown.bs.modal', function() {
		dealCorpModalTable.ajax.reload(function() {});
	});

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

	// 수주등록/수정 고객사 모달 붙여넣기 버튼 click
	let dealCorpModalGubun = '';
	$('#btnDealCorpModalPaste').on('click',function(){
		let data = dealCorpModalTable.row('.selected').data();
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});


	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row('.selected').data();
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});
	// 고객사 테이블 끝---------------------------------------------------------------------------------------------------------
	
	// 제품명 테이블-------------------------------------------------------------------------
	function goodsSel(value){
		setTimeout(function() {
			goodsNmModalTable.ajax.reload(function() {});
		}, 200);
		$('#goodsNmModal').modal('show');
	}

	$('#goodsNmModalTable thead tr').clone(true).addClass('filters').appendTo('#goodsNmModalTable thead'); // filter 생성
	let goodsNmModalTable = $('#goodsNmModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'p>>",
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
        scrollY: '80vh',
        scrollX: true,
        scrollCollapse: true,
		pageLength: 10000000,
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
				'goodsTypeCd' 	: function() { return ''; },
				'useYn'	  		: function() { return '001';},
			},
		},
        rowId: 'idx',
		columns : [
			{ //제품유형구분
				data: 'goodsGubun', className : 'text-center', name: 'goodsGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //제품유형코드
				data: 'goodsTypeCd', className : 'text-center', name: 'goodsTypeCd',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //제품유형명
				data: 'goodsTypeNm', className : 'text-center', name: 'goodsTypeNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //No
				render: function(data, type, row, meta) {
					return meta.row+1;
				},
				className : 'text-center',
			},
			{ //제품명
				data: 'goodsNm', className : 'text-center', name: 'goodsNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //비고
				data: 'goodsDesc', className : 'text-center', name: 'goodsDesc',
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
		],
		buttons : [
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#goodsNmModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('overflow','auto');
			
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
				let cell = $('#goodsNmModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#goodsNmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	goodsNmModalTable.on('column-reorder', function( e, settings, details ) {
		let api = goodsTypeModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#goodsNmModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnGoodsNmModalPaste').on('click', function(){
		if( !$('#goodsNmModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		let data = goodsNmModalTable.row('.selected').data();
// 		$('#quotationInfoTable').DataTable().$('tr.selected').find('input[name=]').val(data.goodsTypeCd);
		$('#quotationInfoTable').DataTable().$('tr.selected').find('input[name=itemType]').val(data.goodsTypeNm);
		$('#quotationInfoTable').DataTable().$('tr.selected').find('input[name=itemNm]').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});

	$('#goodsNmModalTable tbody').on('dblclick','tr',function(){
		let data = goodsNmModalTable.row('.selected').data();
		$('#quotationInfoTable').DataTable().$('tr.selected').find('input[name=itemType]').val(data.goodsTypeNm);
		$('#quotationInfoTable').DataTable().$('tr.selected').find('input[name=itemNm]').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});
	// 제품명 테이블 끝---------------------------------------------------------------------------
	
	// 사용자 모달---------------------------------------------------------------------------
	function userSel(value) {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.ajax.reload(function() {});
		}, 200);
		inputStatus = value;
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
		$('#quotationFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
		$('#quotationFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
		$('#quotationFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		
		$('#userModal').modal('hide');
	});

	$('#userModalTable tbody').on('dblclick','tr',function(){
		let data = userModalTable.row('.selected').data();
		$('#quotationFileTable').DataTable().$('tr.selected').find('input[name=userIdx]').val(data.idx);
		$('#quotationFileTable').DataTable().$('tr.selected').find('input[name=userName]').val(data.userName);
		$('#quotationFileTable').DataTable().$('tr.selected').find('div[name=userDepartmentNm]').text(data.userDepartmentNm);
		$('#userModal').modal('hide');
	});
	
	// 사용자 모달 끝-------------------------------------------------------------------------
	
	// 숫자 입력 이벤트-----------------------------------------------------------------------
// 	$(document).on('keyup', "input[name=quotationQty], input[name=unitPrice], input[name=quotationPrice], input[name=leadTime]", function(event){
// 		var preInWhsQtyData = $(this).val();
		
// 		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
// 			$('.number-float0').on("blur keyup", function() {
// 				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
// 			}); 
// 			toastr.warning('숫자만 입력해주세요.');
// 			$(this).val("0");
// 			$(this).select();
// 			event.preventDefault();
// 			return false;
// 		}
// 		$(this).val(addCommas(removeCommas($(this).val())));
// 	});
	
	$(document).on('keyup', 'input[name=quotationQty], input[name=unitPrice]', function(){
		let dTable = $('#quotationInfoTable').DataTable().$('tr.selected')
		if(dTable.find('input[name=quotationQty]').val() != '0' && dTable.find('input[name=quotationQty]').val() != '' && dTable.find('input[name=unitPrice]').val() != '0' && dTable.find('input[name=unitPrice]').val() != ''){
			var sum = 0;
			sum = parseInt(removeCommas(dTable.find('input[name=quotationQty]').val())) * parseInt(removeCommas(dTable.find('input[name=unitPrice]').val()));
			dTable.find('input[name=quotationPrice]').val(addCommas(sum));
		}
	});
	//--------------------------------------------------------------------------------------
	
	function uiProc(flag) {
		$('#btnQuotationFileAdd').attr('disabled', flag);
		$('#btnQuotationFileAdd1').attr('disabled', flag);
		$('#btnQuotationFileAdd2').attr('disabled', flag);
	}
</script>

</body>
</html>
