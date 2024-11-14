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
			<!--======================== .left-list ========================-->
			<div id="leftcol">
				<div class="container-fluid h-100" style="padding: 5px;">
					<div class="row" id="leftHeader" style="padding-bottom: 5px;">
						<div class="me-lg-auto"></div>
						<div class="d-flex align-items-center justify-content-end">
							<div class="btn-group" role="group" aria-label="Small button group">
								<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
								<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
							</div>
						</div>
					</div>
					<!-- .table-responsive -->
					<div class="row">
						<table id="baseInfoFtTable" class="table table-bordered  p-0 m-0">
							<thead class="thead-light">
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">불량코드</th>
									<th class="text-center">불량유형구분</th>
									<th class="text-center">불량유형명</th>
									<th class="text-center">사용여부</th>
									<th class="text-center">비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<div id="dragbar" onmousedown="StartDrag()"></div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div id="rightcol">
				<div class="container-fluid h-100" style="padding: 5px;" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="row" id="rightHeader" style="padding-bottom: 5px;">
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
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*불량코드</th>
									<td><input type="text" class="form-control" id="baseInfoCd" name="baseInfoCd" placeholder="자동채번" style="text-align:center;" disabled></td>
									<th>*불량유형구분</th>
									<td><select class="form-select" id="baseInfoGubun"
										name="baseInfoGubun"></select></td>
								</tr>
								<tr>
									<th>*불량유형명</th>
									<td><input type="text" class="form-control"
										style="max-width: 100%" id="baseInfoNm" name="baseInfoNm"></td>
									<th>*사용여부</th>
									<td><select class="form-select" id="useYn" name="useYn"></select></td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control"
										id="baseInfoDesc" name="baseInfoDesc" style="min-width:100%"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<table class="table table-bordered mt-5 d-none" id="changeHisTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<th>변경내역</th>
						<td colspan='3'><input type="text" class="form-control" style="max-width: 100%"
							id="changeHis" maxlength="20"></td>
					</tr>
				</table>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
