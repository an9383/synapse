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
	style="grid-template-areas: 'middlecolT middlecolT middlecolT middlecolT middlecolT dragbarVB middlecolM'
								 'dragbarVT dragbarVT dragbarVT dragbarVT dragbarVT dragbarVB middlecolM' 
								 'leftcolB dragbarH middlecolB dragbar rightcolB dragbarVB middlecolM';
								  grid-template-rows: 4fr 4px 3fr;
								  grid-template-columns: 4fr 4px 4fr 4px 4fr 4px 6fr;">
	<input type="file" id="fileFake" style="display: none;" value=""
		multiple>
	<!-- 	<div id="leftcol"> -->
	<!-- 		<div class="container-fluid h-100" style="padding: 5px;"> -->
	<!-- 			<div class="row" id="leftHeader" style="padding-bottom: 5px;"> -->
	<!-- 				<div class="d-flex align-items-center d-flex"> -->
	<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주등록일</label> -->
	<!-- 					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">  -->
	<!-- 					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label> -->
	<!-- 					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">  -->
	<!-- 					<select class="form-select w-auto h-100 me-1 monthAdjust" id="monthAdjust"></select>  -->
	<!-- 					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색"> -->

	<!-- 				</div> -->
	<!-- 				<div class="me-lg-auto"></div> -->
	<!-- 				<div class="d-flex align-items-center justify-content-end"> -->
	<!-- 					<div class="btn-group" role="group" aria-label="Small button group"> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto monthAdjustButton" data-val="3"> -->
	<!-- 							3개월 -->
	<!-- 						</button> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto monthAdjustButton" data-val="6"> -->
	<!-- 							6개월 -->
	<!-- 						</button> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto monthAdjustButton" data-val="12"> -->
	<!-- 							12개월 -->
	<!-- 						</button> -->
	<!-- 					</div>	 -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="row" id="leftSecondHeader" style="padding-bottom: 5px;"> -->
	<!-- 				<div class="d-flex align-items-center d-flex"> -->
	<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label> -->
	<!-- 					<select class="form-select w-auto h-100 me-1" id="searchTarget"> -->
	<!-- 						<option value="">전체</option> -->
	<!-- 						<option value="Y" selected>출고제외</option> -->
	<!-- 					</select> -->
	<!-- 				</div> -->
	<!-- 				<div class="me-lg-auto"></div> -->
	<!-- 				<div class="d-flex align-items-center justify-content-end"> -->
	<!-- 					<div class="btn-group" role="group" aria-label="Small button group"> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearchBizAdm"> -->
	<!-- 							<i class="fa-regular fa-clipboard"></i> -->
	<!-- 						</button> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNewAdm"> -->
	<!-- 							<i class="fa-solid fa-plus"></i> -->
	<!-- 						</button> -->
	<!-- 						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDelAdm" disabled> -->
	<!-- 							<i class="fa-solid fa-trash-can"></i> -->
	<!-- 						</button> -->
	<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"> -->
	<!-- 							<i class="fa-solid fa-caret-left"></i> -->
	<!-- 						</button> -->
	<!-- 					</div> -->
	<!-- 				</div> -->

	<!-- 			</div> -->
	<!-- 			<div class="row"> -->
	<!-- 				<table class="table table-bordered p-0 m-0" id="bizOrderAdmTable"> -->
	<!-- 					<thead class="table-light"> -->
	<!-- 						<tr> -->
	<!-- 							<th class="text-center">수주<br>번호</th> -->
	<!-- 							<th class="text-center">수주처</th> -->
	<!-- 							<th class="text-center">수주<br>상세</th> -->
	<!-- 							<th class="text-center">컨펌<br>대기</th> -->
	<!-- 							<th class="text-center">지시서<br>미발행</th> -->
	<!-- 							<th class="text-center">원지<br>발주</th> -->
	<!-- 							<th class="text-center">미출고</th> -->
	<!-- 						</tr> -->
	<!-- 					</thead> -->
	<!-- 				</table> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<div id="middlecolT" style="max-height: 60vh;">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="topHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<div class="btn-group me-2" role="group"
						aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto"
							id="btnApprovalInfo" disabled>승인정보</button>
					</div>
					<label
						class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주등록일</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="startDate"> <label
						class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31"
						class="form-control w-auto h-100 me-1" id="endDate"> <select
						class="form-select w-auto h-100 me-1 approvalSel" id="approvalSel">
						<option value="">전체</option>
						<option value="Y">승인대기</option>
						<option value="A">승인</option>
						<option value="N">미확정</option>
					</select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group me-3" role="group"
					aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						id="btnBizAdmConfirm" disabled>수주확정</button>
					<button type="button" class="btn btn-outline-light w-auto"
						id="btnBizAdmCancel" disabled>수주취소</button>
					<button type="button" class="btn btn-outline-light w-auto"
						id="btnBizMakeOrder" disabled>제작의뢰</button>
				</div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto "
						style="font-size: 18px !important;" id="btnSearchBizAdm">
						<i class="fa-regular fa-clipboard"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 18px !important;" id="btnNewAdm">
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 18px !important;" id="btnEditAdm" disabled>
						<i class="fa-regular fa-pen-to-square"></i>
					</button>
					<button type="button" class="btn btn-outline-danger w-auto"
						style="font-size: 17px !important;" id="btnDelAdm" disabled>
						<i class="fa-solid fa-trash-can"></i>
					</button>
				</div>
			</div>
			<div class="row" id="rightBody">
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">
<!-- 								<input class="form-check-input" type="checkbox" id="allCheckBox" style="margin: 0px; width: 25px; height: 25px;" disabled> -->
							</th>
							
							<th class="text-center align-middle">국내/해외</th>
							<th class="text-center align-middle">수주일</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객PO번호</th>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">고객발주내용</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">통화</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">수주 금액</th>
							<th class="text-center align-middle">원화 수주 금액</th>
							<th class="text-center align-middle">적용환율</th>
							<th class="text-center align-middle">INCOTERMS</th>
							<th class="text-center align-middle">요청납기일</th>
							<th class="text-center align-middle">매출구분</th>
							<th class="text-center align-middle">계약조건</th>
						</tr>
					</thead>
					<tfoot>
						<tr style="background-color: #6fdb65;">
							<td colspan='12' style="background-color: #6fdb65;">전체합계</td>
							<td id="totalCurrencyAmt" style="background-color: #6fdb65;"></td>
							<td id="totalOrdAmt" style="background-color: #6fdb65;"></td>
<!-- 							<td colspan='2' style="background-color: #6fdb65;"></td> -->
<!-- 							<td id="totalCurrencyAmt" style="background-color: #6fdb65;"></td> -->
<!-- 							<td colspan='2' style="background-color: #6fdb65;"></td> -->
<!-- 							<td id="totalOrdAmt" style="background-color: #6fdb65;"></td> -->
<!-- 							<td colspan='3' style="background-color: #6fdb65;"></td> -->
							<td colspan='5' style="background-color: #6fdb65;"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarVT" onmousedown="StartDrag('VT')"
		ondblclick="minimum(this)"></div>
	<div id="leftcolB" style="max-height: 42vh;">
		<div class="container-fluid" style="padding: 5px; max-height: 40vh;">
			<div class="row">
				<div style="width: 100%;">
					<!-- 					<div class="nav nav-tabs" id="nav-tab2"> -->
					<!-- 						<button class="nav-link active" id="tab3Nav" data-bs-toggle="tab" -->
					<!-- 							data-bs-target="#tab3">공정정보</button> -->
					<!-- 						<button class="nav-link" id="tab4Nav" data-bs-toggle="tab" -->
					<!-- 							data-bs-target="#tab4">사진 및 첨부파일</button> -->
					<!-- 					</div> -->
					<div class="row" id="leftHeader">
						<div
							class="d-flex align-items-center justify-content-space-between w-100"
							style="margin-bottom: 5px;">
							<label
								class="form-label d-flex align-items-center header-label m-0 me-1 h-100">매출정보</label>
							<!-- 									<div class="btn-group me-3" role="group" -->
							<!-- 										aria-label="Small button group"> -->
							<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
							<!-- 											id="btnWorkOrdConfirm" disabled>작업계획확정</button> -->
							<!-- 									</div> -->
							<div class="me-lg-auto"></div>
							<div class="btn-group" role="group"
								aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 18px !important;" id="btnSalesNew" disabled>
									<i class="fa-solid fa-plus"></i>
								</button>
								<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
								<!-- 											style="font-size: 20px !important;" id="btnProcessCopy" -->
								<!-- 											disabled> -->
								<!-- 											<i class="fa-regular fa-copy"></i> -->
								<!-- 										</button> -->
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 20px !important;" id="btnSalesSave" disabled>
									<i class="fa-regular fa-floppy-disk"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 18px !important;" id="btnSalesEdit" disabled>
									<i class="fa-regular fa-pen-to-square"></i>
								</button>
								<button type="button" class="btn btn-outline-danger w-auto"
									style="font-size: 17px !important;" id="btnSalesDel" disabled>
									<i class="fa-solid fa-trash-can"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto"
									style="font-size: 20px !important;" id="btnSalesCancel"
									disabled>
									<i class="fa-solid fa-xmark"></i>
								</button>
							</div>
						</div>
						<table class="table table-bordered p-0 m-0"
							id="bizOrderSalesTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">항목</th>
									<th class="text-center align-middle">발행예정일</th>
									<th class="text-center align-middle">금액</th>
									<th class="text-center align-middle">발행일</th>
									<th class="text-center align-middle">수금예정월</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- 						<div class="tab-pane fade" id="tab4"> -->
					<!-- 							<div style="padding: 5px; display: flex; flex-wrap: 1 1 auto;"> -->
					<!-- 								<div class="row" style="width: 50%;"> -->
					<!-- 									<div -->
					<!-- 										class="d-flex align-items-center justify-content-end w-100" -->
					<!-- 										style="margin-bottom: 5px;"> -->
					<!-- 										<div class="btn-group" role="group" -->
					<!-- 											aria-label="Small button group"> -->
					<!-- 											<button type="button" class="btn btn-outline-light w-auto" -->
					<!-- 												style="font-size: 18px !important;" id="btnFileAdd" disabled> -->
					<!-- 												<i class="fa-solid fa-plus"></i> -->
					<!-- 											</button> -->
					<!-- 											<button type="button" class="btn btn-outline-light w-auto" -->
					<!-- 												style="font-size: 20px !important;" id="btnFileSave" -->
					<!-- 												disabled> -->
					<!-- 												<i class="fa-regular fa-floppy-disk"></i> -->
					<!-- 											</button> -->
					<!-- 											<button type="button" class="btn btn-outline-danger w-auto" -->
					<!-- 												style="font-size: 17px !important;" id="btnFileDel" disabled> -->
					<!-- 												<i class="fa-solid fa-trash-can"></i> -->
					<!-- 											</button> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<table class="table table-bordered p-0 m-0" id="fileTable"> -->
					<!-- 										<thead class="table-light"> -->
					<!-- 											<tr> -->
					<!-- 												<th class="text-center">순번</th> -->
					<!-- 												<th class="text-center">파일명</th> -->
					<!-- 												<th class="text-center">확장자</th> -->
					<!-- 												<th class="text-center">등록일자</th> -->
					<!-- 												<th class="text-center">다운로드</th> -->
					<!-- 											</tr> -->
					<!-- 										</thead> -->
					<!-- 									</table> -->
					<!-- 								</div> -->
					<!-- 								<div id="imgDiv" -->
					<!-- 									style="border: 1px solid rgba(94, 166, 230, 1); padding: 5px; margin-left: 5px; width: 49.6%;"> -->
					<!-- 									<div id="imgView"> -->
					<!-- 										<img id="viewer" class="imgView" -->
					<!-- 											style="object-fit: contain; height: 100px; width: 100px;"> -->
					<!-- 									</div> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

				</div>
			</div>
		</div>
	</div>
	<div id="dragbarH" onmousedown="StartDrag('H')"></div>
	<!-- 	<div id="dragbarVB" onmousedown="StartDrag('VB')" -->
	<!-- 		ondblclick="minimum(this)"></div> -->
	<div id="middlecolB" style="max-height: 42vh;">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="middleHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label
						class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수금정보</label>
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto newBtn"
						style="font-size: 18px !important;" id="btnCollectNew" disabled>
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnCollectSave" disabled>
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto editBtn"
						style="font-size: 18px !important;" id="btnCollectEdit" disabled>
						<i class="fa-regular fa-pen-to-square"></i>
					</button>
					<button type="button" class="btn btn-outline-danger w-auto delBtn"
						style="font-size: 17px !important;" id="btnCollectDel" disabled>
						<i class="fa-solid fa-trash-can"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnCollectCancel" disabled>
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="row" id="rightBody">
				<table class="table table-bordered p-0 m-0"
					id="bizOrderCollectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">항목</th>
							<th class="text-center align-middle">수금일</th>
							<!-- <th class="text-center align-middle">수주<br>확정
							</th> -->
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">구분</th>
							<th class="text-center align-middle">발행일</th>
							<th class="text-center align-middle">만기일</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag('HR')"></div>
	<div id="rightcolB" style="max-height: 42vh;">
		<div class="container-fluid h-100" style="padding: 5px; width: 100%;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center justify-content-end w-100"
					style="margin-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label
							class="form-label d-flex align-items-center header-label m-0 me-1"
							style="height: 32px;">지급정보</label>
					</div>
					<div class="me-lg-auto"></div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
						<!-- 											style="font-size: 18px !important;" id="btnMaterialNew" -->
						<!-- 											disabled> -->
						<!-- 											<i class="fa-solid fa-plus"></i> -->
						<!-- 										</button> -->
						<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
						<!-- 											style="font-size: 20px !important;" id="btnMaterialSave" -->
						<!-- 											disabled> -->
						<!-- 											<i class="fa-regular fa-floppy-disk"></i> -->
						<!-- 										</button> -->
						<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
						<!-- 											style="font-size: 18px !important;" id="btnMaterialEdit" -->
						<!-- 											disabled> -->
						<!-- 											<i class="fa-regular fa-pen-to-square"></i> -->
						<!-- 										</button> -->
						<!-- 										<button type="button" class="btn btn-outline-danger w-auto" -->
						<!-- 											style="font-size: 17px !important;" id="btnMaterialDel" -->
						<!-- 											disabled> -->
						<!-- 											<i class="fa-solid fa-trash-can"></i> -->
						<!-- 										</button> -->
						<!-- 										<button type="button" class="btn btn-outline-light w-auto" -->
						<!-- 											style="font-size: 20px !important;" id="btnMaterialCancel" -->
						<!-- 											disabled> -->
						<!-- 											<i class="fa-solid fa-xmark"></i> -->
						<!-- 										</button> -->
					</div>
				</div>
				<table class="table table-bordered p-0 m-0"
					id="purchaseOrderAdmTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">원재료비율</th>
							<th class="text-center align-middle">총원재료비</th>
							<!-- <th class="text-center align-middle">출력여부</th> -->
							<th class="text-center align-middle">지급(예정)월</th>
							<!-- <th class="text-center align-middle">발주일자</th>
							<th class="text-center align-middle">입고예정일</th> -->
							<!-- <th class="text-center align-middle">원단코드</th> -->
							<th class="text-center align-middle">지급(예정)액</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
		<div id="dragbarVB"></div>
	<div id="middlecolM" style="max-height:90vh;">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="topHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNewProject">
						<i class="fa-solid fa-plus"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSaveProject" disabled>
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
<!-- 					<button type="button" class="btn btn-outline-light w-auto" -->
<!-- 						style="font-size: 18px !important;" id="btnEditProject" disabled> -->
<!-- 						<i class="fa-regular fa-pen-to-square"></i> -->
<!-- 					</button> -->
<!-- 					<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDelProject" disabled> -->
<!-- 						<i class="fa-solid fa-trash-can"></i> -->
<!-- 					</button> -->
				</div>
			</div>
			<div class="card-body p-0">
				<div class="table-responsive">
					<table class="table table-bordered p-0 m-0">
						<colgroup>
							<col width="20%">
							<col width="30%">
							<col width="20%">
							<col width="30%">
						</colgroup>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>시작일자
							</th>
							<td class="text-center align-middle">
								<input type="date" max="9999-12-31" class="form-control inputGroup1" id="projectStartDate" disabled>
							</td>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>목표일자
							</th>
							<td class="text-center align-middle">
								<input type="date" max="9999-12-31" class="form-control inputGroup1" id="targetDate" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>Customer
							</th>
							<td class="text-center align-middle">
								<div class="input-group w-auto" style="display: flex; flex-wrap: 1 1 auto;">
									<input type="text" class="form-control" id="projectCustomerNm" disabled="">
									<input type="hidden" class="inputGroup" id="projectCustomerIdx" value="">
									<button type="button" style="padding: 1px 4px;" class="btn btn-primary input-sub-search inputGroup1" id="btnProjectCustomerSelect" disabled>
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>국내/해외
							</th>
							<td class="text-center align-middle">
								<select class="form-select w-100" id="projectAbroadGubun" disabled></select>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>프로젝트번호
							</th>
							<td class="text-center align-middle">
								<div class="input-group w-auto" style="display: flex; flex-wrap: 1 1 auto;">
									<input type="text" class="form-control" id="bizOrdPrjCd" disabled>
									<button type="button" style="padding: 1px 4px;" class="btn btn-primary input-sub-search inputGroup1" id="btnPrjCdSelect" disabled>
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center align-middle">
								프로젝트명
							</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control inputGroup1" id="bizOrdPrjNm" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>품목유형
							</th>
							<td>
								<div style="display: flex; flex-wrap: 1 1 auto;">
									<input type="hidden" class="inputGroup" id="projectGoodsTypeCd">
									<input type=text class="form-control" id="projectGoodsTypeNm" disabled>
								</div>
							</td>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>품명
								</th>
							<td>
								<div class="input-group w-auto" style="display: flex; flex-wrap: 1 1 auto;">
									<input type=text class="form-control" id="projectGoodsNm" disabled>
									<button type="button" style="padding: 1px 4px;" class="btn btn-primary input-sub-search inputGroup1" id="btnProjectGoodsNmSelect" disabled>
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>수주구분
							</th>
							<td class="text-center align-middle">
								<select class="form-select w-100 inputGroup1" id="projectBizGubun" disabled>
									<option value="" selected>선택</option>
									<option value="001">일반</option>
									<option value="002">선진행</option>
									<option value="003">부품</option>
								</select>
							</td>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>매출구분
							</th>
							<td class="text-center align-middle">
								<select class="form-select w-100 inputGroup1" id="projectSalesGubun" disabled></select>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>매출진행여부
							</th>
							<td class="text-center align-middle">
								<select class="form-select w-100 inputGroup1" id="projectSalesProgressGubun" disabled>
									<option value="" selected>선택</option>
									<option value="001">유상</option>
									<option value="002">무상</option>
									<option value="003">선진행</option>
								</select>
							</td>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>수량
							</th>
							<td class="text-center align-middle">
								<input type="text" class="form-control text-end inputGroup1" value="0" id="projectQty" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>단가
							</th>
							<td class="text-center align-middle">
								<input type="text" onkeyup="numberFormat(this, 'int')" class="form-control text-end inputGroup1" value="0" id="projectCost" disabled>
							</td>
							<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>진행금액</th>
							<td class="text-center align-middle">
								<input type="text" onkeyup="numberFormat(this, 'int')" class="form-control text-end inputGroup1" value="0" id="projectCurrencyAmt" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">
								<span style="color: #ff0000;">*</span>원화진행금액
							</th>
							<td class="text-center align-middle" colspan="3">
								<input type="text" onkeyup="numberFormat(this, 'int')" class="form-control text-end inputGroup1" value="0" id="projectAmt" disabled>
							</td>
						</tr>
					</table>
					<div class="row" id="rightDownBody" style="overflow:auto;">
						<table class="table table-bordered p-0 mt-2" id="bizProjectBizTable">
							<colgroup>
								<col width="9%">
								<col width="16%">
								<col width="8%">
								<col width="17%">
								<col width="8%">
								<col width="17%">
								<col width="8%">
								<col width="17%">
							</colgroup>
						</table>
					</div>
				</div>                	                    
			</div>
			
		</div>
	</div>
</div>
<!-- modal -->
<!-- 수주등록/수정 모달 ====================================================================-->
<div class="modal fade" id="orderAddEditModal" tabindex="-1"
	aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
	<div class="modal-dialog" style="max-width: 70vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">수주등록/수정</h5>
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
					<div class="row" style="padding-bottom: 5px;">
						<table class="table table-bordered p-0 m-0">
							<colgroup>
								<col width="8%">
								<col width="17%">
								<col width="8%">
								<col width="17%">
								<col width="8%">
								<col width="17%">
								<col width="8%">
								<col width="17%">
							</colgroup>
							<tr>
								<td class="align-middle" colspan="8"><b>수주 정보1.</b></td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>수주등록일</th>
								<td class="text-center align-middle"><input type="date"
									max="9999-12-31" class="form-control inputGroup" id="ordDate">
								</td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>수주처</th>
								<td class="text-center align-middle">
									<div class="input-group w-auto" style="display: flex; flex-wrap: 1 1 auto;">
										<input type="text" class="form-control"
											id="dealCorpNm" disabled> <input type="hidden"
											class="inputGroup" id="dealCorpIdx">
										<button type="button"
											style="padding: 1px 4px;"
											class="btn btn-primary input-sub-search"
											id="btnDealCorpSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>수주관리번호</th>
								<td class="text-center align-middle"><input type="text"
									class="form-control" id="bizOrdNo" disabled></td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>국내/해외</th>
								<td class="text-center align-middle"><select
									class="form-select w-100" id="abroadGubun" disabled></select></td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>매출구분</th>
								<td class="text-center align-middle"><select
									class="form-select w-100 inputGroup" id="salesRecogGubun"></select></td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>계약조건</th>
								<td class="text-center align-middle"><select
									class="form-select w-100 inputGroup" id="contractGubun"></select></td>
								<th class="text-center align-middle">비고</th>
								<td class="text-center align-middle" colspan="3"><input type="text"
									class="form-control inputGroup" id="customerDesc" disabled></td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>INCOTERMS</th>
								<td class="text-center align-middle"><select
									class="form-select w-100 inputGroup" id="transCondition"></select>
								</td>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>통화
								</th>
								<td class="text-center align-middle">
									<select class="form-select w-100 inputGroup" id="costUnit"></select>
								</td>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>적용환율
								</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control inputGroup" id="exchangeRate" disabled>
								</td>
								<th colspan="2"></th>
							</tr>
							<tr>
								<td class="align-middle" colspan="7"><b>수주 정보2.</b></td>
								<td></td>
							</tr>
							<tr>
								<th class="text-center align-middle">고객PO번호</th>
								<td class="text-center align-middle"><input type="text"
									class="form-control inputGroup" id="poNo" disabled></td>
								<th class="text-center align-middle">요청납기일</th>
								<td class="text-center align-middle"><input type="date"
									max="9999-12-31" class="form-control inputGroup" id="dueDate">
								</td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>품목유형</th>
								<td>
									<div style="display: flex; flex-wrap: 1 1 auto;">
										<input type="hidden" class="inputGroup" id="goodsTypeCd">
										<input type=text class="form-control" id="goodsTypeNm" disabled>
<!-- 										<button type="button" -->
<!-- 												style="padding: 1px 4px; margin-left: 5px;" -->
<!-- 												class="btn btn-primary input-sub-search" -->
<!-- 												id="btnGoodsTypeSelect"> -->
<!-- 											<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 										</button> -->
									</div>
								</td>
								<th class="text-center align-middle"><span
									style="color: #ff0000;">*</span>품명</th>
								<td>
									<div class="input-group w-auto" style="display: flex; flex-wrap: 1 1 auto;">
<!-- 										<input type="hidden" class="inputGroup" id="goodsNmIdx" name="goodsNmIdx"> -->
										<input type=text class="form-control" id="goodsNm" disabled>
										<button type="button"
												style="padding: 1px 4px;"
												class="btn btn-primary input-sub-search"
												id="btnGoodsNmSelect">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>수량
								</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control text-end inputGroup" id="bizOrdQty" disabled>
								</td>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>단가
								</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control text-end inputGroup" id="bizOrdCost" disabled>
								</td>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>수주금액</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control text-end inputGroup" id="currencyAmt" disabled>
								</td>
								<th class="text-center align-middle">
									<span style="color: #ff0000;">*</span>원화수주금액
								</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control text-end inputGroup" id="bizOrdAmt" disabled>
								</td>
<!-- 								<th class="text-center align-middle"><span -->
<!-- 									style="color: #ff0000;">*</span>프로젝트번호</th> -->
<!-- 								<td class="text-center align-middle"> -->
<!-- 									<div style="display: flex; flex-wrap: 1 1 auto;"> -->
<!-- 										<input type="text" class="form-control" id="bizOrdPrjCd" disabled> -->
<!-- 										<button type="button" -->
<!-- 												style="padding: 1px 4px; margin-left: 5px;" -->
<!-- 												class="btn btn-primary input-sub-search" -->
<!-- 												id="btnPrjCdSelect"> -->
<!-- 											<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 										</button> -->
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 								<th class="text-center align-middle"><span -->
<!-- 									style="color: #ff0000;">*</span>프로젝트명</th> -->
<!-- 								<td class="text-center align-middle"><input type="text" -->
<!-- 									class="form-control inputGroup" id="bizOrdPrjNm" disabled></td> -->
							</tr>
							<tr>
								<th class="text-center align-middle">고객발주내용</th>
								<td class="text-center align-middle" colspan="7"><input type="text"
									class="form-control inputGroup" id="poDesc" disabled></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ================================================================ 수주등록/수정 모달 -->
<!-- 제품코드조회 ====================================================================-->
<div class="modal fade" id="itemInfoAdmListModal" tabindex="-1"
	aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false"
	style="overflow: visible;">
	<div class="modal-dialog" style="max-width: 70vw;">
		<div class="modal-content"
			style="resize: both; overflow: auto; max-width: 95vw; max-height: 100vh;">
			<div class="modal-header">
				<h5 class="modal-title">제품코드조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnitemInfoAdmListSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						data-bs-dismiss="modal" style="font-size: 20px !important;">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="container-fluid h-100" style="padding: 5px;">
					<div class="row" style="padding-bottom: 5px;">
						<div class="d-flex align-items-center d-flex">
							<label
								class="form-label d-flex align-items-center header-label m-0 me-1 h-100">품목구분</label>
							<select class="form-select w-auto h-100 me-3"
								id="searchItemGubun" style="min-width: 70px;">
								<option value="" selected>전체</option>
								<option value="001">제품</option>
								<option value="002">상품</option>
							</select> <label
								class="form-label d-flex align-items-center header-label m-0 me-1 h-100">사용여부</label>
							<select class="form-select w-auto h-100 me-3" id="searchUseYnCd"
								style="min-width: 70px;">
								<option value="" selected>전체</option>
								<option value="Y">사용</option>
								<option value="N">미사용</option>
							</select> <input type="text" class="form-control w-auto h-100 me-1"
								id="itemInfoAdmListSearchAll" style="min-width: 400px;"
								placeholder="통합검색">
						</div>
						<div class="me-lg-auto"></div>
						<div class="d-flex align-items-center justify-content-end">
							<div class="btn-group" role="group"
								aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto "
									style="font-size: 18px !important;"
									id="btnitemInfoAdmListSearch">
									<i class="fa-regular fa-clipboard"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="row">
						<table class="table table-bordered p-0 m-0" id="itemInfoTable">
							<thead class="table-light">
								<tr>
									<th class="text-center" style="padding: 0px;"><input
										class="form-check-input" type="checkbox" id="checkAll"
										style="margin: 0px; width: 25px; height: 25px;"></th>
									<th class="text-center align-middle">고객사</th>
									<!-- <th class="text-center align-middle">제품코드</th> -->
									<th class="text-center align-middle">제품명</th>
									<th class="text-center align-middle">공정수</th>
									<th class="text-center align-middle">칼끝규격</th>
									<th class="text-center align-middle">자재코드</th>
									<th class="text-center align-middle">버전번호</th>
									<th class="text-center align-middle">COLOR</th>
									<th class="text-center align-middle">품목구분</th>
									<th class="text-center align-middle">사용여부</th>
									<th class="text-center align-middle">사이즈</th>
									<th class="text-center align-middle">목형관리번호</th>
									<th class="text-center align-middle">수지판</th>
									<th class="text-center align-middle">타공목형번호</th>
									<th class="text-center align-middle">현재고량</th>
									<th class="text-center align-middle">도수</th>
									<!-- <th class="text-center align-middle">특이사항</th>
									<th class="text-center align-middle">전달사항</th> -->
									<th class="text-center align-middle">묶음법</th>
									<th class="text-center align-middle">포장방법</th>
									<th class="text-center align-middle">작업인쇄기</th>
									<th class="text-center align-middle">명인원지</th>
									<th class="text-center align-middle">관리번호</th>
									<th class="text-center align-middle">검수방법</th>
									<th class="text-center align-middle">큰판작은판</th>
									<th class="text-center align-middle">묶음단위</th>
									<th class="text-center align-middle">포장단위</th>
									<th class="text-center align-middle">일자</th>
									<th class="text-center align-middle">원판수량</th>
									<th class="text-center align-middle">면방</th>
									<th class="text-center align-middle">착인여부점검</th>
									<th class="text-center align-middle">호기</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- ================================================================ 수주등록/수정 모달 -->
