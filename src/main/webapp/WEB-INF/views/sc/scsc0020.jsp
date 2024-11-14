<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'middlecolT middlecolT middlecolT'
																							 'dragbarVT dragbarVT dragbarVT'
																							 'leftcolB dragbar rightcolB';
																		  grid-template-rows: 4fr 4px 2fr;
																		  grid-template-columns: 4fr 4px 4fr;">
	<div id="middlecolT">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주년월</label>
					<input type="month" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="month" class="form-control w-auto h-100 me-1" id="endDate">
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고상태</label>
					<select class="form-select w-auto h-100 me-3" id="searchStatus" style="min-width: 70px;">
						<option value="" selected>전체</option>
						<option value="001">대기</option>
						<option value="002">진행중</option>
						<option value="003">출고완료</option>
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트정보</label>
					<div class="input-group w-auto h-100 me-3">
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="batchProjectNm" disabled>
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주처</label> -->
<!-- 					<div class="input-group w-auto h-100 me-3"> -->
<!-- 						<input type="text" class="form-control inputGroup" name="batchDealCorpNm" disabled> -->
<!-- 						<input type="hidden" name="batchDealCorpIdx"> -->
<!-- 						<button type="button" id="btnDelDealCorpIdx" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;"> -->
<!-- 							<i class="fa-solid fa-xmark"></i> -->
<!-- 						</button> -->
<!-- 						<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="dealCorpAdmSel()" name="btnDealCorpAdmSel" style="padding: 1px 4px; margin-left: 0px;"> -->
<!-- 						<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 						</button> -->
<!-- 					</div>                                                                                                                                                   -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderOutReqTable">
					<thead class="table-light">
						<tr>
<!-- 							<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th> -->
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">국내/해외</th>
							<th class="text-center align-middle">수주일</th>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">Project No.</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">고객발주내용</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">납기일</th>
							<th class="text-center align-middle">출고일</th>
							<th class="text-center align-middle">출고수량</th>
							<th class="text-center align-middle">미출고수량</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarVT" onmousedown="StartDrag('VT')"></div>
	<div id="leftcolB" style="max-height:42vh;">
		<div class="container-fluid" style="padding: 5px; max-height:40vh;">
			<div class="row">
				<div style="width: 100%;">
					<div class="row" id="leftHeader">
						<div class="d-flex align-items-center justify-content-space-between w-100" style="margin-bottom: 5px;">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고처리</label>
							<div class="me-lg-auto"></div>
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnOutReqNew" disabled>
									<i class="fa-solid fa-plus"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOutReqSave" disabled>
									<i class="fa-regular fa-floppy-disk"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnOutReqEdit" disabled>
									<i class="fa-regular fa-pen-to-square"></i>
								</button>
								<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnOutReqDel" disabled>
									<i class="fa-solid fa-trash-can"></i>
								</button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOutReqCancel" disabled>
									<i class="fa-solid fa-xmark"></i>
								</button>
							</div>
						</div>
						<table class="table table-bordered p-0 m-0" id="outReqAdmTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">No.</th>
									<th class="text-center align-middle">출고일</th>
									<th class="text-center align-middle">출고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div id="dragbar" onmousedown="StartDrag('HR')"></div>
	<div id="rightcolB" style="max-height:42vh;">
		<div class="container-fluid h-100" style="padding: 5px; width: 100%;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center justify-content-end w-100" style="margin-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1" style="height:32px;">Serial No.</label>
					</div>
					<div class="me-lg-auto"></div>
					<input type="text" class="form-control me-2 text-end" id="serialAddNum" onkeyup="numberFormat(this, 'int')" style="width:50px;" value="1" disabled>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnOutReqDtlNew" disabled>
							<i class="fa-solid fa-plus"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnOutReqDtlSave" disabled>
							<i class="fa-regular fa-floppy-disk"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnOutReqDtlEdit" disabled>
							<i class="fa-regular fa-pen-to-square"></i>
						</button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnOutReqDtlDel" disabled>
							<i class="fa-solid fa-trash-can"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOutReqDtlCancel" disabled>
							<i class="fa-solid fa-xmark"></i>
						</button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="outReqDtlTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">시리얼번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 수주 모달 -->
