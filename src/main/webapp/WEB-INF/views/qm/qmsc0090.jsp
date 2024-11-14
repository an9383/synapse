<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>

<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수입검사대상</label> -->
<!-- 					<select class="form-select w-auto h-100 me-3" id="searchInspect" style="min-width: 70px;"> -->
<!-- 						<option value="001" selected>Y</option> -->
<!-- 						<option value="002">N</option> -->
<!-- 					</select> -->
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-3 h-100">검사대상여부</label> -->
<!-- 					<input class="form-check-input m-0 me-1" type="checkbox" id="inspectY" name="inspectYn" style="margin: 0px; width: 25px; height: 25px;" checked> -->
<!-- 					<label for="inspectY" class="form-label d-flex align-items-center m-0 me-2 h-100" style="color:blue;">검사</label> -->
<!-- 					<input class="form-check-input m-0 me-1" type="checkbox" id="inspectN" name="inspectYn" style="margin: 0px; width: 25px; height: 25px;"> -->
<!-- 					<label for="inspectN" class="form-label d-flex align-items-center m-0 me-1 h-100" style="color:red;">무검사</label> -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group me-3" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " id="deliveryY" style="font-size: 16px !important;">수입검사</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button> -->
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="importInspectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="allCheckBox" style="margin: 0px; width: 25px; height: 25px;"></th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">순번</th>
							<th class="text-center align-middle">요청구분</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">거래처</th>
							<th class="text-center align-middle">발주자</th>
							<th class="text-center align-middle">도면</th>
							<th class="text-center align-middle">성적서</th>
							<th class="text-center align-middle">수입검사여부</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
<!-- 	<input type="file" class="d-none" id="issueFile" multiple=""> -->

