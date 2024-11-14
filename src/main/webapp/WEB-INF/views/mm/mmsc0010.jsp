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
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<div class="input-group w-auto h-100 me-3">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주일자</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트코드</label>
						<input type="hidden" id="projectIdx">
						<input type="text" class="form-control" style="width:200px;" id="projectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
						
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="managementBoardTable">
					<thead class="table-light">
						<tr>
							<th rowspan="2" class="text-center align-middle">품목유형</th>
							<th rowspan="2" class="text-center align-middle">품명</th>
							<th rowspan="2" class="text-center align-middle">국내/해외</th>
							<th rowspan="2" class="text-center align-middle">수주일</th>
							<th rowspan="2" class="text-center align-middle">수주처</th>
							<th rowspan="2" class="text-center align-middle">수주관리번호</th>
							<th rowspan="2" class="text-center align-middle">Project No.</th>
							<th rowspan="2" class="text-center align-middle">프로젝트명</th>
							<th rowspan="2" class="text-center align-middle">수주수량</th>
							<th rowspan="1" colspan="3" class="text-center align-middle">설계</th>
							<th rowspan="1" colspan="2" class="text-center align-middle">구매</th>
							<th rowspan="1" colspan="2" class="text-center align-middle">제조</th>
							<th rowspan="1" colspan="2" class="text-center align-middle">출고</th>
						</tr>
						<tr>
							<th class="text-center align-middle">기구</th>
							<th class="text-center align-middle">광학</th>
							<th class="text-center align-middle">전장</th>
							<th class="text-center align-middle">완료일</th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">완료일</th>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">출고일</th>
							<th class="text-center align-middle">상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 수주 모달 -->
