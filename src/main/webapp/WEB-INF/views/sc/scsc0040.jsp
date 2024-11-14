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
																		  grid-template-columns: 4fr 4px 6fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주일자</label>
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
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주번호</th>
							<th class="text-center">고객발주번호</th>
							<th class="text-center">수주일자</th>
							<th class="text-center">품목유형</th>
							<th class="text-center">품명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="rightHeader">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-100">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<input type="date" max="9999-12-31" class="form-control w-auto me-1" id="insertApprovalDate">
						<button type="button" class="btn btn-outline-light w-auto" id="btnApproval">승인</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button></form>
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
					<div class="row" style="padding: 5px;">
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
								<th class="text-center align-middle">수주처</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="dealCorpNm" disabled>
								</td>
								<th class="text-center align-middle">수주번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="bizOrdNo" disabled>
								</td>
								<th class="text-center align-middle">품목유형</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="goodsTypeNm" disabled>
								</td>
								<th class="text-center align-middle">품명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="goodsNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">프로젝트번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="prjCd" disabled>
								</td>
								<th class="text-center align-middle">수주수량</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="ordQty" disabled>
								</td>
								<th class="text-center align-middle">시리얼 번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="serialNo" disabled>
								</td>
								<th class="text-center align-middle">납기일</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="dueDate" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">제조 책임자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">												
										<input type="hidden" id="produceUserIdx" disabled>
										<input type="text" class="form-control inputGroup" id="produceUserNm" disabled>
										<button type="button" class="inputGroup" id="btnProduceUserDelete" onclick="userDel('PRODUCE')" style="background-color: transparent;
																											border-color: transparent;
																											position: absolute;
																											top: 0;
																											right:0;
																											margin: 1px 23px;
																											margin-left: 0px;
																											border: none;
																											" disabled>
											<i class="fa-solid fa-xmark"></i>
										</button>												
										<button type="button" class="btn btn-primary input-sub-search inputGroup" id="btnProduceUserSel" onclick="userSel('PRODUCE')" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">QA 책임자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">												
										<input type="hidden" id="qaUserIdx" disabled>
										<input type="text" class="form-control inputGroup" id="qaUserNm" disabled>
										<button type="button" class="inputGroup" id="btnQaUserDelete" onclick="userDel('QA')" style="background-color: transparent;
																											border-color: transparent;
																											position: absolute;
																											top: 0;
																											right:0;
																											margin: 1px 23px;
																											margin-left: 0px;
																											border: none;
																											" disabled>
											<i class="fa-solid fa-xmark"></i>
										</button>												
										<button type="button" class="btn btn-primary input-sub-search inputGroup" id="btnQaUserSel" onclick="userSel('QA')" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">작성자</th>
								<td class="text-center align-middle">
									<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">												
										<input type="hidden" id="admUserIdx" disabled>
										<input type="text" class="form-control inputGroup" id="admUserNm" disabled>
										<button type="button" class="inputGroup" id="btnAdmUserDelete" onclick="userDel('ADM')" style="background-color: transparent;
																											border-color: transparent;
																											position: absolute;
																											top: 0;
																											right:0;
																											margin: 1px 23px;
																											margin-left: 0px;
																											border: none;
																											" disabled>
											<i class="fa-solid fa-xmark"></i>
										</button>												
										<button type="button" class="btn btn-primary input-sub-search inputGroup" id="btnUserSel" onclick="userSel('ADM')" style="padding: 1px 4px; margin-left: 0px;" disabled>
											<i class="fa-solid fa-magnifying-glass"></i>
										</button>
									</div>
								</td>
								<th class="text-center align-middle">작성일</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="insertDate" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">승인여부</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="approvalYn" disabled>
								</td>
								<th class="text-center align-middle">승인일</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="approvalDate" disabled>
								</td>
								<th class="text-center align-middle">비고</th>
								<td colspan="3" class="text-center align-middle">
									<input type="text" class="form-control" id="inspectAdmDesc" disabled>
								</td>
							</tr>
						</table>
					</div>
				  	<div class="row">
				  		<div class="d-flex align-items-center justify-content-end w-100 mb-1">
				  			<input type="file" class="d-none" id="dtlFile" name="dtlFile">
					  		<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDtlNew" disabled><i class="fa-solid fa-plus"></i></button>
								<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDtlDel" disabled><i class="fa-solid fa-trash-can"></i></button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDtlFile" disabled><i class="fa-solid fa-folder"></i></button>
							</div>
						</div>
						<table class="table table-bordered p-0 m-0" id="inspectDtlTable">
							<thead class="table-light">
								<tr>
									<!-- <th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th> -->
									<th class="text-center align-middle">No</th>
									<th class="text-center align-middle">items</th>
									<th class="text-center align-middle">확인부서</th>
									<th class="text-center align-middle">확인</th>
									<th class="text-center align-middle">합격/불합격</th>
									<th class="text-center align-middle">검사일</th>
									<th class="text-center align-middle">문서</th>
									<th class="text-center align-middle">비고</th>
									<th class="text-center align-middle">작업자</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
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
		if($('#rightcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '4fr 4px 6fr');
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
			$('#page').css('grid-template-columns', '4fr 4px 6fr');
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

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#insertApprovalDate').val(moment().format('YYYY-MM-DD'));
	
	let departmentList = getCommonCode('시스템', '002'); // 부서
	
	$('#userModal').draggable({handle: ".modal-header"});
	
	let idx = '';
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let formData = new FormData();

	let bizOrdAdmIdx = '';
	let serialNoIdx = 0;
	let inspectAdmIdx = '';
	let inspectDtlIdx = '';
	let statusGubun = 'update';
	
	let fileName = '';
	let fileFormData = new FormData();
	let fileNumber = 0;

	let dataList = new Array();

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
			url : '<c:url value="/sc/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'prjCd', className : 'text-center align-middle'},
			{ data: 'bizOrdNo', className : 'text-center align-middle'},
			{ data: 'customerNo', className : 'text-center align-middle'},
			{ data: 'ordDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'goodsTypeNm', className : 'text-center align-middle'},
			{ data: 'goodsNm', className : 'text-center align-middle'},
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
		
		$('#dealCorpNm').val(bizOrderAdmTable.row(this).data().dealCorpNm);
		$('#bizOrdNo').val(bizOrderAdmTable.row(this).data().bizOrdNo);
		$('#goodsTypeNm').val(bizOrderAdmTable.row(this).data().goodsTypeNm);
		$('#goodsNm').val(bizOrderAdmTable.row(this).data().goodsNm);
		$('#prjCd').val(bizOrderAdmTable.row(this).data().prjCd);
		$('#ordQty').val(addCommas(parseInt(bizOrderAdmTable.row(this).data().ordQty)));
		$('#ordDate').val(moment(bizOrderAdmTable.row(this).data().ordDate).format('YYYY-MM-DD'));
		$('#dueDate').val(moment(bizOrderAdmTable.row(this).data().dueDate).format('YYYY-MM-DD'));

		$('#btnProduceUserDelete').attr('disabled', true);
		$('#btnProduceUserSel').attr('disabled', true);
		$('#btnQaUserDelete').attr('disabled', true);
		$('#btnQaUserSel').attr('disabled', true);
		$('#btnAdmUserDelete').attr('disabled', true);
		$('#btnUserSel').attr('disabled', true);

		$('#inspectAdmDesc').attr('disabled', true);
		
		status = '001';
		bizOrdAdmIdx = bizOrderAdmTable.row(this).data().idx;
		statusGubun = 'UPDATE';
		fileFormData = new FormData();
		$.ajax({
			url: '<c:url value="/qm/inspectAdmSel"/>',
            type: 'GET',
            async: false,
            data: {
                'bizOrdAdmIdx'	:	bizOrdAdmIdx,
                'serialNoIdx'	:	serialNoIdx,
                'inputGubun'	:	'001',
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					if(data!=null) {
						inspectAdmIdx = data.idx;
						$('#produceUserIdx').val(data.produceUserIdx);
						$('#produceUserNm').val(data.produceUserNm);
						$('#qaUserIdx').val(data.qaUserIdx);
						$('#qaUserNm').val(data.qaUserNm);
						$('#admUserIdx').val(data.admUserIdx);
						$('#admUserNm').val(data.admUserNm);
						$('#regDate').val(moment(data.regDate).format('YYYY-MM-DD'));
						$('#approvalYn').val(data.approvalYn=='001'?'승인':'미승인');
						$('#approvalDate').val(data.approvalDate!=''?moment(data.approvalDate).format('YYYY-MM-DD'):'');
						$('#inspectAdmDesc').val(data.inspectAdmDesc);
						$('#btnNew').attr('disabled', true);
						$('#btnEdit').attr('disabled', false);
						$('#insertApprovalDate').attr('disabled', false);
						$('#btnApproval').attr('disabled', false);
						if(data.approvalYn=='001') {
							$('#btnApproval').text('미승인');
						} else {
							$('#btnApproval').text('승인');
						}
					} else {
						inspectAdmIdx = '';
						$('#produceUserIdx').val('');
						$('#produceUserNm').val('');
						$('#qaUserIdx').val('');
						$('#qaUserNm').val('');
						$('#admUserIdx').val('');
						$('#admUserNm').val('');
						$('#regDate').val('');
						$('#approvalYn').val('');
						$('#approvalDate').val('');
						$('#inspectAdmDesc').val('');
						$('#btnNew').attr('disabled', false);
						$('#btnEdit').attr('disabled', true);
						$('#insertApprovalDate').attr('disabled', true);
						$('#btnApproval').attr('disabled', true);
						$('#btnApproval').text('승인');
					}
					inspectDtlTable.ajax.reload(function() {});
					$('#btnDel').attr('disabled', true);
					$('#btnCancel').attr('disabled', true);
					$('#btnSave').attr('disabled', true);
					$('#btnDtlNew').attr('disabled', true);
					$('#btnDtlDel').attr('disabled', true);
					$('#btnDtlFile').attr('disabled', true);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	// 검사 항목 목록조회
	let inspectDtlTable = $('#inspectDtlTable').DataTable({
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
        scrollY: '68.5vh',
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
			url : '<c:url value="/qm/inspectDtlLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx	: function() { return bizOrdAdmIdx;},
				inputGubun		: function() { return '001';},
				statusGubun		: function() { return statusGubun;},
				inspectIdx		: function() { return inspectAdmIdx;},
				goodsNm			: function() { return $('#goodsNm').val();}
			},
		},
        //rowId: 'idx',
		columns : [
			{  //순번
				className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+(meta.row+1)+'</div>';
				}
			},
			{ data: 'items', className : 'text-center align-middle', name: 'items', // items
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						return '<input type="text" style="min-width:200px;" class="form-control" value="'+data+'">';
					} else {
						if(data!=null) {
							return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else {
							return '<input type="text" style="min-width:200px;" class="form-control">';
						}
					}
				}
			},
			{ data: 'checkDepartmentCd', className : 'text-center align-middle', name: 'checkDepartmentCd', //확인부서
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						let html = '';
						html += '<select style="min-width:110px;" class="form-select">';
						html +='	<option value="">선택</option>';
						departmentList.forEach(function(item) {
							if(item.commonCd==data) {
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
						});
						html += '</select>';
						return html;
					} else {
						if(data!=null) {
							return '<div style="min-width:110px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+row['checkDepartmentNm']+'</div>';
						} else {
							let html = '';
							html += '<select style="min-width:110px;" class="form-select">';
							html +='	<option value="">선택</option>';
							departmentList.forEach(function(item) {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							});
							html += '</select>';
							return html;
						}
					}
					
				}
			},
			{ data: 'checkCd', className : 'text-center align-middle', name: 'checkCd', // check
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						let html = '';
						html += '<select style="min-width:100px;" class="form-select">';
						if(data=='001') {
							html +='	<option value="001" selected>Checked</option>';
							html +='	<option value="002">Skip</option>';
						} else {
							html +='	<option value="001">Checked</option>';
							html +='	<option value="002" selected>Skip</option>';
						}
						html += '</select>';
						return html;
					} else {
						if(data!=null) {
							let value = data=='001'?'Checked':'Skip';
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+value+'</div>';
						} else {
							let html = '';
							html += '<select style="min-width:100px;" class="form-select">';
							html +='	<option value="001">Checked</option>';
							html +='	<option value="002">Skip</option>';
							html += '</select>';
							return html;
						}
					}
				}
			},
			{ data: 'passCd', className : 'text-center align-middle', name: 'passCd', // 합격불합격
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						let html = '';
						html += '<select style="min-width:100px;" class="form-select">';
						if(data=='001') {
							html +='	<option value="001" selected>합격</option>';
							html +='	<option value="002">불합격</option>';
						} else {
							html +='	<option value="001">합격</option>';
							html +='	<option value="002" selected>불합격</option>';
						}
						html += '</select>';
						return html;
					} else {
						if(data!=null) {
							let value = data=='001'?'합격':'불합격';
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+value+'</div>';
						} else {
							let html = '';
							html += '<select style="min-width:100px;" class="form-select">';
							html +='	<option value="001">합격</option>';
							html +='	<option value="002">불합격</option>';
							html += '</select>';
							return html;
						}
					}
				}
			},
			{ data: 'inspectDate', className : 'text-center align-middle', name: 'inspectDate', //검사일
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						return '<input type="date" style="min-width:130px;" max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
					} else {
						if(data!=null) {
							return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
						} else {
							return '<input type="date" style="min-width:130px;" max="9999-12-31" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">';
						}
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle', name: 'fileName', // 파일
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						return '<div name="fileName" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					} else {
						if(data!=null) {
							return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"><a href=\"#\" onclick=\"projectFileDownload(\''+row['uuid']+'\',\''+row['fileName']+'\',\''+row['fileExt']+'\')">'+row['fileName']+'.'+row['fileExt']+'</a></div>';
						} else {
							return '<div name="fileName" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
						}
					}
				}
			},
			{ data: 'inspectDtlDesc', className : 'text-center align-middle', name: 'inspectDtlDesc', // 비고
				render : function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						return '<input type="text" style="min-width:200px;" class="form-control" value="'+data+'">';
					} else {
						if(data!=null) {
							return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
						} else {
							return '<input type="text" style="min-width:200px;" class="form-control">';
						}
					}
				}
			},
			{ data: 'dtlUserIdx', className : 'text-center align-middle', name: 'dtlUserIdx', 
				render: function(data, type, row, meta) {
					if(statusGubun=='CREATE') {
						let html = '';
						html += '<div style="min-width:100px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+data+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+row['dtlUserNm']+'" disabled>';
						html += '<button type="button" onclick="userSel(\'DTL\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					} else {
						if(data!=null) {
							return '<div style="min-width:100px; white-space:nowrap;">'+row['dtlUserNm']+'</div>';
						} else {
							let html = '';
							html += '<div style="min-width:100px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
							html += '<input type="hidden" name="dtlUserIdx" value="">';
							html += '<input type="text" class="form-control inputGroup" name="dtlUserNm" value="" disabled>';
							html += '<button type="button" onclick="userSel(\'DTL\')" class="btn btn-primary input-sub-search inputGroup" name="dtlUserSel" style="padding: 1px 4px; margin-left: 0px;">';
							html += '<i class="fa-solid fa-magnifying-glass"></i>';
							html += '</button></div>';
							return html;
						}
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
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#inspectDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#inspectDtlTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#inspectDtlTable_filter').addClass('d-none');
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
					let selectData = inspectDtlTable.row(item).data();
					if( inspectDtlTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(inspectDtlTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(inspectDtlTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#inspectDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inspectDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	inspectDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = inspectDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inspectDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnNew').on('click', function() {
		if(bizOrdAdmIdx=='') {
			toastr.warning('수주를 선택해 주세요.');
			return false;
		}
		statusGubun = 'CREATE';
		inspectDtlTable.ajax.reload(function() {});
		$('#admUserIdx').val(userIdx);
		$('#admUserNm').val(userName);
		$('#btnProduceUserDelete').attr('disabled', false);
		$('#btnProduceUserSel').attr('disabled', false);
		$('#btnQaUserDelete').attr('disabled', false);
		$('#btnQaUserSel').attr('disabled', false);
		$('#btnAdmUserDelete').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);

		$('#inspectAdmDesc').attr('disabled', false);

		$('#btnNew').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		
		$('#btnDtlNew').attr('disabled', false);
		$('#btnDtlDel').attr('disabled', false);
		$('#btnDtlFile').attr('disabled', false);
		
		$('#insertDate').val(moment().format('YYYY-MM-DD'));
	});

	$('#btnEdit').on('click', function() {
		if(bizOrdAdmIdx=='') {
			toastr.warning('수주를 선택해 주세요.');
			return false;
		}
		statusGubun = '';
		$('#btnProduceUserDelete').attr('disabled', false);
		$('#btnProduceUserSel').attr('disabled', false);
		$('#btnQaUserDelete').attr('disabled', false);
		$('#btnQaUserSel').attr('disabled', false);
		$('#btnAdmUserDelete').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);

		$('#inspectAdmDesc').attr('disabled', false);

		$('#btnEdit').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		
		$('#btnDtlNew').attr('disabled', false);
		$('#btnDtlDel').attr('disabled', false);
		$('#btnDtlFile').attr('disabled', false);
		$('#insertDate').val(moment().format('YYYY-MM-DD'));
		$('#inspectDtlTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == inspectDtlTable.column('items:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
					} else if(index_td == inspectDtlTable.column('checkDepartmentCd:name').index()) {
						let value = inspectDtlTable.row(tr).data().checkDepartmentCd;
						let value2 = inspectDtlTable.row(tr).data().checkDepartmentNm;
						let html = '';
						html += '<select style="min-width:110px;" class="form-select">';
						html +='	<option value="">선택</option>';
						departmentList.forEach(function(item) {
							if(item.commonCd==value) {
								html +='	<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
							} else {
								html +='	<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
							}
							
						});
						html += '</select>';
						$(td).html(html);
					} else if(index_td == inspectDtlTable.column('checkCd:name').index()) {
						let value = inspectDtlTable.row(tr).data().checkCd;
						let html = '';
						html += '<select style="min-width:100px;" class="form-select">';
						if(value=='001') {
							html +='	<option value="001" selected>Checked</option>';
							html +='	<option value="002">Skip</option>';
						} else {
							html +='	<option value="001">Checked</option>';
							html +='	<option value="002" selected>Skip</option>';
						}
						html += '</select>';
						$(td).html(html);
					} else if(index_td == inspectDtlTable.column('passCd:name').index()) {
						let value = inspectDtlTable.row(tr).data().passCd;
						let html = '';
						html += '<select style="min-width:100px;" class="form-select">';
						if(value=='001') {
							html +='	<option value="001" selected>합격</option>';
							html +='	<option value="002">불합격</option>';
						} else {
							html +='	<option value="001">합격</option>';
							html +='	<option value="002" selected>불합격</option>';
						}
						html += '</select>';
						$(td).html(html);
					} else if(index_td == inspectDtlTable.column('inspectDate:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" class="form-control" value="'+value+'">');
					} else if(index_td == inspectDtlTable.column('fileName:name').index()) {
						let value = $(td).text();
						$(td).html('<div name="fileName" style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+value+'</div>');
					} else if(index_td == inspectDtlTable.column('inspectDtlDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" value="'+value+'" class="form-control">');
					} else if(index_td == inspectDtlTable.column('dtlUserIdx:name').index()) {
						let value = inspectDtlTable.row(tr).data().dtlUserIdx;
						let value2 = inspectDtlTable.row(tr).data().dtlUserNm;
						let html = '';
						html += '<div style="min-width:100px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="dtlUserIdx" value="'+value+'">';
						html += '<input type="text" class="form-control inputGroup" name="dtlUserNm" value="'+value2+'" disabled>';
						html += '<button type="button" onclick="userSel(\'DTL\')" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					}
				}
			})
		});
	});
	
	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		let saveCheck = true;
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				if($('#admUserIdx').val() == '') {
					toastr.warning('작성자를 선택해주세요.');
					$('#btnUserSel').select();
					state = false;
					$('#my-spinner').hide();
					return false;
				}
				if(state) {
					if($('#inspectDtlTable').DataTable().rows().count()>0) {
						$('#inspectDtlTable tbody').find('tr').each(function(index, item) {
							let td = $(item).find('td');
							let data = inspectDtlTable.row($(item)).data();
							let node = inspectDtlTable.row($(item)).node();
							
							let idx = inspectDtlTable.row($(item)).data().idx;
							let items = $(td).eq(inspectDtlTable.column('items:name').index()).find('input').val();
							let checkDepartmentCd = $(td).eq(inspectDtlTable.column('checkDepartmentCd:name').index()).find('select').val();
							let checkCd = $(td).eq(inspectDtlTable.column('checkCd:name').index()).find('select').val();
							let passCd = $(td).eq(inspectDtlTable.column('passCd:name').index()).find('select').val();
							let inspectDate = $(td).eq(inspectDtlTable.column('inspectDate:name').index()).find('input').val();
							let uuid = inspectDtlTable.row($(item)).data().uuid;
							let fileName = inspectDtlTable.row($(item)).data().fileName;
							let fileExt = inspectDtlTable.row($(item)).data().fileExt;
							let updateUuid = $(this).data().updateUuid;
							let updateFileName = $(this).data().updateFileName;
							let updateFileExt = $(this).data().updateFileExt;
							let inspectDtlDesc = $(td).eq(inspectDtlTable.column('inspectDtlDesc:name').index()).find('input').val();
							let dtlUserIdx = $(td).eq(inspectDtlTable.column('dtlUserIdx:name').index()).find('input').val();
							
							let produceUserIdx = $('#produceUserIdx').val();
							let qaUserIdx = $('#qaUserIdx').val();
							let admUserIdx = $('#admUserIdx').val();
							let inspectAdmDesc = $('#inspectAdmDesc').val();

							let obj = new Object();
							obj.bizOrdAdmIdx = bizOrdAdmIdx;
							obj.serialNoIdx = 0;
							obj.inspectIdx = inspectAdmIdx;
							obj.idx = idx;
							obj.inputGubun = '001';
							obj.admUserIdx = admUserIdx;
							console.log("produceUserIdx : " + produceUserIdx)
							if(produceUserIdx=='') {
								obj.produceUserIdx = null;
							} else {
								obj.produceUserIdx = produceUserIdx;
							}
							console.log("qaUserIdx : " + qaUserIdx)
							if(qaUserIdx=='') {
								obj.qaUserIdx = null;
							} else {
								obj.qaUserIdx = qaUserIdx;
							}
							
							obj.inspectAdmDesc = inspectAdmDesc;
							obj.items = items;
							obj.checkDepartmentCd = checkDepartmentCd;
							obj.checkCd = checkCd;
							obj.passCd = passCd;
							obj.inspectDate = inspectDate.replace(/-/g, '');

							obj.uuid = uuid;
							obj.fileName = fileName;
							obj.fileExt = fileExt;
							if (updateUuid === undefined) {
								obj.updateUuid = null;
							} else {
								obj.updateUuid = updateUuid;
							}
							if (updateFileName === undefined) {
								obj.updateFileName = null;
							} else {
								obj.updateFileName = updateFileName;
							}
							if (updateFileExt === undefined) {
								obj.updateFileExt = null;
							} else {
								obj.updateFileExt = updateFileExt;
							}
							
							obj.inspectDtlDesc = inspectDtlDesc;
							obj.dtlUserIdx = dtlUserIdx;
							array.push(obj);
						});

						//원본 데이터
						let tableData = [];
						$('#inspectDtlTable tbody').find('tr').each(function(index, item) {
							let obj = {};
							let data = inspectDtlTable.row(index).data();
							obj.bizOrdAdmIdx = bizOrdAdmIdx;
							obj.serialNoIdx = 0;
							obj.inspectIdx = inspectAdmIdx;
							obj.idx = data.idx;
							obj.inputGubun = '001';
							obj.admUserIdx = $('#admUserIdx').val();
							obj.produceUserIdx = $('#produceUserIdx').val();
							obj.qaUserIdx = $('#qaUserIdx').val();
							obj.inspectAdmDesc = $('#inspectAdmDesc').val();

							obj.items = data.items;
							obj.checkDepartmentCd = data.checkDepartmentCd;
							obj.checkCd = data.checkCd;
							obj.passCd = data.passCd;
							if(data.inspectDate!=null) {
								obj.inspectDate = data.inspectDate.replace(/-/g, '');
							} else {
								obj.inspectDate = null;
							}
							

							obj.uuid = data.uuid;
							obj.fileName = data.fileName;
							obj.fileExt = data.fileExt;

							obj.updateUuid = null;
							obj.updateFileName = null;
							obj.updateFileExt = null;

							obj.inspectDtlDesc = data.inspectDtlDesc;
							obj.dtlUserIdx = data.dtlUserIdx;
							tableData.push(obj);
						});

						console.log(array)
						console.log(tableData)
						array = _.differenceWith(array, tableData, _.isEqual);
						console.log(array)
					}
					
					if(array.length==0) {
						let obj = {};
						obj.inspectIdx = inspectAdmIdx;
						obj.bizOrdAdmIdx = bizOrdAdmIdx;
						obj.serialNoIdx = 0;
						obj.idx = 'x';
						obj.produceUserIdx = $('#produceUserIdx').val();
						obj.qaUserIdx = $('#qaUserIdx').val();
						obj.admUserIdx = $('#admUserIdx').val();
						obj.inspectAdmDesc = $('#inspectAdmDesc').val();
						obj.inputGubun = '001';
						array.push(obj);
					} else {
						let saveFileFormData = new FormData();
						let fileSubKeyIndex = 1;
						let fileKeyIndex = 0; 
						for (var key of fileFormData.keys()) {
							if(fileSubKeyIndex==1) {
								saveFileFormData.append(key, fileFormData.get(key));
								console.log("fileFormData.get(key) : " + fileFormData.get(key));
							} else if(fileSubKeyIndex==2) {
								saveFileFormData.append('uuid', fileFormData.get(key));
								console.log("uuid : " + fileFormData.get(key));
							} else {
								saveFileFormData.append('ext', fileFormData.get(key));
								console.log("ext : " + fileFormData.get(key));
							} 
							fileSubKeyIndex++;
							if(fileSubKeyIndex==3) {
								fileSubKeyIndex = 0;
								fileKeyIndex++;
							}
						}
						fileUpload(saveFileFormData);

						for(let i = 0; i<array.length; i++) {
							if(array[i].updateUuid!=null && array[i].uuid!=null) {
								let uuid =array[i].uuid;
								let ext = array[i].fileExt;
								fileDelete({uuid:uuid,ext:ext});
							}
						}
					}
					let urlData = '<c:url value="/qm/inspectDtlUpd"/>';
					if(inspectAdmIdx=='') {
						urlData = '<c:url value="/qm/inspectDtlIns"/>';
					}
					
					$.ajax({
						url: urlData,
			            type: 'POST',
			            async: false,
			            data: {
			            	'jsonArray'	:	JSON.stringify(array)
			            },
			            beforeSend: function() {
			            	$('#my-spinner').show();
			            },
						success : function(res) {
							if (res.result == "ok") { //응답결과
								if(inspectAdmIdx=='') {
									toastr.success('등록되었습니다.');
									statusGubun = 'update';
								} else {
									toastr.success('수정되었습니다.');
								}
								inspectAdmIdx = res.inspectAdmIdx;
								$('#btnProduceUserDelete').attr('disabled', true);
								$('#btnProduceUserSel').attr('disabled', true);
								$('#btnQaUserDelete').attr('disabled', true);
								$('#btnQaUserSel').attr('disabled', true);
								$('#btnAdmUserDelete').attr('disabled', true);
								$('#btnUserSel').attr('disabled', true);

								$('#inspectAdmDesc').attr('disabled', true);

								$('#btnEdit').attr('disabled', false);
								$('#btnSave').attr('disabled', true);
								
								$('#btnDtlNew').attr('disabled', true);
								$('#btnDtlDel').attr('disabled', true);
								$('#btnDtlFile').attr('disabled', true);
								WM_action_OFF('edit');
								inspectDtlTable.rows('.selected').deselect();
								inspectDtlTable.ajax.reload();

							} else if(res.result == 'fail') {
								toastr.warning(res.message);
							} else {
								toastr.error(res.message);
							}
							$('#my-spinner').hide();
						}
					});
					
				}
			},100)
		})
		$('#my-spinner').hide();
	});

	$('#btnDtlNew').on('click', function() {
		statusGubun = '';
		$('#inspectDtlTable').DataTable().row.add({
			'idx'				: '',
			'items'				: null,
			'checkDepartmentCd'	: null,
			'checkCd'			: null,
			'passCd'			: null,
			'inspectDate'		: null,
			'fileName'			: null,
			'fileExt'			: null,
			'uuid'				: null,
			'updateFileName'	: null,
			'updateFileExt'		: null,
			'updateUuid'		: null,
			'inspectDtlDesc'	: null,
			'dtlUserIdx'		: null,
		}).draw(false);
	});

	$('#btnDtlFile').on('click', function() {
		if( !$('#inspectDtlTable tbody tr').hasClass('selected') ){
			toastr.warning('파일 업로드할 행을 선택해주세요.');
			return false;
		}
		$('#dtlFile').val('');
		$('#dtlFile').trigger('click');
	});

	// 파일 선택
	$('#dtlFile').on('change',function() {
		let fileInput = document.getElementById("dtlFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		let uuid = uuid_v4();
		let fileNameList = files[0].name.split('.');
		let fileFullNm = _.slice(fileNameList, 0, -1).join('.');

		$('#inspectDtlTable').DataTable().$('tr.selected').data().updateUuid = uuid;
		$('#inspectDtlTable').DataTable().$('tr.selected').data().updateFileName = fileFullNm;
		$('#inspectDtlTable').DataTable().$('tr.selected').data().updateFileExt = files[0].name.split('.').at(-1);

		$('#inspectDtlTable').DataTable().$('tr.selected').find('div[name=fileName]').text(fileFullNm + '.' + files[0].name.split('.').at(-1));
		fileFormData.append('file-'+uuid,files[0]);
		fileFormData.append('uuid-'+uuid,uuid);
		fileFormData.append('ext-'+uuid,files[0].name.split('.').at(-1));
    	$('#dtlFile').val('');
	})

	// 관련파일 삭제 버튼 클릭
	$('#btnDtlDel').on('click', function() {
		if( !$('#inspectDtlTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 행을 선택해주세요.');
			return false;
		}
		if($('#inspectDtlTable').DataTable().row('.selected').data().idx!=null) {
			$('#deleteModal').modal('show');
		} else {
			let uuid = inspectDtlTable.row('.selected').data().uuid;
			fileFormData.delete('file-'+uuid);
			fileFormData.delete('uuid-'+uuid);
			fileFormData.delete('ext-'+uuid);
			$('#inspectDtlTable').DataTable().row('.selected').remove().draw();
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		idx = inspectDtlTable.row('.selected').data().idx;
		
		$.ajax({
			url: '<c:url value="/qm/inspectDtlDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	idx,
                'inspectIdx'	:	inspectAdmIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let uuid = $('#inspectDtlTable').DataTable().row('.selected').data().uuid;;
				let ext = $('#inspectDtlTable').DataTable().row('.selected').data().fileExt;
				fileDelete({uuid:uuid,ext:ext});
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#inspectDtlTable').DataTable().row('.selected').remove().draw();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#btnApproval').on('click', function() {
		let approvalCd = '';
		let approvalDate = $('#insertApprovalDate').val().replace(/-/g, '');
		if($('#btnApproval').text()=='승인') {
			approvalCd = '001';
		} else {
			approvalCd = '002';
			approvalDate = '';
		}

		$.ajax({
			url: '<c:url value="/qm/inspectAdmApprovalUpd"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	inspectAdmIdx,
                'serialNoIdx'	:	serialNoIdx,
                'approvalYn'	:	approvalCd,
                'approvalDate'	:	approvalDate
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					if(approvalCd=='001') {
						toastr.success('승인되었습니다');
						$('#approvalYn').val('승인');
						$('#btnApproval').text('미승인');
						$('#approvalDate').val(moment(approvalDate).format('YYYY-MM-DD'));
					} else {
						toastr.success('미승인되었습니다');
						$('#approvalYn').val('미승인');
						$('#btnApproval').text('승인');
						$('#approvalDate').val('');
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

	let inputStatus = '';
	
	function userSel(value) {
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.rows('.selected').deselect();
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

		if(inputStatus == 'ADM') {
			$('#admUserIdx').val(data.idx);
			$('#admUserNm').val(data.userName);
		} else if(inputStatus == 'QA') {
			$('#qaUserIdx').val(data.idx);
			$('#qaUserNm').val(data.userName);
		} else if(inputStatus == 'PRODUCE') {
			$('#produceUserIdx').val(data.idx);
			$('#produceUserNm').val(data.userName);
		} else if(inputStatus == 'DTL') {
			$('#inspectDtlTable').DataTable().$('tr.selected').find('input[name=dtlUserIdx]').val(data.idx);
			$('#inspectDtlTable').DataTable().$('tr.selected').find('input[name=dtlUserNm]').val(data.userName);
		}
		$('#userModal').modal('hide');
	});

	function userDel(value) {

		inputStatus = value;

		if(inputStatus == 'ADM') {
			$('#admUserIdx').val('');
			$('#admUserNm').val('');
		} else if(inputStatus == 'QA') {
			$('#qaUserIdx').val('');
			$('#qaUserNm').val('');
		} else if(inputStatus == 'PRODUCE') {
			$('#produceUserIdx').val('');
			$('#produceUserNm').val('');
		} else if(inputStatus == 'DTL') {
			$('#inspectDtlTable').DataTable().$('tr.selected').find('input[name=dtlUserIdx]').val('');
			$('#inspectDtlTable').DataTable().$('tr.selected').find('input[name=dtlUserNm]').val('');
		}
	}

	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}
</script>

</body>
</html>