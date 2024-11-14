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
																		  grid-template-columns: 3fr 4px 7fr;">
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
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<!-- 
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end w-100">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnProjectFile">기술문서</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">
						<input type="file" class="d-none" id="excelUploadFile" name="excelfile">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button></form>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			 -->
			<div class="row">
				<div style="width: 100%;">
					<div class="nav nav-tabs" id="moduleTabs">
						<button onclick="tableHeaderReload('001')" class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">기구</button>
						<button onclick="tableHeaderReload('002')" class="nav-link" id="tab2Nav" data-bs-toggle="tab" data-bs-target="#tab2">전장</button>
						<button onclick="tableHeaderReload('003')" class="nav-link" id="tab3Nav" data-bs-toggle="tab" data-bs-target="#tab3">광학</button>
						<button class="nav-link" id="tab4Nav" data-bs-toggle="tab" data-bs-target="#tab4">기타</button>
				  	</div>
				  	<div style="width: 100%;">
				  		<div class="tab-content" id="nav-tabContent">
							<div class="tab-pane fade show active" id="tab1">
								<table class="table table-bordered p-0 m-0" id="projectFile001Table">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">No.</th>
											<th class="text-center align-middle">문서명</th>
											<th class="text-center align-middle">파일명</th>
											<th class="text-center align-middle">작성자</th>
											<th class="text-center align-middle">부서</th>
											<th class="text-center align-middle">비고</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="tab-pane fade" id="tab2">
								<table class="table table-bordered p-0 m-0" id="projectFile002Table">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">No.</th>
											<th class="text-center align-middle">문서명</th>
											<th class="text-center align-middle">파일명</th>
											<th class="text-center align-middle">작성자</th>
											<th class="text-center align-middle">부서</th>
											<th class="text-center align-middle">비고</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="tab-pane fade" id="tab3">
								<table class="table table-bordered p-0 m-0" id="projectFile003Table">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">No.</th>
											<th class="text-center align-middle">문서명</th>
											<th class="text-center align-middle">파일명</th>
											<th class="text-center align-middle">작성자</th>
											<th class="text-center align-middle">부서</th>
											<th class="text-center align-middle">비고</th>
										</tr>
									</thead>
								</table>
							</div>
							<div class="tab-pane fade" id="tab4">
								<table class="table table-bordered p-0 m-0" id="projectFile004Table">
									<thead class="table-light">
										<tr>
											<th class="text-center align-middle">No.</th>
											<th class="text-center align-middle">문서명</th>
											<th class="text-center align-middle">파일명</th>
											<th class="text-center align-middle">작성자</th>
											<th class="text-center align-middle">부서</th>
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
	</div>
