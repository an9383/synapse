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
																		  grid-template-columns: 5fr 4px 7fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">근무상태</label> -->
<!-- 					<select class="form-select w-auto h-100 me-3" id="SearchUserStateCd"></select> -->
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
				<table class="table table-bordered p-0 m-0" id="approvalAuthAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">승인코드</th>
							<th class="text-center">승인명</th>
							<th class="text-center">사용여부</th>
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
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllDtl" placeholder="통합검색" >
<!-- 					<div class="btn-group" role="group" aria-label="Small button group"> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" id="btnCopy" style="font-size: 20px !important;" disabled><i class="fa-regular fa-copy"></i></button> -->
<!-- 					</div> -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnAdd" disabled><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 20px !important;" id="btnDel" disabled><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="subMenuTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">No</th>
							<th class="text-center">아이디</th>
							<th class="text-center">성명</th>
							<th class="text-center">부서</th>
							<th class="text-center">직위</th>
							<th class="text-center">상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- modal ======================================================================================== -->
<!-- Modal Start-->
	<div class="modal fade" id="userModal" tabindex="-1"
		role="dialog" aria-labelledby="userPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="layerPopUpLabel">사용자승인등록</h5>
					<button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table class="table table-sm table-bordered" id="userPopUpTable" style="text-align: center">
						<thead>
							<tr>
								<th colspan="2">승인명</th>
								<th colspan="4"></th>
							</tr>
							<tr>
								<th>NO</th>
								<th>아이디</th>
								<th>성명</th>
								<th>부서</th>
								<th>직위</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<input type="hidden" class="form-control" id="puFlag" name="puFlag">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" id="btnPopUpSave">저장</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	<!-- 담당자 모달 -->
<div class="modal fade" id="userModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					사용자 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPopUpSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0" id="userModalTable1">
					<thead class="table-light">
						<tr>
							<th>NO</th>
							<th>아이디</th>
							<th>성명</th>
							<th>부서</th>
							<th>직위</th>
						</tr>
					</thead>
				</table>
			</div>
			
		</div>
	</div>
