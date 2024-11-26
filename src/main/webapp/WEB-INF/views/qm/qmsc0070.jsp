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
																		  grid-template-columns: 4fr 4px 6fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트 기간</label>
					<input type="date" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" class="form-control w-auto h-100 me-3" id="endDate">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
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
				<table class="table table-bordered p-0 m-0" id="projectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">프로젝트명</th>
							<th class="text-center">시리얼번호</th>
							<th class="text-center">품목유형</th>
							<th class="text-center">품명</th>
							<th class="text-center">진행율</th>
							<th class="text-center">목표일자</th>
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
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew" disabled><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="12%"><col width="12%"><col width="12%"><col width="12%"><col width="12%"><col width="12%"><col width="12%"><col width="12%">
					</colgroup>
					<tr>
						<th class="text-center align-middle">프로젝트번호</th>
						<td class="text-center align-middle" id="projectCd"></td>
						<th class="text-center align-middle">프로젝트명</th>
						<td class="text-center align-middle" id="projectNm"></td>
						<th class="text-center align-middle">품명유형</th>
						<td class="text-center align-middle" id="goodsTypeNm"></td>
						<th class="text-center align-middle">품명</th>
						<td class="text-center align-middle" id="goodsNm"></td>
					</tr>
					<tr>
						<th class="text-center align-middle">프로젝트수량</th>
						<td class="text-center align-middle" id="projectQty"></td>
						<th class="text-center align-middle">시리얼번호</th>
						<td class="text-center align-middle" id="serialNo"></td>
						<th class="text-center align-middle">목표일자</th>
						<td class="text-center align-middle" id="targetDate"></td>
						<th class="text-center align-middle">수주구분</th>
						<td class="text-center align-middle" id="bizOrdGubunNm"></td>
					</tr>
					<tr>
						<th class="text-center align-middle">제조 책임자</th>
						<td class="text-center align-middle">
							<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="text" class="form-control" id="produceUserNm" disabled>
								<input type="hidden" id="produceUserIdx" disabled>
								<button type="button" class="input_group btnUserDel" style="background-color: transparent;
																							border-color: transparent;
																							position: absolute;
																							top: 0;
																							right:0;
																							margin: 1px 23px;
																							margin-left: 0px;
																							border: none;" disabled>
									<i class="fa-solid fa-xmark"></i>
								</button>												
								<button type="button" class="btn btn-primary input-sub-search input_group btnUserSel" style="padding: 1px 4px; margin-left: 0px;" disabled>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</td>
						<th class="text-center align-middle">QA 책임자</th>
						<td class="text-center align-middle">
							<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="text" class="form-control" id="qaUserNm" disabled>
								<input type="hidden" id="qaUserIdx" disabled>
								<button type="button" class="input_group btnUserDel" style="background-color: transparent;
																							border-color: transparent;
																							position: absolute;
																							top: 0;
																							right:0;
																							margin: 1px 23px;
																							margin-left: 0px;
																							border: none;" disabled>
									<i class="fa-solid fa-xmark"></i>
								</button>												
								<button type="button" class="btn btn-primary input-sub-search input_group btnUserSel" style="padding: 1px 4px; margin-left: 0px;" disabled>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</td>
						<th class="text-center align-middle">작성자</th>
						<td class="text-center align-middle">
							<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="text" class="form-control" id="admUserNm" disabled>
								<input type="hidden" id="admUserIdx" disabled>
								<button type="button" class="input_group btnUserDel" style="background-color: transparent;
																							border-color: transparent;
																							position: absolute;
																							top: 0;
																							right:0;
																							margin: 1px 23px;
																							margin-left: 0px;
																							border: none;" disabled>
									<i class="fa-solid fa-xmark"></i>
								</button>												
								<button type="button" class="btn btn-primary input-sub-search input_group btnUserSel" style="padding: 1px 4px; margin-left: 0px;" disabled>
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</td>
						<th class="text-center align-middle">작성일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control" id="inspectDateAdm" disabled>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">승인여부</th>
						<td class="text-center align-middle"></td>
						<th class="text-center align-middle">승인일</th>
						<td class="text-center align-middle"></td>
						<th class="text-center align-middle">비고</th>
						<td class="text-center align-middle" colspan="3">
							<input type="text" class="form-control inputGroup" id="inspectAdmDesc">
						</td>
					</tr>
				</table>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="inspectDtlTable">
					<colgroup>
						<col width="1%">
						<col width="5%">
						<col width="4%">
						<col width="2%">
						<col width="2%">
						<col width="3%">
						<col width="3%">
						<col width="2%">
						<col width="5%">
						<col width="5%">
					</colgroup>
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No</th>
							<th class="text-center align-middle">Items</th>
							<th class="text-center align-middle">확인부서</th>
							<th class="text-center align-middle">확인</th>
							<th class="text-center align-middle">검사상태</th>
							<th class="text-center align-middle">검사자</th>
							<th class="text-center align-middle">완료일자</th>
							<th class="text-center align-middle">검사결과</th>
							<th class="text-center align-middle">비고</th>
							<th class="text-center align-middle">첨부자료</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 파일 삭제 모달 -->
