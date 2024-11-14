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
																		  grid-template-columns: 4fr 4px 3fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<%-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100"><spring:message code="userStateCd" text="default text" /></label>
					<select class="form-select w-auto h-100 me-3" id="SearchUserStateCd"></select> --%>
					<input type="text" class="form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnMatrlOrdSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnMatrlOrdEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="matrlTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No</th>
							<th class="text-center align-middle" style="max-width:100px;">원단코드</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">가로</th>
							<th class="text-center align-middle">세로</th>
							<th class="text-center align-middle" style="max-width:120px;">적정재고</th>
							<th class="text-center align-middle" style="max-width:120px;">®</th>
							<th class="text-center align-middle">매입처</th>
							<th class="text-center align-middle" style="max-width:90px;">사용유무</th>
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
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-100">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
				  	<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1"><spring:message code="baseInfo" text="default text" /></button>
				  	</div>
					<div class="tab-content" id="nav-tabContent">
						<!-- 탭1 기본정보 -->
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<table class="table table-bordered p-0 m-0">
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="35%">
									</colgroup>
									<tr>
										<th class="text-center align-middle"><span style="color: #ff0000;">*</span>품목구분</th>
										<td class="text-center align-middle">
											<select class="form-select inputGroup" id="itemGubun" disabled>
											</select>
										</td>
										<th class="text-center align-middle"><span style="color: #ff0000;">*</span>원단코드</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="matrlCd" disabled>
										</td>
									</tr>
									<tr>										
										<!-- <th class="text-center align-middle"><span style="color: #ff0000;">*</span>결</th>
										<td class="text-center align-middle">
											<select class="form-select inputGroup" id="lawGubun" disabled></select>
										</td> -->
										<th class="text-center align-middle"><span style="color: #ff0000;">*</span>재질</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="paperType" disabled>
										</td>
										<th class="text-center align-middle">매입처</th>
										<td class="text-center align-middle">
											<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">												
												<input type="text" class="form-control inputNm" id="customerNm" disabled>
												<button type="button" class="inputGroup nameDel" id="btnDealCorpDelete" style="background-color: transparent;border-color: transparent;
																													position: absolute;top: 0;right:0;margin: 1px 23px;margin-left: 0px;
																													border: none;" disabled>
													<i class="fa-solid fa-xmark"></i>
												</button>												
												<input type="hidden" id="customerIdx" class="inputIdx">
												<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary input-sub-search inputGroup" 
													id="customerModalBtn" disabled="disabled">
													<i class="fa-solid fa-magnifying-glass"></i>
												</button>
											</div>
										</td>
									</tr>
									<!-- <tr>										
										<th class="text-center align-middle">평량</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="amountAvg" disabled>
										</td>
										<th class="text-center align-middle">사이즈</th>
										<td class="text-center align-middle">
											<select class="form-select inputGroup" id="matrlSize" disabled>
											</select>
										</td>
									</tr> -->
									<tr>		
										<th class="text-center align-middle">가로</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="sizeX" disabled>
										</td>								
										<th class="text-center align-middle">세로</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="sizeY" disabled>
										</td>
									</tr>
									<tr>
										<th class="text-center align-middle">참고사항</th>
										<td colspan="3" class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="matrlNote" disabled>
										</td>
									</tr>
									<tr>										
										<th class="text-center align-middle">적정재고</th>
										<td class="text-center align-middle">
											<input type="text" style="text-align:right;" class="form-control inputGroup" id="extraStock" onkeyup="numberFormat(this,'int')" disabled>
										</td>
										<th class="text-center align-middle"><span style="color: #ff0000;">*</span>사용여부</th>
										<td class="text-center align-middle">
											<select class="form-select inputGroup" id="useYn" disabled>
												<option value="Y" selected>사용</option>
												<option value="N">미사용</option>
											</select>
										</td>
									</tr>
									<tr>										
										<th class="text-center align-middle">여분기준</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="etc1" disabled>
										</td>
										<th class="text-center align-middle">기타1</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="etc2" disabled>
										</td>
									</tr>
									<tr>										
										<th class="text-center align-middle">기타2</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="etc3" disabled>
										</td>
										<th class="text-center align-middle">기타3</th>
										<td class="text-center align-middle">
											<input type="text" class="form-control inputGroup" id="etc4" disabled>
										</td>
									</tr>
								</table>
							</div>
						</div>
						<!-- 탭1 기본정보 끝 -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 재질 중복 경고 -->
