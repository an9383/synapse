<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag()" onmousemove="OnDrag(event)" style="grid-template-areas: 'middlecolT middlecolT middlecolT'
																							 'dragbarVT dragbarVT dragbarVT'
																							 'leftcolB dragbar rightcolB';
																		  grid-template-rows: 4fr 4px 2fr;
																		  grid-template-columns: 4fr 4px 4fr;">
	<div id="middlecolT">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주년월</label>
					<input type="month" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="month" class="form-control w-auto h-100 me-1" id="endDate">
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고상태</label> -->
					<select class="form-select w-auto h-100 me-3 d-none" id="searchStatus" style="min-width: 70px;">
<!-- 						<option value="" selected>전체</option> -->
<!-- 						<option value="001">대기</option> -->
<!-- 						<option value="002">진행중</option> -->
<!-- 						<option value="003">출고완료</option> -->
					</select>
<!-- 					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트정보</label> -->
<!-- 					<div class="input-group w-auto h-100 me-3"> -->
<!-- 						<input type="text" class="form-control" id="batchProjectCd" disabled> -->
<!-- 						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;"> -->
<!-- 							<i class="fa-solid fa-xmark"></i> -->
<!-- 						</button> -->
<!-- 						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd"> -->
<!-- 							<i class="fa-solid fa-magnifying-glass"></i> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="batchProjectNm" disabled> -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderOutReqTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">국내/해외</th>
							<th class="text-center align-middle">수주일</th>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">Project No.</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">고객발주내용</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">납기일</th>
							<th class="text-center align-middle">출고일</th>
							<th class="text-center align-middle">출고수량</th>
							<th class="text-center align-middle">미출고수량</th>
						</tr>
					</thead>
					<tfoot>
						<tr style="background-color: #6fdb65; border: 1px solid black;">
							<td colspan="2" style="background-color: #6fdb65;">총합계</td>
							<td colspan="10" style="background-color: #6fdb65;"></td>
							<td id="totalOrdQty" style="background-color: #6fdb65;"></td>
							<td style="background-color: #6fdb65;"></td>
							<td id="totalOrdAmt" style="background-color: #6fdb65;"></td>
							<td style="background-color: #6fdb65;"></td>
							<td style="background-color: #6fdb65;"></td>
							<td id="totalOutQty" style="background-color: #6fdb65;"></td>
							<td id="totalRemainQty" style="background-color: #6fdb65;"></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarVT" onmousedown="StartDrag('VT')"></div>
	<div id="leftcolB" style="max-height:42vh;">
		<div class="container-fluid" style="padding: 5px; max-height:40vh;">
			<div class="row">
				<div style="width: 100%;">
					<div class="row" id="leftHeader">
						<div class="d-flex align-items-center justify-content-space-between w-100" style="margin-bottom: 5px;">
							<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고처리</label>
							<div class="me-lg-auto"></div>
							<div class="btn-group" role="group" aria-label="Small button group">
							</div>
						</div>
						<table class="table table-bordered p-0 m-0" id="outReqAdmTable">
							<thead class="table-light">
								<tr>
									<th class="text-center align-middle">No.</th>
									<th class="text-center align-middle">출고일</th>
									<th class="text-center align-middle">출고수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div id="dragbar" onmousedown="StartDrag('HR')"></div>
	<div id="rightcolB" style="max-height:42vh;">
		<div class="container-fluid h-100" style="padding: 5px; width: 100%;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center justify-content-end w-100" style="margin-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1" style="height:32px;">Serial No.</label>
					</div>
					<div class="me-lg-auto"></div>
					<input type="text" class="form-control me-2 text-end" id="serialAddNum" onkeyup="numberFormat(this, 'int')" style="width:50px;" value="1" disabled>
					<div class="btn-group" role="group" aria-label="Small button group">
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="outReqDtlTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">No.</th>
							<th class="text-center align-middle">시리얼번호</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 수주 모달 -->
<div class="modal fade" id="bizOrderAdmModal1" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					프로젝트 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste1">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row" style="padding-bottom: 5px;">
					<div class="d-flex align-items-center d-flex">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주등록일</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate1"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate1"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch1"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable1">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품목유형명</th>
							<th class="text-center align-middle">수주관리번호</th>
							<th class="text-center align-middle">고객발주No</th>
							<th class="text-center align-middle">Project No.</th>
							<th class="text-center align-middle">프로젝트명</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 화면설정 script -->
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
	}
</script>

