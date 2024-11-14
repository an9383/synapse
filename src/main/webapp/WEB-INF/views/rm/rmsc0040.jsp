<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol';
																		  grid-template-rows: 1fr;
																		  grid-template-columns: 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">수주일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">부서</label>
					<select class="form-select h-100 me-3 w-auto" id="searchUserDepartment" style="width: 220px;">
						<option value="">전체</option>
						<option value="001">기구</option>
						<option value="002">광학</option>
						<option value="003">전장</option>
					</select>
					<div class="input-group w-auto h-100 me-3">
						<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트코드</label>
						<input type="text" class="form-control" id="batchProjectCd" disabled>
						<button type="button" id="btnDelProjectCd" style="background-color: transparent; border-color: transparent; position: absolute; top: 0; right: 0; margin: 5px 23px; margin-left: 0px; border: none;">
							<i class="fa-solid fa-xmark"></i>
						</button>
						<button type="button" style="padding: 1px 4px; margin-left: 0px;" class="btn btn-primary" id="btnSearchProjectCd">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="projectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center"><input class="form-check-input" type="checkbox" id="checkAll" style="margin : 0px; width:25px;height:25px;"></th>
							<th class="text-center align-middle">순번</th>
							<th class="text-center align-middle">유형</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">구분</th>
							<th class="text-center align-middle">차수</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">구분1</th>
							<th class="text-center align-middle">구분2</th>
							<th class="text-center align-middle">MAKER</th>
							<th class="text-center align-middle">코드</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">소요수량</th>
							<th class="text-center align-middle">재고수량</th>
							<th class="text-center align-middle">요청수량</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">발주일</th>
							<th class="text-center align-middle">납기요청일</th>
							<th class="text-center align-middle">거래처</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 모달 -->
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
</script>