</div>
<!-- /.page-wrapper -->
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
	
	let viewIdx;
	let sideView = 'add';
	let baseInfoGubunVal = '';
	let useYnVal = '001';
	let baseInfoType = "FT";
	uiProc(true);
	var tableIdx=null;

	//공통코드 처리 시작      
	let useYnList = getCommonCode('시스템', '000'); // 사용유무
	let baseInfoGubunCode = getCommonCode('일반', '031'); // 불량유형
	    
    selectBoxAppend(useYnList, 'useYn', '', '2');
    selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "2");
	//공통코드 처리 종료   

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	$("#dealCorpNm").attr("disabled", true);

	// 목록
	$('#baseInfoFtTable thead tr').clone(true).addClass('filters').appendTo('#baseInfoFtTable thead'); // filter 생성
	let baseInfoFtTable = $('#baseInfoFtTable').DataTable({
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
	        toggleable: true,
	        items: 'row',
	        info: false
	    },
		ajax : {
			url : '<c:url value="/bm/baseInfoFtLst"/>',
			type : 'GET',
			data : {
				'etc1' 				: '002',
			},
		},
		rowId : 'baseInfoSeq',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					},
					'className' : 'text-center'
				}, 
				{
					data : 'baseInfoCd',
					'className' : 'text-center'
				}, 
				{
					data : 'baseInfoGubunNm',
					'className' : 'text-center'
				}, 
				{
					data : 'baseInfoNm',
					'className' : 'text-center'
				}, 
				{
					data : 'useYnNm',
					'className' : 'text-center'
				}, 
				{
					data : 'baseInfoDesc',
					'className' : 'text-center'
				},  
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy',
			{
				extend : 'excel',
				title : '불량유형관리'
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
		columnDefs : [ 
			{
// 				className : "text-left",
// 				targets : 2
			}, 
		],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#baseInfoFtTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#baseInfoFtTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#baseInfoFtTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	baseInfoFtTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#baseInfoFtTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	$('#btnSearch').on('click', function(){
		$('#my-spinner').show();
		$('#baseInfoFtTable').DataTable().ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 보기
	$('#baseInfoFtTable tbody').on('click','tr',function() {
		let idx = baseInfoFtTable.row(this).data().baseInfoSeq;
		
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}

		tableIdx = $('#baseInfoFtTable').DataTable().row(this).index();
		
		baseInfoSeq = baseInfoFtTable.row(this).data().baseInfoSeq;
		$('#formBox').removeClass('d-none');
		$('#btnSave').attr('disabled', true); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //수정버튼
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtSel"/>',
			type : 'GET',
			data : {
				'baseInfoType' : baseInfoType,
				'baseInfoSeq' : baseInfoSeq
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				$('#form input[name="baseInfoCd"]').val(data.baseInfoCd);
				$('#form input[name="baseInfoNm"]').val(data.baseInfoNm);
				$('#form input[name="baseInfoDesc"]').val(data.baseInfoDesc);

				//선택박스 처리
				selectBoxAppend(useYnList, "useYn", data.useYn, "");
				selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", data.baseInfoGubun, "");
				
				gubunVal = baseInfoFtTable.row(tableIdx).data().baseInfoGubun;
			}
		});
		
	});
	
	// 등록폼
	$('#btnNew').on('click', function() {
		
		WM_action_ON('new', 'workingWarningModal');
		
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});
		
		//선택한 행 취소
		$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
		
		//설비코드 중복체크
		/* $('#equipCdCheck').val("false"); */
		$('#btnCheck').attr("disabled", false);
		$('#btnDel').attr("disabled", false);
		//화면처리        
		uiProc(false);
		
		//셀렉트박스 처리
		selectBoxAppend(useYnList, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");

		//선택박스처리
		$('#useYn option[value="001"]').attr('selected', 'selected');
		$('#baseInfoGubun option[value="001"]').attr('selected', 'selected');

		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnDel').attr('disabled', true); //삭제버튼
		$('#btnSave').attr('disabled', false); // 등록버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요!");
			return false;
		}

		WM_action_ON('edit', 'workingWarningModal');
		
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#btnNew').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').attr('disabled', false);
		$('#changeHisTable').removeClass('d-none');
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtDataDel"/>',
			type : 'POST',
			data :{
				'baseInfoSeq' : function(){return baseInfoSeq;}
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		$('#form').each(function(){this.reset();});
		
		selectBoxAppend(useYnList, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
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

		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#viewBox').removeClass('d-none');
		$('#formBox').addClass('d-none');
		$('#changeHisTable').addClass('d-none');
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
	});
	
	
	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#baseInfoNm').val())) {
			toastr.warning('불량유형명을 입력해주세요.');
			$('#baseInfoNm').focus();
			return false;
		}

		if (sideView != "edit") {
			baseInfoSeq = "";
		}
		
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtIU"/>',
			type : 'POST',
			async : false,
			data : {
				'baseInfoSeq' : baseInfoSeq,
				'baseInfoType' : baseInfoType,
				'baseInfoCd' : $('#baseInfoCd').val(),
				'baseInfoNm' : $('#baseInfoNm').val(),
				'baseInfoDesc' : $('#baseInfoDesc').val(),
				'baseInfoGubun' : $('#baseInfoGubun option:selected').val(),
				'etc1' : '002',			//사출/봉제
				'etc3' : '',
				'useYn' : $('#useYn option:selected').val()
			},
			/* 			beforeSend : function() {
			 // $('#btnAddConfirm').addClass('d-none');
			 }, */
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {
					});
					uiProc(true);
					
					WM_action_OFF('new');
					WM_action_OFF('edit');
					
					$('#btnSave').attr('disabled', true);
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}

					$('#btnNew').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#baseInfoFtTable').DataTable().ajax.reload();
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
			}
		});
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			var url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
//						$('#btnAddConfirm').removeClass('d-none');
//						$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		}else{
			$('#changeHisTable').addClass('d-none');
		}
		
	});
	
	//화면 설정
	function uiProc(flag) {
		$("#baseInfoNm").attr("disabled", flag);
		$("#baseInfoDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#baseInfoGubun").attr("disabled", flag);
	}
	
</script>

</body>
</html>
