<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 6fr 4px 6fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-1 monthAdjust" id="monthAdjust">
					</select>
<!-- 					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" > -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label> -->
<!-- 					<select class="form-select w-auto h-100 me-3" id="searchStatus" style="min-width: 70px;"> -->
<!-- 						<option value="" >전체</option> -->
<!-- 						<option value="P" selected>미입고</option> -->
<!-- 					</select> -->
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
<!-- 						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnEdit" ><i class="fa-regular fa-pen-to-square"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주번호</th>
							<th class="text-center">고객발주번호</th>
							<th class="text-center">수주일자</th>
							<th class="text-center">등록여부</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<div class="btn-group me-1" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnRowAdd" disabled>행추가</button>
						<button type="button" class="btn btn-outline-danger w-auto" id="btnRowRemove" disabled>행삭제</button>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-auto me-2">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnUpvoteY" disabled>상신하기</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-danger w-auto d-none" id="btnUpvoteN">상신취소</button>
					</div>
				</div>
				<div class="d-flex align-items-center justify-content-end w-auto">
					<div class="btn-group" role="group" aria-label="Small button group">
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" -->
<!-- 								id="btnGmail" onclick="window.open('about:blank').location.href='https://mail.google.com/mail/u/0/?tab=rm#inbox?compose=new'"> -->
<%-- 							<img class="w-auto" src="<c:url value='/resources/assets/images/gmail_icon.jpg?ver=1'/>" style="height: 14px; margin-bottom: 3px;"> --%>
<!-- 						</button> -->
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDownload"><i class="fa-solid fa-download"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrint"><i class="fa-solid fa-print"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
				  	<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">Project 계획서</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent" style="height:770px;overflow: auto;">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding-left: 5px; padding-top: 5px; padding-right: 5px;">
								<table id="purchasePaperTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr>
										<td colspan='8' rowspan="2" class="bd-n h-30"><span><img class="bi mx-2" src="/resources/assets/images/header_logo2.png?ver=3" style="width:200px; height: 70px;"></span></td>
										<td colspan='4' class="bd-n"></td>
										<td colspan='8' class="fs-20 text-center bt-n bl-n br-n bb-n">Project 계획서</td>
										<td colspan='5' class="bd-n"></td>
										<td colspan="5" class="bd-n"></td>
									</tr>
									<tr>
										<td colspan='4' class="fs-20 text-center bd-n"></td>
										<td colspan='8' class="fs-15 bd-n text-center align-items-center">
											<div class="row" style="text-align: center; justify-content: center;">
												【 
												<input class="form-check-input" type="radio" id="massChk" name="massDevChk" value="001" style="margin: 0px; margin-left: 5px; margin-top: 1px; width: 20px; height: 20px;">
												<label for="massChk" class="form-label d-flex align-items-center m-0 me-1 h-100">양산</label>
												<input class="form-check-input" type="radio" id="devChk"  name="massDevChk" value="002" style="margin: 0px; width: 20px; margin-top: 1px; height: 20px;">
												<label for="devChk" class="form-label d-flex align-items-center m-0 me-1 h-100">개발</label>
												 】
											</div>
										<td colspan='10' class="fs-20 text-center bd-n"></td>
									</tr>
									<tr>
										<td colspan='30' class="bd-n h-30"></td>
									</tr>
									<tr>
										<td colspan="3" class="bt-2 bl-2 text-center bg-green">과제명</td>
										<td colspan="14" class="bt-2 text-center" id="prjNmPrint"></td>
										<td colspan="3" class="bt-2 text-center bg-green">담당자</td>
										<td colspan="10" class="bt-2 br-2 text-center"><div id="prjPlanManager" class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></div></td>
									</tr>
									<tr>
										<td colspan="3" class="bl-2 text-center bg-green">리 더</td>
										<td colspan="4" class="text-center"><input type="text" id="leaderPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
										<td colspan="3" class="text-center bg-green">과제 No</td>
										<td colspan="7" class="text-center" id="prjCdPrint"></td>
										<td colspan="3" class="text-center bg-green">고객명</td>
										<td colspan="10" class="br-2 text-center"><input type="text" id="customerPrint"class="text-center p-0 fs-15" style="border:none !important;width:100%; font-weight: 900;"></td>
									</tr>
									<tr>
										<td colspan="3" class="bl-2 text-center bg-green">기 간</td>
										<td colspan="14" class="fs-8 text-center">
											<div class="row" style="text-align: center; margin-left: 40px;">
												<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-3" id="prjStartDate">
												<label class="form-label d-flex align-items-center m-0 mt-1 me-3 h-100">&nbsp;~&nbsp;</label>
												<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="prjEndDate">
											</div>
										</td>
										<td colspan="3" class="text-center bg-green">추진방법</td>
										<td colspan="10" class="br-2 text-center">
											<div class="row" style="text-align: center; margin-left: 30px;">
												<input class="form-check-input me-1" type="radio" name="forwardChk" id="selfP" value="001" style="margin: 0px; margin-left: 5px; margin-top: 1px; width: 20px; height: 20px;">
												<label for="selfP" class="form-label d-flex align-items-center m-0 me-1 h-100">자체</label>
												<input class="form-check-input me-1" type="radio" name="forwardChk" id="outP" value="002" style="margin: 0px; margin-top: 1px; width: 20px; height: 20px;">
												<label for="outP" class="form-label d-flex align-items-center m-0 me-1 h-100">외주</label>
												<input class="form-check-input me-1" type="radio" name="forwardChk" id="togetherP" value="003" style="margin: 0px; margin-top: 1px; width: 20px; height: 20px;">
												<label for="togetherP" class="form-label d-flex align-items-center m-0 me-1 h-100">공동</label>
											</div>
										</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td colspan='27' class="fs-15 text-center bd-n br-2"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan='27' class="fs-15 text-center bd-n br-2"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan='27' class="fs-15 text-center bd-n br-2"></td> -->
<!-- 									</tr> -->
<!-- 									<tr id="trAppendTarget" class="bt-2"> -->
<!-- 										<td class="bl-2 bg-gray fs-8 text-center align-middle not-left theadFirstCol">NO</td> -->
<!-- 										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">CODE</td> -->
<!-- 										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">구분1</td> -->
<!-- 										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">구분2</td> -->
<!-- 										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">MAKER</td> -->
<!-- 										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">품명</td> -->
<!-- 										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">규격</td> -->
<!-- 										<td class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">단위</td> -->
<!-- 										<td class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">수량</td> -->
<!-- 										<td colspan='2' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">단가</td> -->
<!-- 										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">금액</td> -->
<!-- 										<td colspan='3' class="bg-gray fs-8 text-center align-middle not-left theadFirstCol">납기</td> -->
<!-- 										<td colspan='5' class="br-2 bg-gray fs-8 text-center align-middle not-left theadFirstCol">비고</td> -->
<!-- 									</tr> -->
<!-- 									<tr class="bt-2" style="height:25px;"> -->
<!-- 										<td colspan='19' class="bl-2 bb-2 fs-8 text-center align-middle not-left theadFirstCol"></td> -->
<!-- 										<td colspan='2' class="fs-8 bb-2 text-center align-middle not-left theadFirstCol">TOTAL</td> -->
<!-- 										<td colspan='3' class="fs-8 bb-2 text-end align-middle not-left theadFirstCol" id="sumOrderDtlAmtPrint"></td> -->
<!-- 										<td colspan='6' class="br-2 bb-2 fs-8 text-center align-middle not-left theadFirstCol"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan='30' class="fs-15 text-center bd-n"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td rowspan="2" colspan="5" class="bl-2 bt-2 bb-2 text-center align-middle">납품장소</td> -->
<!-- 										<td rowspan="2" colspan="16" class="bt-2 bb-2 fs-10 text-center align-middle"><input type="text" id="deliveryLocPrint"class="text-center p-0 fs-15" style="border:none !important;max-width:200px; font-weight: 900;"></td> -->
<!-- 										<td rowspan="2" colspan="3" class="bt-2 bb-2 fs-10 text-center align-middle">도면 및 규격 문의</td> -->
<!-- 										<td rowspan="2" colspan="2" class="bt-2 bb-2 fs-8 text-center align-middle"><input type="text" class="text-center p-0 fs-8" style="border:none !important;max-width:30px; font-weight: 900;"></td> -->
<!-- 										<td rowspan="2" colspan="4" class="bt-2 br-2 bb-2 fs-8 text-center align-middle"><input type="text" class="text-center p-0 fs-8" style="border:none !important;max-width:50px; font-weight: 900;"></td> -->
<!-- 									</tr> -->
								</table>
							</div>
							<div class="row" style="padding-left: 5px;padding-right: 5px;">
								<table id="mainCustomerReqTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="mainCustReqTr">
										<td colspan="3" rowspan="1" class="bl-2 bt-n text-center align-middle bg-green" id="mainCusReq">주요고객<br>요구사항</td>
										<td colspan="4" class="bt-n text-center bg-green">항 목</td>
										<td colspan="23" class="bt-n br-2 text-center bg-green">요 구 사 항</td>
<!-- 										<td colspan="7" class="br-2 text-center">비고</td> -->
									</tr>
