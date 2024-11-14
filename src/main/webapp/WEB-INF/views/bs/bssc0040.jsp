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
																		  grid-template-columns: 1.3fr 4px 1fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">출고일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">조회대상</label>
					<select class="form-select w-auto h-100 me-3" id="searchTarget" style="min-width: 70px;">
						<option value="">전체</option>
						<option value="N" selected>미출력</option>
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-warning ">명세서 수량기준</label>
					<select class="form-select w-auto h-100 me-3" id="qtyStandard" style="min-width: 70px;">
						<option value="bizOrdQty">수주수량</option>
						<option value="outQty" selected>출고수량</option>
					</select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled="disabled"><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled="disabled"><i class="fa-solid fa-xmark"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="outItemTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">수주상세번호</th>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle">출고처</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">출고번호</th>
							<th class="text-center align-middle">수주수량</th>
							<th class="text-center align-middle">출고수량</th>
							<th class="text-center align-middle" style="max-width:100px;min-width:100px;">명세서번호</th>
							<th class="text-center align-middle">납품일자</th>
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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">납품일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="deliveryDate">
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<%-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;"
								id="btnGmail" onclick="window.open('about:blank').location.href='https://mail.google.com/mail/u/0/?tab=rm#inbox?compose=new'">
							<img class="w-auto" src="<c:url value='/resources/assets/images/gmail_icon.jpg?ver=1'/>" style="height: 14px; margin-bottom: 3px;">
						</button> --%>
						<!-- <button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnDownload"><i class="fa-solid fa-download"></i></button> -->
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnPrint"><i class="fa-solid fa-print"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<div style="width: 100%;">
				  	<div class="nav nav-tabs" id="nav-tab">
						<button class="nav-link active" id="tab1Nav" data-bs-toggle="tab" data-bs-target="#tab1">거래명세서</button>
				  	</div>
					<div class="tab-content" id="nav-tabContent">
						<div class="tab-pane fade show active" id="tab1">
							<div class="row" style="padding: 5px;">
								<table id="purchasePaperTable" class="table table-bordered m-0 d-none" style="border:1px solid #ffffff;min-height:290mm;">
									<colgroup id="trAppendTarget">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
										<col width="3%"><col width="3%"><col width="3%"><col width="3%"><col width="3%">
									</colgroup>
									
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
			let rightcolMinWidth = 800; // rightcol 최소사이즈
	
			let rightColWidth = isDragging ? page.clientWidth - parseInt(Math.max(leftcolMinWidth + 20, event.clientX)) : rightcol.clientWidth;

			//console.log(Math.max(rightColWidth, rightcolMinWidth));
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
		$('#page').css('grid-template-columns', '1fr 4px 2fr');
		$('#rightcol').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		$('#page').css('grid-template-columns', '1fr');
		$('#rightcol').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
</script>