</div>
<div class="modal fade" id="planModal" tabindex="-1" aria-hidden="true" style="z-index: 9998;">
	<div class="modal-dialog" style="max-width: 35vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					도면
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="planFile">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnPlanAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnPlanSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnPlanDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="planTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">파일</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="reportModal" tabindex="-1" aria-hidden="true" style="z-index: 9998;">
	<div class="modal-dialog" style="max-width: 35vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					성적서
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="d-flex align-items-center justify-content-end w-100 my-1">
					<input type="file" class="d-none" id="reportFile">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 18px !important;" id="btnReportAdd"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnReportSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnReportDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="reportTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">파일</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>

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
<script>
	let isDraggingV = false;
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag() {
		isDraggingV = true;
		SetCursor("n-resize");
	}
	
	function EndDrag(e) {
		if(isDraggingV) {
			dataTableDrawAll(); // dataTable 전체 reload
			isDraggingV = false;
			SetCursor("auto");
		}
	}
	
	function OnDrag(event) {
		if (isDraggingV) {
			let dragbarWidth = 4;
	
			let page_height = parseInt($('#page').height()); 				// 전체 높이
			let middlecolT_height = parseInt($('#middlecolT').height());	// 상단
			let middlecolB_height = parseInt($('#middlecolB').height());	// 하단
	
			let middlecolT_min_height = 100;	// 상단 최소높이
			let middlecolB_min_height = 100;	// 하단 최소높이
	
			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
	
			let cols = [
				Math.min(Math.max(middlecolT_min_height, cursorY), page_height - middlecolB_min_height - dragbarWidth),
				dragbarWidth,
				Math.max(page_height - Math.max(middlecolT_min_height, cursorY) - dragbarWidth, middlecolB_min_height)
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
	
			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault()
		}
	}
</script>

<script>
	WM_init('SCM');

	let userIdx = "${userIdx}";

	let fileFormData = new FormData();
	let dealCorp = '';
	let modalType = '';
	let orderDtlNo = '';
	let orderDtlSeq = '';

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let dealGubunList = getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList = getCommonCode('시스템', '015'); // 거래상태
	
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	
	
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	// 수주관리 전체 목록조회
	$('#importInspectTable thead tr').clone(true).addClass('filters').appendTo('#importInspectTable thead'); // filter 생성
	let importInspectTable = $('#importInspectTable').DataTable({
		dom :"<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
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
        scrollY: '83vh',
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
			url : '<c:url value="/qm/importInspectLst"/>',
			type : 'POST',
			data : {
				'startDate'	: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				'endDate'	: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				'inspectYn'	: function() { return 'Y'; },
			},
		},
//         rowId: 'orderDtlNo',
		columns : [
			{ className : 'text-center align-middle', name : "scmCheckBox", //체크박스
				render: function(data, type, row, meta) {
					if(row['importInspection'] == 'Y') {
						return '<input class="form-check-input" type="checkbox" style="margin: 0px; width: 25px; height: 25px;" onkeydown="cellFocusChange(\'\', '+meta.row+', 0)" disabled>';
					} else {
						return '<input class="form-check-input" type="checkbox" name="scmCheckBox" style="margin: 0px; width: 25px; height: 25px;" onkeydown="cellFocusChange(\'\', '+meta.row+', 0)">';
					}

					
				}
			},
			{ data : 'orderDtlNo', className : 'text-center align-middle', name : 'orderDtlNo',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else return '';
				}
			},
			{ data : 'orderDtlSeq', className : 'text-center align-middle', name : 'orderDtlSeq',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else return '';
				}
			},
			{ data : 'requestNm', className : 'text-center align-middle', name : 'requestNm'},
			{ data : 'itemCd', className : 'text-center align-middle', name : 'itemCd'
			},
			{ data : 'orderDtlQty', className : 'text-center align-middle', name : 'orderDtlQty'
			},
			{ data : 'dealCorpNm', className : 'text-center align-middle', name : 'dealCorpNm'
			},
			{ data : 'deliveryUserNm', className : 'text-center align-middle', name : 'deliveryUserNm'
			},
			{ data : 'floorPlan', className : 'text-center align-middle', name : 'floorPlan',
				render : function(data, type, row, meta) {
					if(data!=null && data != '') {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="planModal(\''+row['orderDtlNo']+'\',\''+row['orderDtlSeq']+'\',\'O\')">O</button>';
					} else {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="planModal(\''+row['orderDtlNo']+'\',\''+row['orderDtlSeq']+'\',\'X\')">X</button>';
					}
				}
			},
			{ data : 'reports', className : 'text-center align-middle', name : 'reports',
				render : function(data, type, row, meta) {
					if(data!=null && data != '') {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="reportModal(\''+row['orderDtlNo']+'\',\''+row['orderDtlSeq']+'\',\'O\')">O</button>';
					} else {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="reportModal(\''+row['orderDtlNo']+'\',\''+row['orderDtlSeq']+'\',\'X\')">X</button>';
					}
				}
			},
			{ data : 'importInspection', className : 'text-center align-middle', name : 'importInspection',
				render : function(data, type, row, meta) {
					if(data!=null && data != '') {
						if(data == 'Y') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">완료</div>';
						} else {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미완료</div>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미완료</div>';
					}
				}
			},
		],
		columnDefs : [
			{ targets: [0], orderable: false },
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#importInspectTable_wrapper').find('.importInspectTable_scrollHead').css('height'));
			$('#importInspectTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#importInspectTable_filter').addClass('d-none');
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
					let selectData = importInspectTable.row(item).data();
					if( importInspectTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(importInspectTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(importInspectTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#importInspectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#importInspectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	importInspectTable.on('column-reorder', function( e, settings, details ) {
		let api = importInspectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#importInspectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	let aftWhsIdx = '';
	let befWhsIdx = '';
	$('#deliveryY').on('click', function(){
		let array = [];
		let state = true;
		let saveCheck = true;
		if($('input[name=scmCheckBox]:checked').length == 0){
			toastr.warning($('#deliveryY').text()+'할 항목을 체크해주세요.');
			state = false;
			saveCheck = false;
			return false;
		}
		$('#importInspectTable tbody').find('tr').each(function(index, item) {
			if($(this).find('input[name=scmCheckBox]').is(':checked')) {
				let td = $(item).find('td');
				let data = importInspectTable.row($(item)).data();
				let node = importInspectTable.row($(item)).node();
				
				let orderDtlSer = importInspectTable.row($(item)).data().orderDtlNo;
				
				let obj = new Object();
				obj.wmChk = data.wmChk;
				obj.inSlipNo = null;
				obj.itemCd = data.itemCd;
				obj.price = data.price;
				obj.inQty = data.orderDtlQty;
				obj.inDate = (moment().format('YYYYMMDD'));
				obj.dealCorpIdx = data.dealCorpIdx;
				obj.orderDtlNo = orderDtlSer;
				obj.orderDtlSeq = data.orderDtlSeq;
				obj.whsIdx = data.wmIdx;
				obj.whsGubun = '';
				obj.inUserIdx = userIdx;
				obj.inDesc = '';
				obj.inputGubun = data.inputGubun;
				obj.requestGubun = data.requestGubun;
				obj.totalInQty = data.orderDtlQty;
				obj.importInspection = 'Y';
				array.push(obj);
			}
		});
		if(saveCheck) {
			$.ajax({
				url: '<c:url value="/qm/importInspectIU"/>',
				type: 'POST',
				data: {
					'jsonArray'	:	JSON.stringify(array)
				},
				beforeSend: function() {
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수입검사가 완료되었습니다.');

						
						$('#allCheckBox').prop('checked', false);
						importInspectTable.ajax.reload();
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

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		importInspectTable.ajax.reload(function() {}, false);
		$('#allCheckBox').prop('checked', false);
// 		$('#btnSave').attr('disabled',true);
// 		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주관리 전체 목록조회
	let planTable = $('#planTable').DataTable({
		dom :"<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: false,
        scrollX: false,
		pageLength: 100000000,
		colReorder: true,
		select: {
			style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/sc/scmFileLst"/>',
			type : 'POST',
			data : {
				orderDtlNo	: function() { return orderDtlNo;},
				orderDtlSeq	: function() { return orderDtlSeq;},
			},
		},
		columns : [
			{ data : 'floorPlan', className : 'text-center align-middle', name : 'floorPlan',
				render : function(data, type, row, meta) {
					if(data!=null && data != '') {
						let dataNm = _.slice(data.split('.'), 0, -1).join('.');
						let dataExt = data.split('.').at(-1);
						return "<a href=\"#\" onclick=\"projectFileDownload(\'"+row['planUuid']+"\',\'"+dataNm+"\',\'"+dataExt+"\')\">"+data+"</a>";
					} else {
						return '<div id="planFileNm" style="text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
		],
		buttons : [],
	});
	
	let reportTable = $('#reportTable').DataTable({
		dom :"<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
			+ "<'row'<'col-md-12'tr>>"
			+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: true,
		ordering: false,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: false,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: false,
        scrollX: false,
		pageLength: 100000000,
		colReorder: true,
		select: {
			style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/sc/scmFileLst"/>',
			type : 'POST',
			data : {
				orderDtlNo	: function() { return orderDtlNo;},
				orderDtlSeq	: function() { return orderDtlSeq;},
			},
		},
//         rowId: 'orderDtlNo',
		columns : [
			{ data : 'reports', className : 'text-center align-middle', name : 'reports',
				render : function(data, type, row, meta) {
					if(data!=null && data != '') {
						let dataNm = _.slice(data.split('.'), 0, -1).join('.');
						let dataExt = data.split('.').at(-1);
						return "<a href=\"#\" onclick=\"projectFileDownload(\'"+row['reportUuid']+"\',\'"+dataNm+"\',\'"+dataExt+"\')\">"+data+"</a>";
					} else {
						return '<div id="reportFileNm" style="text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
		],
		buttons : [],
	});

	function planModal(key, seq, check){
		$('#btnPlanAdd').addClass('d-none');
		fileFormData = new FormData();
		modalType = 'planFile';
		orderDtlNo = key;
		orderDtlSeq = seq;
		if(check == 'X'){
			$('#planModal').modal('show');
			$('#planFile').trigger('click');
		}else{
			$('#planModal').modal('show');
		}
		$('#btnPlanSave').attr('disabled', true);
		setTimeout(function(){
			planTable.ajax.reload();
		}, 150);
	}

	function reportModal(key, check){
		$('#btnReportAdd').addClass('d-none');
		fileFormData = new FormData();
		modalType = 'reportFile';
		orderDtlNo = key;
		orderDtlSeq = seq;
		if(check == 'X'){
			$('#reportModal').modal('show');
			$('#reportFile').trigger('click');
		}else{
			$('#reportModal').modal('show');
		}
		$('#btnReportSave').attr('disabled', true);
		setTimeout(function(){
			reportTable.ajax.reload();
		}, 150);
	}

	// 관련파일 추가 버튼 클릭
	$('#btnReportAdd').on('click', function() {
		$('#reportFile').trigger('click');
	});
	$('#btnPlanAdd').on('click', function() {
		$('#planFile').trigger('click');
	});

	// 파일 선택
	$(document).on('change', '#planFile, #reportFile', function() {
		let fileInput = document.getElementById(modalType); //id로 파일 태그를 호출
		let files = fileInput.files;		//업로드한 파일들의 정보를 넣는다.
		for(let i=0; i<files.length; i++ ) {
			let uuid = uuid_v4();

			let fileNameList = files[i].name.split('.');
			let fileNm = files[i].name.split('.').at(-1);
			let fileFullNm = _.slice(fileNameList, 0, -1).join('.');
			$('#'+modalType+'Nm').text(fileFullNm+'.'+fileNm);
			$('#'+modalType+'Nm').val(uuid);
		
			fileFormData.append('file-'+uuid,files[i]);
			fileFormData.append('uuid-'+uuid,uuid);
			fileFormData.append('ext-'+uuid,files[i].name.split('.').at(-1));
		}
    	$('#btnReportSave').attr('disabled', false);
    	$('#btnPlanSave').attr('disabled', false);
    	$('#'+modalType).val('');
	})
	
	// 파일 다운로드
	function projectFileDownload(uuid, fileName, ext) {
		fileDownload({uuid:uuid, fileName:fileName, ext:ext});
	}

	$(document).on('click','#btnPlanSave, #btnReportSave', function() {
// 		let orderDtlNo = importInspectTable.row('.selected').data().orderDtlNo;
		$('#my-spinner').show();
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
		fileUpload(saveFileFormData).then( (value) => {
			if(modalType == 'planFile'){
				$.ajax({
					url: '<c:url value="/sc/planFileIU"/>',
					type : 'POST',
	// 				async: false,
	// 				datatype: 'json',
					data:	{
						'orderDtlNo':	orderDtlNo,
						'orderDtlSeq':	orderDtlSeq,
		            	'planUuid'	:	(value+$('#planFileNm').val()),
		            	'floorPlan'	:	$('#planFileNm').text(),
		            },
	// 				contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
	// 					fileNumber = 0;
						fileFormData = new FormData();
						importInspectTable.ajax.reload(function() {});
						planTable.ajax.reload(function() {});
						$('#btnPlanSave').attr('disabled', true);
						$('#allCheckBox').prop('checked', false);
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide();
						$('#planFile').val('');
					},
				});
			}else if(modalType == 'reportFile'){
				$.ajax({
					url: '<c:url value="/sc/reportFileIU"/>',
					type : 'POST',
	// 				async: false,
	// 				datatype: 'json',
					data:	{
						'orderDtlNo':	orderDtlNo,
						'orderDtlSeq':	orderDtlSeq,
		            	'reportUuid':	(value+$('#reportFileNm').val()),
		            	'reports'	:	$('#reportFileNm').text(),
		            },
	// 				contentType : "application/json; charset=UTF-8",
					beforeSend: function() {
		            	//$('#my-spinner').show();
		            },
					success : function(res) {
	// 					fileNumber = 0;
						fileFormData = new FormData();
						importInspectTable.ajax.reload(function() {});
						reportTable.ajax.reload(function() {});
						$('#btnReportSave').attr('disabled', true);
						$('#allCheckBox').prop('checked', false);
						toastr.success('저장되었습니다.');
						$('#my-spinner').hide();
						$('#planFile').val('');
					},
				});
			}
		})
		.catch( (error) => {
			toasrt.warning(error);												
		});
	});


	$(document).on('click','#btnPlanDel, #btnReportDel', function() {
		if(modalType == 'planFile'){
			if( !$('#planTable tbody tr').hasClass('selected') ){
				toastr.warning('삭제할 행을 선택해주세요.');
				return false;
			}
			let uuidData = $('#planTable').DataTable().row('.selected').data().planUuid;
			if(uuidData!=null && uuidData != '') {
				$('#fileDeleteModal').modal('show');
			} else {
				let uuid = planTable.row('.selected').data().uuid;
				fileFormData.delete('file-'+uuid);
				fileFormData.delete('uuid-'+uuid);
				fileFormData.delete('ext-'+uuid);
				$('#planTable').DataTable().row('.selected').remove().draw();
			}
		}else if(modalType == 'reportFile'){
			if( !$('#reportTable tbody tr').hasClass('selected') ){
				toastr.warning('삭제할 행을 선택해주세요.');
				return false;
			}
			let uuidData = $('#reportTable').DataTable().row('.selected').data().reportUuid;
			if(uuidData!=null && uuidData != '') {
				$('#fileDeleteModal').modal('show');
			} else {
				let uuid = reportTable.row('.selected').data().uuid;
				fileFormData.delete('file-'+uuid);
				fileFormData.delete('uuid-'+uuid);
				fileFormData.delete('ext-'+uuid);
				$('#reportTable').DataTable().row('.selected').remove().draw();
			}
		}
	});
	
	$('#btnFileDeleteModalY').on('click', function() {
		if(modalType == 'planFile'){
// 			let orderDtlNo = planTable.row('.selected').data().orderDtlNo;
			$.ajax({
				url: '<c:url value="/sc/planFileIU"/>',
	            type: 'POST',
	            data: {
	            	'orderDtlNo':	orderDtlNo,
	            	'orderDtlSeq':	orderDtlSeq,
	            	'planUuid'	:	'',
	            	'floorPlan'	:	'',
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						planTable.ajax.reload();
						$('#planTable').DataTable().row('.selected').remove().draw();
						importInspectTable.ajax.reload();
						$('#allCheckBox').prop('checked', false);
						$('#btnPlanAdd').removeClass('d-none');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		}else if(modalType == 'reportFile'){
// 			let orderDtlNo = reportTable.row('.selected').data().orderDtlNo;
			$.ajax({
				url: '<c:url value="/sc/reportFileIU"/>',
	            type: 'POST',
	            data: {
	            	'orderDtlNo':	orderDtlNo,
	            	'orderDtlSeq':	orderDtlSeq,
	            	'reportUuid':	'',
	            	'reports'	:	'',
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						reportTable.ajax.reload();
// 						$('#reportTable').DataTable().row('.selected').remove().draw();
						importInspectTable.ajax.reload();
						$('#allCheckBox').prop('checked', false);
						$('#btnReportAdd').removeClass('d-none');
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

	//전체체크
	$('#allCheckBox').on('click', function(){
		if($(this).is(':checked')){
			$('[name=scmCheckBox]').prop('checked', true);
		} else {
			$('[name=scmCheckBox]').prop('checked', false);
		}
	});

	//수입검사대상 변경 시
	$('#searchInspect').on('change', function(){
		importInspectTable.ajax.reload();

	});

</script>

</body>
</html>
