<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 	'leftcol dragbarH rightcolT'
																									'leftcol dragbarH dragbarVT'
																									'leftcol dragbarH rightcolM'
																									'leftcol dragbarH dragbarVB'
																									'leftcol dragbarH rightcolB';
																		  grid-template-rows: 2fr 4px 4fr 4px 2fr;
																		  grid-template-columns: 7.5fr 4px 2.5fr;">
	<div id="leftcol">
	<input type="file" id="fileFake" style="display: none;" value=""
			multiple>
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">지시일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label>
					<select class="form-select w-auto h-100 me-3" id="searchTarget" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="N" selected>작업대상</option>
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">범례</label>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-danger bg-gradient">수주대비 생산량미달</label>
					
					<input type="text" class="d-none form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch">
						<i class="fa-regular fa-clipboard"></i>
					</button>
				</div>
			</div>
			
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="workOrderPrcssTable">
					<thead class="table-light">
						<tr>
							<!-- <th class="text-center align-middle"><input type="checkbox" id="btnAllCheck" style="width:20px; height:20px;"></th> -->
							<th class="text-center align-middle">수주상태</th>
							<th class="text-center align-middle">생산상태</th>
							<th class="text-center align-middle">공정작업상태</th>
							<th class="text-center align-middle">공정명</th>
							<th class="text-center align-middle">설비명</th>
							<th class="text-center align-middle">생산지시일</th>
							<th class="text-center align-middle">목표요구일</th>
							<th class="text-center align-middle">납품요구일</th>
							<th class="text-center align-middle">지시수량</th>
							<th class="text-center align-middle">전공정 양품수량</th>
							<th class="text-center align-middle">생산수량</th>
							<th class="text-center align-middle">불량수량</th>
							<th class="text-center align-middle colvisHide">미생산수량</th>
							<th class="text-center align-middle colvisHide">목형번호</th>
							<th class="text-center align-middle colvisHide">수지판번호</th>
							<th class="text-center align-middle">수주번호</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle colvisHide">지시번호</th>
							<th class="text-center align-middle">생산특이사항</th>
							<th class="text-center align-middle">지시비고사항</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarH" onmousedown="StartDrag('H')"></div>	
	<div id="rightcolT" style="overflow : hidden;">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightBody">
				<div style="width: 100%;">
					<div class="nav nav-tabs" id="nav-tab2">
						<button class="nav-link active" id="tab5Nav" data-bs-toggle="tab" data-bs-target="#tab5">투입자재정보</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent2">
						<div class="tab-pane fade show active" id="tab5">
							<div class="row" style="padding: 5px;">
								<table class="table table-bordered p-0 m-0" id="inputMaterialHistTable">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">재질</th>
											<th class="text-center align-middle">장*폭</th>
											<th class="text-center align-middle">절수/개수</th>
											<th class="text-center align-middle">이론<br>통수</th>
											<th class="text-center align-middle">여분포함<br>통수</th>
											<!-- <th class="text-center align-middle">발주량+여분</th> -->
											<th class="text-center align-middle">입고량</th>
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
	<div id="dragbarVT" onmousedown="StartDrag('VT')" ondblclick="minimum(this)"></div>
	<div id="rightcolM" style="overflow : hidden;">
		<div class="container-fluid" style="padding: 5px;">
			<div class="row">
				<div style="width: 100%;">
					<div class="nav nav-tabs" id="nav-tab2">
						<button class="nav-link active" id="tab3Nav" data-bs-toggle="tab" data-bs-target="#tab3">공정실적상태</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent2">
						<div class="tab-pane fade show active" id="tab3">
							<div class="row" style="padding: 5px;">
								<table class="table table-bordered p-0 m-0 " id="workPrcssDtlTable">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle" style="vertical-align: middle;">진행상태</th>
											<th class="text-center align-middle" style="vertical-align: middle;">공정</th>
											<th class="text-center align-middle" style="vertical-align: middle;">양품</th>
											<th class="text-center align-middle" style="vertical-align: middle;">불량</th>
											<th class="text-center align-middle" style="vertical-align: middle;">단위</th>
											<th class="text-center align-middle" style="vertical-align: middle;">작업자</th>
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
	<div id="dragbarVB" onmousedown="StartDrag('VB')" ondblclick="minimum(this)"></div>
	<div id="rightcolB" style="overflow : hidden;">
		<div class="container-fluid" style="padding: 5px;">
			<div class="row">
				<div style="width: 100%;">
					<!-- <div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">공정별 진행상태</button>
						<button class="nav-link" id="tab2Nav" data-bs-toggle="tab" data-bs-target="#tab2">세부정보</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<table class="table table-bordered p-0 m-0 " id="workOrdPrcssStatusTable">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle" style="vertical-align: middle;">진행상태</th>
											<th class="text-center align-middle" style="vertical-align: middle;">공정명</th>
											<th class="text-center align-middle" style="vertical-align: middle;">지시량</th>
											<th class="text-center align-middle" style="vertical-align: middle;">생산량</th>
											<th class="text-center align-middle" style="vertical-align: middle;">미생산량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>				
					</div> -->
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 실적등록 모달 -->
<div class="modal fade" id="workOrderPrcssModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog row" style="width: 75vw;max-width: 75vw;height: 93vh;max-height:93vh;">
		<div class="modal-content" style="width:100%;height:100%;">
			<div class="modal-body" style="height: 100%;max-height: 100%;">
				<div class="row" style="width:100%;height:100%;">
					<div style="width:100%;height:100%;margin-right:4px;">
						<div class="row" style="width:100%;height:59%;">
							<div style="width:74.6%;height:100%;">
								<div style="width:100%;height:100%;">
									<div style="padding: 5px;padding-bottom:0px;margin-bottom:5px;width:100%;height:12%;">
										<table class="table table-bordered p-0 m-0" style="height:100%;">
											<colgroup>
												<col width="12.5%">
												<col width="12.5%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="40%">
											</colgroup>
											<tr style="width:100%;">
												<th class="text-center align-middle">수주상세번호</th>
												<td class="text-center align-middle">
													<div id="modalBizOrdDtlNo"></div>
												</td>
												<th class="text-center align-middle">공정명</th>
												<td class="text-center align-middle">
													<div id="modalPrcssNm"></div>
												</td>
												<th class="text-center align-middle">제품명</th>
												<td colspan="3" class="text-center align-middle">
													<div id="itemNm"></div>
												</td>
											</tr>
										</table>
									</div>
									
									<div style="padding:0px 5px; margin-bottom:5px;width:100%;height:64%;">
										<table class="table table-bordered p-0 m-0" style="height:100%;">
											<colgroup>
												<col width="12.5%">
												<col width="12.5%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<tr style="width:100%;">
												<th class="text-center align-middle">자재코드</th>
												<td class="text-center align-middle">
													<div id="customerItemCd"></div>
												</td>
												<th class="text-center align-middle">버전번호</th>
												<td class="text-center align-middle">
													<a id="itemVersionLink" href="" target="_blank">
														<span id="itemVersion"></span>
													</a>
												</td>
												
												<th class="text-center align-middle">코팅방법</th>
												<td class="text-center align-middle">
													<div id="coatingMethod"></div>
												</td>
												<th class="text-center align-middle">코팅판번호</th>
												<td class="text-center align-middle">
													<div id="resinBoard"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">COLOR</th>
												<td colspan="3" class="text-center align-middle">
													<div id="itemColor"></div>
												</td>
												<!-- <th class="text-center align-middle">작업방법</th>
												<td class="text-center align-middle">	
													<div id="workMethodMultiSelect" style="width:100%;"></div>
												</td>
												<th class="text-center align-middle">버전번호</th>
												<td class="text-center align-middle">
													<a id="itemVersionLink" href="" target="_blank">
														<span id="itemVersion"></span>
													</a>
												</td> -->
												<th class="text-center align-middle">도수</th>
												<td class="text-center align-middle">
													<div id="itemFrequency"></div>
												</td>
												<th class="text-center align-middle">(수주)지시수량</th>
												<td class="text-center align-middle">
													<div id="allWorkOrdQty"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">목형번호</th>
												<td class="text-center align-middle">
													<div id="woodenCareCd"></div>
												</td>
												<th class="text-center align-middle">타공목형번호</th>
												<td class="text-center align-middle">
													<div id="holeWoodenCd"></div>
												</td>
												<th class="text-center align-middle">사이즈</th>
												<td class="text-center align-middle">
													<div id="itemSize"></div>
												</td>
												<th class="text-center align-middle">칼끝규격</th>
												<td class="text-center align-middle">
													<div id="knifeTipSize"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">FOIL</th>
												<td class="text-center align-middle">
													<div id="etc4"></div>
												</td>
												<th class="text-center align-middle">FOIL COLOR</th>
												<td class="text-center align-middle">
													<div id="etc5"></div>
												</td>
												<th class="text-center align-middle">부분UV</th>
												<td class="text-center align-middle">
													<div id="etc3"></div>
												</td>
												<th class="text-center align-middle">후가공판번호</th>
												<td class="text-center align-middle">
													<div id="etc2Cd"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">성형방식</th>
												<td class="text-center align-middle">
													<div id="moldingMethod"></div>
												</td>
												<th class="text-center align-middle">성형내용</th>
												<td class="text-center align-middle">
													<div id="moldingContents"></div>
												</td>
												<th class="text-center align-middle">형압</th>
												<td class="text-center align-middle">
													<div id="etc6"></div>
												</td>
												<th class="text-center align-middle">동판번호</th>
												<td class="text-center align-middle">
													<div id="pressMethod"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">묶음법</th>
												<td class="text-center align-middle">
													<div id="bundleMethodNm"></div>
												</td>
												<th class="text-center align-middle">묶음단위</th>
												<td class="text-center align-middle">
													<div id="bundleUnit"></div>
												</td>
												<th class="text-center align-middle">포장단위</th>
												<td class="text-center align-middle">
													<div id="packUnit"></div>
												</td>
												<th class="text-center align-middle">포장박스</th>
												<td class="text-center align-middle">
													<div id="packMethodNm"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">건별전달사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="relayNotice" style="overflow:auto;white-space:pre-line;max-height:40px;"></div>
												</td>
												<th class="text-center align-middle">특이사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="specialNotice" style="overflow:auto;white-space:pre-line;max-height:40px;"></div>
												</td>
												<!-- <th class="text-center align-middle">수주특이사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="bizOrdIssue" style="white-space:pre-line;width:330px;"></div>
												</td>
												<th class="text-center align-middle">수주전달사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="bizOrdNote" style="white-space:pre-line;width:330px;"></div>
												</td> -->
												<!-- <th rowspan="2" class="text-center align-middle">지시비고사항</th>
												<td colspan="3" rowspan="2" class="text-start align-middle">
													<div id="workOrdDesc" style="white-space:pre-line;width:330px;"></div>
												</td> -->
											</tr>
											<tr>
												<th class="text-center align-middle">검수방법</th>
												<td class="text-center align-middle">
													<div id="inspectMethodNm"></div>
												</td>
												<th class="text-center align-middle">기타1</th>
												<td class="text-center align-middle">
													<div id="etc7"></div>
												</td>
												<th class="text-center align-middle">기타2</th>
												<td class="text-center align-middle">
													<div id="etc8"></div>
												</td>
												<th class="text-center align-middle">기타3</th>
												<td class="text-center align-middle">
													<div id="etc9"></div>
												</td>
											</tr>
										</table>
									</div>
									
									<div style="padding: 0px 5px;width:100%;height:23%;" id="workOrderPrcssModalTableHeight">
										<table class="table table-bordered p-0 m-0" id="purchaseMatrlModalTable">
											<thead class="table-light">
												<tr>
													<th class="text-center align-middle" style="max-width:12%;min-width:12%;">재질</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">현재고®</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">절수/개수</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">이론량®</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">발주량®</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">이론통수</th>
													<th class="text-center align-middle" style="max-width:13%;min-width:13%;">여분포함통수</th>
													<th class="text-center align-middle" style="max-width:10%;min-width:10%;background-color: #ff000078 !important;">추가재단</th>
												</tr>
											</thead>
										</table>
									</div>					
								</div>
							</div>
						</div>
					<div class="row" style="width:74%;height:40.5%;">
						<div class="" style="padding:5px;padding-right:0px;padding-top:10px;padding-bottom:0px;width: 37.1%;height: 100%;">
							<div style="/* border: solid; */width: 100%;height: 50%;" id="workOrdPrcssResultTableHeight">
								<table class="table table-bordered p-0 m-0 " id="workOrdPrcssResultTable">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle" style="vertical-align: middle;">실적등록일</th>
											<th class="text-center align-middle" style="vertical-align: middle;">등록자</th>
											<th class="text-center align-middle" style="vertical-align: middle;">작업량</th>
											<th class="text-center align-middle" style="vertical-align: middle;">불량</th>
										</tr>
									</thead>
								</table>
							</div>
							<table class="table table-bordered p-0 m-0" style="height: 50%;width:100%;">
								<colgroup>
											<col width="11%">
											<col width="49%">
										</colgroup>
										<tr>
											<th class="text-center align-middle">작업일자</th>
											<td class="text-center align-middle">
												<input type="date" class="form-control inputGroup virtualKeyboard2" id="workDate" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle">시작시간</th>
											<td class="text-center align-middle">
												<input type="datetime-local" class="form-control inputGroup virtualKeyboard2" id="workStartTime" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle">종료시간</th>
											<td class="text-center align-middle">
												<input type="datetime-local" class="form-control inputGroup virtualKeyboard2" id="workEndTime" disabled>
											</td>
										</tr>
							</table>
						</div>
						
						<div style="padding-top:10px;width: 62.9%;/* height: 100%; */overflow:auto;">
								<div class="row" style="padding-left:5px;padding-top:0px;padding-bottom:1px;width:100%;height: 100%;">
									<table class="table table-bordered p-0 m-0" style="height: 100%;width:100%;">
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="10%">
											<col width="15%">
											<col width="10%">
											<col width="40%">
										</colgroup>
										
										<tr>
											<th class="text-center align-middle" style="height:50%;">전체공정<br>특이사항</th>
											<td class="text-center align-middle" colspan="3">
												<div class="row" style="height:100%;">
													<textarea id="workOrdBeforePrcssDesc" class="form-control resize-none inputGroup" style="resize: none;height:100%;width:83.9%;" disabled></textarea>
													<input type="checkbox" id="workOrdBeforePrcssDescCheck" style="width:14%;margin-left:5px;">
												</div>
											</td>
											<th class="text-center align-middle" style="height:50%;">현공정<br>특이사항</th>
											<td class="text-center align-middle" colspan="3">
												<textarea id="fieldDesc" class="form-control resize-none inputGroup" style="resize: none;height:100%;" disabled></textarea>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle" style="height:20%;">수주수량</th>
											<td class="text-end align-middle">
												<div id="bizOrdQty"></div>
											</td>
											<th class="text-center align-middle" style="height:20%;">지시수량</th>
											<td class="text-end align-middle">
												<div id="workOrdQty"></div>
											</td>
											<th class="text-center align-middle" style="height:20%;">전공정<br>실적</th>
											<td class="text-end align-middle">
												<div class="row">
													<div id="workOrdBeforePrcssQtyHidden" style="width:50%;"></div>
													<div id="workOrdBeforePrcssQty" style="width:50%;"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th colspan="1" class="text-center align-middle">작업량</th>
											<td colspan="5" class="text-center align-middle">
												<div style="display: flex; flex-wrap: 1 1 auto;">
													<input type="text" id="workQtyRChange" class="form-control text-end me-1" placeholder="R변환" disabled>
													<input type="text" id="workQty" class="form-control text-end me-1 inputGroup virtualKeyboard2" value="0" onkeyup="numberFormat(this,'int')" disabled>
													<input type="text" id="workPrcssQtyUnit" class="form-control text-end me-1" placeholder="공정단위" disabled>
												</div>
											</td>
										</tr>
										<tr>
											<th colspan="1" class="text-center align-middle">불량</th>
											<td colspan="5" class="text-center align-middle">
													<div style="display: flex; flex-wrap: 1 1 auto;">
													<input type="text" id="workFaultyQtyRChange" class="form-control text-end me-1" placeholder="R변환" disabled>
													<input type="text" id="workFaultyQty" class="form-control text-end me-1 inputGroup virtualKeyboard2" value="0" onkeyup="numberFormat(this,'int')" disabled>
													<input type="text" id="workPrcssFaultyQtyUnit" class="form-control text-end me-1" placeholder="공정단위" disabled>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						<div class="row">
								<div class="card virtualKeyboard_content2" style="
																		width: 25%;
																		height: 67.4vh;
																		position: absolute;
																		bottom: 24.75%;
																		left: 73.8%;
																		/* padding:1%; */
																		margin:0px;
																		font-weight : bolder;
																		border-width:0px;
																		">							
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_1_0" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">7</div>
										<div class="col virkey" id="virkeypad_1_1" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">8</div>
										<div class="col virkey" id="virkeypad_1_2" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">9</div>
										<div class="col virkey" id="virkeypad_0_0" style="font-size:2vw;padding-left: 5%;margin-right:5px; text-align:center;"><i class="fas fa-long-arrow-alt-left" id="backspace"></i></div>
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_2_0" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">4</div>
										<div class="col virkey" id="virkeypad_2_1" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">5</div>
										<div class="col virkey" id="virkeypad_2_2" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">6</div>
										<div class="col virkey" id="virkeypad_2_3" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px; text-align:center;"><i class="far fa-caret-square-up" id="upCount"></i></div>
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">							
										<div class="col virkey" id="virkeypad_3_0" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">1</div>
										<div class="col virkey" id="virkeypad_3_1" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">2</div>
										<div class="col virkey" id="virkeypad_3_2" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">3</div>
										<div class="col virkey" id="virkeypad_3_3" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px; text-align:center;"><i class="far fa-caret-square-down" id="downCount"></i></div>
																
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_4_0" style="font-size: 2vw !important;padding-left: 5%; min-width:10%;margin-right:5px;">0</div>
										<div class="col virkey" id="virkeypad_4_1" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">.</div>
											<div class="col virkey" id="virkeypad_4_2" style="font-size: 0.8vw !important;padding-left: 5%;margin-right:5px;">Enter</div>
									</div>
								
								</div>
								 <div style="
																		width: 25%;
																		height: 34.35vh;
																		position: absolute;
																		bottom: 2.5%;
																		left: 73.8%;
																		/* padding:1%; */
																		margin:0px;
																		font-weight : bolder;
																		border-width:0px;
																		" class="row">
										<button type="button" id="btnWorkStart" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-primary">작업시작</button>
										<button type="button" id="btnWorkEnd" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;white-space: nowrap;" class="btn btn-outline-success">작업완료</button>
										
										<button type="button" id="btnWorkSave" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-success">저장</button>
										<button type="button" id="btnWorkDel" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">실적삭제</button>
										
										<button type="button" id="btnWorkCancel" style="font-size: 2em !important;width:49%;margin-bottom:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">진행취소</button>
										<button type="button" id="btnCompulsionEnd" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">강제완료</button>
										
										<button type="button" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-success">공정검사</button>
										<button type="button" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;white-space: nowrap;" class="btn btn-outline-success">자재반입</button>
										
										<button type="button" style="font-size: 2em !important;width:100%;white-space: nowrap;" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									</div>
							
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
			
	</div>
		
