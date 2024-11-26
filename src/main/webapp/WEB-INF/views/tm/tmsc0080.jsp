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
																		  grid-template-columns: 6fr 4px 4fr;">
	<!-- #main============================================================== -->
			<div id="leftcol">
				<div class="container-fluid h-100" style="padding: 5px;">
					<div class="row" id="leftHeader" style="padding-bottom: 5px;">
						<div class="d-flex align-items-center d-flex">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">등록일자</label>
							<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
							<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
							<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
						</div>
						<div class="me-lg-auto"></div>
						<div class="d-flex align-items-center justify-content-end">
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
							</div>
						</div>
					</div>
					<div class="table-responsive" style="overflow-x:hidden;">
						<table id="matrlFaultyTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">이동수량</th>
									<th class="text-center">등록일자</th>
									<th class="text-center">사유</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div><!-- /.left-list -->
			<div id="dragbar" onmousedown="StartDrag()"></div>
			<div id="rightcol">
				<div class="container-fluid h-100" style="padding: 5px;" id="formBox">
					<div class="d-flex align-items-center justify-content-end w-100" style="padding-bottom: 5px;">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
							<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose" disabled><i class="fa-solid fa-caret-right"></i></button>
						</div>
					</div>
                    <!--/오른쪽 등록 부분 상단 버튼 영역-->
                    <!--====================TAB-UI=======================-->
					<!-- .card-header -->
					<div class="card-body p-0">
							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered p-0 m-0">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>	
											<th class="text-center">품번</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control" id="itemCd" name="itemCd" disabled>
													<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selItem" onclick="itemSel()" style="padding: 1px 4px; margin-left: 0px;" disabled>
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</div>
											</td>
											<th class="text-center">품명</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="">
													<input type="text" placeholder="" class="form-control" id="itemNm" name="itemNm" disabled>
												</div>
											</td>
										</tr>
										<tr>	
											<th class="text-center" id="moveType">이동수량</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control inputGroup" id="moveQty" name="moveQty" disabled>
												</div>
											</td>
											<th class="text-center">담당자</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control" id="moveUserNm" name="moveUserNm" disabled>
													<input type="hidden" class="form-contorl" id="moveUserIdx">
													<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selMoveUser" onclick="userSel()" style="padding: 1px 4px; margin-left:0px" disabled>
														<i class="fa-solid  fa-magnifying-glass"></i>
													</button>
												</div>
											</td>
										</tr>
										<tr>	
											<th class="text-center">사유</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<select class="form-control inputGroup" id="moveReason" name="moveReason" disabled></select>
												</div>
											</td>
											<th class="text-center">이동일자</th>
											<td>
												<div style="display:flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="date" class="form-control inputGroup" id="moveDate" disabled>
												</div>
											</td>
										</tr>
										<tr>
											<th class="text-center">이동 전 창고</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" class="form-control" id="beforeWarehouse" name="beforeWarehouse" disabled>
													<input type="hidden" class="form-control" id="beforeWarehouseIdx">
												</div>
											</td>
											<th class="text-center">이동 후 창고</th>
											<td>
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<select class="form-control inputGroup" id="afterWarehouse" disabled></select>
												</div>
											</td>
										</tr>
										<tr>
											<th class="text-center">비고</th>
											<td colspan="3">
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control inputGroup" id="moveDesc" name="moveDesc" disabled>
												</div>
											</td>
										</tr>
									</table>
								</div>                	                    
							</form>
					</div>
				</div><!-- ===/.right-sidebar 등록,수정===  -->
			</div><!-- /.row -->
		</div><!-- / #main  -->