<!-- 제품유형 모달 -->
<div class="modal fade" id="goodsTypeModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="goodsTypeModalTitle">제품 유형 조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnGoodsTypeModalPaste">
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
				<table class="table table-bordered p-0 m-0" id="goodsTypeModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">구분</th>
							<th class="text-center">유형코드</th>
							<th class="text-center">유형명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 제품유형 모달 끝 -->
<!-- 제품명 모달 -->
<div class="modal fade" id="goodsNmModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title" id="goodsNmModalTitle">제품명 조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnGoodsNmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow: auto;">
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
<!-- 제품명 모달 -->
<div class="modal fade" id="projectGoodsNmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title" id="projectGoodsNmModalTitle">
					제품명 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectGoodsNmModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow:auto;">
				<table class="table table-bordered p-0 m-0" id="projectGoodsNmTable">
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
<!-- 프로젝트 채번 모달 -->
<div class="modal fade" id="prjCdModal" tabindex="-1" aria-hidden="true"
	style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 80vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prjCdModalTitle">프로젝트 채번</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnPrjCdModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="row modal-body-top text-center mt-2"
				style="justify-content: space-between;">
				<div class="me-lg"></div>
				<span id="prjNumberMake"
					style="font-size: 40px; height: 6vh; margin-left: 100px;">__-_____-_-__</span>
				<select class="form-select w-auto h-100 me-3 monthAdjust"
					id="yearAdjust"></select>
			</div>
			<div class="modal-body">
				<div class="row">
					<div id="leftcol" style="width: 25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="prjTable"
									style="width: 100%;">
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
					<div id="centercol" style="width: 25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="prdTypeTable"
									style="width: 100%;">
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
					<div id="rightcol" style="width: 25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="prdGroupTable"
									style="width: 100%;">
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
					<div id="leftcolM" style="width: 25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="prdListTable"
									style="width: 100%;">
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
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 채번 모달 끝 -->
<!-- 거래처 모달 -->
<div class="modal fade" id="dealCorpSelectModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">발주처 조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;"
						id="btnDealCorpSelectModalPaste">
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
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label
							class="form-label d-flex align-items-center header-label m-0 me-1 h-100">자재
							발주처 조회</label> <select class="form-select w-auto h-100 me-3"
							id="dealCorpSelectGubun" style="min-width: 70px;">
							<option value="matrlCorp">등록된 발주처</option>
							<option value="all">모든 발주처</option>
						</select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group"
							aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto "
								style="font-size: 18px !important;" id="btnDealCorpSelectSearch">
								<i class="fa-regular fa-clipboard"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0"
					id="dealCorpSelectModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">거래처코드</th>
							<th class="text-center">업체명</th>
							<th class="text-center">대표자</th>
							<th class="text-center">사업자번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 거래처 모달 끝 -->
<!-- 거래처 모달 -->
<div class="modal fade" id="customerSelectModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">거래처 조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;"
						id="btnCustomerSelectModalPaste">
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
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label
							class="form-label d-flex align-items-center header-label m-0 me-1 h-100">자재
							발주처 조회</label> <select class="form-select w-auto h-100 me-3"
							id="customerSelectGubun" style="min-width: 70px;">
							<option value="matrlCorp">등록된 발주처</option>
							<option value="all">모든 발주처</option>
						</select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group"
							aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto "
								style="font-size: 18px !important;" id="btnCustomerSelectSearch">
								<i class="fa-regular fa-clipboard"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0"
					id="customerSelectModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">거래처코드</th>
							<th class="text-center">업체명</th>
							<th class="text-center">대표자</th>
							<th class="text-center">사업자번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 거래처 모달 끝 -->
<!-- 수주별발주 추가 자재 모달 ====================================================================================-->
<div class="modal fade" id="matrlSelectModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">자재 조회</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnMatrlSelectModalPaste">
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
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label
							class="form-label d-flex align-items-center header-label m-0 me-1 h-100">자재
							발주처 조회</label> <select class="form-select w-auto h-100 me-3"
							id="matrlSelectGubun" style="min-width: 70px;">
							<option value="001">BOM목록</option>
							<option value="002">모든 자재</option>
						</select>
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group"
							aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto "
								style="font-size: 18px !important;" id="btnMatrlSelectReSearch">
								<i class="fa-regular fa-clipboard"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0"
					id="matrlModalSelectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목구분</th>
							<th class="text-center align-middle">원단코드</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">가로</th>
							<th class="text-center align-middle">세로</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- 공정 작업계획 경고 -->
<div class="modal fade" id="workOrderModal" tabindex="-1"
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
				이미 확정된 작업계획이 있을 경우 내용이 변경될 수 있습니다.<br> 계속하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnWorkOrderModalY"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary"
					id="btnWorkOrderModalN" data-bs-dismiss="modal"
					style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 공정 작업계획 경고 모달 끝 -->

<!-- 수주취소 경고 -->
<div class="modal fade" id="bizDtlCancelModal" tabindex="-1"
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
				<label style="">수주취소 진행시</label> <br> <label class="mt-2"
					style="color: red;">1. 작업지시가 진행된 대기, 진행 중인 공정은 강제 완료처리됩니다.</label>
				<br> <label style="color: red;">&nbsp&nbsp&nbsp단, 진행되지
					않은 작업지시는 삭제됩니다.</label> <br> <label style="color: red;">2. 미확정
					발주건들은 삭제됩니다.</label> <br> <label style="color: red;">3. 더 이상
					수정 및 복구가 불가능합니다.</label> <br> <label class="mt-2">계속하시겠습니까?</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnBizDtlCancelY"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary"
					id="btnBizDtlCancelN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 수주취소 경고 모달 끝 -->
<!-- PO완료 경고 -->
<div class="modal fade" id="bizDtlPoEndModal" tabindex="-1"
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
				<label style="">PO완료 진행시</label> <br> <label class="mt-2"
					style="color: red;">1. 더 이상 수정 및 복구가 불가능합니다.</label> <br>
				<!-- <label style="color: red;">&nbsp&nbsp&nbsp단, 진행되지 않은 작업지시는 삭제됩니다.</label>
				<br>
				<label style="color: red;">2. 미확정 발주건들은 삭제됩니다.</label>
				<br>
				<label style="color: red;">3. 더 이상 수정 및 복구가 불가능합니다.</label>
				<br> -->
				<label class="mt-2">계속하시겠습니까?</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnBizDtlPoEndY"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnBizDtlPoEndN"
					data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- PO완료 경고 모달 끝 -->
<!-- 발주서 -->
<div class="modal fade" id="purchaseViewerModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 40vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5>발주서</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="container-fluid p-0 h-100">
					<a id="modalPurchaseTag" style="width: 100%; height: 90%;" href=""
						target="_blank"></a> <img id="modalPurchaseViewer" class="imgView"
						style="object-fit: contain; width: 100%; height: 90%;" src="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 발주서 모달 끝 -->
<!-- Serial No 모달 -->
<div class="modal fade" id="serialNoModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 30vw;">
		<div class="modal-content"
			style="height: calc(100vh - 35em); margin-top: 32em;">
			<div class="modal-header">
				<h5 class="modal-title" id="serialNoModalTitle">Serial No.</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnSerialNoModalSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow: auto;">
				<table class="table table-bordered p-0 m-0" id="serialNoModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">Serial No.</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- Serial No 끝 -->

<!-- modal -->
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
	let isDraggingVT = false; // 세로 드레그 여부
	let isDraggingVB = false; // 세로 드레그 여부
	let isDraggingH = false; // 가로 드레그 여부
	let isDraggingHR = false; // 가로 드레그 여부
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
		if(type == 'VT') { isDraggingVT = true; SetCursor("n-resize");}
		if(type == 'VB') { isDraggingVB = true; SetCursor("n-resize");}
		if(type == 'H') { isDraggingH = true; SetCursor("ew-resize");}
		if(type == 'HR') { isDraggingHR = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingVT || isDraggingVB || isDraggingH || isDraggingHR) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDraggingVT = false;
			isDraggingVB = false;
			isDraggingH = false;
			isDraggingHR = false;
			SetCursor("auto");
		}
	}

	function minimum(node) {
		let id = $(node).attr('id');

		if(id == 'dragbarVT') {
// 			let dragbarWidth = 4;

// 			let page_height = parseInt($('#page').height()); 			// 전체 높이
// 			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
// 			let middlecol_height = parseInt($('#leftcolB').height());	// 우측 중단
// //			let bottomcol_height = parseInt($('#middlecolB').height());	// 우측 하단

// 			let middlecolT_min_height = 150;	// 우측 상단 최소높이
// 			let middlecol_min_height = 34;	// 우측 중단 최소높이
// //			let bottomcol_min_height = 34;	// 우측 하단 최소높이

// 			let dragbarV_height = 4;

// 			let cols = [];

// 			//최소화기능만 적용
// 			cols = [
// 				page_height - middlecol_min_height - dragbarWidth*2,
// 				dragbarWidth,
// 				middlecol_min_height
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-rows',newColDefn);
		} else if(id == 'dragbarVB') {
// 			let dragbarWidth = 4;

// 			let page_height = parseInt($('#page').height()); 			// 전체 높이
// 			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
// 			let middlecol_height = parseInt($('#middlecol').height());	// 우측 중단
// 			let bottomcol_height = parseInt($('#bottomcol').height());	// 우측 하단

// 			let middlecolT_min_height = 150;	// 우측 상단 최소높이
// 			let middlecol_min_height = 34;	// 우측 중단 최소높이
// 			let bottomcol_min_height = 34;	// 우측 하단 최소높이

// 			let dragbarV_height = 4;

// 			let cols = [];

// 			cols = [
// 				middlecolT_height,
// 				dragbarWidth,
// 				page_height - middlecolT_height - bottomcol_min_height - dragbarWidth*2,
// 				dragbarWidth,
// 				bottomcol_min_height
// 			];
			
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
// 			$('#page').css('grid-template-rows',newColDefn);
		}

//		dataTableDrawAll(); // dataTable 전체 reload
	}
	
	function OnDrag(event) {
// 		if (isDraggingH) { // 좌우 스크롤
// 			let page = document.getElementById("page");
// 			let leftcol = document.getElementById("leftcolB"); // 좌측

// 			let page_height = parseInt($('#page').height()); 		// 전체 높이
// 			let page_width = parseInt($('#page').width()); 			// 전체 넓이
			
// 			let dragbarWidth = 4;
// 			let leftcolMinWidth = 200; // leftcol 최소사이즈
// 			$('#leftHeader').children().each(function(index, item) {
// 				leftcolMinWidth += $(item).width();
// 			});
// 			let leftcol_min_width = leftcolMinWidth; // leftcol 최소사이즈
// 			let centercol_min_width = 400;
// 			let rightcol_min_width = 450; // leftcol 최소사이즈
			
// 			let cursorX = event.clientX;	// 현재 cursor x좌표(좌측에서부터 얼마나 떨어졌는지)
			
// 			let cols = [
// 				Math.min(Math.max(leftcol_min_width, cursorX), page_width - centercol_min_width - rightcol_min_width - dragbarWidth*2),
// 				dragbarWidth,
// 				Math.max(page_width - Math.max(leftcol_min_width, cursorX), centercol_min_width) - dragbarWidth,
// 				dragbarWidth,
// 				rightcol_min_width
// 			];
	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
// 			page.style.gridTemplateColumns = newColDefn;
	
// 			event.preventDefault();
// 		} else if (isDraggingHR) { // 좌우 스크롤
// 			let page = document.getElementById("page");
// 			let middlecol = document.getElementById("middlecolB"); // 좌측

// 			let page_height = parseInt($('#page').height()); 		// 전체 높이
// 			let page_width = parseInt($('#page').width()); 			// 전체 넓이
			
// 			let dragbarWidth = 4;
// 			let middlecolMinWidth = 400; // middlecol 최소사이즈
// 			$('#leftHeader').children().each(function(index, item) {
// 				middlecolMinWidth += $(item).width();
// 			});
// 			let leftcol_min_width = 400;
// 			let middlecol_min_width = middlecolMinWidth; // middlecol 최소사이즈
// 			let rightcol_min_width = 400; // middlecol 최소사이즈
			
// 			let cursorX = event.clientX;	// 현재 cursor x좌표(좌측에서부터 얼마나 떨어졌는지)
			
// 			let cols = [
// 				leftcol_min_width,
// 				dragbarWidth,
// 				Math.min(Math.max(leftcol_min_width, cursorX), page_width - middlecol_min_width - leftcol_min_width - dragbarWidth),
// 				dragbarWidth,
// 				Math.max(page_width - Math.max(middlecol_min_width, cursorX), leftcol_min_width - rightcol_min_width) - dragbarWidth*2
// 			];
	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
// 			page.style.gridTemplateColumns = newColDefn;
	
// 			event.preventDefault();
// 		} else if (isDraggingVT) { // middlecolT와 middlecol 사이
// 			let dragbarWidth = 4;

// 			let page_height = parseInt($('#page').height()); 			// 전체 높이
// 			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
// 			let middlecol_height = parseInt($('#middlecol').height());	// 우측 중단
// 			let bottomcol_height = parseInt($('#bottomcol').height());	// 우측 하단

// 			let middlecolT_min_height = 150;	// 우측 상단 최소높이
// 			let middlecol_min_height = 34;	// 우측 중단 최소높이
// 			let bottomcol_min_height = 34;	// 우측 하단 최소높이

// 			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)

			
// 			let cols = [
// 				Math.min(Math.max(middlecolT_min_height, cursorY), page_height - bottomcol_height - middlecol_min_height - dragbarWidth*2),
// 				dragbarWidth,
// 				page_height - bottomcol_height - dragbarWidth*2 - Math.min(Math.max(middlecolT_min_height, cursorY), page_height - bottomcol_height - middlecol_min_height - dragbarWidth*2)
// // 				dragbarWidth,
// // 				bottomcol_height
// 			];

	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

// 			$('#page').css('grid-template-rows',newColDefn);
	
// 			event.preventDefault();
// 		} else if (isDraggingVB) { // 상하 스크롤
// 			let dragbarWidth = 4;

// 			let page_height = parseInt($('#page').height()); 			// 전체 높이
// 			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
// 			let middlecol_height = parseInt($('#middlecol').height());	// 우측 중단
// 			let bottomcol_height = parseInt($('#bottomcol').height());	// 우측 하단

// 			let middlecolT_min_height = 150;	// 우측 상단 최소높이
// 			let middlecol_min_height = 34;	// 우측 중단 최소높이
// 			let bottomcol_min_height = 34;	// 우측 하단 최소높이

// 			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
			
// 			let cols = [
// 				middlecolT_height,
// 				dragbarWidth,
// 				Math.min(Math.max(cursorY - middlecolT_height - dragbarWidth, middlecol_min_height), page_height - middlecolT_height - dragbarWidth*2 - bottomcol_min_height),
// 				dragbarWidth,
// 				Math.max(bottomcol_min_height, page_height - middlecolT_height - dragbarWidth*2 - Math.max(cursorY - middlecolT_height - dragbarWidth, middlecol_min_height))
// 			];
	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
// 			$('#page').css('grid-template-rows',newColDefn);
	
// 			event.preventDefault();
// 		}
	}
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		if($('#middlecolT').hasClass('d-none')){
			$('#page').css('grid-template-columns', '1fr 4px 1fr 4px 1fr');
			$('#leftcol').removeClass('d-none');
			$('#middlecolT').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '1fr 4px 1fr 4px 1fr');
			$('#leftcol').addClass('d-none');
			$('#middlecolT').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '1fr 4px 1fr 4px 1fr');
			$('#leftcol').removeClass('d-none');
			$('#middlecolT').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '1fr 4px 1fr 4px 1fr');
			$('#leftcol').removeClass('d-none');
			$('#middlecolT').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>

<script>
	WM_init('new');
	WM_init('edit');
	WM_init('salesNew');
	WM_init('fileNew');
	WM_init('collectNew');
	WM_init('bundleNew');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정

	let costUnitList = getCommonCode('시스템', '005'); // 통화
	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	let abroadGubunList = getCommonCode('시스템', '043'); // 국내/해외
	let salesGubunList = getCommonCode('시스템', '044'); // 매출정보구분
	let salesRecogGubunList = getCommonCode('시스템', '045'); // 매출인식구분
	let outsrcGubunList = getCommonCode('일반', '024'); // 외주구분
	let ordStatusList = getCommonCode('시스템', '022'); // 수주상태
	let goodsTypeList = getCommonCode('시스템', '046'); // 제품유형구분
	let collectGubunList = getCommonCode('시스템', '047'); // 수금구분
	let transConditionList = getCommonCode('시스템', '009'); // 운송조건
	let contractGubunList = getCommonCode('시스템', '060'); // 수금구분

	selectBoxAppend(costUnitList, 'costUnit', '', '2'); //통화
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	selectBoxAppend(dealGubunList, 'modalDealGubun1', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus1', '', '1'); //거래상태
	selectBoxAppend(abroadGubunList, 'abroadGubun', '', '2');
	selectBoxAppend(abroadGubunList, 'projectAbroadGubun', '', '2');
	selectBoxAppend(salesRecogGubunList, 'salesRecogGubun', '', '2');
	selectBoxAppend(transConditionList, 'transCondition', '', '2');
	selectBoxAppend(salesRecogGubunList, 'projectSalesGubun', '', '2');
	selectBoxAppend(contractGubunList, 'contractGubun', '', '2'); //거래구분

	let purchaseFormData = new FormData(); //발주서파일 전용 폼데이터
    
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let bizOrdAdmIdxVal = '';
	let bizOrdDtlIdxVal = '';
	let customerIdxVal = '';
	let ordQtyVal = '';
	let workPlaceIdxVal = '';
	let bizOrdAdmTrId = '';
	let bizOrdDtlTrId = '';
	let bizOrdAdmUuid = '';
	let bizOrdAdmExt = '';
	let serialCnt = 0;
 	let bizOrdSalesIdxVal = '';
 	let collectSubVal = '';

	let prjVal = '_';
	let prdTypeVal = '_';
	let prdGroupVal = '_';
	let prdListVal = '____';

	let gubunIdx = '';

	let now = new Date();
	let now_year = now.getFullYear();
	$('#basicCarry').text('당해년도');
	$('#beforePub').text('당해년도이전');
	$('#afterPub').text('당해년도이후');
	let baseYear = now_year.toString().substring(2);
	let prjNumSeq = '__';

	let prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;

	// 2005년 부터 올해까지
	for(var i = now_year; i >= 2010; i--){
		if(i == now_year){
			$("#yearAdjust").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
		} else {
			$("#yearAdjust").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
		}
	}

	let itemSelectList = [];

	let prcssEquipList = [];
	$.ajax({
		url : '<c:url value="/em/prcssEquipInfoListAll"/>',
		type : 'POST',
		async: false,
		data : {
			prcssEquipSelectGubun : function(){ return 'prcssAll';}
		},
		success : function(res) {
			if (res.result == "ok") { //응답결과
				prcssEquipList = res.data;
			} else if(res.result == 'fail') {
				toastr.warning(res.message);
			} else {
				toastr.error(res.message);
			}
			$('#my-spinner').hide();
		}
	});
	let workPlaceList = [];
	$.ajax({
		url : '<c:url value="/sm/workplaceLst"/>',
		type : 'POST',
		async : false,
		data : {
			'useYnCd' : function() { return '001'; }
		},
        beforeSend: function() {
        	$('#my-spinner').show();
        },
		success : function(res) {
			if (res.result == "ok") { //응답결과
				let data = res.data;
				workPlaceList = data;
			} else if(res.result == 'fail') {
				toastr.warning(res.message);
			} else {
				toastr.error(res.message);
			}
			$('#my-spinner').hide();
		}
	});

	var perUserIdx =  "${userIdx}";
	var perMenuId =  'bssc0010';
	// 메뉴권한관리 페이지-사용자별 권한 목록조회
// 	let permissionList = getPermission(perUserIdx, perMenuId);	

// 	permissionList.forEach(function(item){
// 	    if(item.createAuth != 'Y'){
// 		    $('.newBtn').addClass('d-none');
// 	    }
// 	    if(item.readAuth != 'Y'){

// 		}
// 		if(item.updateAuth != 'Y'){
// 			$('.editBtn').addClass('d-none');
// 		}
// 		if(item.deleteAuth != 'Y'){
// 			$('.delBtn').addClass('d-none');
// 		}
// 	});

// 	window.addEventListener('DOMContentLoaded', function() {
// 	    var table = document.getElementById('bizOrderAdmTable');
// 	    var tbody = table.getElementsByTagName('tbody')[0];
// 	    var tfoot = table.getElementsByTagName('tfoot')[0];
// 	    var tbodyWidth = tbody.offsetWidth;

// 	    tfoot.style.width = tbodyWidth + 'px';
// 	  });
	
	// 수주관리 목록조회
	$('#bizOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmTable thead'); // filter 생성
	let bizOrderAdmTable = $('#bizOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>",
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
        scrollY: '40vh',
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
			url : '<c:url value="/bs/bizOrderAdmPureLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				searchTarget	: function() { return $('#approvalSel').val(); },
				nowYear			: function() { return now_year; },
				abroadGubun		: function() { return '002'; },
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle', name : "checkBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="checkBox" id="chk-'+meta.row+'" style="margin: 0px; width: 25px; height: 25px;" disabled>';
				}
			},
			//국내/해외
			{ data: 'abroadGubun', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					var abroadGubun = '';
					abroadGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	abroadGubun = item.commonNm;
					    }
					});
					return abroadGubun;
				}	
			},
			//수주일
			{ data: 'ordDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
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
			//고객PO번호
			{ data: 'poNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//수주처
			{ data: 'dealCorpNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
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
			//품명
			{ data: 'goodsNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//고객발주내용
			{ data: 'poDesc', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//수량
			{ data: 'ordQty', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			//통화
			{ data: 'costUnit', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					var costUnit = '';
					costUnitList.forEach(function(item){
					    if(item.commonCd == data){
					    	costUnit = item.commonNm;
					    }
					});
					return costUnit;
				}	
			},
			//단가
			{ data: 'ordCost', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			//외화금액
			{ data: 'currencyAmt', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
					} else {
						return "";
					}
				}	
			},
			//수주금액(최초수주액)
			{ data: 'ordAmt', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return "";
					}
				}	
			},
			//환율
			{ data: 'exchangeRate', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
					} else {
						return "";
					}
				}	
			},
			//INCOTERMS
			{ data: 'transCondition', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					var transCondition = '';
					transConditionList.forEach(function(item){
					    if(item.commonCd == data){
					    	transCondition = item.commonNm;
					    }
					});
					return transCondition;
				}	
			},
			//납기일
			{ data: 'dueDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			//매출구분
			{ data: 'salesRecogGubun', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					var salesRecogGubun = '';
					salesRecogGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	salesRecogGubun = item.commonNm;
					    }
					});
					return salesRecogGubun;
				}	
			},
			//계약조건
			{ data: 'contractGubun', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					var contractGubun = '';
					contractGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	contractGubun = item.commonNm;
					    }
					});
					return contractGubun;
				}	
			},
// 			//Project No.
// 			{ data: 'prjCd', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//수주처
// 			{ data: 'dealCorpNm', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//고객발주No
// 			{ data: 'poNo', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//담당자
// 			{ data: 'userName', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//인보이스
// 			{ data: 'inVoice', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//바이어
// 			{ data: 'buyer', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//국가
// 			{ data: 'country', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//품목유형
// 			{ data: 'goodsTypeNm', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return data;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//품명
// 			{ data: 'goodsNm', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//수량
// 			{ data: 'ordQty', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//단가
// 			{ data: 'ordCost', className : 'text-end align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
						
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//통화
// 			{ data: 'costUnit', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					var costUnit = '';
// 					costUnitList.forEach(function(item){
// 					    if(item.commonCd == data){
// 					    	costUnit = item.commonNm;
// 					    }
// 					});
// 					return costUnit;
// 				}	
// 			},
// 			//외화금액
// 			{ data: 'currencyAmt', className : 'text-end align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//환율기준일
// 			{ data: 'exchangeDate', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}
// 			},
// 			//환율
// 			{ data: 'exchangeRate', className : 'text-end align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//수주액
// 			{ data: 'ordAmt', className : 'text-end align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommasNoDot(parseFloat(data))+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
// 			//운송조건
// 			{ data: 'transCondition', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					var transCondition = '';
// 					transConditionList.forEach(function(item){
// 					    if(item.commonCd == data){
// 					    	transCondition = item.commonNm;
// 					    }
// 					});
// 					return transCondition;
// 				}	
// 			},
// 			//선적일/출고일
// 			{ data: 'shipmentDate', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}
// 			},
// 			//비고
// 			{ data: 'abroadDesc', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 					} else {
// 						return "";
// 					}
// 				}
// 			},
// 			//Serial No.
// 			{ data: 'serialNo', className : 'text-center align-middle',
// 				render : function(data, type, row, meta) {
// 					if(data != null){
// 						var parts = data.split(",");
// 		            	if (parts.length > 3) {
// 		           			for (var i = 3; i < parts.length; i++) {
// 		                 		parts[i] = "...";
// 		               		}
// 		              	}
// 		              	var html = '';
// 						html += '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;" class="d-none">'+data+'</div>';
// 						html += '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+parts.join(",");+'</div>';
						