<!-- 									<tr> -->
<!-- 										<td colspan="4" class="text-center" id="inspectProd"></td> -->
<!-- 										<td colspan="23" class="br-2 text-center"> -->
<!-- 											<textarea id="inspectProdText" class="p-0 fs-10" style="border:none !important;width:100%; height:150px; font-weight: 900;"></textarea> -->
<!-- 										</td> -->
<!-- <!-- 										<td colspan='7' class="fs-15 text-center bd-n br-2"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan="4" class="text-center" id="inspectSpeed"></td> -->
<!-- 										<td colspan="23" class="br-2 text-center"> -->
<!-- 											<input type="text" id="inspectSpeedPrint"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan="4" class="text-center" id="inspectCategory"></td> -->
<!-- 										<td colspan="23" class="br-2 text-center"> -->
<!-- 											<input type="text" id="inspectCategoryPrint"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan="4" class="text-center" id="inspectQuality"></td> -->
<!-- 										<td colspan="23" class="br-2 text-center"> -->
<!-- 											<input type="text" id="inspectQualityPrint"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
								</table>
							</div>
							<!--  -->
							<div class="row" style="padding-left: 5px; padding-right: 5px;">
								<table id="inPeopleTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="inPeopleTr">
										<td colspan="3" rowspan="3" class="bl-2 bt-n text-center align-middle bg-green" id="inPeople">참여인력</td>
										<td colspan="2" class="bt-n text-center bg-green">성 명</td>
										<td colspan="2" class="bt-n text-center bg-green">직 급</td>
										<td colspan="5" class="bt-n text-center bg-green">참 여 율</td>
										<td colspan="7" class="bt-n text-center bg-green">M/D 합계</td>
										<td colspan="11" class="bt-n br-2 text-center bg-green">담 당 업 무</td>
									</tr>
									<tr>
										<td colspan="9" class="bt-n text-center bg-red">M/D 총합계</td>
										<td colspan="7" class="bt-n text-end bg-red" id="mdTotalSum">0</td>
										<td colspan="6" class="bt-n text-center bg-red">인건비(M/D*20만원)</td>
										<td colspan="5" class="bt-n br-2 text-end bg-red" id="mdPersonCost">0</td>
									</tr>
								</table>
							</div>
							<!--  -->
							<div class="row" style="padding-left: 5px; padding-right: 5px;">
								<table id="materialSalesProfitTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="materialSalesProfit">
										<td colspan="3" rowspan="9" class="bl-2 bt-n text-center align-middle bg-green" id="matProfit">재료비<br>및<br>매출이익</td>
										<td colspan="7" class="bt-n text-center bg-green">구 성 품</td>
										<td colspan="10" class="bt-n text-center bg-green">사 양</td>
										<td colspan="4" class="bt-n text-center bg-green">금 액 (원)</td>
										<td colspan="6" class="bt-n br-2 text-center bg-green">비 고</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<td colspan="7" class="text-center" id="matProfitLens"> -->