</div> 
<!-- 실적등록 모달 끝 -->

<!-- 실적등록(번들링) 모달 -->
<div class="modal fade" id="workOrderPrcssBundleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog row" style="width: 75vw;max-width: 75vw;height: 93vh;max-height:93vh;">
		<div class="modal-content" style="width:100%;height:100%;">
			<div class="modal-body" style="height: 100%;max-height: 100%;">
				<div class="row" style="width:100%;height:100%;">
					<div style="width:100%;height:100%;margin-right:4px;">
						<div class="row" style="width:100%;height:70%;">
							<div style="width:74.6%;height:100%;">
								<div style="width:100%;height:100%;">
									<div style="padding: 5px;padding-bottom:0px;margin-bottom:5px;width:100%;height:7.5%;">
										<table class="table table-bordered p-0 m-0" style="height:100%;">
											<colgroup>
												<col width="12.5%">
												<col width="12.5%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="40%">
											</colgroup>
											<tr style="width:100%;">
												<th class="text-center align-middle">수주상세번호</th>
												<td class="text-center align-middle">
													<div id="modalBizOrdDtlNoBundle"></div>
												</td>
												<th class="text-center align-middle">공정명</th>
												<td class="text-center align-middle">
													<div id="modalPrcssNmBundle"></div>
												</td>
												<th class="text-center align-middle">제품명</th>
												<td colspan="3" class="text-center align-middle">
													<div id="itemNmBundle"></div>
												</td>
											</tr>
										</table>
									</div>
									
									<div style="padding:0px 5px; margin-bottom:5px;width:100%;height:50%;">
										<table class="table table-bordered p-0 m-0" style="height:100%;">
											<colgroup>
												<col width="12.5%">
												<col width="12.5%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="15%">
												<col width="10%">
												<col width="15%">
											</colgroup>
											<tr style="width:100%;">
												<th class="text-center align-middle">자재코드</th>
												<td class="text-center align-middle">
													<div id="customerItemCdBundle"></div>
												</td>
												<th class="text-center align-middle">버전번호</th>
												<td class="text-center align-middle">
													<a id="itemVersionLinkBundle" href="" target="_blank">
														<span id="itemVersionBundle"></span>
													</a>
												</td>
												
												<th class="text-center align-middle">코팅방법</th>
												<td class="text-center align-middle">
													<div id="coatingMethodBundle"></div>
												</td>
												<th class="text-center align-middle">코팅판번호</th>
												<td class="text-center align-middle">
													<div id="resinBoardBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">COLOR</th>
												<td colspan="3" class="text-center align-middle">
													<div id="itemColorBundle"></div>
												</td>
												<!-- <th class="text-center align-middle">작업방법</th>
												<td class="text-center align-middle">	
													<div id="workMethodMultiSelect" style="width:100%;"></div>
												</td>
												<th class="text-center align-middle">버전번호</th>
												<td class="text-center align-middle">
													<a id="itemVersionLink" href="" target="_blank">
														<span id="itemVersion"></span>
													</a>
												</td> -->
												<th class="text-center align-middle">도수</th>
												<td class="text-center align-middle">
													<div id="itemFrequencyBundle"></div>
												</td>
												<th class="text-center align-middle">(수주)지시수량</th>
												<td class="text-center align-middle">
													<div id="allWorkOrdQtyBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">목형번호</th>
												<td class="text-center align-middle">
													<div id="woodenCareCdBundle"></div>
												</td>
												<th class="text-center align-middle">타공목형번호</th>
												<td class="text-center align-middle">
													<div id="holeWoodenCdBundle"></div>
												</td>
												<th class="text-center align-middle">사이즈</th>
												<td class="text-center align-middle">
													<div id="itemSizeBundle"></div>
												</td>
												<th class="text-center align-middle">칼끝규격</th>
												<td class="text-center align-middle">
													<div id="knifeTipSizeBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">FOIL</th>
												<td class="text-center align-middle">
													<div id="etc4Bundle"></div>
												</td>
												<th class="text-center align-middle">FOIL COLOR</th>
												<td class="text-center align-middle">
													<div id="etc5Bundle"></div>
												</td>
												<th class="text-center align-middle">부분UV</th>
												<td class="text-center align-middle">
													<div id="etc3Bundle"></div>
												</td>
												<th class="text-center align-middle">후가공판번호</th>
												<td class="text-center align-middle">
													<div id="etc2CdBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">성형방식</th>
												<td class="text-center align-middle">
													<div id="moldingMethodBundle"></div>
												</td>
												<th class="text-center align-middle">성형내용</th>
												<td class="text-center align-middle">
													<div id="moldingContentsBundle"></div>
												</td>
												<th class="text-center align-middle">형압</th>
												<td class="text-center align-middle">
													<div id="etc6Bundle"></div>
												</td>
												<th class="text-center align-middle">동판번호</th>
												<td class="text-center align-middle">
													<div id="pressMethodBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">묶음법</th>
												<td class="text-center align-middle">
													<div id="bundleMethodNmBundle"></div>
												</td>
												<th class="text-center align-middle">묶음단위</th>
												<td class="text-center align-middle">
													<div id="bundleUnitBundle"></div>
												</td>
												<th class="text-center align-middle">포장단위</th>
												<td class="text-center align-middle">
													<div id="packUnitBundle"></div>
												</td>
												<th class="text-center align-middle">포장박스</th>
												<td class="text-center align-middle">
													<div id="packMethodNmBundle"></div>
												</td>
											</tr>
											<tr>
												<th class="text-center align-middle">건별전달사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="relayNoticeBundle" style="overflow:auto;white-space:pre-line;max-height:40px;"></div>
												</td>
												<th class="text-center align-middle">특이사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="specialNoticeBundle" style="overflow:auto;white-space:pre-line;max-height:40px;"></div>
												</td>
												<!-- <th class="text-center align-middle">수주특이사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="bizOrdIssue" style="white-space:pre-line;width:330px;"></div>
												</td>
												<th class="text-center align-middle">수주전달사항</th>
												<td colspan="3" class="text-start align-middle">
													<div id="bizOrdNote" style="white-space:pre-line;width:330px;"></div>
												</td> -->
												<!-- <th rowspan="2" class="text-center align-middle">지시비고사항</th>
												<td colspan="3" rowspan="2" class="text-start align-middle">
													<div id="workOrdDesc" style="white-space:pre-line;width:330px;"></div>
												</td> -->
											</tr>
											<tr>
												<th class="text-center align-middle">검수방법</th>
												<td class="text-center align-middle">
													<div id="inspectMethodNmBundle"></div>
												</td>
												<th class="text-center align-middle">기타1</th>
												<td class="text-center align-middle">
													<div id="etc7Bundle"></div>
												</td>
												<th class="text-center align-middle">기타2</th>
												<td class="text-center align-middle">
													<div id="etc8Bundle"></div>
												</td>
												<th class="text-center align-middle">기타3</th>
												<td class="text-center align-middle">
													<div id="etc9Bundle"></div>
												</td>
											</tr>
										</table>
									</div>
									
									<div style="padding: 0px 5px;width:100%;height:42%;" id="workOrderPrcssModalTableHeightBundle">
										<table class="table table-bordered p-0 m-0" id="inputBundleModalTable">
											<thead class="table-light">
												<tr>
													<th class="text-center align-middle">품목명</th>
													<th class="text-center align-middle">현재고</th>
													<th class="text-center align-middle" style="min-width:59px;max-width:59px;">투입수량</th>
													<th class="text-center align-middle">출고수량</th>
													<th class="text-center align-middle">불량수량</th>
													<th class="text-center align-middle">버전번호</th>
													<th class="text-center align-middle">수주상세번호</th>
													<th class="text-center align-middle">실적수량</th>
													
												</tr>
											</thead>
										</table>
									</div>					
								</div>
							</div>
						</div>
					<div class="row" style="width:74%;height:30%;">
						<div class="" style="padding:5px;padding-right:0px;padding-top:0px;padding-bottom:0px;width: 37.1%;height: 100%;">
							<div style="/* border: solid; */width: 100%;height: 50%;" id="workOrdPrcssResultTableHeightBundle">
								<table class="table table-bordered p-0 m-0 " id="workOrdPrcssResultTableBundle">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle" style="vertical-align: middle;">실적등록일</th>
											<th class="text-center align-middle" style="vertical-align: middle;">등록자</th>
											<th class="text-center align-middle" style="vertical-align: middle;">작업량</th>
											<th class="text-center align-middle" style="vertical-align: middle;">불량</th>
										</tr>
									</thead>
								</table>
							</div>
							<table class="table table-bordered p-0 m-0" style="height: 50%;width:100%;">
								<colgroup>
											<col width="11%">
											<col width="49%">
										</colgroup>
										<tr>
											<th class="text-center align-middle">작업일자</th>
											<td class="text-center align-middle">
												<input type="date" class="form-control inputGroup virtualKeyboard2" id="workDateBundle" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle">시작시간</th>
											<td class="text-center align-middle">
												<input type="datetime-local" class="form-control inputGroup virtualKeyboard2" id="workStartTimeBundle" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle">종료시간</th>
											<td class="text-center align-middle">
												<input type="datetime-local" class="form-control inputGroup virtualKeyboard2" id="workEndTimeBundle" disabled>
											</td>
										</tr>
							</table>
						</div>
						
						<div style="/* padding-top:10px; */width: 62.9%;/* height: 100%; */overflow:auto;">
								<div class="row" style="padding-left:5px;padding-top:0px;padding-bottom:1px;width:100%;height: 100%;">
									<table class="table table-bordered p-0 m-0" style="height: 100%;width:100%;">
										<colgroup>
											<col width="10%">
											<col width="15%">
											<col width="10%">
											<col width="15%">
											<col width="10%">
											<col width="40%">
										</colgroup>
										
										<tr>
											<th class="text-center align-middle" style="height:50%;">전체공정<br>특이사항</th>
											<td class="text-center align-middle" colspan="3">
												<div class="row" style="height:100%;"> 
													<textarea id="workOrdBeforePrcssDescBundle" class="form-control resize-none inputGroup" style="resize: none;height:100%;width:83.9%;" disabled></textarea>
													<input type="checkbox" id="workOrdBeforePrcssDescCheckBundle" style="width:14%;margin-left:5px;">
												</div>
											</td>
											<th class="text-center align-middle" style="height:50%;">현공정<br>특이사항</th>
											<td class="text-center align-middle" colspan="3">
												<textarea id="fieldDescBundle" class="form-control resize-none inputGroup" style="resize: none;height:100%;" disabled></textarea>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle" style="height:20%;">수주수량</th>
											<td class="text-end align-middle">
												<div id="bizOrdQtyBundle"></div>
											</td>
											<th class="text-center align-middle" style="height:20%;">지시수량</th>
											<td class="text-end align-middle">
												<div id="workOrdQtyBundle"></div>
											</td>
											<th class="text-center align-middle">전공정<br>실적</th>
											<td class="text-end align-middle">
												<div class="row">
													<div id="workOrdBeforePrcssQtyHiddenBundle" style="width:50%;"></div>
													<div id="workOrdBeforePrcssQtyBundle" style="width:50%;"></div>
												</div>
											</td>
										</tr>
										<tr>
											<th colspan="1" class="text-center align-middle">작업량</th>
											<td colspan="5" class="text-center align-middle">
												<div style="display: flex; flex-wrap: 1 1 auto;">
													<input type="text" id="workQtyRChangeBundle" class="form-control text-end me-1" placeholder="R변환" disabled>
													<input type="text" id="workQtyBundle" class="form-control text-end me-1 inputGroup virtualKeyboard2" value="0" onkeyup="numberFormat(this,'int')" disabled>
													<input type="text" id="workPrcssQtyUnitBundle" class="form-control text-end me-1" placeholder="공정단위" disabled>
												</div>
											</td>
										</tr>
										<tr>
											<th colspan="1" class="text-center align-middle">불량</th>
											<td colspan="5" class="text-center align-middle">
													<div style="display: flex; flex-wrap: 1 1 auto;">
													<input type="text" id="workFaultyQtyRChangeBundle" class="form-control text-end me-1" placeholder="R변환" disabled>
													<input type="text" id="workFaultyQtyBundle" class="form-control text-end me-1 inputGroup virtualKeyboard2" value="0" onkeyup="numberFormat(this,'int')" disabled>
													<input type="text" id="workPrcssFaultyQtyUnitBundle" class="form-control text-end me-1" placeholder="공정단위" disabled>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						
						<div class="row">
								<div class="card virtualKeyboard_content2" style="
																		width: 25%;
																		height: 67.4vh;
																		position: absolute;
																		bottom: 24.75%;
																		left: 73.8%;
																		/* padding:1%; */
																		margin:0px;
																		font-weight : bolder;
																		border-width:0px;
																		">							
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_1_0Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">7</div>
										<div class="col virkey" id="virkeypad_1_1Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">8</div>
										<div class="col virkey" id="virkeypad_1_2Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">9</div>
										<div class="col virkey" id="virkeypad_0_0Bundle" style="font-size:2vw;padding-left: 5%;margin-right:5px; text-align:center;"><i class="fas fa-long-arrow-alt-left" id="backspace"></i></div>
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_2_0Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">4</div>
										<div class="col virkey" id="virkeypad_2_1Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">5</div>
										<div class="col virkey" id="virkeypad_2_2Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">6</div>
										<div class="col virkey" id="virkeypad_2_3Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px; text-align:center;"><i class="far fa-caret-square-up" id="upCount"></i></div>
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">							
										<div class="col virkey" id="virkeypad_3_0Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">1</div>
										<div class="col virkey" id="virkeypad_3_1Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">2</div>
										<div class="col virkey" id="virkeypad_3_2Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">3</div>
										<div class="col virkey" id="virkeypad_3_3Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px; text-align:center;"><i class="far fa-caret-square-down" id="downCount"></i></div>
																
									</div>
									<div class="row virtualKeyboard_content2" style="width:100%; height:19%; margin-bottom: 5px;">
										<div class="col virkey" id="virkeypad_4_0Bundle" style="font-size: 2vw !important;padding-left: 5%; min-width:10%;margin-right:5px;">0</div>
										<div class="col virkey" id="virkeypad_4_1Bundle" style="font-size: 2vw !important;padding-left: 5%;margin-right:5px;">.</div>
											<div class="col virkey" id="virkeypad_4_2Bundle" style="font-size: 0.8vw !important;padding-left: 5%;margin-right:5px;">Enter</div>
									</div>
								
								</div>
								 <div style="
																		width: 25%;
																		height: 34.35vh;
																		position: absolute;
																		bottom: 2.5%;
																		left: 73.8%;
																		/* padding:1%; */
																		margin:0px;
																		font-weight : bolder;
																		border-width:0px;
																		" class="row">
										<button type="button" id="btnWorkStartBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-primary">작업시작</button>
										<button type="button" id="btnWorkEndBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;white-space: nowrap;" class="btn btn-outline-success">작업완료</button>
										
										<button type="button" id="btnWorkSaveBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-success">저장</button>
										<button type="button" id="btnWorkDelBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">실적삭제</button>
										
										<button type="button" id="btnWorkCancelBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">진행취소</button>
										<button type="button" id="btnCompulsionEndBundle" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;border-color: #dc3545;white-space: nowrap;" class="btn btn-outline-danger">강제완료</button>
										
										
										<button type="button" style="font-size: 2em !important;width:49%;margin-bottom:5px;white-space: nowrap;" class="btn btn-outline-success">공정검사</button>
										<button type="button" style="font-size: 2em !important;width:49%;margin-bottom:5px;margin-left:5px;white-space: nowrap;" class="btn btn-outline-success">자재반입</button>
										
										<button type="button" style="font-size: 2em !important;width:100%;white-space: nowrap;" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									</div>
							
						</div>
						
					</div>
					
				</div>
				
			</div>
			
		</div>
			
	</div>
		