// 						return html;
// 					} else {
// 						return "";
// 					}
// 				}	
// 			},
		],
		columnDefs : [
			{
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
		],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
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
			let theadHeight = parseFloat($('#bizOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
 			let leftHeader = parseFloat($('#leftHeader').css('height'));
 			let leftSecondHeader = parseFloat($('#leftSecondHeader').css('height'));

			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - leftHeader - leftSecondHeader - 43)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			let data = api.data();
			
			let totalQty = 0;
			let totalOrdAmt = 0;
			let totalCurrencyAmt = 0;

			for(var i=0;i<data.length;i++) {
				totalQty += parseFloat(data[i].ordQty==null?0:data[i].ordQty);
				totalCurrencyAmt += parseFloat(data[i].ordCost) * parseFloat(data[i].ordQty);
				totalOrdAmt += parseFloat(data[i].ordAmt==null?0:data[i].ordAmt);
			}

// 			$('#totalQty').text(addCommas(totalQty));
			$('#totalCurrencyAmt').text(addCommasNoDot(totalCurrencyAmt));
			$('#totalOrdAmt').text(addCommasNoDot(totalOrdAmt));

			$('#bizOrderAdmTable tfoot').remove();
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID

			$('.dataTables_scrollBody').css({
		        'overflow': 'hidden',
		        'border': '0'
		    });

		    // Enable TFOOT scoll bars
		    $('.dataTables_scrollFoot').css('overflow', 'auto');

		    // Sync TFOOT scrolling with TBODY
		    $('.dataTables_scrollFoot').on('scroll', function () {
		        $('.dataTables_scrollBody').scrollLeft($(this).scrollLeft());
		    });                    

			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});

			bizOrderAdmTable.draw(false);
			setTimeout(function(){
				$('#bizOrderAdmTable tfoot').remove();
			}, 150);
		},
	});
	// dataTable colReorder event
	bizOrderAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 수주관리 메인 조회버튼 click
	$('#btnSearchBizAdm').on('click', function() {
		bizOrderAdmTable.row('.selected').deselect();
		bizOrderSalesTable.row('.selected').deselect();
		bizOrderCollectTable.row('.selected').deselect();
		bizOrdAdmIdxVal = '';
		bizOrdDtlIdxVal = '';
		itemIdx = '';

		bizOrderAdmTable.ajax.reload();
		bizOrderSalesTable.ajax.reload();
		bizOrderCollectTable.ajax.reload();

		if($('#btnNewProject').attr('disabled') == 'disabled'){
			$('#bizProjectBizTable').empty();
		}
		$('.inputGroup1').attr('disabled', true);
	});

	// 수주관리 메인 항목 선택
	$('#bizOrderAdmTable tbody').on('click', 'tr', function() {
		let idx = bizOrderAdmTable.row(this).data().idx;
		if(WMCheck('salesNew')) { // 공정 등록중일 경우
			setWM('salesNew', 'idx', idx);
			setWM('salesNew', 'gubun', bizOrderAdmTable);
			return false;
		} 
		if(WMCheck('collectNew')) { //수금정보 등록중일 경우
			setWM('collectNew', 'idx', idx);
			setWM('collectNew', 'gubun', bizOrderAdmTable);
			return false;
		}
		let data = bizOrderAdmTable.row(this).data();
		
// 		bizOrdAdmUuid = data.purchaseUuid;
// 		bizOrdAdmExt = data.purchaseExt
		
		bizOrdAdmIdxVal = idx;
		bizOrderSalesTable.row('.selected').deselect();
		
		bizOrderSalesTable.ajax.reload(function(){},false);
// 		bizOrderCollectTable.ajax.reload(function(){},false);
		
		itemIdx = 0;
		bizOrdDtlIdxVal = 0;

		$('#btnNewAdm').attr('disabled', false);
		$('#btnEditAdm').attr('disabled', false);
		$('#btnDelAdm').attr('disabled', false);

		$('#btnSalesNew').attr('disabled', false); // 매출정보 신규 버튼
// 		$('#btnCollectNew').attr('disabled', false); // 수금정보 신규버튼
		$('#btnBizAdmConfirm').attr('disabled', false);
		$('#btnBizAdmCancel').attr('disabled', false);
		$('#btnSalesEdit').attr('disabled', true); // 수정 버튼
		$('#btnSalesDel').attr('disabled', true); // 삭제 버튼
		$('#btnSalesCancel').attr('disabled', true); // 취소 버튼
		$('#btnCollectNew').attr('disabled', true); // 수금정보 신규버튼
		$('#btnCollectSave').attr('disabled', true); // 저장 버튼
		$('#btnCollectEdit').attr('disabled', true); // 수정 버튼
		$('#btnCollectDel').attr('disabled', true); // 삭제 버튼
		$('#btnCollectCancel').attr('disabled', true); // 취소 버튼
	});

	// 신규 버튼 click
	$('#btnNewAdm').on('click', function() {
		$('.inputGroup').val('');
		bizOrdAdmIdxVal = '';

		WM_action_ON('new', 'workingWarningModal');

		if(bizOrderAdmTable.row('.selected').length != 0){
			let data = bizOrderAdmTable.row('.selected').data();

			$('#ordDate').val(moment(data.ordDate).format('YYYY-MM-DD'));
			$('#dealCorpIdx').val(data.dealCorpIdx);
			$('#dealCorpNm').val(data.dealCorpNm);
			$('#bizOrdNo').val(data.bizOrdNo);
			$('#abroadGubun').val(data.abroadGubun);
			$('#salesRecogGubun').val(data.salesRecogGubun);
			$('#contractGubun').val(data.contractGubun);
			$('#customerDesc').val(data.customerDesc);
			$('#transCondition').val(data.transCondition);
			$('#costUnit').val(parseInt(data.costUnit));
			$('#exchangeRate').val(parseFloat(data.exchangeRate));

		} else {
			$('#ordDate').val(moment().format('YYYY-MM-DD'));
			$('#dealCorpIdx').val('');
			$('#dealCorpNm').val('');
			$('#bizOrdNo').val('자동채번');
			$('#abroadGubun').val('002');
			$('#salesRecogGubun').val('');
			$('#contractGubun').val('');
			$('#customerDesc').val('');
			$('#transCondition').val('');
			$('#costUnit').val('');
			$('#exchangeRate').val('0');
			
		}

		$('#poNo').val('');
		$('#dueDate').val('');
		$('#goodsTypeNm').val('');
		$('#goodsNm').val('');
		$('#bizOrdQty').val('0');
		$('#bizOrdCost').val('0');
		$('#bizOrdAmt').val('0');
		$('#currencyAmt').val('0');
		$('#poDesc').val('');

		$('.inputGroup').attr('disabled', false);
		
		$('#orderAddEditModal').modal('show');
	});

	// 수정 버튼 click
	$('#btnEditAdm').on('click', function() {
		if(bizOrderAdmTable.row('.selected').data() == undefined) {
			toastr.warning('수주를 선택해주세요.');
			return false;
		}

		WM_action_ON('edit', 'workingWarningModal');

		let idx = bizOrderAdmTable.row('.selected').data().idx;
		let data = bizOrderAdmSel(idx);

		bizOrdAdmIdxVal = data.idx;

		$('#ordDate').val(moment(data.ordDate,'YYYYMMDD').format('YYYY-MM-DD'));
		$('#dealCorpIdx').val(data.dealCorpIdx);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#bizOrdNo').val(data.bizOrdNo);
		$('#poNo').val(data.poNo);
		$('#dueDate').val(moment(data.dueDate,'YYYYMMDD').format('YYYY-MM-DD'));
		$('#customerDesc').val(data.customerDesc);
		$('#salesRecogGubun').val(data.salesRecogGubun);
		$('#goodsTypeCd').val(data.goodsTypeCd);
		$('#goodsTypeNm').val(data.goodsTypeNm);
		$('#goodsNm').val(data.goodsNm);
// 		$('#abroadGubun').val(data.abroadGubun);
		$('#bizOrdQty').val(addCommas(data.ordQty));
		$('#currencyAmt').val(addCommasNoDot(parseFloat(data.ordQty) * parseFloat(data.ordCost)));
		$('#bizOrdCost').val(addCommasNoDot(parseFloat(data.ordCost)));
		$('#bizOrdAmt').val(addCommasNoDot(parseFloat(data.ordAmt)));
		$('#bizOrdPrjCd').val(data.prjCd);
		$('#bizOrdPrjNm').val(data.prjNm);
		$('#transCondition').val(data.transCondition);
		$('#costUnit').val(data.costUnit);
		$('#exchangeRate').val(data.exchangeRate);

		//고정
		$('.inputGroup').attr('disabled',false);
		$('#ordDate').attr('disabled',true);
		$('#btnDealCorpSelect').attr('disabled',true);
// 		$('#btnGoodsTypeSelect').attr('disabled',true);
		$('#btnGoodsNmSelect').attr('disabled',true);   
		
		$('#orderAddEditModal').modal('show');

	});

	//수주완료
	$('#btnBizAdmConfirm').on('click', function() {
		$.ajax({
			url: '<c:url value="/bs/bizOrderAdmConfirm"/>',
            type: 'POST',
            data: {
                'idx'	:	bizOrdAdmIdxVal,
                'confirmYn':	'Y',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('완료처리 되었습니다.');
					bizOrderAdmTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	//수주취소
	$('#btnBizAdmCancel').on('click', function() {
		$.ajax({
			url: '<c:url value="/bs/bizOrderAdmConfirm"/>',
            type: 'POST',
            data: {
                'idx'	:	bizOrdAdmIdxVal,
                'confirmYn':	'N',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('취소처리 되었습니다.');
					bizOrderAdmTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'salesNew'){ //공정 등록중이었을 때
			$('#btnProcessSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'fileNew'){ //파일 등록중이었을 때
			$('#btnFileSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'collectNew'){ //자재 등록중이었을 때
			$('#btnMaterialSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'bundleNew'){ //자재 등록중이었을 때
			$('#btnBundleSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				userTable.row('#'+idx).select();
				$(userTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
			}
			
			return false;
		} else if(WMlastIdx == 'salesNew'){ //공정 등록중이었을 때 
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				let gubun = getWM(WMlastIdx, 'gubun');
				WM_action_OFF('new');
				WM_action_OFF('edit');
				WM_action_OFF('salesNew');
				WM_action_OFF('fileNew');
				WM_action_OFF('collectNew');
				setWM(WMlastIdx, 'idx', '');
				gubun.row('#'+idx).select();
				$(gubun.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼	

				$('#btnSalesSave').attr('disabled', true);
				$('#btnSalesDel').attr('disabled', true);
				$('#btnSalesCancel').attr('disabled', true);
				
				$('#btnFileAdd').attr('disabled',true);
				$('#btnFileDel').attr('disabled',true);
			}
		} else if(WMlastIdx == 'fileNew'){ //파일등록중이었을 때 
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				let gubun = getWM(WMlastIdx, 'gubun');
				WM_action_OFF('new');
				WM_action_OFF('edit');
				WM_action_OFF('salesNew');
				WM_action_OFF('fileNew');
				WM_action_OFF('collectNew');
				setWM(WMlastIdx, 'idx', '');
				gubun.row('#'+idx).select();
				$(gubun.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼				
				
				$('#btnFileAdd').attr('disabled',true);
				$('#btnFileDel').attr('disabled',true);
			}
			return false;
		} else if(WMlastIdx == 'collectNew'){ //자재등록중이었을 때 
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				let gubun = getWM(WMlastIdx, 'gubun');
				WM_action_OFF('new');
				WM_action_OFF('edit');
				WM_action_OFF('salesNew');
				WM_action_OFF('fileNew');
				WM_action_OFF('collectNew');
				setWM(WMlastIdx, 'idx', '');
				gubun.row('#'+idx).select();
				$(gubun.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼	

				$('#btnCollectSave').attr('disabled', true);
				$('#btnCollectDel').attr('disabled', true);
				$('#btnCollectCancel').attr('disabled', true);		
				
				$('#btnFileAdd').attr('disabled',true);
				$('#btnFileDel').attr('disabled',true);
			}
			return false;
		}
	});

	// 수주관리 메인 삭제버튼 click
	$('#btnDelAdm').on('click', function() {
		if($('#bizOrderAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let idx = bizOrderAdmTable.row('.selected').data().idx;
		$.ajax({
			url: '<c:url value="/bs/bizOrderAdmAbroadDel"/>',
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
					$('#btnEditAdm').attr('disabled', true);
					$('#btnDelAdm').attr('disabled', true);
					bizOrderAdmTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	

	// 수주관리 매출정보조회
	$('#bizOrderSalesTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderSalesTable thead'); // filter 생성
	let bizOrderSalesTable = $('#bizOrderSalesTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '29vh',
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
			url : '<c:url value="/bs/bizOrderDtlLst"/>',
			type : 'POST',
			data : {
// 				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
// 				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				'bizOrdAdmIdx'	: function() { return bizOrdAdmIdxVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'salesGubun', className : 'text-center align-middle', name : 'salesGubun',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						var salesGubun = '';
						salesGubunList.forEach(function(item){
						    if(item.commonCd == data){
						    	salesGubun = item.commonNm;
						    }
						});
						return salesGubun;
					} else {
						let html = '';
						html += '<select name="salesGubun" class="form-select inputGroup" style="min-width: 100px;">';
						html +='	<option value="">선택</option>';
						salesGubunList.forEach(function(item) {
							html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});							
						html += '</select>';
						return html;
					}
				}	
			},
			{ data: 'publishPreDate', className : 'text-center align-middle', name : 'publishPreDate',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '<input type="date" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'publishAmt', className : 'text-center align-middle', name : 'publishAmt',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return '<input type="text" class="form-control" name="publishAmt"><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'publishDate', className : 'text-center align-middle', name : 'publishDate',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if(data != ''){
							return moment(data).format('YYYY-MM-DD');
						} else {
							return '-';
						}
					} else {
						return '<input type="date" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'collectMonth', className : 'text-center align-middle', name : 'collectMonth',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data
					} else {
						return '<input type="month" class="form-control"><span class="d-none">'+data+'</span>';
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
			let theadHeight = parseFloat($('#bizOrderSalesTable_wrapper').find('.dataTables_scrollHead').css('height'));
 			let leftHeader = parseFloat($('#leftHeader').css('height'));
 			let leftSecondHeader = parseFloat($('#leftSecondHeader').css('height'));

			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - leftHeader - leftSecondHeader - 43)+'px');
			
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
				let cell = $('#bizOrderSalesTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderSalesTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});

			bizOrderSalesTable.draw(false);
		},
	});
	// dataTable colReorder event
	bizOrderSalesTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderSalesTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderSalesTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 수주관리 매출정보 항목 선택
	$('#bizOrderSalesTable tbody').on('click', 'tr', function() {
		let idx = bizOrderSalesTable.row(this).data().idx;
		bizOrdSalesIdxVal = bizOrderSalesTable.row(this).data().idx;
		collectSubVal = bizOrderSalesTable.row(this).data().salesGubun;

		$('#bizOrderCollectTable').DataTable().ajax.reload(function(){},false);
		
		$('#btnSalesEdit').attr('disabled', false); // 수정 버튼
		$('#btnSalesDel').attr('disabled', false); // 삭제 버튼
		$('#btnSalesCancel').attr('disabled', true); // 취소 버튼

		$('#btnCollectNew').attr('disabled', false); // 수금정보 신규버튼
		$('#btnCollectSave').attr('disabled', true); // 저장 버튼
		$('#btnCollectEdit').attr('disabled', true); // 수정 버튼
		$('#btnCollectDel').attr('disabled', true); // 삭제 버튼
		$('#btnCollectCancel').attr('disabled', true); // 취소 버튼
	});

	// 매출정보 신규 버튼 click
	$('#btnSalesNew').on('click', function() {
		WM_action_ON('salesNew', 'workingWarningModal');
		let col_filter_text = [];
		$('#bizOrderSalesTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		bizOrderSalesTable.row.add({
			'idx'			:	'',
			'salesGubun'	:	col_filter_text[0],
			'publishPreDate':	col_filter_text[1],
			'publishAmt'	:	col_filter_text[2],
			'publishDate'	:	col_filter_text[3],
			'collectMonth'	:	col_filter_text[4],
		}).draw(false);
		
		bizOrderSalesTable.colReorder.disable();

		$('#btnSalesSave').attr('disabled', false); // 저장 버튼
		$('#btnSalesEdit').attr('disabled', true); // 수정 버튼
		$('#btnSalesDel').attr('disabled', false); // 삭제 버튼
		$('#btnSalesCancel').attr('disabled', false); // 취소 버튼
	});

	// 매출정보 수정 버튼 click
	$('#btnSalesEdit').on('click', function() {
		$('#bizOrderSalesTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#bizOrderSalesTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == bizOrderSalesTable.column('salesGubun:name').index()) {
							let value = bizOrderSalesTable.row(tr).data().salesGubun;
							var html = '';
							html += '<select name="salesGubun" class="form-select inputGroup" style="min-width: 100px;">';
							html +='	<option value="">선택</option>';
							salesGubunList.forEach(function(item) {
								if(item.commonCd == value){
									html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});							
							html += '</select>';
							$(td).html(html);
						} else if(index_td == bizOrderSalesTable.column('publishPreDate:name').index()) {
							let value = bizOrderSalesTable.row(tr).data().publishPreDate;
							$(td).html('<input type="date" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == bizOrderSalesTable.column('publishDate:name').index()) {
							let value = bizOrderSalesTable.row(tr).data().publishDate;
							$(td).html('<input type="date" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == bizOrderSalesTable.column('collectMonth:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="month" class="form-control" value="'+moment(value).format('YYYY-MM')+'">');
						} else {
							let value = $(td).text();
							$(td).html('<input type="text" class="form-control" value="'+addCommas(value)+'">');
						}
					}
				})
			}
		});

		bizOrderSalesTable.colReorder.disable();
		bizOrderSalesTable.draw(false);

		$('#btnSalesNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSalesSave').attr('disabled', false); // 저장 버튼
		$('#btnSalesDel').attr('disabled', false); // 삭제 버튼
		$('#btnSalesCancel').attr('disabled', false); // 취소 버튼
	});

	// 매출정보 삭제버튼 click
	$('#btnSalesDel').on('click', function() {
		if($('#bizOrderSalesTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let idx = bizOrderSalesTable.row('.selected').data().idx;
		$.ajax({
			url: '<c:url value="/bs/bizOrderSalesDel"/>',
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
					$('#btnSalesEdit').attr('disabled', true);
					$('#btnSalesDel').attr('disabled', true);
					bizOrderSalesTable.ajax.reload();
					bizOrderAdmTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 매출정보 저장 버튼 클릭시
	$('#btnSalesSave').on('click', function() {
		let array = [];
		let state = true;
		$('#bizOrderSalesTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = bizOrderSalesTable.row($(item)).data().idx;
				let salesGubunVal = $(td).eq(bizOrderSalesTable.column('salesGubun:name').index()).find('select').val();
				let publishPreDate = $(td).eq(bizOrderSalesTable.column('publishPreDate:name').index()).find('input').val();
				let publishAmt = $(td).eq(bizOrderSalesTable.column('publishAmt:name').index()).find('input').val();
				let publishDate = $(td).eq(bizOrderSalesTable.column('publishDate:name').index()).find('input').val();
				let collectMonth = $(td).eq(bizOrderSalesTable.column('collectMonth:name').index()).find('input').val();

				if(salesGubunVal == '') {
					toastr.warning('항목을 선택해주세요.');
					$(td).eq(bizOrderSalesTable.column('salesGubun:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(publishPreDate == '') {
					toastr.warning('발행예정일을 입력해주세요.');
					$(td).eq(bizOrderSalesTable.column('publishPreDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(publishAmt == '') {
					toastr.warning('금액을 입력해주세요.');
					$(td).eq(bizOrderSalesTable.column('publishAmt:name').index()).find('input').focus();
					state = false;
					return false;
				}
// 				if(publishDate == '') {
// 					toastr.warning('발행일을 선택해주세요.');
// 					$(td).eq(bizOrderSalesTable.column('publishDate:name').index()).find('input').focus();
// 					state = false;
// 					return false;
// 				}
// 				if(collectMonth == '') {
// 					toastr.warning('수금예정월을 선택해주세요.');
// 					$(td).eq(bizOrderSalesTable.column('collectMonth:name').index()).find('input').focus();
// 					state = false;
// 					return false;
// 				}

				let obj = new Object();
				obj.idx = idx;
				obj.bizOrdAdmIdx = bizOrdAdmIdxVal;
				obj.salesGubun = salesGubunVal;
				obj.publishPreDate = publishPreDate.replace(/-/g, '');
				obj.publishAmt = removeCommas(publishAmt);
				obj.publishDate = publishDate.replace(/-/g, '');
				obj.collectMonth = collectMonth.replace(/-/g, '');
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}

		array = _.differenceWith(array, bizOrderSalesTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bs/bizOrderSalesIU"/>',
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

					$('#btnLargeSearch').trigger('click'); // 조회버튼 click

					bizOrderSalesTable.ajax.reload();
					bizOrderAdmTable.ajax.reload();

					$('#btnLargeNew').attr('disabled', false); // 신규 버튼
					$('#btnLargeSave').attr('disabled', true); // 저장 버튼
					$('#btnLargeEdit').attr('disabled', true); // 수정 버튼
					$('#btnLargeDel').attr('disabled', true); // 삭제 버튼
					$('#btnLargeCancel').attr('disabled', true); // 취소 버튼
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});



	// 수금정보 목록조회
	$('#bizOrderCollectTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderCollectTable thead'); // filter 생성
	let bizOrderCollectTable = $('#bizOrderCollectTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '29vh', 
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
			url : '<c:url value="/bs/bizOrderCollectLst"/>',
			type : 'POST',
			data : {
				'bizOrdAdmIdx'		: function() { return bizOrdAdmIdxVal; },
				'bizOrdSalesIdx'	: function() { return bizOrdSalesIdxVal; },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'collectSub', className : 'text-center align-middle', name : 'collectSub',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						var collectSub = '';
						salesGubunList.forEach(function(item){
						    if(item.commonCd == data){
						    	collectSub = item.commonNm;
						    }
						});
						return collectSub;
					} else {
						let html = '';
						html += '<select name="collectSub" class="form-select inputGroup">';
						html +='	<option value="">선택</option>';
						salesGubunList.forEach(function(item) {
							if(item.commonCd == data){
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});							
						html += '</select>';
						return html;
					}
				}	
			},
			{ data: 'collectDate', className : 'text-center align-middle', name : 'collectDate',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '<input type="date" name="collectDate" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'collectAmt', className : 'text-center align-middle', name : 'collectAmt',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return '<input type="text" class="form-control" name="collectAmt"><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'collectGubun', className : 'text-center align-middle', name : 'collectGubun',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						var collectGubun = '';
						collectGubunList.forEach(function(item){
						    if(item.commonCd == data){
						    	collectGubun = item.commonNm;
						    }
						});
						return collectGubun;
					} else {
						let html = '';
						html += '<select name="collectGubun" class="form-select inputGroup">';
						html +='	<option value="">선택</option>';
						collectGubunList.forEach(function(item) {
							if(item.commonCd == '001'){
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							}else html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						});							
						html += '</select>';
						return html;
					}
				}	
			},
			{ data: 'receiptDate', className : 'text-center align-middle', name : 'receiptDate',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if(data != '' && data != null){
							return moment(data).format('YYYY-MM-DD');
						} else return '';
					} else {
						return '<input type="date" name="receiptDate" class="form-control" disabled><span class="d-none">'+data+'</span>';
					}
				}	
			},
			{ data: 'dueDate', className : 'text-center align-middle', name : 'dueDate',
				render : function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if(data != '' && data != null){
							return moment(data).format('YYYY-MM-DD');
						} else return '';
					} else {
						return '<input type="date" name="dueDate" class="form-control" disabled><span class="d-none">'+data+'</span>';
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
			{ extend: 'colvis',	text: 'Select Col',	dropup: true},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrderCollectTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
			let middlecol_height = parseInt($('#middlecol').height());	// 우측 중단
			let bottomcol_height = parseInt($('#bottomcol').height());	// 우측 하단
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - middlecol_height - bottomcol_height - 55)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			let data = api.data();
			let node = api.nodes();
			$('.bootstrapToggle').bootstrapToggle();

			try {
				bizOrderCollectTable.columns.adjust();
			} catch(e){
				//console.log('테이블 생성전');
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderCollectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderCollectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			bizOrderCollectTable.draw(false);
		},
	});
	// dataTable colReorder event
	bizOrderCollectTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderCollectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderCollectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
		$('.bootstrapToggle').bootstrapToggle();
	});

	// 수주관리 수금정보 항목 선택
	$('#bizOrderCollectTable tbody').on('click', 'tr', function() {
		let idx = bizOrderCollectTable.row(this).data().idx;

		$('#btnCollectEdit').attr('disabled', false); // 수정 버튼
		$('#btnCollectDel').attr('disabled', false); // 삭제 버튼
	});

	// 수금정보 신규 버튼 click
	$('#btnCollectNew').on('click', function() {
		WM_action_ON('collectNew', 'workingWarningModal');
		let col_filter_text = [];
		$('#bizOrderCollectTable').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		bizOrderCollectTable.row.add({
			'idx'			:	'',
			'collectGubun'	:	'001',
			'collectSub'	:	collectSubVal,
			'collectDate'	:	col_filter_text[2],
			'collectAmt'	:	col_filter_text[3],
			'receiptDate'	:	col_filter_text[4],
			'dueDate'		:	col_filter_text[5],
		}).draw(false);
		
		bizOrderCollectTable.colReorder.disable();

		$('#btnCollectSave').attr('disabled', false); // 저장 버튼
		$('#btnCollectEdit').attr('disabled', true); // 수정 버튼
		$('#btnCollectDel').attr('disabled', false); // 삭제 버튼
		$('#btnCollectCancel').attr('disabled', false); // 취소 버튼
	});

	$(document).on('change', 'input[name=collectDate]', function(){
		if($(this).parent().parent().find('select[name=collectGubun]').val() == '002'){
			$(this).parent().parent().find('input[name=receiptDate]').val($(this).val());
		}
	});

	// 수금정보 수정 버튼 click
	$('#btnCollectEdit').on('click', function() {
		$('#bizOrderCollectTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#bizOrderCollectTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).hasClass('selected')){
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == bizOrderCollectTable.column('collectDate:name').index()) {
							let value = bizOrderCollectTable.row(tr).data().collectDate;
							$(td).html('<input type="date" class="form-control" name="collectDate" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == bizOrderCollectTable.column('collectGubun:name').index()) {
							let value = bizOrderCollectTable.row(tr).data().collectGubun;
							let html = '';
							html += '<select name="collectGubun" class="form-select inputGroup">';
							html +='	<option value="">선택</option>';
							collectGubunList.forEach(function(item) {
								if(value == item.commonCd){
									html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});							
							html += '</select>';
							$(td).html(html);
						}  else if(index_td == bizOrderCollectTable.column('collectSub:name').index()) {
							let value = bizOrderCollectTable.row(tr).data().collectSub;
							let html = '';
							html += '<select name="collectSub" class="form-select inputGroup">';
							html +='	<option value="">선택</option>';
							salesGubunList.forEach(function(item) {
								if(value == item.commonCd){
									html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
								} else html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});							
							html += '</select>';
							$(td).html(html);
						}  else if(index_td == bizOrderCollectTable.column('receiptDate:name').index()) {
							let value = bizOrderCollectTable.row(tr).data().receiptDate;
							if(value == null || value == ''){
								$(td).html('<input type="date" class="form-control" name="receiptDate">');
							} else $(td).html('<input type="date" class="form-control" name="receiptDate" value="'+moment(value).format('YYYY-MM-DD')+'">');
						}  else if(index_td == bizOrderCollectTable.column('dueDate:name').index()) {
							let value = bizOrderCollectTable.row(tr).data().dueDate;
							if(value == null || value == ''){
								$(td).html('<input type="date" class="form-control" name="dueDate">');
							} else $(td).html('<input type="date" class="form-control" name="dueDate" value="'+moment(value).format('YYYY-MM-DD')+'">');
						}  else {
							let value = $(td).text();
							$(td).html('<input type="text" class="form-control" name="collectAmt" value="'+addCommas(value)+'">');
						}
					}
				})
			}
		});

		bizOrderCollectTable.colReorder.disable();
		bizOrderCollectTable.draw(false);

		$('#btnCollectNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnCollectSave').attr('disabled', false); // 저장 버튼
		$('#btnCollectDel').attr('disabled', false); // 삭제 버튼
		$('#btnCollectCancel').attr('disabled', false); // 취소 버튼
	});

	// 수금정보 삭제버튼 click
	$('#btnCollectDel').on('click', function() {
		if($('#bizOrderCollectTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let idx = bizOrderCollectTable.row('.selected').data().idx;
		$.ajax({
			url: '<c:url value="/bs/bizOrderCollectDel"/>',
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
					$('#btnCollectEdit').attr('disabled', true);
					$('#btnCollectDel').attr('disabled', true);
					bizOrderCollectTable.ajax.reload();
					bizOrderAdmTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 수금정보 저장 버튼 클릭시
	$('#btnCollectSave').on('click', function() {
		let array = [];
		let state = true;
		$('#bizOrderCollectTable tbody').find('tr').each(function(index, item) {
			if($(item).find('td').find('input').length != 0) {
				let td = $(item).find('td');
				let idx = bizOrderCollectTable.row($(item)).data().idx;
				let collectGubunVal = $(td).eq(bizOrderCollectTable.column('collectGubun:name').index()).find('select').val();
				let collectSubVal = $(td).eq(bizOrderCollectTable.column('collectSub:name').index()).find('select').val();
				let collectDate = $(td).eq(bizOrderCollectTable.column('collectDate:name').index()).find('input').val();
				let collectAmt = $(td).eq(bizOrderCollectTable.column('collectAmt:name').index()).find('input').val();
				let receiptDate = $(td).eq(bizOrderCollectTable.column('receiptDate:name').index()).find('input').val();
				let dueDate = $(td).eq(bizOrderCollectTable.column('dueDate:name').index()).find('input').val();

				if(collectSubVal == '') {
					toastr.warning('항목을 선택해주세요.');
					$(td).eq(bizOrderCollectTable.column('collectSub:name').index()).find('select').focus();
					state = false;
					return false;
				}
				if(collectDate == '') {
					toastr.warning('수금일을 입력해주세요.');
					$(td).eq(bizOrderCollectTable.column('collectDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(collectAmt == '') {
					toastr.warning('금액을 입력해주세요.');
					$(td).eq(bizOrderCollectTable.column('collectAmt:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(collectGubunVal == '') {
					toastr.warning('구분을 선택해주세요.');
					$(td).eq(bizOrderCollectTable.column('collectGubun:name').index()).find('select').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.bizOrdAdmIdx = bizOrdAdmIdxVal;
				obj.bizOrdSalesIdx = bizOrdSalesIdxVal;
				obj.collectGubun = collectGubunVal;
				obj.collectSub = collectSubVal;
				obj.collectDate = collectDate.replace(/-/g, '');
				obj.collectAmt = removeCommas(collectAmt);
				obj.receiptDate = receiptDate.replace(/-/g, '');
				obj.dueDate = dueDate.replace(/-/g, '');
			    
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}

		array = _.differenceWith(array, bizOrderCollectTable.data().toArray(), _.isEqual);

		$.ajax({
			url: '<c:url value="/bs/bizOrderCollectIU"/>',
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

					bizOrderCollectTable.ajax.reload();
					bizOrderAdmTable.ajax.reload();

					$('#btnCollectNew').attr('disabled', false); // 신규 버튼
					$('#btnCollectSave').attr('disabled', true); // 저장 버튼
					$('#btnCollectEdit').attr('disabled', true); // 수정 버튼
					$('#btnCollectDel').attr('disabled', true); // 삭제 버튼
					$('#btnCollectCancel').attr('disabled', true); // 취소 버튼
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	//수금구분 변경 시
	$(document).on('change', 'select[name=collectGubun]', function(){
		let tr = $('select[name=collectGubun]').parent().parent();
		if($(this).val() == '001'){
			$($(tr).find('input[name=receiptDate]')).val('');
			$($(tr).find('input[name=dueDate]')).val('');
			$($(tr).find('input[name=receiptDate]')).attr('disabled', true);
			$($(tr).find('input[name=dueDate]')).attr('disabled', true);
		} else {
			$($(tr).find('input[name=receiptDate]')).attr('disabled', false);
			$($(tr).find('input[name=dueDate]')).attr('disabled', false);
		}
	
	});

	// 지급정보 목록조회
	$('#purchaseOrderAdmTable1 thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable1 thead'); // filter 생성
	let purchaseOrderAdmTable1 = $('#purchaseOrderAdmTable1').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '28vh', 
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
			url : '<c:url value="/bs/bizOrderCollectLst"/>',
			type : 'POST',
			data : {
				'bizOrdAdmIdx'	: function() { return bizOrdAdmIdxVal; }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: '', className : 'text-center align-middle'},
			{ data: '', className : 'text-center align-middle'},
			{ data: '', className : 'text-center align-middle'},
			{ data: '', className : 'text-center align-middle'},
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
			{ extend: 'colvis',	text: 'Select Col',	dropup: true},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable1_wrapper').find('.dataTables_scrollHead').css('height'));
			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let middlecolT_height = parseInt($('#middlecolT').height());	// 우측 상단
			let middlecol_height = parseInt($('#middlecol').height());	// 우측 중단
			let bottomcol_height = parseInt($('#bottomcol').height());	// 우측 하단
			
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - middlecol_height - bottomcol_height - 55)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			let data = api.data();
			let node = api.nodes();
			$('.bootstrapToggle').bootstrapToggle();

			try {
				purchaseOrderAdmTable1.columns.adjust();
			} catch(e){
				//console.log('테이블 생성전');
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#purchaseOrderAdmTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			purchaseOrderAdmTable1.draw(false);
		},
	});
	// dataTable colReorder event
	purchaseOrderAdmTable1.on('column-reorder', function( e, settings, details ) {
		let api = purchaseOrderAdmTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseOrderAdmTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
		$('.bootstrapToggle').bootstrapToggle();
	});
	
	// 수주확정, 디자인컨펌
	$(document).off('change','#bizOrderDtlTable .confirmToggle');
	$(document).on('change','#bizOrderDtlTable .confirmToggle', function() {
		$('#my-spinner').show();
		let idx = $(this).data('idx');
		let type = $(this).data('type');
		let check = $(this).prop('checked');
		
		let ajaxData = {};
		ajaxData.idx = idx;
		if(type == 'confirmOrder') { // 수주확정을 눌렀을 경우
			ajaxData.confirmOrder = (check?'Y':'N');
		} else if(type == 'confirmDesign') { // 디자인컨펌을 눌렀을 경우
			ajaxData.confirmDesign = (check?'Y':'N');
			/* 수주도 확정되도록 변경 */
			//ajaxData.confirmOrder = ajaxData.confirmDesign;
		}
		$('#my-spinner').hide();
		
		$.ajax({
			url: '<c:url value="/bs/bizOrderDtlUpd"/>',
			type: 'POST',
			data: ajaxData,
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					if(check) {
						toastr.success('처리되었습니다.');
					} else {
						toastr.success('취소처리되었습니다.');
					}
					bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx; 
					bizOrderAdmTable.rows('.selected').deselect();
					bizOrderAdmTable.ajax.reload(function(){
						bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						//$(bizOrderAdmTable.row('#'+bizOrdAdmTrId).node()).trigger('click'); 
					},false);
					bizOrderDtlTable.ajax.reload(function(){},false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					bizOrderDtlTable.ajax.reload(function(){},false);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 재고사용
	$(document).off('change','#bizOrderDtlTable .bizStock');
	$(document).on('change','#bizOrderDtlTable .bizStock', function() {
		let idx = $(this).data('idx');
		let type = $(this).data('type');
		let check = $(this).prop('checked');
		if(type == 'stockUse' && !isEmptyCheck($(this).data('idx'))){
			$.ajax({
				url: '<c:url value="/bs/bizOrderDtlStockYnUpd"/>',
				type: 'POST',
				data: {
					'idx'			:	idx,
					'stockUseYn'	:	(check?'Y':'N')
				},
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            }, 
				success : function(res) {
					if (res.result == "ok") { //응답결과
						if(check) {
							toastr.success('처리되었습니다.');
						} else {
							toastr.success('취소처리되었습니다.');
						}
						bizOrdDtlTrId = bizOrderDtlTable.row('.selected').data().idx;
						bizOrderDtlTable.rows('.selected').deselect();
						bizOrderDtlTable.ajax.reload(function(){
							bizOrderDtlTable.row('#'+bizOrdDtlTrId).select();
							$(bizOrderDtlTable.row('#'+bizOrdDtlTrId).node()).trigger('click'); 
						},false);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
						bizOrderDtlTable.ajax.reload(function(){
						},false);
					} else {
						toastr.error(res.message);
					}

					$('#my-spinner').hide();
				}
			});
		}
	})
	
	let itemIdx = 0;
	//수주관리 목록 클릭
	$('#bizOrderDtlTable tbody').on('click','tr', function() {

		let idx = bizOrderDtlTable.row(this).data().idx;
		if(WMCheck('salesNew')) { // 공정 등록중일 경우
			setWM('salesNew', 'idx', idx);
			setWM('salesNew', 'gubun', bizOrderDtlTable);
			return false;
		}
		if(WMCheck('fileNew')) { // 파일 등록중일 경우
			setWM('fileNew', 'idx', idx);
			setWM('fileNew', 'gubun', bizOrderDtlTable);
			return false;
		}
		if(WMCheck('collectNew')) { // 자재 등록중일 경우
			setWM('collectNew', 'idx', idx);
			setWM('collectNew', 'gubun', bizOrderDtlTable);
			return false;
		}
		if(WMCheck('bundleNew')) { // 번들링 등록중일 경우
			setWM('bundleNew', 'idx', idx);
			setWM('bundleNew', 'gubun', bizOrderAdmTable);
			return false;
		}
		if(bizOrderDtlTable.row(this).data().bizStatusCd != '03' && bizOrderDtlTable.row(this).data().bizStatusCd != '08'){
			$('#btnBizDtlPoEnd').attr('disabled',false);
			$('#btnBizDtlCancel').attr('disabled',false);
		} else {
			$('#btnBizDtlPoEnd').attr('disabled',true);
			$('#btnBizDtlCancel').attr('disabled',true);
		}
		itemIdx = bizOrderDtlTable.row(this).data().itemIdx;
		bizOrdDtlIdxVal = bizOrderDtlTable.row(this).data().idx;
		ordQtyVal = bizOrderDtlTable.row(this).data().ordQty;

		if(parseInt(bizOrderDtlTable.row(this).data().workOrdCnt) > 0){
			$('#btnWorkOrdConfirm').removeClass('btn-outline-light');
			$('#btnWorkOrdConfirm').addClass('btn-success');
		} else {
			$('#btnWorkOrdConfirm').addClass('btn-outline-light');
			$('#btnWorkOrdConfirm').removeClass('btn-success');
		}
		
		$('#btnProcessCopy').attr('disabled',true);
		//공정정보 버튼들
		$('#btnProcessNew').attr('disabled',false);
		$('#btnProcessSave').attr('disabled',true);
		$('#btnProcessEdit').attr('disabled',false);
		$('#btnProcessDel').attr('disabled',false);
		$('#btnProcessCancel').attr('disabled',true);

		$('#btnWorkOrdConfirm').attr('disabled',false);
		//사진 및 첨부파일 버튼들
		$('#btnFileAdd').attr('disabled',false);
		$('#btnFileSave').attr('disabled',true);
		$('#btnFileDel').attr('disabled',false);
		//수주별발주 버튼들
		$('#btnMaterialNew').attr('disabled',false);
		$('#btnMaterialSave').attr('disabled',true);
		$('#btnMaterialEdit').attr('disabled',false);
		$('#btnMaterialDel').attr('disabled',false);
		$('#btnMaterialCancel').attr('disabled',true);

		//번들링정보
		$('#btnBundleNew').attr('disabled',false);
		$('#btnBundleSave').attr('disabled',true);
		$('#btnBundleEdit').attr('disabled',false);
		$('#btnBundleDel').attr('disabled',false);
		$('#btnBundleCancel').attr('disabled',true);
	
		/************************ 공정정보 리로드  ************************/
		processInfoTable.ajax.reload(function(){
			$('button[name=customerModalBtn]').attr('disabled',true);
			$('button[name=equipModalBtn]').attr('disabled',true);

			if($('#processInfoTable tbody tr').find('.dataTables_empty').length == 1){
				$('#btnProcessCopy').attr('disabled',false);
			} else {
				$('#btnProcessCopy').attr('disabled',true);
			}

			setTimeout(function() {
				processInfoTable.draw(false);
			},100);
		});
		/************************ 사진 및 첨부파일 리로드  ************************/
		fileTable.ajax.reload(function(){});
		$('#imgView').attr('style','');
		$('#viewer').attr('src','data:image/jpeg;base64,');
		/************************ 수주별발주 리로드  ************************/
		
		purchaseOrderAdmTable.ajax.reload(function(){
			purchaseOrderAdmTable.draw(false);
		});

		/************************ 번들링 리로드  ************************/
		bundleInfoTable.ajax.reload(function(){
			bundleInfoTable.draw(false);
		});
	});
	
	// 수주관리 상세 삭제버튼 click
	$('#btnDelDtl').on('click', function() {
		if($('#bizOrderDtlTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
	
		$('#deleteModal').modal('show');
		$('#deleteModal').data('deleteType','DTL');
	});

	// 품목추가 버튼 click
	$('#btnItemAdd').on('click', function() {
		if($('#dealCorpIdx').val() == '') {
			toastr.warning('고객사를 먼저 선택해주세요.');
			$('#btnDealCorpSelect').focus();
			return false;
		}
		
		$('#searchUseYnCd').val('Y');
		$('#itemInfoAdmListModal').modal('show');
		$('#itemInfoAdmListModal').css('left','0').css('top','0');
		$('#itemInfoAdmListModal').find('.modal-content').css('width','70vw').height('85.2vh');
		$('#itemInfoAdmListModal').draggable({handle: ".modal-header"});
		itemSelectList.splice(0, itemSelectList.length);
		
	});
	$('#itemInfoAdmListModal').on('shown.bs.modal', function() {
		itemInfoTable.ajax.reload(function() {});
	});

	// 품목삭제 버튼 click
	$('#btnItemDel').on('click', function() {
		if(bizOrderDtlAddEditTable.row('.selected').data() == undefined) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		bizOrderDtlAddEditTable.row('.selected').remove().draw();
	});

	// 고객사 검색 버튼 click
	$('#btnDealCorpSelect').on('click', function() {
		dealCorpModalGubun = 'bizOrder';
		$('#dealCorpModal').modal('show');
	});
	$('#dealCorpModal').on('shown.bs.modal', function() {
		dealCorpModalTable.ajax.reload(function() {});
	});
	// 제품명 검색 버튼 click
	$('#btnGoodsNmSelect').on('click', function() {
		setTimeout(function() {
			goodsNmModalTable.ajax.reload(function() {});
		}, 200);
		$('#goodsNmModal').modal('show');
	});

	// 고객사 검색 버튼 click
	$('#btnProjectCustomerSelect').on('click', function() {
		dealCorpModalGubun = 'customer';
		$('#dealCorpModal1').modal('show');
	});
	$('#dealCorpModal1').on('shown.bs.modal', function() {
		dealCorpModalTable1.ajax.reload(function() {});
	});

	// 제품명 검색 버튼 click
	$('#btnProjectGoodsNmSelect').on('click', function() {
		setTimeout(function() {
			projectGoodsNmTable.ajax.reload(function() {});
		}, 200);
		$('#projectGoodsNmModal').modal('show');
	});
	
	
	//프로젝트 채번 모달
	$('#btnPrjCdSelect').on('click',function(){
		$('#prjCdModal').modal('show');

		prjVal = '_';       
		prdTypeVal = '_';   
		prdGroupVal = '_';  
		prdListVal = '____';
		prjNumSeq = '__';

		prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;
		
		$('#prjNumberMake').text(prjCdMade);

		prjTable.row('.selected').deselect();
		prdTypeTable.row('.selected').deselect();
		prdGroupTable.row('.selected').deselect();
		prdListTable.row('.selected').deselect();
	});

	$('#prjCdModal').on('shown.bs.modal', function() {
		prjTable.ajax.reload(function() {});
		prdTypeTable.ajax.reload(function() {});
		prdGroupTable.ajax.reload(function() {});
		prdListTable.ajax.reload(function() {});

	});

	$('#purchaseFileUpload').on('click',function(){
		$('#purchaseFile').trigger('click');
	});
	
	// 수주등록/수정 저장버튼 click
	$('#btnSave').on('click', function() {
		if($('#ordDate').val() == '') {
			toastr.warning('수주등록일을 선택해주세요.');
			$('#ordDate').focus();
			return false;
		}
		if($('#dealCorpIdx').val() == '') {
			toastr.warning('수주처를 선택해주세요.');
			$('#btnDealCorpSelect').focus();
			return false;
		}
		if($('#abroadGubun').val() == '') {
			toastr.warning('국내/해외를 선택해주세요.');
			$('#abroadGubunn').focus();
			return false;
		}
		if($('#salesRecogGubun').val() == '') {
			toastr.warning('매출구분을 선택해주세요.');
			$('#salesRecogGubun').focus();
			return false;
		}
		if($('#contractGubun').val() == '') {
			toastr.warning('계약조건을 선택해주세요.');
			$('#contractGubun').focus();
			return false;
		}
		if($('#transCondition').val() == ''){
			toastr.warning('INCOTERMS를 선택해주세요.');
			$('#transCondition').focus();
			return false;
		}
		if($('#costUnit').val() == '') {
			toastr.warning('통화를 선택해주세요.');
			$('#costUnit').focus();
			return false;
		}
		if($('#exchangeRate').val() == '') {
			toastr.warning('적용환율을 입력해주세요.');
			$('#exchangeRate').focus();
			return false;
		}
		if($('#goodsNm').val() == '') {
			toastr.warning('제품명을 선택해주세요.');
			$('#btnGoodsNmSelect').focus();
			return false;
		}
		if($('#bizOrdQty').val() == '0' || $('#bizOrdQty').val() == '') {
			toastr.warning('수량을 입력해주세요.');
			$('#bizOrdQty').focus();
			return false;
		}
		if($('#bizOrdCost').val() == '0' || $('#bizOrdCost').val() == '') {
			toastr.warning('단가를 입력해주세요.');
			$('#bizOrdCost').focus();
			return false;
		}
		if($('#bizOrdAmt').val() == '0' || $('#bizOrdAmt').val() == '') {
			toastr.warning('수주금액을 입력해주세요.');
			$('#bizOrdAmt').focus();
			return false;
		}
		if($('#currencyAmt').val() == '0' || $('#currencyAmt').val() == '') {
			toastr.warning('외화금액을 입력해주세요.');
			$('#currencyAmt').focus();
			return false;
		}

//*************** 시리얼 번호 시리얼번호 불러오기 ****************
// 		let serialData = [];
// 		$.ajax({
// 			url: '<c:url value="/bs/bizSerialNoLst"/>',
//             type: 'POST',
//             async: false,
//             data: {
//                 'idx'	:	function() { return bizOrdAdmIdxVal; },
//             },
//             beforeSend: function() {
//             	$('#my-spinner').show();
//             },
// 			success : function(res) {
// 				if (res.result == "ok") { //응답결과
// 					serialData = res.data;
// 				} else if(res.result == 'fail') {
// 					toastr.warning(res.message);
// 				} else {
// 					toastr.error(res.message);
// 				}
// 				$('#my-spinner').hide();
// 			}
// 		});

// 		var html = '';

// 		for(var i=0; i<$('#bizOrdQty').val(); i++){
// 			html += '<tr>';
// 			if(serialData[i] != null){
// 				html += '<td><input type="hidden" name="serialIdx" value="'+serialData[i].idx+'"><input type="text" class="form-control text-center" name="serialNo" value="'+serialData[i].serialNo+'"></td>';
// 			} else html += '<td><input type="hidden" name="serialIdx" value=""><input type="text" class="form-control text-center" name="serialNo"></td>';
// 			html += '</tr>';
// 		}
		
// 		$('#serialNoModalTable tbody').html(html);
		
// 		$('#serialNoModal').modal('show');
		
		let array = [];
		let state = true;
		
		let fileUuid;
		let fileNm;
		let fileExt;

		if(!state) {
			return false;
		}

		$.ajax({
			url: '<c:url value="/bs/bizOrderAdmAbroadIU"/>',
            type: 'POST',
            data: {
                'idx'				:	bizOrdAdmIdxVal,
                'bizOrdAdmIdx'		:	bizOrdAdmIdxVal,
                'ordDate'			:	($('#ordDate').val()==''?'':moment($('#ordDate').val()).format('YYYYMMDD')),
                'dealCorpIdx'		:	$('#dealCorpIdx').val(),
                'bizOrdNo'			:	($('#bizOrdNo').val()=='자동채번' || bizOrdAdmIdxVal=='' ?'':$('#bizOrdNo').val()),
                'abroadGubun'		:	'002',
                'poNo'				:	$('#poNo').val(),
                'dueDate'			:	moment($('#dueDate').val()).format('YYYYMMDD'),
                'customerDesc'		:	$('#customerDesc').val(),
                'salesRecogGubun'	:	$('#salesRecogGubun').val(),
                'contractGubun'		:	$('#contractGubun').val(),
                'customerDesc'		:	$('#customerDesc').val(),
                'poNo'				:	$('#poNo').val(),
                'dueDate'			:	$('#dueDate').val() == '' ? '' : moment($('#dueDate').val()).format('YYYYMMDD'),
                'goodsTypeCd'		:	$('#goodsTypeCd').val(),
                'goodsNm'			:	$('#goodsNm').val(),
                'ordQty'			:	$('#bizOrdQty').val().replaceAll(/,/g, ''),
                'ordCost'			:	$('#bizOrdCost').val().replaceAll(/,/g, ''),
                'currencyAmt'		:	$('#currencyAmt').val().replaceAll(/,/g, ''),
                'ordAmt'			:	$('#bizOrdAmt').val().replaceAll(/,/g, ''),
                'poDesc'			:	$('#poDesc').val(),
//                 'prjCd'				:	$('#bizOrdPrjCd').val(),
//                 'prjNm'				:	$('#bizOrdPrjNm').val(),
                'transCondition'	:	$('#transCondition').val(),
                'costUnit'			:	$('#costUnit').val(),
                'exchangeRate'		:	$('#exchangeRate').val().replaceAll(/,/g, ''),
//                 'jsonArray'			:	JSON.stringify(array),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
// 					bizOrdAdmTrId = res.idx; 
					bizOrderAdmTable.rows('.selected').deselect();
					bizOrderAdmTable.ajax.reload(function(){
// 						bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
// 						$(bizOrderAdmTable.row('#'+bizOrdAdmTrId).node()).trigger('click'); 
					},false);
					$('#btnEditAdm').attr('disabled', true);
					$('#btnDelAdm').attr('disabled', true);
					
// 					$('#serialNoModal').modal('hide');
 					$('#orderAddEditModal').modal('hide');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

// 	//Serial No 모달 저장
// 	$('#btnSerialNoModalSave').on('click', function(){

// 		let array = [];
// 		let state = true;

// 		let fileUuid;
// 		let fileNm;
// 		let fileExt;

// 		for(var i=0; i<$('#serialNoModalTable tbody tr').length; i++){
// 			if($($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialNo]').val() == ''){
// 				toastr.warning('Serial No를 입력해주세요.');
// 				state = false;
// 				return false;
// 			}
// 			let obj = new Object();
// 			obj.idx = $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialIdx]').val() == '' ? '' : $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialIdx]').val();
// 			obj.serialNo = $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialNo]').val();

// 			array.push(obj);
// 		}

// 	});
	
	// 등록/수정모달이 닫혔을 경우
	$('#orderAddEditModal').on('hide.bs.modal', function() {
		WM_action_OFF('new');
		WM_action_OFF('edit');
		$('#itemInfoAdmListModal').modal('hide');
	});

	// 수주관리 메인 상세조회
	function bizOrderAdmSel(idx) {
		let result = '';
		$.ajax({
			url: '<c:url value="/bs/bizOrderAdmSel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'	:	idx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					result = res.data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		return result;
	}


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

	// 수주등록/수정 고객사 모달 붙여넣기 버튼 click
	let dealCorpModalGubun = '';
	$('#btnDealCorpModalPaste').on('click',function(){
		if(dealCorpModalGubun == 'bizOrder'){ // 수주등록/수정일 경우
			if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
				toastr.warning('적용할 행을 선택해주세요.');
				return false;
			}
			
			let data = dealCorpModalTable.row('.selected').data();
			workPlaceIdxVal = data.workPlaceIdx;
			customerIdxVal = data.idx;
			$('#dealCorpIdx').val(data.idx);
			$('#dealCorpNm').val(data.dealCorpNm)
			
		} else if (dealCorpModalGubun == 'prcss'){ // 공정등록일 경우
			if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
				toastr.warning('적용할 행을 선택해주세요.');
				return false;
			}
			
			let idx = dealCorpModalTable.row('.selected').data().idx;
			if(customerModalGubun == 'customer'){
				$('#customerIdx').val(idx);
				$('#customerNm').val(dealCorpModalTable.row('.selected').data().dealCorpNm);
			} else if ( customerModalGubun == 'prcss' ){
				processInfoTable.row('.selected').data().customerIdx = idx;
				//공정명 html
				let html1='';
				html1 += '<div style="display: flex; flex-wrap: nowrap;" class="input-group">';
				html1 += '<input type="text" class="form-control inputNm" id="customerNm" style="max-width: 90%;" disabled="disabled" value="'+dealCorpModalTable.row('.selected').data().dealCorpNm+'">';
				html1 += '<button type="button" class="nameDel customerNm" name="nameDel" style="background-color: transparent;border-color: transparent;position: absolute;top: 0;right:0;margin: 1px 23px;margin-left: 0px;border: none;" ><i class="fa-solid fa-xmark"></i></button>';
				html1 += '<input type="hidden"  class="inputIdx" name="customerIdx" value="'+idx+'">';
				html1 += '<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary input-sub-search inputGroup" name="customerModalBtn">';
				html1 += '<i class="fa-solid fa-magnifying-glass"></i>';
				html1 += '</button>';
				html1 += '</div>';			
				$('#processInfoTable tbody').find('.selected').find('td').eq(9).html(html1);
				processInfoTable.draw(false);
			} 
		} else if(dealCorpModalGubun == 'inputMat'){
			let node = purchaseOrderAdmTable.row('.selected').node();
			let nodeData = purchaseOrderAdmTable.row('.selected').data();
			let selectNodeModalData = dealCorpModalTable.row('.selected').data();
			$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);			//발주처 식별자
			$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=text]').val(selectNodeModalData.dealCorpNm);		//발주처 이름
			$('#dealCorpSelectModal').modal('hide');
		}


		$('#dealCorpModal').modal('hide');
	});


	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		if(dealCorpModalGubun == 'bizOrder'){ // 수주등록/수정일 경우
			
			let data = dealCorpModalTable.row('.selected').data();
			workPlaceIdxVal = data.workPlaceIdx;
			customerIdxVal = data.idx;
			$('#dealCorpIdx').val(data.idx);
			$('#dealCorpNm').val(data.dealCorpNm)
			
		} else if (dealCorpModalGubun == 'prcss'){ // 공정등록일 경우
			
			let idx = dealCorpModalTable.row('.selected').data().idx;
			if(customerModalGubun == 'customer'){
				$('#customerIdx').val(idx);
				$('#customerNm').val(dealCorpModalTable.row('.selected').data().dealCorpNm);
			} else if ( customerModalGubun == 'prcss' ){
				processInfoTable.row('.selected').data().customerIdx = idx;
				//공정명 html
				let html1='';
				html1 += '<div style="display: flex; flex-wrap: nowrap;" class="input-group">';
				html1 += '<input type="text" class="form-control inputNm" id="customerNm" style="max-width: 90%;" disabled="disabled" value="'+dealCorpModalTable.row('.selected').data().dealCorpNm+'">';
				html1 += '<button type="button" class="nameDel customerNm" name="nameDel" style="background-color: transparent;border-color: transparent;position: absolute;top: 0;right:0;margin: 1px 23px;margin-left: 0px;border: none;" ><i class="fa-solid fa-xmark"></i></button>';
				html1 += '<input type="hidden"  class="inputIdx" name="customerIdx" value="'+idx+'">';
				html1 += '<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary input-sub-search inputGroup" name="customerModalBtn">';
				html1 += '<i class="fa-solid fa-magnifying-glass"></i>';
				html1 += '</button>';
				html1 += '</div>';			
				$('#processInfoTable tbody').find('.selected').find('td').eq(9).html(html1);
				processInfoTable.draw(false);
			} 
		} else if(dealCorpModalGubun == 'inputMat'){
			let node = purchaseOrderAdmTable.row('.selected').node();
			let nodeData = purchaseOrderAdmTable.row('.selected').data();
			let selectNodeModalData = dealCorpModalTable.row('.selected').data();
			$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);			//발주처 식별자
			$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=text]').val(selectNodeModalData.dealCorpNm);		//발주처 이름
			$('#dealCorpSelectModal').modal('hide');
		}
		$('#dealCorpModal').modal('hide');
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

	// 수주등록/수정 고객사 모달 붙여넣기 버튼 click
	let customerModalGubun = '';
	$('#btnDealCorpModalPaste1').on('click',function(){
		if( !$('#dealCorpModalTable1 tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
			
		let data = dealCorpModalTable1.row('.selected').data();
		workPlaceIdxVal = data.workPlaceIdx;
		customerIdxVal = data.idx;
		$('#projectCustomerIdx').val(data.idx);
		$('#projectCustomerNm').val(data.dealCorpNm)

		$('#dealCorpModal1').modal('hide');
	});


	$('#dealCorpModalTable1 tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable1.row('.selected').data();
		$('#projectCustomerIdx').val(data.idx);
		$('#projectCustomerNm').val(data.dealCorpNm);
		
		$('#dealCorpModal1').modal('hide');
	});
	

	//제품유형 모달 조회
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
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
			//	}
			//}
		],
		buttons : [
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

	//제품유형모달에서 붙여넣기
	$('#btnGoodsNmModalPaste').on('click',function(){
		if(!$('#goodsNmModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let data = goodsNmModalTable.row('.selected').data();
		$('#goodsTypeCd').val(data.goodsTypeCd);
		$('#goodsTypeNm').val(data.goodsTypeNm);
		$('#goodsNm').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});

	$('#goodsNmModalTable tbody').on('dblclick','tr',function(){
		let data = goodsNmModalTable.row('.selected').data();
		$('#goodsTypeCd').val(data.goodsTypeCd);
		$('#goodsTypeNm').val(data.goodsTypeNm);
		$('#goodsNm').val(data.goodsNm);
		$('#goodsNmModal').modal('hide');
	});


	//제품유형 모달 조회
	$('#projectGoodsNmTable thead tr').clone(true).addClass('filters').appendTo('#projectGoodsNmTable thead'); // filter 생성
	let projectGoodsNmTable = $('#projectGoodsNmTable').DataTable({
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
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
			//	}
			//}
		],
		buttons : [
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
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#projectGoodsNmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#projectGoodsNmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#projectGoodsNmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	projectGoodsNmTable.on('column-reorder', function( e, settings, details ) {
		let api = goodsTypeModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#projectGoodsNmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//제품유형모달에서 붙여넣기
	$('#btnProjectGoodsNmModalPaste').on('click',function(){
		if(!$('#projectGoodsNmTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let data = projectGoodsNmTable.row('.selected').data();
		$('#projectGoodsTypeCd').val(data.goodsTypeCd);
		$('#projectGoodsTypeNm').val(data.goodsTypeNm);
		$('#projectGoodsNm').val(data.goodsNm);
		$('#projectGoodsNmModal').modal('hide');
	});

	$('#projectGoodsNmTable tbody').on('dblclick','tr',function(){
		let data = projectGoodsNmTable.row('.selected').data();
		$('#projectGoodsTypeCd').val(data.goodsTypeCd);
		$('#projectGoodsTypeNm').val(data.goodsTypeNm);
		$('#projectGoodsNm').val(data.goodsNm);
		$('#projectGoodsNmModal').modal('hide');
	});
	

	//공정정보 외주처
	$(document).on('click','button[name=customerModalBtn]',function(){
		dealCorpModalGubun = 'prcss';
		customerModalGubun = 'prcss';
		$('#dealCorpModal').modal('show');
		setTimeout(function() {
			dealCorpModalTable.ajax.reload(function() {});
		}, 200);
	});
	
	//공정순서변경되었을 때
// 	processInfoTable.on( 'row-reorder', function ( e, diff, changes ) {
// 		if(diff.length != 0){
// 			$('#btnProcessSave').attr('disabled',false);
// 			WM_action_ON('salesNew', 'workingWarningModal');
// 		}
// 	} );
	
	//공정정보 신규
	$('#btnProcessNew').on('click',function(){
   		prcssModalTable.select.style('multi');
   		//선택되어있는 행들 취소 시키고 선택(등록되어있는 행) 시키기			
		prcssModalTable.rows('.selected').deselect();
   		$('#prcssModal').modal('show');   	
		setTimeout(function() {
			prcssModalTable.ajax.reload(function() {
				//선택(등록되어있는 행)
				/* for( let i = 0; i < processInfoTable.data().length; i++){
					//인덱스 구해서 선택시키기
					prcssModalTable.row($('#prcssModalTable tbody').find('#'+processInfoTable.row(i).data().prcssIdx).index()).select();
				} */
			});
		}, 200);
   		//WM_action_ON('salesNew', 'workingWarningModal');
   		
		$('#btnProcessNew').attr('disabled',false);
		$('#btnProcessSave').attr('disabled',false);
		$('#btnProcessEdit').attr('disabled',true);
		$('#btnProcessDel').attr('disabled',false);
		$('#btnProcessCancel').attr('disabled',false);

   	});


	//공정정보 모달에서 붙여넣기
	$('#btnPrcssModalPaste').on('click',function(){
		let status = true;
		let ngPrcssCd = '';
		
		if(!$('#prcssModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}

		$('#my-spinner').show();

		//처음으로 공정선택할 때 다중 행
		if(prcssModalTable.select.style() == 'multi'){
			let selectedIndex = prcssModalTable.rows('.selected').toArray()[0];
			if( status ){
				//모달창에서 선택되어있는 공정 IDX들( 붙여넣을 항목 )
				let prcssIdxArray = getPrcssIdx(prcssModalTable.rows('.selected').data().toArray(),"idx");
				let i = 0;
				let j = 0;
				let rowDeleteCnt = 0;
				let prcssTableLen = $('#processInfoTable tbody tr').length - $('#processInfoTable tbody tr').find('.dataTables_empty').length;
				/* for(j = 0 ; j < prcssTableLen; j++){
					//for에서 반복된 테이블(공정정보) 행이 / 모달창에서 선택되어있는 행의 idx가 있다면 -> 수정이므로 삽입 X  
					// 							/ 없다면 -> for에서 반복된 테이블(공정정보) 행 지우기 OR 신규 삽입 대상
					//indexOf return값이 -1보다 큰 경우 true(값이있다), -1일경우 false(값이없다)
					if(processInfoTable.row(j-rowDeleteCnt).data() != undefined){
						if( prcssIdxArray.indexOf(processInfoTable.row(j-rowDeleteCnt).data().prcssIdx) > -1 ){
							//해당 인덱스는 배열 값에서 제외 ( 이미 삽입되어있기 때문 )
							prcssIdxArray = prcssIdxArray.filter((element) => element !== processInfoTable.row(j-rowDeleteCnt).data().prcssIdx);
						} else {
							//모달에서 선택안된 행 지우기 
							processInfoTable.row(j-rowDeleteCnt).remove().draw();
							rowDeleteCnt++;
						}
					}
				} */
				//필터된 array(삽입 해야할 항목)
				for(i = 0; i < prcssIdxArray.length; i++){
					//모달 행 위치
					let modalRow = getPrcssIdx(prcssModalTable.data().toArray(),"idx").indexOf(prcssIdxArray[i]); 
					
					//추가될 row = 테이블 행 갯수 - 데이터가 없는 경우 나오는 행
					let rowLvl = $('#processInfoTable tbody tr').length - $('#processInfoTable tbody tr').find('.dataTables_empty').length;

					let modalData = prcssModalTable.row(modalRow).data();
					
					$('#processInfoTable').DataTable().row.add({
						'prcssOrder'			: null,
						'prcssCd'				: null,
						'prcssNm'				: null,
						'equipIdx'				: null,
						'equipNm'				: null,
						'outsrcGubun'			: null,
						'workMethod'			: null,
						'workOrdQty'            : '자동계산',
						'produceQtyUnitNm'      : null,
						'workMethodDtl'			: null,
						'customerCd'			: null,
						'qtyUnitNm'				: null,
						'prcssDesc'				: null,
						'note'					: null,
						'prcssIdx'				:	modalData.idx,
					}).draw(false);					
					
					processInfoTable.row(rowLvl).data().prcssIdx = modalData.idx;
					processInfoTable.row(rowLvl).data().prcssCd = modalData.prcssCd;
					processInfoTable.row(rowLvl).data().prcssNm = modalData.prcssNm;
					//단위
					processInfoTable.row(rowLvl).data().qtyNuit = modalData.qtyNuit;
					processInfoTable.row(rowLvl).data().qtyUnitNm = modalData.qtyUnitNm;
					//비고
					processInfoTable.row(rowLvl).data().prcssDesc = modalData.prcssDesc;

					//생산단위
					processInfoTable.row(rowLvl).data().produceQtyUnitNm = modalData.produceQtyUnitNm;
					$('#processInfoTable tbody tr').eq(rowLvl).find('td').eq(7).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+modalData.produceQtyUnitNm+'</div>');
					
					$('#processInfoTable tbody tr').eq(rowLvl).find('td').eq(1).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+modalData.prcssCd+'</div>');
					$('#processInfoTable tbody tr').eq(rowLvl).find('td').eq(10).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+modalData.qtyUnitNm+'</div>');
					//$('#processInfoTable tbody tr').eq(rowLvl).find('td').eq(11).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+modalData.prcssDesc+'</div>');
					//공정명 html
					let html1='';
					html1 += '<div style="display: flex; flex-wrap: 1 1 auto;">';
					html1 += '<input type="text" class="form-control inputGroup" id="prcssNm" style="max-width: 100%;" disabled="disabled" value="'+modalData.prcssNm+'">';
					html1 += '<input type="hidden" id="prcssIdx">';
					html1 += '</div>';			
					$('#processInfoTable tbody tr').eq(rowLvl).find('td').eq(2).html(html1);

					let node = processInfoTable.row(rowLvl).node();
					//설비정보
					$(node).find('td').eq(3).find('button[name=equipModalBtn]').val(modalData.idx);//발주처 돋보기버튼에 공정식별자 넣어두기

					/* let multipleNode = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]');
			    	$(multipleNode).select2({
			    		data: JSON.parse(modalData.workMethodJson),
			    		multiple : true,
			    		placeholder: "작업방법 선택",
			    	});
			    	$(node).find('td').eq(5).find('span').eq(0).css('width','100%');
			    	$(node).find('td').eq(5).find('.select2-search__field').css('width','100%');
			    	$(node).find('td').eq(5).find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
			    	 */
					
				} 
				processInfoTable.draw(false);
				$('button[name=prcssModalBtn]').attr('disabled',false);
				$('select[name=outsrcGubun]').attr('disabled',false);
				$('input[name=workMethodDtl]').attr('disabled',false);
				$('button[name=customerModalBtn]').attr('disabled',false);
				$('input[name=note]').attr('disabled',false);
				$('button[name=equipModalBtn]').attr('disabled',false);
				$('select[name=workMethodMultiSelect]').attr('disabled',false);
				$('button[name=nameDel]').attr('disabled',false);
				$('select[name=equipIdx]').attr('disabled',false);
				$('#prcssModal').modal('hide'); 
				toastr.success('공정이 추가되었습니다.');
				WM_action_ON('salesNew', 'workingWarningModal');
			} else {				
				toastr.warning('이미 추가된 공정이 있습니다.<br>추가된 공정 코드 : '+ngPrcssCd);
			}

			
		} else if(prcssModalTable.select.style() == 'single'){ //단일 행 선택해서 수정일 경우
			//중복체크
			$('#processInfoTable tbody tr').each(function(index){
				if(processInfoTable.row(index).data() != undefined ){
					if(processInfoTable.row(index).data().prcssIdx == prcssModalTable.row('.selected').data().idx){
						ngPrcssCd += prcssModalTable.row('.selected').data().prcssCd;
						status = false;
					}
				}
			});
			if( status ){
				processInfoTable.row('.selected').data().prcssIdx = prcssModalTable.row('.selected').data().idx;
				//단위
				processInfoTable.row('.selected').data().qtyNuit = prcssModalTable.row('.selected').data().qtyNuit;
				processInfoTable.row('.selected').data().qtyUnitNm = prcssModalTable.row('.selected').data().qtyUnitNm;
				//비고
				processInfoTable.row('.selected').data().prcssDesc = prcssModalTable.row('.selected').data().prcssDesc;
			
				$('#processInfoTable tbody').find('.selected').find('td').eq(1).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+prcssModalTable.row('.selected').data().prcssCd+'</div>');
				$('#processInfoTable tbody').find('.selected').find('td').eq(10).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+prcssModalTable.row('.selected').data().qtyUnitNm+'</div>');
				$('#processInfoTable tbody').find('.selected').find('td').eq(11).html('<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+prcssModalTable.row('.selected').data().prcssDesc+'</div>');
				//공정명 html
				let html1='';
				html1 += '<div style="display: flex; flex-wrap: 1 1 auto;">';
				html1 += '<input type="text" class="form-control inputGroup" id="prcssNm" style="max-width: 100%;" disabled="disabled" value="'+prcssModalTable.row('.selected').data().prcssNm+'">';
				html1 += '<input type="hidden" id="prcssIdx">';
				html1 += '</div>';			
				$('#processInfoTable tbody').find('.selected').find('td').eq(2).html(html1);
				processInfoTable.draw(false);
				$('#prcssModal').modal('hide');  
				WM_action_ON('salesNew', 'workingWarningModal');
			} else {
				toastr.warning('이미 추가된 공정이 있습니다.<br>추가된 공정 코드 : '+ngPrcssCd);
			}
		}
		$('#my-spinner').hide();
	});

	//멀티셀렉트 값 바뀌면 테이블 헤더 보정
	$(document).on('change','select[name=workMethodMultiSelect]',function(){
		processInfoTable.draw(false);
	});

	//공정정보 저장
	$('#btnProcessSave').on('click',function(){
		let status = true;
		let insertList = [];
		$('#my-spinner').show();
		if($('#processInfoTable tbody tr').length - $('#processInfoTable tbody tr').find('.dataTables_empty').length == 0){
			
		} else {
		
			$('#processInfoTable tbody tr').each(function(index){
				if(processInfoTable.row(index).data().prcssIdx == null || processInfoTable.row(index).data().matrlIdx == prcssIdx){
					status = false;
				} else {
					let obj = {};

					let node = processInfoTable.row(index).node();
					obj.bizOrdDtlIdx = bizOrdDtlIdxVal;
					obj.itemIdx = itemIdx;
					obj.prcssOrder = processInfoTable.row(index).data().prcssOrder;
					obj.prcssIdx = processInfoTable.row(index).data().prcssIdx;
					let equipIdx = null;
					//if( processInfoTable.row(index).data().equipIdx != '' && processInfoTable.row(index).data().equipIdx != null ){
					//	equipIdx = processInfoTable.row(index).data().equipIdx;
					//}
					equipIdx = $(node).find('td').eq(3).find('select').val();
					obj.equipIdx = equipIdx;
					obj.outsrcGubun =  $(node).find('td').eq(4).find('select').val();
					//obj.workMethod = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').val().join(',');
					obj.workMethodDtl = $(node).find('td').eq(6).find('input').val();
					let outsrcIdx = null;
					if( $(node).find('td').eq(9).find('input[type=hidden]').val() != ''){
						outsrcIdx = $(node).find('td').eq(9).find('input[type=hidden]').val();
					}
					obj.outsrcIdx = outsrcIdx;
					obj.note = $(node).find('td').eq(11).find('input').val();
					insertList.push(obj);
				}
			});
		}
		$('#my-spinner').hide();
		if(status){
			$.ajax({
				url: '<c:url value="/bs/bizOrderItemPrcssInsert"/>',
	            type: 'POST',
	            //async: false,
	            data: {
	                'insertList' : JSON.stringify(insertList),
	                'itemIdx'	: function(){ return itemIdx; },
	                'bizOrdDtlIdx' : function(){return bizOrdDtlIdxVal;},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						let data = res.data;
						toastr.success('신규 저장되었습니다.');
						WM_action_OFF('salesNew');
						$('#btnProcessNew').attr('disabled',false);
						$('#btnProcessSave').attr('disabled',true);
						$('#btnProcessEdit').attr('disabled',false);
						$('#btnProcessDel').attr('disabled',false);
						$('#btnProcessCancel').attr('disabled',true);						
						processInfoTable.ajax.reload(function(){
							$('button[name=customerModalBtn]').attr('disabled',true);
							$('button[name=equipModalBtn]').attr('disabled',true);

							/* $('#processInfoTable tbody tr').each(function(index){
								let node = processInfoTable.row(index).node();
								if(processInfoTable.row(index).data() != undefined && processInfoTable.row(index).data() != ''){
									let prcssIdx = processInfoTable.row(index).data().prcssIdx;
									//작업방법 멀티셀렉트를 해야하는데 //공정코드 -> 작업방법 리스트화 -> select2
									let multipleNode = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]');
									
									$(multipleNode).select2({
							    		data: JSON.parse(processInfoTable.row(index).data().workMethodJson),
							    		multiple : true,
							    		placeholder: "작업방법 선택",
							    	});
							    	
									$(node).find('td').eq(5).find('span').eq(0).css('width','100%');
							    	$(node).find('td').eq(5).find('.select2-search__field').css('width','100%');
							    	$(node).find('td').eq(5).find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
									
									if( processInfoTable.row(index).data().workMethod != null && processInfoTable.row(index).data().workMethod != ''){
										let splitData =  processInfoTable.row(index).data().workMethod.split(',');
										$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').val(splitData).trigger('change')
									}
									$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').attr('disabled',true);
								}
							}); */

							$('#my-spinner').hide();
							setTimeout(function() {
								processInfoTable.draw(false);
							},100);

							if($('#processInfoTable tbody tr').find('.dataTables_empty').length == 1){
								$('#btnProcessCopy').attr('disabled',false);
							} else {
								$('#btnProcessCopy').attr('disabled',true);
							}
							
						});
						
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else {
			toastr.warning('공정명을 선택하지 않은 행이 있습니다.');
		}		
	});

	//수정
	$('#btnProcessEdit').on('click',function(){
		_promise_().then(()=>{
			$('#btnProcessNew').attr('disabled',false);
			$('#btnProcessSave').attr('disabled',false);
			$('#btnProcessEdit').attr('disabled',true);
			$('#btnProcessDel').attr('disabled',false);
			$('#btnProcessCancel').attr('disabled',false);

			$('button[name=prcssModalBtn]').attr('disabled',false);
			$('select[name=outsrcGubun]').attr('disabled',false);
			$('input[name=workMethodDtl]').attr('disabled',false);
			$('button[name=customerModalBtn]').attr('disabled',false);
			$('input[name=note]').attr('disabled',false);
			$('button[name=equipModalBtn]').attr('disabled',false);
			$('select[name=workMethodMultiSelect]').attr('disabled',false);
			$('select[name=equipIdx]').attr('disabled',false);
			$('#processInfoTable').find('button[name=nameDel]').attr('disabled',false);
			WM_action_ON('salesNew', 'workingWarningModal');
		}).then(()=>{
			processInfoTable.draw(false);
		});
			
	});
	
	$('#btnProcessDel').on('click',function(){
		if(!$('#processInfoTable tbody tr').hasClass('selected')){
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		let idx = processInfoTable.row('.selected').data().idx;
		if(idx != '' && idx != undefined && idx != null){
			//delStatus = 'prcss';
			$('#deleteModal').data('deleteType','prcss');
			$('#deleteModal').modal('show');
		} else {
			$('#processInfoTable').DataTable().row('.selected').remove().draw(false);
		}
	});
	
	//객체(json)에서 키(field)로 값 찾기
	function getPrcssIdx(input, field) {
	    let output = [];
	    for (let i=0; i < input.length ; ++i)
	        output.push(input[i][field]);
	    return output;
	}
	
	/************************ 사진 및 첨부파일 ************************/
	// 파일 목록조회
// 	$('#fileTable thead tr').clone(true).addClass('filters').appendTo('#fileTable thead'); // filter 생성
// 	let fileTable = $('#fileTable').DataTable({
// 		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
// 				+ "<'row'<'col-md-12'tr>>"
// 				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
// 			url : '<c:url value="/bm/itemFileListAll"/>',
// 			type : 'GET',
// 			data : {
// 				'idx' : function() { return itemIdx; },
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'progressOrder', className : 'text-center'},
// 			{ data: 'fileSplitNm', className : 'text-center'},
// 			{ data: 'ext', className : 'text-center'},
// 			{ data: 'regDate', className : 'text-center'},
// 			{ data : 'download', className : 'text-center',
// 				render : function(data, type, row, meta) {
// 					if( row['fileStatus']=='F'){
// 						let html = '';
// 							html += '<div>';
// 							html += '	<input type="file" style="display:none;" id="fileNm'+ idValue +'" name="fileNm'+ idValue +'" value="" multiple>';
// 							html += '	<input type="hidden" class="uuid" id="fileUuid'+ idValue + '" value="'+ row['fileUuid'] +'"> ';
// 							html += '' + data + '';
// 							html += '</div>';
// 						return html;	
// 					} else{
// 						let html = '';
// 						if(data != null && data != "") {
// 							html += '<a href="/file/fileDownload?uuid='+row.uuid+'&fileName='+row.fileNm+'&ext='+row.ext+'">';
// 							html += '<span style="font-size: 14px;">'+data+'</span>';							
// 							html += '<input type="hidden" id="fileHidden'+ meta.row +'" value="'+data+'">';
// 						}
// 						return html;
// 					}
// 				}
// 			},
// 		],
// 		columnDefs : [
// 			//{
// 			//	targets: [0],
// 			//	render: function(data) {
// 			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'data+'</div>';
// 			//	}
// 			//}
// 		],
// 		buttons : [
// 			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 				exportOptions: {
// 	                modifier: {
// 	                   selected:null
// 	                },	                
// 	            },
// 	        },
// 			{ extend: 'pdf',	text: 'PDF',	},
// 			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			{ extend: 'colvis',	text: 'Select Col',	}, */
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
// 			let data = api.data();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#fileTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			let baseTableHeight = parseFloat($('#middlecol').css('height'));
// 			let baseTableWidth = parseFloat($('#imgDiv').css('width'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(baseTableHeight - 155)+'px');
// 			$('#viewer').css('height',(baseTableHeight - 66)+'px');
// 			$('#viewer').css('width', (baseTableWidth - 14)+'px');
// 			$('#'+table_id+'_filter').addClass('d-none');
// 			// 통합검색
// 			/* $('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#'+table_id+'_filter').find('input').val($(this).val());
// 				$('#'+table_id+'_filter').find('input').trigger('keyup');
// 			}); */

// 			//progressOrder
// 			for(var i=0;i<data.length;i++) {
// 				let tr = $('#fileTable tbody').find('tr').eq(i);
// 				fileTable.row(tr).data().progressOrder = i+1;
// 				$(tr).find('td').eq(0).html(i+1);
// 			}
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#fileTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#fileTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	fileTable.on('column-reorder', function( e, settings, details ) {
// 		let api = fileTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#fileTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});
	/************************ 공정정보 , 사진 및 첨부파일 탭 클릭 ************************/
// 	$('#tab3Nav').on('click',function(){
// 		$('#my-spinner').show();
// 		processInfoTable.ajax.reload(function(){
// 			$('button[name=customerModalBtn]').attr('disabled',true);
// 			$('button[name=equipModalBtn]').attr('disabled',true);
// 			$('#processInfoTable tbody tr').each(function(index){
// 				let node = processInfoTable.row(index).node();
// 				if(processInfoTable.row(index).data() != undefined && processInfoTable.row(index).data() != ''){
// 					let prcssIdx = processInfoTable.row(index).data().prcssIdx;
// 					//작업방법 멀티셀렉트를 해야하는데 //공정코드 -> 작업방법 리스트화 -> select2
// 					let multipleNode = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]');
					
// 					/* $(multipleNode).select2({
// 			    		data: JSON.parse(processInfoTable.row(index).data().workMethodJson),
// 			    		multiple : true,
// 			    		placeholder: "작업방법 선택",
// 			    	});
			    	
// 					$(node).find('td').eq(5).find('span').eq(0).css('width','100%');
// 			    	$(node).find('td').eq(5).find('.select2-search__field').css('width','100%');
// 			    	$(node).find('td').eq(5).find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
		    	
// 					if( processInfoTable.row(index).data().workMethod != null && processInfoTable.row(index).data().workMethod != ''){
// 						let splitData =  processInfoTable.row(index).data().workMethod.split(',');
// 						$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').val(splitData).trigger('change')
// 					}
// 					$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').attr('disabled',true);
// 					 */
// 				}
// 			});

// 			if($('#processInfoTable tbody tr').find('.dataTables_empty').length == 1){
// 				$('#btnProcessCopy').attr('disabled',false);
// 			} else {
// 				$('#btnProcessCopy').attr('disabled',true);
// 			}

// 			$('#my-spinner').hide();
// 			setTimeout(function() {
// 				processInfoTable.draw(false);
// 			},100);
// 		});
// 	});

// 	$('#tab4Nav').on('click',function(){
// 		fileTable.ajax.reload(function(){
// 			$('#fileTable_wrapper').find('tbody').find('.selected').removeClass('selected');
// 			$('#viewer').attr('src','');
// 		});
// 	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');
		if(CancelIdx == 'salesNew'){
			WM_action_OFF('salesNew');
			processInfoTable.ajax.reload(function(){
				$('button[name=customerModalBtn]').attr('disabled',true);
				$('button[name=equipModalBtn]').attr('disabled',true);
				$('#processInfoTable tbody tr').each(function(index){
					let node = processInfoTable.row(index).node();
					if(processInfoTable.row(index).data() != undefined && processInfoTable.row(index).data() != ''){
						let prcssIdx = processInfoTable.row(index).data().prcssIdx;
						let multipleNode = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]');
						
						/* $(multipleNode).select2({
				    		data: JSON.parse(processInfoTable.row(index).data().workMethodJson),
				    		multiple : true,
				    		placeholder: "작업방법 선택",
				    	});
				    	
						$(node).find('td').eq(5).find('span').eq(0).css('width','100%');
				    	$(node).find('td').eq(5).find('.select2-search__field').css('width','100%');
				    	$(node).find('td').eq(5).find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
			    	
					
						if( processInfoTable.row(index).data().workMethod != null && processInfoTable.row(index).data().workMethod != ''){
							let splitData =  processInfoTable.row(index).data().workMethod.split(',');
							$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').val(splitData).trigger('change')
						}
						$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').attr('disabled',true);
						 */
					}
				});

				$('#my-spinner').hide();
				setTimeout(function() {
					processInfoTable.draw(false);
				},100);

				if($('#processInfoTable tbody tr').find('.dataTables_empty').length == 1){
					$('#btnProcessCopy').attr('disabled',false);
				} else {
					$('#btnProcessCopy').attr('disabled',true);
				}
				
			});
			$('#btnProcessNew').attr('disabled', false);
			$('#btnProcessSave').attr('disabled', true);
			$('#btnProcessEdit').attr('disabled', false);
			$('#btnProcessDel').attr('disabled', false);
			$('#btnProcessCancel').attr('disabled', true);
		} else if(CancelIdx == 'collectNew'){
			WM_action_OFF('collectNew');

			purchaseOrderAdmTable.ajax.reload();
			purchaseOrderAdmTable.colReorder.enable();
			// 수주별발주내역이 존재하지 않을 경우 BOM목록을 불러와 저장할 수 있는 상태로 셋팅
			/* $('#matrlSelectGubun').val('001');
			if(purchaseOrderAdmTable.data().count() == 0 && bizOrderDtlTable.row('.selected').data() != undefined) {
				let dataList = matrlModalSelectTable.data().toArray();
				let addList = [];
				for(var i=0;i<dataList.length;i++) {
					let obj = {};
					obj.idx = '';
					obj.matrlIdx = dataList[i].matrlIdx;
					obj.matrlCd = dataList[i].matrlCd;
					obj.matrlNm = dataList[i].matrlNm;
					obj.paperType = dataList[i].paperType;
					obj.confirmYn = 'N';
					obj.printYn = 'N';
					obj.purchaseOrdNo = '자동채번';
					obj.purchaseOrdQty = ordQtyVal;
					obj.purchaseOrdDate = moment().format('YYYY-MM-DD');
					obj.purchaseInDueDate = moment().format('YYYY-MM-DD');
					if(dataList[i].dealCorpIdx > 0 && dataList[i].dealCorpNm != null){
						obj.dealCorpIdx = dataList[i].dealCorpIdx;
						obj.dealCorpNm = dataList[i].dealCorpNm;
					} else {
						obj.dealCorpIdx = '';
						obj.dealCorpNm = '';
					}
					obj.cutQty = dataList[i].cutQty;
					obj.eaQty = dataList[i].eaQty;
					obj.extraQty = dataList[i].extraQty;
					obj.extraPackQty = '0';
					obj.cutSize = dataList[i].cutSize;
					obj.purchaseNote = '';
					obj.purchaseDesc = '';
					addList.push(obj);
				}
				purchaseOrderAdmTable.rows.add(addList).draw(false);
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
					$(item).find('input').attr('disabled', true); // 검색 필터 disabled
				});
				purchaseOrderAdmTable.colReorder.disable();
				purchaseOrderAdmTable.draw();

				$('#btnMaterialNew').attr('disabled', false); // DTL 신규 버튼
				$('#btnMaterialSave').attr('disabled', false); // DTL 저장 버튼
				$('#btnMaterialEdit').attr('disabled', true); // DTL 수정 버튼
				$('#btnMaterialDel').attr('disabled', false); // DTL 삭제 버튼
				$('#btnMaterialCancel').attr('disabled', false); // DTL 취소 버튼

				
				
			} else {
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
					$(item).find('input').attr('disabled', false); // 검색 필터 disabled
				});
				purchaseOrderAdmTable.colReorder.enable();
			} */
			$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnMaterialNew').attr('disabled', false); // 신규 버튼
			$('#btnMaterialSave').attr('disabled', true); // 저장 버튼
			$('#btnMaterialEdit').attr('disabled', false); // 수정 버튼
			$('#btnMaterialDel').attr('disabled', false); // 삭제 버튼
			$('#btnMaterialCancel').attr('disabled', true); // 취소 버튼
		} else if(CancelIdx == 'bundle'){
			WM_action_OFF('bundleNew');
			bundleInfoTable.ajax.reload();
			$('#btnBundleNew').attr('disabled',false);
			$('#btnBundleSave').attr('disabled',true);
			$('#btnBundleEdit').attr('disabled',false);
			$('#btnBundleDel').attr('disabled',false);
			$('#btnBundleCancel').attr('disabled',true);
		}
		
	});

	/************ 파일(사진 및 첨부파일)기능 ************/
	//파일추가
	$('#btnFileAdd').on('click',function(){
		$('#fileFake').trigger('click');
	});

	//파일삭제
	$('#btnFileDel').on('click',function(){
		if( !$('#fileTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		let idx = fileTable.row('.selected').data().idx;
		if(idx != '' && idx != undefined){
			//delStatus = 'file'
			$('#deleteModal').data('deleteType','file');
			$('#deleteModal').modal('show');
		} else {
			//폼데이터로부터 지우고 테이블 다시그리기
			let selectUuid = $('#fileTable tbody').find('.selected').find('.uuid').val();
			formData.delete('file+'+selectUuid);
			formData.delete('uuid+'+selectUuid);
			formData.delete('ext+'+selectUuid);
			$('#fileTable').DataTable().row('.selected').remove().draw();
		}
	});

	//파일 저장
	$('#btnFileSave').on('click',function(){
		let fileString = [];
		let i=0;
		//삭제된 데이터들로부터 형식맞추는곳
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
		$('#fileTable tbody tr').each(function(index, item) {
			if( fileTable.row(this).data() != undefined && fileTable.row(this).data() != null){
				if( fileTable.row(this).data().idx == '' || fileTable.row(this).data().idx == undefined ){ 
					//파일스트링 만드는곳
					let fileArr = formData2.getAll('file-'+formData2.getAll('uuid')[i])[0].name.split('.');
					let fileFullNm = _.slice(fileArr, 0, -1).join('.');
					let obj = {};
					obj.uuid = formData2.getAll('uuid')[i];
					obj.fileNm = fileFullNm;
					obj.ext = formData2.getAll('ext')[i];
					
					fileString.push(obj);
					/* fileString += formData2.getAll('uuid')[i] + '/' 
					+ formData2.getAll('file-'+formData2.getAll('uuid')[i])[0].name.split('.')[0] + '/'
					 + formData2.getAll('ext')[i] + '★'; */
					i++;
				}
			}
		});
		let idx = bizOrderDtlTable.row('.selected').data().itemIdx;
		$.ajax({
			url: '<c:url value="/bm/itemFileInsert"/>',
            type: 'POST',
            //async: false,
            data: {    
	            'itemIdx'		:	function(){return idx;},
            	'fileString'		:	JSON.stringify(fileString),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					//$('#btnSearch').trigger('click'); // 조회버튼 click

					WM_action_OFF('fileNew');

					$('#btnFileAdd').attr('disabled',false);
					$('#btnFileSave').attr('disabled',true);
					$('#btnFileDel').attr('disabled',false);
					if(fileString != ''){
						fileUpload(formData2); // 파일 업로드
					}
					itemIdx = bizOrderDtlTable.row('.selected').data().itemIdx;
					fileTable.ajax.reload(function(){});
					formData = new FormData();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	});
	
	// 파일 선택
	let idValue=0;	
	let formData = new FormData();
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

				let fileArr = files[i].name.split('.');
				let fileFullNm = _.slice(fileArr, 0, -1).join('.');
				
				//페이크 업로드파일로부터 추가된 행에 데이터 옮겨주기
				let fileData =  document.querySelector('#fileFake').files[i]; 
				fileTable.row.add({
					'progressOrder' : 0,
					'ext'     : files[i].name.split('.').at(-1),
					//'regNm'   : sessionUserNm,
					'regDate' : moment().format('YYYY-MM-DD'),
		 			'fileSplitNm'		:	fileFullNm,
		 			'fileNm'		:	fileData.name,
		 			'fileStatus'    :  'F',
		 			'fileUuid' 		: uuid,
		 			'download'  : files[i].name,
		 			'idValue' 	: idValue,
				}).draw(false);
				idValue++;
			}
		}
		WM_action_ON('fileNew', 'workingWarningModal');
		$('#btnFileSave').attr('disabled',false);
	});

	//파일테이블 클릭
	$('#fileTable tbody').on('click','tr', function() {
		
		let idNumber = fileTable.row(this).data().idValue;
		let ext = fileTable.row(this).data().ext;
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}

		$('#imgView').attr('style','');
		
		if( fileTable.row(this).data().idx == undefined ){
			let fileUuid = fileTable.row(this).data().fileUuid;
			let bases64 = getImgBase64(formData.get('file+'+fileUuid));
			$('#imgView').attr('style','');
			$('#viewer').attr('src','data:image/jpeg;base64,'+bases64);
		} else {
			let fileObject = new Object();
			fileObject.uuid = fileTable.row(this).data().uuid;
			fileObject.ext = fileTable.row(this).data().ext;
			if(fileTable.row(this).data().ext == 'bmp' || fileTable.row(this).data().ext == 'rle'
				|| fileTable.row(this).data().ext == 'dlb' || fileTable.row(this).data().ext == 'rle'
				|| fileTable.row(this).data().ext == 'jpg' || fileTable.row(this).data().ext == 'png'
				|| fileTable.row(this).data().ext == 'jfif' || fileTable.row(this).data().ext == 'gif'){
				let blob = getFileBlob(fileObject);
				$('#imgView').attr('style','');
				$('#viewer').attr('src','data:image/jpeg;base64,'+blob);
			} else {
				$('#imgView').attr('style','');
				$('#viewer').attr('src','data:image/jpeg;base64,');
			}
		}

	 });

	//사진확대축소
	$(document).ready(function(){
		$('#fileTable tbody').on('click','tr', function() {
				 const element = document.getElementById('imgView');
				 const panzoom = Panzoom(element, {});		
				 const parent = element.parentElement;
			     parent.addEventListener('wheel', panzoom.zoomWithWheel);
		});
	});

	/********************************* 수주별발주 *********************************/	
	// 수주별발주 수주별 목록조회
	//$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
// 	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
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
// 			url : '<c:url value="/pm/purchaseOrderAdmLstByBizDtl"/>',
// 			type : 'POST',
// 			data : {
// 				bizOrdDtlIdx	: function() { return bizOrdDtlIdxVal; }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'confirmYn', className : 'text-center align-middle', name: 'confirmYn',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data == 'Y') {
// 							let html = '';
// 								html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 								html += '		data-type="confirmOrder" data-idx="'+row['idx']+'"';
// 								html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 								html += '		data-size="small"';
// 								html += '		checked>';
// 							return html;
// 						} else {
// 							let html = '';
// 								html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 								html += '		data-type="confirmOrder" data-idx="'+row['idx']+'"';
// 								html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 								html += '		data-size="small"';
// 								html += '		>';
// 							return html;
// 						}
// 					} else {
// 						let html = '';
// 							html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 							html += '		data-type="confirmOrder" data-idx="'+row['idx']+'"';
// 							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 							html += '		data-size="small"';
// 							html += '		disabled>';
// 						return html;
// 					}
					
// 				}
// 			},
// 			{ data: 'stockUseYn', className : 'text-center align-middle', name: 'confirmYn',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data == 'Y') {
// 							let html = '';
// 							html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 							html += '		data-type="stockUseYn" data-idx="'+row['idx']+'"';
// 							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 							html += '		data-size="small"';
// 							html += '		checked>';
// 							return html;
// 						} else {
// 							let html = '';
// 							html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 							html += '		data-type="stockUseYn" data-idx="'+row['idx']+'"';
// 							html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 							html += '		data-size="small"';
// 							html += '		>';
// 							return html;
// 						}			
// 					} else {
// 						let html = '';
// 						html += '<input type="checkbox" class="bootstrapToggle confirmToggle p-0" data-toggle="toggle"';
// 						html += '		data-type="stockUseYn" data-idx="'+row['idx']+'"';
// 						html += '		data-on="<i class=\'fa-solid fa-check mt-1\'></i>" data-off="<i class=\'fa-solid fa-x mt-1\'></i>"';
// 						html += '		data-size="small"';
// 						html += '		disabled>';
// 						return html;
// 					}
// 				}
// 			},
// 			/* { data: 'printYn', className : 'text-center align-middle', name: 'printYn',
// 				render : function(data, type, row, meta) {
// 					if(data == 'Y') {
// 						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
// 					} else {
// 						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
// 					}
// 				}
// 			}, */
// 			{ data: 'purchaseOrdNo', className : 'text-center align-middle', name: 'purchaseOrdNo',
// 				render : function(data, type, row, meta) {
// 					if(data != '' && data != null) {
// 						return data;
// 					} else {
// 						return '자동채번';
// 					}
// 				}
// 			},
// 			/* { data: 'purchaseOrdDate', className : 'text-center align-middle editNode', name: 'purchaseOrdDate',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data != '' && data != null) {
// 							return moment(data,'YYYYMMDD').format('YYYY-MM-DD');
// 						} else {
// 							return '';
// 						}
// 					} else { // 등록되어있지 않는 값
// 						let html = '';
// 							html += '<input type="date" max="9999-12-31" class="form-control text-center" value="'+moment().format('YYYY-MM-DD')+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ data: 'purchaseInDueDate', className : 'text-center align-middle editNode', name: 'purchaseInDueDate',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data != '' && data != null) {
// 							return moment(data,'YYYYMMDD').format('YYYY-MM-DD');
// 						} else {
// 							return '';
// 						}
// 					} else {
// 						let html = '';
// 							html += '<input type="date" max="9999-12-31" class="form-control text-center" value="'+moment().format('YYYY-MM-DD')+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			}, */
// 			/* { data: 'matrlCd', className : 'text-center align-middle', name: 'matrlCd'}, */
// 			{ data: 'paperType', className : 'text-center align-middle', name: 'paperType'},
// 			{ data: 'dealCorpNm', className : 'text-end align-middle editNode', name: 'dealCorpNm',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						let dealCorpNm = isEmptyCheck(data) ? '' : data;
						
// 						let html = '';
// 							html += '<div class="input-group" style="min-width: 150px;">';
// 							html += '	<input type="text" class="form-control" value="'+dealCorpNm+'" disabled>';
// 							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
// 							html += '		border-color: transparent; position: absolute;';
// 							html += '		top: 0; right:0;';
// 							html += '		margin: 1px 23px; margin-left: 0px;';
// 							html += '		border: none;';
// 							html += '		" disabled>';
// 							html += '		<i class="fa-solid fa-xmark"></i>';
// 							html += '	</button>';
// 							html += '	<input type="hidden" value="'+row['dealCorpIdx']+'">';
// 							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary dealCorpModalBtn"';
// 							html += '	 data-matrlidx="'+row['matrlIdx']+'" disabled>';
// 							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
// 							html += '	</button>';
// 							html += '</div>';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					} else { // 등록되어있지 않는 값
// 						let dealCorpNm = isEmptyCheck(data) ? '' : data;
// 						let html = '';
// 							html += '<div class="input-group" style="min-width: 150px;">';
// 							html += '	<input type="text" class="form-control" value="'+dealCorpNm+'" disabled>';
// 							html += '	<button type="button" class="btnInputDel" style="background-color: transparent;';
// 							html += '		border-color: transparent; position: absolute;';
// 							html += '		top: 0; right:0;';
// 							html += '		margin: 1px 23px; margin-left: 0px;';
// 							html += '		border: none;';
// 							html += '		" >';
// 							html += '		<i class="fa-solid fa-xmark"></i>';
// 							html += '	</button>';
// 							html += '	<input type="hidden" value="'+row['dealCorpIdx']+'">';
// 							html += '	<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary dealCorpModalBtn"';
// 							html += '	 data-matrlidx="'+row['matrlIdx']+'">';
// 							html += '		<i class="fa-solid fa-magnifying-glass"></i>';
// 							html += '	</button>';
// 							html += '</div>';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
					
// 				}
// 			},
// 			{ data: 'purchaseOrdQty', className : 'text-end align-middle', name: 'purchaseOrdQty',
// 				render : function(data, type, row, meta) {
// 					return addCommas(parseInt(data));
// 				}
// 			},
// 			{ className : 'text-end align-middle', name: 'purchaseQty', // 발주량 R -> 이론량 
// 				render : function(data, type, row, meta) {
// 					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
// 					let cutQty = parseInt(row['cutQty']); // 절수
// 					let eaQty = parseInt(row['eaQty']); // 개수
// 					let extraQty = parseInt(row['extraQty']); // 여유분

// 					if(cutQty == 0 || eaQty == 0) {
// 						return '0';
// 					} else {
// 						let cuttingSize = Math.ceil(ordQty/(cutQty*eaQty));
						
// 						let R = parseInt(cuttingSize / 500); // R로 환산
// 						let purchaseQty = R + "R" + (cuttingSize % 500);
						
// 						return purchaseQty;
// 					}
// 				}
// 			},
// 			{ className : 'text-end align-middle', name: 'finalPurchaseQty', // 최종발주량 -> 발주량
// 				render : function(data, type, row, meta) {
// 					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
// 					let cutQty = parseInt(row['cutQty']); // 절수
// 					let eaQty = parseInt(row['eaQty']); // 개수
// 					let extraQty = parseInt(row['extraQty']); // 여유분
// 					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분
					
// 					if(cutQty == 0 || eaQty == 0) {
// 						return '0';
// 					} else {
// 						//let printPressQty = Math.ceil(ordQty/eaQty);
// 						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
// 						let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty);
						
// 						let R = parseInt(pressQty / 500); // R로 환산
// 						let finalPurchaseQty = R + "R" + (pressQty % 500);
						
// 						return finalPurchaseQty;
// 					}
// 				}
// 			},
// 			{ data: 'cutQty', className : 'text-end align-middle editNode', name: 'cutQty',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						return addCommas(parseInt(data));
// 					} else {
// 						let html = '';
// 							html += '<input type="text" class="form-control text-end calValue" onkeyup="numberFormat(this, \'int\')" value="'+parseInt(data)+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ data: 'eaQty', className : 'text-end align-middle editNode', name: 'eaQty',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						return addCommas(parseInt(data));
// 					} else {
// 						let html = '';
// 							html += '<input type="text" class="form-control text-end calValue" onkeyup="numberFormat(this, \'int\')" value="'+parseInt(data)+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ className : 'text-end align-middle', name: 'printPressQty', // 정매인쇄통수(이론통수)
// 				//********매우 중요**********
// 				// 이론통수를 구할때 이론 통수는 절수의 배수로 나와야하기때문에 올림된 이론통수값을 절수로 나눈 나머지로 
// 				// (절수-나머지) + 이론통수 해줘야 이론통수임
// 				// ↑↑↑↑↑↑↑↑↑↑ 였는데 2023.01.02에 다시 배수가 아니라 그냥 올림만 하기로함
// 				// ↑↑↑↑↑↑↑↑↑↑ 였는데 2023.01.10에 다시 이론량*절수의 값으로 하기로함
// 				render : function(data, type, row, meta) {
// 					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
// 					let cutQty = parseInt(row['cutQty']); // 절수
// 					let eaQty = parseInt(row['eaQty']); // 개수
// 					let extraQty = parseInt(row['extraQty']); // 여유분

// 					if(cutQty == 0 || eaQty == 0) {
// 						return '0';
// 					} else {
// 						//let printPressQty = Math.ceil(ordQty/eaQty);
// 						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
// 						return addCommas(printPressQty);
// 					}
// 				}
// 			},
// 			{ className : 'text-end align-middle', name: 'printPressAndExtraQty', // 정매인쇄통수 + 여분 + 포장단위여분(여분포함통수)
// 				render : function(data, type, row, meta) {
// 					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
// 					let cutQty = parseInt(row['cutQty']); // 절수
// 					let eaQty = parseInt(row['eaQty']); // 개수
// 					let extraQty = parseInt(row['extraQty']); // 여유분
// 					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분

// 					if(cutQty == 0 || eaQty == 0) {
// 						return '0';
// 					} else {
// 						//let printPressQty = Math.ceil(ordQty/eaQty);
// 						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
// 						let printPressAndExtraQty = printPressQty + extraQty + (extraPackQty*cutQty);
						
// 						return addCommas(printPressAndExtraQty);
// 					}
// 				}
// 			},
// 			{ data: 'extraQty', className : 'text-end align-middle calValue editNode', name: 'extraQty',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						return addCommas(parseInt(data));
// 					} else {
// 						let html = '';
// 							html += '<input type="text" class="form-control text-end" onkeyup="numberFormat(this, \'int\')" value="'+parseInt(data)+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ data: 'extraPackQty', className : 'text-end align-middle editNode', name: 'extraPackQty',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						return addCommas(parseInt(data));
// 					} else {
// 						let html = '';
// 							html += '<input type="text" class="form-control text-end" onkeyup="numberFormat(this, \'int\')" value="0">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ data: 'purchaseNote', className : 'text-center align-middle editNode', name: 'purchaseNote',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data != '' && data != null) {
// 							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 						} else {
// 							return '';
// 						}
// 					} else {
// 						let html = '';
// 							html += '<input type="text" class="form-control" style="min-width: 200px;">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 			{ data: 'purchaseDesc', className : 'text-center align-middle editNode', name: 'purchaseDesc',
// 				render : function(data, type, row, meta) {
// 					if(row['idx'] != '' && row['idx'] != null) {
// 						if(data != '' && data != null) {
// 							let text = isEmptyCheck(data) ? '' : data;
// 							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+text+'</div>';
// 						} else {
// 							return '';
// 						}
// 					} else {
// 						let text = isEmptyCheck(data) ? '' : data;
// 						let html = '';
// 							html += '<input type="text" class="form-control" style="min-width: 100px;" value="'+text+'">';
// 							html += '<span class="d-none">'+data+'</span>';
// 						return html;
// 					}
// 				}
// 			},
// 		],
// 		columnDefs : [
// 			{
// 				targets: '_all',
// 				render: function(data) {
// 					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 				}
// 			}
// 		],
// 		buttons : [
// 			// { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
// 			//	exportOptions: {
// 	        //        modifier: {
// 	        //           selected:null
// 	        //        },	                
// 	        //    },
// 	        //},
// 			// { extend: 'pdf',	text: 'PDF',	},
// 			// { extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
// 			// { extend: 'colvis',	text: 'Select Col',	},
// 		],
// 		order : [],
// 		drawCallback: function() {
// 			let api = this.api();
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let bottomcol_height = parseFloat($('#bottomcol').css('height'));
// 			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(bottomcol_height - theadHeight - 94)+'px');
			
// 			$('#purchaseOrderAdmTable_filter').addClass('d-none');
// 			// 통합검색
// 			$('#searchAll').off('keyup',function() {});
// 			$('#searchAll').on('keyup',function() {
// 				$('#purchaseOrderAdmTable_filter').find('input').val($(this).val());
// 				$('#purchaseOrderAdmTable_filter').find('input').trigger('keyup');
// 			});

// 			$('.bootstrapToggle').bootstrapToggle();

// 			let data = api.data();
// 			let node = api.rows().nodes();
// 			if(data.length > 0){
				
// 				$(node).each(function(index, item) {
// 					if( purchaseOrderAdmTable.row(item).data().printYn == 'Y' ) {
// 						$(purchaseOrderAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
// 					}
// 				});
// 			}
			
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#purchaseOrderAdmTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	purchaseOrderAdmTable.on('column-reorder', function( e, settings, details ) {
// 		let api = purchaseOrderAdmTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});

// 		$('.bootstrapToggle').bootstrapToggle();
// 	});


	// 발주확정
	$(document).off('change','#purchaseOrderAdmTable .confirmToggle');
	$(document).on('change','#purchaseOrderAdmTable .confirmToggle', function() {
		let type = $(this).data('type');

		if(type == 'confirmOrder'){
			let data = bizOrderDtlTable.row('.selected').data();

			let tableData = purchaseOrderAdmTable.row($(this).parent().parent()).data();
			/*if(data.confirmDesign != 'Y') { // 디자인컨펌이 되어야 추가 가능
				toastr.warning('해당 수주건이 디자인컨펌이 확인되지 않았습니다.');
				purchaseOrderAdmTable.ajax.reload();
				// 수주별발주내역이 존재하지 않을 경우 BOM목록을 불러와 저장할 수 있는 상태로 셋팅
				/* $('#matrlSelectGubun').val('001');
				if(purchaseOrderAdmTable.data().count() == 0 && bizOrderDtlTable.row('.selected').data() != undefined) {
					let dataList = matrlModalSelectTable.data().toArray();
					let addList = [];
					for(var i=0;i<dataList.length;i++) {
						let obj = {};
						obj.idx = '';
						obj.matrlIdx = dataList[i].matrlIdx;
						obj.matrlCd = dataList[i].matrlCd;
						obj.matrlNm = dataList[i].matrlNm;
						obj.paperType = dataList[i].paperType;
						obj.confirmYn = 'N';
						obj.printYn = 'N';
						obj.purchaseOrdNo = '자동채번';
						obj.purchaseOrdQty = ordQtyVal;
						obj.purchaseOrdDate = moment().format('YYYY-MM-DD');
						obj.purchaseInDueDate = moment().format('YYYY-MM-DD');
						if(dataList[i].dealCorpIdx > 0 && dataList[i].dealCorpNm != null){
							obj.dealCorpIdx = dataList[i].dealCorpIdx;
							obj.dealCorpNm = dataList[i].dealCorpNm;
						} else {
							obj.dealCorpIdx = '';
							obj.dealCorpNm = '';
						}
						obj.cutQty = dataList[i].cutQty;
						obj.eaQty = dataList[i].eaQty;
						obj.extraQty = dataList[i].extraQty;
						obj.extraPackQty = '0';
						obj.cutSize = dataList[i].cutSize;
						obj.purchaseNote = '';
						obj.purchaseDesc = '';
						addList.push(obj);
					}
					purchaseOrderAdmTable.rows.add(addList).draw(false);
					$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
						$(item).find('input').attr('disabled', true); // 검색 필터 disabled
					});
					purchaseOrderAdmTable.colReorder.disable();
					purchaseOrderAdmTable.draw();

					$('#btnMaterialNew').attr('disabled', false); // DTL 신규 버튼
					$('#btnMaterialSave').attr('disabled', false); // DTL 저장 버튼
					$('#btnMaterialEdit').attr('disabled', true); // DTL 수정 버튼
					$('#btnMaterialDel').attr('disabled', false); // DTL 삭제 버튼
					$('#btnMaterialCancel').attr('disabled', false); // DTL 취소 버튼

					
					
				} else {
					$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
						$(item).find('input').attr('disabled', false); // 검색 필터 disabled
					});
					purchaseOrderAdmTable.colReorder.enable();
				} */
				/*return false;
			} */
			if(tableData.printYn == 'Y'){
				toastr.warning('해당 발주서가 출력되어 수정할 수 없습니다.');
				purchaseOrderAdmTable.ajax.reload();
				
				return false;
			}
			let idx = $(this).data('idx');
			let check = $(this).prop('checked');
			let cofirmData = null;
			let stockData = null;
			//발주확정여부 선택한 경우
			if(check){
				cofirmData = 'Y';
			} else {
				stockData = 'N';
				cofirmData = 'N';
			}
			$.ajax({
				url: '<c:url value="/pm/purchaseOrderAdmUpd"/>',
				type: 'POST',
				data: {
					'idx'			:	idx,
					'confirmYn'		:	cofirmData,
					'stockUseYn'	:	stockData,
				},
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						if(check) {
							toastr.success('처리되었습니다.');
						} else {
							toastr.success('취소처리되었습니다.');
						}
						bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx;
						bizOrderAdmTable.rows('.selected').deselect(); 
						purchaseOrderAdmTable.ajax.reload(function(){},false);
						bizOrderAdmTable.ajax.reload(function(){
							bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						},false);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
						bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx;
						bizOrderAdmTable.rows('.selected').deselect(); 
						purchaseOrderAdmTable.ajax.reload(function(){},false);
						bizOrderAdmTable.ajax.reload(function(){
							bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						},false);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(type == 'stockUseYn'){
			let idx = $(this).data('idx');
			let check = $(this).prop('checked');
			let cofirmData = null;
			let stockData = null;
			if(check){
				stockData = 'Y';
				cofirmData = 'Y';
			} else {
				stockData = 'N';
				//cofirmData = 'N';
			}

			$.ajax({
				url: '<c:url value="/pm/purchaseOrderAdmUpd"/>',
				type: 'POST',
				data: {
					'idx'			:	idx,
					'confirmYn'		:	cofirmData,
					'stockUseYn'	:	stockData,
				},
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						if(check) {
							toastr.success('처리되었습니다.');
						} else {
							toastr.success('취소처리되었습니다.');
						}
						bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx;
						bizOrderAdmTable.rows('.selected').deselect(); 
						purchaseOrderAdmTable.ajax.reload(function(){},false);
						bizOrderAdmTable.ajax.reload(function(){
							bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						},false);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
						bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx;
						bizOrderAdmTable.rows('.selected').deselect(); 
						purchaseOrderAdmTable.ajax.reload(function(){},false);
						bizOrderAdmTable.ajax.reload(function(){
							bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						},false);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		}
		
	});

	// 수량 계산
	$(document).on('keyup','.editNode input', function(e) {
		let tr = $(e.target).parent().parent();
		let td = $(tr).find('td');
		let ordQty = $(td).eq(purchaseOrderAdmTable.column('purchaseOrdQty:name').index()).html();
		let cutQty = $(td).eq(purchaseOrderAdmTable.column('cutQty:name').index()).find('input').val();
		let eaQty = $(td).eq(purchaseOrderAdmTable.column('eaQty:name').index()).find('input').val();
		let extraQty = $(td).eq(purchaseOrderAdmTable.column('extraQty:name').index()).find('input').val();
		let extraPackQty = $(td).eq(purchaseOrderAdmTable.column('extraPackQty:name').index()).find('input').val();

		ordQty = parseInt(ordQty.replaceAll(/,/g,'')); // 주문수량(제품)
		cutQty = parseInt(cutQty.replaceAll(/,/g,'')); // 절수
		eaQty = parseInt(eaQty.replaceAll(/,/g,'')); // 개수
		extraQty = parseInt(extraQty.replaceAll(/,/g,'')); // 여유분
		extraPackQty = parseInt(extraPackQty.replaceAll(/,/g,'')); // 포장단위여분

		let cuttingSize = Math.ceil(ordQty/(cutQty*eaQty)); // cuttingSize
		// 이론통수를 구할때 이론 통수는 절수의 배수로 나와야하기때문에 올림된 이론통수값을 절수로 나눈 나머지로 
		// (절수-나머지) + 이론통수 해줘야 이론통수임
		// ↑↑↑↑ 2023.01.02 다시 배수가 아닌 그냥 나누고 올림만 하기로 함
		// ↑↑↑↑ 였는데 2023.01.10에 다시 이론량*절수의 값으로 하기로함
		//let printPressQty = Math.ceil(ordQty/eaQty); // 정매인쇄통수(이론통수)
		let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
		let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty); // 통수
		let R = parseInt(cuttingSize / 500); // R로 환산
		let purchaseQty = R + "R" + (cuttingSize % 500); // 발주량 R
		//let finalPurchaseQty = R + "R" + (pressQty % 500); // 최종발주량
		/* 2022.11.09 통수/500해서 R앞에 붙도록 변경 */
		let finalPurchaseQty = parseInt(pressQty/500) + "R" + (pressQty % 500); // 최종발주량
		let printPressAndExtraQty = printPressQty + extraQty + (extraPackQty*cutQty); // 정매인쇄통수 + 여유분 + 포장단위여분

		if(cutQty != 0 && eaQty != 0) {
			// $(td).eq(purchaseOrderAdmTable.column('cuttingSize:name').index()).html(addCommas(parseInt(cuttingSize)));
			$(td).eq(purchaseOrderAdmTable.column('printPressQty:name').index()).html(addCommas(parseInt(printPressQty)));
			$(td).eq(purchaseOrderAdmTable.column('printPressAndExtraQty:name').index()).html(addCommas(parseInt(printPressAndExtraQty)));
			// $(td).eq(purchaseOrderAdmTable.column('pressQty:name').index()).html(addCommas(parseInt(pressQty)));
			$(td).eq(purchaseOrderAdmTable.column('purchaseQty:name').index()).html(purchaseQty);
			$(td).eq(purchaseOrderAdmTable.column('finalPurchaseQty:name').index()).html(finalPurchaseQty);
		}
	});

	// 수주별발주 신규버튼 click
	$('#btnMaterialNew').on('click',function(){
   		WM_action_ON('collectNew', 'workingWarningModal');

   		if(bizOrderDtlTable.row('.selected').data() == undefined) {
			toastr.warning('추가하실 수주상세번호를 선택해주세요.');
			return false;
		}

		
		WM_action_ON('collectNew','workingWarningModal');
		
		purchaseOrderAdmTable.colReorder.disable();

		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼

		$('#matrlSelectModal').modal('show'); 
   	});
	$('#matrlSelectModal').on('shown.bs.modal', function() {
		matrlModalSelectTable.ajax.reload(function() {
			matrlModalSelectTable.select.style('multi');
			matrlModalSelectTable.select.toggleable(true);
		});
	});

// 	// 자재 목록 조회
// 	$('#matrlModalSelectTable thead tr').clone(true).addClass('filters').appendTo('#matrlModalSelectTable thead'); // filter 생성
// 	let matrlModalSelectTable = $('#matrlModalSelectTable').DataTable({
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
// 			url : '<c:url value="/bm/matrlInfoLstByItemBom"/>',
// 			type : 'POST',
// 			data : {
// 				itemIdx				:	function() { return itemIdx;},
// 				matrlSelectGubun	:	function() { return $('#matrlSelectGubun').val();}
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'itemGubunNm', className : 'text-center'},
// 			{ data: 'matrlCd', className : 'text-center'},
// 			{ data: 'paperType', className : 'text-center'},//재질
// 			{ data: 'sizeX', className : 'text-center'},//가로
// 			{ data: 'sizeY', className : 'text-center'},//세로
// 		],
// 		columnDefs : [
// 			//{
// 			//	targets: [0],
// 			//	render: function(data) {
// 			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
// 			//	}
// 			//}
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
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#matrlModalSelectTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#matrlModalSelectTable_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 223)+'px');
			
// 			$('#matrlModalSelectTable_filter').addClass('d-none');
// 			// 통합검색
// 			//$('#searchAll').off('keyup',function() {});
// 			//$('#searchAll').on('keyup',function() {
// 			//	$('#matrlModalSelectTable_filter').find('input').val($(this).val());
// 			//	$('#matrlModalSelectTable_filter').find('input').trigger('keyup');
// 			//});
// 		},
// 		initComplete: function () {
// 			let api = this.api();
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			// For each column
// 			api.columns().eq(0).each(function (colIdx) {
// 				// Set the header cell to contain the input element
// 				let cell = $('#matrlModalSelectTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#matrlModalSelectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	matrlModalSelectTable.on('column-reorder', function( e, settings, details ) {
// 		let api = matrlModalSelectTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#matrlModalSelectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

	// 자재목록 조회버튼 click
	$('#btnMatrlSelectReSearch').on('click', function() {
		matrlModalSelectTable.ajax.reload();
	});

	$('#matrlSelectGubun').on('change',function(){
		matrlModalSelectTable.ajax.reload();
	});
	
	// 자재 붙여넣기 버튼 click
	$('#btnMatrlSelectModalPaste').on('click', function() {
		let dataList = matrlModalSelectTable.rows('.selected').data().toArray();

		let col_filter_text = [];
		$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});

		let addList = [];
		for(var i=0;i<dataList.length;i++) {
			let obj = {};
			obj.idx = '';
			obj.matrlIdx = dataList[i].matrlIdx;
			obj.matrlCd = dataList[i].matrlCd;
			obj.matrlNm = dataList[i].matrlNm;
			obj.paperType = dataList[i].paperType;
			obj.confirmYn = 'N';
			obj.printYn = 'N';
			obj.purchaseOrdNo = '자동채번';
			obj.purchaseOrdQty = ordQtyVal;
			obj.purchaseOrdDate = moment().format('YYYYMMDD');
			obj.purchaseInDueDate = moment().add(3,'d').format('YYYYMMDD');
			if(dataList[i].dealCorpIdx > 0 && dataList[i].dealCorpNm != null){
				obj.dealCorpIdx = dataList[i].dealCorpIdx;
				obj.dealCorpNm = dataList[i].dealCorpNm;
			} else {
				obj.dealCorpIdx = '';
				obj.dealCorpNm = '';
			}
			if( $('#matrlSelectGubun').val() == '001' ) {
				obj.cutQty = dataList[i].cutQty;
				obj.eaQty = dataList[i].eaQty;
				obj.extraQty = dataList[i].extraQty;
				obj.extraPackQty = '0';
				obj.cutSize = dataList[i].cutSize;
			} else {
				obj.cutQty = '0';
				obj.eaQty = '0';
				obj.extraQty = '0';
				obj.extraPackQty = '0';
				obj.cutSize = '';
			}
			
			obj.purchaseNote = '';
			obj.purchaseDesc = dataList[i].etc1;
			addList.push(obj);
		}
		$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).hasClass('editNode') && $(td).find('input').length != 1) {
					if(index_td == purchaseOrderAdmTable.column('purchaseOrdDate:name').index()) { // 발주일자
						let value = purchaseOrderAdmTable.row(tr).data().purchaseOrdDate;
						value = moment(value).format('YYYY-MM-DD');
						$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
					} else if(index_td == purchaseOrderAdmTable.column('purchaseInDueDate:name').index()) { // 입고예정일
						let value = purchaseOrderAdmTable.row(tr).data().purchaseInDueDate;
						value = moment(value).format('YYYY-MM-DD');
						$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" onkeyup="numberFormat(this, \'int\')" value="'+value+'">');
					} else if(index_td == purchaseOrderAdmTable.column('dealCorpNm:name').index()) { // 발주처
						$(td).find('button').attr('disabled',false);
					} else { // 그 외
						let value = $(td).text();
						if(index_td == purchaseOrderAdmTable.column('cutQty:name').index() ||
						   index_td == purchaseOrderAdmTable.column('eaQty:name').index() ||
						   index_td == purchaseOrderAdmTable.column('extraQty:name').index() ||
						   index_td == purchaseOrderAdmTable.column('extraPackQty:name').index()) { // 절수, 개수, 여분, 포장단위여분
							$(td).html('<input type="text" class="form-control text-end" onkeyup="numberFormat(this, \'int\')" value="'+value+'">');
						} else {
							$(td).html('<input type="text" class="form-control text-center" value="'+value+'">');
						}
					}
				}
			})
		});
		$(purchaseOrderAdmTable.rows().nodes()).find('.bootstrapToggle').bootstrapToggle('disable');
		purchaseOrderAdmTable.rows.add(addList).draw(false);

		$('#btnMaterialSave').attr('disabled', false); // 저장 버튼
		$('#btnMaterialDel').attr('disabled', false); // 삭제 버튼
		$('#btnMaterialCancel').attr('disabled', false); // 취소 버튼
	});

	//수주별발주 저장
	$('#btnMaterialSave').on('click',function(){
		$('#my-spinner').show();
		setTimeout(function(){
			$.ajax({
				url: '<c:url value="/wm/workOrdLstWithPrcssByBizOrdDtlIdx"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'bodIdx'	:	function(){ return bizOrdDtlIdxVal; }
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if(res.result == 'ok'){
						list = res.data;
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				}
			});
	
			list = _.filter(list, v => v.progressStatus == 'WI' || v.progressStatus == 'WC')
			if(list.length != 0){
				purchaseOrderAdmTable.ajax.reload();
				$('#btnMaterialNew').attr('disabled', false); // DTL 신규 버튼
				$('#btnMaterialSave').attr('disabled', true); // DTL 저장 버튼
				$('#btnMaterialEdit').attr('disabled', false); // DTL 수정 버튼
				$('#btnMaterialDel').attr('disabled', false); // DTL 삭제 버튼
				$('#btnMaterialCancel').attr('disabled', false); // DTL 취소 버튼
				toastr.warning('이미 생산이 진행된 발주는 수정이 불가능합니다.');
				$('#my-spinner').hide();
				return false;
			} 
			$('#my-spinner').show();
			let array = [];
			let state = true;
			$('#purchaseOrderAdmTable tbody').find('tr').each(function(index, item) {
				if($(item).find('td').find('input').length > 3) {
					let td = $(item).find('td');
					let idx = purchaseOrderAdmTable.row($(item)).data().idx;
					let purchaseOrdNo = purchaseOrderAdmTable.row($(item)).data().purchaseOrdNo;
					let purchaseOrdQty = purchaseOrderAdmTable.row($(item)).data().purchaseOrdQty;
					
					//let purchaseOrdDate = $(td).eq(purchaseOrderAdmTable.column('purchaseOrdDate:name').index()).find('input').val();
					//let purchaseInDueDate = $(td).eq(purchaseOrderAdmTable.column('purchaseInDueDate:name').index()).find('input').val();
					let dealCorpIdx = $(td).eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=hidden]').val();
					let cutQty = $(td).eq(purchaseOrderAdmTable.column('cutQty:name').index()).find('input').val();
					let eaQty = $(td).eq(purchaseOrderAdmTable.column('eaQty:name').index()).find('input').val();
					let extraQty = $(td).eq(purchaseOrderAdmTable.column('extraQty:name').index()).find('input').val();
					let extraPackQty = $(td).eq(purchaseOrderAdmTable.column('extraPackQty:name').index()).find('input').val();
					let purchaseNote = $(td).eq(purchaseOrderAdmTable.column('purchaseNote:name').index()).find('input').val();
					let purchaseDesc = $(td).eq(purchaseOrderAdmTable.column('purchaseDesc:name').index()).find('input').val();

					let ordQty = parseInt(purchaseOrdQty); // 주문수량(제품)
					let cutQtyInt = parseInt(cutQty); // 절수
					let eaQtyInt = parseInt(eaQty); // 개수
					let extraQtyInt = parseInt(extraQty); // 여유분
					
					let printPressQty = Math.ceil(ordQty/eaQtyInt);
					let pressQty = Math.ceil((printPressQty + extraQtyInt)/cutQtyInt);
					
					let R = parseInt(pressQty / 500); // R로 환산
					let finalPressQty = R + "R" + (pressQty % 500);
					

					/*if(purchaseOrdDate == '') {
						toastr.warning('발주일을 선택해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('purchaseOrdDate:name').index()).find('input').focus();
						state = false;
						return false;
					}
					if(purchaseInDueDate == '') {
						toastr.warning('입고예정일을 입력해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('purchaseInDueDate:name').index()).find('input').focus();
						state = false;
						return false;
					}*/
					if(dealCorpIdx == '' || dealCorpIdx == 0) {
						toastr.warning('발주처를 선택해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('button').focus();
						state = false;
						return false;
					}
					if(cutQty == '' || cutQty == '0') {
						toastr.warning('절수를 입력해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('cutQty:name').index()).find('input').focus();
						state = false;
						return false;
					}
					if(eaQty == '' || eaQty == '0') {
						toastr.warning('개수를 입력해주세요.');
						$(td).eq(purchaseOrderAdmTable.column('eaQty:name').index()).find('input').focus();
						state = false;
						return false;
					}

					let obj = new Object();
					obj.idx = idx;
					obj.bizOrdDtlIdx = bizOrdDtlIdxVal;
					//obj.purchaseOrdDate = moment(purchaseOrdDate).format('YYYYMMDD');
					//obj.purchaseInDueDate = moment(purchaseInDueDate).format('YYYYMMDD');
					//obj.purchaseOrdDate = purchaseOrderAdmTable.row($(item)).data().purchaseOrdDate;
					//obj.purchaseInDueDate = purchaseOrderAdmTable.row($(item)).data().purchaseInDueDate;
					obj.purchaseOrdDate = moment(bizOrderAdmTable.row('.selected').data().ordDate).add(1, 'd').format('YYYYMMDD');
					obj.purchaseInDueDate = moment(bizOrderAdmTable.row('.selected').data().ordDate).add(2, 'd').format('YYYYMMDD');
					obj.dealCorpIdx = dealCorpIdx;
					obj.cutQty = cutQty.replaceAll(/,/g,'');
					obj.eaQty = eaQty.replaceAll(/,/g,'');
					obj.extraQty = extraQty.replaceAll(/,/g,'');
					obj.extraPackQty = extraPackQty.replaceAll(/,/g,'');
					obj.purchaseNote = purchaseNote;
					obj.purchaseDesc = purchaseDesc;
					obj.purchaseOrdIdxList = [];
					
					obj.purchaseOrdNo = purchaseOrderAdmTable.row($(item)).data().purchaseOrdNo;
					obj.confirmYn = purchaseOrderAdmTable.row($(item)).data().confirmYn;
					obj.matrlIdx = purchaseOrderAdmTable.row($(item)).data().matrlIdx;
					obj.matrlCd = purchaseOrderAdmTable.row($(item)).data().matrlCd;
					obj.matrlNm = purchaseOrderAdmTable.row($(item)).data().matrlNm;
					obj.paperType = purchaseOrderAdmTable.row($(item)).data().paperType;
					obj.printYn = purchaseOrderAdmTable.row($(item)).data().printYn;
					obj.purchaseOrdQty = purchaseOrdQty;
					obj.regDate = purchaseOrderAdmTable.row($(item)).data().regDate;
					obj.regIdx = purchaseOrderAdmTable.row($(item)).data().regIdx;
					obj.updDate = purchaseOrderAdmTable.row($(item)).data().updDate;
					obj.updIdx = purchaseOrderAdmTable.row($(item)).data().updIdx;
				    
				    array.push(obj);
			    }
			});

			if(!state) {
				$('#my-spinner').hide();
				return false;
			}

			array = _.differenceWith(array, purchaseOrderAdmTable.data().toArray(), _.isEqual);

			$.ajax({
				url: '<c:url value="/bs/bizOrderDtlSel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	function(){ return bizOrdDtlIdxVal; }
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if(res.result == 'ok'){
						//if(res.data.confirmDesign == 'Y'){
							if(res.data.bizStopYn == 'N'){
								$.ajax({
									url: '<c:url value="/pm/purchaseOrderAdmIU"/>',
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
						        
											WM_action_OFF('collectNew');
											$(purchaseOrderAdmTable.rows().nodes()).find('.bootstrapToggle').bootstrapToggle('enable');
											purchaseOrderAdmTable.clear().draw();
											purchaseOrderAdmTable.ajax.reload(function() {
												$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
													$(item).find('input').attr('disabled', false);// 검색 필터 enable
												});
											});
						        
											purchaseOrderAdmTable.colReorder.enable();

											processInfoTable.ajax.reload(function(){
												$('button[name=customerModalBtn]').attr('disabled',true);
												$('button[name=equipModalBtn]').attr('disabled',true);
												$('#processInfoTable tbody tr').each(function(index){
													let node = processInfoTable.row(index).node();
													if(processInfoTable.row(index).data() != undefined && processInfoTable.row(index).data() != ''){
														let prcssIdx = processInfoTable.row(index).data().prcssIdx;
														
														let multipleNode = $(node).find('td').eq(5).find('select[name=workMethodMultiSelect]');
														
														/* $(multipleNode).select2({
												    		data: JSON.parse(processInfoTable.row(index).data().workMethodJson),
												    		multiple : true,
												    		placeholder: "작업방법 선택",
												    	});
												    	
														$(node).find('td').eq(5).find('span').eq(0).css('width','100%');
												    	$(node).find('td').eq(5).find('.select2-search__field').css('width','100%');
												    	$(node).find('td').eq(5).find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
												    	
														if( processInfoTable.row(index).data().workMethod != null && processInfoTable.row(index).data().workMethod != ''){
															let splitData =  processInfoTable.row(index).data().workMethod.split(',');
															$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').val(splitData).trigger('change')
														}
														$(node).find('td').eq(5).find('select[name=workMethodMultiSelect]').attr('disabled',true);
														 */
													}
												});
												
												$('#my-spinner').hide();
												if($('#processInfoTable tbody tr').find('.dataTables_empty').length == 1){
													$('#btnProcessCopy').attr('disabled',false);
												} else {
													$('#btnProcessCopy').attr('disabled',true);
												}
												
												setTimeout(function() {
													processInfoTable.draw(false);
												},100);
											});
									        
											$('#btnMaterialNew').attr('disabled', false); // 신규 버튼
											$('#btnMaterialSave').attr('disabled', true); // 저장 버튼
											$('#btnMaterialEdit').attr('disabled', false); // 수정 버튼
											$('#btnMaterialDel').attr('disabled', false); // 삭제 버튼
											$('#btnMaterialCancel').attr('disabled', true); // 취소 버튼
										} else if(res.result == 'fail') {
											toastr.warning(res.message);
										} else {
											toastr.error(res.message);
										}
									}
								});
							} else {
								toastr.warning('수주 중지된 경우 수주별발주를<br> 수정/저장할 수 없습니다.');
								$('#my-spinner').hide();
							}
						//} else {
						//	toastr.warning('수주 확정이 안된 경우 수주별발주를<br> 수정/저장할 수 없습니다.');
						//	$('#my-spinner').hide();
						//}				
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
						purchaseOrderAdmTable.ajax.reload();
					} else {
						toastr.error(res.message);
					}
	            	$('#my-spinner').hide();
				}
			});

				
		},100);	
	});

	//자재투입 수정
	$('#btnMaterialEdit').on('click',function(){
		let selectData = bizOrderDtlTable.row('.selected').data();
		//if(selectData.confirmDesign == 'Y' ){
			//if(selectData.stockUseYn != 'Y'){
				let list = [];
				_promise_().then(()=>{
					$('#my-spinner').show();
				}).then(()=>{
					setTimeout(function(){
						$.ajax({
							url: '<c:url value="/pm/purchaseOrderAdmUpdCheckByBizOrdDtlIdx"/>',
				            type: 'POST',
				            async: false,
				            data: {
				                'bizOrdDtlIdx'	:	function(){ return bizOrdDtlIdxVal; }
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
							success : function(res) {
								if(res.result == 'ok'){
									WM_action_ON('collectNew', 'workingWarningModal');
									
									$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
										$(item).find('input').attr('disabled', true); // 검색 필터 disabled
									});

									$(purchaseOrderAdmTable.rows().nodes()).find('.bootstrapToggle').bootstrapToggle('disable');
									
									$('#purchaseOrderAdmTable tbody').find('tr').each(function(index_tr, tr) {
										$(tr).find('td').each(function(index_td, td) {
											if($(td).hasClass('editNode') && $(td).find('input').length != 1) {
												if(index_td == purchaseOrderAdmTable.column('purchaseOrdDate:name').index()) { // 발주일자
													let value = purchaseOrderAdmTable.row(tr).data().purchaseOrdDate;
													value = moment(value).format('YYYY-MM-DD');
													$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" value="'+value+'">');
												} else if(index_td == purchaseOrderAdmTable.column('purchaseInDueDate:name').index()) { // 입고예정일
													let value = purchaseOrderAdmTable.row(tr).data().purchaseInDueDate;
													value = moment(value).format('YYYY-MM-DD');
													$(td).html('<input type="date" max="9999-12-31" class="form-control text-center" onkeyup="numberFormat(this, \'int\')" value="'+value+'">');
												} else if(index_td == purchaseOrderAdmTable.column('dealCorpNm:name').index()) { // 발주처
													$(td).find('button').attr('disabled',false);
												} else { // 그 외
													let value = $(td).text();
													if(index_td == purchaseOrderAdmTable.column('cutQty:name').index() ||
													   index_td == purchaseOrderAdmTable.column('eaQty:name').index() ||
													   index_td == purchaseOrderAdmTable.column('extraQty:name').index() ||
													   index_td == purchaseOrderAdmTable.column('extraPackQty:name').index()) { // 절수, 개수, 여분, 포장단위여분
														$(td).html('<input type="text" class="form-control text-end" onkeyup="numberFormat(this, \'int\')" value="'+value+'">');
													} else {
														$(td).html('<input type="text" class="form-control text-center" value="'+value+'">');
													}
												}
											}
										})
									});
							
									purchaseOrderAdmTable.colReorder.disable();
									purchaseOrderAdmTable.draw();
							
									$('#btnMaterialNew').attr('disabled', false); // DTL 신규 버튼
									$('#btnMaterialSave').attr('disabled', false); // DTL 저장 버튼
									$('#btnMaterialEdit').attr('disabled', true); // DTL 수정 버튼
									$('#btnMaterialDel').attr('disabled', false); // DTL 삭제 버튼
									$('#btnMaterialCancel').attr('disabled', false); // DTL 취소 버튼
								} else if(res.result == 'fail') {
									toastr.warning(res.message);
									purchaseOrderAdmTable.ajax.reload();
								} else {
									toastr.error(res.message);
								}
				            	$('#my-spinner').hide();
							}
						});
					},100);
				})
			//} else {
			//	toastr.warning('재고사용인 경우<br>수정할 수 없습니다.');	
			//}
		//} else {
		//	toastr.warning('수주 확정이 안된 경우<br>수정할 수 없습니다.');
		//}
	});
	
	//자재투입 삭제
	$('#btnMaterialDel').on('click',function(){
		if($('#purchaseOrderAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = purchaseOrderAdmTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','inputMatrl');
		} else {
			purchaseOrderAdmTable.row('.selected').remove().draw();
		}
	});

	//발주처(자재투입) 목록 조회
	let matrlIdx = '';
	let dealCorpSelectGubun = 'matrlCorp';
	
	//자재투입 발주처 돋보기버튼
	$(document).on('click','.dealCorpModalBtn',function(){
		matrlIdx = purchaseOrderAdmTable.row('.selected').data().matrlIdx; //자재 식별자
		if(matrlIdx == '' || matrlIdx == null || matrlIdx == "null"){
			matrlIdx = 0;
		}
		dealCorpModalGubun = 'inputMat';
		$('#dealCorpModal').modal('show');
		setTimeout(function() {
			dealCorpModalTable.ajax.reload(function() {});
		}, 200);
		/* $('#dealCorpSelectGubun').val('matrlCorp');
		dealCorpSelectGubun = $('#dealCorpSelectGubun').val();
		$('#dealCorpSelectModal').modal('show');
		setTimeout(function() {
			dealCorpSelectModalTable.ajax.reload(function() {});
		}, 200);	 */
	});

	//자재투입 발주처 조회
	/* $('#btnDealCorpSelectSearch').on('click',function(){
		dealCorpSelectGubun = $('#dealCorpSelectGubun').val();
		dealCorpSelectModalTable.ajax.reload();
	});
	$('#dealCorpSelectGubun').on('change',function(){
		dealCorpSelectGubun = $('#dealCorpSelectGubun').val();
		dealCorpSelectModalTable.ajax.reload();
	});

	//자재투입 발주처 붙여넣기
	$('#btnDealCorpSelectModalPaste').on('click',function(){
		if(!$('#dealCorpSelectModalTable tbody tr').hasClass('selected')){
			toastr.warning('붙여넣을 행을 선택해주세요.');
			return false;
		}
		let node = purchaseOrderAdmTable.row('.selected').node();
		let nodeData = purchaseOrderAdmTable.row('.selected').data();
		let selectNodeModalData = dealCorpSelectModalTable.row('.selected').data();
		$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=hidden]').val(selectNodeModalData.idx);			//발주처 식별자
		$(node).find('td').eq(purchaseOrderAdmTable.column('dealCorpNm:name').index()).find('input[type=text]').val(selectNodeModalData.dealCorpNm);		//발주처 이름
		$('#dealCorpSelectModal').modal('hide');
	}); */

	//X버튼 눌렀을 때
	$(document).on('click','.nameDel',function(){
		/* prev-이전요소(name을 가르키는 input이어야함),next-다음요소(idx를 가르키는 hidden input이어야함) */
		if($(this).prev().hasClass('inputNm')){
			$(this).prev().val('');
		}
		//공정정보에 설비정보 지울 때 데이터테이블 값도 지워주기
		if($(this).hasClass('equipNm')){
				processInfoTable.row($(this).val()).data().equipIdx = null;
		}
		//수주별발주에 자재명을 지울 때
		if($(this).hasClass('matrlNm')){

			let node = purchaseOrderAdmTable.row($(this).val()).node();
			let data = purchaseOrderAdmTable.row($(this).val()).data();

			data.matrlIdx = null;
			data.matrlCd = null;
			data.matrlNm = null;
			data.paperType = null;
			data.sizeX = null;
			data.sizeY = null;
			
			let matrlCdIdx = purchaseOrderAdmTable.column('matrlCd:name').index();
			let paperTypeIdx = purchaseOrderAdmTable.column('paperType:name').index();
			let sizeXIdx = purchaseOrderAdmTable.column('sizeX:name').index();
			let sizeYIdx = purchaseOrderAdmTable.column('sizeY:name').index();
			let matrlNoteIdx = purchaseOrderAdmTable.column('matrlNote:name').index();

			$(node).find('td').eq(matrlCdIdx).find('div').text('');						//자재코드
			$(node).find('td').eq(paperTypeIdx).find('div').text(''); 				//재질?지질?
			$(node).find('td').eq(sizeXIdx).find('div').text('');						//장(가로)
			$(node).find('td').eq(sizeYIdx).find('div').text('');						//폭(세로)
			$(node).find('td').eq(matrlNoteIdx).find('div').text('');					//참고사항
		}
		//자재에 발주처 
		if($(this).hasClass('dealCorpNm')){
			let data = purchaseOrderAdmTable.row($(this).val()).data();
			let node = purchaseOrderAdmTable.row($(this).val()).node();
			data.dealCorpIdx = null;
			let dealCorpNmIdx = purchaseOrderAdmTable.column('dealCorpNm:name').index();
			//$(node).find('td').eq(dealCorpNmIdx).find('button[name=dealCorpModalBtn]').val('');//발주처 돋보기버튼에 자재식별자 넣어두기
			$(node).find('td').eq(dealCorpNmIdx).find('input[type=hidden]').val('');	//발주처 식별자
			data.dealCorpNm = null;
		}
		
		if($(this).next().hasClass('inputIdx')){
			$(this).next().val('');
		}
	});
	
	/* 취소 처리 */
	let CancelIdx = '';
	// 취소 버튼 click
	$('#btnProcessCancel').on('click', function() {
		CancelIdx = 'salesNew';
		$('#cancelModal').modal('show');
	});
	$('#btnMaterialCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'ADM');
		CancelIdx = 'collectNew';
		$('#cancelModal').modal('show');
	});

	// 사업장정보 조회
	function getWorkplaceLst(sVal) {
		let result = [];
		$.ajax({
			url : '<c:url value="/sm/workplaceLst"/>',
			type : 'POST',
			async : false,
			data : {
				'useYnCd' : function() { return '001'; }
			},
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					result = data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});

		let html = '';
		if(sVal != '' && sVal != null) { // 시작값이 있을 경우
			html += '<select class="form-select w-auto" ><option value="">선택</option>';
		} else {
			html += '<select class="form-select w-auto" selected><option value="">선택</option>';
		}
		for(let i=0;i<result.length;i++) {
			let data = result[i];
			if(sVal != '' && sVal != null && sVal != 0) { // 시작값이 있을 경우
				if(data.idx == sVal) {
					html += '<option value="' + data.idx + '" selected>'+data.workplaceNm+'</option>';
				} else {
					html += '<option value="' + data.idx + '" >'+data.workplaceNm+'</option>';
				}
			} else { // 시작값이 있을 경우
				if(data.mainYn == 'Y') {
					html += '<option value="' + data.idx + '" selected>'+data.workplaceNm+'</option>';
				} else {
					html += '<option value="' + data.idx + '" >'+data.workplaceNm+'</option>';
				}
			}
		}
			html += '</select>';
		return html;
	}
	function workPlaceSelectBoxAppend(sVal){
		let html = '';
		if(sVal != '' && sVal != null) { // 시작값이 있을 경우
			html += '<select class="form-select w-auto" ><option value="">선택</option>';
		} else {
			html += '<select class="form-select w-auto" selected><option value="">선택</option>';
		}
		for(let i=0;i<workPlaceList.length;i++) {
			let data = workPlaceList[i];
			if(sVal != '' && sVal != null && sVal != 0) { // 시작값이 있을 경우
				if(data.idx == sVal) {
					html += '<option value="' + data.idx + '" selected>'+data.workplaceNm+'</option>';
				} else {
					html += '<option value="' + data.idx + '" >'+data.workplaceNm+'</option>';
				}
			} else { // 시작값이 있을 경우
				if(data.mainYn == 'Y') {
					html += '<option value="' + data.idx + '" selected>'+data.workplaceNm+'</option>';
				} else {
					html += '<option value="' + data.idx + '" >'+data.workplaceNm+'</option>';
				}
			}
		}
			html += '</select>';
		return html;
	}
	
	//작업계획확정 클릭
	$('#btnWorkOrdConfirm').on('click',function(){
		let data = bizOrderDtlTable.row('.selected').data().idx;

		$.ajax({
			url: '<c:url value="/bs/bizOrderWorkOrderCheckList"/>',
            type: 'POST',
            data: {
                'bizOrdDtlIdx'			:	function(){ return bizOrdDtlIdxVal; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					//등록된 작업지시가 없을 경우 작업지시 등록해주기
					if(data.length == 0){
						$.ajax({
							url: '<c:url value="/bs/bizOrderWorkOrderInsert"/>',
				            type: 'POST',
				            data: {
				                'bizOrdDtlIdx'	:	function(){ return bizOrdDtlIdxVal; },
				                'itemIdx'		:	function(){ return itemIdx; },
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
							success : function(res) {
								if (res.result == "ok") { //응답결과
									toastr.success('작업계획확정 되었습니다.');
									bizOrdDtlIdxVal = bizOrderDtlTable.row('.selected').data().idx;
									bizOrderDtlTable.rows('.selected').deselect();
									bizOrderDtlTable.ajax.reload(function(){
										bizOrderDtlTable.row('#'+bizOrdDtlIdxVal).select();
										$(bizOrderDtlTable.row('#'+bizOrdDtlIdxVal).node()).trigger('click'); 
									},false);
								} else if(res.result == 'fail') {
									toastr.warning(res.message);
								} else {
									toastr.error(res.message);
								}
								$('#my-spinner').hide();
							}
						});
					} else if(data.length != 0){
						// 진행, 완료 상태가 있는 리스트
						let filterList = _.filter(data,v => v.progressStatus == 'WI' || v.progressStatus == 'WC');
						//진행,완료된 공정이 있는경우 -> 등록불가 , 없는 경우 등록가능 
						if(filterList.length > 0){
							toastr.warning('진행된 공정이 있어 작업계획확정이 불가능합니다.');
						} else if(filterList.length == 0){
							$('#workOrderModal').modal('show');
						}
					} 
						
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
			
	});

	$('#btnWorkOrderModalY').on('click',function(){
		$.ajax({
			url: '<c:url value="/bs/bizOrderWorkOrderInsert"/>',
            type: 'POST',
            data: {
                'bizOrdDtlIdx'	:	function(){ return bizOrdDtlIdxVal; },
                'itemIdx'		:	function(){ return itemIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('작업계획확정 되었습니다.');
					bizOrdDtlIdxVal = bizOrderDtlTable.row('.selected').data().idx;
					bizOrderDtlTable.rows('.selected').deselect();
					bizOrderDtlTable.ajax.reload(function(){
						bizOrderDtlTable.row('#'+bizOrdDtlIdxVal).select();
						$(bizOrderDtlTable.row('#'+bizOrdDtlIdxVal).node()).trigger('click'); 
					},false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});


	/********************* 수주취소 *********************/
	$('#btnBizDtlCancel').on('click',function(){
		$('#bizDtlCancelModal').modal('show');
	});

	$('#btnBizDtlCancelY').on('click',function(){
		$.ajax({
			url: '<c:url value="/bs/bizOrderDtlCancel"/>',
            type: 'POST',
            data: {
                'bizOrdDtlIdx'	:	function(){ return bizOrderDtlTable.row('.selected').data().idx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('수주 취소 되었습니다.');
					bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx; 
					let idx = bizOrderDtlTable.row('.selected').data().idx;
					
					bizOrderAdmTable.rows('.selected').deselect();
					bizOrderAdmTable.ajax.reload(function(){
						bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						//$(bizOrderAdmTable.row('#'+bizOrdAdmTrId).node()).trigger('click'); 
					},false);
					
					
					bizOrderDtlTable.row('.selected').deselect();
					bizOrderDtlTable.ajax.reload(function(){
						setTimeout(function(){
							bizOrderDtlTable.row('#'+idx).select();
							$(bizOrderDtlTable.row('#'+idx).node()).trigger('click');
							},20);
					},false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					bizOrderDtlTable.row('.selected').deselect();
					bizOrderDtlTable.ajax.reload(function(){},false);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	/********************* po완료 *********************/
	$('#btnBizDtlPoEnd').on('click',function(){
		$('#bizDtlPoEndModal').modal('show');
	});

	$('#btnBizDtlPoEndY').on('click',function(){
		$.ajax({
			url: '<c:url value="/bs/bizOrderDtlPoEnd"/>',
            type: 'POST',
            data: {
                'bizOrdDtlIdx'	:	function(){ return bizOrderDtlTable.row('.selected').data().idx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('PO 완료 되었습니다.');
					bizOrdAdmTrId = bizOrderAdmTable.row('.selected').data().idx; 
					let idx = bizOrderDtlTable.row('.selected').data().idx;
					bizOrderDtlTable.row('.selected').deselect();

					bizOrderAdmTable.rows('.selected').deselect();
					bizOrderAdmTable.ajax.reload(function(){
						bizOrderAdmTable.row('#'+bizOrdAdmTrId).select();
						//$(bizOrderAdmTable.row('#'+bizOrdAdmTrId).node()).trigger('click'); 
					},false);
					
					bizOrderDtlTable.ajax.reload(function(){
						setTimeout(function(){
							bizOrderDtlTable.row('#'+idx).select();
							$(bizOrderDtlTable.row('#'+idx).node()).trigger('click');
							},20);
					},false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					bizOrderDtlTable.row('.selected').deselect();
					bizOrderDtlTable.ajax.reload(function(){},false);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	/********************* 프로젝트 채번 *********************/
	// project 테이블
	$('#prjTable thead tr:not(:first-child)').clone(true).addClass('filters').appendTo('#prjTable thead'); // filter 생성
	let prjTable = $('#prjTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: true,
		searching: true,
		autoWidth: true,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '60vh',
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
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: true,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '60vh',
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
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: true,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '60vh',
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
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
				'prjNumberGubun'	: function() { return '004'; },
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
						return '<select class="form-select" name="baseYear" value="'+moment(data,"YYYY").format("YYYY")+'"><span class="d-none">'+data+'</span>';
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

	// prjTable 테이블 행 클릭시
	$('#prjTable tbody').on('click','tr', function() {
		
		prjVal = prjTable.row(this).data().gubunCd;
		prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;
		$('#prjNumberMake').text(prjCdMade);
	});

	// prdTypeTable 테이블 행 클릭시
	$('#prdTypeTable tbody').on('click','tr', function() {
		
		prdTypeVal = prdTypeTable.row(this).data().gubunCd;
		prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;
		$('#prjNumberMake').text(prjCdMade);
	});

	// prdGroupTable 테이블 행 클릭시
	$('#prdGroupTable tbody').on('click','tr', function() {
		gubunIdx = prdGroupTable.row(this).data().idx;
		prdGroupVal = prdGroupTable.row(this).data().gubunCd;
		prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;
		$('#prjNumberMake').text(prjCdMade);

		prdListTable.ajax.reload();
	});

	// product List 테이블 행 클릭시
	$('#prdListTable tbody').on('click','tr', function() {
		
		prdListVal = prdListTable.row(this).data().gubunCd;
		prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;
		$('#prjNumberMake').text(prjCdMade);
	});

	$('#btnPrjCdModalPaste').on('click', function(){
		if(prjVal == '_' || prdTypeVal == '_' || prdGroupVal == '_' || prdListVal == '____'){
			toastr.warning('채번 요소를 모두 선택해주세요.');
			return false;
		}

		$.ajax({
			url : '<c:url value="/bs/prjCdSeq"/>',
			type : 'POST',
			async: false,
			data : {
				'prjCd' : function(){ return prjCdMade; }
			},
			success : function(res) {
				if (res.result == "ok") { //응답결과
					prjNumSeq = res.seq;
					prjCdMade = prjVal + prdTypeVal + '-' + prdGroupVal + prdListVal + '-' + baseYear + '-' + prjNumSeq;

					$('#bizOrdPrjCd').val(prjCdMade);

					$('#prjCdModal').modal('hide');
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#yearAdjust').on('change', function(){
		prdListTable.ajax.reload();
	});


	$('#tab6Nav').on('click',function(){
		$('#my-spinner').show();
		bundleInfoTable.ajax.reload(function(){
			bundleInfoTable.columns.adjust();
			$('#my-spinner').hide();
		});
	});

	$(document).on('keyup','input[name=inputQty]',function(){
		$('input[name=inputQty]').val($(this).val());
	});

	/* $(document).on('blur', 'input[name=outReqDate]', function(){
		let data = $(this).val();
		if( moment(data).format('YYYYMMDD') < moment().format('YYYYMMDD') ){
			toastr.warning('금일보다 이전 날짜는<br>입력할 수 없습니다.');
			$(this).val(moment().format('YYYY-MM-DD'));
		}
	}); */

	$('#purchaseViewer').on('dblclick',function(){
		let idx = bizOrderAdmTable.row('.selected').data().idx;
		let data = bizOrderAdmSel(idx);
		if( !isEmptyCheck(data.purchaseUuid) && !isEmptyCheck(data.purchaseExt) ){
			//파일 blob로 불러오는곳
			let fileObject = new Object();
			fileObject.uuid = data.purchaseUuid;
			fileObject.ext = data.purchaseExt;
			let blob = getFileBlob(fileObject);
			$('#modalPurchaseViewer').attr('src','data:image/jpeg;base64,'+blob);
			$('#modalPurchaseTag').attr('href','/serverFile/' + data.purchaseUuid + '.' + data.purchaseExt);
			$('#modalPurchaseTag').text(data.purchaseFileName);
		} else {
			$('#modalPurchaseViewer').attr('src','');
			$('#modalPurchaseTag').attr('href','');
			$('#modalPurchaseTag').text('')
		}
		$('#purchaseViewerModal').modal('show');
		$('#purchaseViewerModal').css('left','0').css('top','0');
		$('#purchaseViewerModal').draggable({handle: ".modal-header"});
	});
	
	function base64ToArrayBuffer(base64) {
        const binaryString = window.atob(base64); // Comment this if not using base64
        const bytes = new Uint8Array(binaryString.length);
        return bytes.map((byte, i) => binaryString.charCodeAt(i));
   	}

// 	$('.monthAdjustButton').on('click',function(){
// 		let adjustVal = $(this).data('val');

// 		let startDateVal = $('#startDate').val();
// 		let endDateVal = $('#endDate').val();

// 		if( adjustVal != '' ){			
// 			$('#startDate').val(moment(endDateVal).subtract('M', adjustVal).format('YYYY-MM-DD'));
// 		}
// 	});

	$(document).on('change', '#startDate, #endDate', function(){
		$('#btnSearchBizAdm').trigger('click');
	});

	//입고수량 숫자만 입력하게 처리
	$(document).on('keyup', "#bizOrdQty, input[name=publishAmt], input[name=collectAmt]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas(removeCommas($(this).val())));
	}); 
	
	$(document).on('keyup', '#bizOrdQty, #bizOrdCost', function(){
		if($('#bizOrdQty').val() != '0' && $('#bizOrdQty').val() != '' && $('#bizOrdCost').val() != '0' && $('#bizOrdCost').val() != ''){
			var sum = 0;
			sum = parseFloat(removeCommas($('#bizOrdQty').val())) * parseFloat(removeCommas($('#bizOrdCost').val()));
			$('#currencyAmt').val(addCommas(sum));

			if($('#exchangeRate').val() != '0' && $('#exchangeRate').val() != ''){
				$('#bizOrdAmt').val(addCommas(parseFloat(sum) * parseFloat($('#exchangeRate').val())));
			}
		}
	});

	
	// 입력값이 숫자인지 확인하고 소수 둘째 자리까지 제한
	$(document).on('keyup', '#bizOrdCost, #bizOrdAmt, #currencyAmt, #exchangeRate', function(){
		var inputValue = $(this).val();

		if (!((event.which >= 48 && event.which <= 57) || event.which == 110 || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
	    if (!isNaN(inputValue) && inputValue.indexOf(".") !== -1) {
	      var decimalPart = inputValue.split(".")[1];
	      if (decimalPart.length > 8) {
	        // 소수 여덟 째 자리까지만 유지
	        $(this).val(parseFloat(inputValue).toFixed(8));
	      }
	    }
	});

// 	$(document).on('change', '#bizOrdQty', function(){
// 		if(serialCnt != 0){
// 			if(parseInt($('#bizOrdQty').val()) < parseInt(serialCnt)){
// 				toastr.warning('등록된 Serial No의 개수보다 적습니다.');
// 				$(this).val(parseInt(serialCnt));
// 				return false;
// 			}
// 		}
// 	});

	//환율계산 금액
	$(document).on('keyup', '#exchangeRate', function(){
		if($('#currencyAmt').val() != '0' && $('#currencyAmt').val() != '' && $('#exchangeRate').val() != '0' && $('#exchangeRate').val() != ''){
			var sum = 0;
			sum = parseFloat(removeCommas($('#currencyAmt').val())) * parseFloat(removeCommas($('#exchangeRate').val()));
			$('#bizOrdAmt').val(addCommasNoDot(sum));
		}
	});


	$(document).on('change', 'input:checkbox[name=checkBox]', function(){
		if($(this).is(':checked')){
			let data = bizOrderAdmTable.row($(this).parent()).data();
			if($('#projectGoodsTypeCd').val() == ''){
				toastr.warning('프로젝트 품명을 선택해주세요');
				$(this).prop('checked', false);
				return false;
			}
			if($('#projectGoodsNm').val() == '' || $('#projectGoodsNm').val() != data.goodsNm){
				toastr.warning('프로젝트 품명과 같아야합니다');
				$(this).prop('checked', false);
				return false;
			}

 			let salesGubunVal = '';
 			salesRecogGubunList.forEach(function(item){
			    if(item.commonCd == data.salesRecogGubun){
			    	salesGubunVal = item.commonNm;
			    }
			});

			let contractGubunVal = '';
			contractGubunList.forEach(function(item){
			    if(item.commonCd == data.contractGubun){
			    	contractGubunVal = item.commonNm;
			    }
			});
			
			let abroadGubunVal = '';
			abroadGubunList.forEach(function(item){
			    if(item.commonCd == data.abroadGubun){
			    	abroadGubunVal = item.commonNm;
			    }
			});

			let transconditionVal = '';
			transConditionList.forEach(function(item){
			    if(item.commonCd == data.transCondition){
			    	transconditionVal = item.commonNm;
			    }
			});

			let costUnitVal = '';
			costUnitList.forEach(function(item){
			    if(item.commonCd == data.costUnit){
			    	costUnitVal = item.commonNm;
			    }
			});

			let dueDateVal = data.dueDate==''||data.dueDate==null?'':moment(data.dueDate).format("YYYY-MM-DD");
			
			let html = '';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<td class="align-middle" colspan="8"><b>수주 정보1.</b></td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>수주등록일</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+moment(data.ordDate).format('YYYY-MM-DD')+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>수주처</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+data.dealCorpNm+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>수주관리번호</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+data.bizOrdNo+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">';
			html += '		<span style="color: #ff0000;">*</span>국내/해외</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+abroadGubunVal+'';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;">';
			html += '		<span style="color: #ff0000;">*</span>매출구분</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+salesGubunVal+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">';
			html += '		<span style="color: #ff0000;">*</span>계약조건</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+contractGubunVal+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">비고</th>';
			html += '	<td class="text-center align-middle" colspan="3">';
			html += '		'+data.customerDesc+'';
			html += '	</td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;">';
			html += '		<span style="color: #ff0000;">*</span>INCOTERMS</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+transconditionVal+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">';
			html += '		<span style="color: #ff0000;">*</span>통화</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+costUnitVal+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">적용환율</th>';
			html += '	<td class="text-center align-middle" colspan="3">';
			html += '		<span>'+data.exchangeRate+'</span>';
			html += '	</td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<td class="align-middle" colspan="8"><b>수주 정보2.</b></td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;">고객PO번호</th>';
			html += '	<td class="text-center align-middle">'+data.poNo+'</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;">요청납기일</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+data.dueDate == '' ? '' : moment(data.dueDate).format("YYYY-MM-DD")+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>품목유형</th>';
			html += '	<td>';
			html += '		'+data.goodsTypeNm+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>품명</th>';
			html += '	<td>';
			html += '		'+data.goodsNm+'';
			html += '	</td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>수량</th>';
			html += '	<td class="text-center align-middle">';
			html += '		<input type="text" style="border-width: 1px !important;" class="form-control text-end inputGroup" id="'+$(this).attr('id')+'_Qty" name="prjBizOrdQty" value="'+addCommas(parseInt(data.ordQty)-parseInt(data.useQty))+'"></td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>단가</th>';
			html += '	<td class="text-center align-middle">';
			html += '		<span name="prjBizOrdCost">'+addCommas(parseFloat(data.ordCost))+'</span>';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>수주금액</th>';
			html += '	<td class="text-center align-middle">';
			html += '		'+addCommas(parseFloat(data.ordAmt))+'';
			html += '	</td>';
			html += '	<th class="text-center align-middle" style="font-size:11px;"><span style="color: #ff0000;">*</span>원화수주금액</th>';
			html += '	<td class="text-center align-middle">';
			html += '		<div name="'+$(this).attr('id')+'_prjCurrencyAmt">'+addCommas(parseFloat(data.currencyAmt))+'</span>';
			html += '	</td>';
			html += '</tr>';
			html += '<tr class="'+$(this).attr('id')+'">';
			html += '	<th class="text-center align-middle" style="font-size:11px;">고객발주내용</th>';
			html += '	<td class="text-center align-middle" style="border-bottom-width: 1px !important;" colspan="7">';
			html += '		'+data.poDesc+'';
			html += '	</td>';
			html += '</tr>';

			$('#bizProjectBizTable').append(html);

			let prjQty = $('#projectQty').val();
			$('#projectQty').val(parseInt(prjQty) + parseInt(data.ordQty)-parseInt(data.useQty));
			let projectCurrencyAmt = $('#projectCurrencyAmt').val().replaceAll(/,/g, '');
			$('#projectCurrencyAmt').val(addCommas(parseInt(projectCurrencyAmt) + parseInt(data.currencyAmt)));
// 			$('input[name=prjBizOrdQty]').attr('class', 'form-control text-end inputGroup');
			
		} else{
			let prjQty = $('#projectQty').val();
			$('#projectQty').val(parseInt(prjQty) - parseInt($('.'+$(this).attr('id')).find('input').val()));
			let projectCurrencyAmt = $('#projectCurrencyAmt').val().replaceAll(/,/g, '');
			$('#projectCurrencyAmt').val(addCommas(parseFloat(projectCurrencyAmt) - (parseFloat($('div[name='+$(this).attr('id')+'_prjCurrencyAmt]').text().replaceAll(/,/g, '')))));

			$('.'+$(this).attr('id')).remove();
		}
	});

	//프로젝트 추가 버튼
	$('#btnNewProject').on('click', function(){
		$('#allCheckBox').attr('disabled', false);
		$('input:checkbox[name=checkBox]').attr('disabled', false);
		$('.inputGroup1').attr('disabled', false);

		$('#projectStartDate').val(moment().format('YYYY-MM-DD'));
		$('#projectQty').val('0');
		$('#projectCost').val('0');
		$('#projectAmt').val('0');
		$('#projectCurrencyAmt').val('0');
		$('#projectAbroadGubun').val('002');

		$('#btnNewProject').attr('disabled', true);
		$('#btnSaveProject').attr('disabled', false);
	});

	$('#projectBizGubun').on('change', function(){
		if($('#projectGoodsTypeCd').val() == ''){
			toastr.warning('품명을 먼저 선택해주세요');
			$('#projectBizGubun').val('');
			return false;
		}
	});

	$('#btnSaveProject').on('click', function(){
		if($('#projectStartDate').val() == '') {
			toastr.warning('시작일자를 선택해주세요.');
			$('#projectStartDate').focus();
			return false;
		}
		if($('#targetDate').val() == '') {
			toastr.warning('목표일자를 선택해주세요.');
			$('#targetDate').focus();
			return false;
		}
		if($('#projectCustomerIdx').val() == '') {
			toastr.warning('Customer를 선택해주세요.');
			$('#ordDate').focus();
			return false;
		}
		if($('#bizOrdPrjCd').val() == '') {
			toastr.warning('프로젝트번호를 선택해주세요.');
			$('#bizOrdPrjCd').focus();
			return false;
		}
		if($('#projectGoodsNm').val() == '') {
			toastr.warning('품명을 선택해주세요.');
			$('#btnProjectGoodsNmSelect').focus();
			return false;
		}
		if($('#projectBizGubun').val() == '') {
			toastr.warning('수주구분을 선택해주세요.');
			$('#projectBizGubun').focus();
			return false;
		}
		if($('#projectSalesGubun').val() == '') {
			toastr.warning('매출구분을 선택해주세요.');
			$('#projectSalesGubun').focus();
			return false;
		}
		if($('#projectQty').val() == '') {
			toastr.warning('수량을 입력해주세요.');
			$('#projectQty').focus();
			return false;
		}
		if($('#projectCost').val() == '') {
			toastr.warning('단가를 입력해주세요.');
			$('#projectCost').focus();
			return false;
		}
		if($('#projectCurrencyAmt').val() == '') {
			toastr.warning('수주금액을 입력해주세요.');
			$('#projectCurrencyAmt').focus();
			return false;
		}
		if($('#projectAmt').val() == '') {
			toastr.warning('원화수주금액을 입력해주세요.');
			$('#projectAmt').focus();
			return false;
		}

		if($('#projectBizGubun').val() == '001' && $('input:checkbox[name=checkBox]:checked').length == 0){
			toastr.warning('수주구분을 확인해주세요.');
			return false;
		}

		let array = [];
		let state = true;
		let useQtySum = 0;

		if(!state) {
			return false;
		}

		for(var i=0; i<$('input:checkbox[name=checkBox]:checked').length; i++){
			let data = $('#bizOrderAdmTable').DataTable().row($($('input:checkbox[name=checkBox]:checked')[i]).parent()).data();
			let chkId = $($('input:checkbox[name=checkBox]:checked')[i]).attr('id');
			let obj = new Object();
			obj.bizOrderIdx = data.idx;
			obj.useQty = $('#'+chkId+'_Qty').val();

			array.push(obj);

			useQtySum += parseInt($('#'+chkId+'_Qty').val());
			
		}

		if(useQtySum != parseInt($('#projectQty').val())){
			toastr.warning('수량을 맞게 입력해주세요.');
			state = false;
			return false;
		}
		
		if(!state) {
			return false;
		}

		$.ajax({
			url: '<c:url value="/bs/bizOrderProjectIUD"/>',
            type: 'POST',
            data: {
                'idx'				:	'',
                'startDate'			:	$('#projectStartDate').val().replaceAll(/-/g, ''),
                'targetDate'		:	$('#targetDate').val().replaceAll(/-/g, ''),
                'customerIdx'		:	$('#projectCustomerIdx').val(),
                'abroadGubun'		:	'002',
                'projectCd'			:	$('#bizOrdPrjCd').val(),
                'projectNm'			:	$('#bizOrdPrjNm').val(),
                'goodsTypeCd'		:	$('#projectGoodsTypeCd').val(),
                'goodsNm'			:	$('#projectGoodsNm').val(),
                'bizOrdGubun'		:	$('#projectBizGubun').val(),
                'salesRecogGubun'	:	$('#projectSalesGubun').val(),
                'salesProgressGubun':	$('#projectSalesProgressGubun').val(),
                'prjQty'			:	$('#projectQty').val().replaceAll(/,/g, ''),
                'prjCost'			:	$('#projectCost').val().replaceAll(/,/g, ''),
                'progressAmt'		:	$('#projectAmt').val().replaceAll(/,/g, ''),
                'currencyAmt'		:	$('#projectCurrencyAmt').val().replaceAll(/,/g, ''),
                'progressYn'		:	'N',
               	'jsonArray'			:	JSON.stringify(array),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					$('.inputGroup1').val('');
					$('#projectCustomerIdx').val('');
					$('#projectCustomerNm').val('');
					$('#bizOrdPrjCd').val('');
					$('#projectGoodsTypeCd').val('');
					$('#projectGoodsTypeNm').val('');
					$('#projectGoodsNm').val('');
					$('#bizProjectBizTable').empty();

					$('input:checkbox[name=checkBox]').prop('checked', false);
					
					$('#btnNewProject').attr('disabled', false);
					$('#btnSaveProject').attr('disabled', true);

				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	});

	$('#projectCost').on('change', function(){
		let cost = $(this).val().replaceAll(/,/g, '');
		let qty = $('#projectQty').val().replaceAll(/,/g, '');

		$('#projectCurrencyAmt').val(addCommas(parseInt(qty) * parseInt(cost)));
	});
	
</script>
</body>
</html>