<div class="modal fade" id="bizOrderAdmModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					프로젝트 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste1">
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
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate1"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate1"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품목유형명</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">Project No.</th>
							<th class="text-center align-middle">프로젝트명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 화면설정 script -->
<!-- Serial No 모달 -->
<div class="modal fade" id="serialNoModal2" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 30vw;">
		<div class="modal-content" style="height: calc(100vh - 30em); margin-top:23em;">
			<div class="modal-header">
				<h5 class="modal-title" id="serialNoModalTitle">
					Serial No.
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSerialNoModalSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow:auto;">
				<table class="table table-bordered p-0 m-0" id="serialNoModalTable2">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle" style="width: 100%;">Serial No.</th>
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
// 		if (isDraggingV) {
// 			let dragbarWidth = 4;
	
// 			let page_height = parseInt($('#page').height()); 				// 전체 높이
// 			let middlecolT_height = parseInt($('#middlecolT').height());	// 상단
// 			let middlecolB_height = parseInt($('#middlecolB').height());	// 하단
	
// 			let middlecolT_min_height = 100;	// 상단 최소높이
// 			let middlecolB_min_height = 100;	// 하단 최소높이
	
// 			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
	
// 			let cols = [
// 				Math.min(Math.max(middlecolT_min_height, cursorY), page_height - middlecolB_min_height - dragbarWidth),
// 				dragbarWidth,
// 				Math.max(page_height - Math.max(middlecolT_min_height, cursorY) - dragbarWidth, middlecolB_min_height)
// 			];
	
// 			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
// 			$('#page').css('grid-template-rows',newColDefn);
	
// 			event.preventDefault()
// 		}
	}
</script>

