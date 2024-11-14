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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">사용일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
				</div>
			</div>
			<!-- .table-responsive -->
			<div class="table-responsive">
				<table class="table table-bordered" id="outProdTable">
					<thead class="thead-light" >
						<tr>
							<th>사용일</th>
							<th>부서</th>
							<th>프로젝트코드</th>
							<th>담당자</th>
							<th>사용부서</th>
							<th>자재코드</th>
							<th>자재명</th>
							<th>규격</th>
							<th>MAKER</th>
							<th>단위</th>
							<th class="text-center">사용수량</th>
							<th>비고</th>
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
					
				</div>
				<div class="me-lg-auto"></div>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
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
								<th class="text-center">사용일</th>
								<td>
									<div class="form-group input-sub m-0"
										style="max-width: 100%">
										<input class="form-control" style="max-width: 100%" type="date" id="outDate" name="outDate" disabled />
									</div>
								</td>
								<th class="text-center">사용부서</th>
								<td>
									<select class="form-select w-auto h-100 me-3" id="searchOutDepartment" style="min-width: 100%;"></select>
								</td>
							</tr>
							<tr>
								<th class="text-center">품목선택</th>
								<td>
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
										<input type="text" class="form-control" style="max-width: 100%" id="itemNm" name="itemNm" disabled> 
										<input type="hidden" id="itemCd" name="itemCd">
										<button type="button" class="btn btn-primary input-sub-search inputGroup" style="padding: 1px 4px; margin-left: 0px;" name="btnItemCd" id="btnItemCd" onClick="itemCdSel();">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center">담당자</th>
								<td>
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
										<input type="text"class="form-control" style="max-width: 100%"id="outUserName" name="outUserName" disabled>
										<input type="hidden" class="form-control"style="max-width: 100%" id="outUserIdx"name="outUserIdx" disabled> 
										<button type="button" class="btn btn-primary input-sub-search inputGroup" style="padding: 1px 4px; margin-left: 0px;" name="btnUserSel" id="btnUserSel" onClick="userSel();">
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center">프로젝트코드</th>
								<td>
									<div style="min-width:150px; display: flex; flex-wrap: 1 1 auto;" class="input-group">
										<input type="text" class="form-control inputGroup" id="projectCd" disabled>
										<button type="button" class="btn btn-primary input-sub-search inputGroup" onclick="bizOrderPrjCdSel()" id="btnBizOrderPrjCdSel" name="btnBizOrderPrjCdSel" style="padding: 1px 4px; margin-left: 0px;">
										<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th></th>
								<td></td>
							</tr>
						</table>
					</div>
				</form>
				<div class="row" id="rightHeader" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
					</div>
					<div class="me-lg-auto"></div>
				</div>
				<form id="form2" enctype="multipart/form-data">
					<div class="table-responsive">
						<table class="table table-bordered" id="outProdSelTable">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>자재코드</th>
									<th>자재명</th>
									<th>규격</th>
									<th>MAKER</th>
									<th>단위</th>
									<th class="text-center align-middle">사용수량</th>
									<th>비고</th>
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
							<th class="text-center align-middle">입고처</th>
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
	let outSlipNoVal = '';

	var outUserIdx =  "${userIdx}";
	var outUserName =  "${userName}";
	var serverDateFrom	
	var deliveryPossibleDateCal =  moment().format('YYYY-MM-DD');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	
	$('#deliveryStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#deliveryEndDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
	var dealGubun = "";

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정

	let userDepartmentList = getCommonCode('시스템', '002'); //부서

	selectBoxAppend(userDepartmentList, 'searchOutDepartment', '', '1'); //부서
	
	uiProc(true);
	
    $('#saveBtnModalY').on('click',function() {
    	dealCorpNm = '';
    	$('#dealCorpNm').val('');
    	
    	uiProc(true);
		$('#form').each(function(){
        	this.reset();
        	$('input[type="hidden"]').val('');
    	});
		$('#outProdTable').DataTable().ajax.reload(function(){});
		$('#outProdSelTable').DataTable().clear().draw();
		
		$('#btnSave').attr('disabled',true);
		$('#btnCancle').attr('disabled',true);
		$('#btnAllCheck').prop("checked",false);
		$('input[name=check]').prop("checked",false);
    });

    // 목록
    $('#outProdTable thead tr').clone(true).addClass('filters').appendTo('#outProdTable thead'); // filter 생성
    let outProdTable = $('#outProdTable').DataTable({
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
            url: '<c:url value="/pm/outProdLst"/>',
            type: 'POST',
            data: {
            	startDate	: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate		: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
            },
        },
        rowId: 'itemCd',
        columns: [
        	{ data: 'outDate', className : 'text-center align-middle', name : "outDate", //체크박스
				render: function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data: 'outUserDepartment', 'className' : 'text-center align-middle' },
            { data: 'prjCd', 'className' : 'text-center align-middle' },
            { data: 'outUserName', 'className' : 'text-center align-middle' },
            { data: 'outDepartment', 'className' : 'text-center align-middle',
            	render : function(data, type, row, meta) {
                	var outDepartmentNm = '';
                	userDepartmentList.forEach(function(item) {
						if(data == item.commonCd){
							outDepartmentNm = item.commonNm;
						}
					});
					return outDepartmentNm;
            	}
            },
            { data: 'itemCd', 'className' : 'text-center align-middle' },
            { data: 'itemNm', 'className' : 'text-center align-middle' },
            { data: 'itemDc', 'className' : 'text-center align-middle' },
            { data: 'maker', 'className' : 'text-center align-middle' },
            { data: 'unitDc', 'className' : 'text-center align-middle' },
            { data: 'outQty', 'className' : 'text-end align-middle',
				render: function(data, type, row, meta) {
					return addCommas(parseFloat(data));
				}
            },
            { data: 'outDesc', 'className' : 'text-center align-middle' },
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
			let theadHeight = parseFloat($('#outProdTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#outProdTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outProdTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	outProdTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outProdTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#outProdTable tbody').on('click', 'tr', function() {

		$('#outProdSelTable').DataTable().clear().draw()
		
		var data = outProdTable.row(this).data();

		outSlipNoVal = data.outSlipNo;

		$('#outDate').val(moment(data.outDate).format('YYYY-MM-DD'));
		$('#searchOutDepartment').val(data.outDepartment);
		$('#itemNm').val(data.itemNm);
		$('#itemCd').val(data.itemCd);
		$('#projectCd').val(data.prjCd);
		$('#outUserIdx').val(data.outUserIdx);
		$('#outUserName').val(data.outUserName);
		
		outProdSelTable.row.add({
 			'outSlipNo'		:	outSlipNoVal,
 			'prjCd'			:	data.prjCd,
 			'itemCd'		:	data.itemCd,
 			'itemNm'		:	data.itemNm,
 			'itemDc'		:	data.itemDc,
 			'unitDc'		:	data.unitDc,
 			'maker'			:	data.maker,
 			'outQty'		:	data.outQty,
 			'outDesc'		:	data.outDesc
 		}).draw(false);

 		outProdSelTable.colReorder.disable();

 		$('#btnEdit').attr('disabled', false);
// 		$('#outProdTable').DataTable().ajax.reload( function () {});
	});
    
	    
	//발주 목록조회
	 $('#outProdSelTable thead tr').clone(true).addClass('filters').appendTo('#outProdSelTable thead'); // filter 생성
	let outProdSelTable = $('#outProdSelTable').DataTable({
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
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
// 		scrollCollapse: true,
		ajax : {
		 	url: '<c:url value="/pm/outProdLst"/>',
            type: 'POST',
            data: {
            	startDate	: function() { return '19900001'; },
				endDate		: function() { return '19900001'; },
            },
		},
		columns : [
			{ data: 'itemCd', 'className' : 'text-center align-middle', name: 'itemCd',
            	render : function(data, type, row, meta) {
                	if(data==null){
						return '';
                    } else return '<div name="itemCd" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
        	},
            { data: 'itemNm', 'className' : 'text-center align-middle', name: 'itemNm',
            	render : function(data, type, row, meta) {
            		if(data==null){
						return '';
                    } else return '<div name="itemNm" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
        	},
            { data: 'itemDc', 'className' : 'text-center align-middle', name: 'itemDc',
            	render : function(data, type, row, meta) {
            		if(data==null){
						return '';
                    } else return '<div name="itemDc" style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
            	}
            },
            { data: 'maker', 'className' : 'text-center align-middle', name: 'maker',
            	render: function(data, type, row, meta) {
            		if(data==null){
						return '';
                    } else return '<div name="maker" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
            },
            { data: 'unitDc', 'className' : 'text-center align-middle', name: 'unitDc',
            	render: function(data, type, row, meta) {
            		if(data==null){
						return '';
                    } else return '<div name="unitDc" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				} },
            { data: 'outQty', className : 'text-end align-middle', name: 'outQty', //발주수량
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="outQty" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';	
					} else return '<input type="text" onkeyup="numberFormat(this, \'int\')" style="min-width:100px;" name="outQty" value="0" class="form-control text-end"><span class="d-none"></span>';						
				}
			},
			{ data: 'outDesc', className : 'text-center align-middle', name: 'outDesc', //비고
				render : function(data, type, row, meta) {
					if(data!=null) {
						return '<div name="outDesc" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<input type="text" style="min-width:150px;" name="outDesc" class="form-control"><span class="d-none"></span>';						
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
			let theadHeight = parseFloat($('#outProdSelTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#outProdSelTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outProdSelTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	outProdSelTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outProdSelTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	$('#btnNew').on('click', function(){
		$('#outDate').val(moment().format('YYYY-MM-DD'));
		$('#searchOutDepartment').val('');
		$('#itemNm').val('');
		$('#itemCd').val('');
		$('#projectCd').val('');
		$('#outUserIdx').val(outUserIdx);
		$('#outUserName').val(outUserName);

		$('#outDate').attr('disabled', false);
		$('#searchOutDepartment').attr('disabled', false);
		$('#btnItemCd').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);
		$('#btnBizOrderPrjCdSel').attr('disabled', false);

		$('#outProdSelTable').DataTable().clear().draw();

		$('#btnNew').attr('disabled', false);
		$('#btnEdit').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
	});

	//수정버튼
	$('#btnEdit').on('click', function(){

		$('#outDate').attr('disabled', false);
		$('#searchOutDepartment').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);
		$('#btnBizOrderPrjCdSel').attr('disabled', false);

		$('#outProdSelTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if(index_td == outProdSelTable.column('outQty:name').index()) {
					let value = $(td).text();
					$(td).html('<input type="text" name="outQty" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" value="'+value+'">');
				} else if(index_td == outProdSelTable.column('outDesc:name').index()) {
					let value = $(td).text();
					$(td).html('<input type="text" style="min-width:150px;" name="outDesc" class="form-control" value='+value+'>');
				}
			});
		});

		$('#btnNew').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnSave').attr('disabled', false);
	});

	
	//발주등록 버튼 클릭시
	$('#btnSave').on('click',function(){
		let check = true;
		let dataArray = new Array();
		
		if (!$.trim($('#searchOutDepartment').val())) {
			$('#btnDealCorp').focus();
			toastr.warning('사용부서를 선택해 주세요.');
			check=false;
			return false;
		}
		if (!$.trim($('#outUserIdx').val())) {
			$('#btnUserSel').focus();
			toastr.warning('담당자를 선택해 주세요.');
			check=false;
			return false;
		}
		if(!$.trim($('#projectCd').val())){
			$('#btnBizOrderPrjCdSel').focus();
			toastr.warning('프로젝트코드를 선택해 주세요.');
			check=false;
			return false;
		}
		
		$('#outProdSelTable tbody tr').each(function(index,item){
			if ( $(this).find('td input[name=outQty]').val().replace(/,/g,'')*1 <= 0 ) {
				toastr.warning('사용수량을 입력해 주세요.');
				$(this).find('td input[name=outQty]').focus();
				check = false;
				return false;
			}
			
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			
			if($(this).find('td input[name=outQty]').val()!=0){

				//사용 기본정보
				let outDate = $('#outDate').val().replace(/-/g,'');
				let outDepartment = $('#searchOutDepartment').val();
				let outUserIdx = $('#outUserIdx').val();
				let projectCd = $('#projectCd').val();

				//사용 상세내역
				let outSlipNo = outProdSelTable.row($(item)).data().outSlipNo;
				let itemCd = outProdSelTable.row($(item)).data().itemCd;
				let itemNm = outProdSelTable.row($(item)).data().itemNm;
				let itemDc = outProdSelTable.row($(item)).data().itemDc;
				let unitDc = outProdSelTable.row($(item)).data().unitDc;
				let maker = outProdSelTable.row($(item)).data().maker;
				let outQty = $(td).eq(outProdSelTable.column('outQty:name').index()).find('input').val();
				let outDesc =  $(td).eq(outProdSelTable.column('outDesc:name').index()).find('input').val();


				var obj = new Object();
				
				obj.outDate = outDate.replace(/-/g,"");
				obj.outDepartment = outDepartment;
				obj.outUserIdx = outUserIdx;
				obj.prjCd = projectCd;
				
				obj.outSlipNo = outSlipNo;
				obj.itemCd = itemCd;
				obj.itemNm = itemNm;
				obj.itemDc = itemDc;
				obj.maker = maker;
				obj.unitDc = unitDc;
				obj.outQty = outQty.replaceAll(/,/g,'');
				obj.outDesc = outDesc;
				
		        dataArray.push(obj);
			}
		});

		if(check){
			$.ajax({
				url :'<c:url value="/pm/outProdWhsAdmIU"/>',
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
						uiProc(true);
						$('#form').each(function(){
				        	this.reset();
				        	$('input[type="hidden"]').val('');
				    	});
						$('#outProdTable').DataTable().ajax.reload(function(){});
						$('#outProdSelTable').DataTable().clear().draw();
						
						$('#btnSave').attr('disabled',true);
// 						$('#btnCancle').attr('disabled', true);
// 						$('#btnAllCheck').prop("checked", false);
// 						$('input[name=check]').prop("checked", false);

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


	//품목선택==================================================================================
	
	function itemCdSel() {
		$('#itemInfoAdmModal1').modal('show');
		setTimeout(function() {
			itemInfoAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	}

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


	$('#btnItemInfoAdmModalPaste1').on('click', function(){
		$('#my-spinner').show();

		for(var i=0; i<$('#itemInfoAdmModalTable1').DataTable().$('tr.selected').length; i++){
			
	 		let data = $('#itemInfoAdmModalTable1').DataTable().row($('#itemInfoAdmModalTable1').DataTable().$('tr.selected')[i]).data();

	 		let col_filter_text = [];
	 		$('#outProdSelTable_wrapper').find('.filters th').each(function(index, item) {
	 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
	 			col_filter_text.push($(item).find('input').val());
	 		});
	 		
	 		outProdSelTable.row.add({
	 			'outSlipNo'		:	null,
	 			'prjCd'			:	null,
	 			'itemCd'		:	data.itemCd,
	 			'itemNm'		:	data.itemNm,
	 			'itemDc'		:	data.itemDc,
	 			'unitDc'		:	data.unitDc,
	 			'maker'			:	data.maker,
	 			'price'			:	data.cost,
	 			'outQty'		:	null,
	 			'outDesc'		:	null
	 		}).draw(false);

	 		outProdSelTable.colReorder.disable();

	 		$('#btnSave').attr('disabled', false); // 저장 버튼
		}

		setTimeout(function() {
			$('#itemInfoAdmModal1').modal('hide');
			$('#my-spinner').hide();
		}, 100)
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
		$('#outUserIdx').val(data.idx);
		$('#outUserName').val(data.outUserName);
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
		$('#projectCd').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide'); 
	});
	
	$('#btnBizOrderAdmModalPaste').on('click',function(){
		let data = bizOrderAdmModalTable.row($('tr.selected')).data();
		$('#projectCd').val(data.prjCd);
		$('#bizOrderAdmModal').modal('hide');
		
	});
	
	//프로젝트코드====================================================================================	

	$(document).on('change', 'input[name=outQty]', function(){
		var tr = $(this).parent().parent();
		var price = tr.find('input[name=price]').val().replace(/,/g, '');
		var outQty = $(this).val().replace(/,/g, '');

		var supplyAmt = parseFloat(price) * parseFloat(outQty);
		var vat = parseFloat(supplyAmt) * 0.1;
		tr.find('input[name=supplyAmt]').val(addCommas(supplyAmt));
		tr.find('input[name=vat]').val(addCommas(vat));
		tr.find('div[name=totalAmt]').text(addCommas(parseFloat(supplyAmt)+parseFloat(vat)));
	});

	$(document).on('change', 'input[name=supplyAmt]', function(){
		var tr = $(this).parent().parent();
		var supplyAmt = $(this).val().replace(/,/g, '');
		var vat = parseFloat(supplyAmt) * 0.1;
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
		$('#outDate').attr('disabled',flag);
		$('#searchOutDepartment').attr('disabled',flag);
		$('#btnItemCd').attr('disabled',flag);
		$('#btnUserSel').attr('disabled',flag);
		$('#btnBizOrderPrjCdSel').attr('disabled',flag);
	}

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		outProdTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

// 	//확정수량 텍스트박스 커서 이동 (엔터키 클릭 시)
// 	$(document).on('keypress', 'input[name=outQty]', function(e) {
// 		if(e.which == 13) {
// 			let $this = $(this);
// 			let index = $this.closest('tr').index();
// 			let nextIndex = index + 1;
// 			setTimeout(function(){
// 			    if(nextIndex < outProdSelTable.rows().count()) {
// 			    	outProdSelTable.row(nextIndex).nodes().to$().find('input[name=outQty]').focus();
// 			    	setTimeout(function(){
// 			    		outProdSelTable.row(nextIndex).nodes().to$().find('input[name=outQty]').select();
// 				    },100)
// 			    } else {
// 			    	outProdSelTable.row(0).nodes().to$().find('input[name=outQty]').focus();
// 			    	setTimeout(function(){
// 			    		outProdSelTable.row(0).nodes().to$().find('input[name=outQty]').select();
// 			    	},100)
// 			    }
// 			},100)
// 		}
// 	});

</script>   	
</body>
</html>