<script>
	WM_init('new');
	WM_init('edit');
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	//let paperLineCountList = getCommonCode('시스템', '019'); //발주서라인수
	//let paperLineCount = parseInt(paperLineCountList[0].commonNm);
	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	
	$('#deliveryDate').val(moment().format('YYYY-MM-DD'));
	$('td[name=deliveryDate]').text(moment().format('YYYY-MM-DD'));
	$('#deliveryDate').on('change',function(){
		$('td[name=deliveryDate]').text($(this).val());
	});

	const paperLineCount = 11;

	// 사용자정보 목록조회
	$('#outItemTable thead tr').clone(true).addClass('filters').appendTo('#outItemTable thead'); // filter 생성
	let outItemTable = $('#outItemTable').DataTable({
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
		select: {
            style: 'multi',
            toggleable: true,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/stock/outProdDtlList"/>',
			type : 'POST',
			data : {
				startDate : function() { return moment($('#startDate').val()).format('YYYYMMDD'); },
				endDate : function() { return moment($('#endDate').val()).format('YYYYMMDD'); },
				searchTarget : function() { return $('#searchTarget').val(); },
			},
		},
        rowId: 'outSlipIdx',
		columns : [
			{ data: 'bizOrdDtlNo', className : 'text-center align-middle', //수주상세번호
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'dealCorpNm', className : 'text-center align-middle', //수주처
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'outProdDealCorpNm', className : 'text-center align-middle', //출고처
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle', //제품명
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'outSlipIdx', className : 'text-center align-middle', //출고번호
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'bizOrdQty', className : 'text-end align-middle', //수주수량
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'outQty', className : 'text-end align-middle', //출고수량
				render : function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space:nowrap;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'groupData', className : 'text-center align-middle',name:'outProdEtc4', //명세서번호
				render : function(data, type, row, meta) {
					if(row['outProdEtc4'] != null && row['outProdEtc4'] != '') {
						return '<div style="white-space:nowrap;">' + row['outProdEtc4'] + '</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'groupData', className : 'text-center align-middle',name:'outProdEtc5', //명세서번호
				render : function(data, type, row, meta) {
					if(row['outProdEtc5'] != null && row['outProdEtc5'] != '') {
						return '<div style="white-space:nowrap;">'+ moment(row['outProdEtc5']).format('YYYY-MM-DD') + '</div>';
					} else {
						return '-';
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
		/* rowsGroup: [
			'outProdEtc4:name',
			'outProdEtc5:name'
	 	], */
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#outItemTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#outItemTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#outItemTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	outItemTable.on('column-reorder', function( e, settings, details ) {
		let api = outItemTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#outItemTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	outItemTable.on('select deselect', function(e, dt, type, index){
		if(getWM('edit','state')){
			outItemTable.row(index).deselect();
		} else {
			//여기서 입력값검사하고
			let dataArray = outItemTable.rows('.selected').data().toArray();
			let uniqByDealCorpList = _.uniqBy(dataArray, v=> v.outProdEtc1);
			//출고처 유니크리스트의 길이가 1이상일 경우 -> 출고처 중복
			//출고처 끼리 묶었는지 체크
			if( uniqByDealCorpList.length > 1 ){
				outItemTable.row(index).deselect();
				toastr.warning('출고처가 다른 항목은<br>선택할 수 없습니다.');
				return false;
			} else {
				//출력된것끼리 묶었는지 체크
				let printNoList = _.uniqBy(dataArray, v=> v.outProdEtc4);

				if( printNoList.length > 1 ){
					outItemTable.row(index).deselect();
					toastr.warning('명세서번호가 다른 항목은<br>선택할 수 없습니다.');
					return false;
				} else {
					//칸들 지우기
					$('#purchasePaperTable').find('tr').remove();
					$('#trAppendTarget').after(makeEmptyTr($('#deliveryDate').val()));

					//여기서 추가 명세서들 더해줌
					let finshList = dataArray;
					if(finshList.length > paperLineCount){
						let count = Math.floor(finshList.length/paperLineCount) ;
						let paperMinHeight = 290 * (count+1);
						$('#purchasePaperTable').css('min-height',paperMinHeight+'mm');
						for( var i = 0; i < count ; i ++){
							$('#trAppendTarget').after(makeEmptyTr($('#deliveryDate').val()));
						}
					} else {
						$('#purchasePaperTable').css('min-height','290mm');
					}
					//css반영
					cssChange();
					
					if(uniqByDealCorpList.length > 0){
						$('td[name=companyNumber]').text(uniqByDealCorpList[0].companyNumber);
						$('td[name=outProdDealCorpNm]').text(uniqByDealCorpList[0].outProdDealCorpInitial);
						$('td[name=rePresentative]').text(uniqByDealCorpList[0].rePresentative);
						$('td[name=addressAdm]').text(uniqByDealCorpList[0].addressAdm);
					} 
					
					for( var i = 0; i < finshList.length ; i++ ){
						let data = finshList[i];
						let topNode = $('#purchasePaperTable').find('.topEmptyTr').first();
						let bottomNode = $('#purchasePaperTable').find('.bottomEmptyTr').first();

						
						//수주번호
						$(topNode).find('td[name=bizOrdDtlNo]').text(data.bizOrdDtlNo);
						$(bottomNode).find('td[name=bizOrdDtlNo]').text(data.bizOrdDtlNo);
						//품명
						$(topNode).find('td[name=itemNm]').text(data.itemNm);
						$(bottomNode).find('td[name=itemNm]').text(data.itemNm);
						//수량
						let outQty;
						if($('#qtyStandard').val() == 'outQty'){
							outQty = data.outQty;
						} else {
							outQty = data.bizOrdQty;
						}
						if( isEmptyCheck(outQty) ){
							outQty = 0;
						} else {
							outQty = addCommas(parseFloat(outQty));
						}
						$(topNode).find('td[name=outQty]').text(outQty);
						$(bottomNode).find('td[name=outQty]').text(outQty);
						//버전
						$(topNode).find('td[name=itemVersion]').text(data.itemVersion);
						$(bottomNode).find('td[name=itemVersion]').text(data.itemVersion);
						//BATCH
						$(topNode).find('td[name=bizBatch]').text(data.purchaseBatch);
						$(bottomNode).find('td[name=bizBatch]').text(data.purchaseBatch);
						//비고
						$(topNode).find('td[name=bizDesc]').text(data.ordDtlDesc);
						$(bottomNode).find('td[name=bizDesc]').text(data.ordDtlDesc);
						
						$(topNode).switchClass('topEmptyTr','topTr');
						$(bottomNode).switchClass('bottomEmptyTr','bottomTr');
					}

					
					//여기서 같은 명세서번호끼리 묶어서 선택해줌
					//명세서출력번호가 있는 경우 AND 선택한경우
					if( !isEmptyCheck(dt.data().outProdEtc4 && e.type =='select' ) ){
						let tableData = outItemTable.data().toArray();
						let filterList = _.filter(tableData, v=> v.outProdEtc4 == dt.data().outProdEtc4 && v.outSlipIdx != dt.data().outSlipIdx);
						if( filterList.length > 0 ){
							let selectIdString = '#';
							for( var key in filterList ){
								selectIdString += filterList[key].outSlipIdx + ', #';
							}
							selectIdString = selectIdString.slice(0,-3);
							outItemTable.rows(selectIdString).select();
						}
						return false;
					} else if( !isEmptyCheck(dt.data().outProdEtc4 && e.type =='deselect' ) ){
						//명세서출력번호가 있는 경우 AND 선택해제 한 경우
						let tableData = outItemTable.data().toArray();
						let filterList = _.filter(tableData, v=> v.outProdEtc4 == dt.data().outProdEtc4 && v.outSlipIdx != dt.data().outSlipIdx);
						if( filterList.length > 0 ){
							let selectIdString = '#';
							for( var key in filterList ){
								selectIdString += filterList[key].outSlipIdx + ', #';
							}
							selectIdString = selectIdString.slice(0,-3);
							outItemTable.rows(selectIdString).deselect();
						}
						return false;
					}
					
				}
			}
		}
		
	});

	$('#qtyStandard').on('change',function(){
		//여기서 입력값검사하고
		let dataArray = outItemTable.rows('.selected').data().toArray();
		let uniqByDealCorpList = _.uniqBy(dataArray, v=> v.dealCorpIdx);
		//출고처 유니크리스트의 길이가 1이상일 경우 -> 출고처 중복
		//출고처 끼리 묶었는지 체크
		if( uniqByDealCorpList.length > 1 ){
			outItemTable.row(index).deselect();
			toastr.warning('출고처가 다른 항목은<br>선택할 수 없습니다.');
			return false;
		} else {
			//출력된것끼리 묶었는지 체크
			let printNoList = _.uniqBy(dataArray, v=> v.outProdEtc4);

			if( printNoList.length > 1 ){
				outItemTable.row(index).deselect();
				toastr.warning('명세서번호가 다른 항목은<br>선택할 수 없습니다.');
				return false;
			} else {
				//칸들 지우기
				$('#purchasePaperTable').find('tr').remove();
				$('#trAppendTarget').after(makeEmptyTr($('#deliveryDate').val()));

				//여기서 추가 명세서들 더해줌
				let finshList = dataArray;
				if(finshList.length > paperLineCount){
					let count = Math.floor(finshList.length/paperLineCount) ;
					let paperMinHeight = 290 * (count+1);
					$('#purchasePaperTable').css('min-height',paperMinHeight+'mm');
					for( var i = 0; i < count ; i ++){
						$('#trAppendTarget').after(makeEmptyTr($('#deliveryDate').val()));
					}
				} else {
					$('#purchasePaperTable').css('min-height','290mm');
				}
				//css반영
				cssChange();
				
				if(uniqByDealCorpList.length > 0){
					$('td[name=companyNumber]').text(uniqByDealCorpList[0].companyNumber);
					$('td[name=outProdDealCorpNm]').text(uniqByDealCorpList[0].outProdDealCorpInitial);
					$('td[name=rePresentative]').text(uniqByDealCorpList[0].rePresentative);
					$('td[name=addressAdm]').text(uniqByDealCorpList[0].addressAdm);
				} 
				
				for( var i = 0; i < finshList.length ; i++ ){
					let data = finshList[i];
					let topNode = $('#purchasePaperTable').find('.topEmptyTr').first();
					let bottomNode = $('#purchasePaperTable').find('.bottomEmptyTr').first();

					
					//수주번호
					$(topNode).find('td[name=bizOrdDtlNo]').text(data.bizOrdDtlNo);
					$(bottomNode).find('td[name=bizOrdDtlNo]').text(data.bizOrdDtlNo);
					//품명
					$(topNode).find('td[name=itemNm]').text(data.itemNm);
					$(bottomNode).find('td[name=itemNm]').text(data.itemNm);
					//수량
					let outQty;
					if($('#qtyStandard').val() == 'outQty'){
						outQty = data.outQty;
					} else {
						outQty = data.bizOrdQty;
					}
					if( isEmptyCheck(outQty) ){
						outQty = 0;
					} else {
						outQty = addCommas(parseFloat(outQty));
					}
					$(topNode).find('td[name=outQty]').text(outQty);
					$(bottomNode).find('td[name=outQty]').text(outQty);
					//버전
					$(topNode).find('td[name=itemVersion]').text(data.itemVersion);
					$(bottomNode).find('td[name=itemVersion]').text(data.itemVersion);
					//BATCH
					$(topNode).find('td[name=bizBatch]').text(data.purchaseBatch);
					$(bottomNode).find('td[name=bizBatch]').text(data.purchaseBatch);
					//비고
					$(topNode).find('td[name=bizDesc]').text(data.ordDtlDesc);
					$(bottomNode).find('td[name=bizDesc]').text(data.ordDtlDesc);
					
					$(topNode).switchClass('topEmptyTr','topTr');
					$(bottomNode).switchClass('bottomEmptyTr','bottomTr');
				}

				
				//여기서 같은 명세서번호끼리 묶어서 선택해줌
				//명세서출력번호가 있는 경우 AND 선택한경우
				if( !isEmptyCheck(dt.data().outProdEtc4 && e.type =='select' ) ){
					let tableData = outItemTable.data().toArray();
					let filterList = _.filter(tableData, v=> v.outProdEtc4 == dt.data().outProdEtc4 && v.outSlipIdx != dt.data().outSlipIdx);
					if( filterList.length > 0 ){
						let selectIdString = '#';
						for( var key in filterList ){
							selectIdString += filterList[key].outSlipIdx + ', #';
						}
						selectIdString = selectIdString.slice(0,-3);
						outItemTable.rows(selectIdString).select();
					}
					return false;
				} else if( !isEmptyCheck(dt.data().outProdEtc4 && e.type =='deselect' ) ){
					//명세서출력번호가 있는 경우 AND 선택해제 한 경우
					let tableData = outItemTable.data().toArray();
					let filterList = _.filter(tableData, v=> v.outProdEtc4 == dt.data().outProdEtc4 && v.outSlipIdx != dt.data().outSlipIdx);
					if( filterList.length > 0 ){
						let selectIdString = '#';
						for( var key in filterList ){
							selectIdString += filterList[key].outSlipIdx + ', #';
						}
						selectIdString = selectIdString.slice(0,-3);
						outItemTable.rows(selectIdString).deselect();
					}
					return false;
				}
				
			}
		}
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		WM_action_OFF('edit');
		outItemTable.rows('.selected').deselect();
		outItemTable.ajax.reload(function() {});
		$('#checkAll').prop("checked",false);
		$('#btnSave').attr('disabled',true);
		$('#btnEdit').attr('disabled',false);
		$('#btnCancel').attr('disabled',true);
		$('#btnPrint').attr('disabled',false);
		
		$('.dtlList').find('td').html('&nbsp;');
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	//수정버튼
	$('#btnEdit').on('click',function(){
		outItemTable.rows('.selected').deselect();
		WM_action_ON('edit', 'workingWarningModal');
		$('#btnPrint').attr('disabled',true);
		$('#btnSave').attr('disabled',false);
		$('#btnEdit').attr('disabled',true);
		$('#btnCancel').attr('disabled',false);
		$('#outItemTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if(index_td == outItemTable.column('outProdEtc4:name').index()) {
					let value = outItemTable.row(tr).data().outProdEtc4;
					if( !isEmptyCheck(value) ){
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';												
						html += '<input type="text" class="form-control inputGroup inputNm" name="outProdEtc4"  style="min-width:120px;max-width:120px;border-top-right-radius :0.375rem;border-bottom-right-radius :0.375rem;" value="'+outItemTable.row(tr).data().outProdEtc4+'" disabled="">';
						html +=	'<button type="button" class="btnInputDel" name="btnDealCorpDelete" style="background-color: transparent;border-color: transparent;position: absolute;top: 0;right:0;margin: 1px 5px;margin-left: 0px;border: none;">';
						html +=	'	<i class="fa-solid fa-xmark"></i>';
						html +=	'</button>';												
						html +=	'<input type="hidden" name="outProdEtc4Idx" class="outProdEtc4Idx">';
						html += '</div>';
						$(td).html(html);
					}
				}
			});
		});
	});

	$('#btnSave').on('click',function(){
		let array = [];
		let state = true;
		$('#outItemTable tbody').find('tr').each(function(index, item) {
			let td = $(item).find('td');
			let data = outItemTable.row($(item)).data();
			let outProdEtc4 = $(td).eq(outItemTable.column('outProdEtc4:name').index()).find('input[name=outProdEtc4]').val();

			if( isEmptyCheck(outProdEtc4) ) {
				outProdEtc4 = null;
			}
			
			let obj = new Object();
			obj.outSlipIdx = data.outSlipIdx;
			obj.outProdEtc4 = outProdEtc4;
		    array.push(obj);
		});

		let tableData = [];
		for(var i=0;i<outItemTable.data().count();i++) {
			let obj = {};
			obj.outSlipIdx = outItemTable.row(i).data().outSlipIdx;
			obj.outProdEtc4 = isEmptyCheck(outItemTable.row(i).data().outProdEtc4) ? null : outItemTable.row(i).data().outProdEtc4;
			tableData.push(obj);
		}

		array = _.differenceWith(array, tableData, _.isEqual);

		let updIdx = '';
		for( var key in array ){
			updIdx += array[key].outSlipIdx + ',';
		}
		updIdx = updIdx.slice(0,-1);
		//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!중요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		//병합된 행의 명세서번호를 지웠을 때 최상단의 번호만 지워진것으로 취급이 되서 프로시저단에서 해당 명세서번호를 가진 애들은 모두 지워줌
		$.ajax({
			url: '<c:url value="/stock/tradingStatementDel"/>',
            type: 'POST',
            data: {
            	'outSlipIdx'	:	function(){ return updIdx; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					$('#btnSearch').trigger('click');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});

		
	});


	$('#btnCancel').on('click',function(){
		$('#cancelModal').modal('show');
		$('#cancelModal').data('type','ADM');
	});

	// 취소 경고창 취소 버튼 click
	$('#btnCancelModalY').on('click', function() {
		let type = $('#cancelModal').data('type');
		if(type == 'ADM'){
			toastr.success('취소되었습니다.');
			$('#btnSearch').trigger('click');
		}
	});
	
	// 발주서 인쇄 버튼 click
	$('#btnPrint').on('click',function() {

		let dataArray = outItemTable.rows('.selected').data().toArray();

		if(dataArray.length > 0){
			$('#my-spinner').show();
			setTimeout(function(){
				_promise_().then((value)=>{
					let updIdx = '';
					let status = false;
					let printYn = 'N';
 					let dataArray = outItemTable.rows('.selected').data().toArray();
					
 					for( var key in dataArray ){
						updIdx += dataArray[key].outSlipIdx +',';
						//빈값이 아닐 경우 -> 이미 출력된 항목 재출력
						if( !isEmptyCheck(dataArray[key].outProdEtc4) ){
							printYn = 'Y';
						}
 	 				}
					if(updIdx != '' && updIdx != null && printYn == 'N'){
						updIdx = updIdx.slice(0,-1);
						$.ajax({
							url: '<c:url value="/stock/tradingStatementUpd"/>',
				            type: 'POST',
				            async: false,
				            data: {    
					            'outSlipIdx'	:	function(){ return updIdx; },
					            'outDate'		:	function(){ return $('#deliveryDate').val().replaceAll('-',''); },	
				            },
				            beforeSend: function() {
				            	$('#my-spinner').show();
				            },
							success : function(res) {
								if (res.result == "ok") { //응답결과
									status = true;
								} else if(res.result == 'fail') {
									toastr.warning(res.message);
									status = false;
								} else {
									toastr.error(res.message);
								}
								$('#my-spinner').hide();

							}
						});
					} else {
						status = true;
					}
					return status;
				}).then((value)=>{
					if(value){
						cssChange(); // css반영
				
						$('#purchasePaperTable').print({
							globalStyles: true,
							mediaPrint: true
						});
					}
					setTimeout(function() {
						outItemTable.rows('.selected').deselect();
						outItemTable.ajax.reload();
						$('#my-spinner').hide();
					}, 200);
				});
			},100);
		} else {
			toastr.warning('출력할 행을 선택해주세요.');
			return false;
		}
		
		
	});
	// 작업인쇄 모달이 띄워지면 인쇄
	$('#workOrderPaperModal').on('shown.bs.modal', function (e) {
		$('#purchasePaperTable').print({
			globalStyles: true,
			mediaPrint: true
		});
		$('#workOrderPaperModal').modal('hide');
		$('#my-spinner').hide();
	});

	// 발주서 다운로드 버튼 click
	$('#btnDownload').on('click', function() {
		cssChange(); // css반영
		html2canvas($('#purchasePaperTable')[0], {
			allowTaint : true,	// cross-origin allow
			useCORS: true,		// CORS 사용한 서버로부터 이미지 로드할 것인지 여부
			scale : 2			// 기본 96dpi에서 해상도를 두 배로 증가
		}).then(function(canvas) {
			var element = document.getElementById('purchasePaperTable');
			var opt = {
			  margin:       3,
			  filename:     moment().format('YYYYMMDD')+'_거래명세서.pdf',
			  image:        { type: 'jpeg', quality: 0.98 },
			  html2canvas:  { scale: 1 },
			  jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait'},
			};

			// New Promise-based usage:
			html2pdf().from(element).set(opt).save().then(() => {
				
			});
		});
	});


	// 초기 셋팅
	$(document).ready(function() {
		
		$('#my-spinner').hide();
		$('#trAppendTarget').after(makeEmptyTr($('#deliveryDate').val()));
		$('#purchasePaperTable').removeClass('d-none');

		$('input').attr('autocomplete','one-time-code');
		cssChange();
	});

	function cssChange() {
		$('#purchasePaperTable').find('td').css('font-weight', '900');
		$('#purchasePaperTable').find('td').css('border', '2px solid black');
		$('#purchasePaperTable').find('td').css('padding', '0.1rem');
		$('#purchasePaperTable').find('td').css('color', '#000000');

		$('#purchasePaperTable').find('.bg-gray').css('background-color', '#A5A5A5');
		
		$('#purchasePaperTable').find('.theadFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.theadFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.theadNotFisrtCol').css('border-left', '0px');
		
		$('#purchasePaperTable').find('.tbodyFirstCol').css('border-top', '0px');
		//$('#purchasePaperTable').find('.tbodyFirstCol').css('border-left', '2px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-top', '0px');
		$('#purchasePaperTable').find('.tbodyNotFirstCol').css('border-left', '0px');

		
		$('#purchasePaperTable').find('.fs-8').css('font-size', '8px');
		$('#purchasePaperTable').find('.fs-10').css('font-size', '10px');
		$('#purchasePaperTable').find('.fs-12').css('font-size', '12px');
		$('#purchasePaperTable').find('.fs-13').css('font-size', '13px');
		$('#purchasePaperTable').find('.fs-15').css('font-size', '15px');
		$('#purchasePaperTable').find('.fs-20').css('font-size', '20px');
		$('#purchasePaperTable').find('.fs-25').css('font-size', '25px');
		$('#purchasePaperTable').find('.fs-30').css('font-size', '30px');
		$('#purchasePaperTable').find('.fs-50').css('font-size', '50px');
		$('#purchasePaperTable').find('.fc-red').css('color', '#ff0000');
		$('#purchasePaperTable').find('.fc-blue').css('color', '#0070C0');
		$('#purchasePaperTable').find('.bt-2').css('border-top', '2px solid black');
		$('#purchasePaperTable').find('.bd-n').css('border', '0px solid #ffffff');
		$('#purchasePaperTable').find('.bt-n').css('border-top', '0px solid #ffffff');
		$('#purchasePaperTable').find('.br-n').css('border-right', '0px solid #ffffff');
		$('#purchasePaperTable').find('.bb-n').css('border-bottom', '0px solid #ffffff');
		$('#purchasePaperTable').find('.bl-n').css('border-left', '0px solid #ffffff');
		$('#purchasePaperTable').find('.bd_dashed').css('border-style','dashed');
		$('#purchasePaperTable').find('.h-5').css('height', '5px');
		$('#purchasePaperTable').find('.h-10').css('height', '10px');
		$('#purchasePaperTable').find('.h-15').css('height', '15px');
		$('#purchasePaperTable').find('.h-20').css('height', '20px');
		$('#purchasePaperTable').find('.h-21').css('height', '21px');
		$('#purchasePaperTable').find('.h-23').css('height', '23px');
		$('#purchasePaperTable').find('.h-25').css('height', '25px');
		$('#purchasePaperTable').find('.h-30').css('height', '30px');
		$('#purchasePaperTable').find('.h-35').css('height', '35px');
		$('#purchasePaperTable').find('.h-40').css('height', '40px');
		$('#purchasePaperTable').find('.h-55').css('height', '55px');
		$('#purchasePaperTable').find('.h-70').css('height', '70px');
		$('#purchasePaperTable').find('.h-100').css('height', '100px');
		$('#purchasePaperTable').find('.h-120').css('height', '120px');
		
		$('#purchasePaperTable').find('.bd-r').css('border-color', '#FF0000');
		$('#purchasePaperTable').find('.bg-r').css('background-color', '#FFCCFF');

		$('#purchasePaperTable').find('.bd-b').css('border-color', '#0070C0');
		$('#purchasePaperTable').find('.bg-b').css('background-color', '#92CDDC');
		
		// 인쇄할 때 css 적용하려면 important 붙여줘야함.
		for(var i=0;i<$('#purchasePaperTable').find('td').length;i++) {
			let tdStyle = $('#purchasePaperTable').find('td').eq(i).attr('style') == undefined?'':$('#purchasePaperTable').find('td').eq(i).attr('style');
			$('#purchasePaperTable').find('td').eq(i).attr('style',tdStyle.replaceAll(';',' !important;'));
		}
	}

	// make empty tr
	function makeEmptyTr(deliveryDate) {
		let html = '';
		html += '<tr style="height:40px!important;page-break-before: always!important;">';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '	<td colspan="9" class="fs-25 fc-red text-center bd-r bt-n bl-n br-n" nowrap>거&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;세&nbsp;&nbsp;&nbsp;서</td>';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '</tr>';
		html += '<tr style="height:30px!important;">';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '	<td colspan="9" class="fs-15 fc-red text-center bd-n" nowrap>(공급자 보관용)</td>';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '</tr>';
		html += '<tr style="height:20px!important;">';
		html += '	<td colspan="4" class="fs-15 fc-red bd-n" nowrap>납품년월일 : </td>';
		html += '	<td colspan="25" class="fs-15 text-start bd-n" name="deliveryDate" nowrap>'+deliveryDate+'</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="1" rowspan="4" class="fs-10 h-40 fc-red bd-r text-center align-middle not-left" nowrap>공<br>급<br>받<br>는<br>자</td>';
		html += '	<td colspan="3" class="fs-10 bd-r bg-r h-10 fc-red text-center align-middle not-left" nowrap>등록번호</td>';
		html += '	<td name="companyNumber" colspan="10" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '';
		html += '	<td colspan="1" rowspan="4" class="bd-r text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td style="max-height:120px;" colspan="1" rowspan="4" class="fs-10 h-10 fc-red bd-r text-center align-middle not-left" nowrap>공<br>급<br>자</td>';
		html += '	<td colspan="3" class="fs-10 h-10 bd-r bg-r fc-red text-center align-middle not-left" nowrap>등록번호</td>';
		html += '	<td colspan="10" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap>123-86-01024</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="3" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</td>';
		html += '	<td name="outProdDealCorpNm" colspan="5" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '	<td colspan="2" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>';
		html += '	<td name="rePresentative" colspan="3" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '';	                      
		html += '	<td colspan="3" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</td>';
		html += '	<td colspan="5" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap>(주)창영테크팩</td>';
		html += '	<td colspan="2" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>';
		html += '	<td colspan="3" class="fs-10 h-10 bd-r text-center align-middle not-left" nowrap>최재성</td>';
		html += '</tr>';        
		html += '<tr>';         
		html += '	<td colspan="3" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>';
		html += '	<td name="addressAdm" colspan="10" class="fs-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '';	            
		html += '	<td colspan="3" class="fs-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>';
		html += '	<td colspan="10" class="fs-10 bd-r text-center align-middle not-left" nowrap>경기도 수원시 권선구 산업로 156번길 88-39</td>';
		html += '</tr>';        
		html += '<tr>';        
		html += '	<td colspan="3" class="fs-10 h-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태</td>';
		html += '	<td colspan="4" class="fs-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '	<td colspan="2" class="fs-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>';
		html += '	<td colspan="4" class="fs-10 bd-r text-center align-middle not-left" nowrap></td>';
		html += '';	                       
		html += '	<td colspan="3" class="fs-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태</td>';
		html += '	<td colspan="4" class="fs-10 bd-r text-center align-middle not-left" nowrap>제조업</td>';
		html += '	<td colspan="2" class="fs-10 bg-r fc-red bd-r text-center align-middle not-left" nowrap>종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>';
		html += '	<td colspan="4" class="fs-10 bd-r text-center align-middle not-left" nowrap>인쇄</td>';
		html += '</tr>';                 
		html += '<tr style="height:20px!important;">';                  
		html += '	<td colspan="3" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>번 호</td>';
		html += '	<td colspan="11" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>품 명</td>';
		html += '	<td colspan="3" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>수 량</td>';
		html += '	<td colspan="2" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>Rev.</td>';
		html += '	<td colspan="3" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>구분/Batch</td>';
		html += '	<td colspan="7" class="fs-13 bg-r fc-red bd-r text-center align-middle not-left" nowrap>비 고</td>';
		html += '</tr>';
		for(var i = 0 ; i < paperLineCount ; i++){
			if( i % 2 == 0 ){
				html += '<tr class="topEmptyTr">';
				html += '	<td colspan="3" name="bizOrdDtlNo" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="11" name="itemNm" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="outQty" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="2" name="itemVersion" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="bizBatch" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="7" name="bizDesc" class="h-21 fs-10 bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '</tr>';
			} else {
				html += '<tr class="topEmptyTr">';
				html += '	<td colspan="3" name="bizOrdDtlNo" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="11" name="itemNm" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="outQty" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="2" name="itemVersion" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="bizBatch" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="7" name="bizDesc" class="h-21 fs-10 bg-r bd-r text-center align-middle not-left dtlList" nowrap></td>';
				html += '</tr>';
			}
		}

		html += '<tr>';
		html += '	<td colspan="17" class="h-20 fs-13 bd-n text-start align-middle not-left" nowrap>담당자 : 발주, 납기 : 백영선 부장, 정산 : 김아름 과장, 품질 : 라윤희 대리</td>';
		html += '	<td colspan="12" class="h-20 fs-13 bd-n text-start align-middle not-left" nowrap>&nbsp;TEL : 031-292-6553 &nbsp;&nbsp;&nbsp;&nbsp; FAX : 031-292-6507</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="29" class="bt-n bl-n br-n bd_dashed h-10" nowrap></td>';
		html += '</tr>';
		html += '';
		html += '<tr style="height:40px!important;">';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '	<td colspan="9" class="fs-25 fc-blue text-center bd-b bt-n bl-n br-n" nowrap>거&nbsp;&nbsp;&nbsp;래&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;세&nbsp;&nbsp;&nbsp;서</td>';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '</tr>';
		html += '<tr style="height:30px!important;">';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '	<td colspan="9" class="fs-15 fc-blue text-center bd-n" nowrap>(공급받는자 보관용)</td>';
		html += '	<td colspan="10" class="bd-n" nowrap></td>';
		html += '</tr>';
		html += '<tr style="height:20px!important;">';
		html += '	<td colspan="4" class="fs-15 fc-blue bd-n" nowrap>납품년월일 : </td>';
		html += '	<td colspan="25" class="fs-15 text-start bd-n" name="deliveryDate" nowrap>'+deliveryDate+'</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td style="max-height:100px;" colspan="1" rowspan="4" class="fs-10 h-40 fc-blue bd-b text-center align-middle not-left" nowrap>공<br>급<br>받<br>는<br>자</td>';
		html += '	<td colspan="3" class="fs-10 h-10 bd-b bg-b fc-blue text-center align-middle not-left" nowrap>등록번호</td>';
		html += '	<td name="companyNumber" colspan="10" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td colspan="1" rowspan="4" class="bd-b text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td style="max-height:100px;" colspan="1" rowspan="4" class="fs-10 fc-blue bd-b text-center align-middle not-left" nowrap>공<br>급<br>자</td>';
		html += '	<td colspan="3" class="fs-10 bd-b bg-b fc-blue text-center align-middle not-left" nowrap>등록번호</td>';
		html += '	<td colspan="10" class="fs-10 bd-b text-center align-middle not-left" nowrap>123-86-01024</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="3" class="fs-10 h-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</td>';
		html += '	<td name="outProdDealCorpNm" colspan="5" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '	<td colspan="2" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>';
		html += '	<td name="rePresentative" colspan="3" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td colspan="3" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>상&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;호</td>';
		html += '	<td colspan="5" class="fs-10 bd-b text-center align-middle not-left" nowrap>(주)창영테크팩</td>';
		html += '	<td colspan="2" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명</td>';
		html += '	<td colspan="3" class="fs-10 bd-b text-center align-middle not-left" nowrap>최재성</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="3" class="fs-10 h-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>';
		html += '	<td name="addressAdm" colspan="10" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td colspan="3" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</td>';
		html += '	<td colspan="10" class="fs-10 bd-b text-center align-middle not-left" nowrap>경기도 수원시 권선구 산업로 156번길 88-39</td>';
		html += '</tr>';
		html += '<tr>';
		html += '	<td colspan="3" class="fs-10 h-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태</td>';
		html += '	<td colspan="4" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '	<td colspan="2" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>';
		html += '	<td colspan="4" class="fs-10 bd-b text-center align-middle not-left" nowrap></td>';
		html += '';	
		html += '	<td colspan="3" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>업&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;태</td>';
		html += '	<td colspan="4" class="fs-10 bd-b text-center align-middle not-left" nowrap>제조업</td>';
		html += '	<td colspan="2" class="fs-10 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>';
		html += '	<td colspan="4" class="fs-10 bd-b text-center align-middle not-left" nowrap>인쇄</td>';
		html += '</tr>';
		html += '<tr style="height:20px!important;">';
		html += '	<td colspan="3" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>번 호</td>';
		html += '	<td colspan="11" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>품 명</td>';
		html += '	<td colspan="3" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>수 량</td>';
		html += '	<td colspan="2" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>Rev.</td>';
		html += '	<td colspan="3" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>구분/Batch</td>';
		html += '	<td colspan="7" class="fs-13 bg-b fc-blue bd-b text-center align-middle not-left" nowrap>비 고</td>';
		html += '</tr>';

		for(var i = 0 ; i < paperLineCount ; i++){
			if( i % 2 == 0 ){
				html += '<tr class="bottomEmptyTr">';
				html += '	<td colspan="3" name="bizOrdDtlNo" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="11" name="itemNm" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="outQty" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="2" name="itemVersion" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="bizBatch" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="7" name="bizDesc" class="h-21 fs-10 bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '</tr>';
			} else {
				html += '<tr class="bottomEmptyTr">';
				html += '	<td colspan="3" name="bizOrdDtlNo" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="11" name="itemNm" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="outQty" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="2" name="itemVersion" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="3" name="bizBatch" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '	<td colspan="7" name="bizDesc" class="h-21 fs-10 bg-b bd-b text-center align-middle not-left dtlList" nowrap></td>';
				html += '</tr>';
			}
		}
		
		
		html += '<tr>';
		html += '	<td colspan="17" class="h-20 fs-13 bd-n text-start align-middle not-left" nowrap>담당자 : 발주, 납기 : 백영선 부장, 정산 : 김아름 과장, 품질 : 라윤희 대리</td>';
		html += '	<td colspan="12" class="h-20 fs-13 bd-n text-start align-middle not-left" nowrap>&nbsp;TEL : 031-292-6553 &nbsp;&nbsp;&nbsp;&nbsp; FAX : 031-292-6507</td>';
		html += '</tr>';
		

		return html;
	}
	
	
</script>
</body>
</html>