<div class="modal fade" id="bizOrderAdmModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					수주 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnBizOrderAdmModalPaste">
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
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizStartDate"> 
						<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
						<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="bizEndDate"> 
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBizOrderAdmModalSearch"><i class="fa-regular fa-clipboard"></i></button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="bizOrderAdmModalTable">
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
	WM_init('ADM');
	WM_init('DTL');

	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	let abroadGubunList = getCommonCode('시스템', '043'); // 국내/해외

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));
	
	// 수주관리 전체 목록조회
	let managementBoardTable = $('#managementBoardTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
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
			url : '<c:url value="/mm/managementBoard"/>',
			type : 'GET',
			data : {
				'startDate'		: function() { return $('#startDate').val();},
				'endDate'		: function() { return $('#endDate').val();},
				'prjCd'	: function() { return $('#projectCd').val(); },
// 				status		: function() { return $('#searchConfirmDesign').val();}
			},
		},
        rowId: 'orderNo',
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
			//품명
			{ data: 'goodsNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
			//국내/해외
			{ data: 'abroadGubun', className : 'text-center align-middle',
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
			//수주일
			{ data: 'ordDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return "";
					}
				}
			},
			//수주처
			{ data: 'dealCorpNm', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return data
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
						return data
					} else {
						return "";
					}
				}	
			},
			//수량
			{ data: 'ordQty', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
						
					} else {
						return "";
					}
				}	
			},
			//기구 상태
			{ data: 'machineCount', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(parseInt(data) > 0){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">설계완료</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
					}
				}	
			},
			//광학 상태
			{ data: 'opticsCount', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(parseInt(data) > 0){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">설계완료</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
					}
				}	
			},
			//전장 상태
			{ data: 'electronicsCount', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(parseInt(data) > 0){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">설계완료</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
					}
				}	
			},
			//구매 완료일
			{ data: 'completeDate', className : 'text-center align-middle', name : 'completeDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}	
			},
			//구매 상태
			{ data: 'status', className : 'text-center align-middle', name : 'status',
				render : function(data, type, row, meta) {
					if(data != null){
						if(data=='001') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
						} else if(data=='002') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">발주</div>';
						} else if(data=='003') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">입고</div>';
						} else {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">대기</div>';
					}
				}	
			},
			//제조 완료일
			{ data: 'workEndDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}	
			},
			//제조 상태
			{ data: 'workStatus', className : 'text-center align-middle',
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
			//출고 완료일
			{ data: 'outDate', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '<div style="min-width:130px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}	
			},
			//출고 상태
			{ data: 'outQty', className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(parseInt(data)>=parseInt(row['ordQty'])) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">출고완료</div>';
					} else if(parseInt(data)<parseInt(row['ordQty']) && parseInt(data)>0) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">부분출고</div>';
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">미출고</div>';
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

		},
	});

	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		managementBoardTable.ajax.reload(function() {}, false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	let statusList = new Array();
	var json=new Object();
	json.commonCd="001";
	json.commonNm="대기";
	statusList.push(json);
	json=new Object();
	json.commonCd="002";
	json.commonNm="발주";
	statusList.push(json);
	json=new Object();
	json.commonCd="003";
	json.commonNm="입고";
	statusList.push(json);
	
	let selectData = new 

	// 수주별발주 수정 버튼 click
	$('#btnEdit').on('click', function() {
		WM_action_ON('ADM','workingWarningModal');
		
		$('#managementBoardTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if(index_td == managementBoardTable.column('completeDate:name').index()) {
					let value = $(td).text();
					if(value=='') {
						$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment().format('YYYY-MM-DD')+'">');
					} else {
						$(td).html('<input type="date" style="min-width:130px;" max="9999-12-31" name="orderDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
					}
					
				} else if(index_td == managementBoardTable.column('status:name').index()) {
					let value = managementBoardTable.row(tr).data().status;
					let html = '';
					html += '<select class="form-select">';
					statusList.forEach(function(item) {
						if(item.commonCd==value) {
							html +='<option value="'+item.commonCd+'" selected>'+item.commonNm+'</option>';
						} else {
							html +='<option value="'+item.commonCd+'">'+item.commonNm+'</option>';
						}
					});
					html += '</select>';
					$(td).html(html);
				}
			})
		});
		$('input[name=dtlCheckBox]').attr('disabled', true);
		//애네뭐지..
		//$('.lcTypeOutputToggle').attr('disabled', false);
		//$('.lcTypeInputToggle').attr('disabled', false);
		//$('.lcTypeReturnToggle').attr('disabled', false);
		//$('.lcTypeQcToggle').attr('disabled', false);
		//$('.lcTypeOutsourcingToggle').attr('disabled', false);
		
		$('.lcTypeOutputToggle').bootstrapToggle('enable');
		$('.lcTypeInputToggle').bootstrapToggle('enable');
		$('.lcTypeReturnToggle').bootstrapToggle('enable');
		$('.lcTypeQcToggle').bootstrapToggle('enable');
		$('.lcTypeOutsourcingToggle').bootstrapToggle('enable');
		
		$('#btnNew').attr('disabled', false); // ADM 신규 버튼
		$('#btnSave').attr('disabled', false); // ADM 저장 버튼
		$('#btnEdit').attr('disabled', true); // ADM 수정 버튼
		$('#btnDel').attr('disabled', false); // ADM 삭제 버튼
		$('#btnCancel').attr('disabled', false); // ADM 취소 버튼
		$('#btnApproval001').attr('disabled', true); // 승인 버튼
		$('#btnApproval002').attr('disabled', true); // 승인취소 버튼
	});
	

	// 수주별발주 저장 버튼 click
	$('#btnSave').on('click', function() {
		let array = [];
		let state = true;
		$('#managementBoardTable tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let data = managementBoardTable.row($(item)).data();
			let node = managementBoardTable.row($(item)).node();
			
			let idx = managementBoardTable.row($(item)).data().idx;
			let completeDate = $(td).eq(managementBoardTable.column('completeDate:name').index()).find('input').val();
			let status = $(td).eq(managementBoardTable.column('status:name').index()).find('select').val();

			let obj = new Object();
			obj.idx = idx;
			obj.status = status;
			obj.completeDate = completeDate.replace(/-/g, '');
			array.push(obj);
		});

		let tableData = [];
		$('#managementBoardTable tbody').find('tr').each(function(index, item) {
			let obj = {};
			let data = managementBoardTable.row(index).data();
			obj.idx = data.idx;
			obj.status = data.status;
			obj.completeDate = data.completeDate;
			tableData.push(obj);
		});
		console.log(array)
		array = _.differenceWith(array, tableData, _.isEqual);
		console.log(tableData)
		console.log(array)
		
		$.ajax({
			url: '<c:url value="/mm/bizOrderStatusUpd"/>',
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
					managementBoardTable.ajax.reload(function() {});
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

	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
		$('#cancelModal').data('cancelType', 'ADM');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let cancelType = $('#cancelModal').data('cancelType');

		if(cancelType == 'ADM') {
			toastr.success('취소되었습니다.');
			WM_action_OFF('ADM');

			$('#btnSearch').trigger('click'); // 조회 버튼 click

			purchaseOrderAdmTable.ajax.reload(function(){},false);
			purchaseOrderAdmTable.colReorder.enable();

			$('#purchaseOrderAdmTable_wrapper').find('.filters th').each(function(index, item) {
				$(item).find('input').attr('disabled', false); // 검색 필터 disabled
			});
			
			$('#btnNew').attr('disabled', false); // 신규 버튼
			$('#btnSave').attr('disabled', true); // 저장 버튼
			//$('#btnEdit').attr('disabled', false); // 수정 버튼
			$('#btnDel').attr('disabled', false); // 삭제 버튼
			$('#btnCancel').attr('disabled', true); // 취소 버튼
			$('#btnApproval001').attr('disabled', false); // 승인 버튼
			$('#btnApproval002').attr('disabled', false); // 승인취소 버튼
		}
	});

	//프로젝트코드====================================================================================

	let now = new Date();
	let now_year = now.getFullYear();
		
	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal1').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
			setTimeout(function() {
				$('#bizOrderAdmModalTable1').DataTable().$('tr.selected').removeClass('selected');
			}, 550);
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
		$('#projectCd').val(data.prjCd);
		$('#projectIdx').val(data.idx);
		$('#bizOrderAdmModal1').modal('hide');
	});
	
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#projectCd').val(data.prjCd);
		$('#projectIdx').val(data.idx);
		$('#bizOrderAdmModal1').modal('hide');
	});

	$('#btnDelProjectCd').on('click', function(){
		$('#projectCd').val('');
		$('#projectIdx').val('');
	});

</script>

</body>
</html>