</div> 
<!-- 실적등록(번들링) 모달 끝 -->

<!-- 공정 작업완료 경고 -->
<div class="modal fade" id="workEndModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				작업완료할 경우 더 이상 공정실적을 수정할 수 없습니다.<br>
				작업완료하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnWorkEndModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnWorkEndModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 공정 작업완료 경고 모달 끝 -->

<!-- 수주취소 경고 -->
<div class="modal fade" id="compulsionEndModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<label style="">강제완료 진행시</label>
				<br>
				<label class="mt-2" style="color: red;">1. 대기, 진행 중인 공정은 강제 완료처리됩니다.</label>
				<br>
				<label style="color: red;">2. 수주는 강제완료 처리됩니다.</label>
				<br>
				<label style="color: red;">3. 더 이상 수정 및 복구가 불가능합니다.</label>
				<br>
				<label class="mt-2">계속하시겠습니까?</label>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnCompulsionEndY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnCompulsionEndN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 수주취소 경고 모달 끝 -->

<!-- 화면설정 script -->
<script>
	let isDraggingVT = false; // 세로 드레그 여부
	let isDraggingVB = false; // 세로 드레그 여부
	let isDraggingH = false; // 가로 드레그 여부
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
		if(type == 'VT') { isDraggingVT = true; SetCursor("n-resize");}
		if(type == 'VB') { isDraggingVB = true; SetCursor("n-resize");}
		if(type == 'H') { isDraggingH = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingVT || isDraggingVB || isDraggingH) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDraggingVT = false;
			isDraggingVB = false;
			isDraggingH = false;
			SetCursor("auto");
		}
	}

	function minimum(node) {
		let id = $(node).attr('id');

		if(id == 'dragbarVT') {
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolM_height = parseInt($('#rightcolM').height());	// 우측 중단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolM_min_height = 34;	// 우측 중단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let dragbarV_height = 4;

			let cols = [];

			//최소화기능만 적용
			cols = [
				page_height - rightcolB_height - rightcolM_min_height - dragbarWidth*2,
				dragbarWidth,
				rightcolM_min_height,
				dragbarWidth,
				rightcolB_height
			];
		
			/* if(rightcolM_height == rightcolM_min_height) { // 원위치
				cols = [
					rightcolT_min_height,
					dragbarWidth,
					page_height - dragbarWidth*2 - rightcolB_height - rightcolT_min_height,
					dragbarWidth,
					rightcolB_height
				];
			} else { // 최소화
				cols = [
					page_height - rightcolB_height - rightcolM_min_height - dragbarWidth*2,
					dragbarWidth,
					rightcolM_min_height,
					dragbarWidth,
					rightcolB_height
				];
			} */
			
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-rows',newColDefn);
		} else if(id == 'dragbarVB') {
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolM_height = parseInt($('#rightcolM').height());	// 우측 중단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolM_min_height = 34;	// 우측 중단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let dragbarV_height = 4;

			let cols = [];

			cols = [
				rightcolT_height,
				dragbarWidth,
				page_height - rightcolT_height - rightcolB_min_height - dragbarWidth*2,
				dragbarWidth,
				rightcolB_min_height
			];
			
			/* if(rightcolB_height == rightcolB_min_height) { // 원위치
				cols = [
					rightcolT_height,
					dragbarWidth,
					rightcolM_min_height,
					dragbarWidth,
					page_height - rightcolT_height - rightcolM_min_height - dragbarWidth*2
				];
			} else { // 최소화
				cols = [
					rightcolT_height,
					dragbarWidth,
					page_height - rightcolT_height - rightcolB_min_height - dragbarWidth*2,
					dragbarWidth,
					rightcolB_min_height
				];
			} */
			
			
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			
			$('#page').css('grid-template-rows',newColDefn);
		}

		dataTableDrawAll(); // dataTable 전체 reload
	}
	
	function OnDrag(event) {
		if (isDraggingH) { // 좌우 스크롤
			let page = document.getElementById("page");
			let leftcol = document.getElementById("leftcol"); // 좌측
			let rightcolT = document.getElementById("rightcolT"); // 우측 상단
			let rightcolM = document.getElementById("rightcolM"); // 우측 중단
			let rightcolB = document.getElementById("rightcolB"); // 우측 하단
			let dragbarWidth = 4;
			let leftcolMinWidth = 20; // leftcol 최소사이즈
			$('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			});
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = page.clientWidth - parseInt(Math.max(leftcolMinWidth + 120, event.clientX));
			
			let cols = [
				parseInt(Math.max(leftcolMinWidth, page.clientWidth - dragbarWidth - parseInt(Math.max(rightColWidth, rightcolMinWidth)))),
				dragbarWidth,
				parseInt(Math.max(rightColWidth, rightcolMinWidth))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			page.style.gridTemplateColumns = newColDefn;
	
			event.preventDefault();
		} else if (isDraggingVT) { // rightcolT와 rightcolM 사이
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolM_height = parseInt($('#rightcolM').height());	// 우측 중단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolM_min_height = 34;	// 우측 중단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)

			
			let cols = [
				Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_height - rightcolM_min_height - dragbarWidth*2),
				dragbarWidth,
				page_height - rightcolB_height - dragbarWidth*2 - Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_height - rightcolM_min_height - dragbarWidth*2),
				dragbarWidth,
				rightcolB_height
			];

	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault();
		} else if (isDraggingVB) { // 상하 스크롤
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolM_height = parseInt($('#rightcolM').height());	// 우측 중단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolM_min_height = 34;	// 우측 중단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
			
			let cols = [
				rightcolT_height,
				dragbarWidth,
				Math.min(Math.max(cursorY - rightcolT_height - dragbarWidth, rightcolM_min_height), page_height - rightcolT_height - dragbarWidth*2 - rightcolB_min_height),
				dragbarWidth,
				Math.max(rightcolB_min_height, page_height - rightcolT_height - dragbarWidth*2 - Math.max(cursorY - rightcolT_height - dragbarWidth, rightcolM_min_height))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault();
		}
	}
</script>

<script>
	WM_init('new');
	WM_init('edit');

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	// 공통코드 조회
	let faultyReasonList = getCommonCode('일반', '030'); // 불량구분
	let ordStatusList = getCommonCode('시스템', '022'); // 수주상태

	selectBoxAppend(faultyReasonList, 'faultyReason', '', '1'); //불량구분
	
	let sessionUserNm = "${userNm}";//세션에서 가져온 유저이름
	let delStatus = '';

	let workMethodJson = '';
	let workMethod = '';
	let workOrdIdx = '';
	let bizOrdDtlIdxVal = '';
	let workOrdPrcssIdx = '';
	let workOrdPrcssIdxVal = '';
	let checkVo = '';
	let prcssQtyUnit = false;
	
	//공정작업상태맵 
	let progressStatusListMap = new Map();
	progressStatusListMap.set('PI','대기');
	progressStatusListMap.set('WI','진행');
	progressStatusListMap.set('WC','완료');

	let trId = '';
	
	let startDate = moment().subtract('w',1).format('YYYY-MM-DD').replaceAll('-','');
	let endDate = moment().format('YYYY-MM-DD');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	
	/**************************************************************작지공정목록**************************************************************/
	// 작지공정 목록조회
	$('#workOrderPrcssTable thead tr').clone(true).addClass('filters').appendTo('#workOrderPrcssTable thead'); // filter 생성
	let workOrderPrcssTable = $('#workOrderPrcssTable').DataTable({
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
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/workOrdLstWithPrcssByOrdDate"/>',
			type : 'POST',
			data : {
				'searchTarget' : function(){ return $('#searchTarget').val();},
				'startDate' : function(){return startDate;},
				'endDate'	: function(){return endDate;}
			},
		}, 
        rowId: 'workOrdPrcssIdx',
		columns : [
			/* { className : 'text-center',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><input type="checkbox" name="btnCheck" style="width:20px; height:20px;"></div>';
				}
			},//체크박스 */
			{ data: 'bizStatusCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return _.filter(ordStatusList,v=>v.commonCd == data)[0].commonNm;
					} else {
						return '수주등록';
					}
				}
			},//수주상태
			{ data: 'workOrdPrcssJson', className : 'text-center',
				render: function(data, type, row, meta) {
					let jsonData = JSON.parse(data);
					//완료공정
					let wcPrcssList = _.filter(jsonData, v=> v.progressStatus == 'WC');
					if(wcPrcssList.length > 0){
						//공정순서가 제일큰 -> 마지막 공정인
						let maxList = _.maxBy(wcPrcssList, v=>v.prcssOrder);
						return maxList.prcssNm;
					} else {
						return '-';
					}
				}
			},//생산상태
			{ data: 'progressStatus', className : 'text-center',
				render: function(data, type, row, meta) {
					return progressStatusListMap.get(data);
				}
			},//공정작업상태
			{ data : 'prcssNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//공정명
			{ data : 'equipNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//설비명
			{ data : 'ordDate', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//생산지시일
			{ data : 'ordEndDate', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//목표요구일
			{ data : 'outReqDate', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//납품요구일
			{ data : 'workOrdQty', className : 'text-end',
				render: function(data, type, row, meta) {
					let addCuttingVal = row['addCutting'] != null & row['addCutting'] != '' ? row['addCutting'] : 0;
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data) + parseFloat(addCuttingVal))+'</div>';
					} else {
						return '0';
					}
				}
			},//지시수량
			{ data : 'prevPrcssFairQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//전공정 양품수량
			{ data : 'fairQty',className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//생산수량
			{ data : 'faultyQty',className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//불량수량
			{ data : 'fairQty',className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ addCommas(parseFloat(row['workOrdQty']) - parseFloat(data) - parseFloat(row['faultyQty']) )+'</div>';
					} else {
						return addCommas(parseFloat(row['workOrdQty']));
					}
				}
			},//미생산수량
			{ data : 'woodenWdCd', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//목형번호
			{ data : 'resinBoardWdCd', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수지판번호
			{ data : 'bizOrdDtlNo', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수주번호
			{ data : 'itemNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수주번호
			{ data : 'bizOrdQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//수주량
			{ data : 'workOrdNo', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//지시번호
			{ data : 'prcssDesc', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//생산 특이사항
			{ data : 'workOrdDesc', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//지시비고사항
			
		],
		columnDefs : [
			/*{
				targets: '_all',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},*/
			{ "targets": [0], "orderable": false },
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
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#workOrderPrcssTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 80)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			let rowData = api.data().toArray();
			if(rowData.length != 0){
				for(var i = 0; i < rowData.length ; i++){
					//다음공정이없고 생산량이 수주량보다 작은경우 -> 마지막공정에 생산량 미달
					if( rowData[i].progressStatus == 'WC'
						&& (rowData[i].prcssNextIdx == null || rowData[i].prcssNextIdx == '')
						&& (rowData[i].fairQty < rowData[i].bizOrdQty) ){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).addClass('bg-danger bg-gradient');
					}			

					if(rowData[i].ordGubun == '20'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).addClass('fw-bolder');
						$(node).css('background-color','#FFF2CC');
					}		
				}
			}
			try {
				workOrderPrcssTable.columns.adjust();
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
				let cell = $('#workOrderPrcssTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				//if(colIdx > 0){
					$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
					$(cell).css('padding','2px');
				//} else {
				//	$(cell).html('');
				//	$(cell).css('padding','2px');
				//}
				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workOrderPrcssTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			api.button(3).trigger();
		},
	});
	// dataTable colReorder event
	workOrderPrcssTable.on('column-reorder', function( e, settings, details ) {
		let api = workOrderPrcssTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workOrderPrcssTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	let itemIdx = '';
	let bodIdx = '';
	$('#workOrderPrcssTable tbody').on('click','tr', function() {
		let data = workOrderPrcssTable.row(this).data();
		workOrdIdx = data.workOrdIdx;
		workOrdPrcssIdxVal = data.workOrdPrcssIdx;
		itemIdx = data.itemIdx;
		bodIdx = data.bizOrdDtlIdx;
		//workOrdPrcssStatusTable.ajax.reload();
		workPrcssDtlTable.ajax.reload();
		inputMaterialHistTable.ajax.reload();
	});
	
	$('#workOrderPrcssModal').on('shown.bs.modal', function () {
		purchaseMatrlModalTable.draw(false);
		/* $('#workMethodMultiSelect').select2({
    		data: JSON.parse(workMethodJson),
    		multiple : true,
    		placeholder: "",
    	});
		$('#workMethodMultiSelect').next().css('width','80%');
		$('#workMethodMultiSelect').find('span').eq(0).css('width','70%');
		$('#workMethodMultiSelect').find('.select2-search__field').css('width','70%');
		$('#workMethodMultiSelect').find('.select2-selection__rendered').attr('style','display:flex; align-content:flex-start; flex-direction:column; flex-wrap:wrap; overflow:auto;');
    	
		if(workMethod != null && workMethod != ''){
			let splitData = workMethod.split(',');
			$('#workMethodMultiSelect').val(splitData).trigger('change');
		}
		$('#workMethodMultiSelect').trigger('change'); */
		setTimeout(function() {
			workOrdPrcssResultTable.draw(false);
		}, 200);
	});

	$('#workOrderPrcssModal').on('shown.bs.modal',function(){
		purchaseMatrlModalTable.draw(false).columns.adjust();
		workOrdPrcssResultTable.draw(false).columns.adjust();

	});
	
	$('#workOrderPrcssBundleModal').on('shown.bs.modal',function(){
		inputBundleModalTable.draw(false).columns.adjust();
		workOrdPrcssResultTableBundle.draw(false).columns.adjust();

	});
	
	
	//더블클릭
	$('#workOrderPrcssTable tbody').on('dblclick','tr', function() {
		let data = workOrderPrcssTable.row(this).data();
		workOrdIdx = data.workOrdIdx;
		workOrdPrcssIdxVal = data.workOrdPrcssIdx;
		itemIdx = data.itemIdx;
		bodIdx = data.bizOrdDtlIdx;
		workOrdIdx = data.workOrdIdx;
		bizOrdDtlIdxVal = data.bizOrdDtlIdx;
		workOrdPrcssIdx = data.workOrdPrcssIdx;
		//전 공정들이 다 작업되었는지 체크
		$.ajax({
			url: '<c:url value="/wm/checkWorkOrdPrcssFinish"/>',
            type: 'POST',
            data: {
                'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == 'ok'){
					let data = res.data;		

					if(data.beforePrcssDesc != '' && data.beforePrcssDesc != null && data.descCheckYn != 'Y'){
						//toastr.warning('전공정 특이사항을 읽은 후<br>작업해주세요.');
					} 
					if(data.resultPageNm == 'workOrderPrcssBundleModal'){
						workOrdPrcssResultModal(data,'Bundle','open');
					} else {
						workOrdPrcssResultModal(data,'','open');
					}
					
					//공정이 대기,완료인경우 -> 버튼 비활성화 , 공정이 진행중인 경우 -> 버튼 활성화
					//대기
					if(data.progressStatus == 'PI'){
						workInputDisabled(true);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',false);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',false);
					} else if(data.progressStatus == 'WI'){//진행
						workInputDisabled(false);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
					} else if(data.progressStatus == 'WC'){//완료
						workInputDisabled(true);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
					}
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					workOrderPrcssTable.ajax.reload(function(){},false);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	}); 

	//작업시작버튼 클릭
	$('#btnWorkStart, #btnWorkStartBundle').on('click',function(){
		let btnGubun = $(this).attr('id');
		let data = workOrderPrcssTable.row('.selected').data();
		//현 공정의 상태값 체크
		$.ajax({
			url: '<c:url value="/wm/workOrdSelWithPrcss"/>',
            type: 'POST',
            data: {
            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == 'ok'){
					let data = res.data;
					//현공정이 대기인경우 -> 작업시작, 공정이 진행,완료중인 경우 -> 이미 진행중 toastr
					if(data.progressStatus == 'WI'){//진행
						if(btnGubun == 'btnWorkStartBundle'){
							workOrderModalDisabled(data,'Bundle',false);
						} else {
							workOrderModalDisabled(data,'',false);
						}

						toastr.warning('이미 진행중인 공정입니다.');
						
					} else if(data.progressStatus == 'WC'){//완료
						toastr.warning('이미 작업완료된 공정입니다.');
					} else if(data.progressStatus == 'PI'){//대기
						//작업시작
						$.ajax({
							url: '<c:url value="/wm/workOrdPrcssStart"/>',
				            type: 'POST',
				            data: {
				            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
				 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
				            success : function(res) {
				            	if(res.result == 'ok'){
									let data = res.data;
									toastr.success('공정이 시작되었습니다.');
									if(btnGubun == 'btnWorkStartBundle'){
										workOrderModalDisabled(data,'Bundle',false);
									} else {
										workOrderModalDisabled(data,'',false);
									}
					            	$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
					            	$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
				            	} else if(res.result == 'fail') {
									toastr.warning(res.message);
								} else {
									toastr.error(res.message);
								}
				            	$('#my-spinner').hide();
				            }
						});
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

	//작업저장버튼 클릭
	$('#btnWorkSave').on('click',function(){
		let data = workOrderPrcssTable.row('.selected').data();
		/* if( data.progressStatus == 'PI'){
			toastr.warning('공정이 대기상태입니다.<br>작업 시작 후 다시 시도해주세요.');
			return false;
		}
		if( data.progressStatus == 'WC'){
			toastr.warning('이미 작업완료된 공정입니다.');
			return false;
		} */
		
		if( $('#workDate').val() == '' || $('#workDate').val() == null ){
			toastr.warning('작업일자를 선택해주세요.');
			$('#workDate').focus();
			return false;
		}
		if( $('#workStartTime').val() == '' || $('#workStartTime').val() == null ){
			toastr.warning('시작시간을 선택해주세요.');
			$('#workStartTime').focus();
			return false;
		}
		if( $('#workEndTime').val() == '' || $('#workEndTime').val() == null ){
			toastr.warning('종료시간을 선택해주세요.');
			$('#workEndTime').focus();
			return false;
		}
		if( $('#workQty').val() == '' || $('#workQty').val() == '0'){
			toastr.warning('작업량을 입력해주세요.');
			$('#workQty').focus();
			return false;
		}
		if( $('#workFaultyQty').val() == '' ){
			toastr.warning('불량을 입력해주세요.');
			$('#workFaultyQty').focus();
			return false;
		}
		let equalsTargetVal = 0;
		let addCuttingVal = isEmptyCheck(workOrderPrcssTable.row('.selected').data().addCutting) ? 0 : workOrderPrcssTable.row('.selected').data().addCutting;
		let addCutting = parseInt(addCuttingVal);
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적 비교 / 다르다면 지시수량으로 비교
		if( $('#workPrcssQtyUnit').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			equalsTargetVal = parseFloat(removeCommas($('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[^0-9]/gi,'')));
			//전공정실적 + 추가재단 수량 반영되어야함
			equalsTargetVal += addCutting;
		} else {
			equalsTargetVal = parseFloat(removeCommas($('#workOrdQty').text().replaceAll(',','')));
		}

		if(equalsTargetVal < parseFloat(removeCommas($('#workQty').val())) + parseFloat(removeCommas($('#workFaultyQty').val())) ){
			toastr.warning('지시수량을 초과했습니다.');
			$('#workQty').focus();
			return false;
		}
			
		let saveType = '';
		let workOrdResultIdx = '';
		if(workOrdPrcssResultTable.row('.selected').data() == undefined){
			saveType = 'insert';
			workOrdResultIdx = '0';
		} else {
			saveType = 'update';
			workOrdResultIdx = workOrdPrcssResultTable.row('.selected').data().idx;
		}
		//공정실적등록
		$.ajax({
			url: '<c:url value="/wm/workOrdPrcssResultSave"/>',
            type: 'POST',
            data: {
                'workOrdIdx'		:	function(){ return data.workOrdIdx; },
				'workOrdPrcssIdx'	:	function(){ return data.workOrdPrcssIdx; },
                'prcssIdx'			:	function(){ return data.prcssIdx; },
				'prcssOrder'		:	function(){ return data.prcssOrder; },
                'workDate'			:	function(){ return $('#workDate').val().replaceAll('-',''); },
                'workStartTime'		:	function(){ return $('#workStartTime').val().replaceAll('-','').replaceAll(':','').replaceAll('T',' '); },
                'workEndTime'		:	function(){ return $('#workEndTime').val().replaceAll('-','').replaceAll(':','').replaceAll('T',' '); },
                'fairQty'			:	function(){ return $('#workQty').val().replaceAll(',',''); },
                'faultyQty'			:	function(){ return $('#workFaultyQty').val().replaceAll(',',''); },
                'faultyReason'		:	function(){ return $('#faultyReason').val(); },
                'prcssDesc'			:	function(){ return $('#fieldDesc').val(); },
                'saveType'			:	function(){ return saveType; },
                'workOrdResultIdx'	:	function(){ return workOrdResultIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
            success : function(res) {
            	if(res.result == 'ok'){
					toastr.success('공정 실적이 등록되었습니다.');
					workOrdPrcssResultTable.rows('.selected').deselect();
					workOrdPrcssResultTable.ajax.reload();
					workOrderPrcssTable.ajax.reload(function(){
	            		setTimeout(function() {
	            			workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).select();
							$(workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).node()).trigger('click'); // 선택처리
						}, 100)
	            	});
					//workOrdPrcssStatusTable.ajax.reload();
					purchaseMatrlModalTable.ajax.reload();
					//workPrcssDtlTable.ajax.reload();

					//workPrcssCheckAndReload();
					
            	} else if(res.result == 'fail') {
					toastr.warning(res.message);
					purchaseMatrlModalTable.ajax.reload();
				} else {
					toastr.error(res.message);
				}
            	$('#my-spinner').hide();
            }
		});		
	});

	//번들링작업저장버튼 클릭
	$('#btnWorkSaveBundle').on('click',function(){
		let data = workOrderPrcssTable.row('.selected').data();
		if( data.progressStatus == 'PI'){
			toastr.warning('공정이 대기상태입니다.<br>작업 시작 후 다시 시도해주세요.');
			return false;
		}
		if( data.progressStatus == 'WC'){
			toastr.warning('이미 작업완료된 공정입니다.');
			return false;
		}
		
		if( $('#workDateBundle').val() == '' || $('#workDateBundle').val() == null ){
			toastr.warning('작업일자를 선택해주세요.');
			$('#workDateBundle').focus();
			return false;
		}
		if( $('#workStartTimeBundle').val() == '' || $('#workStartTimeBundle').val() == null ){
			toastr.warning('시작시간을 선택해주세요.');
			$('#workStartTimeBundle').focus();
			return false;
		}
		if( $('#workEndTimeBundle').val() == '' || $('#workEndTimeBundle').val() == null ){
			toastr.warning('종료시간을 선택해주세요.');
			$('#workEndTimeBundle').focus();
			return false;
		}
		if( $('#workQtyBundle').val() == '' || $('#workQtyBundle').val() == '0'){
			toastr.warning('작업량을 입력해주세요.');
			$('#workQtyBundle').focus();
			return false;
		}
		if( $('#workFaultyQtyBundle').val() == '' ){
			toastr.warning('불량을 입력해주세요.');
			$('#workFaultyQtyBundle').focus();
			return false;
		}
		/* let equalsTargetVal = 0;
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적 비교 / 다르다면 지시수량으로 비교
		if( $('#workPrcssQtyUnitBundle').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQtyBundle').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			equalsTargetVal = parseFloat(removeCommas($('#workOrdBeforePrcssQtyBundle').text().replaceAll(',','').replaceAll(/[^0-9]/gi,'')));
		} else {
			equalsTargetVal = parseFloat(removeCommas($('#workOrdQtyBundle').text().replaceAll(',','')));
		}

		if(equalsTargetVal < parseFloat(removeCommas($('#workQtyBundle').val())) + parseFloat(removeCommas($('#workFaultyQtyBundle').val())) ){
			toastr.warning('지시수량을 초과했습니다.');
			$('#workQtyBundle').focus();
			return false;
		} */
			
		let saveType = '';
		let workOrdResultIdx = '';
		if(workOrdPrcssResultTableBundle.row('.selected').data() == undefined){
			saveType = 'insert';
			workOrdResultIdx = '0';
		} else {
			saveType = 'update';
			workOrdResultIdx = workOrdPrcssResultTableBundle.row('.selected').data().idx;
		}
		
		let array = [];
		let state = true;
		//투입수량 정보
		if(inputBundleModalTable.data().length > 0){
			$('#inputBundleModalTable tbody').find('tr').each(function(index, item) {
				let td = $(item).find('td');
				let data = inputBundleModalTable.row($(item)).data();
				let node = inputBundleModalTable.row($(item)).node();
	
				let inputQty = $(node).find('td').eq(inputBundleModalTable.column('inputQty:name').index()).find('input[name=inputQty]').val();
	
				let workQty = parseFloat(removeCommas($('#workQtyBundle').val()));
				let workFaultyQty = parseFloat(removeCommas($('#workFaultyQtyBundle').val()));
				
				if(inputQty == '') {
					toastr.warning('투입수량을 입력해주세요.');
					$(node).find('td').eq(inputBundleModalTable.column('inputQty:name').index()).find('input[name=inputQty]').focus();
					state = false;
					return false;
				}
				//해당 투입수량이 작업량+불량보다 수량이 적을 경우
				if(inputQty < workQty+workFaultyQty){
					toastr.warning('작업 수량보다 투입수량이 작습니다.<br>투입수량을 확인해주세요.');
					$(node).find('td').eq(inputBundleModalTable.column('inputQty:name').index()).find('input[name=inputQty]').focus();
					state = false;
					return false;
				}
				
				let obj = new Object();
				obj.itemIdx = data.itemIdx;
				obj.inputQty = removeCommas(inputQty);
				array.push(obj);
				
			});
		} else {
			toastr.warning('번들링 제품을 확인해주세요.');
			state = false;
			return false;
		}
		if(state){
			//공정실적등록
			$.ajax({
				url: '<c:url value="/wm/workOrdPrcssResultSaveBundle"/>',
	            type: 'POST',
	            data: {
	                'workOrdIdx'		:	function(){ return data.workOrdIdx; },
					'workOrdPrcssIdx'	:	function(){ return data.workOrdPrcssIdx; },
	                'prcssIdx'			:	function(){ return data.prcssIdx; },
					'prcssOrder'		:	function(){ return data.prcssOrder; },
	                'workDate'			:	function(){ return $('#workDateBundle').val().replaceAll('-',''); },
	                'workStartTime'		:	function(){ return $('#workStartTimeBundle').val().replaceAll('-','').replaceAll(':','').replaceAll('T',' '); },
	                'workEndTime'		:	function(){ return $('#workEndTimeBundle').val().replaceAll('-','').replaceAll(':','').replaceAll('T',' '); },
	                'fairQty'			:	function(){ return $('#workQtyBundle').val().replaceAll(',',''); },
	                'faultyQty'			:	function(){ return $('#workFaultyQtyBundle').val().replaceAll(',',''); },
	                'faultyReason'		:	function(){ return $('#faultyReasonBundle').val(); },
	                'prcssDesc'			:	function(){ return $('#fieldDescBundle').val(); },
	                'saveType'			:	function(){ return saveType; },
	                'workOrdResultIdx'	:	function(){ return workOrdResultIdx; },
	                'inputQtyJson'		:	function(){ return JSON.stringify(array); },
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
	            success : function(res) {
	            	if(res.result == 'ok'){
						toastr.success('공정 실적이 등록되었습니다.');
						workOrdPrcssResultTableBundle.rows('.selected').deselect();
						workOrdPrcssResultTableBundle.ajax.reload();
						workOrderPrcssTable.ajax.reload(function(){
		            		setTimeout(function() {
		            			workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).select();
								$(workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).node()).trigger('click'); // 선택처리
							}, 100)
		            	});
						inputBundleModalTable.ajax.reload(function(){
							$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',false);
							$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').val($('#workOrdQtyBundle').text());
						});
						//workOrdPrcssStatusTable.ajax.reload();
						purchaseMatrlModalTable.ajax.reload();
						//workPrcssDtlTable.ajax.reload();
						//workPrcssCheckAndReload();
	            	} else if(res.result == 'fail') {
						toastr.warning(res.message);
						inputBundleModalTable.ajax.reload(function(){
							$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',false);
							$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').val($('#workOrdQtyBundle').text());
						});
					} else {
						toastr.error(res.message);
					}
	            	$('#my-spinner').hide();
	            }
			});		
		}
	});
	
	//작업완료 클릭
	$('#btnWorkEnd, #btnWorkEndBundle').on('click',function(){
		$('#workEndModal').data('type',$(this).attr('id'))
		$('#workEndModal').modal('show');
	});

	$('#btnWorkEndModalY').on('click',function(){
		let type = $('#workEndModal').data('type');
		let data = workOrderPrcssTable.row('.selected').data();
		//현 공정의 상태값 체크
		$.ajax({
			url: '<c:url value="/wm/workOrdSelWithPrcss"/>',
            type: 'POST',
            data: {
            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == 'ok'){
					let data = res.data;
					//현공정이 대기,완료인경우 -> toastr, 공정이 진행인 경우 -> 작업완료처리
					if(data.progressStatus == 'WI'){//진행
						//작업완료
						$.ajax({
							url: '<c:url value="/wm/workOrdPrcssEnd"/>',
				            type: 'POST',
				            data: {
				            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
				 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
				            success : function(res) {
				            	if(res.result == 'ok'){
									let data = res.data;
									checkVo = data;
									toastr.success('공정이 완료되었습니다.');
									$('#workOrderPrcssModal').modal('hide');
									$('#workOrderPrcssBundleModal').modal('hide');
									workOrderPrcssTable.ajax.reload(function(){
 										let reloadEndData = workOrderPrcssTable.data().toArray();
										//해당 checkVo의 idx가 현재 리로드된 테이블에 데이터가 없을 경우
										if(!reloadEndData.map(v=>v.workOrdPrcssIdx).includes(checkVo.workOrdPrcssIdx)){
											workOrderPrcssTable.row('.selected').deselect();
											//workOrdPrcssStatusTable.clear().draw();
											workPrcssDtlTable.clear().draw();
											inputMaterialHistTable.clear().draw();
										} else {
											//있을경우
											setTimeout(function() {
						            			workOrderPrcssTable.row('#'+checkVo.workOrdPrcssIdx).select();
												$(workOrderPrcssTable.row('#'+checkVo.workOrdPrcssIdx).node()).trigger('click'); // 선택처리
											}, 100)
										}
									});
									
									$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
					            	$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
				            	} else if(res.result == 'fail') {
									toastr.warning(res.message);
								} else {
									toastr.error(res.message);
								}
				            	$('#my-spinner').hide();
				            }
						});
					} else if(data.progressStatus == 'WC'){ //완료
						toastr.warning('이미 작업완료된 공정입니다.');
						if(type == 'btnWorkEndBundle'){
							workOrderModalDisabled(data,'Bundle',true);
						} else {
							workOrderModalDisabled(data,'',true);
						}
					} else if(data.progressStatus == 'PI'){//대기
						toastr.warning('작업 대기상태인 공정입니다.');
						if(type == 'btnWorkEndBundle'){
							workOrderModalDisabled(data,'Bundle',true);
						} else {
							workOrderModalDisabled(data,'',true);
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
	
	// 모든 체크박스 체크/해제 되도록
	$(document).on('change','input:checkbox[name=btnCheck]', function(){
		if( $('input:checkbox[name=btnCheck]').length == $('input:checkbox[name=btnCheck]:checked').length ){ //전체 체크박스 수와 체크된 박스의 수가 같을 때 -> 전체체크박스 체크 , 아닐 경우 해제
			$('#btnAllCheck').prop('checked',true);
		} else{
			$('#btnAllCheck').prop('checked',false);
		}
 	});

	//모든 체크박스 선택
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=btnCheck]').prop('checked',true);
		}else{
			$('input:checkbox[name=btnCheck]').prop('checked',false);
		}
	});

	let clickIdx;
	$('#btnSearch').on('click',function(){
		startDate = $('#startDate').val().replaceAll('-','');
		endDate = $('#endDate').val().replaceAll('-','');

		let trigger = false;
		
		if($('#workOrderPrcssTable tbody tr').hasClass('selected')){
			trigger = true;
			clickIdx = workOrderPrcssTable.row('.selected').data().workOrdPrcssIdx;
		}
		
		workOrderPrcssTable.ajax.reload(function(){
			let reloadEndData = workOrderPrcssTable.data().toArray();
			$('#btnAllCheck').prop('checked',false);
			if(trigger){
				setTimeout(function() {
					if(!reloadEndData.map(v=>v.workOrdPrcssIdx).includes(clickIdx)){
						//해당 행이 사라진 경우
						workOrderPrcssTable.row('.selected').deselect();
						//workOrdPrcssStatusTable.clear().draw();
						workPrcssDtlTable.clear().draw();
						inputMaterialHistTable.clear().draw();
					} else {
						//해당 행이 있는 경우
						workOrderPrcssTable.row('#'+clickIdx).select();
						$(workOrderPrcssTable.row('#'+clickIdx).node()).trigger('click'); // 선택처리
					}
				}, 50)
			}
		});
	});

	/**************************************************************공정별 진행상태**************************************************************/	
	// 공정별 진행상태 목록조회
	//$('#workOrdPrcssStatusTable thead tr').clone(true).addClass('filters').appendTo('#workOrdPrcssStatusTable thead'); // filter 생성
	/* let workOrdPrcssStatusTable = $('#workOrdPrcssStatusTable').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		/* select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        }, */
       /* ajax : {
			url : '<c:url value="/wm/workOrdLstWithPrcssByWorkOrd"/>',
			type : 'POST',
			data : {
				'workOrdIdx' : function(){return workOrdIdx;},
			},
		},
        rowId: 'workOrdPrcssIdx',
		columns : [
			{ data: 'progressStatus', className : 'text-center',
				render: function(data, type, row, meta) {
					return progressStatusListMap.get(data);
				}
			},//공정작업 진행상태
			{ data : 'prcssNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//공정명
			{ data : 'workOrdQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//지시수량
			{ data : 'fairQty', className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data) + parseFloat(row['faultyQty']))+'</div>';
					} else {
						return '0';
					}
				}
			},//생산량
			{ data : 'fairQty',className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let workOrdQty = row['workOrdQty'] != null && row['workOrdQty'] != '' ? row['workOrdQty'] : 0;
						let faultyQty = row['faultyQty'] != null && row['faultyQty'] != '' ? row['faultyQty'] : 0;
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ (addCommas(parseFloat(workOrdQty) - parseFloat(data) - parseFloat(faultyQty)))+'</div>';
					} else {
						let workOrdQty = row['workOrdQty'] != null && row['workOrdQty'] != '' ? row['workOrdQty'] : 0;
						return addCommas(parseFloat(workOrdQty));
					}
				}
			},//미생산수량
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
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		/*],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#workOrdPrcssStatusTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let	topHeight = parseFloat($('#rightcolB').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(topHeight - theadHeight - 58)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			let rowData = api.data().toArray();
			if(rowData.length != 0){
				for(var i = 0; i < rowData.length ; i++){
					if(rowData[i].workOrdPrcssIdx == workOrdPrcssIdxVal){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).css('background-color','rgb(246 242 195)');
					}
					if(rowData[i].progressStatus == 'PI'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('font-weight','900');
					} else if(rowData[i].progressStatus == 'WI'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('color','blue').css('font-weight','900');
					} else if(rowData[i].progressStatus == 'WC'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('color','green').css('font-weight','900');
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
				let cell = $('#workOrdPrcssStatusTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workOrdPrcssStatusTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workOrdPrcssStatusTable.on('column-reorder', function( e, settings, details ) {
		let api = workOrdPrcssStatusTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workOrdPrcssStatusTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	}); */

	/**************************************************************생산공정**************************************************************/
	// 생산공정내역 목록조회
	//$('#workPrcssDtlTable thead tr').clone(true).addClass('filters').appendTo('#workPrcssDtlTable thead'); // filter 생성
	let workPrcssDtlTable = $('#workPrcssDtlTable').DataTable({
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
	    scrollY: '100vh',
	    scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		/* select: {
	        style: 'single',
	        toggleable: false,
	        items: 'row',
	        info: false
	    }, */
        ajax : {
			url : '<c:url value="/wm/workOrdLstWithPrcssByWorkOrd"/>',
			type : 'POST',
			data : {
				'workOrdIdx' : function(){return workOrdIdx;},
			},
		}, 
        rowId: 'workOrdPrcssIdx',
		columns : [
			{ data: 'progressStatus', className : 'text-center',
				render: function(data, type, row, meta) {
					return progressStatusListMap.get(data);
				}
			},//공정작업 진행상태
			{ data : 'prcssNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//공정명
			{ data : 'fairQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//양품
			{ data : 'faultyQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//불량
			{ data : 'produceQtyUnitNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//단위
			{ data : 'regUserNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//공정명
		],
		columnDefs : [
			//{ "targets": '_all', "orderable": false },
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
			//	}
			//}
		],
		buttons : [
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#workPrcssDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let	topHeight = parseFloat($('#rightcolM').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(topHeight - theadHeight - 58)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			//progressOrder
			/* for(var i=0;i<data.length;i++) {
				let tr = $('#' + table_id + ' tbody').find('tr').eq(i);
				workPrcssDtlTable.row(tr).data().prcssOrder = i+1;
				$(tr).find('td').eq(0).html(i+1);
			} */
			$('#'+table_id+' tbody tr').attr('style',"vertical-align: middle;");

			let rowData = api.data().toArray();
			if(rowData.length != 0){
				for(var i = 0; i < rowData.length ; i++){
					if(rowData[i].workOrdPrcssIdx == workOrdPrcssIdxVal){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).css('background-color','rgb(246 242 195)');
					}
					if(rowData[i].progressStatus == 'PI'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('font-weight','900');
					} else if(rowData[i].progressStatus == 'WI'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('color','blue').css('font-weight','900');
					} else if(rowData[i].progressStatus == 'WC'){
						let node = api.row('#'+rowData[i].workOrdPrcssIdx).node();
						$(node).find('td').eq(0).css('color','green').css('font-weight','900');
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
				let cell = $('#workPrcssDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workPrcssDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workPrcssDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = workPrcssDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workPrcssDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	/**************************************************************투입자재**************************************************************/
	// 투입자재내역 목록조회
	//$('#inputMaterialHistTable thead tr').clone(true).addClass('filters').appendTo('#inputMaterialHistTable thead'); // filter 생성
	let inputMaterialHistTable = $('#inputMaterialHistTable').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		/* select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        }, */
        ajax : {
			url : '<c:url value="/wm/workOrdInputMaterialLst"/>',
			type : 'POST',
			data : {
				'itemIdx' : function(){ return itemIdx; },
				'bodIdx'  : function(){ return bodIdx; },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'paperType', className : 'text-center align-middle'},
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if((row['sizeX'] == null || row['sizeX'] == '') && (row['sizeY'] != null && row['sizeY'] != '')){
						return '0*' + addCommas(parseFloat(row['sizeY']));
					} else if((row['sizeX'] != null && row['sizeX'] != '') && (row['sizeY'] == null || row['sizeY'] == '')) {
						return addCommas(parseFloat(row['sizeX'])) + '*0';
					} else if((row['sizeX'] != null && row['sizeX'] != '') && (row['sizeY'] != null && row['sizeY'] != '')){
						return addCommas(parseFloat(row['sizeX'])) + '*' + addCommas(parseFloat(row['sizeY']));
					} else {
						return '0*0';
					}
				}
			},//장 * 폭
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return addCommas(parseFloat(row['cutQty'])) + '절/' + addCommas(parseFloat(row['eaQty'])) + '개';
				}
			},// 절수/개수
			/* {  className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					
					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						//let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						//let pressQty = Math.ceil((printPressQty + extraQty)/cutQty);
						
						let cuttingSize = Math.ceil(ordQty/(cutQty*eaQty));
						let pressQty = cuttingSize + extraQty;
						
						let R = parseInt(pressQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (pressQty % 500);
						
						return finalPurchaseQty;
					}
					//return addCommas(parseFloat(row['purchaseOrdQty'])) + '+' + addCommas(parseFloat(row['extraQty']));
				}
			},//발주량+여분 */
			{ className : 'text-end align-middle', name: 'printPressQty', // 정매인쇄통수(이론통수)
				//********매우 중요**********
				// 이론통수를 구할때 이론 통수는 절수의 배수로 나와야하기때문에 올림된 이론통수값을 절수로 나눈 나머지로 
				// (절수-나머지) + 이론통수 해줘야 이론통수임
				// ↑↑↑↑↑↑↑↑↑↑ 였는데 2023.01.02에 다시 배수가 아니라 그냥 올림만 하기로함
				// ↑↑↑↑↑↑↑↑↑↑ 였는데 2023.01.10에 다시 이론량*절수의 값으로 하기로함
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분

					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0R0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;

						let R = parseInt(printPressQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (printPressQty % 500);
						
						return finalPurchaseQty;
					}
				}
			},
			{ className : 'text-end align-middle', name: 'printPressAndExtraQty', // 정매인쇄통수 + 여분 + 포장단위여분(여분포함통수)
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					let extraPackQty = row['extraPackQty']; // 포장단위여분
					extraPackQty = isEmptyCheck(extraPackQty) ? 0 : extraPackQty;

					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0R0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						let printPressAndExtraQty = printPressQty + extraQty + (extraPackQty*cutQty);

						let R = parseInt(printPressAndExtraQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (printPressAndExtraQty % 500);
						
						return finalPurchaseQty;
						
					}
				}
			},
			{  data: 'inQty', className : 'text-end align-middle',
				render: function(data, type, row, meta) {
					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(data != null && data != ''){
						return addCommas(parseFloat(data));
					} else {
						return '0';
					}
				}
			},//입고량
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
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#inputMaterialHistTable_wrapper').find('.dataTables_scrollHead').css('height'));
			let	topHeight = parseFloat($('#rightcolT').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(topHeight - theadHeight - 56)+'px');
			
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
				let cell = $('#inputMaterialHistTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inputMaterialHistTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	inputMaterialHistTable.on('column-reorder', function( e, settings, details ) {
		let api = inputMaterialHistTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inputMaterialHistTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	/************************************************************** 모달들 **************************************************************/
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

	//$('#purchaseMatrlModalTable thead tr').clone(true).addClass('filters').appendTo('#purchaseMatrlModalTable thead'); // filter 생성
	let purchaseMatrlModalTable = $('#purchaseMatrlModalTable').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/pm/purchaseOrderAdmLstByWorkOrdPrcss"/>',
			type : 'POST',
			data : {
				workOrdPrcssIdx	: function() { return workOrdPrcssIdx; }
			},
		}, 
        rowId: 'matrlIdx',
		columns : [
			{ data : 'paperType', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//재질
			{ data : 'spQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						let returnR;
						if(parseInt(data) < 0){
							returnR = "-" + parseInt(-1*data/500) + 'R' + parseInt(-1*data%500); 
						} else {
							returnR = parseInt(data/500) + 'R' + parseInt(data%500); 
						}
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+returnR+'</div>';
					} else {
						return '0';
					}
				}
			},//현재고R
			{ className : 'text-end align-middle', // 절수개수
				render : function(data, type, row, meta) {
					return parseInt(row['cutQty']) + "/" + parseInt(row['eaQty']); 
				}
			},
			{ className : 'text-end align-middle', name: 'purchaseQty', // 이론량 R
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분

					
					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						let cuttingSize = Math.ceil(ordQty/(cutQty*eaQty));
						let R = parseInt(cuttingSize / 500); // R로 환산
						let purchaseQty = R + "R" + (cuttingSize % 500);
						
						return purchaseQty;
					}
				}
			},
			{ className : 'text-end align-middle', name: 'finalPurchaseQty', // 발주량R
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분
					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty);
						
						let R = parseInt(pressQty / 500); // R로 환산
						let finalPurchaseQty = R + "R" + (pressQty % 500);
						
						return finalPurchaseQty;
					}
				}
			},
			{ className : 'text-end align-middle', // 정매인쇄통수(이론통수)
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분

					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						
						return addCommas(printPressQty);
					}
				}
			},
			{ className : 'text-end align-middle', // 여분포함통수
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수
					let extraQty = parseInt(row['extraQty']); // 여유분
					let extraPackQty = parseInt(row['extraPackQty']); // 포장단위여분

					if(row['purchaseOrdQty'] == 'notPurchase'){//발주를 하지않은 경우
						return '-';
					} else if(cutQty == 0 || eaQty == 0) {
						return '0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						let printPressAndExtraQty = printPressQty + extraQty + (extraPackQty*cutQty);
						
						return addCommas(printPressAndExtraQty);
					}
				}
			},
			{ data : 'addCutting', className : 'text-end align-middle', name:'addCutting', // 추가재단
				render : function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
			},
		],
		columnDefs : [
			{ "width": "15%", "targets": 0 },
			{ "width": "15%", "targets": 1 },
			{ "width": "20%", "targets": 2 },
			{ "width": "20%", "targets": 3 },
			{ "width": "15%", "targets": 4 },
			{ "width": "15%", "targets": 5 }
			/*{
				targets: '_all',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},*/
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
			
			let htmlHeight = parseFloat($('#workOrderPrcssModalTableHeight').css('height'));
			let theadHeight = parseFloat($('#purchaseMatrlModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight )+'px');
			$('#purchaseMatrlModalTable_wrapper').css('height','100%');
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#'+table_id+' tbody tr td').attr('style',"vertical-align: middle;");
			for(var i=0;i<data.length;i++) {
				let tr = $('#purchaseMatrlModalTable tbody').find('tr').eq(i);
				let colIndex = purchaseMatrlModalTable.column('addCutting:name').index(); 
				$(tr).find('td').eq(colIndex).attr('style','background-color: #ff000078 !important;');
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#purchaseMatrlModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				
				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseMatrlModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	purchaseMatrlModalTable.on('column-reorder', function( e, settings, details ) {
		let api = purchaseMatrlModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseMatrlModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//번들링리스트
	//$('#inputBundleModalTable thead tr').clone(true).addClass('filters').appendTo('#inputBundleModalTable thead'); // filter 생성
	let inputBundleModalTable = $('#inputBundleModalTable').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/workOrdBundleList"/>',
			type : 'POST',
			data : {
				'bizOrdDtlIdx'	: function(){ return bizOrdDtlIdxVal; },
				'workOrdPrcssIdx'	: function(){ return workOrdPrcssIdxVal; },
			},
		}, 
        rowId: 'idx',
		columns : [
			{ data : 'itemNm', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//품명
			{ data : 'stockQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '-';
					}
				}
			},//현재고
			{ data : 'inputQty', className : 'text-end', name:'inputQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<input style="min-width:80px;max-width:80px;" type="text" name="inputQty" class="form-control text-end " value="'+addCommas(parseInt(data))+'" onkeyup="numberFormat(this,\'int\')">';
					} else {
						return '-';
					}
				}
			},// 투입수량
			{ data : 'productionOutWorkQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '-';
					}
				}
			},// 제품출고수량
			{ data : 'productionOutDisQty', className : 'text-end',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
					} else {
						return '-';
					}
				}
			},// 제품폐기수량
			{ data : 'itemVersion', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//버전번호
			{ data : 'bizOrdDtlNo', className : 'text-center',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수주상세번호
			{ data : 'fairQty', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						let fairQty = isEmptyCheck(row['fairQty']) ? 0 : addCommas(parseInt(row['fairQty']));
						let faultyQty = isEmptyCheck(row['faultyQty']) ? 0 : addCommas(parseInt(row['faultyQty']));
						
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+ fairQty +' / ' + faultyQty +'</div>';
					} else {
						return '-';
					}
				}
			},//실적수량
			
		],
		columnDefs : [
			/*{
				targets: '_all',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},*/
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
			
			let htmlHeight = parseFloat($('#workOrderPrcssModalTableHeightBundle').css('height'));
			let theadHeight = parseFloat($('#inputBundleModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 14)+'px');
			$('#inputBundleModalTable_wrapper').css('height','100%');
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#'+table_id+' tbody tr td').attr('style',"vertical-align: middle;");
			for(var i=0;i<data.length;i++) {
				let tr = $('#inputBundleModalTable tbody').find('tr').eq(i);
				let colIndex = inputBundleModalTable.column('addCutting:name').index(); 
				$(tr).find('td').eq(colIndex).attr('style','background-color: #ff000078 !important;');
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#inputBundleModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				
				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inputBundleModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	inputBundleModalTable.on('column-reorder', function( e, settings, details ) {
		let api = inputBundleModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inputBundleModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//분할실적리스트
	//$('#workOrdPrcssResultTable thead tr').clone(true).addClass('filters').appendTo('#workOrdPrcssResultTable thead'); // filter 생성
	let workOrdPrcssResultTable = $('#workOrdPrcssResultTable').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/workOrdResultListByPrcss"/>',
			type : 'POST',
			data : {
				workOrdPrcssIdx	: function() { return workOrdPrcssIdxVal; }
			},
		},  
        rowId: 'idx',
		columns : [
			{ data:'workDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data,'YYYYMMDD').format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data:'regUserNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'fairQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'faultyQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/*{
				targets: '_all',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},*/
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
			
			let htmlHeight = parseFloat($('#workOrdPrcssResultTableHeight').css('height'));
			let theadHeight = parseFloat($('#workOrdPrcssResultTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight )+'px');
			//$('#workOrdPrcssResultTable_wrapper').css('height','100%');
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#'+table_id+' tbody tr td').attr('style',"vertical-align: middle;");
			/*for(var i=0;i<data.length;i++) {
				let tr = $('#workOrdPrcssResultTable tbody').find('tr').eq(i);
				let colIndex = workOrdPrcssResultTable.column('addCutting:name').index(); 
				$(tr).find('td').eq(colIndex).attr('style','background-color: #ff000078 !important;');
			}*/
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#workOrdPrcssResultTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				
				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workOrdPrcssResultTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workOrdPrcssResultTable.on('column-reorder', function( e, settings, details ) {
		let api = workOrdPrcssResultTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workOrdPrcssResultTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//번들링 분할실적리스트
	//$('#workOrdPrcssResultTableBundle thead tr').clone(true).addClass('filters').appendTo('#workOrdPrcssResultTableBundle thead'); // filter 생성
	let workOrdPrcssResultTableBundle = $('#workOrdPrcssResultTableBundle').DataTable({
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
        scrollY: '100vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/workOrdResultListByPrcss"/>',
			type : 'POST',
			data : {
				workOrdPrcssIdx	: function() { return workOrdPrcssIdxVal; }
			},
		},  
        rowId: 'idx',
		columns : [
			{ data:'workDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data,'YYYYMMDD').format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data:'regUserNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'fairQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'faultyQty', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/*{
				targets: '_all',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},*/
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
			
			let htmlHeight = parseFloat($('#workOrdPrcssResultTableHeightBundle').css('height'));
			let theadHeight = parseFloat($('#workOrdPrcssResultTableBundle_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight )+'px');
			//$('#workOrdPrcssResultTableBundle_wrapper').css('height','100%');
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('#'+table_id+' tbody tr td').attr('style',"vertical-align: middle;");
			/*for(var i=0;i<data.length;i++) {
				let tr = $('#workOrdPrcssResultTableBundle tbody').find('tr').eq(i);
				let colIndex = workOrdPrcssResultTableBundle.column('addCutting:name').index(); 
				$(tr).find('td').eq(colIndex).attr('style','background-color: #ff000078 !important;');
			}*/
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#workOrdPrcssResultTableBundle_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();
				
				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workOrdPrcssResultTableBundle_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workOrdPrcssResultTableBundle.on('column-reorder', function( e, settings, details ) {
		let api = workOrdPrcssResultTableBundle;
		api.columns().eq(0).each(function (colIdx) {
			$('#workOrdPrcssResultTableBundle_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	/****************************가상키보드  ****************************/
	let virtualKeyboard_selector_type = '';
	$(document).on('click','.virtualKeyboard2',function() {
		virtualKeyboard_selector = $(this);
		virtualKeyboard_selector_type = $(this).attr('type');
	});

	$(document).on('click','.virtualKeyboard_content2 .virkey',function() {
		$(virtualKeyboard_selector).focus();
		var virkey_input_str = $(virtualKeyboard_selector).val();
		if($(this).attr('id') == 'virkey_0_13' || $(this).attr('id') == 'virkey_0_13Bundle') { // backspace
			$(virtualKeyboard_selector).val(virkey_input_str.substring(0, virkey_input_str.length - 1)).trigger('keyup');
		} else if($(this).attr('id') == 'virkey_1_0' || $(this).attr('id') == 'virkey_1_0Bundle') { // tab
			//$(virtualKeyboard_selector).next().focus();
			//virtualKeyboard_selector = $(virtualKeyboard_selector).next();
		} else if($(this).attr('id') == 'virkey_2_0' || $(this).attr('id') == 'virkey_2_0Bundle') { // Caps Lock
			capsLockKey();
		} else if($(this).attr('id') == 'virkey_2_12' || $(this).attr('id') == 'virkey_2_12Bundle') { // Enter
			$(virtualKeyboard_selector).val(virkey_input_str + '\n');
		} else if($(this).attr('id') == 'virkey_3_0' || $(this).attr('id') == 'virkey_3_11' || $(this).attr('id') == 'virkey_3_0Bundle' || $(this).attr('id') == 'virkey_3_11Bundle') { // Shift
			shiftKey();
		} else if($(this).attr('id') == 'virkey_4_0' || $(this).attr('id') == 'virkey_4_5' || $(this).attr('id') == 'virkey_4_0Bundle' || $(this).attr('id') == 'virkey_4_5Bundle') { // Ctrl
			
		} else if($(this).attr('id') == 'virkey_4_1' || $(this).attr('id') == 'virkey_4_1Bundle') { // Win
			
		} else if($(this).attr('id') == 'virkey_4_2' || $(this).attr('id') == 'virkey_4_2Bundle') { // Alt
			
		} else if($(this).attr('id') == 'virkey_4_3' || $(this).attr('id') == 'virkey_4_3Bundle') { // SpaceBar
			$(virtualKeyboard_selector).val(virkey_input_str+' ').trigger('keyup');
		} else if($(this).attr('id') == 'virkey_4_4' || $(this).attr('id') == 'virkey_4_4Bundle') { // 한영 전환
			if(virtualKeyboard_language == 'ko') {
				languageChange('en');
				virtualKeyboard_language = 'en';
			} else if(virtualKeyboard_language == 'en'){
				languageChange('ko');
				virtualKeyboard_language = 'ko';
			}
		} else if($(this).attr('id') == 'virkeypad_0_0' || $(this).attr('id') == 'backspace' || $(this).attr('id') == 'virkeypad_0_0Bundle') { // backspace
			$(virtualKeyboard_selector).val(virkey_input_str.substring(0, virkey_input_str.length - 1)).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_2_3' || $(this).attr('id') == 'upCount' || $(this).attr('id') == 'virkeypad_2_3Bundle') { // +1
			$(virtualKeyboard_selector).val(virkey_input_str==''?0:addCommas(parseFloat(removeCommas(virkey_input_str))+1)).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_3_3' || $(this).attr('id') == 'downCount' || $(this).attr('id') == 'virkeypad_3_3Bundle') { // -1
			$(virtualKeyboard_selector).val(virkey_input_str==''?0:virkey_input_str>0?addCommas(parseFloat(removeCommas(virkey_input_str))-1):0).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_4_2' || $(this).attr('id') == 'virkeypad_4_2Bundle') { // Enter
			
		} else {
			if(virtualKeyboard_selector_type != 'date' && virtualKeyboard_selector_type != 'datetime-local'){
				$(virtualKeyboard_selector).val(Hangul.assemble(Hangul.disassemble(virkey_input_str+$(this).text()))).trigger('keyup');
			} else {
				//date
				if(virtualKeyboard_selector_type == 'date'){
					//음
				} else if(virtualKeyboard_selector_type == 'datetime-local'){
				
				}
			}
		}
	});
	
	/* 공통 함수 */
	function workInputDisabled(disabled){
		$('#workDate').attr('disabled',disabled);
		$('#workStartTime').attr('disabled',disabled);
		$('#workEndTime').attr('disabled',disabled);
		$('#workQty').attr('disabled',disabled);
		$('#workFaultyQty').attr('disabled',disabled);
		$('#faultyReason').attr('disabled',disabled);
		$('#fieldDesc').attr('disabled',disabled);

		$('#workDateBundle').attr('disabled',disabled);
		$('#workStartTimeBundle').attr('disabled',disabled);
		$('#workEndTimeBundle').attr('disabled',disabled);
		$('#workQtyBundle').attr('disabled',disabled);
		$('#workFaultyQtyBundle').attr('disabled',disabled);
		$('#faultyReasonBundle').attr('disabled',disabled);
		$('#fieldDescBundle').attr('disabled',disabled);
	}

	/* R변환 연산  */
	$('#workQty').on('keyup',function(){
		if(prcssQtyUnit){
			let rVal = (parseInt($('#workQty').val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workQty').val().replaceAll(',','') % 500));
			$('#workQtyRChange').val(rVal);
		}

		//불량수량자동계산
		let value;
		let addCuttingVal = isEmptyCheck(workOrderPrcssTable.row('.selected').data().addCutting) ? 0 : workOrderPrcssTable.row('.selected').data().addCutting;
		let addCutting = parseInt(addCuttingVal);
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적으로 수량계산 / 다르다면 지시수량으로 계산
		if( $('#workPrcssQtyUnit').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			value = parseFloat(removeCommas($('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[^0-9]/gi,''))) - parseFloat(removeCommas($('#workQty').val().replaceAll(',','')));
			value += addCutting;
		} else {
			value = parseFloat(removeCommas($('#workOrdQty').text().replaceAll(',',''))) - parseFloat(removeCommas($('#workQty').val().replaceAll(',','')));
		}
		$('#workFaultyQty').val( value < 0 ? 0 : addCommas(value));
	});
	$('#workFaultyQty').on('keyup',function(){
		if(prcssQtyUnit){
			let rVal = (parseInt($('#workFaultyQty').val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workFaultyQty').val().replaceAll(',','') % 500));
			$('#workFaultyQtyRChange').val(rVal);
		}
		/*
		//작업량자동계산
		let value;
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적으로 수량계산 / 다르다면 지시수량으로 계산
		if( $('#workPrcssQtyUnit').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			value = parseFloat(removeCommas($('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[^0-9]/gi,''))) - parseFloat(removeCommas($('#workFaultyQty').val().replaceAll(',','')));
		} else {
			value = parseFloat(removeCommas($('#workOrdQty').text().replaceAll(',',''))) - parseFloat(removeCommas($('#workFaultyQty').val().replaceAll(',','')));
		}
		$('#workQty').val( value < 0 ? 0 : addCommas(value));
		*/
	});


	/* R변환 연산  */
	$('#workQtyBundle').on('keyup',function(){
		if(prcssQtyUnit){
			let rVal = (parseInt($('#workQtyBundle').val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workQtyBundle').val().replaceAll(',','') % 500));
			$('#workQtyRChange').val(rVal);
		}

		//불량수량자동계산
		let value;
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적으로 수량계산 / 다르다면 지시수량으로 계산
		if( $('#workPrcssQtyUnitBundle').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQtyBundle').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			value = parseFloat(removeCommas($('#workOrdBeforePrcssQtyBundle').text().replaceAll(',','').replaceAll(/[^0-9]/gi,''))) - parseFloat(removeCommas($('#workQtyBundle').val().replaceAll(',','')));
		} else {
			value = parseFloat(removeCommas($('#workOrdQtyBundle').text().replaceAll(',',''))) - parseFloat(removeCommas($('#workQtyBundle').val().replaceAll(',','')));
		}
		$('#workFaultyQtyBundle').val( value < 0 ? 0 : addCommas(value));
	});
	$('#workFaultyQtyBundle').on('keyup',function(){
		if(prcssQtyUnit){
			let rVal = (parseInt($('#workFaultyQtyBundle').val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workFaultyQtyBundle').val().replaceAll(',','') % 500));
			$('#workFaultyQtyRChangeBundle').val(rVal);
		}
		/*
		//작업량자동계산
		let value;
		//작업공정의 단위와 전공정실적단위가 같다면 전공정실적으로 수량계산 / 다르다면 지시수량으로 계산
		if( $('#workPrcssQtyUnit').val().replaceAll(/[0-9]/gi,'') == $('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[0-9]/gi,'') ){
			value = parseFloat(removeCommas($('#workOrdBeforePrcssQty').text().replaceAll(',','').replaceAll(/[^0-9]/gi,''))) - parseFloat(removeCommas($('#workFaultyQty').val().replaceAll(',','')));
		} else {
			value = parseFloat(removeCommas($('#workOrdQty').text().replaceAll(',',''))) - parseFloat(removeCommas($('#workFaultyQty').val().replaceAll(',','')));
		}
		$('#workQty').val( value < 0 ? 0 : addCommas(value));
		*/
	});
	
	//***************************실적삭제***********************
	$('#btnWorkDel, #btnWorkDelBundle').on('click',function(){
		let delGubun = $(this).attr('id');
		_promise_().then(()=>{
			$('#my-spinner').show();
		}).then(()=>{
			setTimeout(function(){
				let nextPrcss;
				$.ajax({
					url: '<c:url value="/wm/workOrdNextPrcssSel"/>',
		            type: 'POST',
		            async: false,
		            data: {
		            	'workOrdIdx'		:	function(){ return workOrdIdx; },
		            	'workOrdPrcssIdx'	:	function(){ return workOrdPrcssIdx; },
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							nextPrcss = res.data;

						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
				if(nextPrcss != null && nextPrcss != ''){
					if(nextPrcss.progressStatus == 'PI'){
						if(delGubun == 'btnWorkDelBundle'){
							if(!$('#workOrdPrcssResultTableBundle tbody tr').hasClass('selected')){
								toastr.warning('삭제할 실적을 선택해주세요.');
								return false;
							}
						} else{
							if(!$('#workOrdPrcssResultTable tbody tr').hasClass('selected')){
								toastr.warning('삭제할 실적을 선택해주세요.');
								return false;
							}
						} 
						$('#deleteModal').modal('show');
						$('#deleteModal').data('deleteType','workOrdPrcssResult');
						$('#deleteModal').data('deleteGubun',delGubun);
					} else {
						toastr.warning('실적 삭제가 불가능합니다.');
					}
				} else {
					if(delGubun == 'btnWorkDelBundle'){
						if(!$('#workOrdPrcssResultTableBundle tbody tr').hasClass('selected')){
							toastr.warning('삭제할 실적을 선택해주세요.');
							return false;
						}
					} else{
						if(!$('#workOrdPrcssResultTable tbody tr').hasClass('selected')){
							toastr.warning('삭제할 실적을 선택해주세요.');
							return false;
						}
					} 
					$('#deleteModal').modal('show');
					$('#deleteModal').data('deleteType','workOrdPrcssResult');
					$('#deleteModal').data('deleteGubun',delGubun);
					//toastr.warning('마지막 공정 실적 삭제가 불가능합니다.');
				}
			},10);	
		});
	});

	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		let deleteGubun = $('#deleteModal').data('deleteGubun');
		if(deleteType == 'workOrdPrcssResult'){
			if(deleteGubun == 'btnWorkDelBundle'){
				let idx = workOrdPrcssResultTableBundle.row('.selected').data().idx;
				$.ajax({
					url: '<c:url value="/wm/workOrdPrcssResultDelBundle"/>',
		            type: 'POST',
		            data: {
			            'idx'				:	function(){ return idx; },
		            	'workOrdIdx'		:	function(){ return workOrdIdx; },
		            	'workOrdPrcssIdx'	:	function(){ return workOrdPrcssIdx; },
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');
							workOrdPrcssResultTableBundle.rows('.selected').deselect();
							workOrdPrcssResultTableBundle.ajax.reload();
							workOrderPrcssTable.ajax.reload(function(){
								setTimeout(function() {
			            			workOrderPrcssTable.row('#'+workOrdPrcssIdx).select();
									$(workOrderPrcssTable.row('#'+workOrdPrcssIdx).node()).trigger('click'); // 선택처리
									let data = workOrderPrcssTable.row('.selected').data();

									inputBundleModalTable.ajax.reload(function(){
										if(data.progressStatus == 'PI'){
											workInputDisabled(true);
											$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',true);
										} else if(data.progressStatus == 'WI'){
											workInputDisabled(false);
											$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',false);
										} else if(data.progressStatus == 'WC'){
											workInputDisabled(true);
											$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',true);
										}
											
										$('#inputBundleModalTable tbody tr').find('td').find('input[name=inputQty]').val(removeCommas($('#workOrdQtyBundle').text()));
										});
									
								}, 100)
							});
							//workPrcssCheckAndReload();
							
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			} else{
				let idx = workOrdPrcssResultTable.row('.selected').data().idx;
				$.ajax({
					url: '<c:url value="/wm/workOrdPrcssResultDel"/>',
		            type: 'POST',
		            data: {
			            'idx'				:	function(){ return idx; },
		            	'workOrdIdx'		:	function(){ return workOrdIdx; },
		            	'workOrdPrcssIdx'	:	function(){ return workOrdPrcssIdx; },
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');
							workOrdPrcssResultTable.rows('.selected').deselect();
							workOrdPrcssResultTable.ajax.reload();
							workOrderPrcssTable.ajax.reload(function(){
								setTimeout(function() {
			            			workOrderPrcssTable.row('#'+workOrdPrcssIdx).select();
									$(workOrderPrcssTable.row('#'+workOrdPrcssIdx).node()).trigger('click'); // 선택처리
									let data = workOrderPrcssTable.row('.selected').data();
									if(data.progressStatus == 'PI'){
										workInputDisabled(true);
									} else if(data.progressStatus == 'WI'){
										workInputDisabled(false);
									} else if(data.progressStatus == 'WC'){
										workInputDisabled(true);
									}
								}, 100)
							});
							//workPrcssCheckAndReload();
							purchaseMatrlModalTable.ajax.reload();
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

	function workOrdPrcssResultModal(data,name,gubun){
		workMethodJson = data.workMethodJson;
		workMethod = data.workMethod;
		
		if(data.descCheckYn == 'Y'){
			$('#workOrdBeforePrcssDescCheck'+name).prop('checked',true);
			$('#workOrdBeforePrcssDescCheck'+name).attr('disabled',true);
		} else {
			$('#workOrdBeforePrcssDescCheck'+name).prop('checked',false);
			$('#workOrdBeforePrcssDescCheck'+name).attr('disabled',false);
		}

		if(gubun == 'open'){
			$('#etc7'+name).text(data.etc7);
			$('#etc8'+name).text(data.etc8);
			$('#etc9'+name).text(data.etc9);
			$('#inspectMethodNm'+name).text(data.inspectMethodNm);
			$('#relayNotice'+name).text(data.relayNotice);
			$('#specialNotice'+name).text(data.specialNotice);
			$('#packMethodNm'+name).text(data.packMethodNm);
			$('#packUnit'+name).text(data.packUnit);
			$('#bundleUnit'+name).text(data.bundleUnit);
			$('#bundleMethodNm'+name).text(data.bundleMethodNm);
			$('#pressMethod'+name).text(data.pressMethod);
			$('#moldingMethod'+name).text(data.moldingMethod);
			$('#moldingContents'+name).text(data.moldingContents);
			$('#etc6'+name).text(data.etc6);
			$('#etc3'+name).text(data.etc3);
			$('#etc4'+name).text(data.etc4);
			$('#etc5'+name).text(data.etc5);
			$('#etc2Cd'+name).text(data.etc2Cd);
			$('#holeWoodenCd'+name).text(data.holeWoodenCd);
			$('#coatingMethod'+name).text(data.coatingMethod);
			$('#allWorkOrdQty'+name).text(addCommas(parseFloat(data.allWorkOrdQty != null && data.allWorkOrdQty != '' ? data.allWorkOrdQty : 0 )));
			$('#modalBizOrdDtlNo'+name).text(data.bizOrdDtlNo);
			$('#modalPrcssNm'+name).text(data.prcssNm);
			$('#itemNm'+name).text(data.itemNm);
			$('#itemColor'+name).text(data.itemColor);
			$('#customerItemCd'+name).text(data.customerItemCd);
			$('#itemVersion'+name).text(data.itemVersion);
			$('#itemFrequency'+name).text(data.frequency);
			$('#workMethodMultiSelect'+name).text(data.workMethod);
			if(data.ext != null && data.ext != '' && data.uuid != null && data.uuid != ''){
				$('#itemVersionLink'+name).attr('href','/serverFile/'+data.uuid+'.'+data.ext);
				let fileObject = new Object();
				fileObject.uuid = data.uuid;
				fileObject.ext = data.ext;
				//let blob = getFileBlob(fileObject);
				//$('#imgView').attr('style','');
				//$('#viewer').attr('src','data:image/jpeg;base64,'+blob);
				
			} else {
				$('#itemVersionLink'+name).removeAttr('href');
				//$('#imgView').attr('style','');
				//$('#viewer').attr('src','data:image/jpeg;base64,');
			}
		}
		$('#knifeTipSize'+name).text(data.knifeTipSize);
		$('#woodenCareCd'+name).text(data.woodenWdCd);		
		$('#resinBoard'+name).text(data.resinBoardWdCd);
		$('#itemSize'+name).text(data.itemSize);
		$('#bizOrdIssue'+name).text(data.bizOrdIssue);
		$('#workOrdDesc'+name).text(data.workOrdDesc);	
		$('#bizOrdNote'+name).text(data.bizOrdNote);
		let workOrdQtyVal = data.workOrdQty != null && data.workOrdQty != '' ? data.workOrdQty : 0; 
		let addCuttingVal = data.addCutting != null && data.addCutting != '' ? data.addCutting : 0; 
		$('#workOrdQty'+name).text(addCommas(parseFloat(workOrdQtyVal) + parseFloat(addCuttingVal)));
		let bizOrdQty = isEmptyCheck(data.bizOrdQty) ? 0 : data.bizOrdQty; 
		$('#bizOrdQty'+name).text(addCommas(parseFloat(bizOrdQty)));
		
		let beforePrcssDesc = data.beforePrcssDesc != null && data.beforePrcssDesc != '' ? data.beforePrcssDesc : '';
		$('#workOrdBeforePrcssDesc'+name).val(beforePrcssDesc.replaceAll('\\n','\n'));
		
		$('#workOrderPrcss'+name+'Modal').modal('show');
		
		if(data.workDate != null && data.workDate != ''){
			$('#workDate'+name).val(moment(data.workDate,'YYYYMMDD').format('YYYY-MM-DD'));
			$('#workStartTime'+name).val(moment(data.workStartTime,'YYYYMMDD HHmm').format('YYYY-MM-DD HH:mm'));
			$('#workEndTime'+name).val(moment(data.workEndTime,'YYYYMMDD HHmm').format('YYYY-MM-DD HH:mm'));	
		} else {
			$('#workDate'+name).val(moment().format('YYYY-MM-DD'));
			$('#workStartTime'+name).val(moment().format('YYYY-MM-DD HH:mm'));
			$('#workEndTime'+name).val(moment().format('YYYY-MM-DD HH:mm'));	
		} 
		if(data.fairQty != null && data.fairQty != ''){
			$('#workQty'+name).val(addCommas(parseFloat(data.fairQty)));
		} else {
			$('#workQty'+name).val('0');
		}
		if(data.faultyQty != null && data.faultyQty != ''){
			$('#workFaultyQty'+name).val(addCommas(parseFloat(data.faultyQty)));
		} else {
			$('#workFaultyQty'+name).val('0');
		}
		$('#faultyReason'+name).val(data.faultyReason);
		$('#fieldDesc'+name).val(data.prcssDesc != null && data.prcssDesc != '' ? data.prcssDesc : '');
		//반환값이0-> R문자가 있는경우, 없을 경우 -> -1
		let qtyUnitNm = data.qtyUnitNm != null && data.qtyUnitNm != '' ? data.qtyUnitNm : '';
		if(qtyUnitNm.indexOf('R') == -1){
			prcssQtyUnit = false;
			$('#workQtyRChange'+name).val('');
			$('#workFaultyQtyRChange'+name).val('');
		} else {
			prcssQtyUnit = true;
			let rVal = (parseInt($('#workQty'+name).val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workQty'+name).val().replaceAll(',','') % 500));
			$('#workQtyRChange').val(rVal);
			let rFaultyVal = (parseInt($('#workFaultyQty'+name).val().replaceAll(',','') / 500)) + 'R' +(parseInt($('#workFaultyQty'+name).val().replaceAll(',','') % 500));
			$('#workFaultyQtyRChange'+name).val(rFaultyVal);
		}
		$('#workPrcssQtyUnit'+name).val(data.qtyUnitNm);
		$('#workPrcssFaultyQtyUnit'+name).val(data.qtyUnitNm);
		if(name=='Bundle'){
			inputBundleModalTable.rows('.selected').deselect();
			
			inputBundleModalTable.ajax.reload(function() {
				setTimeout(function(){
					//전공정실적
					let unitNm = data.beforeQtyUnitNm != null && data.beforeQtyUnitNm != '' ? data.beforeQtyUnitNm : ''; 
		
					if(data.qtyUnitNm == '매' && unitNm == '통'){
						if(data.beforeFairQty != null && data.beforeFairQty !=''){
							//$('#workOrdBeforePrcssQtyHidden'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
							//$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty) * parseFloat(purchaseMatrlModalTable.row(0).data().eaQty)) + data.qtyUnitNm);
						} else {
							$('#workOrdBeforePrcssQtyHidden'+name).text('0'+unitNm);
							$('#workOrdBeforePrcssQty'+name).text('0' + data.qtyUnitNm);
						}
					} else {
						if(data.beforeFairQty != null && data.beforeFairQty !=''){
							$('#workOrdBeforePrcssQtyHidden'+name).text('');
							$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
						} else {
							$('#workOrdBeforePrcssQtyHidden'+name).text('');
							$('#workOrdBeforePrcssQty'+name).text('0'+unitNm);
						}
					}
					if(data.progressStatus == 'PI'){
						$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',true);
					} else if(data.progressStatus == 'WI'){
						$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',false);
					} else if(data.progressStatus == 'WC'){
						$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').attr('disabled',true);
					}
					$(inputBundleModalTable.nodes()).find('td').find('input[name=inputQty]').val(addCommas(parseFloat(removeCommas($('#workOrdQtyBundle').text()))));
					
					},200);
			});
			
			
			workOrdPrcssResultTableBundle.rows('.selected').deselect();
			workOrdPrcssResultTableBundle.ajax.reload(function(){
				if( $('#workOrdPrcssResultTableBundle tbody tr').length - $('#workOrdPrcssResultTableBundle tbody tr').find('.dataTables_empty').length > 0 ){
					workOrdPrcssResultTableBundle.row(0).select();
				}
				workOrdPrcssResultTableBundle.draw(false).columns.adjust();
			});
		} else {
			purchaseMatrlModalTable.ajax.reload(function() {
				setTimeout(function(){
					//전공정실적
					let unitNm = data.beforeQtyUnitNm != null && data.beforeQtyUnitNm != '' ? data.beforeQtyUnitNm : ''; 
		
					if(data.qtyUnitNm == '매' && unitNm == '통'){
						if(data.beforeFairQty != null && data.beforeFairQty !=''){
							$('#workOrdBeforePrcssQtyHidden'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
							$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty) * parseFloat(purchaseMatrlModalTable.row(0).data().eaQty)) + data.qtyUnitNm);
						} else {
							$('#workOrdBeforePrcssQtyHidden'+name).text('0'+unitNm);
							$('#workOrdBeforePrcssQty'+name).text('0' + data.qtyUnitNm);
						}
					} else {
						if(data.beforeFairQty != null && data.beforeFairQty !=''){
							$('#workOrdBeforePrcssQtyHidden'+name).text('');
							$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
						} else {
							$('#workOrdBeforePrcssQtyHidden'+name).text('');
							$('#workOrdBeforePrcssQty'+name).text('0'+unitNm);
						}
					}
				},200);
			});
			
			purchaseMatrlModalTable.rows('.selected').deselect();
			workOrdPrcssResultTable.rows('.selected').deselect();
			workOrdPrcssResultTable.ajax.reload(function(){
				if( $('#workOrdPrcssResultTable tbody tr').length - $('#workOrdPrcssResultTable tbody tr').find('.dataTables_empty').length > 0 ){
					workOrdPrcssResultTable.row(0).select();
				}
				workOrdPrcssResultTable.draw(false).columns.adjust();;
			});
		}
	}

	function workOrderModalDisabled(data,name, bool){
		if(data.descCheckYn == 'Y'){
			$('#workOrdBeforePrcssDescCheck'+name).prop('checked',true);
			$('#workOrdBeforePrcssDescCheck'+name).attr('disabled',true);
		} else {
			$('#workOrdBeforePrcssDescCheck'+name).prop('checked',false);
			$('#workOrdBeforePrcssDescCheck'+name).attr('disabled',false);
		}
		
		$('#workDate'+name).attr('disabled',bool);
		$('#workStartTime'+name).attr('disabled',bool);
		$('#workEndTime'+name).attr('disabled',bool);
		$('#workQty'+name).attr('disabled',bool);
		$('#workFaultyQty'+name).attr('disabled',bool);
		$('#faultyReason'+name).attr('disabled',bool);
		$('#fieldDesc'+name).attr('disabled',bool);
    	workOrderPrcssTable.ajax.reload(function(){
    		setTimeout(function() {
    			workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).select();
				$(workOrderPrcssTable.row('#'+data.workOrdPrcssIdx).node()).trigger('click'); // 선택처리
			}, 100)
    	});
		//workOrdPrcssStatusTable.ajax.reload();
		//workPrcssDtlTable.ajax.reload();
    	//전공정실적
		/* if(data.beforeFairQty != null && data.beforeFairQty !=''){
			$('#workOrdBeforePrcssQty').text(addCommas(parseFloat(data.beforeFairQty)));
		} else {
			$('#workOrdBeforePrcssQty').text('0');
		} */
		let beforePrcssDesc = data.beforePrcssDesc != null && data.beforePrcssDesc != '' ? data.beforePrcssDesc : '';
		$('#workOrdBeforePrcssDesc'+name).val(beforePrcssDesc.replaceAll('\\n','\n'));
		
    	if(data.workDate != null && data.workDate != ''){
			$('#workDate'+name).val(moment(data.workDate,'YYYYMMDD').format('YYYY-MM-DD'));
			$('#workStartTime'+name).val(moment(data.workStartTime,'YYYYMMDD HHmm').format('YYYY-MM-DD HH:mm'));
			$('#workEndTime'+name).val(moment(data.workEndTime,'YYYYMMDD HHmm').format('YYYY-MM-DD HH:mm'));	
		} else {
			$('#workDate'+name).val(moment().format('YYYY-MM-DD'));
			$('#workStartTime'+name).val(moment().format('YYYY-MM-DD HH:mm'));
			$('#workEndTime'+name).val(moment().format('YYYY-MM-DD HH:mm'));	
		} 
		if(data.fairQty != null && data.fairQty != ''){
			$('#workQty'+name).val(addCommas(parseFloat(data.fairQty)));
		} else {
			$('#workQty'+name).val('0');
		}
		if(data.faultyQty != null && data.faultyQty != ''){
			$('#workFaultyQty'+name).val(addCommas(parseFloat(data.faultyQty)));
		} else {
			$('#workFaultyQty'+name).val('0');
		}$('#faultyReason'+name).val(data.faultyReason);
		$('#fieldDesc'+name).val(data.prcssDesc);

		if(name == 'Bundle'){
			inputBundleModalTable.ajax.reload(function() {
				//전공정실적
				let unitNm = data.beforeQtyUnitNm != null && data.beforeQtyUnitNm != '' ? data.beforeQtyUnitNm : ''; 

				if(data.qtyUnitNm == '매' && unitNm == '통'){
					if(data.beforeFairQty != null && data.beforeFairQty !=''){
						$('#workOrdBeforePrcssQtyHidden'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
						$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty) * parseFloat(purchaseMatrlModalTable.row(0).data().eaQty)) + data.qtyUnitNm);
					} else {
						$('#workOrdBeforePrcssQtyHidden'+name).text('0'+unitNm);
						$('#workOrdBeforePrcssQty'+name).text('0' + data.qtyUnitNm);
					}
				} else {
					if(data.beforeFairQty != null && data.beforeFairQty !=''){
						$('#workOrdBeforePrcssQtyHidden'+name).text('');
						$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
					} else {
						$('#workOrdBeforePrcssQtyHidden'+name).text('');
						$('#workOrdBeforePrcssQty'+name).text('0'+unitNm);
					}
				}
				$('#inputBundleModalTable tbody tr').find('td').find('input[name=inputQty]').val(removeCommas($('#workOrdQtyBundle').text()));
				$('#inputBundleModalTable tbody tr').find('td').find('input[name=inputQty]').attr('disabled',bool);
			});
			workOrdPrcssResultTableBundle.ajax.reload(function(){
				workOrdPrcssResultTableBundle.draw(false);
			});
		} else {
			purchaseMatrlModalTable.ajax.reload(function() {
				//전공정실적
				let unitNm = data.beforeQtyUnitNm != null && data.beforeQtyUnitNm != '' ? data.beforeQtyUnitNm : ''; 

				if(data.qtyUnitNm == '매' && unitNm == '통'){
					if(data.beforeFairQty != null && data.beforeFairQty !=''){
						$('#workOrdBeforePrcssQtyHidden'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
						$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty) * parseFloat(purchaseMatrlModalTable.row(0).data().eaQty)) + data.qtyUnitNm);
					} else {
						$('#workOrdBeforePrcssQtyHidden'+name).text('0'+unitNm);
						$('#workOrdBeforePrcssQty'+name).text('0' + data.qtyUnitNm);
					}
				} else {
					if(data.beforeFairQty != null && data.beforeFairQty !=''){
						$('#workOrdBeforePrcssQtyHidden'+name).text('');
						$('#workOrdBeforePrcssQty'+name).text(addCommas(parseFloat(data.beforeFairQty)) + unitNm);
					} else {
						$('#workOrdBeforePrcssQtyHidden'+name).text('');
						$('#workOrdBeforePrcssQty'+name).text('0'+unitNm);
					}
				}
			});
			workOrdPrcssResultTable.ajax.reload(function(){
				workOrdPrcssResultTable.draw(false);
			});
		
		}
	}

	$('#workOrdBeforePrcssDescCheck, #workOrdBeforePrcssDescCheckBundle').on('change',function(){
		let checkYn = $(this).prop('checked') ? 'Y' : 'N';
		let id = $(this).attr('id');

		if(id == 'workOrdBeforePrcssDescCheck'){
			if( $('#workOrdBeforePrcssDesc').val() == '' ) {
				toastr.warning('확인할 공정 내용이 없습니다.');
				$(this).prop('checked',false);
				return false;
			}
		} else if(id == 'workOrdBeforePrcssDescCheckBundle'){
			if( $('#workOrdBeforePrcssDescBundle').val() == '' ) {
				toastr.warning('확인할 공정 내용이 없습니다.');
				$(this).prop('checked',false);
				return false;
			}
		}
		
		$.ajax({
			url: '<c:url value="/wm/workOrdPrcssUpd"/>',
		        type: 'POST',
		        data: {
		            'idx' : 	workOrderPrcssTable.row('.selected').data().workOrdPrcssIdx,
		            'descCheckYn'	: function(){ return checkYn; },
		        },
		        beforeSend: function() {
		        	$('#my-spinner').show();
		        },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					if(checkYn == 'Y'){
						toastr.success('전공정 특이사항 확인되었습니다.');
						$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
					} else {
						toastr.success('전공정 특이사항 확인 취소되었습니다.');
						$('#workOrdBeforePrcssDescCheck').attr('disabled',false);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',false);
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

	//번들링 수량 자동으로 똑같게 해주는기능
	$(document).on('keyup','input[name=inputQty]',function(){
		$('input[name=inputQty]').val($(this).val());
	});

	function workPrcssCheckAndReload(){
		//전 공정들이 다 작업되었는지 체크
		$.ajax({
			url: '<c:url value="/wm/checkWorkOrdPrcssFinish"/>',
            type: 'POST',
            data: {
                'workOrdIdx'	  :	function(){ return workOrdIdx; },
				'workOrdPrcssIdx' : function(){ return workOrdPrcssIdxVal; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == 'ok'){
					let data = res.data;		

					if(data.beforePrcssDesc != '' && data.beforePrcssDesc != null && data.descCheckYn != 'Y'){
						//toastr.warning('전공정 특이사항을 읽은 후<br>작업해주세요.');
					} 
					if(data.resultPageNm == 'workOrderPrcssBundleModal'){
						workOrdPrcssResultModal(data,'Bundle','reload');
					} else {
						workOrdPrcssResultModal(data,'','reload');
					}
					
					//공정이 대기,완료인경우 -> 버튼 비활성화 , 공정이 진행중인 경우 -> 버튼 활성화
					//대기
					if(data.progressStatus == 'PI'){
						workInputDisabled(true);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',false);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',false);
					} else if(data.progressStatus == 'WI'){//진행
						workInputDisabled(false);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
					} else if(data.progressStatus == 'WC'){//완료
						workInputDisabled(true);
						$('#workOrdBeforePrcssDescCheck').attr('disabled',true);
						$('#workOrdBeforePrcssDescCheckBundle').attr('disabled',true);
					}
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
					workOrderPrcssTable.ajax.reload(function(){},false);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	}

	//진행취소
	$('#btnWorkCancelBundle, #btnWorkCancel').on('click',function(){
		let data = workOrderPrcssTable.row('.selected').data();
		//현 공정의 상태값 체크
		$.ajax({
			url: '<c:url value="/wm/workOrdSelWithPrcss"/>',
            type: 'POST',
            data: {
            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if(res.result == 'ok'){
					let data = res.data;
					//현공정이 대기인경우 -> 작업시작, 공정이 진행,완료중인 경우 -> 이미 진행중 toastr
					if(data.progressStatus == 'WI'){//진행
						//공정 상태 업데이트
						$.ajax({
							url: '<c:url value="/wm/workOrdPrcssWait"/>',
				            type: 'POST',
				            data: {
				            	'workOrdIdx'	  :	function(){ return data.workOrdIdx; },
				 				'workOrdPrcssIdx' : function(){ return data.workOrdPrcssIdx; },
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
				            success : function(res) {
				            	if(res.result == 'ok'){
				            		let data = res.data;
									checkVo = data;
									toastr.success('공정 진행 취소 되었습니다.');
									$('#workOrderPrcssModal').modal('hide');
									$('#workOrderPrcssBundleModal').modal('hide');
									workOrderPrcssTable.ajax.reload(function(){
 										let reloadEndData = workOrderPrcssTable.data().toArray();
										//해당 checkVo의 idx가 현재 리로드된 테이블에 데이터가 없을 경우
										if(!reloadEndData.map(v=>v.workOrdPrcssIdx).includes(checkVo.workOrdPrcssIdx)){
											workOrderPrcssTable.row('.selected').deselect();
											//workOrdPrcssStatusTable.clear().draw();
											workPrcssDtlTable.clear().draw();
											inputMaterialHistTable.clear().draw();
										} else {
											//있을경우
											setTimeout(function() {
						            			workOrderPrcssTable.row('#'+checkVo.workOrdPrcssIdx).select();
												$(workOrderPrcssTable.row('#'+checkVo.workOrdPrcssIdx).node()).trigger('click'); // 선택처리
											}, 100)
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
					} else if(data.progressStatus == 'WC'){//완료
						toastr.warning('이미 작업완료된 공정입니다.');
					} else if(data.progressStatus == 'PI'){
						toastr.warning('대기 중인 공정입니다.');
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

	$('#btnCompulsionEnd, #btnCompulsionEndBundle').on('click',function(){
		$('#compulsionEndModal').modal('show');
	});

	$('#btnCompulsionEndY').on('click',function(){
		$.ajax({
			url: '<c:url value="/wm/workOrdForcedPrcssEnd"/>',
            type: 'POST',
            data: {
                'workOrdIdx'	:	function(){ return workOrderPrcssTable.row('.selected').data().workOrdIdx; },
                'bizOrdDtlIdx'	:	function(){ return workOrderPrcssTable.row('.selected').data().bizOrdDtlIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('강제 완료 되었습니다.');
					$('#workOrderPrcssModal').modal('hide');
					$('#workOrderPrcssBundleModal').modal('hide');
					trId = workOrderPrcssTable.row('.selected').data().workOrdPrcssIdx;
					workOrderPrcssTable.ajax.reload(function(){
						let reloadEndData = workOrderPrcssTable.data().toArray();
						//해당 checkVo의 idx가 현재 리로드된 테이블에 데이터가 없을 경우
						if(!reloadEndData.map(v=>v.workOrdPrcssIdx).includes(trId)){
							workOrderPrcssTable.row('.selected').deselect();
							//workOrdPrcssStatusTable.clear().draw();
							workPrcssDtlTable.clear().draw();
							inputMaterialHistTable.clear().draw();
						} else {
							//있을경우
							setTimeout(function() {
		            			workOrderPrcssTable.row('#'+trId).select();
								$(workOrderPrcssTable.row('#'+trId).node()).trigger('click'); // 선택처리
							}, 100)
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
	});
	
</script>
</body>
</html>