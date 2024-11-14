<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/modal.jsp"%>
<%@include file="../layout/script.jsp"%>
<div id="page" onmouseup="EndDrag(this)" onmousemove="OnDrag(event)" style="grid-template-areas: 'leftcol dragbarH rightcolT'
																									'leftcol dragbarH dragbarV'
																									'leftcol dragbarH rightcolB';
																		  grid-template-rows: 4.5fr 4px 14fr;
																		  grid-template-columns: 4fr 4px 3fr;">
																		
	<input type="file" id="fileFake" style="display: none;" value="" multiple>																
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<%-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100"><spring:message code="userStateCd" text="default text" /></label>
					<select class="form-select w-auto h-100 me-3" id="SearchUserStateCd"></select> --%>
					<input type="text" class="form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">설비구분</label>
					<select class="form-select w-auto h-100 me-1 m-0" id="selectEquipClass">
						<option value="001">금형</option>
						<option value="002">계측기</option>
						<option value="003" selected>제조설비</option>
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">년도</label>
					<select class="form-select w-auto h-100" id="selectYear"></select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnEquipOrdSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="equipTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">No</th>
							<th class="text-center">설비구분</th>
							<th class="text-center">설비코드</th>
							<th class="text-center">설비명</th>
							<th class="text-center">사용유무</th>
							<th style="background: #203864 !important;color: white;">1월</th>
							<th style="background: #203864 !important;color: white;">2월</th>
							<th style="background: #203864 !important;color: white;">3월</th>
							<th style="background: #203864 !important;color: white;">4월</th>
							<th style="background: #203864 !important;color: white;">5월</th>
							<th style="background: #203864 !important;color: white;">6월</th>
							<th style="background: #203864 !important;color: white;">7월</th>
							<th style="background: #203864 !important;color: white;">8월</th>
							<th style="background: #203864 !important;color: white;">9월</th>
							<th style="background: #203864 !important;color: white;">10월</th>
							<th style="background: #203864 !important;color: white;">11월</th>
							<th style="background: #203864 !important;color: white;">12월</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<div id="dragbarH" onmousedown="StartDrag('H')"></div>
	<div id="rightcolT">
		<div class="container-fluid h-120" style="padding: 5px;">
			<div class="row" id="rightHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
				</div>
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
			<div class="row">
				<div style="width: 100%;">
					<div class="row" style="padding: 5px;">
						<table class="table table-bordered p-0 m-0">
							<colgroup>
								<col width="15%">
								<col width="35%">
								<col width="15%">
								<col width="35%">
							</colgroup>
							<tr>
								<th class="text-center align-middle">설비코드</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="equipCd" disabled>
								</td>
								<th class="text-center align-middle">설비명</th>
								<td class="text-center align-middle">
									<input type="text" class="form-control" id="equipNm" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle"><span style="color: #ff0000;">*</span>검사일</th>
								<td class="text-center align-middle">
									<input type="date" class="form-control inputGroup" id="calibrationDate" disabled>
								</td>
								<th class="text-center align-middle"><span style="color: #ff0000;">*</span>차기 검사일</th>
								<td class="text-center align-middle">
									<input type="date" class="form-control inputGroup"	id="nextCalibrationDate" disabled>
								</td>
							</tr>
							<tr>
								<th class="text-center align-middle">검사내용</th>
								<td colspan="3" class="text-center align-middle" style="height: 70px;">
									<textArea class="form-control inputGroup" id="calibrationContent" style="min-height:100%; min-width:100%;resize: none;" disabled></textArea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dragbarV" onmousedown="StartDrag('V')"></div>
	<div id="rightcolB">
		<div class="container-fluid" style="padding: 5px;">
			<div class="row">		
				<div style="width: 100%;">
					<div class="d-flex align-items-center justify-content-end w-100 mt-1" style="margin-bottom:5px;">	
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto attachGroup" style="font-size: 18px !important;" id="btnAttachDataNew" disabled>
								<i class="fa-solid fa-plus"></i>
							</button>											
							<button type="button" class="btn btn-outline-light w-auto attachGroup" style="font-size: 20px !important;" id="btnAttachDataSave" disabled>
								<i class="fa-regular fa-floppy-disk"></i>
							</button>								
							<button type="button" class="btn btn-outline-danger w-auto attachGroup" style="font-size: 17px !important;" id="btnAttachDataDel" disabled>
								<i class="fa-solid fa-trash-can"></i>
							</button>								
							<button type="button" class="btn btn-outline-light w-auto attachGroup" style="font-size: 20px !important;" id="btnAttachDataCancel" disabled>
								<i class="fa-solid fa-xmark"></i>
							</button>
						</div>									
					</div>
					<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">검교정목록</button>
						<button class="nav-link" id="tab2Nav" data-bs-toggle="tab" data-bs-target="#tab2">관련자료</button>
				  	</div>
				  	<div class="tab-content" id="nav-tabContent">
				  		<!-- 탭1 검교정 목록 -->
				  		<div class="tab-pane fade show active" id="tab1">
				  			<div class="row" style="padding: 5px;">
				  				<table class="table table-bordered p-0 m-0" id="equipCalibrationTable">
				  					<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="40%">
										<col width="20%">
										<col width="15%">
									</colgroup>
									<thead class="table-light">
										<tr>
											<th class="text-center">No.</th>
											<th class="text-center">검교정일자</th>
											<th class="text-center">검교정내용</th>	
											<th class="text-center">차기검교정일자</th>
											<th class="text-center">차기검교정완료여부</th>									
										</tr>
									</thead>
				  				</table>
				  			</div>
				  		</div>
				  		<!-- 탭2 관련자료 -->
				  		<div class="tab-pane fade" id="tab2">
							<div class="row" style="padding: 5px;">
								<table class="table table-bordered p-0 m-0" id="attachDataTable">
									<colgroup>
										<col width="15%">
										<col width="30%">
										<col width="55%">
									</colgroup>
									<thead class="table-light">
										<tr>
											<th class="text-center">순번</th>
											<th class="text-center">내용</th>
											<th class="text-center">첨부파일</th>										
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