<!-- 변수 및 테이블 호출 -->
<script>
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#bizStartDate1').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#bizEndDate1').val(moment().format('YYYY-MM-DD'));
	let now = new Date();
	let now_year = now.getFullYear();
	WM_init('edit');

	// 수주 목록 조회
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
			url : '<c:url value="/rm/projectTotalLst"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				inputGubun : function() {return $('#searchUserDepartment').val();},
				projectCd : function() {return $('#batchProjectCd').val();}
			},
		},
		columns : [
			{//체크박스
				className : 'text-center align-middle',
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check" onclick="event.cancelBubble=true"/>';
					}
			},
			{//순번
				className : 'text-center align-middle',
				render : function(data, type, row, meta){
					return '<div style="white-apce : nowrap; text-overflow: ellipsis; overflow: hidden;">'+(meta.row+1)+'</div>';
				}
			},
			{//유형
				data : 'orderGubun', className : 'text-center align-middle', name: 'orderGubun',
				render : function(data, type, row, meta) {
					if(data!=null){
						if(data=='001'){
							return '<div style="white-space:nowrap; text-overflow: ellipsis; overflow: hidden;">가공</div>';
						} else {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">구매</div>';
						}
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{//프로젝트코드
				data : 'prjCd', className : 'text-center align-middle', name : 'prjCd',
				render : function(data, type, row, meta){
					return '<div stlye="white-space : nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//프로젝트명
				data : 'prjNm', className : 'text-center align-middle', name : 'prjNm',
				render : function(data, type, row, meta) {
					return '<div style="white-space : nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//발주번호
				data : 'ordDtlNo', className : 'text-center align-middle', name : 'bizOrdNo',
				render : function(data) {
					if(data!=null){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{//구분
				data: 'purchaseGubun', className : 'text-center align-middle', name: 'purchaseGubun', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//차수
				data: 'version', className : 'text-center align-middle', name: 'version', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//부서
				data: 'inputGubun', className : 'text-center align-middle', name: 'inputGubun', 
				render : function(data, type, row, meta) {
					if(data=='001'){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">기구</div>';
					} else if(data=='002'){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">광학</div>';
					} else if(data=='003'){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">전장</div>';
					} else {
						return '';
					}
				}
			},
			{//구분1
				data: 'moduleGubun', className : 'text-center align-middle', name: 'moduleGubun', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//구분2
				data: 'moduleName', className : 'text-center align-middle', name: 'moduleName', 
				render : function(data, type, row, meta) {
					return '<div style="max-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//MAKER
				data: 'maker', className : 'text-center align-middle', name: 'maker', 
				render : function(data, type, row, meta) {
					return '<div style="max-width:100px; white-space: pre-line; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//코드
				data: 'partCd', className : 'text-center align-middle', name: 'partCd', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//품명
				data: 'partNm', className : 'text-center align-middle', name: 'partNm', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//규격
				data: 'partDc', className : 'text-center align-middle', name: 'partDc', 
				render : function(data, type, row, meta) {
					return '<div style="max-width:100px; white-space: pre-line; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//단위
				data: 'surfaceTreatment', className : 'text-center align-middle', name: 'surfaceTreatment', 
				render : function(data, type, row, meta) {
					return '<div style="max-width:100px; white-space: pre-line; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{//소요수량
				data: 'needQty', className : 'text-right align-middle', name: 'ordQty', 
				render : function(data, type, row, meta) {
					if(row['ordQtyNew']==null||row['ordQtyNew']==''){
						return '<div name="needQty" style="text-align:right;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(data)+'</div>';
					} else {
						return '<div name="needQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+row['ordQtyNew']+'</div>';
					}
				}
			},
			{//재고수량
				data: 'inventoryQty', className : 'text-center align-middle', name: 'ordQty', 
				render : function(data, type, row, meta) {
					return '<div name="inventoryQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(data)+'</div>';
				}
			},
			{//요청수량
				data: 'ordQty', className : 'text-center align-middle', name: 'ordQty', 
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div name="ordQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(data)+'</div>';
					} else {
						return '<div name="ordQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}
				}
			},
			{//발주수량
				data: 'outQty', className : 'text-center align-middle', name: 'outQty', 
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div name="outQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(data)+'</div>';
					} else {
						return '<div name="outQty" style="text-align:right; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					}				}
			},
			{//단가
				data : 'price', className : 'text-right align-middle', name : 'price',
				render : function(data, type, row, meta) {
					if(data!=null){
						let html = '<div style="min-width:100px;  white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">';
						html += '<input type="text" style="min-width:100%;text-align:right;" class="form-control text-right" name="itemCost" value="'+addCommas(data)+'" disabled>';
						html += '</div>';
						return html;
					} else {
						let html = '<div style="min-width:100px;  white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">';
						html += '<input type="text" style="min-width:100%;text-align:right;" class="form-control text-right" name="itemCost" disabled>';
						html += '</div>';
						return html;
					}
				}
			},
			{//금액
				className : 'text-center align-middle', name: 'totalCost', 
				render : function(data, type, row, meta) {
					let html = ''; 
					let sum = 0;
					if(row['price']!=null&&row['outQty']!=null){
						sum = parseInt(row['price']*row['outQty']);
						html = '<div name="price" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">';
						html += '<input type="text" style="min-width:100%;text-align:right;" class="form-control text-right" name="totalCost" value="'+addCommas(sum)+'" disabled>';
						html += '</div>';
					} else {
						html = '<div name="price" style="min-width:100px; white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">';
						html += '<input type="text" style="min-width:100%;text-align:right;" class="form-control text-right" name="totalCost" disabled>';
						html += '</div>';
					}
					return html;
				}
			},
			{//발주일
				data: 'ordDate', className : 'text-center align-middle', name: 'ordDate', 
				render : function(data, type, row, meta) {
					if(row['ordDateNew']!=null){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(row['ordDateNew']).format('YYYY-MM-DD')+'</div>';
					}else if(row['ordDateNew']==null && data!=null){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{//납기요청일
				data: 'dueDate', className : 'text-center align-middle', name: 'dueDate', 
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{//거래처
				data: 'supplier', className : 'text-center align-middle', name: 'supplier', 
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{//비고
				data: 'remark', className : 'text-center align-middle', name: 'remark', 
				render : function(data, type, row, meta) {
					return '<div style=" white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
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
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			{ extend: 'colvis',	text: 'Select Col'},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#projectTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#projectTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#projectTable_filter').addClass('d-none');
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
					let selectData = projectTable.row(item).data();
					if( projectTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(projectTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(projectTable.row(item).node()).addClass('notEdit');
					}
				});
			}

			let needQty = 0;
			let inventoryQty = 0;
			let ordQty = 0;
			let outQty = 0;
			let price = 0;

			if($('#projectTable').DataTable().data().length!=0){
				let currentPrjNm = data[0].prjNm;

				for(var i=0; i<data.length;i++){
					if(currentPrjNm != data[i].prjNm){
						currentPrjNm = data[i].prjNm;
						needQty = 0;
						inventoryQty = 0;
						ordQty = 0;
						outQty = 0;
						price = 0;
					}

					needQty += Number(data[i].needQty);
					inventoryQty += Number(data[i].inventoryQty);
					ordQty += Number(data[i].ordQty);
					outQty += Number(data[i].outQty);
					price += Number(data[i].price*data[i].outQty);

					if(i+1 != data.length){ //마지막 데이터가 아닐 경우
						if(data[i].prjNm!=data[i+1].prjNm){
							let html = '';
							html += '<tr>';
							html += '	<th class="text-center" name="noName" colspan="13" style="background-color:#bcecae">'+data[i].prjCd+'  '+data[i].prjNm+'</th>';
							html += '	<th class="text-right" name="valueColNeed" style="background-color:#bcecae;text-align:right;">'+addCommas(needQty)+'</th>';
							html += '	<th class="text-right" name="valueColInv" style="text-align:right;background-color:#bcecae">'+addCommas(inventoryQty)+'</th>';
							html += '	<th class="text-right" name="valueColOrd" style="text-align:right;background-color:#bcecae">'+addCommas(ordQty)+'</th>';
							html += '	<th class="text-right" name="valueColOut" style="text-align:right;background-color:#bcecae">'+addCommas(outQty)+'</th>';
							html += '	<th class="text-center" name="noName2" style="background-color:#bcecae"></th>';
							html += '	<th class="text-right" name="valueColPrice" style="background-color:#bcecae;text-align:right;">'+addCommas(price)+'</th>';
							html += '	<th class="text-center" name="noName3" colspan="4" style="background-color:#bcecae"></th>';
							html += '</tr>';
							$(projectTable.row(i).node()).after(html);
						}
					} else { //마지막에 소계 전체 출력
						let html = '';
						html += '<tr>';
						html += '	<th class="text-center" name="noName" colspan="13" style="background-color:#bcecae">'+data[i].prjCd+'  '+data[i].prjNm+'</th>';
						html += '	<th class="text-right" name="valueColNeed" style="background-color:#bcecae;text-align:right;">'+addCommas(needQty)+'</th>';
						html += '	<th class="text-right" name="valueColInv" style="background-color:#bcecae;text-align:right;">'+addCommas(inventoryQty)+'</th>';
						html += '	<th class="text-right" name="valueColOrd" style="background-color:#bcecae;text-align:right;">'+addCommas(ordQty)+'</th>';
						html += '	<th class="text-right" name="valueColOut" style="background-color:#bcecae;text-align:right;">'+addCommas(outQty)+'</th>';
						html += '	<th class="text-center" name="noName2" style="background-color:#bcecae"></th>';
						html += '	<th class="text-right" name="valueColPrice" style="background-color:#bcecae;text-align:right;">'+addCommas(price)+'</th>';
						html += '	<th class="text-center" name="noName3" colspan="4" style="background-color:#bcecae"></th>';
						html += '</tr>';
						$(projectTable.row(i).node()).after(html);
					}
				}

				
				
			}
			
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

				$(cell).html('<input type="text" class="form-control" />');
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
			api.button(3).trigger();
		}
	});
	// dataTable colReorder event
	projectTable.on('column-reorder', function( e, settings, details ) {
		let api = projectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#projectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	$(document).on('click', '.buttons-columnVisibility', function(){
		let colNum = $('#projectTable tbody tr').eq(0).find('td').length;
		let isNeed = $('[name=needQty]').val()==undefined;
		let isInv = $('[name=inventoryQty]').val()==undefined;
		let isOrd = $('[name=ordQty]').val()==undefined;
		let isOut = $('[name=outQty]').val()==undefined;
		let isPrice = $('[name=price]').val()==undefined;
		let firstSpan=parseInt($('[name=noName]').attr('colspan'));
		let lastSpan=parseInt($('[name=noName3]').attr('colspan'));
		let colIdx = $(this).attr('data-cv-idx');

		if((parseInt(colIdx)>=15&&parseInt(colIdx)<=18)||parseInt(colIdx)==20){
			if(isNeed){//요청수량
				$('[name=valueColNeed]').addClass('d-none');
			} else {
				$('[name=valueColNeed]').removeClass('d-none');
			}
			if(isInv){
				$('[name=valueColInv]').addClass('d-none');
			} else {
				$('[name=valueColInv]').removeClass('d-none');
			}
			if(isOrd){
				$('[name=valueColOrd]').addClass('d-none');
			} else {
				$('[name=valueColOrd]').removeClass('d-none');
			}
			if(isOut){
				$('[name=valueColOut]').addClass('d-none');
			} else {
				$('[name=valueColOut]').removeClass('d-none');
			}
			if(isPrice){
				$('[name=valueColPrice]').addClass('d-none');
			} else {
				$('[name=valueColPrice]').removeClass('d-none');
			}
		} else if(colIdx<15){
			if($(this).hasClass('active')){//키는거
					$('[name=noName]').removeClass('d-none');
					$('[name=noName]').attr('colspan', firstSpan+1);
			} else {//끄는거
				if(firstSpan==1){
					$('[name=noName]').addClass('d-none');
				} else {
					$('[name=noName]').attr('colspan', firstSpan-1);
				}
			} 
		} else if(colIdx>20){
			if($(this).hasClass('active')){
					$('[name=noName3]').removeClass('d-none');
					$('[name=noName3]').attr('colspan', lastSpan+1);
			} else {
				if(lastSpan==1){
					$('[name=noName3]').addClass('d-none');
				} else {
					$('[name=noName3]').attr('colspan', lastSpan-1);
				}
			} 
		} else if(colIdx==19){
			if($(this).hasClass('active')){
				$('[name=noName2]').removeClass('d-none');
			} else {
				$('[name=noName2]').addClass('d-none');
			} 
		}
	})
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


</script>

<!-- 이벤트 -->
<script>
	//전체 체크시
	$('#checkAll').on('click', function() {
		if($('#checkAll').is(":checked")){
			$('input[name=check]').prop('checked', true);
		} else {
			$('input[name=check]').prop('checked', false);
		}
		$('#btnEdit').attr('disabled', false);
	})
	
	//테이블 클릭시
	$('#projectTable tbody').on('click', 'tr', function(){
		if(!$('[name=check]').prop('disabled')){
			$('#btnEdit').attr('disabled', false);
			if($(this).find('input[name=check]').is(':checked')){
				$(this).find('input[name=check]').prop('checked', false);
			} else {
				$(this).find('input[name=check]').prop('checked', true);
			}
		}
	})

	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		projectTable.ajax.reload(function() {});
		$('#btnSave').attr('disabled', true);
		$('#btnEdit').attr('disabeld', true);
		$('#btnCancel').attr('disabled', true);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	//수정버튼 click
	$('#btnEdit').on('click', function() {
		WM_action_ON('edit','workingWarningModal');
		$('#btnEdit').attr('disabled', true);
		$('#btnSave').attr('disabled', false);
		$('#btnCancel').attr('disabled', false);
		$('input[name=check]').attr('disabled', true);

		$('#projectTable tbody').find('tr').each(function(index_tr, tr){
			if($(this).find('input[name=check]').is(':checked')
					&& projectTable.row(this).data().ordDtlNo!=null
					&& projectTable.row(this).data().confirmYn=='Y'){
				$(this).find('input[name=itemCost]').attr('disabled', false);
			}
		})
	});

	//저장버튼 click
	$('#btnSave').on('click', function(){
		let array = [];
		let state = true;
		new Promise((resolve, reject) => {
			$('#projectTable tbody').find('tr').each(function(index, item){
				if($(this).find('input[name=check]').is(':checked')){
					let td = $(item).find('td');
					let data = projectTable.row($(item)).data();

					let obj = new Object();
					if(data.ordDtlNo!=null){
						obj.orderDtlNo = data.ordDtlNo;
						obj.price = $(td).find('[name=itemCost]').val()!=''?$(td).find('[name=itemCost]').val().replace(/,/g,''):'0';

						array.push(obj);
					}
				}
			})

			if(array.length==0){
				toastr.warning('저장할 내용이 없습니다.');
				state = false;
				$('input[name=check]').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnSave').attr('disabled', true);
				return false;
			}

			if(state){
				$.ajax({
					url : '<c:url value="/pm/purchaseOrderDtlPriceUpdate"/>',
					type : 'POST', 
					dataType : 'json',
					data :  JSON.stringify(array),
					contentType : "application/json; charset=UTF-8",
					beforeSend : function(){
						$('#my-spinner').show();
					},
					success : function(res) {
						if(res.result=='ok'){
							toastr.success('수정되었습니다.');
							WM_action_OFF('edit');
							projectTable.rows('.selected').deselect();

							projectTable.ajax.reload();
							$('#btnSave').attr('disabled',true);
							$('#btnEdit').attr('disabled',true);
							$('#btnCancel').attr('disabled',true);
							$('#checkAll').prop('checked', false);
							$('#my-spinner').hide();
						} else if(res.result == 'fail'){
							toastr.warning(res.message)	;
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#my-spinner').hide();
					}
				})
			}

		})
	})

	// 취소 버튼 click
	$('#btnCancel').on('click', function() {
		$('#cancelModal').modal('show');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		toastr.success('취소되었습니다.');

		WM_action_OFF('edit');

		projectTable.ajax.reload(function() {});

		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		$('[name=check]').attr('disabled', false);
		$('[name=itemCost]').attr('disabled',true);
	});

	//프로젝트 검색
	$('#btnSearchProjectCd').on('click', function(){
		$('#bizOrderAdmModal1').modal('show');
		setTimeout(function() {
			bizOrderAdmModalTable1.ajax.reload(function() {});
		}, 200);
	});

	//프로젝트 목록 조회 버튼 클릭
	$('#btnBizOrderAdmModalSearch1').on('click',function(){
		bizOrderAdmModalTable1.ajax.reload(function() {});
	});

	//프로젝트 선택
	$('#bizOrderAdmModalTable1 tbody').on('dblclick','tr',function(){
		let data = bizOrderAdmModalTable1.row(this).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#bizOrderAdmModal1').modal('hide');
	});

	//프로젝트 선택2
	$('#btnBizOrderAdmModalPaste1').on('click',function(){
		let data = bizOrderAdmModalTable1.row($('tr.selected')).data();
		$('#batchProjectCd').val(data.prjCd);
		$('#bizOrderAdmModal1').modal('hide');
		
	});

	//프로잭트코드 초기화
	$('#btnDelProjectCd').on('click', function(){
		$('#batchProjectCd').val('');
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		}
	});

	// 작업중 경고 모달 아니요 버튼 click
	$('#btnWorkingWarningModalN').on('click', function() {
		if(WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				idx = getWM(WMlastIdx, 'idx');
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
				
				$('.inputGroup').attr('disabled', true); // 입력항목
				$('#btnUserIdCheck').attr('disabled', true); // 중복확인 버튼
				$('#btnSignImage').attr('disabled', true); // 사진선택 버튼
				
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
			}
			
			return false;
		}
	});

	//단가 입력시
	$(document).on('keyup', "input[name=itemCost]", function(event){
		var preData = parseInt($(this).val().replace(/,/g,'')!=''?$(this).val().replace(/,/g,''):0);
		let data = projectTable.row($(this).parents('tr')).data();
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val(data.price);
			$(this).select();
			event.preventDefault();
			return false;
		}

		let sum = parseInt(preData*data.outQty);
		$(this).parents('tr').find('[name=totalCost]').val(addCommas(sum));
		$(this).val(addCommas(preData));
		
	})
</script>

</body>
</html>