<!-- 											<div data-name="lensCd"></div> -->
<!-- 										</td> -->
<!-- 										<td colspan="10" class="text-center"> -->
<!-- 											<textarea id="matProfitLensText" class="p-0 fs-10" style="border:none !important;width:100%; height:150px; font-weight: 900;"></textarea> -->
<!-- 										</td> -->
<!-- 										<td colspan="4" class="text-center"> -->
<!-- 											<input type="text" id="matProfitLensAmt" onkeyup="numberFormat(this, 'int')" class="text-end p-0 fs-10" value="0" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 										<td colspan="6" class="br-2 text-center"> -->
<!-- 											<input type="text" id="matProfitLensDesc"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- <!-- 										<td colspan='7' class="fs-15 text-center bd-n br-2"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan="7" class="text-center" id="matProfitLine"> -->
<!-- 											<div data-name="lineCd"></div> -->
<!-- 										</td> -->
<!-- 										<td colspan="10" class="text-center"> -->
<!-- 											<input type="text" id="matProfitLineText"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 										<td colspan="4" class="text-center"> -->
<!-- 											<input type="text" id="matProfitLineAmt" onkeyup="numberFormat(this, 'int')" class="text-end p-0 fs-10" value="0" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 										<td colspan="6" class="br-2 text-center"> -->
<!-- 											<input type="text" id="matProfitLineDesc"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td colspan="7" class="text-center" id="matProfitMachine"> -->
<!-- 											<div data-name="machineCd"></div> -->
<!-- 										</td> -->
<!-- 										<td colspan="10" class="text-center"> -->
<!-- 											<input type="text" id="matProfitMachineText"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 										<td colspan="4" class="text-center"> -->
<!-- 											<input type="text" id="matProfitMachineAmt" onkeyup="numberFormat(this, 'int')" class="text-end p-0 fs-10" value="0" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 										<td colspan="6" class="br-2 text-center"> -->
<!-- 											<input type="text" id="matProfitMachineDesc"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;"> -->
<!-- 										</td> -->
<!-- 									</tr> -->
									<tr>
										<td colspan="17" class="bt-n text-center bg-red">소 계(원)</td>
										<td colspan="4" class="bt-n text-end bg-red" id="materialCost">0</td>
										<td colspan="6" class="bt-n br-2 text-end bg-red"></td>
									</tr>
									<tr>
										<td colspan="17" class="bt-n text-center bg-gray">재료비 합계(원)</td>
										<td colspan="4" class="bt-n text-end bg-gray" id="materialCostSum">0</td>
										<td colspan="6" class="bt-n br-2 text-end bg-gray"></td>
									</tr>
									<tr>
										<td colspan="17" class="bt-n text-center bg-red">외주 인건비 소계(원)</td>
										<td colspan="4" class="bt-n text-end bg-red">
											<input type="text" id="outPersonSum" onkeyup="numberFormat(this, 'int')" class="text-end p-0 fs-10 bg-red" value="0" style="border:none !important;width:100%; font-weight: 900;">
										</td>
										<td colspan="6" class="bt-n br-2 text-end bg-red"></td>
									</tr>
									<tr>
										<td colspan="17" class="bt-n text-center bg-blue">재료비 합계(원) + 외주 인건비 소계 (원)</td>
										<td colspan="4" class="bt-n text-end bg-blue" id="materialOutPersonSum">0</td>
										<td colspan="6" class="bt-n br-2 text-end bg-blue"></td>
									</tr>
									<tr>
										<td colspan="4" class="fs-8 bt-n text-center bg-green">수주액(A):백만<br>(단위:백만)</td>
										<td colspan="3" class="bt-n text-end align-middle bg-red" id="bizOrderAmt">0</td>
										<td colspan="3" class="fs-8 bt-n text-center bg-green">재료비(B)<br>(단위:백만)</td>
										<td colspan="4" class="bt-n text-end align-middle bg-red" id="materialCostFloat">0</td>
										<td colspan="3" class="fs-8 bt-n text-center bg-green">매출이익(A-B)<br>(단위:백만)</td>
										<td colspan="4" class="bt-n text-end align-middle bg-red" id="salesProfitAmt">0</td>
										<td colspan="3" class="fs-8 bt-n text-center bg-green">재료비<br>비율</td>
										<td colspan="3" class="bt-n br-2 text-center align-middle bg-red" id="materialCostPercent">0%</td>
									</tr>
								</table>
							</div>
							<!--  -->
							<div class="row" style="padding-left: 5px; padding-right: 5px;">
								<table id="carryForDateTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="carryForDate">
										<td colspan="3" rowspan="1" class="bl-2 bt-n text-center align-middle bg-green" id="processCarry">추진일정<br>(DR 일정 명시)</td>
										<td colspan="4" class="bt-n text-center bg-green">구분</td>
										<td colspan="10" class="bt-n text-center bg-green">상세 업무내용</td>
										<td colspan="3" class="bt-n text-center bg-green">일정</td>
										<td colspan="4" class="bt-n text-center bg-green">담당</td>
										<td colspan="6" class="bt-n br-2 text-center bg-green">추진방법(자체/외주)</td>
									</tr>
								</table>
							</div>
							<!--  -->
							<div class="row" style="padding-left: 5px; padding-right: 5px;">
								<table id="outPutsTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="outPuts">
										<td colspan="3" rowspan="1" class="bl-2 bt-n text-center align-middle bg-green" id="outPutList">산출물<br>List</td>
										<td colspan="4" class="bt-n text-center bg-green">종류</td>
										<td colspan="7" class="bt-n text-center bg-green">내용(or 형태)</td>
										<td colspan="3" class="bt-n text-center bg-green">건 수</td>
										<td colspan="3" class="bt-n text-center bg-green">종류</td>
										<td colspan="7" class="bt-n text-center bg-green">내용(or 형태)</td>
										<td colspan="3" class="bt-n br-2 text-center bg-green">건 수</td>
									</tr>
								</table>
							</div>
							<!--  -->
							<div class="row" style="padding-left: 5px; padding-right: 5px; padding-bottom: 5px;">
								<table id="extraInTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
									<colgroup>
										<col width="3%"><col width="3%"><col width="3%"><col width="4%"><col width="5%"><col width="4%">
										<col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="4%">
										<col width="5%"><col width="4%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									<tr id="extraIn">
										<td colspan="3" rowspan="1" class="bl-2 bt-n text-center align-middle bg-green" id="outPutList">별첨</td>
										<td colspan="14" class="bt-n text-center">
											<textarea id="extraInPrint"class="p-0 fs-10" style="border:none !important; width:100%; font-weight: 900;"></textarea>
										</td>
										<td colspan="3" class="bt-n text-center align-middle bg-green">특기사항</td>
										<td colspan="10" class="bt-n text-center">
											<input type="text" id="extraWritePrint"class="text-center p-0 fs-10" style="border:none !important; width:100%; font-weight: 900;">
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 상신완료 입력 모달 -->
<div class="modal fade" id="upvoteDetailModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					상신 정보
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnUpvoteDetailSave"><i class="fa-regular fa-floppy-disk"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
					<tr>
						<th class="text-center align-middle">상신자</th>
						<td class="text-center align-middle">
							<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="hidden" id="upvoteUserIdx">
								<input type="text" class="form-control inputGroup" id="upvoteUserName" disabled>
							</div>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">상신일자</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control" id="upvoteDate">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">특이사항</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control" id="upvoteReason">
						</td>
					</tr>
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
			let rightcolMinWidth = 700; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

			//console.log(Math.max(rightColWidth, rightcolMinWidth));
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
			$('#page').css('grid-template-columns', '6fr 4px 6fr');
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
			$('#page').css('grid-template-columns', '6fr 4px 6fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '6fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정s
	
	let paperLineCountList = getCommonCode('시스템', '019'); //발주서라인수
	let paperLineCount = parseInt(paperLineCountList[0].commonNm);
	let mainCustomerReqList = getCommonCode('시스템', '033'); //주요고객 요구사항
	let materialSalesProfitList = getCommonCode('시스템', '032'); //구성품
	let processCarryList = getCommonCode('시스템', '031'); //추진일정
	let calculationList = getCommonCode('시스템', '030'); //산출물 List
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let idxVal = '';
	let prjCd = '';
	let prjNm = '';
	let bizOrderAmt = 0;

	let rowStatus = '';
	let upvoteYnVal = '';
	let approvalVal = '';
	
	// 수주 목록 조회
	$('#bizOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmTable thead'); // filter 생성
	let bizOrderAdmTable = $('#bizOrderAdmTable').DataTable({
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
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'prjCd', className : 'text-center'},
			{ data: 'bizOrdNo', className : 'text-center'},
			{ data: 'customerNo', className : 'text-center'},
			{ data: 'ordDate', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					} else return '-';
				}
			},
			{ data: 'planIdx', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data!=null){
						if(data != "0" && data != 0){
							return '등록';
						} else return '미등록';
					} else return '미등록';
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
			let theadHeight = parseFloat($('#bizOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		bizOrderAdmTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주 데이터 click
	$('#bizOrderAdmTable tbody').on('click','tr', function() {
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}

		rowStatus = '';

		idxVal = bizOrderAdmTable.row(this).data().planIdx;
		prjNm = bizOrderAdmTable.row(this).data().prjNm;
		prjCd = bizOrderAdmTable.row(this).data().prjCd;
		bizOrderAmt = bizOrderAdmTable.row(this).data().ordAmt;

		$('#btnRowAdd').attr('disabled', true);
		$('#btnRowRemove').attr('disabled', true);
		$('#btnEdit').attr('disabled', false);
		$('#btnSave').attr('disabled', true);

		if(idxVal != 0 && idxVal != '0'){
			//입력 행 삭제
			$('#mainCustomerReqTable tr:not(:first)').remove();
			$('#inPeopleTable tr:not(:first):not(:last)').remove();
			var materialLength = $('#materialSalesProfitTable tbody tr').length;
			for(var i=1; i<materialLength-5; i++){
				var tr = $('#materialSalesProfitTable tbody tr').eq(1);
				tr.remove();
			}
			$('#carryForDateTable tr:not(:first)').remove();
			$('#outPutsTable tr:not(:first)').remove();
			
			$.ajax({
				url: '<c:url value="/bs/bizPrjPlanSel"/>',
	            type: 'POST',
	            async: false,
	            data: {    
		            'prjCd'		:	function(){return prjCd;},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						$('#bizOrderAmt').text(parseFloat(parseInt(bizOrderAmt)/1000000).toFixed(1));
						
						let data = res.data;
						let mainCustLst = res.mainCustLst;
						let inPeopleLst = res.inPeopleLst;
						let materialLst = res.materialLst;
						let carryLst 	= res.carryLst;
						let outputsLst 	= res.outputsLst;

						upvoteYnVal = data.upvoteYn;
						approvalVal = data.approvalYn;
						$('#prjPlanManager').text(data.userName);

						$('input[name=massDevChk][value='+data.massDev+']').prop('checked', true);
						$('#prjNmPrint').text(data.prjNm);
						$('#prjCdPrint').text(data.prjCd);
						$('#leaderPrint').val(data.leader);
						$('#customerPrint').val(data.customer);
						$('#prjStartDate').val(moment(data.startDate).format('YYYY-MM-DD'));
						$('#prjEndDate').val(moment(data.endDate).format('YYYY-MM-DD'));
						$('input[name=forwardChk][value='+data.forwardWay+']').prop('checked', true);
						$('#extraInPrint').val(data.extraIn.replaceAll(/(<br>|<br\/>|<br \/>)/g, '\r\n'));
						$('#extraWritePrint').val(data.extraWrite);

						//주요고객 요청사항
						$('#mainCusReq').attr('rowspan', mainCustLst.length+1);
						var tr = $('#mainCustReqTr');
						for(var i=0; i<mainCustLst.length; i++){
							tr.after(makeMainCustTr(mainCustLst[i].mainCustSub, mainCustLst[i].mainCustReqContent.replaceAll(/(<br>|<br\/>|<br \/>)/g, '\r\n')));
							tr = tr.next();
						}

						//참여인력
						var mdTotal = 0.0;
						$('#inPeople').attr('rowspan', inPeopleLst.length+2);
						var tr1 = $('#inPeopleTr');
						for(var i=0; i<inPeopleLst.length; i++){
							var mdSum = parseFloat(inPeopleLst[i].inPercent/100) * parseInt(inPeopleLst[i].inDays);
							mdTotal += parseFloat(mdSum);
							tr1.after(makeEmptyTr(inPeopleLst[i].inUserIdx, inPeopleLst[i].inUserName, '', inPeopleLst[i].userPositionNm, inPeopleLst[i].inPercent, inPeopleLst[i].inDays, parseFloat(mdSum).toFixed(1), inPeopleLst[i].userMainWork));
							tr1 = tr1.next();
						}
						$('#mdTotalSum').text(parseFloat(mdTotal).toFixed(1));
						$('#mdPersonCost').text('￦' + addCommas(parseFloat(mdTotal).toFixed(1) * 200000));
						
						//재료비 및 매출이익
						var sum = 0;
						$('#matProfit').attr('rowspan', materialLst.length+6);
						var tr2 = $('#materialSalesProfit');
						for(var i=0; i<materialLst.length; i++){
							tr2.after(makeMatetialTr(materialLst[i].materialSub, materialLst[i].materialSpec.replaceAll(/(<br>|<br\/>|<br \/>)/g, '\r\n'), addCommas(materialLst[i].materialAmt), materialLst[i].materialDesc));
							tr2 = tr2.next();
							sum += parseInt(materialLst[i].materialAmt);
						}
						$('#materialCost').text(addCommas(sum));
						$('#materialCostSum').text(addCommas(sum));
						$('#outPersonSum').val(addCommas(materialLst[0].outPersonSum));
						$('#materialOutPersonSum').text(addCommas(parseInt(sum) + parseInt(materialLst[0].outPersonSum)));
						$('#materialCostFloat').text(parseFloat(sum/1000000).toFixed(1));
						var salesProfitVal = parseInt(bizOrderAmt) - sum;
						$('#salesProfitAmt').text(parseFloat(salesProfitVal/1000000).toFixed(1));
						$('#materialCostPercent').text(parseFloat(sum/parseInt(bizOrderAmt)*100).toFixed(1)+'%');

						//추진일정
						$('#processCarry').attr('rowspan', carryLst.length+1);
						var tr3 = $('#carryForDate');
						for(var i=0; i<carryLst.length; i++){
							tr3.after(makeCarryTr(carryLst[i].carryGubunNm, carryLst[i].carryDetails, carryLst[i].carryDuringStartMon, carryLst[i].carryDuringStartDay, carryLst[i].carryDuringEndMon, carryLst[i].carryDuringEndDay, carryLst[i].carryMainUser, carryLst[i].carryWay));
							tr3 = tr3.next();
						}

						//산출물리스트
						$('#outPutList').attr('rowspan', outputsLst.length+1);
						var tr4 = $('#outPuts');
						for(var i=0; i<outputsLst.length; i+=2){
							tr4.after(makeCalculTr(outputsLst[i].calNm, outputsLst[i].calContent, outputsLst[i].calCnt, outputsLst[i+1].calNm == null ? '' : outputsLst[i+1].calNm, outputsLst[i+1].calContent, outputsLst[i+1].calCnt));
							tr4 = tr4.next();
						}
						
						cssChange(); // css반영
						$('#rightcol').find($('input:text')).attr('disabled', true);
						$('textarea').attr('disabled', true);
						$('#prjStartDate').attr('disabled', true);
						$('#prjEndDate').attr('disabled', true);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();

				}
			});

			if(upvoteYnVal == 'Y'){
				$('#btnUpvoteY').addClass('d-none');
				$('#btnUpvoteN').removeClass('d-none');
				$('#btnUpvoteY').attr('disabled', true);
			} else {
				$('#btnUpvoteN').addClass('d-none');
				$('#btnUpvoteY').removeClass('d-none');
				$('#btnUpvoteY').attr('disabled', false);
			}
		}

// 		mainCustomerReqList.forEach(function(item) {
// 			if(data == item.commonCd){
// 				outDepartmentNm = item.commonNm;
// 			}
// 		});
	});

	//project계획서
	$('#btnEdit').on('click', function(){
		if($('#bizOrderAdmTable').DataTable().row('.selected').length == 0){
			toastr.warning('프로젝트를 선택해주세요.');
			return false;
		}

		$('#rightcol').find('input:text').attr('disabled', false);
		$('textarea').attr('disabled', false);
		$('#prjStartDate').attr('disabled', false);
		$('#prjEndDate').attr('disabled', false);

		$('#prjNmPrint').text(prjNm);
		$('#prjCdPrint').text(prjCd);
		$('#bizOrderAmt').text(parseFloat(parseInt(bizOrderAmt)/1000000).toFixed(1));

		$('#btnRowAdd').attr('disabled', false);
		$('#btnRowRemove').attr('disabled', false);
		$('#btnEdit').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		
	});
	
	// 발주서 인쇄 버튼 click
	$('#btnPrint').on('click',function() {
		$('#my-spinner').show();
		_promise_().then((value)=>{
			let updDtlNo = '';
			let status = false;
			let printYn = 'N';
			/* $('#bizOrderAdmTable tbody tr').each(function(index){
				let data = bizOrderAdmTable.row(index).data();
				let node = bizOrderAdmTable.row(index).node();
				let checkboxIdx = bizOrderAdmTable.column('checkbox:name').index();
				if( $(node).find('td').eq(checkboxIdx).find('input[name=purchasePrint]').prop('checked') ){
					updDtlNo += data.idx +', ';
					if(data.printNo != null && data.printNo !=''){
						printYn='Y';
					}
				}	
			}); */
			$('input[name=purchasePrint]:checked').each(function(index, item){
				let tr = $(item).parent().parent();
				let node = bizOrderAdmTable.row(tr).node();
				let data = bizOrderAdmTable.row(tr).data();
				updDtlNo += data.orderDtlNo +',';
				//if(data.printNo != null && data.printNo !=''){
				//	printYn='Y';
				//}				
			});
			if(updDtlNo != '' && updDtlNo != null && printYn == 'N'){
				updDtlNo = updDtlNo.slice(0,-1);
				$.ajax({
					url: '<c:url value="/pm/purchasePaperUpd"/>',
		            type: 'POST',
		            async: false,
		            data: {    
			            'updDtlNo'			:	function(){return updDtlNo;},
			            'printDate'			:	function(){return moment().format('YYYYMMDD');},
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							//toastr.success('발주서 출력번호 수정되었습니다.');
							cssChange(); // css반영
							
							$('#purchasePaperTable').print({
								globalStyles: true,
								mediaPrint: true
							});
							$('#btnSearch').trigger('click');
							$('#checkAll').prop("checked",false);
							status = true;
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
							$('#btnSearch').trigger('click');
							$('#checkAll').prop("checked",false);
							status = false;
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();

					}
				});
			} else {
				cssChange(); // css반영
				
				$('#purchasePaperTable').print({
					globalStyles: true,
					mediaPrint: true
				});
				status = true;
			}
			return status;
		}).then((value)=>{
			setTimeout(function() {

				$('#my-spinner').hide();
			}, 200);
		});
	});
	// 작업인쇄 모달이 띄워지면 인쇄
	$('#workOrderPaperModal').on('shown.bs.modal', function (e) {
		$('#purchasePaperTable').print({
			globalStyles: true,
			mediaPrint: true
		});
		$('#workOrderPaperModal').modal('hide');
		$('#my-spinner').hide();
	});

	// 발주서 다운로드 버튼 click
	$('#btnDownload').on('click', function() {
		cssChange(); // css반영
		html2canvas($('#purchasePaperTable')[0], {
			allowTaint : true,	// cross-origin allow
			useCORS: true,		// CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale : 2			// 기본 96dpi에서 해상도를 두 배로 증가
		}).then(function(canvas) {
			var element = document.getElementById('purchasePaperTable');
			var opt = {
			  margin:       3,
			  filename:     moment().format('YYYYMMDD')+'_발주서.pdf',
			  image:        { type: 'jpeg', quality: 0.98 },
			  html2canvas:  { scale: 1 },
			  jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait'}
			};

			// New Promise-based usage:
			html2pdf().from(element).set(opt).save().then(() => {
				
			});
		});
	});


	// 초기 셋팅
	$(document).ready(function() {
		
		$('#my-spinner').hide();
		$('#purchasePaperTable').removeClass('d-none');

		$('#prjPlanManager').text(userName);

		//주요고객 요청사항
		$('#mainCusReq').attr('rowspan', mainCustomerReqList.length+1);
		var tr = $('#mainCustReqTr');
		for(var i=0; i<mainCustomerReqList.length; i++){
			tr.after(makeMainCustTr(mainCustomerReqList[i].commonNm, ''));
			tr = tr.next();
		}
		$('#mainCustomerReqTable').removeClass('d-none');
// 		$('#inspectProd').text(mainCustomerReqList[0].commonNm);
// 		$('#inspectSpeed').text(mainCustomerReqList[1].commonNm);
// 		$('#inspectCategory').text(mainCustomerReqList[2].commonNm);
// 		$('#inspectQuality').text(mainCustomerReqList[3].commonNm);

		//참여인력
		$('#inPeopleTable').removeClass('d-none');

		//재료비 및 매출이익
		$('#matProfit').attr('rowspan', materialSalesProfitList.length+6);
		var tr = $('#materialSalesProfit');
		for(var i=0; i<materialSalesProfitList.length; i++){
			tr.after(makeMatetialTr(materialSalesProfitList[i].commonNm, '', 0, ''));
			tr = tr.next();
		}
		$('#materialSalesProfitTable').removeClass('d-none');
		
		//추진일정
		$('#processCarry').attr('rowspan', processCarryList.length+1);
		var tr = $('#carryForDate');
		for(var i=0; i<processCarryList.length; i++){
			tr.after(makeCarryTr(processCarryList[i].commonNm, '', '', '', '', '', '', ''));
			tr = tr.next();
		}
		$('#carryForDateTable').removeClass('d-none');

		//산출물리스트
		$('#outPutList').attr('rowspan', calculationList.length+1);
		var tr1 = $('#outPuts');
		for(var i=0; i<calculationList.length; i+=2){
			tr1.after(makeCalculTr(calculationList[i].commonNm, '', '', calculationList[i+1].commonNm == null ? '' : calculationList[i+1].commonNm, '', ''));
			tr1 = tr1.next();
		}
		$('#outPutsTable').removeClass('d-none');

		
		$('#extraInTable').removeClass('d-none');
		
		$('input').attr('autocomplete','one-time-code');

		cssChange();
		$('#rightcol').find($('input:text')).attr('disabled', true);
		$('textarea').attr('disabled', true);
		$('#prjStartDate').attr('disabled', true);
		$('#prjEndDate').attr('disabled', true);
	});

	$('#inPeople').on('click', function(){
		if($('#btnSave').attr('disabled') != 'disabled'){
			userSel();
		}
	});

	//make mainCust tr
	function makeMainCustTr(name, content) {
		let html = '';
			html += '<tr>';
			html += '	<td colspan="4" class="text-center">';
			html += '		<input type="text" name="mainCustSub" value="'+name+'" class="p-0 fs-10 text-center" style="border:none !important;width:100%; font-weight: 900;">';
			html += '	</td>';
			html += '	<td colspan="23" class="br-2 text-center">';
			if(name == '검사 대상물'){
				html += '		<textarea name="mainCustReqContent" class="p-0 fs-10" style="border:none !important;width:100%; height:150px; font-weight: 900;">'+content+'</textarea>';
			}else {
				html += '		<input type="text" name="mainCustReqContent" class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+content+'">';
			}
			html += '	</td>';
			html += '</tr>';
			
		return html;
	}

	// make empty tr
	function makeEmptyTr(userIdx, userNm, userPositionCd, userPositionNm, inPercent, inDays, mdSum, userMainWork) {
		let html = '';
			html += '<tr>';
			html += '	<td colspan="2" class="bt-n text-center">';
			html += '		<div data-name="userIdx" class="d-none">'+userIdx+'</div>';
			html += '		<div data-name="userNm">'+userNm+'</div>';
			html += '	</td>';
			html += '	<td colspan="2" class="bt-n text-center">';
			html += '		<div data-name="userPositionCd" class="d-none">'+userPositionCd+'</div>';
			html += '		<div data-name="userPositionCd">'+userPositionNm+'</div>';
			html += '	</td>';
			html += '	<td colspan="2" class="bt-n br-n text-center">';
			html += '		<div class="row" style="justify-content:space-between;">';
			html += '			<input type="text" maxlength="2" onkeyup="numberFormat(this, \'int\')" style="width:30px;" name="inPercent" value="'+parseInt(inPercent)+'" class="form-control text-end">';
			html += '			<span class="align-center" style="padding-top: 0.1rem">%</span>';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n bl-n text-center">';
			html += '		<div class="row" style="justify-content:space-between;">';
			html += '			<span>/ </span>';
			html += '			<input type="text" maxlength="2" onkeyup="numberFormat(this, \'int\')" style="width:30px;" name="inDays" value="'+parseInt(inDays)+'" class="form-control text-end">';
			html += '			<span style="padding: 0.1rem">일</span>';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="2" class="bt-n br-n text-center">';
			html += '		<div class="row" style="justify-content:space-around;">';
			html += '			<div name="inPercentFloat">'+parseInt(inPercent)/100+'</div>';
			html += '			<span style="padding: 0.1rem">*</span>';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="2" class="bt-n bl-n br-n text-center">';
			html += '		<div class="row" style="justify-content:space-around;">';
			html += '			<div name="inDaysUnder">'+parseInt(inDays)+'</div>';
			html += '			<span>=</span>';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n text-center">';
			html += '		<div class="row" style="justify-content:flex-end;">';
			html += '			<div name="inPercentInDays">'+mdSum+'</div>';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="11" class="bt-n br-2 text-center">';
			html += '		<input type="text" name="userMainWork"class="text-center p-0 fs-10" value="'+userMainWork+'" style="border:none !important;width:100%; font-weight: 900;">';
			html += '	</td>';
			html += '</tr>';
			
		return html;
	}

	// make empty tr
	function makeMatetialTr(name, spec, amt, desc) {
		let html = '';
			html += '<tr>';
			html += '	<td colspan="7" class="text-center">';
			html += '		<input type="text" name="materialSub" value="'+name+'" class="text-center p-0 fs-10" value="0" style="border:none !important;width:100%; font-weight: 900;">';
			html += '	</td>';
			html += '	<td colspan="10" class="text-center">';
			if(name == '광학품'){
				html += '		<textarea name="materialSpec" class="p-0 fs-10" style="border:none !important;width:100%; height:150px; font-weight: 900;">'+spec+'</textarea>';
			}else {
				html += '		<input type="text" name="materialSpec" class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+spec+'">';
			}
			html += '	</td>';
			html += '	<td colspan="4" class="text-center">';
			html += '		<input type="text" name="materialAmt" onkeyup="numberFormat(this, \'int\')" class="text-end p-0 fs-10"  value="'+amt+'" style="border:none !important;width:100%; font-weight: 900;">';
			html += '	</td>';
			html += '	<td colspan="6" class="br-2 text-center">';
			html += '		<input type="text" name="materialDesc"class="p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+desc+'">';
			html += '	</td>';
			html += '</tr>';
			
		return html;
	}

	// make empty tr
	function makeCarryTr(carryGubunNm, details, sMon, sDay, eMon, eDay, mainUser, carryWay) {
		let html = '';
			html += '<tr>';
			html += '	<td colspan="4" class="bt-n text-center bg-green">';
			html += '		<input name="carryGubunNm" class="bg-green text-center fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+carryGubunNm+'"></div>';
			html += '	</td>';
			html += '	<td colspan="10" class="bt-n text-center">';
			html += '		<input type="text" name="carryDetails"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+details+'">';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n text-center">';
			html += '		<div class="row">';
			html += '			<input type="text" name="carryDuringStartMonth" maxlength="2" class="text-center p-0 fs-8" style="border:none !important;width:18%; font-weight: 500;" value="'+sMon+'">-';
			html += '			<input type="text" name="carryDuringStartDay" maxlength="2" class="text-center p-0 fs-8" style="border:none !important;width:18%; font-weight: 500;" value="'+sDay+'">';
			html += '			&nbsp~&nbsp';
			html += '			<input type="text" name="carryDuringEndMonth" maxlength="2" class="text-center p-0 fs-8" style="border:none !important;width:18%; font-weight: 500;" value="'+eMon+'">-';
			html += '			<input type="text" name="carryDuringEndDay" maxlength="2" class="text-center p-0 fs-8" style="border:none !important;width:18%; font-weight: 500;" value="'+eDay+'">';
			html += '		</div>';
			html += '	</td>';
			html += '	<td colspan="4" class="bt-n text-center">';
			html += '		<input type="text" name="carryMainUser"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+mainUser+'">';
			html += '	</td>';
			html += '	<td colspan="6" class="bt-n br-2 text-center">';
			html += '		<input type="text" name="carryWay"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+carryWay+'">';
			html += '	</td>';
			html += '</tr>';
		return html;
	}

	// make empty tr
	function makeCalculTr(calculationKindNm, calculationContent, calculationCnt, calculationKindNm1, calculationContent1, calculationCnt1) {
		let html = '';
			html += '<tr>';
			html += '	<td colspan="4" class="bt-n text-center bg-green">';
			html += '		<input name="calculationKindNm" class="bg-green text-center fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationKindNm+'"></div>';
			html += '	</td>';
			html += '	<td colspan="7" class="bt-n text-center">';
			html += '		<input type="text" name="calculationContent"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationContent+'">';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n text-center">';
			html += '		<input type="text" name="calculationCnt"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationCnt+'">';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n text-center bg-green">';
			html += '		<input name="calculationKindNm1" class="bg-green text-center fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationKindNm1+'"></div>';
			html += '	</td>';
			html += '	<td colspan="7" class="bt-n text-center">';
			html += '		<input type="text" name="calculationContent1"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationContent1+'">';
			html += '	</td>';
			html += '	<td colspan="3" class="bt-n br-2 text-center">';
			html += '		<input type="text" name="calculationCnt1"class="text-center p-0 fs-10" style="border:none !important;width:100%; font-weight: 900;" value="'+calculationCnt1+'">';
			html += '	</td>';
			html += '</tr>';

		return html;
	}

	function cssChange() {
		$('#purchasePaperTable').find('td').css('font-weight', '900');
		$('#purchasePaperTable').find('td').css('border', '1px solid black');
 		$('#purchasePaperTable').find('td').css('padding', '0.1rem');
		$('#purchasePaperTable').find('td').css('color', '#000000');

		$('#purchasePaperTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#purchasePaperTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#purchasePaperTable').find('.bg-red').css('background-color', '#DA9694');
		$('#purchasePaperTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		
		$('#purchasePaperTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#purchasePaperTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#purchasePaperTable').find('.fs-6').css('font-size', '6px');
		$('#purchasePaperTable').find('.fs-8').css('font-size', '8px');
		$('#purchasePaperTable').find('.fs-10').css('font-size', '10px');
		$('#purchasePaperTable').find('.fs-13').css('font-size', '13px');
		$('#purchasePaperTable').find('.fs-15').css('font-size', '15px');
		$('#purchasePaperTable').find('.fs-20').css('font-size', '20px');
		$('#purchasePaperTable').find('.fs-30').css('font-size', '30px');
		$('#purchasePaperTable').find('.fs-50').css('font-size', '50px');
		$('#purchasePaperTable').find('.fc-red').css('color', '#ff0000');
		$('#purchasePaperTable').find('.bt-2').css('border-top', '2px solid black');
		$('#purchasePaperTable').find('.bl-2').css('border-left', '2px solid black');
		$('#purchasePaperTable').find('.br-2').css('border-right', '2px solid black');
		$('#purchasePaperTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#purchasePaperTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#purchasePaperTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#purchasePaperTable').find('.bb-b').css('border', '1px solid black');
		$('#purchasePaperTable').find('.h-5').css('height', '5px');
		$('#purchasePaperTable').find('.h-10').css('height', '10px');
		$('#purchasePaperTable').find('.h-20').css('height', '20px');
		$('#purchasePaperTable').find('.h-30').css('height', '30px');
		$('#purchasePaperTable').find('.h-40').css('height', '40px');
		$('#purchasePaperTable').find('.h-55').css('height', '55px');
		$('#purchasePaperTable').find('.h-70').css('height', '70px');
		$('#purchasePaperTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#purchasePaperTable').find('td').length;i++) {
			let tdStyle = $('#purchasePaperTable').find('td').eq(i).attr('style') == undefined?'':$('#purchasePaperTable').find('td').eq(i).attr('style');
			$('#purchasePaperTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#mainCustomerReqTable').find('td').css('font-weight', '900');
		$('#mainCustomerReqTable').find('td').css('border', '1px solid black');
 		$('#mainCustomerReqTable').find('td').css('padding', '0.1rem');
		$('#mainCustomerReqTable').find('td').css('color', '#000000');

		$('#mainCustomerReqTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#mainCustomerReqTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#mainCustomerReqTable').find('.bg-red').css('background-color', '#DA9694');
		$('#mainCustomerReqTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		
		$('#mainCustomerReqTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#mainCustomerReqTable').find('.theadFirstCol').css('border-left', '2px');
		$('#mainCustomerReqTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#mainCustomerReqTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#mainCustomerReqTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#mainCustomerReqTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#mainCustomerReqTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#mainCustomerReqTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#mainCustomerReqTable').find('.fs-6').css('font-size', '6px');
		$('#mainCustomerReqTable').find('.fs-8').css('font-size', '8px');
		$('#mainCustomerReqTable').find('.fs-10').css('font-size', '10px');
		$('#mainCustomerReqTable').find('.fs-13').css('font-size', '13px');
		$('#mainCustomerReqTable').find('.fs-15').css('font-size', '15px');
		$('#mainCustomerReqTable').find('.fs-20').css('font-size', '20px');
		$('#mainCustomerReqTable').find('.fs-30').css('font-size', '30px');
		$('#mainCustomerReqTable').find('.fs-50').css('font-size', '50px');
		$('#mainCustomerReqTable').find('.fc-red').css('color', '#ff0000');
		$('#mainCustomerReqTable').find('.bt-2').css('border-top', '2px solid black');
		$('#mainCustomerReqTable').find('.bl-2').css('border-left', '2px solid black');
		$('#mainCustomerReqTable').find('.br-2').css('border-right', '2px solid black');
		$('#mainCustomerReqTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#mainCustomerReqTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#mainCustomerReqTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#mainCustomerReqTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#mainCustomerReqTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#mainCustomerReqTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#mainCustomerReqTable').find('.bb-b').css('border', '1px solid black');
		$('#mainCustomerReqTable').find('.h-5').css('height', '5px');
		$('#mainCustomerReqTable').find('.h-10').css('height', '10px');
		$('#mainCustomerReqTable').find('.h-20').css('height', '20px');
		$('#mainCustomerReqTable').find('.h-30').css('height', '30px');
		$('#mainCustomerReqTable').find('.h-40').css('height', '40px');
		$('#mainCustomerReqTable').find('.h-55').css('height', '55px');
		$('#mainCustomerReqTable').find('.h-70').css('height', '70px');
		$('#mainCustomerReqTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#mainCustomerReqTable').find('td').length;i++) {
			let tdStyle = $('#mainCustomerReqTable').find('td').eq(i).attr('style') == undefined?'':$('#mainCustomerReqTable').find('td').eq(i).attr('style');
			$('#mainCustomerReqTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#inPeopleTable').find('td').css('font-weight', '900');
		$('#inPeopleTable').find('td').css('border', '1px solid black');
		$('#inPeopleTable').find('td').css('padding', '0.1rem');
		$('#inPeopleTable').find('td').css('color', '#000000');

		$('#inPeopleTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#inPeopleTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#inPeopleTable').find('.bg-red').css('background-color', '#DA9694');
		$('#inPeopleTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		$('#inPeopleTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#inPeopleTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#inPeopleTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#inPeopleTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#inPeopleTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#inPeopleTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#inPeopleTable').find('.fs-6').css('font-size', '6px');
		$('#inPeopleTable').find('.fs-8').css('font-size', '8px');
		$('#inPeopleTable').find('.fs-10').css('font-size', '10px');
		$('#inPeopleTable').find('.fs-13').css('font-size', '13px');
		$('#inPeopleTable').find('.fs-15').css('font-size', '15px');
		$('#inPeopleTable').find('.fs-20').css('font-size', '20px');
		$('#inPeopleTable').find('.fs-30').css('font-size', '30px');
		$('#inPeopleTable').find('.fs-50').css('font-size', '50px');
		$('#inPeopleTable').find('.fc-red').css('color', '#ff0000');
		$('#inPeopleTable').find('.bt-2').css('border-top', '2px solid black');
		$('#inPeopleTable').find('.bl-2').css('border-left', '2px solid black');
		$('#inPeopleTable').find('.br-2').css('border-right', '2px solid black');
		$('#inPeopleTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#inPeopleTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#inPeopleTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#inPeopleTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#inPeopleTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#inPeopleTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#inPeopleTable').find('.bb-b').css('border', '1px solid black');
		$('#inPeopleTable').find('.h-5').css('height', '5px');
		$('#inPeopleTable').find('.h-10').css('height', '10px');
		$('#inPeopleTable').find('.h-20').css('height', '20px');
		$('#inPeopleTable').find('.h-30').css('height', '30px');
		$('#inPeopleTable').find('.h-40').css('height', '40px');
		$('#inPeopleTable').find('.h-55').css('height', '55px');
		$('#inPeopleTable').find('.h-70').css('height', '70px');
		$('#inPeopleTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#inPeopleTable').find('td').length;i++) {
			let tdStyle = $('#inPeopleTable').find('td').eq(i).attr('style') == undefined?'':$('#inPeopleTable').find('td').eq(i).attr('style');
			$('#inPeopleTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#materialSalesProfitTable').find('td').css('font-weight', '900');
		$('#materialSalesProfitTable').find('td').css('border', '1px solid black');
		$('#materialSalesProfitTable').find('td').css('padding', '0.1rem');
		$('#materialSalesProfitTable').find('td').css('color', '#000000');

		$('#materialSalesProfitTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#materialSalesProfitTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#materialSalesProfitTable').find('.bg-red').css('background-color', '#DA9694');
		$('#materialSalesProfitTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		$('#materialSalesProfitTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#materialSalesProfitTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#materialSalesProfitTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#materialSalesProfitTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#materialSalesProfitTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#materialSalesProfitTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#materialSalesProfitTable').find('.fs-6').css('font-size', '6px');
		$('#materialSalesProfitTable').find('.fs-8').css('font-size', '8px');
		$('#materialSalesProfitTable').find('.fs-10').css('font-size', '10px');
		$('#materialSalesProfitTable').find('.fs-13').css('font-size', '13px');
		$('#materialSalesProfitTable').find('.fs-15').css('font-size', '15px');
		$('#materialSalesProfitTable').find('.fs-20').css('font-size', '20px');
		$('#materialSalesProfitTable').find('.fs-30').css('font-size', '30px');
		$('#materialSalesProfitTable').find('.fs-50').css('font-size', '50px');
		$('#materialSalesProfitTable').find('.fc-red').css('color', '#ff0000');
		$('#materialSalesProfitTable').find('.bt-2').css('border-top', '2px solid black');
		$('#materialSalesProfitTable').find('.bl-2').css('border-left', '2px solid black');
		$('#materialSalesProfitTable').find('.br-2').css('border-right', '2px solid black');
		$('#materialSalesProfitTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#materialSalesProfitTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#materialSalesProfitTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#materialSalesProfitTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#materialSalesProfitTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#materialSalesProfitTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#materialSalesProfitTable').find('.bb-b').css('border', '1px solid black');
		$('#materialSalesProfitTable').find('.h-5').css('height', '5px');
		$('#materialSalesProfitTable').find('.h-10').css('height', '10px');
		$('#materialSalesProfitTable').find('.h-20').css('height', '20px');
		$('#materialSalesProfitTable').find('.h-30').css('height', '30px');
		$('#materialSalesProfitTable').find('.h-40').css('height', '40px');
		$('#materialSalesProfitTable').find('.h-55').css('height', '55px');
		$('#materialSalesProfitTable').find('.h-70').css('height', '70px');
		$('#materialSalesProfitTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#materialSalesProfitTable').find('td').length;i++) {
			let tdStyle = $('#materialSalesProfitTable').find('td').eq(i).attr('style') == undefined?'':$('#materialSalesProfitTable').find('td').eq(i).attr('style');
			$('#materialSalesProfitTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#carryForDateTable').find('td').css('font-weight', '900');
		$('#carryForDateTable').find('td').css('border', '1px solid black');
		$('#carryForDateTable').find('td').css('padding', '0.1rem');
		$('#carryForDateTable').find('td').css('color', '#000000');

		$('#carryForDateTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#carryForDateTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#carryForDateTable').find('.bg-red').css('background-color', '#DA9694');
		$('#carryForDateTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		$('#carryForDateTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#carryForDateTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#carryForDateTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#carryForDateTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#carryForDateTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#carryForDateTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#carryForDateTable').find('.s-placeholder').css('font-size', '8px');

		$('#carryForDateTable').find('.fs-6').css('font-size', '6px');
		$('#carryForDateTable').find('.fs-8').css('font-size', '8px');
		$('#carryForDateTable').find('.fs-10').css('font-size', '10px');
		$('#carryForDateTable').find('.fs-13').css('font-size', '13px');
		$('#carryForDateTable').find('.fs-15').css('font-size', '15px');
		$('#carryForDateTable').find('.fs-20').css('font-size', '20px');
		$('#carryForDateTable').find('.fs-30').css('font-size', '30px');
		$('#carryForDateTable').find('.fs-50').css('font-size', '50px');
		$('#carryForDateTable').find('.fc-red').css('color', '#ff0000');
		$('#carryForDateTable').find('.bt-2').css('border-top', '2px solid black');
		$('#carryForDateTable').find('.bl-2').css('border-left', '2px solid black');
		$('#carryForDateTable').find('.br-2').css('border-right', '2px solid black');
		$('#carryForDateTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#carryForDateTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#carryForDateTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#carryForDateTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#carryForDateTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#carryForDateTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#carryForDateTable').find('.bb-b').css('border', '1px solid black');
		$('#carryForDateTable').find('.h-5').css('height', '5px');
		$('#carryForDateTable').find('.h-10').css('height', '10px');
		$('#carryForDateTable').find('.h-20').css('height', '20px');
		$('#carryForDateTable').find('.h-30').css('height', '30px');
		$('#carryForDateTable').find('.h-40').css('height', '40px');
		$('#carryForDateTable').find('.h-55').css('height', '55px');
		$('#carryForDateTable').find('.h-70').css('height', '70px');
		$('#carryForDateTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#carryForDateTable').find('td').length;i++) {
			let tdStyle = $('#carryForDateTable').find('td').eq(i).attr('style') == undefined?'':$('#carryForDateTable').find('td').eq(i).attr('style');
			$('#carryForDateTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#outPutsTable').find('td').css('font-weight', '900');
		$('#outPutsTable').find('td').css('border', '1px solid black');
		$('#outPutsTable').find('td').css('padding', '0.1rem');
		$('#outPutsTable').find('td').css('color', '#000000');

		$('#outPutsTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#outPutsTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#outPutsTable').find('.bg-red').css('background-color', '#DA9694');
		$('#outPutsTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		$('#outPutsTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#outPutsTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#outPutsTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#outPutsTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#outPutsTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#outPutsTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#outPutsTable').find('.fs-6').css('font-size', '6px');
		$('#outPutsTable').find('.fs-8').css('font-size', '8px');
		$('#outPutsTable').find('.fs-10').css('font-size', '10px');
		$('#outPutsTable').find('.fs-13').css('font-size', '13px');
		$('#outPutsTable').find('.fs-15').css('font-size', '15px');
		$('#outPutsTable').find('.fs-20').css('font-size', '20px');
		$('#outPutsTable').find('.fs-30').css('font-size', '30px');
		$('#outPutsTable').find('.fs-50').css('font-size', '50px');
		$('#outPutsTable').find('.fc-red').css('color', '#ff0000');
		$('#outPutsTable').find('.bt-2').css('border-top', '2px solid black');
		$('#outPutsTable').find('.bl-2').css('border-left', '2px solid black');
		$('#outPutsTable').find('.br-2').css('border-right', '2px solid black');
		$('#outPutsTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#outPutsTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#outPutsTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#outPutsTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#outPutsTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#outPutsTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#outPutsTable').find('.bb-b').css('border', '1px solid black');
		$('#outPutsTable').find('.h-5').css('height', '5px');
		$('#outPutsTable').find('.h-10').css('height', '10px');
		$('#outPutsTable').find('.h-20').css('height', '20px');
		$('#outPutsTable').find('.h-30').css('height', '30px');
		$('#outPutsTable').find('.h-40').css('height', '40px');
		$('#outPutsTable').find('.h-55').css('height', '55px');
		$('#outPutsTable').find('.h-70').css('height', '70px');
		$('#outPutsTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#outPutsTable').find('td').length;i++) {
			let tdStyle = $('#outPutsTable').find('td').eq(i).attr('style') == undefined?'':$('#outPutsTable').find('td').eq(i).attr('style');
			$('#outPutsTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}

		$('#extraInTable').find('td').css('font-weight', '900');
		$('#extraInTable').find('td').css('border', '1px solid black');
		$('#extraInTable').find('td').css('padding', '0.1rem');
		$('#extraInTable').find('td').css('color', '#000000');

		$('#extraInTable').find('.bg-gray').css('background-color', '#DCE6F1');
		$('#extraInTable').find('.bg-green').css('background-color', '#C4D79B');
		$('#extraInTable').find('.bg-red').css('background-color', '#DA9694');
		$('#extraInTable').find('.bg-blue').css('background-color', '#95B3D7');
		
		$('#extraInTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#extraInTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#extraInTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#extraInTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#extraInTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#extraInTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		$('#extraInTable').find('.fs-6').css('font-size', '6px');
		$('#extraInTable').find('.fs-8').css('font-size', '8px');
		$('#extraInTable').find('.fs-10').css('font-size', '10px');
		$('#extraInTable').find('.fs-13').css('font-size', '13px');
		$('#extraInTable').find('.fs-15').css('font-size', '15px');
		$('#extraInTable').find('.fs-20').css('font-size', '20px');
		$('#extraInTable').find('.fs-30').css('font-size', '30px');
		$('#extraInTable').find('.fs-50').css('font-size', '50px');
		$('#extraInTable').find('.fc-red').css('color', '#ff0000');
		$('#extraInTable').find('.bt-2').css('border-top', '2px solid black');
		$('#extraInTable').find('.bl-2').css('border-left', '2px solid black');
		$('#extraInTable').find('.br-2').css('border-right', '2px solid black');
		$('#extraInTable').find('.bb-2').css('border-bottom', '2px solid black');
		$('#extraInTable').find('.bd-n').css('border', '1px solid #ffffff');
		$('#extraInTable').find('.bt-n').css('border-top', '1px solid #ffffff');
		$('#extraInTable').find('.br-n').css('border-right', '1px solid #ffffff');
		$('#extraInTable').find('.bb-n').css('border-bottom', '1px solid #ffffff');
		$('#extraInTable').find('.bl-n').css('border-left', '1px solid #ffffff');
		$('#extraInTable').find('.bb-b').css('border', '1px solid black');
		$('#extraInTable').find('.h-5').css('height', '5px');
		$('#extraInTable').find('.h-10').css('height', '10px');
		$('#extraInTable').find('.h-20').css('height', '20px');
		$('#extraInTable').find('.h-30').css('height', '30px');
		$('#extraInTable').find('.h-40').css('height', '40px');
		$('#extraInTable').find('.h-55').css('height', '55px');
		$('#extraInTable').find('.h-70').css('height', '70px');
		$('#extraInTable').find('.h-100').css('height', '100px');

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#extraInTable').find('td').length;i++) {
			let tdStyle = $('#extraInTable').find('td').eq(i).attr('style') == undefined?'':$('#extraInTable').find('td').eq(i).attr('style');
			$('#extraInTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}
		
	}

	$(document).on('change', 'input[name=inPercent]', function(){
		var value = $(this).val();
		var tr = event.target.closest('tr');
		var inDaysUnderVal = $(tr).find('div[name=inDaysUnder]').text();

		$(tr).find('div[name=inPercentFloat]').text(parseFloat(value/100).toFixed(1));
		$(tr).find('div[name=inPercentInDays]').text(parseFloat(parseFloat(value/100) * parseInt(inDaysUnderVal)).toFixed(1));

		var mdSum = 0;
		for(var i=0; i<$('div[name=inPercentInDays]').length; i++){
			mdSum += parseFloat($($('div[name=inPercentInDays]')[i]).text());
		}
		$('#mdTotalSum').text(parseFloat(mdSum).toFixed(1));
		$('#mdPersonCost').text('￦ '+addCommas(parseFloat(mdSum).toFixed(1)*200000));
	});

	$(document).on('change', 'input[name=inDays]', function(){
		var value = $(this).val();
		var tr = event.target.closest('tr');
		var inPercentFloatVal = $(tr).find('div[name=inPercentFloat]').text();
		
		$(tr).find('div[name=inDaysUnder]').text(value);
		$(tr).find('div[name=inPercentInDays]').text(parseFloat(parseFloat(inPercentFloatVal) * parseInt(value)).toFixed(1));

		var mdSum = 0;
		for(var i=0; i<$('div[name=inPercentInDays]').length; i++){
			mdSum += parseFloat($($('div[name=inPercentInDays]')[i]).text());
		}
		$('#mdTotalSum').text(parseFloat(mdSum).toFixed(1));
		$('#mdPersonCost').text('￦ '+addCommas(parseFloat(mdSum).toFixed(1)*200000));
	});

	//재료비 및 매출이익
	$(document).on('change', 'input[name=materialAmt]', function(){
		let outPersonSum = $('#outPersonSum').val().replaceAll(/,/g, '');
		let sum = 0;
		
		for(var i=0; i<$('input[name=materialAmt]').length; i++){
			sum += parseInt($($('input[name=materialAmt]')[i]).val().replaceAll(/,/g, ''));
		}
		$('#materialCost').text(addCommas(sum));
		$('#materialCostSum').text(addCommas(sum));
		$('#materialOutPersonSum').text(addCommas(sum + parseInt(outPersonSum)));

		$('#materialCostFloat').text(parseFloat(sum/1000000).toFixed(1));
		let salesProfit = parseInt(bizOrderAmt) - sum;
		$('#salesProfitAmt').text(parseFloat(salesProfit/1000000).toFixed(1));
		$('#materialCostPercent').text(parseFloat(sum/parseInt(bizOrderAmt)*100).toFixed(1)+'%');
	});

	//재료비 및 매출이익
	$(document).on('change', '#outPersonSum', function(){
		let outPersonSum = $('#outPersonSum').val().replaceAll(/,/g, '');
 		let sum = 0;
		
		for(var i=0; i<$('input[name=materialAmt]').length; i++){
			sum += parseInt($($('input[name=materialAmt]')[i]).val().replaceAll(/,/g, ''));
		}
		
		$('#materialCost').text(addCommas(sum));
		$('#materialCostSum').text(addCommas(sum));
		$('#materialOutPersonSum').text(addCommas(sum + parseInt(outPersonSum)));

		$('#materialCostFloat').text(parseFloat(sum/1000000).toFixed(1));
		let salesProfit = parseInt(bizOrderAmt) - sum;
		$('#salesProfitAmt').text(parseFloat(salesProfit/1000000).toFixed(1));
		$('#materialCostPercent').text(sum/parseInt(bizOrderAmt)*100+'%');
	});

	$('#btnSave').on('click',function(){
 		let mainCustArray = [];
		let inPeopleArray = [];
		let materialArray = [];
		let carryDateArray = [];
		let outPutsArray = [];
// 		let extraInArray = [];
		let state = true;

		//단일정보
// 		let obj = new Object();
		let massDev = $('input[name=massDevChk]:checked').val();
		let prjNm = $('#prjNmPrint').text();
		let leader = $('#leaderPrint').val();
		let prjCd = $('#prjCdPrint').text();
		let customer = $('#customerPrint').val();
		let startDate = $('#prjStartDate').val().replaceAll(/-/g, '');
		let endDate = $('#prjEndDate').val().replaceAll(/-/g, '');
		let forwardWay = $('input[name=forwardChk]:checked').val();

		//예외처리
		if(massDev == null || massDev == ''){
			toastr.warning('양산/개발을 선택해주세요.');
			return false;
		}
		if(leader == null || leader == ''){
			toastr.warning('리더를 입력해주세요.');
			$('#leaderPrint').focus();
			return false;
		}
		if(customer == null || customer == ''){
			toastr.warning('고객명을 입력해주세요.');
			$('#customerPrint').focus();
			return false;
		}
		if(startDate == '' || endDate == ''){
			toastr.warning('기간을 선택해주세요.');
			return false;
		}
		if(forwardWay == null || forwardWay == ''){
			toastr.warning('추진방법을 선택해주세요.');
			return false;
		}
		
		//단일정보-주요고객 요구사항
		for(var i=1; i<$('#mainCustomerReqTable tbody tr').length; i++){
			var tr = $('#mainCustomerReqTable tbody tr').eq(i);
			let mainCustObj = new Object();

			mainCustObj.mainCustSub = $(tr).find('input[name=mainCustSub]').val();
			if($(tr).find('textarea[name=mainCustReqContent]').val() != null){
				mainCustObj.mainCustReqContent = $(tr).find('textarea[name=mainCustReqContent]').val().replaceAll(/\n/g, "<br>");
			}else {
				mainCustObj.mainCustReqContent = $(tr).find('input[name=mainCustReqContent]').val();
			}

			mainCustArray.push(mainCustObj);
		}

		//참여인력
		for(var i=1; i<$('#inPeopleTable tbody tr').length-1; i++){
			var tr = $('#inPeopleTable tbody tr').eq(i);
			let inPeopleObj = new Object();

			inPeopleObj.inUserIdx = $(tr).find('div[data-name=userIdx]').text();
			inPeopleObj.inPercent = $(tr).find('input[name=inPercent]').val();
			inPeopleObj.userMainWork = $(tr).find('input[name=userMainWork]').val();
			inPeopleObj.inDays = $(tr).find('input[name=inDays]').val();

			inPeopleArray.push(inPeopleObj);
		}

		//재료비 및 매출이익
		for(var i=1; i<$('#materialSalesProfitTable tbody tr').length-5; i++){
			var tr = $('#materialSalesProfitTable tbody tr').eq(i);
			let materialSalesProfitObj = new Object();

			materialSalesProfitObj.materialSub =  $(tr).find('input[name=materialSub]').val();
			if($(tr).find('textarea[name=materialSpec]').val() != null){
				materialSalesProfitObj.materialSpec = $(tr).find('textarea[name=materialSpec]').val().replaceAll(/\n/g, "<br>");
			}else {
				materialSalesProfitObj.materialSpec = $(tr).find('input[name=materialSpec]').val();
			}
			materialSalesProfitObj.materialAmt = $(tr).find('input[name=materialAmt]').val().replaceAll(/,/g, '');
			materialSalesProfitObj.materialDesc = $(tr).find('input[name=materialDesc]').val();
			
			materialSalesProfitObj.outPersonSum = $('#outPersonSum').val().replaceAll(/,/g, '');

			materialArray.push(materialSalesProfitObj);
		}

		//추진일정
		for(var i=1; i<$('#carryForDateTable tbody tr').length; i++){
			var tr = $('#carryForDateTable tbody tr').eq(i);
			
			var carryDuringStartMonth = $(tr).find('input[name=carryDuringStartMonth]').val();
			var carryDuringStartDay = $(tr).find('input[name=carryDuringStartDay]').val();
			var carryDuringEndMonth = $(tr).find('input[name=carryDuringEndMonth]').val();
			var carryDuringEndDay= $(tr).find('input[name=carryDuringEndDay]').val();
			
			let carryForDateObj =  new Object();

			carryForDateObj.carryGubunNm = $(tr).find('input[name=carryGubunNm]').val();
			carryForDateObj.carryDetails = $(tr).find('input[name=carryDetails]').val();
			carryForDateObj.carryDuringStart = carryDuringStartMonth + carryDuringStartDay;	//일정
			carryForDateObj.carryDuringEnd = carryDuringEndMonth + carryDuringEndDay;	//일정
			carryForDateObj.carryMainUser = $(tr).find('input[name=carryMainUser]').val();
			carryForDateObj.carryWay = $(tr).find('input[name=carryWay]').val();

			carryDateArray.push(carryForDateObj);
		}

		//산출물 List
		for(var i=1; i<$('#outPutsTable tbody tr').length; i++){
			var tr = $('#outPutsTable tbody tr').eq(i);
			let outPutsObj = new Object();

			outPutsObj.calNm = $(tr).find('input[name=calculationKindNm]').val();
			outPutsObj.calContent = $(tr).find('input[name=calculationContent]').val();
			outPutsObj.calCnt = $(tr).find('input[name=calculationCnt]').val();

			outPutsArray.push(outPutsObj);

			if($(tr).find('input[name=calculationKindNm1]').val() != null){
				let outPutsObj1= new Object();
				
				outPutsObj1.calNm = $(tr).find('input[name=calculationKindNm1]').val();
				outPutsObj1.calContent = $(tr).find('input[name=calculationContent1]').val();
				outPutsObj1.calCnt = $(tr).find('input[name=calculationCnt1]').val();

				outPutsArray.push(outPutsObj1);
			}
		}

		//별첨
		let extraIn = $('#extraInPrint').val().replaceAll(/\n/g, "<br>");
		let extraWrite = $('#extraWritePrint').val();
		
// 		let extraInObj = new Object();

// 		extraInObj.extraIn = $('#extraInPrint').val();
// 		extraInObj.extraWrite = $('#extraWritePrint').val();
		
// 		extraInArray.push(extraInObj);

		$.ajax({
			url: '<c:url value="/bs/bizPrjPlanIU"/>',
            type: 'POST',
            data: {
                'idx'				:	idxVal,
            	'massDev'			:	massDev,
            	'prjCd'             :   prjCd,
        		'prjNm'				:   prjNm,
        		'leader'            :   leader,
        		'customer'          :   customer,
        		'startDate'         :   startDate,
        		'endDate'           :   endDate,
        		'forwardWay'        :   forwardWay,
        		'extraIn'			:	extraIn,
        		'extraWrite'		:	extraWrite,
        		'mainCustArray'		:	JSON.stringify(mainCustArray),
                'inPeopleArray'		:	JSON.stringify(inPeopleArray),
                'materialArray'		:	JSON.stringify(materialArray),
                'carryDateArray'	:	JSON.stringify(carryDateArray),
                'outPutsArray'		:	JSON.stringify(outPutsArray),
//                 'extraInArray'		:	JSON.stringify(extraInArray)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');

					rowStatus = '';

					$('#rightcol').find($('input:text')).attr('disabled', true);
					$('textarea').attr('disabled', true);
					$('#prjStartDate').attr('disabled', true);
					$('#prjEndDate').attr('disabled', true);

					$('#btnRowAdd').attr('disabled', true);
					$('#btnRowRemove').attr('disabled', true);
					$('#btnEdit').attr('disabled', false);
					$('#btnSave').attr('disabled', true);

					setTimeout(function() {
						bizOrderAdmTable.ajax.reload(function() {
							$('#bizOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
								$(item).find('input').attr('disabled', false);// 검색 필터 enable
							});
						});
						bizOrderAdmTable.colReorder.enable();
					}, 200);
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

// 	$('#btnCancel').on('click',function(){
// 		$('#cancelModal').modal('show');
// 		$('#cancelModal').data('type','ADM');
// 	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let type = $('#cancelModal').data('type');
		if(type == 'ADM'){
			toastr.success('취소되었습니다.');
			$('#btnSearch').trigger('click');
		}
	});
	
// 	//출력번호삭제기능
// 	$(document).on('click','button[name=btnDealCorpDelete]',function(){
//  		let tr = $(this).parent().parent().parent();
//  		let data = bizOrderAdmTable.row(tr).data();

//  		$(this).prev().val('');
//  		/* $('#deleteModal').data('deleteType','ADM');
//  		$('#deleteModal').data('idx',data.idx);
// 		$('#deleteModal').modal('show'); */
 		
// 	});

	$('#btnDeleteModalY').on('click',function(){
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM'){
			let idx = $('#deleteModal').data('idx');
			$.ajax({
				url: '<c:url value="/pm/purchasePaperDel"/>',
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
						$('#btnSearch').trigger('click');
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


	//참여인력====================================================================================
	
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
            style: 'multiple',
            toggleable: true,
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

	$('#btnUserModalPaste').on('click',function(){
		if($('#userModalTable tbody').find('.selected').length == 0){
			toastr.warning('참여 인력을 선택해주세요.');
			return false;
		}

		$('#inPeople').attr('rowspan', $('#userModalTable tbody').find('.selected').length+2);
		for(var i=0; i<$('#userModalTable tbody').find('.selected').length; i++){
			let data = $('#userModalTable').DataTable().row($('#userModalTable').find('.selected')[i]).data();

			$('#inPeopleTr').after(makeEmptyTr(data.idx, data.userName, data.userPositionCd, data.userPositionNm, 0, 0, 0.0, ''));
		}
		cssChange();
		$('#userModal').modal('hide');
	});


	//행 클릭 시
	$('#mainCustomerReqTable').on('click', function(){
		rowStatus = 'mainCust';
	});

	//행 클릭 시
	$('#materialSalesProfitTable').on('click', function(){
		rowStatus = 'materialSales';
	});

	//행 클릭 시
	$('#carryForDateTable').on('click', function(){
		rowStatus = 'carryForDate';
	});

	//행 클릭 시
	$('#outPutList').on('click', function(){
		rowStatus = 'outPut';
	});

	//행 추가
	$('#btnRowAdd').on('click', function(){
		if(rowStatus == ''){
			toastr.warning('추가할 항목을 선택해주세요');
			return false;
		}

		if(rowStatus == 'mainCust'){
			$('#mainCusReq').attr('rowspan', $('#mainCustomerReqTable tbody tr').length+1);
			var length = $('#mainCustomerReqTable tbody tr').length - 1;
			var tr = $('#mainCustomerReqTable tbody tr').eq(length);

			tr.after(makeMainCustTr('', ''));
		} else if(rowStatus == 'materialSales'){
			$('#matProfit').attr('rowspan', $('#materialSalesProfitTable tbody tr').length+1);
			var length = $('#materialSalesProfitTable tbody tr').length - 6;
			var tr = $('#materialSalesProfitTable tbody tr').eq(length);

			tr.after(makeMatetialTr('', '', 0, ''));
		} else if(rowStatus == 'carryForDate'){
			$('#processCarry').attr('rowspan', $('#carryForDateTable tbody tr').length+1);
			var length = $('#carryForDateTable tbody tr').length - 1;
			var tr = $('#carryForDateTable tbody tr').eq(length);

			tr.after(makeCarryTr('', '', '', '', '', '', '', ''));
		} else if(rowStatus == 'outPut'){
			$('#outPutList').attr('rowspan', $('#outPutsTable tbody tr').length+1);
			var length = $('#outPutsTable tbody tr').length - 1;
			var tr = $('#outPutsTable tbody tr').eq(length);

			tr.after(makeCalculTr('', '', '', '', '', ''));
		}

		cssChange();
	});

	//행 삭제
	$('#btnRowRemove').on('click', function(){
		if(rowStatus == ''){
			toastr.warning('삭제할 항목을 선택해주세요');
			return false;
		}

		if(rowStatus == 'mainCust'){
			var length = $('#mainCustomerReqTable tbody tr').length - 1;
			var tr = $('#mainCustomerReqTable tbody tr').eq(length);

			tr.remove();
			
		} else if(rowStatus == 'materialSales'){
			var length = $('#materialSalesProfitTable tbody tr').length - 6;
			var tr = $('#materialSalesProfitTable tbody tr').eq(length);

			tr.remove();
			
		} else if(rowStatus == 'carryForDate'){
			var length = $('#carryForDateTable tbody tr').length - 1;
			var tr = $('#carryForDateTable tbody tr').eq(length);

			tr.remove();
			
		} else if(rowStatus == 'outPut'){
			var length = $('#outPutsTable tbody tr').length - 1;
			var tr = $('#outPutsTable tbody tr').eq(length);

			tr.remove();
			
		}
	});

	//상신 여부 update
	$('#btnUpvoteY').on('click', function (){
		$('#upvoteUserIdx').val(userIdx);
		$('#upvoteUserName').val(userName);
		$('#upvoteDate').val(moment().format('YYYY-MM-DD'));
		$('#upvoteReason').val('');
		$('#upvoteDetailModal').modal('show');
	});

	//상신 여부 update
	$('#btnUpvoteN').on('click', function (){
		if(approvalVal == 'Y'){
			toastr.warning('이미 결재되었습니다.');
			return false;
		} else {
			$.ajax({
				url: '<c:url value="/bs/upvoteYnUpd"/>',
	            type: 'POST',
	            data: {
	                'prjCd'			:	function() { return prjCd; },
	                'upvoteYn'		:	function() { return 'N'; },
	                'upvoteUserIdx'	:	function() { return $('#upvoteUserIdx').val(); },
	                'upvoteDate'	:	function() { return $('#upvoteDate').val().replaceAll(/-/g, ''); },
	                'upvoteReason'	:	function() { return $('#upvoteReason').val(); },
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('처리되었습니다.');
						
						bizOrderAdmTable.ajax.reload(function() {
							$('#bizOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
								$(item).find('input').attr('disabled', false);// 검색 필터 enable
							});
						});
						bizOrderAdmTable.colReorder.enable();

						$('#upvoteDetailModal').modal('hide');
						
						$('#btnUpvoteN').addClass('d-none');
						$('#btnUpvoteY').removeClass('d-none');
						$('#btnUpvoteY').attr('disabled', false);
						
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

	//상신 저장
	$('#btnUpvoteDetailSave').on('click', function(){
		if($('#upvoteReason').val() == ''){
			toastr.warning('특이사항을 입력해주세요.');
			$('#upvoteReason').focus();
			return false;
		}

		$.ajax({
			url: '<c:url value="/bs/upvoteYnUpd"/>',
            type: 'POST',
            data: {
                'prjCd'			:	function() { return prjCd; },
                'upvoteYn'		:	function() { return 'Y'; },
                'upvoteUserIdx'	:	function() { return $('#upvoteUserIdx').val(); },
                'upvoteDate'	:	function() { return $('#upvoteDate').val().replaceAll(/-/g, ''); },
                'upvoteReason'	:	function() { return $('#upvoteReason').val(); },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('처리되었습니다.');
					
					bizOrderAdmTable.ajax.reload(function() {
						$('#bizOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					bizOrderAdmTable.colReorder.enable();

					$('#upvoteDetailModal').modal('hide');

					$('#btnUpvoteY').addClass('d-none');
					$('#btnUpvoteN').removeClass('d-none');
					$('#btnUpvoteY').attr('disabled', true);
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	
</script>
</body>
</html>
