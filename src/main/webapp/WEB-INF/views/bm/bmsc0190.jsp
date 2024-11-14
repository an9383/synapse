<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbar rightcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 2fr 4px 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">검사구분</label>
					<select class="form-select w-auto h-100 me-3" id="inspectGubunSearch">
					</select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="inspectContantAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">검사구분</th>
							<th class="text-center align-middle">검사코드</th>
							<th class="text-center align-middle">검사항목명</th>
							<th class="text-center align-middle">사용여부</th>
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
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="inspectContantAdmSaveTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle"><span style="color:#ff0000;">*</span>검사구분</th>
							<td class="text-center align-middle">
							<select class="form-select" id="inspectGubun" disabled>
							</select>
							<th class="text-center align-middle"><span style="color:#ff0000;">*</span>검사코드</th>
							<td class="text-center align-middle">
							<input type="text" class="form-control" id="inspectCd" disabled>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle"><span style="color:#ff0000;">*</span>검사항목명</th>
							<td class="text-center align-middle">
							<input type="text" class="form-control" id="inspectNm" disabled>
							</td>
							<th class="text-center align-middle"><span style="color:#ff0000;">*</span>사용여부</th>
							<td class="text-center align-middle">
							<select class="form-select" id="useYn" disabled>
							</select>
							</td>
						</tr>
						<tr>
							<th class="text-center align-middle">내용</th>
							<td class="text-center align-middle" colspan='3'>
							<textarea rows="5" class="form-control" style="resize: none;" id="inspectDesc" disabled></textarea>
							</td>
						</tr>
					</thead>
				</table>
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
			$('#page').css('grid-template-columns', '1fr 4px 1fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 1fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '1fr 4px 1fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '1fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>

<script>
	WM_init('edit');
	WM_init('new');

	let useYnList = getCommonCode('시스템', '000'); // 사용여부
	let inspectGubunList = getCommonCode('시스템', '058'); // 변경사유

	selectBoxAppend(useYnList, 'useYn', '', '2'); // 변경사유
	selectBoxAppend(inspectGubunList, 'inspectGubun', '', '2'); // 변경사유
	selectBoxAppend(inspectGubunList, 'inspectGubunSearch', '', '1'); // 변경사유

	let inspectContantAdmIdx = '';
// 	let inspectSearch = '';
	// 공통코드관리 ADM 목록조회
	$('#inspectContantAdmTable thead tr').clone(true).addClass('filters').appendTo('#inspectContantAdmTable thead'); // filter 생성
	let inspectContantAdmTable = $('#inspectContantAdmTable').DataTable({
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
			url : '<c:url value="/bm/inspectContantAdmLst"/>',
			type : 'POST',
			data : {
				'inspectGubun'	:	function (){return $('#inspectGubunSearch').val();}
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'inspectGubun', className : 'text-center',
				render : function(data, type, row, meta){
					if(row['idx'] != '' && row['idx'] != null){
						var inspectGubunVal = '';
						inspectGubunList.forEach(function(item){
							if(item.commonCd==data){
								inspectGubunVal = item.commonNm;
							}
						});
						return inspectGubunVal;
					}else{
						return '';
					}
				}
			},
			{ data: 'inspectCd', className : 'text-center'},
			{ data: 'inspectNm', className : 'text-center'},
			{ data: 'useYn', className : 'text-center',
				render : function(data, type, row, meta){
					if(row['idx'] != '' && row['idx'] != null){
						var useYnVal = '';
						useYnList.forEach(function(item){
							if(item.commonCd==data){
								useYnVal = item.commonNm;
							}
						});
						return useYnVal;
					}else{
						return '';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [
			{ extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',
	        	exportOptions: {
	            	columns: ':visible',
	                modifier: {                      
	                	selected:null
	        		},
	        	},
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
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#inspectContantAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAllAdm').off('keyup',function() {});
			$('#searchAllAdm').on('keyup',function() {
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
				let cell = $('#inspectContantAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#inspectContantAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	inspectContantAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = inspectContantAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#inspectContantAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 공통코드관리 ADM 조회 버튼 click
	$('#btnSearch').on('click', function() {
		if(WMCheck('edit')) {
			return false;
		}else if(WMCheck('new')) {
			return false;
		}
		$('#my-spinner').show();
		inspectContantAdmTable.ajax.reload(function() {});
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});


	
	// 사용자목록 click
	$('#inspectContantAdmTable tbody').on('click','tr', function() {
		if(WMCheck('edit')) {
// 			setWM('edit', 'idx', idx);
			return false;
		}else if(WMCheck('new')) {
// 			setWM('new', 'idx', idx);
			return false;
		}
		let data = inspectContantAdmTable.row(this).data()
		inspectContantAdmIdx = data.idx;
		$('#inspectGubun').val(data.inspectGubun);
		$('#inspectCd').val(data.inspectCd);
		$('#inspectNm').val(data.inspectNm);
		$('#useYn').val(data.useYn);
		$('#inspectDesc').val(data.inspectDesc);
		
		$('#inspectGubun').attr('disabled', true);
		$('#inspectCd').attr('disabled', true);
		$('#inspectNm').attr('disabled', true);
		$('#useYn').attr('disabled', true);
		$('#inspectDesc').attr('disabled', true);
		
		$('#btnNew').attr('disabled', false);
		$('#btnSave').attr('disabled', true);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnCancel').attr('disabled', true);

		$('#inspectContantAdmTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', false);// 검색 필터 enable
		});
	});

	// 공통코드관리 ADM 신규 버튼 click
	$('#btnNew').on('click', function() {
		WM_action_ON('new','workingWarningModal');
		$('#cancelModal').data('cancelType', 'new');

		inspectContantAdmIdx = '';
		$('#inspectGubun').val('');
		$('#inspectCd').val('');
		$('#inspectNm').val('');
		$('#useYn').val('');
		$('#inspectDesc').val('');
		$('#inspectGubun').attr('disabled', false);
		$('#inspectCd').attr('disabled', false);
		$('#inspectNm').attr('disabled', false);
		$('#useYn').attr('disabled', false);
		$('#inspectDesc').attr('disabled', false);
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
	});

	$('#btnEdit').on('click', function(){
		if(inspectContantAdmTable.row('.selected').data() == undefined) {
			toastr.warning('데이터를 선택해주세요.');
			return false;
		} 
		WM_action_ON('edit','workingWarningModal');
		$('#cancelModal').data('cancelType', 'edit');
		inspectContantAdmIdx = inspectContantAdmTable.row('.selected').data().idx;
		$('#inspectGubun').attr('disabled', false);
		$('#inspectCd').attr('disabled', false);
		$('#inspectNm').attr('disabled', false);
		$('#useYn').attr('disabled', false);
		$('#inspectDesc').attr('disabled', false);
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
	});

	// 공통코드관리 ADM 저장 버튼 click
	$('#btnSave').on('click', function() {
		let state = true;
		if($('#inspectGubun').val() == '') {
			toastr.warning('검사구분을 선택해주세요.');
			$('#inspectGubun').focus();
			state = false;
			return false;
		}
		if($('#inspectCd').val() == '') {
			toastr.warning('검사코드를 입력해주세요.');
			$('#inspectCd').focus();
			state = false;
			return false;
		}
		if($('#inspectNm').val() == '') {
			toastr.warning('검사항목명을 입력해주세요.');
			$('#inspectNm').focus();
			state = false;
			return false;
		}
		if($('#useYn').val() == '') {
			toastr.warning('사용여부를 선택해주세요.');
			$('#useYn').focus();
			state = false;
			return false;
		}


		if(!state) {
			return false;
		}


		$.ajax({
			url: '<c:url value="/bm/inspectContantAdmIU"/>',
            type: 'POST',
            data: {
                'idx' : inspectContantAdmIdx,
                'inspectGubun' : $('#inspectGubun').val(),
                'inspectCd' : $('#inspectCd').val(),
                'inspectNm' : $('#inspectNm').val(),
                'useYn' : $('#useYn').val(),
                'inspectDesc' : $('#inspectDesc').val(),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');

					WM_action_OFF('new');
					WM_action_OFF('edit');

					$('#btnSearch').trigger('click'); // 조회버튼 click

					$('#inspectGubun').attr('disabled', true);
					$('#inspectCd').attr('disabled', true);
					$('#inspectNm').attr('disabled', true);
					$('#useYn').attr('disabled', true);
					$('#inspectDesc').attr('disabled', true);

					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
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

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new') { // 공통코드관리 ADM 수정중이나 신규등록중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'edit') { // 공통코드관리 DTL 수정중이나 신규등록중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'new') { // 공통코드관리 ADM 수정중이나 신규등록중이였을 경우
			WM_action_OFF(WMlastIdx);
// 			$('#inspectGubun').val('');
// 			$('#inspectCd').val('');
// 			$('#inspectNm').val('');
// 			$('#useYn').val('');
// 			$('#inspectDesc').val('');

// 			$('#inspectGubun').attr('disabled', true);
// 			$('#inspectCd').attr('disabled', true);
// 			$('#inspectNm').attr('disabled', true);
// 			$('#useYn').attr('disabled', true);
// 			$('#inspectDesc').attr('disabled', true);
			
// 			$('#btnNew').attr('disabled', false); // 신규 버튼
// 			$('#btnSave').attr('disabled', true); // 저장 버튼
// 			$('#btnEdit').attr('disabled', false); // 수정 버튼
// 			$('#btnDel').attr('disabled', false); // 삭제 버튼
// 			$('#btnCancel').attr('disabled', true); // 취소 버튼
		} else if(WMlastIdx == 'edit') { // 공통코드관리 DTL 수정중이나 신규등록중이였을 경우
			WM_action_OFF(WMlastIdx);
// 			$('#inspectGubun').attr('disabled', true);
// 			$('#inspectCd').attr('disabled', true);
// 			$('#inspectNm').attr('disabled', true);
// 			$('#useYn').attr('disabled', true);
// 			$('#inspectDesc').attr('disabled', true);
			
// 			$('#btnNew').attr('disabled', false); // 신규 버튼
// 			$('#btnSave').attr('disabled', true); // 저장 버튼
// 			$('#btnEdit').attr('disabled', false); // 수정 버튼
// 			$('#btnDel').attr('disabled', false); // 삭제 버튼
// 			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
// 		toastr.warning("취소되었습니다.");
		return false;
	});

	// 공통코드관리 ADM 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if(inspectContantAdmTable.row('.selected').data() == undefined) {
			toastr.warning('데이터를 선택해주세요.');
			return false;
		}
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
// 		let deleteType = $('#deleteModal').data('deleteType');
		inspectContantAdmIdx = inspectContantAdmTable.row('.selected').data().idx;
		$.ajax({
			url: '<c:url value="/bm/inspectContantAdmDel"/>',
			type: 'POST',
			data: {
				'idx'	:	inspectContantAdmIdx
			},
			beforeSend: function() {
				$('#my-spinner').show();
			},
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					inspectContantAdmTable.ajax.reload();
// 					inspectContantAdmTable.row('.selected').remove().draw(false);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	// 공통코드관리 ADM 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
// 		$('#cancelModal').data('cancelType', 'ADM');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');
		toastr.success('취소되었습니다.');
		if(cancelType == 'new') {
			WM_action_OFF('new');
			
			$('#inspectGubun').val('');
			$('#inspectCd').val('');
			$('#inspectNm').val('');
			$('#useYn').val('');
			$('#inspectDesc').val('');

			$('#inspectGubun').attr('disabled', true);
			$('#inspectCd').attr('disabled', true);
			$('#inspectNm').attr('disabled', true);
			$('#useYn').attr('disabled', true);
			$('#inspectDesc').attr('disabled', true);
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		} else {
			WM_action_OFF('edit');
			
			$('#inspectGubun').attr('disabled', true);
			$('#inspectCd').attr('disabled', true);
			$('#inspectNm').attr('disabled', true);
			$('#useYn').attr('disabled', true);
			$('#inspectDesc').attr('disabled', true);
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
		}
	});
	

</script>

</body>
</html>