<script>
	WM_init('ADM');
	WM_init('DTL');

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let dealGubunList 		= getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList 	= getCommonCode('시스템', '015'); // 거래상태
	let abroadGubunList 	= getCommonCode('시스템', '043'); // 국내/해외
	let requestGubunList 	= getCommonCode('시스템', '048'); //요청구분

	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	
	$('#startDate').val(moment().format('YYYY-MM'));
	$('#endDate').val(moment().format('YYYY-MM'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));

	let bizOrdIdx = '';
	let bizOrdNo = '';
	let bizOrdSeq = '';
	let prjCd = '';
	let prjNm = '';

	let outReqIdx = '';
	let outReqNo = '';
	
	// 수주관리 전체 목록조회
	$('#bizOrderOutReqTable2 thead tr').clone(true).addClass('filters').appendTo('#bizOrderOutReqTable2 thead'); // filter 생성
	let bizOrderOutReqTable = $('#bizOrderOutReqTable2').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/sc/bizOrderOutReqLst"/>',
			type : 'POST',
			data : {
 				'startDate'		: function() { return moment($('#startDate').val(),'YYYY-MM').format('YYYYMM'); },
 				'endDate'		: function() { return moment($('#endDate').val(),'YYYY-MM').format('YYYYMM'); },
 				'projectCd'	: function() { return $('#batchProjectCd').val(); },
 				'status'	: function() { return $('#searchStatus').val(); },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'status', className : 'text-center align-middle', name: 'status', //프로젝트
				render: function(data, type, row, meta) {
					if(data!=null){
						if(data == '001'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
						} else if(data == '002'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">진행중</div>';
						} else if(data == '003'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">출고완료</div>';
						}
					} else return '';
				}
			},
			{ data: 'goodsTypeNm', className : 'text-center align-middle', //품목유형
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			{ data: 'goodsNm', className : 'text-center align-middle', //품명
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'abroadGubun', className : 'text-center align-middle', //국내/해외
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
			{ data: 'ordDate', className : 'text-center align-middle', //수주일
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle', //수주처
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'bizOrdNo', className : 'text-center align-middle', //수주관리번호
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'customerNo', className : 'text-center align-middle', //고객발주No
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'prjCd', className : 'text-center align-middle', //Project No.
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'prjNm', className : 'text-center align-middle', //프로젝트명
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'customerDesc', className : 'text-center align-middle', //고객발주내용
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordQty', className : 'text-end align-middle', //수주수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordCost', className : 'text-end align-middle', //단가
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //금액
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'dueDate', className : 'text-center align-middle', //납기일
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'outDate', className : 'text-center align-middle', //출고일(최근출고일)
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'outQty', className : 'text-end align-middle', //출고수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'remainQty', className : 'text-end align-middle', //미출고수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
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
			let middlecolT_height = parseFloat($('#middlecolT').css('height'));
			let theadHeight = parseFloat($('#bizOrderOutReqTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#bizOrderOutReqTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#bizOrderOutReqTable_filter').addClass('d-none');
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
					let selectData = bizOrderOutReqTable.row(item).data();
					if( bizOrderOutReqTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(bizOrderOutReqTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(bizOrderOutReqTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#bizOrderOutReqTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderOutReqTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderOutReqTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderOutReqTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderOutReqTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		bizOrderOutReqTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 출고목록 선택
	$('#bizOrderOutReqTable tbody').on('click', 'tr', function() {
		let data = bizOrderOutReqTable.row(this).data();

		bizOrdIdx = data.idx;
		bizOrdNo  = data.bizOrdNo;
		bizOrdSeq = data.bizOrdSeq;
		prjCd	  = data.prjCd;
		prjNm	  = data.prjNm;

		outReqIdx = '';
		outReqNo  = '';
		$('#outReqAdmTable2').DataTable().ajax.reload();
		$('#outReqDtlTable2').DataTable().ajax.reload();
		$('#btnOutReqNew').attr('disabled', false); // 출고처리 신규 버튼
	});

	// 출고처리 전체 목록조회
	$('#outReqAdmTable thead tr').clone(true).addClass('filters').appendTo('#outReqAdmTable thead'); // filter 생성
	let outReqAdmTable = $('#outReqAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '20vh',
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
			url : '<c:url value="/sc/outReqAdmLst"/>',
			type : 'POST',
			data : {
 				'bizOrdIdx'		: function() { return bizOrdIdx; },
 				'bizOrdNo'		: function() { return bizOrdNo; },
 				'bizOrdSeq'		: function() { return bizOrdSeq; },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'outDate', className : 'text-center align-middle', name: 'outDate', //출고일(최근출고일)
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<input type="date" class="form-control" name="outDate" value="'+moment().format('YYYY-MM-DD')+'">';
					}
				}
			},
			{ data: 'outQty', className : 'text-end align-middle', name: 'outQty', //미출고수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return '<input type="text" class="form-control text-end" name="outQty" value="0">';
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
			let leftcolB_height = parseFloat($('#leftcolB').css('height'));
			let theadHeight = parseFloat($('#outReqAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#outReqAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(leftcolB_height - theadHeight - 80)+'px');
			
			$('#outReqAdmTable_filter').addClass('d-none');
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
					let selectData = outReqAdmTable.row(item).data();
					if( outReqAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(outReqAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(outReqAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#outReqAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outReqAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	outReqAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = outReqAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outReqAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 출고목록 선택
	$('#outReqAdmTable tbody').on('click', 'tr', function() {
		let data = outReqAdmTable.row(this).data();

		outReqIdx = data.idx;
		outReqNo  = data.outReqNo;

		$('#outReqDtlTable2').DataTable().ajax.reload();

		$('#btnOutReqNew').attr('disabled', false); // 출고처리 신규 버튼
		$('#btnOutReqEdit').attr('disabled', false); // 출고처리 신규 버튼
		$('#btnOutReqDel').attr('disabled', false); // 출고처리 신규 버튼

		$('#serialAddNum').attr('disabled', false);
		$('#btnOutReqDtlNew').attr('disabled', false);
	});

	//출고처리 신규
	$('#btnOutReqNew').on('click', function(){
		let col_filter_text = [];
		$('#outReqAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		outReqAdmTable.row.add({
			'idx'			:	'',
			'outReqNo'		:	null,
			'outDate'		:	'',
			'outQty'		:	'',
			'bizOrdIdx'		:	bizOrdIdx,
			'bizOrdNo'		:	bizOrdNo,
			'bizOrdSeq'		:	bizOrdSeq,
			'prjCd'			:	prjCd,
			'prjNm'			:	prjNm,
		}).draw(false);
		
		outReqAdmTable.colReorder.disable();

		$('#btnOutReqSave').attr('disabled', false); // 저장 버튼
		$('#btnOutReqEdit').attr('disabled', true); // 수정 버튼
		$('#btnOutReqDel').attr('disabled', false); // 삭제 버튼
		$('#btnOutReqCancel').attr('disabled', false); // 취소 버튼
	});

	// 출고처리 수정 버튼 click
	$('#btnOutReqEdit').on('click', function() {
		if($('#outReqAdmTable').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		
		$('#outReqAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});

		$('#outReqAdmTable tbody').find('tr').each(function(index_tr, tr) {
			if($(tr).find('.selected')) {
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
						if(index_td == outReqAdmTable.column('outDate:name').index()) {
							let value = $(td).text().replaceAll(/-/g, '');
							$(td).html('<input type="date" name="outDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
						} else if(index_td == outReqAdmTable.column('outQty:name').index()) {
							let value = $(td).text().replaceAll(/,/g, '');
							$(td).html('<input type="text" name="outQty" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
						}
					}
				});
			}
		});
		outReqAdmTable.draw();
		outReqAdmTable.colReorder.disable();

		$('#btnOutReqNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnOutReqSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnOutReqEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnOutReqDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnOutReqCancel').attr('disabled', false); // ADM 취소 버튼
	});

	//출고처리 저장
	$('#btnOutReqSave').on('click', function(){
		let array = [];
		let state = true;
		$('#outReqAdmTable tbody').find('tr').each(function(index, item) {
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			if($(item).find('td').find('input').length == 2) {
				//출고처리
				let idx = outReqAdmTable.row($(item)).data().idx;
				let outDate = $(td).eq(outReqAdmTable.column('outDate:name').index()).find('input').val();
				let outQty = $(td).eq(outReqAdmTable.column('outQty:name').index()).find('input').val();
				let bizOrdIdx = outReqAdmTable.row($(item)).data().bizOrdIdx;
				let bizOrdNo = outReqAdmTable.row($(item)).data().bizOrdNo;
				let bizOrdSeq = outReqAdmTable.row($(item)).data().bizOrdSeq;
				let outReqNo = outReqAdmTable.row($(item)).data().outReqNo;
				
				if(outDate == '') {
					toastr.warning('출고일을 입력해주세요.');
					$(td).eq(outReqAdmTable.column('outDate:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(outQty == '') {
					toastr.warning('출고수량을 입력해주세요.');
					$(td).eq(outReqAdmTable.column('outQty:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.idx = idx;
				obj.outReqNo = outReqNo;
				obj.outQty = outQty.replaceAll(/,/g,'');
				obj.outDate = outDate.replace(/-/g,"");
				obj.bizOrdIdx = bizOrdIdx;
				obj.bizOrdNo = bizOrdNo;
				obj.bizOrdSeq = bizOrdSeq;
				obj.prjCd = prjCd;
				obj.prjNm = prjNm;
				
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		console.log(array)
		$.ajax({
			url: '<c:url value="/sc/outReqAdmIU"/>',
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
					outReqAdmTable.ajax.reload(function() {
						$('#outReqAdmTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					outReqAdmTable.colReorder.enable();
					$('#btnOutReqNew').attr('disabled', false); // 신규 버튼
					$('#btnOutReqSave').attr('disabled', true); // 저장 버튼
					$('#btnOutReqEdit').attr('disabled', true); // 수정 버튼
					$('#btnOutReqDel').attr('disabled', true); // 삭제 버튼
					$('#btnOutReqCancel').attr('disabled', true); // 취소 버튼

					$('#bizOrderOutReqTable').DataTable().ajax.reload();
					$('#outReqAdmTable').DataTable().ajax.reload();

				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 출고처리 삭제 버튼 click
	$('#btnOutReqDel').on('click', function() {
		if($('#outReqAdmTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = outReqAdmTable.row('.selected').data();

		if(data.outReqNo != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		} else {
			outReqAdmTable.row('.selected').remove().draw();
		}
	});

	$('#btnOutReqCancel').on('click', function(){
		$('#outReqAdmTable').DataTable().ajax.reload();
	});


	// Serial No. 목록조회
	$('#outReqDtlTable thead tr').clone(true).addClass('filters').appendTo('#outReqDtlTable thead'); // filter 생성
	let outReqDtlTable = $('#outReqDtlTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '20vh',
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
			url : '<c:url value="/sc/outReqDtlLst"/>',
			type : 'POST',
			data : {
 				'outReqIdx'		: function() { return outReqIdx; },
 				'outReqNo'		: function() { return outReqNo; },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'serialNo', className : 'text-center align-middle', name: 'serialNo', //Serial No
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" name="serialNo" class="form-control text-center">';
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
			let rightcolB_height = parseFloat($('#rightcolB').css('height'));
			let theadHeight = parseFloat($('#outReqDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#outReqDtlTable_wrapper').find('.dataTables_scrollBody').css('height',(rightcolB_height - theadHeight - 80)+'px');
			
			$('#outReqDtlTable_filter').addClass('d-none');
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
					let selectData = outReqDtlTable.row(item).data();
					if( outReqDtlTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(outReqDtlTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(outReqDtlTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#outReqDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outReqDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	outReqDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = outReqDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outReqDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 시리얼번호 목록조회
	$('#serialNoModalTable2 thead tr').clone(true).addClass('filters').appendTo('#serialNoModalTable2 thead'); // filter 생성
	let serialNoModalTable = $('#serialNoModalTable2').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: true,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '20vh',
        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'os',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/sc/bizSerialNoLst"/>',
			type : 'POST',
			data : {
				'idx'	:	function() { return bizOrdIdx; },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ data: 'serialNo', className : 'text-center align-middle', name: 'serialNo', //Serial No.
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; width:100%;">'+data+'</div>';
					} else return '';
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
			let leftcolB_height = parseFloat($('#leftcolB').css('height'));
			let theadHeight = parseFloat($('#serialNoModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#serialNoModalTable_wrapper').find('.dataTables_scrollBody').css('height',(leftcolB_height - theadHeight - 80)+'px');
			
			$('#serialNoModalTable_filter').addClass('d-none');
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
					let selectData = serialNoModalTable.row(item).data();
					if( serialNoModalTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(serialNoModalTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(serialNoModalTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#serialNoModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#serialNoModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	serialNoModalTable.on('column-reorder', function( e, settings, details ) {
		let api = serialNoModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#serialNoModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//Serial No 신규
	$('#btnOutReqDtlNew').on('click', function(){
// 		if($('#serialAddNum').val() == 0 || $('#serialAddNum').val() == ''){
// 			toastr.warning('추가할 개수를 입력해주세요.');
// 			$('#serialAddNum').focus();
// 			return false;
// 		}
		
		let col_filter_text = [];
		$('#outReqDtlTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});

		setTimeout(function(){
			$('#serialNoModalTable').DataTable().ajax.reload();
		}, 150);
		$('#serialNoModal2').modal('show');
		
// 		outReqDtlTable.colReorder.disable();

		$('#btnOutReqDtlSave').attr('disabled', false); // 저장 버튼
		$('#btnOutReqDtlEdit').attr('disabled', true); // 수정 버튼
		$('#btnOutReqDtlDel').attr('disabled', false); // 삭제 버튼
		$('#btnOutReqDtlCancel').attr('disabled', false); // 취소 버튼
	});


// 	// Serial No 수정 버튼 click
// 	$('#btnOutReqDtlEdit').on('click', function() {
// 		if($('#outReqDtlTable').DataTable().row('.selected').length == 0){
// 			toastr.warning('수정할 행을 선택해주세요.');
// 			return false;
// 		}
		
// 		$('#outReqDtlTable_wrapper').find('.filters th').each(function(index, item) {
// 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
// 		});

// 		$('#outReqDtlTable tbody').find('tr').each(function(index_tr, tr) {
// 			if($(tr).find('.selected')) {
// 				$(tr).find('td').each(function(index_td, td) {
// 					if($(td).find('input').length == 0 && $(td).find('select').length == 0 && $(tr).find('td').length != 1) {
// 						if(index_td == outReqDtlTable.column('serialNo:name').index()) {
// 							let value = $(td).text();
// 							$(td).html('<input type="text" name="serialNo" class="form-control text-center" value="'+value+'">');
// 						}
// 					}
// 				});
// 			}
// 		});
// 		outReqDtlTable.draw();
// 		outReqDtlTable.colReorder.disable();

// 		$('#btnOutReqDtlNew').attr('disabled', false); // ADM 신규 버튼
// 		$('#btnOutReqDtlSave').attr('disabled', false); // ADM 저장 버튼
// 		$('#btnOutReqDtlEdit').attr('disabled', true); // ADM 수정 버튼
// 		$('#btnOutReqDtlDel').attr('disabled', false); // ADM 삭제 버튼
// 		$('#btnOutReqDtlCancel').attr('disabled', false); // ADM 취소 버튼
// 	});

	//Serial No 저장
	$('#btnSerialNoModalSave').on('click', function(){
		if($('#serialNoModalTable2').DataTable().row('.selected').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}

		if($('#outReqAdmTable2').DataTable().row('.selected').data().outQty < parseInt($('#serialNoModalTable2 tbody').find('.selected').length)+parseInt($('#outReqDtlTable').DataTable().data().length)){
			toastr.warning('출고수량보다 많습니다.');
			return false;
		}
		
		let array = [];
		let state = true;
		$('#serialNoModalTable2 tbody').find('tr').each(function(index, item) {
			if($(this).hasClass('selected')){
				let node = $(item);
				let tr = $(node).parent().parent();
				let td = $(item).find('td');
				//Serial No
				let serialNo = $('#serialNoModalTable2').DataTable().row($(this)).data().serialNo;
				
				if(serialNo == '') {
					toastr.warning('Serial No를 입력해주세요.');
					$(td).eq(outReqDtlTable.column('serialNo:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();

				obj.idx = '';
				obj.outReqIdx = outReqIdx;
				obj.outReqNo  = outReqNo;
				obj.serialNo  = serialNo;
				
			    array.push(obj);
			}
		});

		if(!state) {
			return false;
		}
		console.log(array)
		$.ajax({
			url: '<c:url value="/sc/outReqDtlIU"/>',
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
					outReqDtlTable.ajax.reload(function() {
						$('#outReqDtlTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					outReqDtlTable.colReorder.enable();
					$('#btnOutReqDtlNew').attr('disabled', false); // 신규 버튼
					$('#btnOutReqDtlSave').attr('disabled', true); // 저장 버튼
					$('#btnOutReqDtlEdit').attr('disabled', true); // 수정 버튼
					$('#btnOutReqDtlDel').attr('disabled', true); // 삭제 버튼
					$('#btnOutReqDtlCancel').attr('disabled', true); // 취소 버튼

					$('#outReqDtlTable').DataTable().ajax.reload();
					$('#serialNoModal2').modal('hide');

				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// Serial No 삭제 버튼 click
	$('#btnOutReqDtlDel').on('click', function() {
		if($('#outReqDtlTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = outReqDtlTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','Dtl');
		} else {
			outReqDtlTable.row('.selected').remove().draw();
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let outReqNo = outReqAdmTable.row('.selected').data().outReqNo;
			if(outReqNo==null) {
				outReqAdmTable.row('.selected').remove().draw(false);
				toastr.success('삭제되었습니다.');
			} else {
				$.ajax({
					url: '<c:url value="/sc/outReqAdmDel"/>',
		            type: 'POST',
		            data: {
			            'idx' 		:	outReqIdx,
		                'outReqNo'	:	outReqNo
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');

							//outReqAdmTable.ajax.reload(function(){},false);
							outReqAdmTable.row('.selected').remove().draw(false);
							$('#bizOrderOutReqTable').DataTable().ajax.reload();
							$('#outReqAdmTable2').DataTable().ajax.reload();
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			}
		} else if(deleteType == 'Dtl') {
			let idx = outReqDtlTable.row('.selected').data().idx;
			if(idx=='') {
				outReqDtlTable.row('.selected').remove().draw(false);
				toastr.success('삭제되었습니다.');
			} else {
				$.ajax({
					url: '<c:url value="/sc/outReqDtlDel"/>',
		            type: 'POST',
		            data: {
			            'idx' 		:	idx
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');

							//outReqAdmTable.ajax.reload(function(){},false);
							outReqDtlTable.row('.selected').remove().draw(false);
							
							$('#outReqDtlTable').DataTable().ajax.reload();
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

	$('#btnOutReqDtlCancel').on('click', function(){
		$('#outReqDtlTable').DataTable().ajax.reload();
	});
	
	//*********************************************모달처리*********************************************//
	
	let now = new Date();
	let now_year = now.getFullYear();

	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal2').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable2').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});

	// 품목정보 목록조회
	$('#bizOrderAdmModalTable2 thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable2 thead'); // filter 생성
	let bizOrderAdmModalTable1 = $('#bizOrderAdmModalTable2').DataTable({
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
        	url : '/sc/bizOrderAdmLst',
			type : 'POST',
			data : {
				startDate 	: function() { return moment($('#bizStartDate1').val()).format('YYYYMMDD'); },
				endDate 	: function() { return moment($('#bizEndDate1').val()).format('YYYYMMDD'); },
				nowYear		: function() { return now_year; },
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
			//Project No.
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
			let theadHeight = parseFloat($('#bizOrderAdmModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnBizOrderAdmModalSearch1').on('click',function(){
		bizOrderAdmModalTable1.ajax.reload(function() {});
	});

	$('#bizOrderAdmModalTable1 tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable1.row(this).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#batchProjectNm').val(data.prjNm);
		$('#bizOrderAdmModal1').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#batchProjectNm').val(data.prjNm);
		$('#bizOrderAdmModal1').modal('hide');
		
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#batchProjectCd').val('');
		$('#batchProjectNm').val('');
	});


// 	// 수주처 검색 버튼 click
// 	function dealCorpAdmSel() {
// 		$('#dealCorpModal').modal('show');
// 	}
// 	$('#dealCorpModal').on('shown.bs.modal', function() {
// 		dealCorpModalTable.ajax.reload(function() {});
// 	});

// 	// 수주처 정보 목록 조회
// 	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
// 	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
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
// 			url : '<c:url value="/bm/dealCorpAdmList"/>',
// 			type : 'POST',
// 			data : {
// 				dealGubun : function(){ return $('#modalDealGubun').val();},
// 				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
// 			},
// 		},
//         rowId: 'idx',
// 		columns : [
// 			{ data: 'dealGubunNm', className : 'text-center'},
// 			{ data: 'dealCorpCd', className : 'text-center'},
// 			{ data: 'initial', className : 'text-center'},
// 			{ data: 'dealCorpNm', className : 'text-center'},
// 			{ data: 'representative', className : 'text-center'},
// 			{ data: 'companyNumber', className : 'text-center'},
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
// 			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
// 			let htmlHeight = parseFloat($('html').css('height'));
// 			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
// 			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 234)+'px');
			
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
// 				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
// 					$(api.column(colIdx).header()).index()
// 				);

// 				let title = $(cell).text();

// 				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
// 				$(cell).css('padding','2px');

// 				let cursorPosition = '';
				
// 				// On every keypress in this input
// 				$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 					api.column(colIdx).search(this.value, false, false, true).draw();
// 				}).on('keyup', function (e) {
// 					e.stopPropagation();
// 					$(this).trigger('keyupTrigger');
// 				});
// 			});
// 		},
// 	});
// 	// dataTable colReorder event
// 	dealCorpModalTable.on('column-reorder', function( e, settings, details ) {
// 		let api = dealCorpModalTable;
// 		api.columns().eq(0).each(function (colIdx) {
// 			$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
// 				api.column(colIdx).search(this.value, false, false, true).draw();
// 			}).on('keyup', function (e) {
// 				e.stopPropagation();
// 				$(this).trigger('keyupTrigger');
// 			});
// 		});
// 	});

// 	$('#btnDealCorpModalSearch').on('click',function(){
// 		dealCorpModalTable.ajax.reload(function() {});
// 	});

// 	$('#btnDealCorpModalPaste').on('click',function(){
// 		let data = dealCorpModalTable.row('.selected').data();
// 		$('#batchDealCorpIdx').val(data.idx);
// 		$('#batchDealCorpNm').val(data.dealCorpNm);
// 		$('#dealCorpModal').modal('hide');
// 	});
	
// 	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
// 		let data = dealCorpModalTable.row(this).data();
// 		$('#batchDealCorpIdx').val(data.idx);
// 		$('#batchDealCorpNm').val(data.dealCorpNm);
// 		$('#dealCorpModal').modal('hide');
// 	});
	
</script>

</body>
</html>