<script>
	WM_init('ADM');
	WM_init('DTL');

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let dealGubunList 		= getCommonCode('시스템', '011'); // 거래구분
	let dealCorpStatusList 	= getCommonCode('시스템', '015'); // 거래상태
	let abroadGubunList 	= getCommonCode('시스템', '043'); // 국내/해외
	let requestGubunList 	= getCommonCode('시스템', '048'); //요청구분

	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
	selectBoxAppend(dealGubunList, 'modalDealGubun', '', '1'); //거래구분
	selectBoxAppend(dealCorpStatusList, 'modalDealCorpStatus', '', '1'); //거래상태
	
	$('#startDate').val(moment().format('YYYY-MM'));
	$('#endDate').val(moment().format('YYYY-MM'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));

	let bizOrdIdx = '';
	let bizOrdNo = '';
	let bizOrdSeq = '';
	let prjCd = '';
	let prjNm = '';

	let outReqIdx = '';
	let outReqNo = '';
	
	// 수주관리 전체 목록조회
	$('#bizOrderOutReqTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderOutReqTable thead'); // filter 생성
	let bizOrderOutReqTable = $('#bizOrderOutReqTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '65vh',
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
			url : '<c:url value="/bs/bizOrderOutReqLst"/>',
			type : 'POST',
			data : {
 				'startDate'		: function() { return moment($('#startDate').val(),'YYYY-MM').format('YYYYMM'); },
 				'endDate'		: function() { return moment($('#endDate').val(),'YYYY-MM').format('YYYYMM'); },
 				'projectCd'	: function() { return $('#searchInOutGubun').val(); },
 				'status'	: function() { return $('#searchStatus').val(); },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'status', className : 'text-center align-middle', name: 'status', //프로젝트
				render: function(data, type, row, meta) {
					if(data!=null){
						if(data == '001'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
						} else if(data == '002'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">진행중</div>';
						} else if(data == '003'){
							return '<div style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">출고완료</div>';
						}
					} else return '';
				}
			},
			{ data: 'goodsTypeNm', className : 'text-center align-middle', //품목유형
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			{ data: 'goodsNm', className : 'text-center align-middle', //품명
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'abroadGubun', className : 'text-center align-middle', //국내/해외
				render : function(data, type, row, meta) {
					var abroadGubun = '';
					abroadGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	abroadGubun = item.commonNm;
					    }
					});
					return abroadGubun;
				}	
			},
			{ data: 'ordDate', className : 'text-center align-middle', //수주일
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle', //수주처
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'bizOrdNo', className : 'text-center align-middle', //수주관리번호
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'customerNo', className : 'text-center align-middle', //고객발주No
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'prjCd', className : 'text-center align-middle', //Project No.
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'prjNm', className : 'text-center align-middle', //프로젝트명
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'customerDesc', className : 'text-center align-middle', //고객발주내용
				render : function(data, type, row, meta) {
					if(data != null){
						return data
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordQty', className : 'text-end align-middle', //수주수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordCost', className : 'text-end align-middle', //단가
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'ordAmt', className : 'text-end align-middle', //금액
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return "";
					}
				}	
			},
			{ data: 'dueDate', className : 'text-center align-middle', //납기일
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'outDate', className : 'text-center align-middle', //출고일(최근출고일)
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			{ data: 'outQty', className : 'text-end align-middle', //출고수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			{ data: 'remainQty', className : 'text-end align-middle', //미출고수량
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#middlecolT').css('height'));
			let theadHeight = parseFloat($('#bizOrderOutReqTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#bizOrderOutReqTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#bizOrderOutReqTable_filter').addClass('d-none');
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
					let selectData = bizOrderOutReqTable.row(item).data();
					if( bizOrderOutReqTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(bizOrderOutReqTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(bizOrderOutReqTable.row(item).node()).addClass('notEdit');
					}
				});
			}

			let totalOrdQty = 0;
			let totalOrdAmt = 0;
			let totalOutQty = 0;
			let totalRemainQty = 0;
			for(var i=0; i<data.length; i++){
				totalOrdQty += parseInt(data[i].ordQty);
				totalOrdAmt += parseInt(data[i].ordAmt);
				totalOutQty += parseInt(data[i].outQty);
				totalRemainQty += parseInt(data[i].remainQty);
			}
			$('#totalOrdQty').text(addCommas(totalOrdQty));
			$('#totalOrdAmt').text(addCommas(totalOrdAmt));
			$('#totalOutQty').text(addCommas(totalOutQty));
			$('#totalRemainQty').text(addCommas(totalRemainQty));
			
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderOutReqTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderOutReqTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderOutReqTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderOutReqTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderOutReqTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		bizOrderOutReqTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 출고목록 선택
	$('#bizOrderOutReqTable tbody').on('click', 'tr', function() {
		let data = bizOrderOutReqTable.row(this).data();

		bizOrdIdx = data.idx;
		bizOrdNo  = data.bizOrdNo;
		bizOrdSeq = data.bizOrdSeq;
		prjCd	  = data.prjCd;
		prjNm	  = data.prjNm;

		$('#outReqAdmTable').DataTable().ajax.reload();

	});

	// 출고처리 전체 목록조회
	$('#outReqAdmTable thead tr').clone(true).addClass('filters').appendTo('#outReqAdmTable thead'); // filter 생성
	let outReqAdmTable = $('#outReqAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '20vh',
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
			url : '<c:url value="/bs/outReqAdmLst"/>',
			type : 'POST',
			data : {
 				'bizOrdIdx'		: function() { return bizOrdIdx; },
 				'bizOrdNo'		: function() { return bizOrdNo; },
 				'bizOrdSeq'		: function() { return bizOrdSeq; },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'outDate', className : 'text-center align-middle', name: 'outDate', //출고일(최근출고일)
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<input type="date" class="form-control" name="outDate" value="'+moment().format('YYYY-MM-DD')+'">';
					}
				}
			},
			{ data: 'outQty', className : 'text-end align-middle', name: 'outQty', //미출고수량
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return '<input type="text" class="form-control text-end" name="outQty" value="0">';
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let leftcolB_height = parseFloat($('#leftcolB').css('height'));
			let theadHeight = parseFloat($('#outReqAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#outReqAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(leftcolB_height - theadHeight - 80)+'px');
			
			$('#outReqAdmTable_filter').addClass('d-none');
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
					let selectData = outReqAdmTable.row(item).data();
					if( outReqAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(outReqAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(outReqAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#outReqAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outReqAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	outReqAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = outReqAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outReqAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 출고목록 선택
	$('#outReqAdmTable tbody').on('click', 'tr', function() {
		let data = outReqAdmTable.row(this).data();

		outReqIdx = data.idx;
		outReqNo  = data.outReqNo;

		$('#outReqDtlTable').DataTable().ajax.reload();


		$('#serialAddNum').attr('disabled', false);
	});


	// Serial No. 목록조회
	$('#outReqDtlTable thead tr').clone(true).addClass('filters').appendTo('#outReqDtlTable thead'); // filter 생성
	let outReqDtlTable = $('#outReqDtlTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '20vh',
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
			url : '<c:url value="/bs/outReqDtlLst"/>',
			type : 'POST',
			data : {
 				'outReqIdx'		: function() { return outReqIdx; },
 				'outReqNo'		: function() { return outReqNo; },
			},
		},
        rowId: 'orderNo',
		columns : [
			{ className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'serialNo', className : 'text-center align-middle', name: 'serialNo', //Serial No
				render : function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '<input type="text" name="serialNo" class="form-control text-center">';
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let rightcolB_height = parseFloat($('#rightcolB').css('height'));
			let theadHeight = parseFloat($('#outReqDtlTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#outReqDtlTable_wrapper').find('.dataTables_scrollBody').css('height',(rightcolB_height - theadHeight - 80)+'px');
			
			$('#outReqDtlTable_filter').addClass('d-none');
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
					let selectData = outReqDtlTable.row(item).data();
					if( outReqDtlTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(outReqDtlTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(outReqDtlTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#outReqDtlTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outReqDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	outReqDtlTable.on('column-reorder', function( e, settings, details ) {
		let api = outReqDtlTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outReqDtlTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	//*********************************************모달처리*********************************************//
	
	let now = new Date();
	let now_year = now.getFullYear();

	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal1').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});

	// 품목정보 목록조회
	$('#bizOrderAdmModalTable1 thead tr').clone(true).addClass('filters').appendTo('#bizOrderAdmModalTable1 thead'); // filter 생성
	let bizOrderAdmModalTable1 = $('#bizOrderAdmModalTable1').DataTable({
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
        scrollY: '68vh',
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
        	url : '/bs/bizOrderAdmLst',
			type : 'POST',
			data : {
				startDate 	: function() { return moment($('#bizStartDate1').val()).format('YYYYMMDD'); },
				endDate 	: function() { return moment($('#bizEndDate1').val()).format('YYYYMMDD'); },
				nowYear		: function() { return now_year; },
			},
		},
        rowId: 'itemCd',
		columns : [
			//품목유형
			{ data: 'goodsTypeNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//품목유형명
			{ data: 'goodsNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//수주관리번호
			{ data: 'bizOrdNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//고객발주No
			{ data: 'customerNo', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			//Project No.
			{ data: 'prjCd', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//프로젝트명
			{ data: 'prjNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrderAdmModalTable1_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 223)+'px');
			
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
				let cell = $('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderAdmModalTable1.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderAdmModalTable1;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderAdmModalTable1_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#btnBizOrderAdmModalSearch1').on('click',function(){
		bizOrderAdmModalTable1.ajax.reload(function() {});
	});

	$('#bizOrderAdmModalTable1 tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable1.row(this).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#batchProjectNm').val(data.prjNm);
		$('#bizOrderAdmModal1').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#batchProjectNm').val(data.prjNm);
		$('#bizOrderAdmModal1').modal('hide');
		
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#batchProjectCd').val('');
		$('#batchProjectNm').val('');
	});

</script>

</body>
</html>