</div>
<!-- ======================================================================================== modal -->

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
			$('#page').css('grid-template-columns', '5fr 4px 7fr');
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
			$('#page').css('grid-template-columns', '5fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '5fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>

<script>
	let commonCd = '';
	let baseAttr = '';
	let userId = '';
	let apprCd = '';
	var current = 'userId';		//중복처리

	// 사용자정보 목록조회
	let commonType = "시스템";
	let commonGroupCd = "040";
	$('#approvalAuthAdmTable thead tr').clone(true).addClass('filters').appendTo('#approvalAuthAdmTable thead'); // filter 생성
	let approvalAuthAdmTable = $('#approvalAuthAdmTable').DataTable({
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
			url : '<c:url value="/sm/commonCodeDtlLstByCommonCd"/>',
			type : 'POST',
			data : {
				'commonType'	: function() { return commonType; },
				'commonCd'		: function() { return commonGroupCd; },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'commonCd', className : 'text-center'},
			{ data: 'commonNm', className : 'text-center'},
			{ 
				data: 'useYn',
				render: function(data, type, row, meta) {
					if(data == 'Y'){
						return '사용';
					} else return '미사용';
				},
				className : 'text-center'},
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
			let theadHeight = parseFloat($('#approvalAuthAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#approvalAuthAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#approvalAuthAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	approvalAuthAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = approvalAuthAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#approvalAuthAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 메뉴권한관리 목록조회
	$('#subMenuTable thead tr').clone(true).addClass('filters').appendTo('#subMenuTable thead'); // filter 생성
	let subMenuTable = $('#subMenuTable').DataTable({
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
			url : '<c:url value="/sm/approvalAuthAdmList"/>',
			type : 'GET',
			data : {
				'apprDesc' : function() { return baseAttr; }
			},
		},
        rowId: '',
		columns : [
			{//NO
				render : function(data, type, row, meta) {
					return meta.row + 1;
				},
				'className' : 'text-center'
			},
			{//아이디
				data : 'userId',
				'className' : 'text-center'
			},	
			{//이름
				data : 'userName',
				'className' : 'text-center'
			},	
			{//부서
				data : 'userDepartmentNm',
				'className' : 'text-center'
			},	
			{//직위
				data : 'userPositionNm',
				'className' : 'text-center'
			},	
			{//상태
				data : 'userStateNm',
				'className' : 'text-center'
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
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#subMenuTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 80)+'px');
			
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
				let cell = $('#subMenuTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#subMenuTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	subMenuTable.on('column-reorder', function( e, settings, details ) {
		let api = subMenuTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#subMenuTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 사용자목록 click
	$('#approvalAuthAdmTable tbody').on('click','tr',function() {
		
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#approvalAuthAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		commonCd = approvalAuthAdmTable.row(this).data().commonCd;
		baseAttr = approvalAuthAdmTable.row(this).data().attr;
		console.log(commonCd);
		console.log(baseAttr);

		$('#btnAdd').attr('disabled', false);
		
		$('#subMenuTable').DataTable().ajax.reload();
	});

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		approvalAuthAdmTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});
	

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let insertList = [];
		$('input:checkbox[name=menuAuthCheck]').each(function(index, item) {
			let node = $(item);
			if($(node).prop("checked")) { // 체크 되었을 경우
				let tr = $(node).parent().parent();
				let data = subMenuTable.row(tr).data();
				let favoriteYn = $(tr).find('td').eq(5).find('input').prop('checked')?'Y':'N';
				let createAuth = $(tr).find('td').eq(6).find('input').prop('checked')?'Y':'N';
				let readAuth = $(tr).find('td').eq(7).find('input').prop('checked')?'Y':'N';
				let updateAuth = $(tr).find('td').eq(8).find('input').prop('checked')?'Y':'N';
				let deleteAuth = $(tr).find('td').eq(9).find('input').prop('checked')?'Y':'N';
				
				let obj = {};
				obj.userIdx = userIdxVal;
				obj.menuIdx = data.menuIdx;
				obj.favoriteYn = favoriteYn;
				obj.createAuth = createAuth;
				obj.readAuth = readAuth;
				obj.updateAuth = updateAuth;
				obj.deleteAuth = deleteAuth;
				obj.etc1 = '';
				obj.etc2 = '';
				obj.etc3 = '';
				obj.regIdx = '';
				obj.regDate = '';
				insertList.push(obj);
			}
		});

		$.ajax({
			url: '<c:url value="/sm/menuAuthIns"/>',
            type: 'POST',
            data: {
                'jsonArray'	:	JSON.stringify(insertList),
                'userIdx'	:	userIdxVal,
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('수정 저장되었습니다.');

					$('#btnSearch').trigger('click'); // 조회버튼 click

					WM_action_OFF('edit');

					subMenuTable.ajax.reload(function() {
						$('#checkAll').attr('disabled', true).prop('checked',false);
					});

					$('#btnCopy').attr('disabled', false); // 복사 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼

					let idx = approvalAuthAdmTable.row('.selected').data().idx;
					approvalAuthAdmTable.row('#'+idx).select();
					$(approvalAuthAdmTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	//사용자승인관리 오른쪽 테이블 클릭 시
	$('#subMenuTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#subMenuTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		userId = subMenuTable.row(this).data().userId;
		apprCd = subMenuTable.row(this).data().apprCd;
		console.log(userId);
		console.log(apprCd);

		$('#btnDel').attr('disabled', false);
	});

	// 사용자정보 목록조회
	let userStateVal = "001";
	$('#userModalTable1 thead tr').clone(true).addClass('filters').appendTo('#userModalTable1 thead'); // filter 생성
	let userModalTable1 = $('#userModalTable1').DataTable({
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
			url : '<c:url value="/sm/userLst"/>',
			type : 'POST',
			data : {
				'userStateCd' : function() { return userStateVal;},
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
			let theadHeight = parseFloat($('#userModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#userModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#userModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	userModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = userModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#userModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 사용자모달 조회 버튼 click
	$('#btnUserModalSearch').on('click', function() {
		userModalTable1.ajax.reload(function(){});
	});


	// 사용자목록 적용 버튼 click
// 	$('#userModalTable1 tbody tr').on('click', function(){
// 		if($(this).hasClass('selected')){
// 			$(this).removeClass('selected');
// 		} else{
// 			$(this).addClass('selected');
// 		}
		
// 	});
	
	
	//등록버튼 클릭 시
	$('#btnAdd').on('click', function(){
		if ($('#approvalAuthAdmTable tbody tr').hasClass('selected')=='') {
			toastr.warning("등록할 목록을 선택해주세요.");
			return false;
		}
		$('#userModal1').modal('show');
		setTimeout(function(){
			$('#userModalTable1').DataTable().ajax.reload(); 
		},150);
		
	});

	
	//삭제버튼 클릭 시
	$('#btnDel').on('click', function(){
		if ($('#subMenuTable tbody tr').hasClass('selected')=='') {
			toastr.warning("삭제할 목록을 선택해주세요.");
			return false;
		}
		$('#deleteModal').modal('show');
	});

	//모달 삭제 클릭 시
// 	$('#btnDeleteConfirm').on('click', function(){
	$('#btnDeleteModalY').on('click', function(){
		//삭제
		$.ajax({
			url: '<c:url value="/sm/approvalAuthAdmDelete"/>',
			type : 'POST',
			data : {
				'userId'	:	userId,
				'apprCd'	:	apprCd
			},
			beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
// 				let data = res.data;
				if (res.result == "ok") {
					$('#btnDel').attr('disabled', true);
	                toastr.success('삭제되었습니다.');
					$('#subMenuTable').DataTable().ajax.reload();
					userId='';
					apprCd='';
					$('#deleteModal').modal('hide');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
	
	//저장버튼 클릭 시
	$(document).on('click', '#btnPopUpSave', function(){

		var x = userModalTable1.rows('.selected').data().length;

		if (x == 0) {
			toastr.warning("저장할 목록을 선택해주세요.");
			return false;
		}

		var isCheck = false;
		
		if(['userId'].includes(current)){
			for(var i=0;i<x;i++) {
				$.ajax({
					url : '<c:url value="/sm/approvalAuthAdmList"/>',
					type: 'GET',
					dataType: 'json',
					async: false,
					data: {
						'apprDesc' : function() { return baseAttr;},
						'userId' : $.trim(userModalTable1.rows('.selected').data()[i].userId),
					},
					success: function(res) {
// 						console.log(userPopUpTable.rows('.selected').data()[i].userId);
// 						console.log(res.data.length);
// 						console.log(res.data);
						if (res.data.length != 0) {
							var userName = userModalTable1.rows('.selected').data()[i].userName;
								toastr.warning(userName+'님은 이미 등록 되었습니다.');
								isCheck = true;
								return false;
						}
					},
				});
			}
		}
			
		if (isCheck == true)
			return false;

		var array = new Array();
		for(var i=0;i<x;i++) {
			var rowData = new Object();

			rowData.commonCd = commonCd		//메뉴ID
			rowData.baseAttr = baseAttr	//메뉴패스
			rowData.userId = userModalTable1.rows('.selected').data()[i].userId	//사용자 ID

			array.push(rowData);
// 			console.log(array);
		}
		
		 var data = JSON.stringify(array);
		 
		$.ajax({
			url : '<c:url value="/sm/approvalAuthAdmCreate"/>',
			type : 'POST',
			data : {
				'arrayData' : 	function(){return data;}
			},
			success: function (res) {
				let data = res.data;

				if (res.result == 'ok') {
						toastr.success('등록되었습니다.');
				} else {
					toastr.error(res.message);
				}
            },
            complete : function() {
            	$('#subMenuTable').DataTable().ajax.reload();
            	$('#userModal1').modal('hide');
			}
		});
	});
	
</script>

</body>
</html>
