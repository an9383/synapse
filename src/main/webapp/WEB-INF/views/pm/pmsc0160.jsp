<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>

<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 6fr 4px 4fr;">
<!------------------------ .left-list ----------------------->
<div id="leftcol">
	<div class="container-fluid h-100" style="padding: 5px;">
		<div class="row" id="leftHeader" style="padding-bottom: 5px;">
			<div class="d-flex align-items-center d-flex">
			</div>
			<div class="me-lg-auto"></div>
			<div class="btn-group" role="group" aria-label="Small button group">
				<button type="button" class="btn btn-outline-light w-auto" id="btnMove">발주추가</button>
			</div>
		</div>
		<!-- .table-responsive -->
		<div class="table-responsive">
			<table class="table table-bordered" id="itemInfoAdmTable">
				<thead class="thead-light" >
					<tr>
						<th class="text-center"><input class="form-check-input" type="checkbox" id="admAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
						<th>구분1</th>
						<th>구분2</th>
						<th>품번</th>
						<th>품명</th>
						<th>규격</th>
						<th>MAKER</th>
						<th>단위</th>
						<th class="text-center">안전재고수량</th>
						<th>현재고</th>
					</tr>
				</thead>
			</table>
		</div>
		<!-- /.table-responsive -->
	</div>
</div>
<!-- /.left-list -->
<div id="dragbar" onmousedown="StartDrag()"></div>
<!----------------------- .right-sidebar 등록,수정 ----------------------->
<div id="rightcol">
	<div class="container-fluid h-100" style="padding: 5px;">
		<!--오른쪽 등록 부분 상단 버튼 영역-->
		<div class="d-flex align-items-center justify-content-end w-100" style="padding-bottom: 5px;">
			<div class="btn-group" role="group" aria-label="Small button group">
				<button type="button" class="btn btn-outline-light w-auto" id="btnEdit">개별발주수정</button>
			</div>
			<div class="me-lg-auto"></div>
			<div class="btn-group" role="group" aria-label="Small button group">
				<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
			</div>
		</div>
		<!--/오른쪽 등록 부분 상단 버튼 영역-->
		<div id="myTabContent">
			<form id="form">
				<div class="table-responsive">
					<table class="table table-sm table-bordered mb-2"
						id="purchaseOrderAdmTable">
						<colgroup>
							<col width="20%">
							<col width="27%">
							<col width="25%">
							<col width="28%">
						</colgroup>
						<tr>
							<th class="text-center">발주번호</th>
							<td>
								<div class="row">
									<input class="form-control" type="text" id="orderDtlNoVal" name="orderDtlNoVal" style="max-width: 100%" disabled>
								</div>
							</td>
							<th class="text-center">거래처명</th>
							<td>
								<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
									<input type="text" class="form-control" style="max-width: 100%" id="dealCorpNm" name="dealCorpNm" disabled> 
									<input type="hidden" id="dealCorpIdx" name="dealCorpIdx">
									<button type="button" class="btn btn-primary input-sub-search inputGroup" style="padding: 1px 4px; margin-left: 0px;" name="btnDealCorp" id="btnDealCorp" onClick="dealCorpAdmSel();">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
						</tr>
						<tr>
							<th class="text-center">발주자</th>
							<td>
								<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
									<input type="text"class="form-control" style="max-width: 100%"id="userName" name="userName" disabled>
									<input type="hidden" class="form-control"style="max-width: 100%" id="userIdx"name="userIdx" disabled> 
									<button type="button" class="btn btn-primary input-sub-search inputGroup" style="padding: 1px 4px; margin-left: 0px;" name="btnUserSel" id="btnUserSel" onClick="userSel();">
										<i class="fa-solid fa-magnifying-glass"></i>
									</button>
								</div>
							</td>
							<th class="text-center">발주일자</th>
							<td>
								<div class="form-group input-sub m-0"
									style="max-width: 100%">
									<input class="form-control" style="max-width: 100%" type="date" id="deliveryOrderDate" name="deliveryOrderDate" disabled />
								</div>
							</td>
							
						</tr>
							<tr>
							<th class="text-center">비고</th>
							<td colspan="3"><input class="form-control" type="text" id="orderDtlDesc" style="max-width: 100%" disabled/></td>
						</tr>
					</table>
				</div>
			</form>
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<button type="button" class="btn btn-success float-left mr-1" id="btnCancle" disabled>
					<span class="oi oi-arrow-left">발주취소</span>
				</button>
				</div>
				<div class="me-lg-auto"></div>
				<div class="row">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">납기요청일</label>
					<input class="form-control w-auto h-100 me-2" style="width:97px;" max="9999-12-31" type="date" id="selectDay" disabled/>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">프로젝트코드</label>
					<div class="input-group w-auto h-100 me-2">
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="applyDate" disabled>전체적용</button>
					</div>
					<button class="btn btn-warning d-none"
						id="btnEditConfirmLoading" type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span>처리중
					</button>
				</div>
			</div>
			<form id="form2" enctype="multipart/form-data">
				<div class="table-responsive">
					<table class="table table-bordered" id="purchaseOrderDtlTable">
						<colgroup>
							<col width="4%">
							<col width="10%">
							<col width="20%">
							<col width="25%">
							<col width="13%">
							<col width="13%">
							<col width="15%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th><input type="checkbox" class="form-check-input" id="btnAllCheck" style="min-width: 17px;min-height: 17px;"></th>
								<th>구분1</th>
								<th>구분2</th>
								<th>품번</th>
								<th>품명</th>
								<th>규격</th>
								<th>MAKER</th>
								<th>단위</th>
								<th class="text-center align-middle">단가</th>
								<th class="text-center align-middle">발주수량</th>
								<th class="text-center align-middle">공급가액</th>
								<th class="text-center align-middle">부가세</th>
								<th class="text-center align-middle">합계</th>
								<th>납기요청일</th>
								<th class="text-center align-middle">프로젝트코드</th>
								
							</tr>
						</thead>
					</table>
				</div>
			</form>
		</div>
	</div>
	<!-- ===/.right-sidebar 등록,수정===  -->