<!-- 화면설정 script -->
<script>
	let isDragging = false;
	let isDraggingV = false; // 세로 드래그 여부
	let isDraggingH = false; // 가로 드레그 여부
	
	function SetCursor(cursor) {
		let page = document.getElementById("page");
		page.style.cursor = cursor;
	}
	
	function StartDrag(type) {
		//if(type == 'VT') { isDraggingVT = true; SetCursor("n-resize");}
		//if(type == 'VB') { isDraggingVB = true; SetCursor("n-resize");}
		if(type == 'V') { isDraggingV = true; SetCursor("n-resize");}
		if(type == 'H') { isDraggingH = true; SetCursor("ew-resize");}
	}
	
	function EndDrag(e) {
		if(isDraggingV || isDraggingH) {
			dataTableDrawAll(); // dataTable 전체 reload
			//isDraggingVT = false;
			//isDraggingVB = false;
			isDraggingV = false;
			isDraggingH = false;
			SetCursor("auto");
		}
	}
	
	function OnDrag(event) {
		if (isDraggingH) { // 좌우 스크롤
			let page = document.getElementById("page");
			let leftcol = document.getElementById("leftcol"); // 좌측
			let rightcolT = document.getElementById("rightcolT"); // 우측 상단
			//let rightcolM = document.getElementById("rightcolM"); // 우측 중단
			let rightcolB = document.getElementById("rightcolB"); // 우측 하단
			let dragbarWidth = 4;
			let leftcolMinWidth = 20; // leftcol 최소사이즈
			$('#leftHeader').children().each(function(index, item) {
				leftcolMinWidth += $(item).width();
			});
			let rightcolMinWidth = 500; // rightcol 최소사이즈
	
			let rightColWidth = page.clientWidth - parseInt(Math.max(leftcolMinWidth + 120, event.clientX));
			
			let cols = [
				parseInt(Math.max(leftcolMinWidth, page.clientWidth - dragbarWidth - parseInt(Math.max(rightColWidth, rightcolMinWidth)))),
				dragbarWidth,
				parseInt(Math.max(rightColWidth, rightcolMinWidth))
			];
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");
			//console.log(newColDefn);
	
			page.style.gridTemplateColumns = newColDefn;
	
			event.preventDefault();
		} else if (isDraggingV) { // rightcolT와 rightcolB 사이
			let dragbarWidth = 4;

			let page_height = parseInt($('#page').height()); 			// 전체 높이
			let rightcolT_height = parseInt($('#rightcolT').height());	// 우측 상단
			let rightcolB_height = parseInt($('#rightcolB').height());	// 우측 하단

			let rightcolT_min_height = 100;	// 우측 상단 최소높이
			let rightcolB_min_height = 34;	// 우측 하단 최소높이

			let cursorY = event.clientY;	// 현재 cursor y좌표(위에서부터 얼마나 떨어졌는지)
			//console.log(cursorY);
			//console.log(page_height - rightcolB_height - dragbarWidth);
			
			let cols = [
				Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_min_height - dragbarWidth),
				dragbarWidth,
				page_height - dragbarWidth - Math.min(Math.max(rightcolT_min_height, cursorY), page_height - rightcolB_min_height - dragbarWidth),
			];
			
			//console.log(cols);
	
			let newColDefn = cols.map(c => c.toString() + "px").join(" ");

			$('#page').css('grid-template-rows',newColDefn);
	
			event.preventDefault();
		}
	}
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		$('#page').css('grid-template-columns', '4fr 4px 3fr');
		$('#rightcolT').removeClass('d-none');
		$('#rightcolB').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		$('#page').css('grid-template-columns', '1fr');
		$('#rightcolT').addClass('d-none');
		$('#rightcolB').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});

