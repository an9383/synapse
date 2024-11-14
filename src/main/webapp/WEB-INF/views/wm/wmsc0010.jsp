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
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnAdmSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnAdmEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnAdmCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="workProgressResultAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트코드</th>
							<th class="text-center">프로젝트명</th>
							<th class="text-center">수주처</th>
							<th class="text-center">품목유형</th>
							<th class="text-center">품명</th>
							<th class="text-center">납기일</th>
							<th class="text-center">상태</th>
							<th class="text-center">생산시작일</th>
							<th class="text-center">생산종료일</th>
							<th class="text-center">작업자</th>
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
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button></form> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnDtlSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDtlEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<!-- <button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnDtlCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDtlClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
					<div class="row">
						<table class="table table-bordered p-0 m-0">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<tr>
								<th class="text-center align-middle">프로젝트코드</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="prjCd" disabled>
								</td>
								<th class="text-center align-middle">프로젝트명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="prjNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">수주번호</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="bizOrdNo" disabled>
								</td>
								<th class="text-center align-middle">수주처</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="dealCorpNm" disabled>
								</td>
							</tr>
						</table>
					</div>
				  	<div class="row">
						<table class="table table-bordered p-0 m-0" id="workProgressResultDtlTable">
							<thead class="table-light">
								<tr>
									<th class="text-center"><input class="form-check-input" type="checkbox" id="dtlAllCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
									<th class="text-center align-middle">No</th>
									<th class="text-center align-middle">중분류코드</th>
									<th class="text-center align-middle">중분류명</th>
									<th class="text-center align-middle">소분류코드</th>
									<th class="text-center align-middle">소분류명</th>
									<th class="text-center align-middle">내용</th>
									<th class="text-center align-middle">확인</th>
									<th class="text-center">생산시작일</th>
									<th class="text-center">생산종료일</th>
									<th class="text-center align-middle">작업자</th>
									<th class="text-center align-middle">작업내용</th>
									<th class="text-center align-middle">비고</th>
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
	
	$('#userModal').draggable({handle: ".modal-header"});
	
	let idx = '';
	let userName = "${userName}";
	let formData = new FormData();
	let deleteData = '';
	let maxVersion = '';

	let admIdx = '';
	let bizOrdAdmIdx = '';
	let workStatus = '';

	let dataList = new Array();
	
	// 수주 목록 조회
	$('#workProgressResultAdmTable thead tr').clone(true).addClass('filters').appendTo('#workProgressResultAdmTable thead'); // filter 생성
	let workProgressResultAdmTable = $('#workProgressResultAdmTable').DataTable({
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
			url : '<c:url value="/wm/workProgressResultAdmLst"/>',
			type : 'GET',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
			},
		},
        rowId: 'bizOrderIdx',
		columns : [
			{ data: 'prjCd', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; min-width:120px;">'+data+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'prjNm', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'goodsTypeNm', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'goodsNm', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'dueDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'workStatus', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data != null){
						if(data=='W') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
						}
						else if(data=='S') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">진행중</div>';
						}
						else if(data=='E') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">완료</div>';
						}
						else if(data=='T') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">검사</div>';
						}
						else if(data=='O') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">출고</div>';
						}
					} else {
						return "대기";
					}
				}
			},
			{ data: 'admStartDate', className : 'text-center align-middle', name: 'admStartDate',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'admEndDate', className : 'text-center align-middle', name: 'admEndDate',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'admWorkChargr', className : 'text-center align-middle', name: 'admWorkChargr',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; min-width:150px;">'+data+'</div>';
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
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
			let theadHeight = parseFloat($('#workProgressResultAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#workProgressResultAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workProgressResultAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workProgressResultAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = workProgressResultAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workProgressResultAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		workProgressResultAdmTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주별발주 수정 버튼 click
	$('#btnAdmEdit').on('click', function() {
		
		WM_action_ON('edit','workingWarningModal');

		$('#workProgressResultAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
		});
		
		$('#workProgressResultAdmTable_wrapper tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == workProgressResultAdmTable.column('admStartDate:name').index()) {
						let value = $(td).text();
						if(value=='') {
							$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
						} else {
							$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+value+'">');
						}
					} else if(index_td == workProgressResultAdmTable.column('admEndDate:name').index()) {
						let value = $(td).text();
						if(value=='') {
							$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
						} else {
							$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+value+'">');
						}
					}
					else if(index_td == workProgressResultAdmTable.column('admWorkChargr:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
					}
				}
			})
		});
		
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
		
		$('#btnAdmSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnAdmEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnAdmCancel').attr('disabled', false); // ADM 취소 버튼
		$('#btnDtlEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnSearch').attr('disabled', true); // 조회버튼
	});

	// 수주 데이터 click
	$('#workProgressResultAdmTable tbody').on('click','tr', function() {
		$('#prjCd').val(workProgressResultAdmTable.row(this).data().prjCd);
		$('#prjNm').val(workProgressResultAdmTable.row(this).data().prjNm);
		$('#bizOrdNo').val(workProgressResultAdmTable.row(this).data().bizOrdNo);
		$('#dealCorpNm').val(workProgressResultAdmTable.row(this).data().dealCorpNm);
		$('#dtlAllCheckBox').prop('checked', false);
		admIdx = workProgressResultAdmTable.row(this).data().idx;
		bizOrdAdmIdx = workProgressResultAdmTable.row(this).data().bizOrdAdmIdx;
		workStatus = workProgressResultAdmTable.row(this).data().workStatus;
		$('#btnDtlSave').attr('disabled', true); // 저장 버튼
		$('#btnDtlEdit').attr('disabled', false); // 수정 버튼
		$('#btnDtlCancel').attr('disabled', true); // 취소 버튼
		workProgressResultDtlTable.ajax.reload(function() {});		
	});

	// 저장 버튼 click
	$('#btnAdmSave').on('click', function() {
		let array = [];
		let state = true;
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				$('#workProgressResultAdmTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = workProgressResultAdmTable.row($(item)).data();
					let node = workProgressResultAdmTable.row($(item)).node();
					
					let idx = workProgressResultAdmTable.row($(item)).data().idx;
					let bizOrdAdmIdx = workProgressResultAdmTable.row($(item)).data().bizOrdAdmIdx;
					let admStartDate = $(td).eq(workProgressResultAdmTable.column('admStartDate:name').index()).find('input').val();
					let admEndDate = $(td).eq(workProgressResultAdmTable.column('admEndDate:name').index()).find('input').val();
					let admWorkChargr = $(td).eq(workProgressResultAdmTable.column('admWorkChargr:name').index()).find('input').val();

					let obj = new Object();
					obj.idx = idx;
					obj.bizOrdAdmIdx = bizOrdAdmIdx;
					obj.admStartDate = admStartDate.replace(/-/g, '');
					obj.admEndDate = admEndDate.replace(/-/g, '');
					obj.admWorkChargr = admWorkChargr;
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#workProgressResultAdmTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					
					let data = workProgressResultAdmTable.row(index).data();
					obj.idx = data.idx;
					obj.bizOrdAdmIdx = data.bizOrdAdmIdx;
					obj.admStartDate = data.admStartDate;
					obj.admEndDate = data.admEndDate;
					obj.admWorkChargr = data.admWorkChargr;
					tableData.push(obj);
				});
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)
				$.ajax({
					url: '<c:url value="/wm/workProgressResultAdmIu"/>',
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
							WM_action_OFF('edit');
							workProgressResultAdmTable.rows('.selected').deselect();
							workProgressResultAdmTable.ajax.reload();
							$('#btnAdmSave').attr('disabled',true);
							$('#btnAdmEdit').attr('disabled',false);
							$('#btnAdmCancel').attr('disabled',true);
							$('#btnSearch').attr('disabled', false); // 조회버튼
							$('#my-spinner').hide();
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			},100)
		})
		$('#my-spinner').hide();
	});

	
	// 실행결과 디테일 데이터
	let workProgressResultDtlTable = $('#workProgressResultDtlTable').DataTable({
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
        scrollY: '78vh',
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
			url : '<c:url value="/wm/workProgressResultDtlLst"/>',
			type : 'GET',
			data : {
				'bizOrdAdmIdx'	: function() { return bizOrdAdmIdx;},
			},
		},
        //rowId: 'idx',
		columns : [
			{ className : 'text-center align-middle', name : "dtlCheckBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="dtlCheckBox" style="margin: 0px; min-width: 25px; height: 25px;">';
				}
			},
			{  //순번
				className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+(meta.row+1)+'</div>';
				}
			},
			{ //중분류코드
				data: 'mediumCd', className : 'text-center align-middle', name: 'mediumCd',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ //중분류명
				data: 'mediumNm', className : 'text-center align-middle', name: 'mediumNm',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//소분류코드
				data: 'smallCd', className : 'text-center align-middle', name: 'smallCd',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//소분류명
				data: 'smallNm', className : 'text-center align-middle', name: 'smallNm',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//내용
				data: 'contents', className : 'text-start align-middle', name: 'contents',
				render: function(data, type, row, meta) {
					return '<div style="white-space:pre-line;min-width:400px;">'+data+'</div>';	
				}
			},
			{//확인
				data: 'workCheck', className : 'text-center align-middle', name : "workCheck",
				render: function(data, type, row, meta) {
					if(data!=null) {
						if(data=='Y') {
							return '<div style="min-width: 25px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">✔️</div>';;
						} else {
							return '<div style="min-width: 25px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';;
						}
					} else {
						return '<div style="min-width: 25px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';;
					}
				}
			},
			{ data: 'dtlStartDate', className : 'text-center align-middle', name: 'dtlStartDate',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'dtlEndDate', className : 'text-center align-middle', name: 'dtlEndDate',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="min-width:145px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{ data: 'dtlWorkChargr', className : 'text-center align-middle', name: 'dtlWorkChargr',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; min-width:150px;">'+data+'</div>';
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{
				data: 'workContents', className : 'text-center align-middle', name: 'workContents',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:pre-line;min-width:400px;">'+data+'</div>';
					} else {
						return '<div style="white-space:pre-line;min-width:400px;"></div>';
					}
						
				}
			},
			{ data: 'workDesc', className : 'text-center align-middle', name: 'workDesc',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden; min-width:200px;">'+data+'</div>';
					} else {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
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
			let theadHeight = parseFloat($('#workProgressResultDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#workProgressResultDtlTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#workProgressResultDtlTable_filter').addClass('d-none');
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
					let selectData = workProgressResultDtlTable.row(item).data();
					if( workProgressResultDtlTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(workProgressResultDtlTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(workProgressResultDtlTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#workProgressResultDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#workProgressResultDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	workProgressResultDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = workProgressResultDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#workProgressResultDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 실행결과 디테일 수정 버튼 click
	$('#btnDtlEdit').on('click', function() {
		if($('[name=dtlCheckBox]:checked').length == 0){
			toastr.warning('수정할 행을 선택해주세요.');
			return false;
		}
		
		WM_action_ON('edit','workingWarningModal');
		
		$('#workProgressResultDtlTable tbody').find('tr').each(function(index_tr, tr) {
			if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
				$(tr).find('td').each(function(index_td, td) {
					if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
						if(index_td == workProgressResultDtlTable.column('workCheck:name').index()) {
							let value = workProgressResultDtlTable.row(tr).data().workCheck;
							let html = '';
							if(value=='Y') {
								html += '<input name="workCheck" class="form-check-input" type="checkbox" style="margin: 0px; min-width: 25px; height: 25px;" checked>';
							} else {
								html += '<input name="workCheck" class="form-check-input" type="checkbox" style="margin: 0px; min-width: 25px; height: 25px;">';
							}
							$(td).html(html);
						} else if(index_td == workProgressResultDtlTable.column('dtlStartDate:name').index()) {
							let value = $(td).text();
							if(value=='') {
								$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
							} else {
								$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+value+'">');
							}
						} else if(index_td == workProgressResultDtlTable.column('dtlEndDate:name').index()) {
							let value = $(td).text();
							if(value=='') {
								$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
							} else {
								$(td).html('<input type="date" style="min-width:145px;" max="9999-12-31" name="orderDate" class="form-control" value="'+value+'">');
							}
						} else if(index_td == workProgressResultDtlTable.column('dtlWorkChargr:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:150px;" class="form-control" value="'+value+'">');
						} else if(index_td == workProgressResultDtlTable.column('workContents:name').index()) {
							let value = $(td).text();
							let height = $(td).height()+5;
							$(td).html('<textarea class="form-control" style="min-width:400px; resize: none; min-height: '+height+'px;" >'+value+'</textarea>');
						} else if(index_td == workProgressResultDtlTable.column('workDesc:name').index()) {
							let value = $(td).text();
							$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
						}
					}
				})
			}
		});
		
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
		
		
		$('#btnDtlSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnDtlEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDtlCancel').attr('disabled', false); // ADM 취소 버튼

		
		$('#btnSearch').attr('disabled', true); // 조회버튼
		$('#btnadmEdit').attr('disabled', true); // ADM 수정 버튼
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
				idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				workProgressResultAdmTable.row('#'+idx).select();
				$(workProgressResultAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				
				$('#btnManagerAdd').attr('disabled', true); // 추가 버튼
				$('#btnManagerDel').attr('disabled', true); // 삭제 버튼
				$('#btnFileAdd').attr('disabled', true); // 추가 버튼
				$('#btnFileDel').attr('disabled', true); // 삭제 버튼
				formData = new FormData();
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
				$('#btnManagerAdd').attr('disabled', true); // 추가 버튼
				$('#btnManagerDel').attr('disabled', true); // 삭제 버튼
				$('#btnFileAdd').attr('disabled', true); // 추가 버튼
				$('#btnFileDel').attr('disabled', true); // 삭제 버튼
				formData = new FormData();
			}
			
			return false;
		}
	});
	
	// 저장 버튼 click
	$('#btnDtlSave').on('click', function() {
		let array = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
				$('#workProgressResultDtlTable tbody').find('tr').each(function(index, item) {
					if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
						let td = $(item).find('td');
						let data = workProgressResultDtlTable.row($(item)).data();
						let node = workProgressResultDtlTable.row($(item)).node();

						let largeIdx = workProgressResultDtlTable.row($(item)).data().largeIdx;
						let mediumIdx = workProgressResultDtlTable.row($(item)).data().mediumIdx;
						let smallIdx = workProgressResultDtlTable.row($(item)).data().smallIdx;
						
						let dtlStartDate = $(td).eq(workProgressResultDtlTable.column('dtlStartDate:name').index()).find('input').val();
						let dtlEndDate = $(td).eq(workProgressResultDtlTable.column('dtlEndDate:name').index()).find('input').val();
						let dtlWorkChargr = $(td).eq(workProgressResultDtlTable.column('dtlWorkChargr:name').index()).find('input').val();
						let workCheck = '';
						if($(this).find('input[name=workCheck]').is(':checked')) {
							workCheck = 'Y';
						} else {
							workCheck = 'N';
						}
						let workContents = $(td).eq(workProgressResultDtlTable.column('workContents:name').index()).find('textarea').val();
						let workDesc = $(td).eq(workProgressResultDtlTable.column('workDesc:name').index()).find('input').val();

						let obj = new Object();
						obj.bizOrdAdmIdx = bizOrdAdmIdx;
						obj.largeIdx = largeIdx;
						obj.mediumIdx = mediumIdx;
						obj.smallIdx = smallIdx;
						obj.dtlStartDate = dtlStartDate.replace(/-/g, '');
						obj.dtlEndDate = dtlEndDate.replace(/-/g, '');
						obj.dtlWorkChargr = dtlWorkChargr;
						obj.workCheck = workCheck;
						obj.workContents = workContents;
						obj.workDesc = workDesc;
						obj.workStatus = workStatus;
						obj.admIdx = admIdx;

						if(workProgressResultDtlTable.row($(item)).data().workCheck==null) {
							obj.status = 'insert';
						} else {
							obj.status = 'update';
						}
						
						array.push(obj);
					}
				});

				//원본 데이터
				let tableData = [];
				$('#workProgressResultDtlTable tbody').find('tr').each(function(index, item) {
					if($(this).find('input[name=dtlCheckBox]').is(':checked')) {
						let obj = {};
						let data = workProgressResultDtlTable.row(index).data();
						obj.bizOrdAdmIdx = bizOrdAdmIdx;
						obj.largeIdx = data.largeIdx;
						obj.mediumIdx = data.mediumIdx;
						obj.smallIdx = data.smallIdx;
						obj.dtlStartDate = data.dtlStartDate;
						obj.dtlEndDate = data.dtlEndDate;
						obj.dtlWorkChargr = data.dtlWorkChargr;
						obj.workCheck = data.workCheck;
						obj.workContents = data.workContents;
						obj.workDesc = data.workDesc;
						obj.status = 'update';
						obj.workStatus = workStatus;
						obj.admIdx = admIdx;
						tableData.push(obj);
					}
				});
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)
				
				$.ajax({
					url: '<c:url value="/wm/workProgressResultDtlIu"/>',
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
							WM_action_OFF('edit');
							workProgressResultDtlTable.rows('.selected').deselect();
							workProgressResultDtlTable.ajax.reload();
							workProgressResultAdmTable.ajax.reload();
							$('#btnDtlSave').attr('disabled',true);
							$('#btnDtlEdit').attr('disabled',false);
							$('#btnDtlCancel').attr('disabled',true);
							$('#my-spinner').hide();
							$('#dtlAllCheckBox').prop("checked", false);
							$('#btnSearch').attr('disabled', false); // 조회버튼
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			},100)
		})
		$('#my-spinner').hide();
	});

	// 취소 버튼 click
	$('#btnAdmCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});
	$('#btnDtlCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');

		WM_action_OFF('new');
		WM_action_OFF('edit');


		
		workProgressResultAdmTable.ajax.reload(function() {});
		workProgressResultDtlTable.ajax.reload(function() {});

		$('#btnAdmSave').attr('disabled', true); // 저장 버튼
		$('#btnDtlSave').attr('disabled', true); // 저장 버튼
		$('#btnAdmEdit').attr('disabled', false); // 수정 버튼
		$('#btnDtlEdit').attr('disabled', true); // 수정 버튼
		$('#btnAdmCancel').attr('disabled', true); // 취소 버튼
		$('#btnDtlCancel').attr('disabled', true); // 취소 버튼
	});

	//전체선택클릭
	$('#dtlAllCheckBox').on('click',function(){
		if ( $('#dtlAllCheckBox').prop("checked") ) {
			$('#workProgressResultDtlTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", true);
				}
			});
		} else {
			$('#workProgressResultDtlTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=dtlCheckBox]').is(':disabled') ) {
					$(this).find('input:checkbox[name=dtlCheckBox]').prop("checked", false);
				}
			});
		}
	});
	
</script>

</body>
</html>