</div>
<!-- /.row -->
</div>
<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog" aria-labelledby="saveBtnModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
        		</button>
      		</div>
      		<div class="modal-body">
      			<h6>발주등록을 새로 하시겠습니까?</h6> 
      		</div>
      		<div class="modal-footer">
      			<button type="button" class="btn btn-primary" id="saveBtnModalY" data-dismiss="modal">예</button>
      			<button type="button" class="btn btn-danger" id="saveBtnModalN" data-dismiss="modal">아니요</button>
      		</div>
    	</div>
  	</div>
</div>
<!-- 개별발주 모달 -->
<div class="modal fade" id="purchaseIndivModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					개별발주 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="purchaseIndivModalPaste">
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
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주일</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="deliveryStartDate"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="deliveryEndDate"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="btn-group me-3" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnConfirmY">발주확정</button>
							<button type="button" class="btn btn-outline-danger w-auto" id="btnConfirmN">확정취소</button>
					</div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="purchaseIndivModalSearch"><i class="fa-regular fa-clipboard"></i></button>
							<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="purchaseIndivModalBtnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="purchaseIndivModalTable">
					<thead class="table-light">
						<tr>
							<th>확정여부</th>
							<th>발주번호</th>
							<th>구분1</th>
							<th>구분2</th>
							<th>자재코드</th>
							<th>자재명</th>
							<th>규격</th>
							<th>MAKER</th>
							<th>단위</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">공급가액</th>
							<th class="text-center align-middle">부가세</th>
							<th class="text-center align-middle">합계</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th>납기요청일</th>
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
					프로젝트 조회
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
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
						</tr>
					</thead>
				</table>
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
			let page = document.getElementById("page");
			let leftcol = document.getElementById("leftcol");
			let rightcol = document.getElementById("rightcol");
			let dragbarWidth = 4;
			let leftcolMinWidth = 500; // leftcol 최소사이즈
			$('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			});
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

			console.log(Math.max(rightColWidth, rightcolMinWidth));
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
	
// 	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
// 			$('#page').css('grid-template-columns', '6fr 4px 4fr');
// 			$('#leftcol').removeClass('d-none');
// 			$('#rightcol').removeClass('d-none');
// 		dataTableDrawAll(); // dataTable 전체 reload
// 	});
	
// 	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
// 			$('#page').css('grid-template-columns', '1fr');
// 			$('#leftcol').removeClass('d-none');
// 			$('#rightcol').addClass('d-none');
// 		dataTableDrawAll(); // dataTable 전체 reload
// 	});
	
</script>
<script>
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';

	var tableIdx=null;
	var orderDtlNoVal = null;
	var poSeq = null;
	
	let itemGubunList = ['004'];
	var mainGubun = "";
	var itemCdVal = null;
	var dealCorpNm = '';

	var userIdx =  "${userIdx}";
	var userName =  "${userName}";
	var serverDateFrom	
	var deliveryPossibleDateCal =  moment().format('YYYY-MM-DD');
	
	$('#deliveryStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#deliveryEndDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));
	var dealGubun = "";

	//선택박스 처리
// 	selectBoxAppend(itemGubunCode, "itemGubun", "004", "1");
// 	selectBoxAppend(mainGubunCode, "mainGubun", "", "1"); 
	let dealGubunList 		= getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList 	= getCommonCode('시스템', '015'); // 거래상태

	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태

	uiProc(true);
	
    $('#saveBtnModalY').on('click',function() {
    	dealCorpNm = '';
    	$('#dealCorpNm').val('');
    	
    	uiProc(true);
		$('#form').each(function(){
        	this.reset();
        	$('input[type="hidden"]').val('');
    	});
		$('#itemInfoAdmTable').DataTable().ajax.reload(function(){});
		$('#purchaseOrderDtlTable').DataTable().clear().draw();
		
		$('#btnSave').attr('disabled',true);
		$('#btnCancle').attr('disabled',true);
		$('#btnAllCheck').prop("checked",false);
		$('input[name=check]').prop("checked",false);
    });

    // 목록
    $('#itemInfoAdmTable thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmTable thead'); // filter 생성
    let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
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
	    scrollY: '80vh',
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
                individualYn	:	'Y'
            },
        },
        rowId: 'itemCd',
        columns: [
        	{ className : 'text-center align-middle', name : "admCheckBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="admCheckBox" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
            { data: 'itemGubun1Nm', 'className' : 'text-center align-middle' },            
            { data: 'itemGubun2Nm', 'className' : 'text-center align-middle' },
            { data: 'itemCd', 'className' : 'text-center align-middle' },
            { data: 'itemNm', 'className' : 'text-center align-middle' },
            { data: 'itemDc', 'className' : 'text-center align-middle' },
            { data: 'maker', 'className' : 'text-center align-middle' },
            { data: 'unitDc', 'className' : 'text-center align-middle' },
            { data: 'safetyStock', 'className' : 'text-end align-middle',
				render: function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
            },
            { 'className' : 'text-end align-middle',
				render: function(data, type, row, meta) {
					return '';
				}
            },
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
                title: '품목관리',	 charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
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
        drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemInfoAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemInfoAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	itemInfoAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemInfoAdmTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	function dealCorpNmDelClick(){
		$('#dealCorpIdx').val('');
		$('#dealCorpNm').val('');
		
		dealCorpNm = '';
		$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
	}
	
	//거래처명 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	function dealCorpAdmSel() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		var dealArr = ['002','003'];
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4')
				.DataTable(
						{	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
									+ "<'row'<'col-sm-12'tr>>"
									+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
							language : lang_kor,
							paging : true,
							info : true,
							ordering : true,
							processing : true,
							autoWidth : false,
							scrollX : false,
							lengthChange : true,
							async : false,
							pageLength : 10,
							ajax : {
								url : '<c:url value="/bm/dealCorpDataList"/>',
								type : 'GET',
								data : {
									'dealArr' :  function(){return dealArr;},
								},
							},
							rowId : 'dealCorpSeq',
							columns : [ 
							{
								data : 'dealCorpNm'
							}, 
							{
								data : 'dealCorpIdx'
							}, 
							{
								data : 'presidentNm'
							}, 
							{
								data : 'repreItem'
							}, 
							{
								data : 'corpNo'
							} 
							],
							columnDefs : [ {
								"defaultContent" : "-",
								"targets" : "_all",
								"className" : "text-center"
							} ],
							order : [ [ 0, 'asc' ] ],
							buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			$('#dealCorpIdx').val(data.dealCorpIdx);
			$('#dealCorpNm').val(data.dealCorpNm);
			$('#dealCorpPopUpModal4').modal('hide');
			
			dealCorpNm = data.dealCorpIdx;
			$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	

	//모든 체크박스 선택
	$('#admAllCheckBox').on('click',function(){
		if($('#admAllCheckBox').prop("checked")){
			$('input:checkbox[name=admCheckBox]').prop("checked",true);
		}else{
			$('input:checkbox[name=admCheckBox]').prop("checked",false);
		}
	});

	//납기일 전체 적용 버튼 클릭
	$('#applyDate').on('click', function() {
		if($('#selectDay').val()==''||$('#selectDay').val()==null){
			toastr.warning("날짜를 선택해주세요.");
			return false;
		}
		$('#purchaseOrderDtlTable tbody tr').each(function(index, item){
 			if($(this).find('td input[name=check]').is(':checked')){
 				$(this).find('td input[name=deliveryPossibleDate]').val($('#selectDay').val());
 				$(this).find('td input[name=projectCd]').val($('#batchProjectCd').val());
 	 		}
		});
		toastr.success("적용되었습니다.");
	});
	

	// 발주추가버튼 클릭
	$('#btnMove').on('click', function() {
		/* if (!$('#dealCorpIdx').val()) {
			toastr.warning('발주할 거래처를 선택해 주세요.');
			$('#dealCorpNmBtn').focus();
			return false;
		} */
		
		if($('input:checkbox[name=admCheckBox]').is(":checked")==false){
			toastr.warning("발주등록할 항목을 선택해주세요.");
			return false;
		}

		//화면처리
		uiProc(false);
		$('#purchaseOrderDtl').DataTable().clear().draw();
 		
		if(purchaseOrderDtlTable.data().count() == 0){
			$('#form').each(function(){
	        	this.reset();
	    	});

			$('#orderDtlNoVal').val("자동생성");
			$('#deliveryOrderDate').val(deliveryPossibleDateCal);
			$('#userIdx').val(userIdx);
			$('#userName').val(userName);
			$('#btnSave').attr('disabled',false);	
			$('#btnCancle').attr('disabled',false);
			$('#selectDay').val(deliveryPossibleDateCal);
		}

 		$('#itemInfoAdmTable tbody tr').each(function(index, item) {	
			var data = itemInfoAdmTable.row(this).data();
			if ($(this).find('td input[name=admCheckBox]').is(":checked") == true) {
				
				$('#purchaseOrderDtlTable').DataTable().row.add(
				{
					"orderDtlNo"			:	null,
					"itemGubun1Idx"			:	data.itemGubun1Idx,
					"itemGubun2Idx"			:	data.itemGubun2Idx,
					"itemGubun1Nm"			:	data.itemGubun1Nm,
					"itemGubun2Nm"			:	data.itemGubun2Nm,
					"itemCd" 				: 	data.itemCd,
					"itemNm" 				: 	data.itemNm,
					"itemDc" 				: 	data.itemDc,
					"maker"					:	data.maker,
					"unitDc"				:	data.unitDc,
					"price"					:	data.cost,
					'supplyAmt'				:	'0',
		 			'vat'					:	'0',
		 			'pronjectCd'			:	'',
					"orderDtlQty"			:	'0',
					"deliveryPossibleDate" 	: 	'',
				}).draw(true);				
			}
 		});  

		$('#btnAllCheck').prop("checked",false);
 		//$('input[name=check]').prop("checked",false); 
	}); 
    
	    
	//발주 목록조회
	 $('#purchaseOrderDtlTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderDtlTable thead'); // filter 생성
	let purchaseOrderDtlTable = $('#purchaseOrderDtlTable').DataTable({
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
		pageLength : -1,
		fixedHeader: true,
		scrollY: "66vh",
	 	scrollX: true,
	 	select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
// 		scrollCollapse: true,
		ajax : {
			url : '<c:url value="/pm/purchaseOrderAdmInsertLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return '19000101'; },
				endDate		: function() { return '19000102'; },
				requestGubun: function() { return '000';},
				status		: function() { return '004';},
			}
		},
		columns : [
			{//체크박스
				render : function(data, type, row, meta) {
					return '<input class="form-check-input " type="checkbox" name="check" style="margin: 0px; width: 17px; height: 17px;">';
				},
				'className' : 'text-center align-middle'
			},
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
				render: function(data, type, row, meta) {
					var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx">'+row['itemGubun1Idx']+'</div>';
					html += '<div style="white-space:nowrap;" name="itemGubun1Nm">'+data+'</div>';
					return html;
				}
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx">'+row['itemGubun2Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm">'+data+'</div>';
						return html;
					} else {
						return '';
					}
				}
			},
			{ data: 'itemCd', 'className' : 'text-center align-middle', name: 'itemCd',
            	render : function(data, type, row, meta) {
            		return '<div name="itemCd" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
        	},
            { data: 'itemNm', 'className' : 'text-center align-middle', name: 'itemNm',
            	render : function(data, type, row, meta) {
            		return '<div name="itemNm" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
        	},
            { data: 'itemDc', 'className' : 'text-center align-middle', name: 'itemDc',
            	render : function(data, type, row, meta) {
            		return '<div name="itemDc" style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
            },
            { data: 'maker', 'className' : 'text-center align-middle', name: 'maker',
            	render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div name="maker" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
            },
            { data: 'unitDc', 'className' : 'text-center align-middle' },
            { data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="price" class="form-control text-end" value="'+addCommas(parseInt(data))+'"><span class="d-none"></span>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="price" class="form-control text-end" value="0"><span class="d-none"></span>';						
				}
			},
            { data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="orderDtlQty" class="form-control text-end" value="'+addCommas(parseInt(data))+'"><span class="d-none"></span>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="orderDtlQty" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{ data: 'supplyAmt', className : 'text-end align-middle', name: 'supplyAmt', //공급가액
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="supplyAmt" class="form-control text-end" value="'+addCommas(parseInt(data))+'"><span class="d-none"></span>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="supplyAmt" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{ data: 'vat', className : 'text-end align-middle', name: 'vat', //부가세
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="vat" class="form-control text-end" value="'+addCommas(parseInt(data))+'"><span class="d-none"></span>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="vat" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{
				className : 'text-end align-middle',
				render : function(data, type, row, meta) { //합계
					if(row['supplyAmt'] != null && row['vat'] != null){
						var totalAmt = parseInt(row['supplyAmt']) + parseInt(row['vat']);
						return '<div name="totalAmt" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(totalAmt))+'</div>';		
					} else return '<div name="totalAmt" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">0</div>';							
				}
			},
			{//납기요청일
				data : 'deliveryPossibleDate', 'className' : 'text-center align-middle', name: 'deliveryPossibleDate',
				render : function(data, type, row, meta){
					return '<input class="form-control" type="date" style="text-align:center" value="'+deliveryPossibleDateCal+'" name="deliveryPossibleDate">';
				},
			},
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					let html = '';
					html += '<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
					html += '<input type="text" class="form-control inputGroup" name="projectCd" disabled>';
					html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">';
					html += '<i class="fa-solid fa-magnifying-glass"></i>';
					html += '</button></div>';
					return html;
				}
			},
		],
		columnDefs: [
			//{ "targets": [9,10] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        ],
	    order: [],
	    buttons: [],
	    drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#purchaseOrderDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	purchaseOrderDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseOrderDtlTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	
	//모든 체크박스 선택
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
		}
	})


	// 발주취소버튼 클릭
	$('#btnCancle').on('click', function() {
		var array=[];
		var i=0;
		$('#purchaseOrderDtlTable tbody tr').each(function(index,item){
 			if($(this).find('td input[name=check]').is(':checked')){
 				array[i]=index;
 				i++;
 	 		}
		});

		$('#purchaseOrderDtlTable').DataTable().rows(array).remove().draw();
		$('#btnAllCheck').prop('checked',false);
	});

	//수정버튼
	$('#btnEdit').on('click', function(){
		$('#purchaseIndivModal').modal('show');
		setTimeout(function() {
			purchaseIndivModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#purchaseIndivModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});

	//발주 목록조회
	$('#purchaseIndivModalTable thead tr').clone(true).addClass('filters').appendTo('#purchaseIndivModalTable thead'); // filter 생성
	let purchaseIndivModalTable = $('#purchaseIndivModalTable').DataTable({
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
		pageLength : -1,
		fixedHeader: true,
		scrollY: "68vh",
	 	scrollX: true,
	 	select: {
            style: 'os',
            toggleable: false,
            items: 'row',
            info: false
        },
//		scrollCollapse: true,
		ajax : {
			url : '<c:url value="/pm/purchaseIndividualLst"/>',
			type : 'POST',
			data : {
				startDate	: function() { return $('#deliveryStartDate').val().replaceAll(/-/g, ''); },
				endDate		: function() { return $('#deliveryEndDate').val().replaceAll(/-/g, ''); },
			}
		},
		columns : [
			{ data: 'confirmYn', 'className' : 'text-center align-middle', name: 'confirmYn',
				render : function(data, type, row, meta) {
					if(data == 'Y'){
						return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">확정</div>';
					} else return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미확정</div>';
	           	}
			},
			{ data: 'orderDtlNo', 'className' : 'text-center align-middle', name: 'orderDtlNo',
	           	render : function(data, type, row, meta) {
	           		return '<div name="orderDtlNo" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
	           	}
	        },
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
				render: function(data, type, row, meta) {
					var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx">'+row['itemGubun1Idx']+'</div>';
					html += '<div style="white-space:nowrap;" name="itemGubun1Nm">'+data+'</div>';
					return html;
				}
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx">'+row['itemGubun2Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm">'+data+'</div>';
						return html;
					} else {
						return '';
					}
				}
			},
			{ data: 'itemCd', 'className' : 'text-center align-middle', name: 'itemCd',
           	render : function(data, type, row, meta) {
           		return '<div name="itemCd" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
           	}
       	},
           { data: 'itemNm', 'className' : 'text-center align-middle', name: 'itemNm',
           	render : function(data, type, row, meta) {
           		return '<div name="itemNm" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
           	}
       	},
           { data: 'itemDc', 'className' : 'text-center align-middle', name: 'itemDc',
           	render : function(data, type, row, meta) {
           		return '<div name="itemDc" style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
           	}
           },
           { data: 'maker', 'className' : 'text-center align-middle', name: 'maker',
           	render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div name="maker" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
           },
           { data: 'unitDc', 'className' : 'text-center align-middle' },
           { data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="price" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="price" class="form-control text-end" value="0"><span class="d-none"></span>';						
				}
			},
           { data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="orderDtlQty" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="orderDtlQty" value="0" class="form-control text-end"><span class="d-none"></span>';
				}
			},
			{ data: 'supplyAmt', className : 'text-end align-middle', name: 'supplyAmt', //공급가액
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="supplyAmt" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="supplyAmt" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{ data: 'vat', className : 'text-end align-middle', name: 'vat', //부가세
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="vat" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="vat" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{
				className : 'text-end align-middle',
				render : function(data, type, row, meta) { //합계
					return '<div name="totalAmt" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">0</div>';							
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle', name: 'projectCd',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="projectCd" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';	
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
			{//납기요청일
				data : 'deliveryPossibleDate', 'className' : 'text-center align-middle', name: 'deliveryPossibleDate',
				render : function(data, type, row, meta){
					if(data!=null) {
						return '<div name="deliveryPossibleDate" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';	
					} else return '<input class="form-control" type="date" style="text-align:center" value="'+deliveryPossibleDateCal+'" name="deliveryPossibleDate">';
				},
			},
		],
		columnDefs: [
			//{ "targets": [9,10] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
       ],
	    order: [],
	    buttons: [],
	    drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#purchaseIndivModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#purchaseIndivModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseIndivModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
   });
	// dataTable colReorder event
	purchaseIndivModalTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseIndivModalTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#purchaseIndivModalTable tbody').on('click', 'tr', function(){
		$('#purchaseIndivModalBtnDel').attr('disabled', false); // 삭제 버튼
	});

	$('#purchaseIndivModalSearch').on('click', function(){
		purchaseIndivModalTable.ajax.reload(function() {});
	});

	$('#purchaseIndivModalPaste').on('click',function(){
		if($('#purchaseIndivModalTable').DataTable().row('.selected').length == 0){
			toastr.warning('행을 선택해주세요.');
			return false;
		}
		
		let data = purchaseIndivModalTable.row($('tr.selected')).data();
		$('#orderDtlNoVal').val(data.orderDtlNo);
		$('#dealCorpIdx').val(data.dealCorpIdx);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#userIdx').val(data.deliveryUserIdx);
		$('#userName').val(data.deliveryUserNm);
		$('#deliveryOrderDate').val(moment(data.deliveryOrderDate).format('YYYY-MM-DD'));
		$('#orderDtlDesc').val(data.orderDtlDesc);

		$('#purchaseOrderDtlTable').DataTable().row.add(
				{
					"orderDtlNo"			:	data.orderDtlNo,
					"itemGubun1Idx"			:	data.itemGubun1Idx,
					"itemGubun2Idx"			:	data.itemGubun2Idx,
					"itemGubun1Nm"			:	data.itemGubun1Nm,
					"itemGubun2Nm"			:	data.itemGubun2Nm,
					"itemCd" 				: 	data.itemCd,
					"itemNm" 				: 	data.itemNm,
					"itemDc" 				: 	data.itemDc,
					"maker"					:	data.maker,
					"unitDc"				:	data.unitDc,
					"price"					:	data.price,
					'supplyAmt'				:	data.supplyAmt,
		 			'vat'					:	data.vat,
		 			'pronjectCd'			:	data.pronjectCd,
					"orderDtlQty"			:	data.orderDtlQty,
					"deliveryPossibleDate" 	: 	data.deliveryPossibleDate,
				}).draw(true);	

		//화면처리
		uiProc(false);
		$('#btnSave').attr('disabled',false);	
		$('#btnCancle').attr('disabled',false);
		$('#selectDay').val(deliveryPossibleDateCal);
		
		$('#purchaseIndivModal').modal('hide');
	});

	
	//발주등록 버튼 클릭시
	$('#btnSave').on('click',function(){
		let check = true;
		let dataArray = new Array();
		
		if (!$.trim($('#dealCorpIdx').val())) {
			$('#btnDealCorp').focus();
			toastr.warning('거래처를 선택해 주세요.');
			check=false;
			return false;
		}
		if (!$.trim($('#userIdx').val())) {
			$('#btnUserSel').focus();
			toastr.warning('발주자를 선택해 주세요.');
			check=false;
			return false;
		}
		if(!$.trim($('#deliveryOrderDate').val())){
			$('#deliveryOrderDate').focus();
			toastr.warning('발주일자를 선택해 주세요.');
			check=false;
			return false;
		}
		
		$('#purchaseOrderDtlTable tbody tr').each(function(index,item){
			if ( $(this).find('td input[name=price]').val().replace(/,/g,'') == '' ) {
				toastr.warning('단가를 입력해 주세요.');
				$(this).find('td input[name=orderDtlQty]').focus();
				check = false;
				return false;
			}
			if ( $(this).find('td input[name=orderDtlQty]').val().replace(/,/g,'')*1 <= 0 ) {
				toastr.warning('발주수량을 입력해 주세요.');
				$(this).find('td input[name=orderDtlQty]').focus();
				check = false;
				return false;
			}
			if($(this).find('td input[name=deliveryPossibleDate]').val()==''){
				toastr.warning('납기요청일을 입력해주세요.');
				$(this).find('td input[name=deliveryPossibleDate]').focus();
				check = false;
				return false;
			}
			
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			
			if($(this).find('td input[name=orderDtlQty]').val()!=0){

				//발주 기본정보
				let dealCorpIdx = $('#dealCorpIdx').val();
				let orderUserIdx = $('#userIdx').val();
				let deliveryOrderDate = $('#deliveryOrderDate').val().replace(/-/g,'');
				let orderDtlDesc = $('#orderDtlDesc').val();

				//발주 상세내역
				let orderDtlNo = purchaseOrderDtlTable.row($(item)).data().orderDtlNo;
				let itemGubunIdx = $(td).find('div[name=itemGubunIdx]').text();
				let itemGubun1Idx = $(td).find('div[name=itemGubun1Idx]').text();
				let itemGubun2Idx = $(td).find('div[name=itemGubun2Idx]').text();
				let itemCd = $(td).find('div[name=itemCd]').text();
				let price = $(td).eq(purchaseOrderDtlTable.column('price:name').index()).find('input').val();
				let orderDtlQty = $(td).eq(purchaseOrderDtlTable.column('orderDtlQty:name').index()).find('input').val();
				let supplyAmt = $(td).eq(purchaseOrderDtlTable.column('supplyAmt:name').index()).find('input').val();
				let vat = $(td).eq(purchaseOrderDtlTable.column('vat:name').index()).find('input').val();
				let projectCd = $(td).eq(purchaseOrderDtlTable.column('projectCd:name').index()).find('input').val();
				let deliveryPossibleDate = $(td).eq(purchaseOrderDtlTable.column('deliveryPossibleDate:name').index()).find('input').val();
				
				var obj = new Object();

				obj.orderDtlNo = orderDtlNo;
				obj.dealCorpIdx = dealCorpIdx;
				obj.orderUserIdx = orderUserIdx;
				obj.deliveryOrderDate = deliveryOrderDate.replace(/-/g,"");
				obj.orderDtlDesc = orderDtlDesc;
				
				obj.itemGubunIdx = itemGubunIdx;
				obj.itemGubun1Idx = itemGubun1Idx;
				obj.itemGubun2Idx = itemGubun2Idx;
				obj.itemCd = itemCd;
				obj.price = price.replaceAll(/,/g,'');
				obj.orderDtlQty = orderDtlQty.replaceAll(/,/g,'');
				obj.supplyAmt = supplyAmt.replaceAll(/,/g,'');
				obj.vat = vat.replaceAll(/,/g,'');
				obj.projectCd = projectCd;
				obj.deliveryPossibleDate = deliveryPossibleDate.replace(/-/g,"");
				
		        dataArray.push(obj);
			}
		});

		if(check){
			$.ajax({
				url :'<c:url value="/pm/purchaseOrderDtlIndividualIU"/>',
				type : 'POST',
				data: {
	                'jsonArray'	:	JSON.stringify(dataArray)
	            },
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
				    	dealCorpNm = '';
				    	$('#dealCorpNm').val('');
						uiProc(true);
						$('#form').each(function(){
				        	this.reset();
				        	$('input[type="hidden"]').val('');
				    	});
						$('#itemInfoAdmTable').DataTable().ajax.reload(function(){});
						$('#purchaseOrderDtlTable').DataTable().clear().draw();
						
						$('#btnSave').attr('disabled',true);
						$('#btnCancle').attr('disabled', true);
						$('#btnAllCheck').prop("checked", false);
						$('input[name=check]').prop("checked", false);

						toastr.success('등록되었습니다.');
					} else if (res.result == "fail") {
						toastr.error(res.message);
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
				}
			});
		} 
		
		
	});

	// 수주별발주 삭제 버튼 click
	$('#purchaseIndivModalBtnDel').on('click', function() {
		if($('#purchaseIndivModalTable').DataTable().row('.selected').length == 0){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}

		let data = purchaseIndivModalTable.row('.selected').data();

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
			$('#purchaseOrderDtlTable tbody tr').each(function(index,item){
				if($(this).hasClass('selected')){
					let orderDtlNo = purchaseIndivModalTable.row($(item)).data().orderDtlNo;
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
		
									//purchaseOrderAdmTable.ajax.reload(function(){},false);
									purchaseIndivModalTable.row('.selected').remove().draw(false);
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
		}
	});

	//거래처 팝업 시작
   	var dealCorpPopUpTable;
	//거래처 검색 버튼 click
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

	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row(this).data();
		$('#dealCorpIdx').val(data.idx);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});


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
		$('#userIdx').val(data.idx);
		$('#userName').val(data.userName);
		$('#userModal').modal('hide');
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
		$('#purchaseOrderDtlTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row($('tr.selected')).data();
		$('#purchaseOrderDtlTable').DataTable().$('tr.selected').find('input[name=projectCd]').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
		
	});
	
	//프로젝트코드====================================================================================	
	
	$(document).on('change', 'input[name=price]', function(){
		var tr = $(this).parent().parent();
		var price = $(this).val().replace(/,/g, '');
		var orderDtlQty = tr.find('input[name=orderDtlQty]').val().replace(/,/g, '');
		
		var supplyAmt = parseFloat(price) * parseFloat(orderDtlQty);
		var vat = parseFloat(supplyAmt) * 1 / 10;
		tr.find('input[name=supplyAmt]').val(addCommas(supplyAmt));
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=orderDtlQty]', function(){
		var tr = $(this).parent().parent();
		var price = tr.find('input[name=price]').val().replace(/,/g, '');
		var orderDtlQty = $(this).val().replace(/,/g, '');

		var supplyAmt = parseFloat(price) * parseFloat(orderDtlQty);
		var vat = parseFloat(supplyAmt) * 1 / 10;
		tr.find('input[name=supplyAmt]').val(addCommas(supplyAmt));
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=supplyAmt]', function(){
		var tr = $(this).parent().parent();
		var supplyAmt = $(this).val().replace(/,/g, '');
		var vat = parseFloat(supplyAmt) * 1 / 10;
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=vat]', function(){
		var tr = $(this).parent().parent();
		var supplyAmt = tr.find('input[name=supplyAmt]').val().replace(/,/g, '');
		var vat = $(this).val().replace(/,/g, '');
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});
		
	function uiProc(flag) {
		$("#orderDtlDesc").attr("disabled", flag);
		$('#btnDealCorp').attr('disabled',flag);
		$('#btnUserSel').attr('disabled',flag);
		$('#deliveryOrderDate').attr('disabled',flag);
		$('#selectDay').attr('disabled',flag);
		$('#applyDate').attr('disabled',flag);
	}


	//발주확정
	$('#btnConfirmY').on('click', function(){
		if($('#purchaseIndivModalTable').DataTable().row('.selected').length == 0){
			toastr.warning('발주 확정할 행을 선택해주세요.');
			return false;
		}

		confirmUpd('Y');
	});

	//발주확정 취소
	$('#btnConfirmN').on('click', function(){
		if($('#purchaseIndivModalTable').DataTable().row('.selected').length == 0){
			toastr.warning('확정 취소할 행을 선택해주세요.');
			return false;
		}

		confirmUpd('N');
	});


	function confirmUpd(confirmYn){
		let state = true;
		let confirmArray = [];
		let itemCostArray = [];

		if(confirmYn == 'Y'){
			$('#purchaseIndivModalTable tbody').find('tr').each(function(index, item) {
				if($(this).hasClass('selected')){
					var inOutGubun = purchaseIndivModalTable.row($(item)).data().inOutGubun;
	
// 					if(inOutGubun != 'P'){
// 						toastr.warning('발주상태인 데이터만 확정할 수 있습니다.');
// 						state = false;
// 						return false;
// 					}
				}
			});
		} else if(confirmYn == 'N'){
			$('#purchaseIndivModalTable tbody').find('tr').each(function(index, item) {
				if($(this).hasClass('selected')){
					var inOutGubun = purchaseIndivModalTable.row($(item)).data().inOutGubun;
					var confirmYnVal = purchaseIndivModalTable.row($(item)).data().confirmYn;
	
					if(confirmYnVal != 'Y'){
						toastr.warning('발주확정된 데이터만 취소할 수 있습니다.');
						state = false;
						return false;
					} else if(inOutGubun != 'P'){
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
			$('#purchaseIndivModalTable tbody').find('tr').each(function(index, item) {
				let node = $(item);
				let tr = $(node).parent().parent();
				let td = $(item).find('td');
	
				if($(this).hasClass('selected')){
					let orderDtlNo = purchaseIndivModalTable.row($(item)).data().orderDtlNo;

					let obj = new Object();
					obj.orderDtlNo 			= orderDtlNo;
					obj.confirmYn			= confirmYn;
	
					confirmArray.push(obj);

					//단가 저장/삭제
					if(purchaseIndivModalTable.row($(item)).data().price != purchaseIndivModalTable.row($(item)).data().recentPrice){
						let itemCdVal1 			= purchaseIndivModalTable.row($(item)).data().itemCd;
						let deliveryOrderDate 	= purchaseIndivModalTable.row($(item)).data().deliveryOrderDate.replace(/-/g, '');
						let dealCorpCd 			= purchaseIndivModalTable.row($(item)).data().dealCorpCd;
						let price 				= purchaseIndivModalTable.row($(item)).data().price;
						
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
						
						purchaseIndivModalTable.ajax.reload(function() {
							$('#purchaseIndivModalTable_wrapper').find('.filters th').each(function(index, item) {
								$(item).find('input').attr('disabled', false);// 검색 필터 enable
							});
						});
						purchaseIndivModalTable.colReorder.enable();
	
// 						$('#purchaseIndivModal').modal('hide');
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

	//전체적용 프로젝트코드
	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal1').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});
	
	// 품목정보 목록조회
	$('#bizOrderAdmModalTable1 thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable1 thead'); // filter 생성
	let bizOrderAdmModalTable1 = $('#bizOrderAdmModalTable1').DataTable({
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
				startDate : function() { return moment($('#bizStartDate1').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#bizEndDate1').val()).format('YYYYMMDD'); },
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
		$('#bizOrderAdmModal1').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#bizOrderAdmModal1').modal('hide');
		
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#batchProjectCd').val('');
	});

// 	//확정수량 텍스트박스 커서 이동 (엔터키 클릭 시)
// 	$(document).on('keypress', 'input[name=orderDtlQty]', function(e) {
// 		if(e.which == 13) {
// 			let $this = $(this);
// 			let index = $this.closest('tr').index();
// 			let nextIndex = index + 1;
// 			setTimeout(function(){
// 			    if(nextIndex < purchaseOrderDtlTable.rows().count()) {
// 			    	purchaseOrderDtlTable.row(nextIndex).nodes().to$().find('input[name=orderDtlQty]').focus();
// 			    	setTimeout(function(){
// 			    		purchaseOrderDtlTable.row(nextIndex).nodes().to$().find('input[name=orderDtlQty]').select();
// 				    },100)
// 			    } else {
// 			    	purchaseOrderDtlTable.row(0).nodes().to$().find('input[name=orderDtlQty]').focus();
// 			    	setTimeout(function(){
// 			    		purchaseOrderDtlTable.row(0).nodes().to$().find('input[name=orderDtlQty]').select();
// 			    	},100)
// 			    }
// 			},100)
// 		}
// 	});

</script>   	
</body>
</html>
