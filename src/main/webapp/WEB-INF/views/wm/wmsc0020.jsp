<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">지시일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">공정</label>
					<select class="form-select h-100 me-3 w-auto" id="searchPrcssCd" style="width: 220px;"></select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label>
					<select class="form-select w-auto h-100 me-3" id="searchTarget" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="02" selected>수주진행</option>
						<option value="04">수주완료</option>
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">공정그룹</label>
					<select class="form-select h-100 me-3 w-auto" id="prcssGroupCd">
					</select>
					<div id="prcssGroupBtnDiv" class="btn-group me-3" role="group" aria-label="Small button group">
					</div>
		
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<!-- <select class="form-select h-100 me-1 w-auto" id="prcssGroupCd">
					</select>
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnPrcssGroupApply">적용</button>
					</div> -->
				
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrint"><i class="fa-solid fa-print"></i></button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="workOrderPrcssTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">수주상태</th>
							<th class="text-center align-middle">수주번호</th>
							<th class="text-center align-middle">작업지시번호</th>
							<th class="text-center align-middle">출력여부</th>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle" style="min-width:230px;max-width:230px;">제품명</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle">원지</th>
							<th class="text-center align-middle">절수</th>
							<th class="text-center align-middle">개수</th>
							<th class="text-center align-middle">이론통수</th>
							<th class="text-center align-middle" style="min-width:310px;max-width:310px;">건별주의사항</th>
							<th class="text-center align-middle" style="min-width:310px;max-width:310px;">특이사항</th>
							<th class="text-center align-middle">COLOR</th>
							<th class="text-center align-middle">코팅</th>
							<th class="text-center align-middle">목표요구일</th>
							<th class="text-center align-middle">납품요구일</th>
							<th class="text-center align-middle">호기</th>
							<th class="text-center align-middle">공정작업상태</th>
							<th class="text-center align-middle">공정명</th>
							<th class="text-center align-middle">설비명</th>
							<th class="text-center align-middle">코팅판번호</th>
							<th class="text-center align-middle">목형번호</th>
							<th class="text-center align-middle">칼끝규격</th>
							
							<th class="text-center align-middle">성형방식</th>
							<th class="text-center align-middle">성형내용</th>
							<th class="text-center align-middle">사이즈</th>
							<th class="text-center align-middle">박스수량</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">출고일</th>
							<th class="text-center align-middle">출고량</th>
							
							<th class="text-center align-middle">지시비고사항</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 작업지시서 모달 -->