<!-- 입고 리스트 모달 -->
<div class="modal fade" id="stockSummaryModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					재고현황 조회
				</h5>
				<div class="row">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnInProdModalPaste">
							<i class="fa-regular fa-paste"></i>
						</button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
							<i class="fa-solid fa-xmark"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="stockSummaryModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">창고코드</th>
							<th class="text-center align-middle">창고번호</th>
							<th class="text-center align-middle">재고수량</th>
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
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
			$('#page').css('grid-template-columns', '6fr 4px 4fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
			$('#page').css('grid-template-columns', '1fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>
<script>
	WM_init('new');
	WM_init('edit');

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#startInDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endInDate').val(moment().format('YYYY-MM-DD'));

	//검색용
	let searchItemCd = '';
	let searchItemNm = '';
	let searchAcctFg = '';
	let searchUseYn = '001';
	let searchitemModel = '';

	let itemCdVal = '';
	let itemModelVal = '';
	let useYnVal = '001';
	
    let sideView = '';
    let editCode = 'info';

    let useYnList = getCommonCode('시스템', '000'); // 근무상태
    let reasonList = getCommonCode('시스템', '059');
    let locationList = new Array();
    
    selectBoxAppend(reasonList, 'moveReason', '', '2');	
    $(document).ready(function(){
        $('#moveDate').val(moment().format('YYYY-MM-DD'));
        $.ajax({
        	url : '<c:url value="/bm/locationAdmList"/>',
    		type : 'GET',
    		async : false,
    		data : {
    		},
    		success : function(res) {
    			if (res.result == "ok") { //응답결과
    				let data = res.data;
    				data.forEach((item) => {
    					var locationData = new Object();
    					locationData.commonCd = item.idx;
    					locationData.commonNm = item.lcNm;
    					locationList.push(locationData);
    				});
    			} else if(res.result == 'fail') {
    				toastr.warning(res.message);
    			} else {
    				toastr.error(res.message);
    			}
        	}
        });
        selectBoxAppend(locationList, 'afterWarehouse', '', '2');
    })
	
	
	$('#saveBtnModalY').on('click',function() {
		$('#form').each(function() {
			this.reset();
		});
    	$('#matrlFaultyTable').DataTable().ajax.reload( function () {});
    	
    });

	//공통 수정, 저장 처리==================================================================================
	
	//등록 버튼
	$('#btnNew').on('click', function(){
		sideView = 'add';

    	$('.inputGroup').val('');
    	$('.inputGroup').attr('disabled', false);
    	$('.input-group').attr('disabled', false);

    	$('#itemCd').val('');
    	$('#itemNm').val('');
    	$('#beforeWarehouse').val('');
    	$('#beforeWarehouseIdx').val('');
    	$('#moveUserNm').val('');
    	$('#moveUserIdx').val('');
    	$('#moveDate').val(moment().format('YYYY-MM-DD'));

		$('#btnEdit').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#btnClose').attr('disabled', false);
		$('#btnDel').attr('disabled', true);
    });

	// 수정 버튼
    $('#btnEdit').on('click', function() {
		if(sideView!='edit') {
			toastr.warning('데이터를 선택해 주세요.');
			return false;
		}
		if($('#btnSave').attr('disabled') == 'false') {
    		$('#saveBtnModal').modal('show');
    		return false;
    	}

    	$('.inputGroup').attr('disabled', false);
    	$('.input-group').attr('disabled', false);

		$('#btnNew').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#btnClose').attr('disabled', false);
		$('#btnDel').attr('disabled', true);
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
        if($('#itemCd').val() == ''){
        	$('#itemCd').focus();
        	$('#selItem').focus();
			toastr.warning('바코드를 선택해주세요.');
			return false;
        }
        if($('#moveQty').val() == ''){
        	$('#moveQty').focus();
			toastr.warning('이동수량을 입력해주세요.');
			return false;
        }
        if($('#moveUserIdx').val() == ''){
        	$('#moveUserNm').focus();
        	$('#selMoveUser').focus();
			toastr.warning('담당자를 선택해주세요.');
			return false;
        }
//         if($('#moveReason').val() == ''){
//         	$('#moveReason').focus();
// 			toastr.warning('사유를 선택해주세요.');
// 			return false;
//         }
        if($('#afterWarehouse').val() == ''){
        	$('#afterWarehouse').focus();
			toastr.warning('이동 후 창고를 선택해주세요.');
			return false;
        }
        
        //001 - 제품, 002 - 자재

       	let url = sideView=='add'?'<c:url value="tm/matrlMoveAdmIns"/>':'<c:url value="tm/matrlMoveAdmUpd"/>';

       	if(sideView=='add'){
			$.ajax({
	            url: '<c:url value="/tm/inventoryMoveAdmIns"/>',
	            type: 'POST',
	            data: {
	                'moveQty'			: function(){ return $('#moveQty').val().replace(/,/g,''); },
	                'moveUserIdx'		: function(){ return $('#moveUserIdx').val(); },
	                'moveDate'			: function(){ return moment($('#moveDate').val()).format('YYYYMMDD');},
	                'beforeWarehouse' 	: function(){ return $('#beforeWarehouseIdx').val(); },
	                'afterWarehouse'	: function(){ return $('#afterWarehouse').val(); },
	                'moveReason'		: function(){ return $('#moveReason').val(); },
	                'moveDesc'			: function(){ return $('#moveDesc').val(); },
	                'itemCd'			: function(){ return $('#itemCd').val(); }
	            },
	            success: function (res) {
	                if (res.result == 'ok') {
	                	sideView = '';
				    	$('.inputGroup').attr('disabled', true);
				    	$('.input-group').attr('disabled', true);
	
	                    
	                    $('#btnNew').attr('disabled', false);
				    	$('#btnEdit').attr('disabled', true);
						$('#btnSave').attr('disabled', true);
						$('#btnClose').attr('disabled', true);
						$('#btnDel').attr('disabled', true);
						toastr.success('등록되었습니다.');
	                } else {
	                    toastr.error(res.message);
	                }
	            },
	            complete: function() {
	            	$('#matrlFaultyTable').DataTable().ajax.reload();
	            },
	        });
       	} else if(sideView=='edit'){
           	let data = matrlFaultyTable.row('.selected').data();
       		$.ajax({
	            url: '<c:url value="/tm/inventoryMoveAdmUpd"/>',
	            type: 'POST',
	            data: {
	                'idx'				: function(){ return data.idx; },
	                'lotNo'				: function(){ return $('#lotNo').val(); },
	                'moveQty'			: function(){ return $('#moveQty').val().replace(/,/g,''); },
	                'moveUserIdx'		: function(){ return $('#moveUserIdx').val(); },
	                'moveDate'			: function(){ return moment($('#moveDate').val()).format('YYYYMMDD');},
	                'beforeWarehouse' 	: function(){ return $('#beforeWarehouseIdx').val(); },
	                'afterWarehouse'	: function(){ return $('#afterWarehouse').val(); },
	                'moveReason'		: function(){ return $('#moveReason').val(); },
	                'moveDesc'			: function(){ return $('#moveDesc').val(); },
	                'spNo'				: function(){ return data.spNo; },
	                'spSeq'				: function(){ return data.spSeq; },
	                'itemCd'			: function(){ return $('#itemCd').val(); }
	            },
	            success: function (res) {
	                if (res.result == 'ok') {
	                	sideView = '';
				    	$('.inputGroup').attr('disabled', true);
				    	$('.input-group').attr('disabled', true);
	
	                    
	                    $('#btnNew').attr('disabled', false);
				    	$('#btnEdit').attr('disabled', true);
						$('#btnSave').attr('disabled', true);
						$('#btnClose').attr('disabled', true);
						$('#btnDel').attr('disabled', true);
						toastr.success('수정되었습니다.');
	                } else {
	                    toastr.error(res.message);
	                }
	            },
	            complete: function() {
	            	$('#matrlFaultyTable').DataTable().ajax.reload();
	            },
	        });
        }
    });

	//삭제 처리
	$('#btnDel').on('click', function(){
		if(sideView!='edit') {
			toastr.warning('데이터를 선택해 주세요.');
			return false;
		}
		let data = matrlFaultyTable.row('.selected').data();
		$.ajax({
			url : '<c:url value="/tm/inventoryMoveAdmDel"/>',
			type : 'POST',
			async : false,
			data : {
				'idx' : function(){ return data.idx; },
				'spNo': function(){ return data.spNo; }
			}, 
			beforeSend : function() {
				$('#my-spinner').modal('show');
			},
			success : function(res) {
				if(res.result == "ok"){
					toastr.success('삭제되었습니다.');
					$('.inputGroup').val('');
			    	$('.inputGroup').attr('disabled', true);
			    	$('.input-group').attr('disabled', true);
			    	
			    	$('#itemCd').val('');
			    	$('#itemNm').val('');
			    	$('#beforeWarehouse').val('');
			    	$('#beforeWarehouseIdx').val('');
			    	$('#moveUserNm').val('');
			    	$('#moveUserIdx').val('');
			    	$('#moveDate').val(moment().format('YYYY-MM-DD'));

			    	$('#btnNew').attr('disabled', false);
			    	$('#btnEdit').attr('disabled', true);
					$('#btnSave').attr('disabled', true);
					$('#btnClose').attr('disabled', true);
					$('#btnDel').attr('disabled', true);

			    	$('#matrlFaultyTable').DataTable().ajax.reload( function () {});
					
				}
			}
		})
	})


	//기본정보==================================================================================
	
    // 목록
    $('#matrlFaultyTable thead tr').clone(true).addClass('filters').appendTo('#matrlFaultyTable thead'); // filter 생성
    let matrlFaultyTable = $('#matrlFaultyTable').DataTable({
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
        ajax: {
            url: '<c:url value="/tm/inventoryMoveAdmLst"/>',
            type: 'GET',
            data: {
                'startDate'	: function(){ return moment($('#startDate').val(), 'YYYY-MM-DD').format('YYYYMMDD'); },
                'endDate'	: function(){ return moment($('#endDate').val(), 'YYYY-MM-DD').format('YYYYMMDD'); }
            },
        },
        rowId: 'itemCd',
        columns: [
        	{ data: 'itemCd', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	 
			},            
        	{ data: 'itemNm', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},                      
            { data: 'moveQty', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'moveDate', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'moveReasonNm', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
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
                title: '품목관리'
            }, 
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true,
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
	                	selected:null
	        		},
	        	},
	        },
        ],
        drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#matrlFaultyTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#matrlFaultyTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#matrlFaultyTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	matrlFaultyTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#matrlFaultyTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//조회버튼 클릭
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		matrlFaultyTable.ajax.reload(function() {
			$('#matrlFaultyTable tbody tr').removeClass('selected');
		});

    	$('.inputGroup').val('');
    	$('.inputGroup').attr('disabled', true);
    	$('.input-group').attr('disabled', true);

    	$('#lotNo').val('');
    	$('#itemCd').val('');
    	$('#itemNm').val('');
    	$('#beforeWarehouse').val('');
    	$('#beforeWarehouseIdx').val('');
    	$('#moveUserNm').val('');
    	$('#moveUserIdx').val('');
    	$('#moveDate').val(moment().format('YYYY-MM-DD'));
    	
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

    // 보기
    $('#matrlFaultyTable tbody').on('click', 'tr', function () {
    	if($('#btnSave').attr('class') == 'btn btn-primary float-right ml-1') {
    		$('#saveBtnModal').modal('show');
    		return false;
    	}

        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }
        else {
        	$('#matrlFaultyTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    	sideView='edit';
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);

		let data = matrlFaultyTable.row('.selected').data();
		$('#lotNo').val(data.lotNo);
		$('#itemCd').val(data.itemCd);
		$('#itemNm').val(data.itemNm);
		$('#moveQty').val(addCommas(parseInt(data.moveQty)));
		$('#moveUserIdx').val(data.moveUserIdx);
		$('#moveUserNm').val(data.moveUserNm);
		$('#moveReason').val(data.moveReason);
		$('#moveDate').val(moment(data.moveDate).format('YYYY-MM-DD'));
		$('#beforeWarehouseIdx').val(data.beforeWarehouse);
		$('#beforeWarehouse').val(data.beforeWarehouseNm);
		$('#afterWarehouse').val(data.afterWarehouse);
		$('#moveDesc').val(data.moveDesc);
		
    });


	function userSel() {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.rows('.selected').deselect();
			userModalTable.ajax.reload(function() {});
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
	
	// 사용자목록 적용 버튼 click
	$('#btnUserModalPaste').on('click', function(){
		if( !$('#userModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = userModalTable.row('.selected').data();

		$('#moveUserIdx').val(data.idx);
		$('#moveUserNm').val(data.userName);
		
		$('#userModal').modal('hide');
	});

	function itemSel() {
		$('#stockSummaryModal').modal('show');
		setTimeout(function(){
			stockSummaryModalTable.rows('.selected').deselect();
			stockSummaryModalTable.ajax.reload(function(){});
		}, 200);
	}
	
	//입고전표 리스트
	$('#stockSummaryModalTable thead tr').clone(true).addClass('filters').appendTo('#stockSummaryModalTable thead'); // filter 생성
	let stockSummaryModalTable = $('#stockSummaryModalTable').DataTable({
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
			url : '<c:url value="/stock/stockSummaryAdmList"/>',
			type : 'POST',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'ssItemIdx', className : 'text-center'},
			{ data: 'itemNm', className : 'text-center'},
			{ data: 'lcCd', className : 'text-center'},
			{ data: 'lcNm', className : 'text-center'},
			{ data: 'ssQty', className : 'text-center',
				render : function(data){
					if(data!=null){
						return addCommas(parseInt(data));
					} else {
						return '0';
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#stockSummaryModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#stockSummaryModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#stockSummaryModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	stockSummaryModalTable.on('column-reorder', function( e, settings, details ) {
		let api = stockSummaryModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#stockSummaryModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	
	// 적용 버튼 click
	$('#btnInProdModalPaste').on('click', function(){
		if( !$('#stockSummaryModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = stockSummaryModalTable.row('.selected').data();

		$('#itemCd').val(data.ssItemIdx);
		$('#itemNm').val(data.itemNm);
		$('#moveQty').val(addCommas(parseInt(data.ssQty)));
		$('#beforeWarehouse').val(data.lcNm);
		$('#beforeWarehouseIdx').val(data.ssWhsIdx);
		
		$('#stockSummaryModal').modal('hide');
	});

	//날짜 변경 시 모달테이블 reload
	$(document).on('change', '#startInDate, #endInDate', function(){
		stockSummaryModalTable.ajax.reload(function(){});
	})

   	//함수==================================================================================

	//입고수량 숫자만 입력하게 처리
	$(document).on('keyup', "#moveQty", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas($(this).val().replace(/,/g,'')));
	}); 
</script>

</body>
</html>