<div class="modal fade" id="paperTypeCheckModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				중복 재질이 있습니다.<br>
				이대로 진행 하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnPaperTypeCheckModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnPaperTypeCheckModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
			</div>
		</div>
	</div>
</div>
<!-- 재질 중복 경고 모달 끝 -->

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
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

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
			$('#page').css('grid-template-columns', '4fr 4px 3fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 3fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '4fr 4px 3fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '4fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');
	WM_init('ordEdit');
	
	// 공통코드 조회
	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	let itemGubunList = getCommonCode('일반', '002'); //품목구분
	let lawGubunList = getCommonCode('일반', '011'); //수량단위
	//let paperTypeList = getCommonCode('일반', '020'); //재질
	let matrlSizeList = getCommonCode('일반', '030'); //사이즈

	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	selectBoxAppend(itemGubunList, 'itemGubun', '', '2');
	selectBoxAppend(lawGubunList, 'lawGubun', '', '2');
	//selectBoxAppend(paperTypeList, 'paperType', '', '2');
	selectBoxAppend(matrlSizeList, 'matrlSize', '', '2');

	let delStatus = '';
	
	// 자재정보 목록조회
	$('#matrlTable thead tr').clone(true).addClass('filters').appendTo('#matrlTable thead'); // filter 생성
	let matrlTable = $('#matrlTable').DataTable({
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
		rowReorder: {
			enable: false,
			dataSrc: 'progressOrder',
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/matrlInfoListAll"/>',
			type : 'GET',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'progressOrder', className : 'text-center align-middle'},
			{ data: 'matrlCd', className : 'text-center align-middle'},
			{ data: 'paperType', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else{
						return '-';
					}
				}
			},//재질
			{ data: 'sizeX', className : 'text-center align-middle'},//가로
			{ data: 'sizeY', className : 'text-center align-middle'},//세로
			{ data: 'extraStock', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return addCommas(parseFloat(data));
					} else{
						return '-';
					}
				}
			},//적정재고
			{ data: 'extraStock', className : 'text-end align-middle',
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						let retrunValue = parseInt(data/500) + "R" + parseInt(data%500);
						return retrunValue;
					} else{
						return '0R0';
					}
				}
			},//적정재고r
			{ data: 'dealCorpNm', className : 'text-center align-middle'},//매입처
			{ data: 'useYn', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					let status = '-';
					if(data == 'Y'){
						status = '사용';
					} else if(data == 'N') {
						status = '미사용';
					}
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+status+'</div>';
				}	
			},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
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
		order : [[0,'asc']],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#matrlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			//progressOrder
			for(var i=0;i<data.length;i++) {
				let tr = $('#' + table_id + ' tbody').find('tr').eq(i);
				if( !isEmptyCheck(matrlTable.row(tr).data())){
					matrlTable.row(tr).data().progressOrder = i+1;
					$(tr).find('td').eq(0).html(i+1);
				}
			}

			//입고가 다된경우 회색으로 표시
			for(var i=0;i<api.data().count();i++) {
				let data = api.row(i).data();
				let node = api.row(i).node();
				
				let ordQty = parseInt(data.purchaseOrdQty); // 주문수량(제품)
				let cutQty = parseInt(data.cutQty); // 절수
				let eaQty = parseInt(data.eaQty); // 개수
				let extraQty = parseInt(data.extraQty); // 여유분
				let extraPackQty = parseInt(data.extraPackQty); // 포장단위여분
				
				//let printPressQty = Math.ceil(ordQty/eaQty);
				let printPressQty = Math.ceil(ordQty/(cutQty*eaQty)) * cutQty;
				let pressQty = Math.ceil((printPressQty + extraQty)/cutQty + extraPackQty);
				pressQty -= parseInt(data.inQty != null && data.inQty != '' ? data.inQty : 0);
				if(pressQty <= 0){
					$(node).addClass('bg-secondary bg-gradient bg-opacity-10');
				} 
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#matrlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#matrlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	matrlTable.on('column-reorder', function( e, settings, details ) {
		let api = matrlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#matrlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//원단 순서 변경되었을 때 
	/* matrlTable.on( 'row-reorder', function ( e, diff, changes ) {
		if(diff.length != 0){
			$('#btnMatrlOrdSave').attr('disabled',false);
		}
	}); */

	$('#btnMatrlOrdEdit').on('click',function(){
		if($('#searchAll').val() == ''){
			let trigger = true;
			$('#matrlTable_wrapper').find('.filters').find('input').each(function(){
				if( $(this).val() != '' ) {
					trigger = false;
				} 
			});
			if(trigger){
				$('#matrlTable_wrapper').find('.filters').find('input').val('');
				$('#searchAll').val('');
				$('#btnMatrlOrdEdit').attr('disabled',true);
				$('#btnMatrlOrdSave').attr('disabled',false);
				//필터 잠금
				$('#matrlTable_wrapper').find('.filters th').each(function(index, item) {
					$(item).find('input').attr('disabled', true); // 검색 필터 disabled
				});
				$('#searchAll').attr('disabled',true);
				WM_action_ON('ordEdit', 'workingWarningModal');

				$('#btnNew').attr('disabled', true); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
								
				matrlTable.rowReorder.enable();	
			} else {
				toastr.warning('상세 필터를 해제 후 시도하세요.');
			}
		} else {
			toastr.warning('통합검색 필터를 해제 후 시도하세요.');
			return false;
		}
		
	});
	
	$('#btnMatrlOrdSave').on('click',function(){
		let updateList = [];
		$('#matrlTable tbody tr').each(function(index){
			let data = matrlTable.row(index).data();
			let obj = {};
			obj.idx = data.idx;
			obj.progressOrder = data.progressOrder;
			updateList.push(obj);
		});

		$.ajax({
			url: '<c:url value="/bm/matrlInfoOrdUpdate"/>',
            type: 'POST',
            //async: false,
            data: {
            	'updateList' : 	JSON.stringify(updateList)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('원단순서가 변경되었습니다.');
					$('#btnMatrlOrdSave').attr('disabled',true);
					$('#btnMatrlOrdEdit').attr('disabled',false);
					//필터 잠금
					$('#matrlTable_wrapper').find('.filters th').each(function(index, item) {
						$(item).find('input').attr('disabled', false); // 검색 필터 disabled
					});
					matrlTable.ajax.reload();
					matrlTable.rowReorder.disable();	
					WM_action_OFF('ordEdit');
					$('#searchAll').attr('disabled',false);
					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', true); // 수정 버튼
					$('#btnDel').attr('disabled', true); // 삭제 버튼
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

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		$('#matrlTable_wrapper').find('.filters').find('input').val('');
		matrlTable.columns().search('').draw();
		$('#searchAll').val('');
		
		setTimeout(function() {
			matrlTable.rows('.selected').deselect();
			matrlTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#my-spinner').hide();
			}, 100);
		}, 100 );
		
	});

	// 원단목록 click
	let matrlIdx = 0;
	$('#matrlTable tbody').on('click','tr', function() {
		let idx = matrlTable.row(this).data().idx;
		matrlIdx = idx;
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}
		let data;
		$.ajax({
			url: '<c:url value="/bm/matrlInfoSel"/>',
            type: 'GET',
            //async: false,
            data: {
                'idx'	:	idx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					data = res.data;


					$('.inputGroup').attr('disabled', true); // 입력항목
					$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
					$('#btnSignImage').attr('disabled', true); // 사진선택 버튼

					if(!getWM('ordEdit','state')){ //순서조정중이 아니었을때
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', false); // 수정 버튼
						$('#btnDel').attr('disabled', false); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼

						//$('#btnPrcssWorkerSave').attr('disabled',false);//공정작업자 저장버튼
						
						$('#btnDealCorpNew').attr('disabled',false);
						$('#btnDealCorpSave').attr('disabled',true);
						$('#btnDealCorpDel').attr('disabled',false);
					}	
					
					
					$('#itemGubun').val(data.itemGubun);
					$('#matrlCd').val(data.matrlCd);
					$('#lawGubun').val(data.lawGubun);
					$('#paperType').val(data.paperType);
					$('#amountAvg').val(data.amountAvg);
					$('#matrlSize').val(data.matrlSize);
					$('#sizeX').val(data.sizeX);
					$('#sizeY').val(data.sizeY);
					$('#extraStock').val(addCommas(parseFloat(data.extraStock)));

					if( $('#extraStock').val() == 'NaN' ){
						$('#extraStock').val('');
					}

					$('#customerIdx').val(data.dealCorpIdx);
					$('#customerNm').val(data.dealCorpNm);
					
					$('#matrlNote').val(data.matrlNote);
					$('#useYn').val(data.useYn);
					$('#etc1').val(data.etc1);
					$('#etc2').val(data.etc2);
					$('#etc3').val(data.etc3);
					$('#etc4').val(data.etc4);

				} else if(res.result == 'fail') {
					toastr.warning(res.message);
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
		}		
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				matrlTable.row('#'+idx).select();
				$(matrlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnDel').attr('disabled', true); // 삭제 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
				$('#btnMatrlOrdEdit').attr('disabled',false);
				$('#btnMatrlOrdSave').attr('disabled',true);
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
				$('#btnMatrlOrdEdit').attr('disabled',false);
				$('#btnMatrlOrdSave').attr('disabled',true);
			}
			
			return false;
		}
	});

	// 신규 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록
		
		WM_action_ON('new', 'workingWarningModal');

		$('#tab1Nav').trigger('click');
		
		$('#userAdmin').attr('checked',false);
		$('#userSign').attr('checked',false);
		$('.inputGroup').val('');

		$('#customerIdx').val('');
		$('#customerNm').val('');
		
		$('.inputGroup').attr('disabled', false); // 입력항목
		$('#btnUserIdCheck').attr('disabled', false); // 중복확인 버튼
		$('#btnSignImage').attr('disabled', false); // 사진선택 버튼
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼

		$('#useYn').val('Y');
		$('#matrlCd').val('자동채번');
		$('#extraStock').val('0');

		$('#btnMatrlOrdEdit').attr('disabled',true);
		$('#btnMatrlOrdSave').attr('disabled',true);

		matrlTable.rows('.selected').deselect();
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');

		if($('#itemGubun').val() == '') {
			toastr.warning('품목구분을 선택해주세요.');
			$('#itemGubun').focus();
			return false;
		}

		if($('#matrlCd').val() == '') {
			toastr.warning('원단코드를 입력해주세요.');
			$('#matrlCd').select();
			return false;
		}

		/* if($('#matrlNm').val() == '') {
			toastr.warning('원단명을 입력해주세요.');
			$('#matrlNm').select();
			return false;
		} */
		
		if($('#lawGubun').val() == '') {
			toastr.warning('결을 선택해주세요.');
			$('#lawGubun').focus();
			return false;
		}
		
		if($('#paperType').val() == '') {
			toastr.warning('재질을 선택해주세요.');
			$('#paperType').focus();
			return false;
		}

		if($('#useYn').val() == '') {
			toastr.warning('사용여부를 선택해주세요.');
			$('#useYn').focus();
			return false;
		}
		
		if($('#extraStock').val() == ''){
			toastr.warning('적정재고를 입력해주세요.');
			$('#extraStock').focus();
			return false;
		}
		
		if($('#extraStock').val().length > 50){
			toastr.warning('적정재고를 쉼표 포함 50자 이하로 입력해주세요.');
			$('#extraStock').focus();
			return false;
		}
		$('#my-spinner').show();
		setTimeout(function(){
			let checkItemIdx;
			let check = false;
			if(saveType == 'insert'){
				checkItemIdx =  '';
			} else {
				checkItemIdx =  matrlTable.row('.selected').data().idx;
			}
			//재질 중복체크
			$.ajax({
				url: '<c:url value="/bm/paperTypeDupCheck"/>',
	            type: 'POST',
	            async: false,
	            data: {
		            'idx'				:	function(){return checkItemIdx;},	
	            	'paperType'			:	$('#paperType').val(),
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						check = true;
					} else if(res.result == 'fail') {
						$('#paperTypeCheckModal').modal('show');
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			}); 	

			if(check){
				// 등록할 경우에
				if(saveType == 'insert') {	
					$.ajax({
						url: '<c:url value="/bm/matrlInfoInsert"/>',
			            type: 'POST',
			            //async: false,
			            data: {
				            'dealCorpIdx'		:	$('#customerIdx').val(),
				            'itemGubun'			:	$('#itemGubun').val(),
				            'matrlCd'			:	$('#matrlCd').val(),
				            'lawGubun'			:	$('#lawGubun').val(),
				            'paperType'			:	$('#paperType').val(),
				            'amountAvg'			:	$('#amountAvg').val(),
				            'matrlSize'			:	$('#matrlSize').val(),
				            'sizeX'				:	$('#sizeX').val(),
				            'sizeY'				:	$('#sizeY').val(),
				            'extraStock'		:	$('#extraStock').val().replaceAll(/,/g,''),
				            'matrlNote'			:	$('#matrlNote').val(),
				            'useYn'				:	$('#useYn').val(),
				            'etc1'				:	$('#etc1').val(),
				            'etc2'				:	$('#etc2').val(),
				            'etc3'				:	$('#etc3').val(),
				            'etc4'				:	$('#etc4').val(),
				            'pageGubun'			:	function(){ return 'bmsc0090';},
			            },
			            beforeSend: function() {
			            	$('#my-spinner').show();
			            },
						success : function(res) {
							if (res.result == "ok") { //응답결과
								toastr.success('신규 저장되었습니다.');

								//$('#btnSearch').trigger('click'); // 조회버튼 click
								let idx = res.idx;
								$('#matrlTable_wrapper').find('.filters').find('input').val('');
								matrlTable.columns().search('').draw();
								matrlTable.rows('.selected').deselect();
								matrlTable.ajax.reload(function() {
									matrlTable.row('#'+idx).select();
									$(matrlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
								});
								WM_action_OFF('new');

								$('#userPw').val('');
								$('#userPwCheck').val('');
								
								$('.inputGroup').attr('disabled', true); // 입력항목
								$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
								$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
								
								$('#btnNew').attr('disabled', false); // 신규 버튼
								$('#btnSave').attr('disabled', true); // 저장 버튼
								$('#btnEdit').attr('disabled', true); // 수정 버튼
								$('#btnDel').attr('disabled', true); // 삭제 버튼
								$('#btnCancel').attr('disabled', true); // 취소 버튼

								$('#btnMatrlOrdEdit').attr('disabled',false);
								$('#btnMatrlOrdSave').attr('disabled',true);
							} else if(res.result == 'fail') {
								toastr.warning(res.message);
							} else {
								toastr.error(res.message);
							}
							$('#my-spinner').hide();
						}
					});
				} else { // 수정할 경우에
					let idx = matrlTable.row('.selected').data().idx;
					$.ajax({
						url: '<c:url value="/bm/matrlInfoUpdate"/>',
			            type: 'POST',
			            //async: false,
			            data: {
			                'idx'				:	idx,
				            'dealCorpIdx'		:	$('#customerIdx').val(),
			                'itemGubun'			:	$('#itemGubun').val(),
				            'matrlCd'			:	$('#matrlCd').val(),
				            'lawGubun'			:	$('#lawGubun').val(),
				            'paperType'			:	$('#paperType').val(),
				            'amountAvg'			:	$('#amountAvg').val(),
				            'matrlSize'			:	$('#matrlSize').val(),
				            'sizeX'				:	$('#sizeX').val(),
				            'sizeY'				:	$('#sizeY').val(),
				            'extraStock'		:	$('#extraStock').val().replaceAll(/,/g,''),
				            'matrlNote'			:	$('#matrlNote').val(),
				            'useYn'				:	$('#useYn').val(),
				            'etc1'				:	$('#etc1').val(),
				            'etc2'				:	$('#etc2').val(),
				            'etc3'				:	$('#etc3').val(),
				            'etc4'				:	$('#etc4').val(),
				            'pageGubun'			:	function(){ return 'bmsc0090';},
			            },
			            beforeSend: function() {
			            	$('#my-spinner').show();
			            },
						success : function(res) {
							if (res.result == "ok") { //응답결과
								toastr.success('수정 저장되었습니다.');
								//$('#btnSearch').trigger('click'); // 조회버튼 click

								WM_action_OFF('edit');

								
								$('#userPw').val('');
								$('#userPwCheck').val('');
								
								$('.inputGroup').attr('disabled', true); // 입력항목
								$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
								$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
								
								$('#btnNew').attr('disabled', false); // 신규 버튼
								$('#btnSave').attr('disabled', true); // 저장 버튼
								$('#btnEdit').attr('disabled', true); // 수정 버튼
								$('#btnDel').attr('disabled', true); // 삭제 버튼
								$('#btnCancel').attr('disabled', true); // 취소 버튼

								let idx = matrlTable.row('.selected').data().idx;
								matrlTable.rows('.selected').deselect();
								matrlTable.ajax.reload(function() {
									matrlTable.row('#'+idx).select();
									$(matrlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
								});
								$('#btnMatrlOrdEdit').attr('disabled',false);
								$('#btnMatrlOrdSave').attr('disabled',true);
								
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
		},50);
	});

	// 수정 버튼 click
	$('#btnEdit').on('click', function() {
		$('#btnSave').data('saveType','update'); // 저장 방식 -> 수정

		WM_action_ON('edit', 'workingWarningModal');
		
		$('.inputGroup').attr('disabled', false); // 입력항목
		$('#btnUserIdCheck').attr('disabled', false); // 중복확인 버튼
		$('#btnSignImage').attr('disabled', false); // 사진선택 버튼
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼

		$('#btnMatrlOrdEdit').attr('disabled',true);
		$('#btnMatrlOrdSave').attr('disabled',true);
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		delStatus = 'matrl';
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		if(delStatus == 'matrl'){
			let idx = matrlTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/bm/matrlInfoDelete"/>',
	            type: 'POST',
	            //async: false,
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
	
						$('#btnSearch').trigger('click'); // 조회버튼 click
	
						$('#userAdmin').attr('checked',false);
						$('#userSign').attr('checked',false);
						$('.inputGroup').val('');
						
						$('.inputGroup').attr('disabled', true); // 입력항목
						$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
						$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
	
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
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

	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');

		WM_action_OFF('new');
		WM_action_OFF('edit');

		$('.inputGroup').attr('disabled', true); // 입력항목
		$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
		$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#btnMatrlOrdEdit').attr('disabled',false);
		$('#btnMatrlOrdSave').attr('disabled',true);
	});

	$('#btnDealCorpModalPaste').on('click',function(){
		if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let idx = dealCorpModalTable.row('.selected').data().idx;

		$('#customerNm').val(dealCorpModalTable.row('.selected').data().dealCorpNm);
		$('#customerIdx').val(idx);
		
		$('#dealCorpModal').modal('hide');
	});
	
	//고객사모달
 	$('#customerModalBtn').on('click',function(){
		$('#dealCorpModal').modal('show');
		setTimeout(function() {
			dealCorpModalTable.ajax.reload(function() {});
		}, 200);
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 230)+'px');
			
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

	$('#btnPaperTypeCheckModalY').on('click',function(){
		let saveType = $('#btnSave').data('saveType');
		// 등록할 경우에
		if(saveType == 'insert') {	
			$.ajax({
				url: '<c:url value="/bm/matrlInfoInsert"/>',
	            type: 'POST',
	            //async: false,
	            data: {
		            'dealCorpIdx'		:	$('#customerIdx').val(),
		            'itemGubun'			:	$('#itemGubun').val(),
		            'matrlCd'			:	$('#matrlCd').val(),
		            'lawGubun'			:	$('#lawGubun').val(),
		            'paperType'			:	$('#paperType').val(),
		            'amountAvg'			:	$('#amountAvg').val(),
		            'matrlSize'			:	$('#matrlSize').val(),
		            'sizeX'				:	$('#sizeX').val(),
		            'sizeY'				:	$('#sizeY').val(),
		            'extraStock'		:	$('#extraStock').val().replaceAll(/,/g,''),
		            'matrlNote'			:	$('#matrlNote').val(),
		            'useYn'				:	$('#useYn').val(),
		            'etc1'				:	$('#etc1').val(),
		            'etc2'				:	$('#etc2').val(),
		            'etc3'				:	$('#etc3').val(),
		            'etc4'				:	$('#etc4').val(),
		            'pageGubun'			:	function(){ return 'bmsc0090';},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						//$('#btnSearch').trigger('click'); // 조회버튼 click
						let idx = res.idx;
						$('#matrlTable_wrapper').find('.filters').find('input').val('');
						matrlTable.columns().search('').draw();
						matrlTable.rows('.selected').deselect();
						matrlTable.ajax.reload(function() {
							matrlTable.row('#'+idx).select();
							$(matrlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
						});
						
						WM_action_OFF('new');

						$('#userPw').val('');
						$('#userPwCheck').val('');
						
						$('.inputGroup').attr('disabled', true); // 입력항목
						$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
						$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼

						$('#btnMatrlOrdEdit').attr('disabled',false);
						$('#btnMatrlOrdSave').attr('disabled',true);
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else { // 수정할 경우에
			let idx = matrlTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/bm/matrlInfoUpdate"/>',
	            type: 'POST',
	            //async: false,
	            data: {
	                'idx'				:	idx,
		            'dealCorpIdx'		:	$('#customerIdx').val(),
	                'itemGubun'			:	$('#itemGubun').val(),
		            'matrlCd'			:	$('#matrlCd').val(),
		            'lawGubun'			:	$('#lawGubun').val(),
		            'paperType'			:	$('#paperType').val(),
		            'amountAvg'			:	$('#amountAvg').val(),
		            'matrlSize'			:	$('#matrlSize').val(),
		            'sizeX'				:	$('#sizeX').val(),
		            'sizeY'				:	$('#sizeY').val(),
		            'extraStock'		:	$('#extraStock').val().replaceAll(/,/g,''),
		            'matrlNote'			:	$('#matrlNote').val(),
		            'useYn'				:	$('#useYn').val(),
		            'etc1'				:	$('#etc1').val(),
		            'etc2'				:	$('#etc2').val(),
		            'etc3'				:	$('#etc3').val(),
		            'etc4'				:	$('#etc4').val(),
		            'pageGubun'			:	function(){ return 'bmsc0090';},
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수정 저장되었습니다.');
						//$('#btnSearch').trigger('click'); // 조회버튼 click

						WM_action_OFF('edit');

						
						$('#userPw').val('');
						$('#userPwCheck').val('');
						
						$('.inputGroup').attr('disabled', true); // 입력항목
						$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
						$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼

						let idx = matrlTable.row('.selected').data().idx;
						matrlTable.rows('.selected').deselect();
						matrlTable.ajax.reload(function() {
							matrlTable.row('#'+idx).select();
							$(matrlTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
						});
						$('#btnMatrlOrdEdit').attr('disabled',false);
						$('#btnMatrlOrdSave').attr('disabled',true);
						
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
	
 	//X버튼 눌렀을 때
	$(document).on('click','.nameDel',function(){
		/* prev-이전요소(name을 가르키는 input이어야함),next-다음요소(idx를 가르키는 hidden input이어야함) */
		if($(this).prev().hasClass('inputNm')){
			$(this).prev().val('');
		}
		if($(this).next().hasClass('inputIdx')){
			$(this).next().val('');
		}
	});
</script>

</body>
</html>