</div>
<!-- 삭제 경고 -->
<div class="modal fade" id="fileDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> <spring:message code="modal.warning" text="default text" />
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<spring:message code="modal.deleteGuide" text="default text" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnFileDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="yes" text="default text" />
				</button>
				<button type="button" class="btn btn-secondary" id="btnFileDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					<spring:message code="no" text="default text" />
				</button>
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
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 7fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '3fr 4px 0fr');
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
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	let formData = new FormData();
	let deleteData = '';
	let maxVersion = '';

	let bizOrdAdmIdx = '';
	let projectIdx = '';
	let moduleGubun = '';
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
			{ data: 'ordDate', className : 'text-center'},
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
		
		$('#goodsNm').val(bizOrderAdmTable.row(this).data().goodsNm);
		$('#ordDate').val(moment(bizOrderAdmTable.row(this).data().ordDate).format('YYYY-MM-DD'));
		$('#bizOrdNo').val(bizOrderAdmTable.row(this).data().bizOrdNo);
		$('#prjCd').val(bizOrderAdmTable.row(this).data().prjCd);
		$('#ordQty').val(addCommas(parseInt(bizOrderAdmTable.row(this).data().ordQty)));
		$('#selectVersion').removeClass('d-none');
		$('#textVersion').addClass('d-none');

		$('.batchText').addClass('d-none');
		$('#batchQty').addClass('d-none');
		$('#batchOrderDate').addClass('d-none');
		$('#btnBatchApply').addClass('d-none');
		$('#imageTab').addClass('d-none');
		$('#projectDtlTable_wrapper').removeClass('d-none');
		$('#dtlAllCheckBox').prop('checked', false);
		bizOrdAdmIdx = bizOrderAdmTable.row(this).data().idx;
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnDel').attr('disabled', false); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		projectFile001Table.ajax.reload(function() {});
		projectFile002Table.ajax.reload(function() {});
		projectFile003Table.ajax.reload(function() {});
	});

	// 프로젝트 파일 조회
	let projectFile001Table = $('#projectFile001Table').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
        fixedHeader: false,
        scrollY: '91vh',
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
			url : '<c:url value="/rm/projectFileLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx : function() { return bizOrdAdmIdx; },
				inputGubun	 :	'001'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return (meta.row+1);
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
					}
				}
			},
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel()" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'fileDesc', className : 'text-center align-middle', name : "fileDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	let projectFile002Table = $('#projectFile002Table').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
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
			url : '<c:url value="/rm/projectFileLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx : function() { return bizOrdAdmIdx; },
				inputGubun	 :	'002'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return (meta.row+1);
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
					}
				}
			},
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel()" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'fileDesc', className : 'text-center align-middle', name : "fileDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	let projectFile003Table = $('#projectFile003Table').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
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
			url : '<c:url value="/rm/projectFileLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx : function() { return bizOrdAdmIdx; },
				inputGubun	 :	'003'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return (meta.row+1);
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
					}
				}
			},
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel()" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'fileDesc', className : 'text-center align-middle', name : "fileDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	let projectFile004Table = $('#projectFile004Table').DataTable({
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: false,
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
			url : '<c:url value="/rm/projectFileLst"/>',
			type : 'GET',
			data : {
				bizOrdAdmIdx : function() { return bizOrdAdmIdx; },
				inputGubun	 :	'004'
			},
		},
        rowId: 'idx',
		columns : [
			{
				render: function(data, type, row, meta) {
					return (meta.row+1);
				}, "className": "text-center align-middle"
			},
			{ data: 'documentNm', "className": "text-center align-middle", name : "documentNm",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:200px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:200px;" class="form-control">';
					}
				}
			},
			{ data: 'fileName', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return "<a style='min-width:150px;' href=\"#\" onclick=\"projectFileDownload(\'"+row['uuid']+"\',\'"+row['fileName']+"\',\'"+row['fileExt']+"\')\">"+row['fileName']+"."+row['fileExt']+"</a>";
					} else {
						return '<div style="min-width:150px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'.'+row['fileExt']+'</div>';
					}
				}
			},
			{ data: 'userIdx', className : 'text-center align-middle', name: 'userIdx', 
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space:nowrap;">'+row['userNm']+'</div>';
					} else {
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+userIdx+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+userName+'" disabled>';
						html += '<button type="button" onclick="userSel()" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						return html;
					}
				}
			},
			{ data: 'userDepartNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+data+'</div>';
					} else {
						return '<div style="white-space:nowrap;" name="userDepartmentNm">'+userDepartmentNm+'</div>';
					}
				}
			},
			{ data: 'fileDesc', className : 'text-center align-middle', name : "fileDesc",
				render: function(data, type, row, meta) {
					if(row['idx']!=null) {
						return '<div style="min-width:300px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" style="min-width:300px;" class="form-control">';
					}
				}
			},
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpFileTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 120)+'px');
		},
		columnDefs : [],
		buttons : [],
		order : [],
	});

	$('#btnProjectFileEdit').on('click', function() {
		if( $('#projectFileTable').DataTable().rows().count()==0 ){
			toastr.warning('수정할 데이터가 없습니다.');
			return false;
		}
		$('#projectFileTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(td).find('select').length == 0) {
					if(index_td == projectFileTable.column('documentNm:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:200px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectFileTable.column('fileDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:300px;" class="form-control" value="'+value+'">');
					} else if(index_td == projectFileTable.column('userIdx:name').index()) {
						let value = projectFileTable.row(tr).data().userIdx;
						let value2 = projectFileTable.row(tr).data().userNm;
						let html = '';
						html += '<div style="width:200px; display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" name="userIdx" value="'+value+'">';
						html += '<input type="text" class="form-control inputGroup" name="userName" value="'+value2+'" disabled>';
						html += '<button type="button" onclick="userSel()" class="btn btn-primary input-sub-search inputGroup" name="fileUserSel" style="padding: 1px 4px; margin-left: 0px;">';
						html += '<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button></div>';
						$(td).html(html);
					}
				}
			})
		});
		$('#btnProjectFileSave').attr('disabled', false);
	});

	// 관련파일 추가 버튼 클릭
	$('#btnProjectFileAdd').on('click', function() {
		$('#projectFile').trigger('click');
	});

	// 파일 선택
	$('#projectFile').on('change',function() {
		let fileInput = document.getElementById("projectFile"); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			
			$('#projectFileTable').DataTable().row.add({
				'idx'		: null,
				'documentNm': '',
				'uuid'		: uuid,
				'fileName'	: fileFullNm,
				'fileExt'	: files[i].name.split('.').at(-1)
			}).draw(false);
			
			fileFormData.append('file-'+uuid,files[i]);
			fileFormData.append('uuid-'+uuid,uuid);
			fileFormData.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
		fileNumber = 1;
    	$('#projectFileTable tbody tr').each(function(index, item){
    		$(this).find("div[name=fileIndex]").text(fileNumber);
    		fileNumber++;
        });
    	$('#btnProjectFileSave').attr('disabled', false);
    	$('#projectFile').val('');
	})
	
	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	// 관련파일 삭제 버튼 클릭
	$('#btnProjectFileDel').on('click', function() {
		
		if ($('#projectFileTable tbody').find('tr.selected').length == 0) {
			toastr.warning("삭제할 데이터를 선택해 주세요.");
			return false;
		}
		
		if($('#projectFileTable').DataTable().row('.selected').data().idx!=null) {
			deleteData = 'FILE';
			$('#fileDeleteModal').modal('show');
		} else {
			let uuid = projectFileTable.row('.selected').data().uuid;
			formData.delete('file-'+uuid);
			formData.delete('uuid-'+uuid);
			formData.delete('ext-'+uuid);
			$('#projectFileTable').DataTable().row('.selected').remove().draw();
			fileNumber = 1;
	    	$('#projectFileTable tbody tr').each(function(index, item){
	    		$(this).find("div[name=fileIndex]").text(fileNumber);
	    		fileNumber++;
	        });
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		idx = projectFileTable.row('.selected').data().idx;
		
		$.ajax({
			url: '<c:url value="/rm/projectFileDel"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'			:	idx,
                'bizOrdAdmIdx'	:	bizOrdAdmIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				let uuid = $('#projectFileTable').DataTable().row('.selected').data().uuid;;
				let ext = $('#projectFileTable').DataTable().row('.selected').data().fileExt;
				fileDelete({uuid:uuid,ext:ext});
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#projectFileTable').DataTable().row('.selected').remove().draw();
					fileNumber = 1;
			    	$('#projectFileTable tbody tr').each(function(index, item){
			    		$(this).find("div[name=fileIndex]").text(fileNumber);
			    		fileNumber++;
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

	// 저장 버튼 click
	$('#btnProjectFileSave').on('click', function() {
		let array = [];
		new Promise((resolve, reject) => {
			setTimeout(function() {
				$('#my-spinner').show();
			},50)
			$('#my-spinner').show();
			setTimeout(function() {
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
				
				console.log(saveFileFormData)

				$('#projectFileTable tbody').find('tr').each(function(index, item) {
					let td = $(item).find('td');
					let data = projectFileTable.row($(item)).data();
					let node = projectFileTable.row($(item)).node();
					
					let idx = projectFileTable.row($(item)).data().idx;
					let documentNm = $(td).eq(projectFileTable.column('documentNm:name').index()).find('input').val();
					let userIdx = $(td).eq(projectFileTable.column('userIdx:name').index()).find('input').val();
					let uuid = projectFileTable.row($(item)).data().uuid;
					let fileName = projectFileTable.row($(item)).data().fileName;
					let fileExt = projectFileTable.row($(item)).data().fileExt;
					let fileDesc = $(td).eq(projectFileTable.column('fileDesc:name').index()).find('input').val();

					let obj = new Object();
					obj.bizOrdAdmIdx = bizOrdAdmIdx;
					obj.idx = idx;
					obj.inputGubun = "001";
					obj.documentNm = documentNm;
					obj.userIdx = userIdx;
					obj.uuid = uuid;
					obj.fileName = fileName;
					obj.fileExt = fileExt;
					obj.fileDesc = fileDesc;
					array.push(obj);
				});

				//원본 데이터
				let tableData = [];
				$('#projectFileTable tbody').find('tr').each(function(index, item) {
					let obj = {};
					let data = projectFileTable.row(index).data();
					obj.bizOrdAdmIdx = bizOrdAdmIdx;
					obj.idx = data.idx;
					obj.inputGubun = '001';
					obj.documentNm = data.documentNm;
					obj.userIdx = data.userIdx;
					obj.uuid = data.uuid;
					obj.fileName = data.fileName;
					obj.fileExt = data.fileExt;
					obj.fileDesc = data.fileDesc;
					
					tableData.push(obj);
				});
				
				console.log(array)
				console.log(tableData)
				array = _.differenceWith(array, tableData, _.isEqual);
				console.log(array)

				
				$.ajax({
					url: '<c:url value="/rm/projectFileInsUpd"/>',
					type : 'POST',
					async: false,
					datatype: 'json',
					data: JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
						fileNumber = 0;
						fileFormData = new FormData();
						projectFileTable.ajax.reload(function() {});
						$('#btnProjectFileSave').attr('disabled', true);
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide();
					},
				});
				
			},100)
		})
	});

	function tableHeaderReload(tabValue) {
		if(tabValue=='001') {
			setTimeout(function() {
				$('#projectFile001Table').DataTable().ajax.reload(function(){
					projectFile001Table.draw(false);
				});
			}, 100);
		} else if(tabValue=='002') {
			setTimeout(function() {
				$('#projectFile002Table').DataTable().ajax.reload(function(){
					projectFile001Table.draw(false);
				});
			}, 100);
		} else if(tabValue=='003') {
			setTimeout(function() {
				$('#projectFile003Table').DataTable().ajax.reload(function(){
					projectFile001Table.draw(false);
				});
			}, 100);
		} else {
			setTimeout(function() {
				$('#projectFile004Table').DataTable().ajax.reload(function(){
					projectFile001Table.draw(false);
				});
			}, 100);
		}
	}
	
</script>

</body>
</html>