<div class="modal fade" id="workOrderReportModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="prcssEquipModalTitle">작업지시서 모달</h5>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<table id="workOrderReportTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;">
						<colgroup id="trAppendTarget">
							<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
							<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
							<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
							<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
							<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
						</colgroup>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 작업지시서 모달 끝 -->

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
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	//공통코드
	let ordStatusList = getCommonCode('시스템', '022'); // 수주상태

	//그룹
	let prcssGroupCdList = getCommonCode('시스템','029');
	selectBoxAppend(prcssGroupCdList, 'prcssGroupCd', '', '1'); //공정그룹

	prcssGroupCdList.forEach(function(item){
		let html = '';
		html += '<button type="button" class="btn btn-outline-light w-auto prcssGroupBtn" data-val="' + item.commonCd + '">' + item.commonNm + '</button>';
		$('#prcssGroupBtnDiv').append(html);
	});
	
	let applyList = new Array(); //화면 보이는 컬럼 조정리스트
	let prcssGroupCdVal = '';
	let prcssCdList = new Array();	//공정 코드 리스트
	//공정 코드 담기
	$.ajax({
		url: '<c:url value="/bm/prcssListAll"/>',
        type: 'GET',
        async: false,
        data: {},
		success : function(res) {
			let data = res.data;
			data.forEach((item) => {
				var prcssData = new Object();
				prcssData.id = item.idx;
				prcssData.text = item.prcssNm;
				prcssCdList.push(prcssData);
			});

			$('#searchPrcssCd').select2({
				data: prcssCdList,
				multiple : true,
				placeholder: "공정 선택",
			});
			$('#searchPrcssCd').find('span').eq(0).css('width','100%');
			$('#searchPrcssCd').find('.select2-search__field').css('width','100%');
			$('.select2-container').addClass('me-3');
		}
	});
	$('#searchPrcssCd').on('change',function(e) {
		let searchPrcssCdDataList = $('#searchPrcssCd').val();
		width = 220;
		if(searchPrcssCdDataList.length<=2) {
			document.getElementById('searchPrcssCd').style.width=width+'px';
		} else {
			console.log(searchPrcssCdDataList)
			for(let i = 2; i<searchPrcssCdDataList.length;i++) {
				let prcssCd = searchPrcssCdDataList[i];
				prcssCdList.forEach((item) => {
					let equipTextLength = 0;
					if(item.id==prcssCd) {
						equipTextLength = (item.text).length;
						if(equipTextLength<=4) {
							width = width+(equipTextLength*20);
						} else {
							width = width+(equipTextLength*16);
						}
						return false;
					}
				});
			}
			document.getElementById('searchPrcssCd').style.width=width+'px';
		}
		
		$('#searchPrcssCd').select2({
			data: prcssCdList,
			multiple : true,
			placeholder: "공정 선택",
		});
		$('#searchPrcssCd').find('span').eq(0).css('width','100%');
		$('#searchPrcssCd').find('.select2-search__field').css('width','100%');
		$('.select2-container').addClass('me-3');
	})
	//let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	
	//selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));


	let sessionUserIdx = "${userIdx}";//세션에서 가져온 유저식별자

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
		colReorder: true,
		select: {
            style: 'multi',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/wm/workOrdDtlLstWithPrcssByOrdDate"/>',
			type : 'POST',
			data : {
				'startDate'		: function(){return $('#startDate').val().replaceAll('-','');},
				'endDate'		: function(){return $('#endDate').val().replaceAll('-','');},
				'searchTarget'	: function(){ return $('#searchTarget').val(); },
				'prcssIdx'		: function() {
											if($('#searchPrcssCd').val().length == 0) {
												return '';
											} else {
												return $('#searchPrcssCd').val().join(',');
											}
										},
				'prcssGroupCd'	: function(){
												if(isEmptyCheck(prcssGroupCdVal)){
													return '';
												} else {
													return '%' + prcssGroupCdVal + '%';
												} 
											},
				'loginUserIdx'	: function() { return sessionUserIdx;},
			},
		}, 
        rowId: 'workOrdPrcssIdx',
		columns : [
			{ data: 'bizStatusCd', className : 'text-center align-middle', name:'bizStatusCd',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return _.filter(ordStatusList,v=>v.commonCd == data)[0].commonNm;
					} else {
						return '수주등록';
					}
				}
			},//수주상태
			{ data : 'bizOrdDtlNo', className : 'text-center align-middle', name : 'bizOrdDtlNo', 
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수주번호
			{ data: 'workOrdNo', className : 'text-center align-middle', name : 'workOrdNo',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//작업지시번호
			{ data: 'workOrdPrintYn', className : 'text-center align-middle', name: 'workOrdPrintYn',
				render: function(data, type, row, meta) {
					if(data == 'Y') {
						return '<i class="fa-solid fa-check mt-1 text-success"></i>';
					} else {
						return '<i class="fa-solid fa-x mt-1 text-danger"></i>';
					}
				}
			}, //작지 출력여부
			{ data: 'bizDealCorpNm', className : 'text-center align-middle', name : 'bizDealCorpNm',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//수주처
			{ data : 'itemNm', className : 'text-center align-middle', name : 'itemNm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space:pre-line;width:250px; ">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//제품명
			{ data : 'bizOrdQty', className : 'align-middle text-end', name : 'bizOrdQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '-';
					}
				}
			},//수주량
			{ data : 'paperType', className : 'text-center align-middle', name : 'paperType',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},//원지
			{ data : 'cutQty', className : 'text-end align-middle', name: 'cutQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//절수
			{ data : 'eaQty', className : 'text-end align-middle', name: 'eaQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//개수
			{ className : 'text-end align-middle', name: 'printPressQty', // 정매인쇄통수(이론통수)
				render : function(data, type, row, meta) {
					let ordQty = parseInt(row['purchaseOrdQty']); // 주문수량(제품)
					let cutQty = parseInt(row['cutQty']); // 절수
					let eaQty = parseInt(row['eaQty']); // 개수

					if( isEmptyCheck(row['cutQty']) || isEmptyCheck(row['eaQty']) ) {
						return '0';
					} else {
						//let printPressQty = Math.ceil(ordQty/eaQty);
						let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
						return addCommas(printPressQty);
					}
				}
			},
			{ data : 'ordIssue', className : 'text-start align-middle', name : 'ordIssue',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space:pre-line;width:330px; ">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//건별주의사항
			{ data : 'specialNotice', className : 'text-start align-middle', name : 'specialNotice',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space:pre-line;width:330px;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//특이사항
			{ data : 'itemColor', className : 'text-center align-middle',  name: 'itemColor',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//COLOR
			{ data : 'coatingMethod', className : 'text-center align-middle', name: 'coatingMethod',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//코팅
			{ data : 'ordEndDate', className : 'text-center align-middle', name: 'ordEndDate',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//목표요구일
			{ data : 'outReqDate', className : 'text-center align-middle', name: 'outReqDate',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//납품요구일
			{ data : 'etc1Nm', className : 'text-center align-middle', name: 'etc1Nm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//호기
			{ data: 'progressStatus', className : 'text-center align-middle', name : 'progressStatus',
				render: function(data, type, row, meta) {
					if(row['workOrdPrcssJson'] != null && row['workOrdPrcssJson'] !=''){
						let jsonData = JSON.parse(row['workOrdPrcssJson']);
						//완료공정
						let wcPrcssList = _.filter(jsonData, v=> v.progressStatus == 'WC');
						if(jsonData.length == wcPrcssList.length){
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">모든 공정 완료</div>';
						} else {
							if(data != null && data != ''){
								let returnTxt = '';
								if(data == 'PI'){
									returnTxt = '대기';
								} else if(data == 'WI'){
									returnTxt = '진행';
								} else if(data == 'WC'){
									returnTxt = '완료';
								}
								return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+returnTxt+'</div>';
							}
						}
					} else {
						return '-';
					}
				}
			},//공정작업상태
			{ data : 'prcssNm', className : 'text-center align-middle', name : 'prcssNm',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						if(row['workOrdPrcssJson'] != null && row['workOrdPrcssJson'] !=''){
							let jsonData = JSON.parse(row['workOrdPrcssJson']);
							//완료공정
							let wcPrcssList = _.filter(jsonData, v=> v.progressStatus == 'WC');
							if(wcPrcssList.length == jsonData.length){
								//공정순서가 제일큰 -> 마지막 공정인
								let maxList = _.maxBy(wcPrcssList, v=>v.prcssOrder);
								return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+maxList.prcssNm+'</div>';
							} else {
								return '-';
							}
						} else {
							return '-';
						}
					}
				}
			},//공정명
			{ data : 'equipNm', className : 'text-center align-middle',  name: 'equipNm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//설비명
			{ data : 'resinBoardNm', className : 'text-center align-middle', name: 'resinBoardNm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//코팅판번호
			{ data : 'woodenCareNm', className : 'text-center align-middle', name: 'woodenCareNm',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//목형번호
			{ data : 'knifeTipSize', className : 'text-center align-middle', name: 'knifeTipSize',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//칼끝규격

			{ data : 'moldingMethod', className : 'text-center align-middle', name : 'moldingMethod',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//성형방식
			{ data : 'moldingContents', className : 'text-center align-middle', name: 'moldingContents',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//성형내용
			{ data : 'itemSize', className : 'text-center align-middle', name: 'itemSize',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//사이즈
			{ className : 'text-end align-middle', name: 'boxCount',
				render : function(data, type, row, meta) {
					let packUnit = (row['packUnit']=='' ||  parseInt(row['packUnit'])==0) ? 1 : isNaN(row['packUnit']) ? 1 : parseInt(row['packUnit']);
					let bizOrdQty = isEmptyCheck(row['bizOrdQty']) ? 0 : row['bizOrdQty'];
					 return addCommas(Math.ceil(parseInt(bizOrdQty)/packUnit));
				}
			},//BOX수량
			{ data : 'purchaseOrdNo', className : 'text-center align-middle', name: 'purchaseOrdNo',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},//발주번호
			{ data : 'outDate', className : 'text-center align-middle', name: 'outDate',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '-';
					}
				}
			},//출고일
			{ data : 'outQty', className : 'text-end align-middle', name: 'outQty',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},//출고량
			
			{ data : 'workOrdDesc', className : 'text-center align-middle', name : 'workOrdDesc',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
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
			/* { "targets": [0], "orderable": false }, */
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
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			/* { extend: 'colvis',	text: 'Select Col',	}, */
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
			for(var i=0;i<api.data().count();i++) {
				let data = api.row(i).data();
				let node = api.row(i).node();
				if(data.ordGubun == '20') {
					$(node).addClass('fw-bolder');
					$(node).css('background-color','#FFF2CC');
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
				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');
			
				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workOrderPrcssTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
			api.button(2).trigger();
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

	workOrderPrcssTable.on('select deselect', function(e, dt, type, index){
		let dataArray = workOrderPrcssTable.rows('.selected').data().toArray();
		if( dataArray.length > 0){
			$('#workOrderReportTable').find('tr').remove();
			//클릭 갯수 만큼 용지 만들기
			for(var i = 0 ; i < dataArray.length; i++ ){
				let data = dataArray[i];
				let customerItemCd = isEmptyCheck(data.customerItemCd) ? '' : data.customerItemCd;
				let itemVersion = isEmptyCheck(data.itemVersion) ? '' : data.itemVersion;
				let paperType = isEmptyCheck(data.paperType) ? '' : data.paperType;
				let woodenCareNm = isEmptyCheck(data.woodenCareNm) ? '' : data.woodenCareNm;
				let cutQty = parseInt(data.cutQty);
				let eaQty = parseInt(data.eaQty);
				let extraQty = parseInt(data.extraQty);
				let extraPackQty = parseInt(data.extraPackQty);
				let fixedSheet = Math.ceil( data.bizOrdQty / (cutQty * eaQty) );
				let fixedSheetR = parseInt(fixedSheet/500) + 'R' + parseInt(fixedSheet%500);
				//workSheet = (여분+정매인쇄통수) / 절수 , 정매인쇄통수는 fixedSheet에 절수 곱하면됨
				let workSheet = Math.ceil(( extraQty + (fixedSheet * cutQty)) / cutQty);
				let workSheetR = parseInt(workSheet/500) + 'R' + parseInt(workSheet%500);
				//noSheet = (절수 * (수주수량/(절수*개수)) )임 즉 fixedSheet에 절수곱한값 
				let noSheet = fixedSheet * cutQty;
				//exSheet = (절수 * 통수:workSheet) - noSheet
				let exSheet = (cutQty * workSheet) - noSheet;
				let cutSize = parseInt(cutQty) + '절' + parseInt(eaQty);
				let ordEndDate = data.ordEndDate;
				let workDeadline = moment(ordEndDate).subtract('d',6).format('YYYY-MM-DD')
				
				$('#trAppendTarget').after(makeEmptyTr());
				// 0번째가 추가된 tr이라서 밑에처럼함 / for문 2번쓸려했는데 나중가서 문제될거같아서 이렇게함
				$('[name=bizOrdDtlNo]:eq(0)').text(data.bizOrdDtlNo); 								//제조관리번호
				$('[name=bizOrdDealCorpNm]:eq(0)').text(data.bizDealCorpNm); 						//수주고객사
				$('[name=itemNm]:eq(0)').text(data.itemNm); 										//제품명
				$('[name=bizOrdQty]:eq(0)').text(addCommas(parseInt(data.bizOrdQty)));	 			//수주수량
				$('[name=itemVersion]:eq(0)').text( customerItemCd + ' - ' + itemVersion ); 		//제품버전
				$('[name=paperType]:eq(0)').text( paperType ); 										//발주자재
				$('[name=woodenCareNm]:eq(0)').text( woodenCareNm ); 								//목형번호
				$('[name=holeWoodenCd]:eq(0)').text( data.holeWoodenCd ); 							//타공목형번호
				$('[name=fixedSheet]:eq(0)').text( fixedSheetR ); 									//fixedSheet
				$('[name=cutSize]:eq(0)').text( cutSize ); 											//cutSizeeet
				$('[name=workSheet]:eq(0)').text( workSheetR ); 									//workSheetR
				$('[name=noSheet]:eq(0)').text( noSheet ); 											//noSheet
				$('[name=exSheet]:eq(0)').text( exSheet ); 											//exSheet
				$('[name=notice]:eq(0)').text( data.specialNotice ); 								//notice
				$('[name=knifeTipSize]:eq(0)').text( data.knifeTipSize ); 							//knifeTipSize
				$('[name=printingYnCheck]:eq(0)').text( data.printingYnCheck ); 					//printingYnCheck
				$('[name=inspectMethodNm]:eq(0)').text( data.inspectMethodNm ); 					//inspectMethodNm
				$('[name=etc6]:eq(0)').text( data.etc6 ); 											//etc6
				$('[name=ordEndDate]:eq(0)').text( moment(ordEndDate).format('YYYY-MM-DD') );		//ordEndDate
				$('[name=workDeadline]:eq(0)').text( workDeadline );								//ordEndDate
				$('[name=itemSize]:eq(0)').text( data.itemSize ); 									//itemSize
				$('[name=coatingMethod]:eq(0)').text( data.coatingMethod ); 						//coatingMethod
				$('[name=resinBoardNm]:eq(0)').text( data.resinBoardNm ); 							//resinBoardNm
				$('[name=etc1Nm]:eq(0)').text( data.etc1Nm ); 										//etc1Nm
				$('[name=itemColor]:eq(0)').text( data.itemColor ); 								//itemColor
				$('[name=ordIssue]:eq(0)').text( data.ordIssue ); 									//ordIssue
				$('[name=purchaseOrdNo]:eq(0)').text( data.purchaseOrdNo ); 						//purchaseOrdNo
				$('[name=packUnit]:eq(0)').text( data.packUnit ); 						//packUnit
				$('[name=packUnit]:eq(1)').text( data.packUnit ); 						//packUnit
				$('[name=moldingMethod]:eq(0)').text( data.moldingMethod ); 						//packUnit
				$('[name=moldingContents]:eq(0)').text( data.moldingContents ); 						//packUnit
				$('[name=bundleMethodNm]:eq(0)').text( data.bundleMethodNm ); 						//packUnit
				$('[name=bundleUnit]:eq(0)').text( data.bundleUnit ); 						//packUnit
				$('[name=packMethodNm]:eq(0)').text( data.packMethodNm ); 						//packUnit
				
			}
			cssChange();
		} else {
			//빈 여백지 만들어주기
			$('#workOrderReportTable').find('tr').remove();
			$('#trAppendTarget').after(makeEmptyTr());
			cssChange();
			
		}
	});
	
	//수정눌렀을떄
	$('#btnEdit').on('click',function(){
		WM_action_ON('ADM', 'workingWarningModal');

		$('#btnSearch').attr('disabled',false);
		$('#btnSave').attr('disabled',false);
		$('#btnEdit').attr('disabled',true);
		$('#btnCancel').attr('disabled',false);
		
		$('#my-spinner').show();
		setTimeout(function(){
			//applyList = getCommonCode('시스템',$('#prcssGroupCd').val());

			// 모든 열(Column) 다시 보이게 하기
			workOrderPrcssTable.columns().visible(true);
			$('#workOrderPrcssTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			});
			//열 움직이는 기능 잠금
			workOrderPrcssTable.colReorder.disable();
			// 해당 열 html 변환
			$('#workOrderPrcssTable tbody').find('tr').each(function(index_tr, tr) {
				$(tr).find('td').each(function(index_td, td) {
					if(index_td == workOrderPrcssTable.column('ordEndDate:name').index()) { // 목표요구일
						let value = workOrderPrcssTable.row(tr).data().ordEndDate;
						value = moment(value).format('YYYY-MM-DD');
						//$(td).html('<input type="date" name="ordEndDate" max="9999-12-31" class="form-control text-center" value="'+value+'">');
						$(td).html('<input onclick="this.select()" type="text" name="ordEndDate" class="form-control text-center dateTextInput" value="'+value+'">');
					} else if(index_td == workOrderPrcssTable.column('outReqDate:name').index()) { // 납품요구일
						let value = workOrderPrcssTable.row(tr).data().outReqDate;
						value = moment(value).format('YYYY-MM-DD');
						//$(td).html('<input type="date" name="outReqDate" max="9999-12-31" class="form-control text-center" value="'+value+'">');
						$(td).html('<input onclick="this.select()" type="text" name="outReqDate" class="form-control text-center dateTextInput" value="'+value+'">');
					} else if(index_td == workOrderPrcssTable.column('workOrdDesc:name').index()){
						//지시비고사항
						let data = workOrderPrcssTable.row(tr).data().workOrdDesc;
						let value = isEmptyCheck(data) ? '' : data;
						$(td).html('<input type="text" name="workOrdDesc" style="min-width:200px;" class="form-control text-start" value="'+value+'">');
						
	
					}
				});
			});
			
			//해당 열 안보이도록 
			for( var i = 0; i < applyList.length; i++){
				if(applyList[i].commonDesc == 'N'){
					let hideColIndex = workOrderPrcssTable.column(applyList[i].etc1+':name').index();
					workOrderPrcssTable.column( hideColIndex ).visible( false );
				}
			}
			$('#my-spinner').hide();

			workOrderPrcssTable.draw(false);
		},10);
	})
	
	$('#btnSearch').on('click',function(){
		WM_action_OFF('ADM');
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		
		$('#my-spinner').show();
		setTimeout(function(){
			applyList = getCommonCode('시스템',$('#prcssGroupCd').val());
			prcssGroupCdVal = $('#prcssGroupCd').val();

			workOrderPrcssTable.rows('.selected').deselect();
			// 모든 열(Column) 다시 보이게 하기
			workOrderPrcssTable.columns().visible(true);
			
			workOrderPrcssTable.colReorder.enable();
			$('#workOrderPrcssTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			//해당 열 안보이도록 
			for( var i = 0; i < applyList.length; i++){
				if(applyList[i].commonDesc == 'N'){
					let hideColIndex = workOrderPrcssTable.column(applyList[i].etc1+':name').index();
					workOrderPrcssTable.column( hideColIndex ).visible( false );
				}
			}
			workOrderPrcssTable.ajax.reload(function(){
				$('#my-spinner').hide();
			});			
			
		},10);
	});
	
	//저장
	$('#btnSave').on('click',function(){
		$('#my-spinner').show();
		setTimeout(function(){
			//let applyList = getCommonCode('시스템',$('#prcssGroupCd').val());

			// 모든 열(Column) 다시 보이게 하기
			workOrderPrcssTable.columns().visible(true);

			//저장프로세스
			let array = [];
			let state = true;
			$('#workOrderPrcssTable tbody tr').each(function(index, item) {
				let td = $(item).find('td');
				let data = workOrderPrcssTable.row($(item)).data();
				let node = workOrderPrcssTable.row($(item)).node();
				
				let ordEndDate = $(td).eq(workOrderPrcssTable.column('ordEndDate:name').index()).find('input').val().replaceAll('-','');
				let outReqDate = $(td).eq(workOrderPrcssTable.column('outReqDate:name').index()).find('input').val().replaceAll('-','');
				let workOrdDesc =  $(td).eq(workOrderPrcssTable.column('workOrdDesc:name').index()).find('input').val();

				
				let datePattern = /^\d{4}-\d{2}-\d{2}$/; //YYYY-MM-DD 형태 체크 정규식
				let ordEndDateVal = $(td).eq(workOrderPrcssTable.column('ordEndDate:name').index()).find('input').val();
				let outReqDateVal = $(td).eq(workOrderPrcssTable.column('outReqDate:name').index()).find('input').val();
				
				if(!datePattern.test(ordEndDateVal)){
					toastr.warning('목표요구일을<br>YYYY-MM-DD형식으로<br>입력해주세요.');
					$(td).eq(workOrderPrcssTable.column('ordEndDate:name').index()).find('input').focus();
					state = false;
					return false;
				}

				if(!datePattern.test(outReqDateVal)){
					toastr.warning('납품요구일을<br>YYYY-MM-DD형식으로<br>입력해주세요.');
					$(td).eq(workOrderPrcssTable.column('outReqDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				
				if(ordEndDate == '') {
					toastr.warning('목표요구일을 입력해주세요.');
					$(td).eq(workOrderPrcssTable.column('ordEndDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(outReqDate == '') {
					toastr.warning('납품요구일을 입력해주세요.');
					$(td).eq(workOrderPrcssTable.column('outReqDate:name').index()).find('input').focus();
					state = false;
					return false;
				}

				if(ordEndDate < moment().format('YYYYMMDD') ){
					toastr.warning('목표요구일을 금일보다 이전 날짜는<br>입력할 수 없습니다.');
					$(td).eq(workOrderPrcssTable.column('ordEndDate:name').index()).find('input').focus();
					state = false;
					return false;
				}

				if(outReqDate < moment().format('YYYYMMDD') ){
					toastr.warning('납품요구일을 금일보다 이전 날짜는<br>입력할 수 없습니다.');
					$(td).eq(workOrderPrcssTable.column('outReqDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				
				let obj = new Object();
				obj.workOrdIdx = data.workOrdIdx;
				obj.bizOrdDtlIdx = data.bizOrdDtlIdx;
				obj.ordEndDate = ordEndDate;
				obj.outReqDate = outReqDate;
				obj.workOrdDesc = workOrdDesc;
			    array.push(obj);
				
			});
			//해당 열 안보이도록 
			for( var i = 0; i < applyList.length; i++){
				if(applyList[i].commonDesc == 'N'){
					let hideColIndex = workOrderPrcssTable.column(applyList[i].etc1+':name').index();
					workOrderPrcssTable.column( hideColIndex ).visible( false );
				}
			}
			if(!state) {
				$('#my-spinner').hide();
				return false;
			}

			//원본데이터
			let tableData = [];
			for(var i=0;i<workOrderPrcssTable.data().count();i++) {
				let obj = {};

				let data = workOrderPrcssTable.row(i).data();

				obj.workOrdIdx = data.workOrdIdx;
				obj.bizOrdDtlIdx = data.bizOrdDtlIdx;
				obj.ordEndDate = data.ordEndDate;
				obj.outReqDate = data.outReqDate;
				obj.workOrdDesc = data.workOrdDesc;
				
				tableData.push(obj);
			}
			
			array = _.differenceWith(array, tableData, _.isEqual);
			$.ajax({
				url: '<c:url value="/bs/bizOrderDtlUpdByTeamSchedule"/>',
	            type: 'POST',
	            data: {
	                'updateJson'	:	JSON.stringify(array)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수정되었습니다.');
						$('#workOrderPrcssTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false); // 검색 필터 disabled
						});
						//열 움직이는 기능 잠금
						workOrderPrcssTable.colReorder.enable();
						WM_action_OFF('ADM');
						workOrderPrcssTable.rows('.selected').deselect();
						
						workOrderPrcssTable.ajax.reload();
						$('#btnSearch').attr('disabled',false);
						$('#btnSave').attr('disabled',true);
						$('#btnEdit').attr('disabled',false);
						$('#btnCancel').attr('disabled',true);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});

			
		},10);
			
		
	})
	
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

			workOrderPrcssTable.clear();
		}
	});

	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'ADM') {
			$('#btnSave').trigger('click');
			return false;
		}
	});

	/* $(document).on('blur', 'input[name=ordEndDate], input[name=outReqDate]', function(){
		//$('#btnSave').off('click');
		$('#btnSave').unbind('click').click();
		event.stopPropagation(); // 이벤트 전파 중지
		
		let data = $(this).val();
		if( moment(data).format('YYYYMMDD') < moment().format('YYYYMMDD') ){
			toastr.warning('금일보다 이전 날짜는<br>입력할 수 없습니다.');
			$(this).val(moment().format('YYYY-MM-DD'));
		}
		
	}); */

	//데이터테이블 변경 처리해야함
	/* $('#btnPrcssGroupApply').on('click',function(){
		WM_action_OFF('ADM');
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		
		$('#my-spinner').show();
		setTimeout(function(){
			applyList = getCommonCode('시스템',$('#prcssGroupCd').val());
			prcssGroupCdVal = $('#prcssGroupCd').val();
			
			// 모든 열(Column) 다시 보이게 하기
			workOrderPrcssTable.columns().visible(true);
			
			workOrderPrcssTable.colReorder.enable();
			$('#workOrderPrcssTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			//해당 열 안보이도록 
			for( var i = 0; i < applyList.length; i++){
				if(applyList[i].commonDesc == 'N'){
					let hideColIndex = workOrderPrcssTable.column(applyList[i].etc1+':name').index();
					workOrderPrcssTable.column( hideColIndex ).visible( false );
				}
			}

			$('#my-spinner').hide();
			
		},10);
		
	}); */

	$(document).on('click','.prcssGroupBtn',function(){
		$('#prcssGroupCd').val($(this).data('val'));
		$('#btnSearch').trigger('click');
	});

	// 초기 셋팅
	$(document).ready(function() {
		$('#trAppendTarget').after(makeEmptyTr());
		cssChange();
		$('#my-spinner').hide();
		$('#workOrderReportTable').removeClass('d-none');
		

		$('input').attr('autocomplete','one-time-code');
	});

	function makeEmptyTr(){
		let html = '';
		html += '<tr style="page-break-before: always!important;">';
		html += '		<td class="bd-n h-25" colspan="30">';
		html += '</tr>';
		html += '';

		html += '<tr>';
		html += '	<td colspan="9" class="bd-n"></td>';
		html += '	<td colspan="12" class="fs-30 fw900 bd2px text-center bt-n bl-n br-n">제조지시 및 기록서</td>';
		html += '	<td colspan="9" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-90" colspan="30">';
		html += '</tr>';

		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">발행일 :</td>';
		html += '	<td colspan="7" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="printDate"></td>';
		html += '	<td colspan="4" class="bd-n"></td>';
		html += '	<td colspan="4" class="fs-13 text-start bt-n bl-n br-n">제조관리번호 :</td>';
		html += '	<td colspan="10" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="bizOrdDtlNo"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-20" colspan="30">';
		html += '</tr>';

		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Client:</td>';
		html += '	<td colspan="25" class="fs-13 text-start bt-n bl-n br-n fc-blue" name="bizOrdDealCorpNm"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Project:</td>';
		html += '	<td colspan="25" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="itemNm"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Quantity:</td>';
		html += '	<td colspan="10" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="bizOrdQty"></td>';
		html += '	<td colspan="4" class="fs-13 text-start bt-n bl-n br-n">Revision No.:</td>';
		html += '	<td colspan="11" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="itemVersion"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-20" colspan="30">';
		html += '</tr>';

		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="26" class="fs-13 text-start bt-n bl-n br-n">Specification</td>';
		html += '	<td colspan="2" class="fs-13 fc-blue text-start bt-n bl-n br-n">0</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Paper:</td>';
		html += '	<td colspan="9" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="paperType"></td>';
		html += '	<td colspan="6" class="fs-13 text-start bt-n bl-n br-n">Wooden Pattern No.:</td>';
		html += '	<td colspan="3" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="woodenCareNm"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">타공판No :</td>';
		html += '	<td colspan="4" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="holeWoodenCd"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Fixed Sheet:</td>';
		html += '	<td colspan="9" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="fixedSheet"></td>';
		html += '	<td colspan="5" class="fs-13 text-start bt-n bl-n br-n">Cutting Size :</td>';
		html += '	<td colspan="5" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="cutSize"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">면방 :</td>'; //면방은 MES에 없는 항목임
		html += '	<td colspan="3" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="">0</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Work Sheet:</td>';
		html += '	<td colspan="9" class="fs-13 fc-red text-start bt-n bl-n br-n" name="workSheet"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">No. Sheet :</td>';
		html += '	<td colspan="6" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="noSheet"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Ex. Sheet</td>';
		html += '	<td colspan="4" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="exSheet"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">+Add.Sheet:</td>';
		html += '	<td colspan="9" class="fs-13 fc-blue text-start bt-n bl-n br-n"></td>';
		html += '	<td colspan="4" class="fs-13 text-start bt-n bl-n br-n">+Add.Reason:</td>';
		html += '	<td colspan="12" class="fs-13 fc-blue text-start bt-n bl-n br-n"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Notice:</td>';
		html += '	<td colspan="25" class="fs-13 fc-red text-start bt-n bl-n br-n" name="notice"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="17" class="fs-13 text-start bt-n bl-n br-n"></td>';
		html += '	<td colspan="5" class="fs-13 fc-red text-start bt-n bl-n br-n">칼끝규격 :</td>';
		html += '	<td colspan="6" class="fs-13 fc-red text-start bt-n bl-n br-n" name="knifeTipSize"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">착인여부 :</td>';
		html += '	<td colspan="5" class="fs-13 fc-red text-start bt-n bl-n br-n" name="printingYnCheck"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">검수방법 :</td>';
		html += '	<td colspan="8" class="fs-13 fc-red text-start bt-n bl-n br-n" name="inspectMethodNm"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">형압No:</td>';
		html += '	<td colspan="6" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="etc6"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="5" class="fs-13 text-start bt-n bl-n br-n">Working Deadline :</td>';
		html += '	<td colspan="9" class="fs-13 text-start bt-n bl-n br-n" name="workDeadline"></td>';
		html += '	<td colspan="5" class="fs-13 text-start bt-n bl-n br-n">Delivery Deadline :</td>';
		html += '	<td colspan="9" class="fs-13 fc-red text-start bt-n bl-n br-n" name="ordEndDate"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Size :</td>';
		html += '	<td colspan="11" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="itemSize"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Coating:</td>';
		html += '	<td colspan="11" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="coatingMethod"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">수지판번호 :</td>';
		html += '	<td colspan="11" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="resinBoardNm"></td>';
		html += '	<td colspan="5" class="fs-13 text-start bt-n bl-n br-n">Printing Machine :</td>';
		html += '	<td colspan="9" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="etc1Nm"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Color :</td>';
		html += '	<td colspan="25" class="fs-13 fc-blue text-start bt-n bl-n br-n" name="itemColor"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">Remark</td>';
		html += '	<td colspan="25" class="h-20 fs-13 fc-red text-start bt-n bl-n br-n">';
		html += '	<textarea rows="3" name="ordIssue" class="form-control text-start p-0 fs-13 fc-red"'; 
		html += '		style="resize: none; overflow: hidden;';
		html += '		border: none !important; width:100%;"></textarea>'; 
		html += '	</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-start bt-n bl-n br-n">발주번호 </td>';
		html += '	<td colspan="25" class="fs-13 fc-red text-start bt-n bl-n br-n" name="purchaseOrdNo"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-20" colspan="30">';
		html += '</tr>';
		
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="4" class="fs-13 text-center">Delivery Date</td>';
		html += '	<td colspan="3" class="fs-13 text-center">포장단위</td>';
		html += '	<td colspan="3" class="fs-13 text-center">성형방식</td>';
		html += '	<td colspan="5" class="fs-13 text-center">성형내용</td>';
		html += '	<td colspan="5" class="fs-13 text-center">묶음법</td>';
		html += '	<td colspan="4" class="fs-13 text-center">묶음단위</td>';
		html += '	<td colspan="4" class="fs-13 text-center">포장방법</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="4" class="h-20 fs-13 text-center"></td>';
		html += '	<td colspan="3" class="fs-13 fc-blue text-center" name="packUnit"></td>';
		html += '	<td colspan="3" class="fs-13 fc-blue text-center" name="moldingMethod"></td>';
		html += '	<td colspan="5" class="fs-13 fc-blue text-center" name="moldingContents"></td>';
		html += '	<td colspan="5" class="fs-13 fc-blue text-center" name="bundleMethodNm"></td>';
		html += '	<td colspan="4" class="fs-13 fc-blue text-center" name="bundleUnit"></td>';
		html += '	<td colspan="4" class="fs-13 fc-blue text-center" name="packMethodNm"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-20" colspan="30">';
		html += '</tr>';

		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="3" class="fs-13 text-center">포장내역</td>';
		html += '	<td colspan="5" class="fs-13 fc-blue text-center br-n" name="packUnit"></td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">X</td>';
		html += '	<td colspan="3" class="fs-13 text-center bl-n br-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n br-n">Box</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n br-n">+</td>';
		html += '	<td colspan="7" class="fs-13 text-start bl-n br-n"></td>';;
		html += '	<td colspan="1" class="fs-13 text-start bl-n">/Box</td>';
		html += '	<td colspan="2" class="fs-13 text-center">Total</td>';
		html += '	<td colspan="4" class="fs-13 text-start bl-n"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="fs-13 text-center">No.</td>';
		html += '	<td colspan="2" class="fs-13 text-center"></td>';
		html += '	<td colspan="5" class="fs-13 text-center br-n">X</td>';
		html += '	<td colspan="1" class="fs-13 text-center bl-n br-n">+</td>';
		html += '	<td colspan="4" class="fs-13 text-center bl-n br-n">=</td>';
		html += '	<td colspan="1" class="fs-13 text-start bl-n">Ea</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td class="bd-n h-20" colspan="30">';
		html += '</tr>';
		
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="9" class="fs-13 text-center">담당</td>';
		html += '	<td colspan="10" class="fs-13 text-center">제조관리책임자</td>';
		html += '	<td colspan="9" class="fs-13 text-center">Q.A</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="9" class="h-40 fs-13 text-center"></td>';
		html += '	<td colspan="10" class="h-40 fs-13 text-center"></td>';
		html += '	<td colspan="9" class="h-40 fs-13 text-center"></td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		
		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="28" class="text-end max-h40 h-40 bd2px align-middle bd-n">';
		html += '		<img src="/resources/assets/images/header_logo.png" style="width:22%;height:100%;">';
		html += '	</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';

		html += '<tr>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '	<td colspan="10" class="fs-10 bd-n text-start">문서번호 : 제조지시서 및 기록서-210810-12</td>';
		html += '	<td colspan="18" class="fs-10 bd-n text-end">(주)창영테크팩 | 경기도 수원시 권선구 산업로 156번길 88-39 T.031_292_6553 F.031_292_6507</td>';
		html += '	<td colspan="1" class="bd-n"></td>';
		html += '</tr>';
		
		return html;
	}
	
	function cssChange() {
		//$('#workOrderReportTable').find('td').css('font-weight', '900');
		$('#workOrderReportTable').find('td').css('border', '1px solid black');
		$('#workOrderReportTable').find('td').css('padding', '0.1rem');
		$('#workOrderReportTable').find('td').css('color', '#000000');

		$('#workOrderReportTable').find('.fw900').css('font-weight', '900');
		$('#workOrderReportTable').find('.bd2px').css('border', '2px solid black');
		
		$('#workOrderReportTable').find('.bg-gray').css('background-color', '#C9C9C9');
		
		$('#workOrderReportTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#workOrderReportTable').find('.theadFirstCol').css('border-left', '2px');
		$('#workOrderReportTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#workOrderReportTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#workOrderReportTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#workOrderReportTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#workOrderReportTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#workOrderReportTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		//$('#workOrderReportTable').find('.bd-doblue').css('border', '5px double');
		
		$('#workOrderReportTable').find('.fc-red').css('color', '#ff0000');
		$('#workOrderReportTable').find('.fc-blue').css('color', '#0070C0');
		$('#workOrderReportTable').find('.fs-8').css('font-size', '8px');
		$('#workOrderReportTable').find('.fs-10').css('font-size', '10px');
		$('#workOrderReportTable').find('.fs-11').css('font-size', '11px');
		$('#workOrderReportTable').find('.fs-12').css('font-size', '12px');
		$('#workOrderReportTable').find('.fs-13').css('font-size', '13px');
		$('#workOrderReportTable').find('.fs-15').css('font-size', '15px');
		$('#workOrderReportTable').find('.fs-20').css('font-size', '20px');
		$('#workOrderReportTable').find('.fs-25').css('font-size', '25px');
		$('#workOrderReportTable').find('.fs-30').css('font-size', '30px');
		$('#workOrderReportTable').find('.fs-50').css('font-size', '50px');
		$('#workOrderReportTable').find('.fc-red').css('color', '#ff0000');
		$('#workOrderReportTable').find('.bt-2').css('border-top', '2px solid black');
		$('#workOrderReportTable').find('.bd-n').css('border', '0px solid #ffffff');
		$('#workOrderReportTable').find('.bt-n').css('border-top', '0px solid #ffffff');
		$('#workOrderReportTable').find('.br-n').css('border-right', '0px solid #ffffff');
		$('#workOrderReportTable').find('.bb-n').css('border-bottom', '0px solid #ffffff');
		$('#workOrderReportTable').find('.bl-n').css('border-left', '0px solid #ffffff');
		$('#workOrderReportTable').find('.h-5').css('height', '5px');
		$('#workOrderReportTable').find('.h-10').css('height', '10px');
		$('#workOrderReportTable').find('.h-20').css('height', '20px');
		$('#workOrderReportTable').find('.h-25').css('height', '25px');
		$('#workOrderReportTable').find('.h-30').css('height', '30px');
		$('#workOrderReportTable').find('.h-40').css('height', '40px');
		$('#workOrderReportTable').find('.h-55').css('height', '55px');
		$('#workOrderReportTable').find('.h-70').css('height', '70px');
		$('#workOrderReportTable').find('.h-75').css('height', '75px');
		$('#workOrderReportTable').find('.h-90').css('height', '90px');
		$('#workOrderReportTable').find('.h-100').css('height', '100px');
		$('#workOrderReportTable').find('.maxh-5').css('max-height', '5px');
		$('#workOrderReportTable').find('.maxh-10').css('max-height', '10px');
		$('#workOrderReportTable').find('.maxh-20').css('max-height', '20px');
		$('#workOrderReportTable').find('.maxh-25').css('max-height', '25px');
		$('#workOrderReportTable').find('.maxh-30').css('max-height', '30px');
		$('#workOrderReportTable').find('.maxh-40').css('max-height', '40px');
		$('#workOrderReportTable').find('.maxh-55').css('max-height', '55px');
		$('#workOrderReportTable').find('.maxh-70').css('max-height', '70px');
		$('#workOrderReportTable').find('.maxh-75').css('max-height', '75px');
		$('#workOrderReportTable').find('.maxh-100').css('max-height', '100px');
		

		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#workOrderReportTable').find('td').length;i++) {
			let tdStyle = $('#workOrderReportTable').find('td').eq(i).attr('style') == undefined?'':$('#workOrderReportTable').find('td').eq(i).attr('style');
			$('#workOrderReportTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}
	}
	
	$('#btnPrint').on('click',function(){
		$('#my-spinner').show();
		$('td[name=printDate]').text(moment().format('YYYY-MM-DD hh:mm'));
		
		cssChange(); // css반영
		setTimeout(function(){
			let updIdx = '';
			let dataArray = workOrderPrcssTable.rows('.selected').data().toArray();
			for(var i = 0; i < dataArray.length; i++){
				updIdx += dataArray[i].workOrdIdx + ',';
			}
			updIdx = updIdx.slice(0,-1);
			$.ajax({
				url: '<c:url value="/wm/workOrdPaperPrint"/>',
	            type: 'POST',
	            async: false,
	            data: {    
		            'workOrdIdx'				:	function(){return updIdx;},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						$('#workOrderReportTable').print({
							globalStyles: true,
							mediaPrint: true
						});
						workOrderPrcssTable.rows('.selected').deselect();
						workOrderPrcssTable.ajax.reload(function(){},false);
						
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();

				}
			});
		},20)
		
	});
	
</script>

</body>
</html>