<div class="modal fade" id="fileDeleteModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> 경고
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				삭제된 내용은 복구할 수 없습니다.<br>삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="btnFileDeleteModalY" data-bs-dismiss="modal" style="width: 70px;">
					예
				</button>
				<button type="button" class="btn btn-secondary" id="btnFileDeleteModalN" data-bs-dismiss="modal" style="width: 70px;">
					아니요
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

	let OS = "${OS}";
	let projectIdxVal = '';
	let serialNoIdxVal = '';
	let inspectAdmIdxVal = '';
	const inspectGubunVal = '004';

	let departmentList = getCommonCode('시스템', '002'); // 부서

	// 프로젝트 목록조회
	$('#projectTable thead tr').clone(true).addClass('filters').appendTo('#projectTable thead'); // filter 생성
	let projectTable = $('#projectTable').DataTable({
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
			url : '<c:url value="/qm/inspectProjectSerialLst"/>',
			type : 'POST',
			data : {
				'startDate': function() { return $('#startDate').val(); },
				'endDate': function() { return $('#endDate').val(); },
				'inspectGubun': function() { return inspectGubunVal; },
			},
		},
        rowId: 'serialIdx',
		columns : [
			{ data: 'projectCd', className : 'text-center'},
			{ data: 'projectNm', className : 'text-center'},
			{ data: 'serialNo', className : 'text-center'},
			{ data: 'goodsTypeNm', className : 'text-center'},
			{ data: 'goodsNm', className : 'text-center'},
			{ data: 'inspectPercent', className : 'text-end',
				render: function(data, type, row, meta) {
					return parseFloat(data).toFixed(2) + '%';
				}
			},
			{ data: 'targetDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#projectTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#projectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#projectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	projectTable.on('column-reorder', function( e, settings, details ) {
		let api = projectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#projectTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		projectTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100);
	});

	// 검사결과 상세 목록조회
	$('#inspectDtlTable thead tr').clone(true).addClass('filters').appendTo('#projectTable thead'); // filter 생성
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
        	url : '<c:url value="/qm/inspectDtlLst"/>',
			type : 'POST',
			data : {
				'projectIdx':	function (){return projectIdxVal;},
				'serialNoIdx':	function (){return serialNoIdxVal;},
				'inspectAdmIdx':	function (){return inspectAdmIdxVal;},
				'inspectGubun':		inspectGubunVal,
			},
		},
        rowId: 'idx',
		columns : [
			{ className: 'text-center',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'inspectItem', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<input type="text" class="form-control input_group" value="'+data+'" style="min-width: 300px;" disabled>';
					return html;
				}
			},
			{ data: 'inspectDepartment', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<select class="form-select input_group" style="min-width:110px;" disabled>';
						for(var i=0;i<departmentList.length;i++) {
							if(departmentList[i].commonCd == data) {
								html +='	<option value="'+departmentList[i].commonCd+'" selected>'+departmentList[i].commonNm+'</option>';
							} else {
								html +='	<option value="'+departmentList[i].commonCd+'">'+departmentList[i].commonNm+'</option>';
							}
						}
						html += '</select>';
					return html;
				}
			},
			{ data: 'inspectCheck', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<select class="form-select input_group" style="min-width:80px;" disabled>';
						if(data == '001') {
							html +='	<option value="001" selected>checked</option>';
							html +='	<option value="002">skip</option>';
						} else if(data == '002') {
							html +='	<option value="001">checked</option>';
							html +='	<option value="002" selected>skip</option>';
						} else {
							html +='	<option value="001" selected>checked</option>';
							html +='	<option value="002">skip</option>';
						}
						html += '</select>';
					return html;
				}
			},
			{ data: 'inspectStatus', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<select class="form-select input_group" style="min-width:60px;" disabled>';
						if(data == '001') {
							html +='	<option value="001" style="color: #cccccc;" selected>대기</option>';
							html +='	<option value="002" style="color: #00ff00;">진행중</option>';
							html +='	<option value="003" style="color: #0000ff;">완료</option>';
						} else if(data == '002') {
							html +='	<option value="001" style="color: #cccccc;">대기</option>';
							html +='	<option value="002" style="color: #00ff00;" selected>진행중</option>';
							html +='	<option value="003" style="color: #0000ff;">완료</option>';
						} else if(data == '003') {
							html +='	<option value="001" style="color: #cccccc;">대기</option>';
							html +='	<option value="002" style="color: #00ff00;">진행중</option>';
							html +='	<option value="003" style="color: #0000ff;" selected>완료</option>';
						} else {
							html +='	<option value="001" style="color: #cccccc;" selected>대기</option>';
							html +='	<option value="002" style="color: #00ff00;">진행중</option>';
							html +='	<option value="003" style="color: #0000ff;">완료</option>';
						}
						html += '</select>';
					return html;
				}
			},
			{ data: 'inspectUserIdxDtl', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto; min-width: 110px;" class="input-group">';
						html += '	<input type="text" class="form-control" value="'+(row['inspectUserNmDtl']==null?'':row['inspectUserNmDtl'])+'" disabled>';
						html += '	<input type="hidden" value="'+data+'" disabled>';
						html += '	<button type="button" class="input_group btnUserDel" style="background-color: transparent;';
						html += '																border-color: transparent;';
						html += '																position: absolute;';
						html += '																top: 0;';
						html += '																right:0;';
						html += '																margin: 1px 23px;';
						html += '																margin-left: 0px;';
						html += '																border: none;" disabled>';
						html += '		<i class="fa-solid fa-xmark"></i>';
						html += '	</button>';												
						html += '	<button type="button" class="btn btn-primary input-sub-search input_group btnUserSel" style="padding: 1px 4px; margin-left: 0px;" disabled>';
						html += '		<i class="fa-solid fa-magnifying-glass"></i>';
						html += '	</button>';
						html += '</div>';
						html += '<input type="hidden">';
					return html;
				}
			},
			{ data: 'inspectDate', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<input type="date" class="form-control input_group" style="min-width: 100px;" value="'+moment(data).format('YYYY-MM-DD')+'" disabled>';
					return html;
				}
			},
			{ data: 'inspectResult', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<select class="form-select input_group" style="min-width:60px;" disabled>';
						if(data == '001') {
							html +='	<option value="001" style="color: #00ff00;" selected>합격</option>';
							html +='	<option value="002" style="color: #ff0000;">불합격</option>';
							html +='	<option value="003" style="color: #cccccc;">NA</option>';
						} else if(data == '002') {
							html +='	<option value="001" style="color: #00ff00;">합격</option>';
							html +='	<option value="002" style="color: #ff0000;" selected>불합격</option>';
							html +='	<option value="003" style="color: #cccccc;">NA</option>';
						} else if(data == '003') {
							html +='	<option value="001" style="color: #00ff00;">합격</option>';
							html +='	<option value="002" style="color: #ff0000;">불합격</option>';
							html +='	<option value="003" style="color: #cccccc;" selected>NA</option>';
						} else {
							html +='	<option value="001" style="color: #00ff00;">합격</option>';
							html +='	<option value="002" style="color: #ff0000;">불합격</option>';
							html +='	<option value="003" style="color: #cccccc;" selected>NA</option>';
						}
						html += '</select>';
					return html;
				}
			},
			{ data: 'inspectDtlDesc', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<input type="text" class="form-control input_group" value="'+data+'" style="min-width: 300px;" disabled>';
					return html;
				}
			},
			{ data: 'fileName', className: 'text-center',
				render: function(data, type, row, meta) {
					let html = '';
						html += '<div style="min-width: 300px;" class="input-group">';
						html += '	<input type="hidden" class="inspect_file_uuid" value="'+row['uuid']+'">';
						if(data != '') {
							html += '	<input type="text" class="form-control inspect_filename" value="'+row['fileName']+'.'+row['fileExt']+'"';
							html += '		data-filename="'+row['fileName']+'" data-fileext="'+row['fileExt']+'" readonly>';
						} else {
							html += '	<input type="text" class="form-control inspect_filename" readonly>';
						}
						html += '	<input type="file" class="d-none inspect_file">';
						html += '	<button type="button" class="btnFileDelete input_group"';
						html += '		style="background-color: transparent; border-color: transparent;';
						html += '		position: absolute; top: 0; right: 0;';
						html += '		margin: 1px 23px 1px 0px;';
						html += '		border: none;" disabled>';
						html += '		<i class="fa-solid fa-xmark"></i>';
						html += '	</button>';												
						html += '	<button type="button" class="btn btn-primary input-sub-search btnUpload input_group" style="padding: 1px 4px; margin-left: 0px;" disabled>';
						html += '		<i class="fa-solid fa-upload"></i>';
						html += '	</button>';
						html += '</div>';
					return html;
				}
			},
		],
		columnDefs : [
			{
				targets: [0],
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#inspectDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 211)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('select').trigger('change');
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

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
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
			$('#inspectDtlTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$(document).on('change', 'select', function() {
		let color = $('option:selected', this).css('color');
		$(this).css('color', color);
	});

	// 프로젝트 목록 click
	$('#projectTable tbody').on('click','tr', function() {
		$('#my-spinner').show();

		let projectData = projectTable.row(this).data();
		projectIdxVal = projectData.idx;
		serialNoIdxVal = projectData.serialIdx;

		$('#projectCd').text(projectData.projectCd);
		$('#projectNm').text(projectData.projectNm);
		$('#goodsTypeNm').text(projectData.goodsTypeNm);
		$('#goodsNm').text(projectData.goodsNm);
		$('#projectQty').text(projectData.projectQty);
		$('#serialNo').text(projectData.serialNo);
		$('#targetDate').text(projectData.targetDate);
		$('#bizOrdGubunNm').text(projectData.bizOrdGubunNm);

		$('.input_group').attr('disabled', true);
		$('#inspectAdmDesc').attr('disabled', true);
		
		//if(WMCheck('new')) { // 신규등록중일 경우
		//	setWM('new', 'idx', idx);
		//	return false;
		//}
		//if(WMCheck('edit')) { // 수정중일 경우
		//	setWM('edit', 'idx', idx);
		//	return false;
		//}
		
		
		
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		

		setTimeout(function() {
			$.ajax({
				url: '<c:url value="/qm/inspectAdmSel"/>',
	            type: 'POST',
	            data: {
	                'projectIdx':	projectIdxVal,
	                'serialNoIdx':	serialNoIdxVal,
	                'inspectGubun':	inspectGubunVal
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						let data = res.data;

						
						if(data == null) {
							inspectAdmIdxVal = '';
							
							$('.input_group').val('');
							$('#produceUserNm').val('');
							$('#qaUserNm').val('');
							$('#admUserNm').val('');
							$('#inspectAdmDesc').val('');
							
							$('#btnNew').attr('disabled', false); // 신규 버튼
							$('#btnEdit').attr('disabled', true); // 수정 버튼
						} else {
							inspectAdmIdxVal = data.idx;

							
							$('#produceUserIdx').val(data.produceUserIdx);
							$('#produceUserNm').val(data.produceUserNm);
							$('#qaUserIdx').val(data.qaUserIdx);
							$('#qaUserNm').val(data.qaUserNm);
							$('#admUserIdx').val(data.inspectUserIdxAdm);
							$('#admUserNm').val(data.inspectUserNm);
							$('#inspectDateAdm').val(moment(data.inspectDateAdm).format('YYYY-MM-DD'));
							$('#inspectAdmDesc').val(data.inspectAdmDesc);
							
							
							$('#btnNew').attr('disabled', true); // 신규 버튼
							$('#btnEdit').attr('disabled', false); // 수정 버튼
						}
						
						inspectDtlTable.ajax.reload(function() {
							$('#my-spinner').hide();
						});
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				}
			});
		}, 100);
	});

	// 파일 업로드 버튼 click
	$(document).on('click', '.btnUpload', function() {
		$(this).parent().find('input:file').trigger('click');
	});

	// 파일을 선택했을 경우
	$(document).on('change', '.inspect_file', function() {
		let files = $(this)[0].files;
		let uuid = uuid_v4();
		let fileFullname = files[0].name;
		let filename = _.slice(fileFullname.split('.'), 0, -1).join('.');
		let fileext = fileFullname.split('.')[fileFullname.split('.').length-1];
		$(this).parent().find('.inspect_filename').val(fileFullname);
		$(this).parent().find('.inspect_filename').data('filename', filename);
		$(this).parent().find('.inspect_filename').data('fileext', fileext);
	});

	// 파일 다운로드
	$(document).on('click', '.inspect_filename', function() {
		let uuid = $(this).parent().find('.inspect_file_uuid').val();
		let fileName = $(this).data('filename');
		let ext = $(this).data('fileext');
		
		// 파일이 서버에 저장되어있는 경우
		if($(this).parent().find('.inspect_file')[0].files.length == 0 && $(this).parent().find('.inspect_filename').val() != '') {
			fileDownload({uuid: uuid, fileName:fileName, ext:ext});
		}
	});

	// 파일 삭제버튼 click
	$(document).on('click', '.btnFileDelete', function() {
		let fileLength = $(this).parent().find('.inspect_file')[0].files.length;
		let fileName = $(this).parent().find('.inspect_filename').val();

		// 파일이 서버에 저장되어있는 경우
		if(fileLength == 0 && fileName != '') {
			$('#fileDeleteModal').modal('show');
			$('#fileDeleteModal').data('node',$(this));
		}
		// 파일이 존재하지 않을 경우
		else if(fileLength == 0 && fileName == '') {
			toastr.warning('삭제할 파일이 존재하지 않습니다.');
		}
		// 파일이 서버에 저장되어있지 않을 경우
		else if(fileLength != 0 && fileName != '') {
			$(this).parent().find('.inspect_file').val('');
			$(this).parent().find('.inspect_filename').val('');
		}
		
	});

	// 파일 삭제 모달 삭제 버튼 click
	$('#btnFileDeleteModalY').on('click', function() {
		let node = $('#fileDeleteModal').data('node');
		
		
		let idx = $(node).parents('tr').attr('id');
		let uuid = $(node).parent().find('.inspect_file_uuid').val();
		let ext = $(node).parent().find('.inspect_filename').data('fileext');
		
		fileDelete({uuid: uuid, ext: ext}).then( (value) => {
			$.ajax({
				url: '<c:url value="/qm/inspectDtlFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx':	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						$(node).parent().find('.inspect_file').val('');
						$(node).parent().find('.inspect_filename').val('');
						$(node).parent().find('.inspect_file_uuid').val('');
						
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#fileDeleteModal').modal('hide');
					$('#my-spinner').hide();
				}
			});
		})
		.catch( (error) => {
			//오류처리에 대한 코드 작성
			toastr.warning(error);
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
				projectTable.row('#'+idx).select();
				$(projectTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
			}
			
			return false;
		}
	});

	// 신규 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록
		
		WM_action_ON('new', 'workingWarningModal');

		$('#btnProduceUserDelete').attr('disabled', false);
		$('#btnProduceUserSel').attr('disabled', false);
		$('#btnQaUserDelete').attr('disabled', false);
		$('#btnQaUserSel').attr('disabled', false);
		$('#btnAdmUserDelete').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);
		$('#inspectAdmDesc').attr('disabled', false);

		$('.input_group').attr('disabled', false); // 입력폼
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼

		$('#outUser').addClass('d-none'); //거래처 비활성화

		$('#projectPlanVersionModal').modal('show');
		setTimeout(function() {
			$('#projectPlanVersion').focus();
		}, 500);
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');
		
		// 등록할 경우에
		if(saveType == 'insert') {
			let insertList = [];
			$('#inspectDtlTable tbody').find('tr').each(function(index, item) {
				let tr = $(item);
				let td = $(tr).find('td');
				let obj = {};
				obj.inspectItem = $(td).eq(1).find('input').val();
				obj.inspectDepartment = $(td).eq(2).find('select').val();
				obj.inspectCheck = $(td).eq(3).find('select').val();
				obj.inspectStatus = $(td).eq(4).find('select').val();
				obj.inspectUserIdxDtl = $(td).eq(5).find('input:hidden').val();
				obj.inspectDate = $(td).eq(6).find('input').val();
				obj.inspectResult = $(td).eq(7).find('select').val();
				obj.inspectDtlDesc = $(td).eq(8).find('input').val();
				
				let fileFullname = $(td).eq(9).find('.inspect_filename').val();
				if(fileFullname != '') {
					obj.uuid = uuid_v4();
					obj.fileName = $(td).eq(9).find('.inspect_filename').data('filename');
					obj.fileExt = $(td).eq(9).find('.inspect_filename').data('fileext');
					
					// file upload
					let fileFormData = new FormData();
					fileFormData.append(0, $(td).eq(9).find('input:file')[0].files[0]);
					fileFormData.append('uuid', obj.uuid);
					fileFormData.append('ext', obj.fileExt);
					fileUpload(fileFormData).then( (value) => {});
					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
				} else {
					obj.uuid = '';
					obj.fileName = '';
					obj.fileExt = '';
				}
				insertList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/qm/inspectIns"/>',
	            type: 'POST',
	            asnyc: false,
	            data: {
	            	'projectIdx':	projectIdxVal,
	            	'serialNoIdx':	serialNoIdxVal,
	            	'inspectGubun':	inspectGubunVal,
	            	'approvalYn':	'',
	            	'approvalDate':	'',
	            	'inspectUserIdxAdm':	$('#admUserIdx').val(),
	            	'inspectDateAdm':	moment().format('YYYYMMDD'),
	            	'produceUserIdx':	$('#produceUserIdx').val(),
	            	'qaUserIdx':	$('#qaUserIdx').val(),
	            	'inspectAdmDesc':	$('#inspectAdmDesc').val(),
	                'insertList' : JSON.stringify(insertList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						$('#projectTable').find('.selected').trigger('click');

						WM_action_OFF('new');
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', false); // 수정 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#btnSearch').trigger('click');
					$('#my-spinner').hide();
				}
			});
		} else { // 수정할 경우에
			let updateList = [];
			$('#inspectDtlTable tbody').find('tr').each(function(index, item) {
				let tr = $(item);
				let td = $(tr).find('td');
				let obj = {};
				obj.idx = $(tr).attr('id');
				obj.inspectItem = $(td).eq(1).find('input').val();
				obj.inspectDepartment = $(td).eq(2).find('select').val();
				obj.inspectCheck = $(td).eq(3).find('select').val();
				obj.inspectStatus = $(td).eq(4).find('select').val();
				obj.inspectUserIdxDtl = $(td).eq(5).find('input:hidden').val();
				obj.inspectDate = moment($(td).eq(6).find('input').val()).format('YYYYMMDD');
				obj.inspectResult = $(td).eq(7).find('select').val();
				obj.inspectDtlDesc = $(td).eq(8).find('input').val();
				
				let fileFullname = $(td).eq(9).find('.inspect_filename').val();
				if(fileFullname != '' && $(td).eq(9).find('.inspect_file_uuid').val() == '') {
					obj.uuid = uuid_v4();
					obj.fileName = $(td).eq(9).find('.inspect_filename').data('filename');
					obj.fileExt = $(td).eq(9).find('.inspect_filename').data('fileext');
					
					// file upload
					let fileFormData = new FormData();
					fileFormData.append(0, $(td).eq(9).find('input:file')[0].files[0]);
					fileFormData.append('uuid', obj.uuid);
					fileFormData.append('ext', obj.fileExt);
					fileUpload(fileFormData).then( (value) => {});
					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
				} else if($(td).eq(9).find('.inspect_file_uuid').val() != '') {
					obj.uuid = $(td).eq(9).find('.inspect_file_uuid').val();
					obj.fileName = $(td).eq(9).find('.inspect_filename').data('filename');
					obj.fileExt = $(td).eq(9).find('.inspect_filename').data('fileext');
				} else {
					obj.uuid = '';
					obj.fileName = '';
					obj.fileExt = '';
				}
				updateList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/qm/inspectUpd"/>',
	            type: 'POST',
	            asnyc: false,
	            data: {
	            	'idx':	inspectAdmIdxVal,
	            	'approvalYn':	'',
	            	'approvalDate':	'',
	            	'inspectUserIdxAdm':	$('#admUserIdx').val(),
	            	'produceUserIdx':	$('#produceUserIdx').val(),
	            	'qaUserIdx':	$('#qaUserIdx').val(),
	            	'inspectAdmDesc':	$('#inspectAdmDesc').val(),
	                'updateList' : JSON.stringify(updateList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						$('#projectTable').find('.selected').trigger('click');

						WM_action_OFF('new');
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', false); // 수정 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#btnSearch').trigger('click');
					$('#my-spinner').hide();
				}
			});
		}
	});

	// 수정 버튼 click
	$('#btnEdit').on('click', function() {
		$('#btnSave').data('saveType','update'); // 저장 방식 -> 수정

		WM_action_ON('edit', 'workingWarningModal');

		$('#btnProduceUserDelete').attr('disabled', false);
		$('#btnProduceUserSel').attr('disabled', false);
		$('#btnQaUserDelete').attr('disabled', false);
		$('#btnQaUserSel').attr('disabled', false);
		$('#btnAdmUserDelete').attr('disabled', false);
		$('#btnUserSel').attr('disabled', false);
		$('#inspectAdmDesc').attr('disabled', false);

		$('.input_group').attr('disabled', false); // 입력폼
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
	});

	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');
		let saveType = $(this).data('saveType');

		WM_action_OFF('new');
		WM_action_OFF('edit');

		if(saveType == 'insert') {
			$('#btnNew').attr('disabled', false); // 신규 버튼
		} else {
			$('#btnEdit').attr('disabled', false); // 수정 버튼
		}

		$('.input_group').attr('disabled', true); // 입력폼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
	});















	// 사용자 조회 버튼 click
	$(document).on('click', '.btnUserSel', function() {
		console.log('btnUserSel');
		let node = $(this);
		$('#userModal').data('node',node);
		$('#userModal').modal('show');
		setTimeout(function() {
			userModalTable.rows('.selected').deselect();
			userModalTable.ajax.reload(function() {});
		}, 200);
	});

	// 사용자 삭제 버튼 click
	$(document).on('click', '.btnUserDel', function() {
		let node = $(this);
		$(node).parent().find('input:hidden').val('');
		$(node).parent().find('input:text').val('');
	});
	
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
		let node = $('#userModal').data('node');
		$(node).parent().find('input:hidden').val(data.idx);
		$(node).parent().find('input:text').val(data.userName);
		
		$('#userModal').modal('hide');
	});
</script>
</body>
</html>