</script>

<script>
	WM_init('new');
	WM_init('edit');
	WM_init('dealNew');
	WM_init('attachDataNew');
	// 공통코드 조회
	/* let itemGubunList = getCommonCode('일반', '002'); //품목구분
	
	selectBoxAppend(itemGubunList, 'itemGubun', '', '2'); */

	let delStatus = '';
	let now = new Date();
	let year = now.getFullYear();
	let mon = now.getMonth()+1;
	let selectYear = parseInt($('#selectYear').val());
	let nowDay = moment().format('YYYYMMDD');

	let clickMon = '';
	let selectMon = '';
	let listVal = 'normal';

	//년도 표시
	function setDateBox(){
		$('#selectYear').append("<option value=''>년도</option>");
		for(var y = (year-100);y<=year+100;y++){
			$('#selectYear').append('<option value="'+y+'"'+(y==year?'selected':'')+'>'+y+'년'+'</option>');
		}
	}
	setDateBox();
	
	// 설비정보 목록조회
	$('#equipTable thead tr').clone(true).addClass('filters').appendTo('#equipTable thead'); // filter 생성
	let equipTable = $('#equipTable').DataTable({
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
		colReorder: false,
		rowReorder: {
			enable: true,
			dataSrc: 'progressOrder',
		},
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/em/equipCalibrationList"/>',
			type : 'POST',
			data : {
				'equipClass'	:	function(){return $('#selectEquipClass').val();},
				'selectYear'	:	function(){return $('#selectYear').val();}
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'progressOrder', className : 'text-center'},
			{ data: 'equipClass', className : 'text-center',
				render : function(data, row) {
					switch(data){
					case '001' :
						return '금형';
						break;
					case '002' :
						return '계측기';
						break;
					case '003' :
						return '제조설비';
						break;
					default : 
						return '미선택';
					}
				}	
			},
			{ data: 'equipCd', className : 'text-center'},
			{ data: 'equipNm', className : 'text-center'},
			{ data: 'useYn', className : 'text-center',
				render : function(data, type, row, meta) {
					let status = '-';
					if(data == 'Y'){
						status = '사용';
					} else if(data == 'N') {
						status = '미사용';
					}
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+status+'</div>';
				}	
			},
			{//1월
				data : 'monthOne',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="1" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="1" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//2월
				data : 'monthTwo',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="2" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="2" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//3월
				data : 'monthThree',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="3" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="3" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//4월
				data : 'monthFour',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="4" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="4" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//5월
				data : 'monthFive',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="5" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="5" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//6월
				data : 'monthSix',
				render: function(data, type, row, meta) {
					let span='<input type="hidden">'
					if(data==1){
						
						return '<span class="month" name="6" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="6" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//7월
				data : 'monthSeven',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="7" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="7" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//8월
				data : 'monthEight',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="8" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="8" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//9월
				data : 'monthNine',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="9" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="9" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//10월
				data : 'monthTen',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="10" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="10" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//11월
				data : 'monthEleven',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="11" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="11" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
			{//12월 
				data : 'monthTwelve',
				render: function(data, type, row, meta) {
					if(data==1){
						return '<span class="month" name="12" style="cursor: pointer;">●</span>';
					} else if (data>1){
						return '<span class="month" name="12" style="cursor: pointer;color:blue;">●</span>';
					} else {
						return '';
					}
				}
			},
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
			{ "targets": '_all', "className": "text-center"}
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
		order : [[0,'asc']],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#equipTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			//progressOrder
			for(var i=0;i<data.length;i++) {
				let tr = $('#' + table_id + ' tbody').find('tr').eq(i);
				equipTable.row(tr).data().progressOrder = i+1;
				$(tr).find('td').eq(0).html(i+1);
			}

			// thead 추가
			let theadHtml = '';
			theadHtml += '<tr id="appendThead">';
			theadHtml += '<th colspan="5"></th>';
			theadHtml += '<th class="text-center" style="background: #203864 !important;color: white;" colspan="12">점검 내역</th>';
			theadHtml += '</tr>';
			$("#appendThead").remove();
			$('#'+table_id+'_wrapper').find(".dataTables_scrollHeadInner").find("thead").prepend(theadHtml)
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#equipTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#equipTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	equipTable.on('column-reorder', function( e, settings, details ) {
		let api = equipTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#equipTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//설비 순서 변경되었을 때 
	equipTable.on( 'row-reorder', function ( e, diff, changes ) {
		if(diff.length != 0){
			$('#btnEquipOrdSave').attr('disabled',false);
		}
	});

	$('#btnEquipOrdSave').on('click',function(){
		let updateList = [];
		$('#equipTable tbody tr').each(function(index){
			let data = equipTable.row(index).data();
			let obj = {};
			obj.idx = data.idx;
			obj.progressOrder = data.progressOrder;
			updateList.push(obj);
		});

		$.ajax({
			url: '<c:url value="/em/equipInfoOrdUpdate"/>',
            type: 'POST',
            //async: false,
            data: {
            	'updateList' : 	JSON.stringify(updateList)
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('설비순서가 변경되었습니다.');
					$('#btnEquipOrdSave').attr('disabled',true);
					equipTable.ajax.reload();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();				
			}
		});
	});

	//메인 테이블 선택시
	let equipIdx = 0;
	$('#equipTable tbody').on('click','tr', function() {
		let idx = equipTable.row(this).data().idx;
		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}
		if(WMCheck('attachDataNew')) { // 관련자료 등록중일 경우
			setWM('attachDataNew', 'idx', idx);
			return false;
		}
		formData = new FormData();

		$('#tab1Nav').trigger('click');

		listVal = 'normal';
		equipIdx = idx;
		attachDataTable.ajax.reload();
		equipCalibrationTable.ajax.reload();
		let data;
		$.ajax({
			url: '<c:url value="/em/equipInfoSel"/>',
            type: 'GET',
            //async: false,
            data: {
                'idx'	:	idx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					data = res.data;

					$('.inputGroup').attr('disabled', true); // 입력항목

					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
					$('#btnCancel').attr('disabled', true); // 취소 버튼

					$('#equipCd').val(data.equipCd);
					$('#equipNm').val(data.equipNm);
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();				
			}
		});
	});


	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		selectYear = parseInt($('#selectYear').val());
		$('#my-spinner').show();
		equipTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'dealNew'){
			$('#btnDealCorpSave').trigger('click');
			return false;
		} else if(WMlastIdx == 'attachDataNew'){
			$('#btnAttachDataSave').trigger('click');
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
				equipTable.row('#'+idx).select();
				$(equipTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
			}
			
			return false;
		} else if(WMlastIdx == 'attachDataNew') { // 관련자료 등록중
			if(getWM(WMlastIdx, 'idx') != '' && getWM(WMlastIdx, 'idx') != undefined) {
				let idx = getWM(WMlastIdx, 'idx');
				WM_action_OFF(WMlastIdx);
				setWM(WMlastIdx, 'idx', '');
				equipTable.row('#'+idx).select();
				$(equipTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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
			}
			
			return false;
		}
	});

	// 신규 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록
		
		WM_action_ON('new', 'workingWarningModal');

		$('#tab1Nav').trigger('click');
	
		$('.inputGroup').val('');
		$('.inputGroup').attr('disabled', false); // 입력항목
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼

	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');
		let data = equipTable.row('.selected').data();
		let exIdx = equipCalibrationTable.row('.selected').data()!=undefined?equipCalibrationTable.row('.selected').data().idx:'';

		if($('#equipCd').val() == '') {
			toastr.warning('설비코드를 입력해주세요.');
			$('#equipCd').focus();
			return false;
		}

		if($('#equipNm').val() == '') {
			toastr.warning('설비명을 입력해주세요.');
			$('#equipNm').select();
			return false;
		}

		if($('#buyPrice').val() == '') {
			$('#buyPrice').val('0');
		}

		if($('#equipClass').val() == ''){
			toastr.warning('설비구분을 선택해주세요!');
			$('#equipClass').focus();
			return false;
		}
		
		// 등록할 경우에
		if(saveType == 'insert') {	
			$.ajax({
				url: '<c:url value="/em/equipCalibrationInsert"/>',
	            type: 'POST',
	            //async: false,
	            data: {
		        	'equipIdx'				:	function(){return data.idx;},
		        	'calibrationDate'		:	function(){return $('#calibrationDate').val().replace(/-/g,'');},
		        	'nextCalibrationDate'	:	function(){return $('#nextCalibrationDate').val().replace(/-/g,'');},
		        	'calibrationContent'	:	function(){return $('#calibrationContent').val();},
		        	'exIdx'					:	function(){return exIdx;}
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						$('#btnSearch').trigger('click'); // 조회버튼 click

						WM_action_OFF('new');

						
						$('.inputGroup').attr('disabled', true); // 입력항목
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
						$('.attachGroup').attr('disabled', true); //파일 관련 버튼

						let idx = equipTable.row('.selected').data().idx;
						equipTable.row('#'+idx).select();
						$(equipTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리

						equipCalibrationTable.ajax.reload();
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else { // 수정할 경우에
			let idx = equipTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/em/equipCalibrationUpdate"/>',
	            type: 'POST',
	            //async: false,
	            data: {
		        	'equipIdx'				:	function(){return data.idx;},
		        	'calibrationDate'		:	function(){return $('#calibrationDate').val().replace(/-/g,'');},
		        	'nextCalibrationDate'	:	function(){return $('#nextCalibrationDate').val().replace(/-/g,'');},
		        	'calibrationContent'	:	function(){return $('#calibrationContent').val();},
		        	'exIdx'					: 	function(){return exIdx;}
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수정 저장되었습니다.');

						$('#btnSearch').trigger('click'); // 조회버튼 click

						WM_action_OFF('edit');

						
						$('.inputGroup').attr('disabled', true); // 입력항목
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnDel').attr('disabled', true); // 삭제 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
						$('.attachGroup').attr('disabled', true); //파일 관련 버튼

						let idx = equipTable.row('.selected').data().idx;
						equipTable.row('#'+idx).select();
						$(equipTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리

						equipCalibrationTable.ajax.reload();
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

	// 수정 버튼 click
	$('#btnEdit').on('click', function() {
		$('#btnSave').data('saveType','update'); // 저장 방식 -> 수정

		WM_action_ON('edit', 'workingWarningModal');
		
		$('.inputGroup').attr('disabled', false); // 입력항목
		$('#btnUserIdCheck').attr('disabled', false); // 중복확인 버튼
		$('#btnSignImage').attr('disabled', false); // 사진선택 버튼
		
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
		$('#btnAttachDataNew').attr('disabled', false);
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		delStatus = 'equip';
		$('#deleteModal').modal('show');
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		if(delStatus == 'equip'){
			let idx = equipCalibrationTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/em/equipCalibrationDelete"/>',
		        type: 'POST',
		        //async: false,
		        data: {
		            'idx'	:	idx
		        },
		        beforeSend: function() {
		        	$('#my-spinner').show();
		        },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						$.ajax({
							url: '<c:url value="/em/equipAttachDataDelete"/>',
					        type: 'POST',
					        //async: false,
					        data: {
					            'equipIdx'	:	idx
					        },
					        beforeSend: function() {
					        	$('#my-spinner').show();
					        },
							success : function(res) {
								if (res.result == "ok") { //응답결과
									toastr.success('삭제되었습니다.');
									$('#btnSearch').trigger('click'); // 조회버튼 click
									$('.inputGroup').attr('disabled', true); // 입력항목
									$('#btnNew').attr('disabled', false); // 신규 버튼
									$('#btnSave').attr('disabled', true); // 저장 버튼
									$('#btnEdit').attr('disabled', true); // 수정 버튼
									$('#btnDel').attr('disabled', true); // 삭제 버튼
									$('#btnCancel').attr('disabled', true); // 취소 버튼
									$('#btnAttachDataNew').attr('disabled',true);
									$('#btnAttachDataSave').attr('disabled',true);
									$('#btnAttachDataDel').attr('disabled',true);
									$('#btnAttachDataCancel').attr('disabled',true);
									//파일삭제
									$('#attachDataTable tbody tr').each(function(index, item) {
										let uuid = attachDataTable.row(index).data().uuid;
										let ext = attachDataTable.row(index).data().ext;
										fileDelete({uuid:uuid,ext:ext});
									});
									attachDataTable.ajax.reload();
								} else if(res.result == 'fail') {
									toastr.warning(res.message);
								} else {
									toastr.error(res.message);
								}
								$('#my-spinner').hide();
								
							}
						});
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(delStatus == 'attachData'){
			let idx = attachDataTable.row('.selected').data().idx;
			$.ajax({
				url: '<c:url value="/em/equipAttachDataDelete"/>',
		        type: 'POST',
		        //async: false,
		        data: {
		            'idx'	:	idx
		        },
		        beforeSend: function() {
		        	$('#my-spinner').show();
		        },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						let uuid = attachDataTable.row('.selected').data().uuid;
						let ext = attachDataTable.row('.selected').data().ext;
						fileDelete({uuid:uuid,ext:ext});
						attachDataTable.row('.selected').remove().draw();	
						
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
					$('#btnAttachDataSave').attr('disabled',true);
					$('#btnAttachDataDel').attr('disabled',true);
					$('#btnAttachDataCancel').attr('disabled',true);
				}
			});
		}      
		equipTable.ajax.reload();
		setTimeout(function(){equipCalibrationTable.ajax.reload();}, 250);
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

		$('.inputGroup').attr('disabled', true); // 입력항목
		$('.inputGroup').val('');
		
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnDel').attr('disabled', true); // 삭제 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		$('.attachGroup').attr('disabled', true); //파일 관련 버튼
	});

	/* 관련자료 */	
	$('#attachDataTable thead tr').clone(true).addClass('filters').appendTo('#attachDataTable thead'); // filter 생성
	let attachDataTable = $('#attachDataTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '60vh',
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
			url : '<c:url value="/em/equipAttachDataList"/>',
			type : 'GET',
			data : {
				'equipIdx' : function() { return equipIdx; },
				'attachType'	: function(){return 'PR';}
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'progressOrder', className : 'text-center'},
			{ data: 'fileContents', className : 'text-center',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" value="" name="fileContents">';
					} else {
						return '<input disabled type="text" class="form-control" value="'+data+'" name="fileContents">';
					}
				}
			},
			{ data : 'fileNm', className : 'text-center',
				render : function(data, type, row, meta) {
					if( row['fileStatus']=='F'){
						let html = '';
							html += '<div>';
							html += '	<input type="file" style="display:none;" id="fileNm" name="fileNm" value="" multiple>';
							html += '	<input type="hidden" class="uuid" id="fileUuid" value="'+ row['fileUuid'] +'"> ';
							html += '' + row['fileSplitNm'] + '';
							html += '</div>';
						return html;	
					} else{
						let html = '';
						if(data != null && data != "") {
							html += '<a href="/file/fileDownload?uuid='+row.uuid+'&fileName='+row.fileNm+'&ext='+row.ext+'">';
							html += '<span style="font-size: 14px;">'+data+'</span>';							
							html += '<input type="hidden" id="fileHidden'+ meta.row +'" value="'+data+'">';
						}
						return html;
					}
				}
			},
		],
		columnDefs : [
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'data+'</div>';
			//	}
			//}
		],
		buttons : [
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#attachDataTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 325)+'px');

			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			/* $('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			}); */

			//progressOrder
			for(var i=0;i<data.length;i++) {
				let tr = $('#attachDataTable tbody').find('tr').eq(i);
				attachDataTable.row(tr).data().progressOrder = i+1;
				$(tr).find('td').eq(0).html(i+1);
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#attachDataTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#attachDataTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	attachDataTable.on('column-reorder', function( e, settings, details ) {
		let api = attachDataTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#attachDataTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//테이블 클릭
	$('#attachDataTable tbody').on('click','tr', function() {
		$('#btnAttachDataDel').attr('disabled',false);
	});
	
	//관련자료탭클릭시
	$('#tab2Nav').on('click',function(){
		attachDataTable.ajax.reload(function(){
			attachDataTable.draw(false);
		});
	});

	//관련자료 추가 시
	$('#btnAttachDataNew').on('click',function(){
		$('#fileFake').trigger('click');
	});

	//파일 선택
	let formData = new FormData();
	$('#fileFake').on('change',function(e) {
		let fileInput = document.getElementById('fileFake'); 
		if(fileInput.files.length>0){
			let files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
	
			for(let i = 0; i < document.querySelector('#fileFake').files.length; i++){
				//폼데이터 넣는곳
				let uuid = uuid_v4();
				formData.append('file+'+uuid,files[i]);
				formData.append('uuid+'+uuid,uuid);
				formData.append('ext+'+uuid,files[i].name.split('.').at(-1));
				
				//페이크 업로드파일로부터 추가된 행에 데이터 옮겨주기
				let fileData =  document.querySelector('#fileFake').files[i];

				//파일명
				let fileArr = files[i].name.split('.');
				let fileNm = _.slice(fileArr, 0, -1).join('.');
				 
				attachDataTable.row.add({
					'progressOrder' : 0,
					'ext'     : files[i].name.split('.').at(-1),
		 			'fileNm'		:	fileData.name,
		 			'fileSplitNm'	:	fileNm,
		 			'fileStatus'    :  'F',
		 			'fileUuid' 		: uuid,
		 			'fileContents'		: null,
				}).draw(false);
			}
		}
		$('#fileFake').val('');
		WM_action_ON('attachDataNew', 'workingWarningModal');
		$('#btnAttachDataSave').attr('disabled',false);
	});
	
	//관련자료 삭제 시
	$('#btnAttachDataDel').on('click',function(){
		if( !$('#attachDataTable tbody tr').hasClass('selected') ){
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		let idx = attachDataTable.row('.selected').data().idx;
		if(idx != '' && idx != undefined){
			delStatus = 'attachData';
			$('#deleteModal').modal('show');
		} else {
			//폼데이터로부터 지우고 테이블 다시그리기
			let selectUuid = $('#attachDataTable tbody').find('.selected').find('.uuid').val();
			formData.delete('file+'+selectUuid);
			formData.delete('uuid+'+selectUuid);
			formData.delete('ext+'+selectUuid);
			$('#attachDataTable').DataTable().row('.selected').remove().draw();
		}
	});

	//관련자료 저장 시
	$('#btnAttachDataSave').on('click',function(){
		let fileString = [];
		let i=0;
		//삭제된 데이터들로부터 형식맞추는곳
		let formData2 = new FormData();
		let entries = formData.entries();
		for (let pair of entries) {
			if(i%3 == 0){
				formData2.append(pair[0].split('+')[0]+'-'+pair[0].split('+')[1],pair[1]);
			} else {
				formData2.append(pair[0].split('+')[0],pair[1]);
			}
			i++;
		}
		i=0;
		$('#attachDataTable tbody tr').each(function(index, item) {
			if( attachDataTable.row(this).data() != undefined && attachDataTable.row(this).data() != null){
				if( attachDataTable.row(this).data().idx == '' || attachDataTable.row(this).data().idx == undefined ){ 
					//파일스트링 만드는곳					
					let fileArr = formData2.getAll('file-'+formData2.getAll('uuid')[i])[0].name.split('.');
					let fileNm = _.slice(fileArr, 0, -1).join('.');
					
					let obj = {};
					obj.uuid = formData2.getAll('uuid')[i];
					obj.fileNm = fileNm;
					obj.ext = formData2.getAll('ext')[i];
					obj.fileContents = $(this).find('input[name=fileContents').val();
					fileString.push(obj);
					i++;
				}
			}
		});

		let idx = equipTable.row('.selected').data().idx;
		
		$.ajax({
			url: '<c:url value="/em/equipAttachDataInsert"/>',
            type: 'POST',
            //async: false,
            data: {    
	            'equipIdx'		:	function(){return idx;},
	            'attachType'	:	function(){return 'PR';},
            	'fileString'		:	JSON.stringify(fileString),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					//$('#btnSearch').trigger('click'); // 조회버튼 click

					WM_action_OFF('attachDataNew');

					$('#btnAttachDataNew').attr('disabled',false);
					$('#btnAttachDataSave').attr('disabled',true);
					$('#btnAttachDataDel').attr('disabled',true);
					$('#btnAttachDataCancel').attr('disabled',true);
					if(fileString != ''){
						fileUpload(formData2); // 파일 업로드
					}
					attachDataTable.ajax.reload(function(){});
					formData = new FormData();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		
	});


	/* 검교정상세 */	
	$('#equipCalibrationTable thead tr').clone(true).addClass('filters').appendTo('#equipCalibrationTable thead'); // filter 생성
	let equipCalibrationTable = $('#equipCalibrationTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '60vh',
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
			url : '<c:url value="/em/equipCalibrationDtlList"/>',
			type : 'POST',
			data : {
				'equipIdx' : function() { return equipIdx; },
				'selectYear' : function() { return $('#selectYear').val(); },
				'selectMon' : function() {return selectMon;},
				'listVal' : function() {return listVal;}
			},
		},
        rowId: 'idx',
		columns : [
			{data : 'idx'},
			{data : 'calibrationDate',
				render : function(data, row){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}	
				}
			},
			{data : 'calibrationContent'},
			{data : 'nextCalibrationDate',
				render : function(data, row){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}	
				}
			},
			{data : 'nextCalibrationCompleteYn',
				render : function(data, type,row,meta){
					if(data == 'Y'){
						return '<span style="color:blue;">완료됨</span>';
					} else if(data == 'N'){
						if(row['nextCalibrationDate']<nowDay){
							return '<span style="color:red;">기한초과</span>';
						} else {
							return '<span style="color:green;">예정</span>';
						}
					}
				}
			}
		],
		columnDefs : [
			{ "targets": '_all', "orderable": false },
			{ "targets": '_all', "className": "text-center"}
			//{
			//	targets: [0],
			//	render: function(data) {
			//		return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'data+'</div>';
			//	}
			//}
		],
		buttons : [
			/* { extend: 'excel',	text: 'Excel',	charset: 'UTF-8', bom: true ,
				exportOptions: {
	                modifier: {
	                   selected:null
	                },	                
	            },
	        },
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			let idxList = new Array();
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#equipCalibrationTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 325)+'px');

			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			/* $('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			}); */

			//progressOrder
			for(var i=0;i<data.length;i++) {
				let tr = $('#equipCalibrationTable tbody').find('tr').eq(i);
				$(tr).find('td').eq(0).html(i+1);
			}
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#equipCalibrationTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#equipCalibrationTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	equipCalibrationTable.on('column-reorder', function( e, settings, details ) {
		let api = equipCalibrationTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#equipCalibrationTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//검교정 목록 상세보기
	$('#equipCalibrationTable tbody').on('click', 'tr', function(){
		let data = equipCalibrationTable.row(this).data();

		if(WMCheck('new')) { // 신규등록중일 경우
			setWM('new', 'idx', idx);
			return false;
		}
		if(WMCheck('edit')) { // 수정중일 경우
			setWM('edit', 'idx', idx);
			return false;
		}
		if(WMCheck('attachDataNew')) { // 관련자료 등록중일 경우
			setWM('attachDataNew', 'idx', idx);
			return false;
		}

		$('#calibrationDate').val(moment(data.calibrationDate).format('YYYY-MM-DD'));
		$('#nextCalibrationDate').val(moment(data.nextCalibrationDate).format('YYYY-MM-DD'));
		$('#calibrationContent').val(data.calibrationContent);
	})

	//탭1 클릭
	$('#tab1Nav').on('click', function(){
		$('.attachGroup').attr('disabled', true);
		setTimeout(function(){
		equipCalibrationTable.draw();
		}, 150)
	})
	
	//탭2 클릭
	$('#tab2Nav').on('click', function(){
		$('#btnAttachDataNew').attr('disabled', false);
		setTimeout(function(){
		attachDataTable.draw();
		}, 150)
	})
	
		//점검내역 점 클릭
	$(document).on('click', '.month', function() {
		selectMon = $(this).attr("name");
		if(selectMon<10){
			selectMon = '0' + selectMon;
		}
		listVal = 'ordered';
		$('#equipCalibrationTable').DataTable().ajax.reload();
	})
</script>
</body>
</html>
