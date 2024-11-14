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
																		  grid-template-columns: 5fr 4px 5fr;">
	<!-- #main============================================================== -->
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="d-flex align-items-center justify-content-end" style="padding-bottom: 5px;">
				<div class="btn-group" role="group" aria-label="Small button group">
				<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
				<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
			</div>
		</div>
			<div class="table-responsive" style="overflow-x:hidden;">
				<table id="itemInfoAdmTable" class="table table-bordered">
					<colgroup>
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th class="text-center">품목구분</th>
							<th class="text-center">품목구분1</th>
							<th class="text-center">품목구분2</th>
							<th class="text-center">MAKER</th>
							<th class="text-center">품번</th>
							<th class="text-center">품명</th>
							<th class="text-center">규격</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div><!-- /.left-list -->
	<div id="dragbar" onmousedown="StartDrag()"></div>
	<div id="rightcol" style="padding: 5px;">
		<div class="row">
			<div class="d-flex align-items-center d-flex" style="padding-bottom: 5px;">
<!-- 				<div class="btn-group" role="group" aria-label="Small button group"> -->
<!-- 					<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md"> -->
<!-- 						<input type="file" class="d-none" id="excelUploadFile" name="excelfile" accept=".xls, .xlsx"> -->
<!-- 						<button type="button" class="btn btn-outline-light w-auto" id="btnExcelUpload">엑셀업로드</button> -->
<!-- 					</form> -->
<!-- 				</div> -->
			</div>
			<div class="me-lg-auto"></div>
			<div class="d-flex align-items-center justify-content-end" style="padding-bottom: 5px;">
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnCostSearch"><i class="fa-regular fa-clipboard"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
				</div>
			</div>
		</div>
		<!--/오른쪽 등록 부분 상단 버튼 영역-->
		<!-- .card-header -->
		<div class="card-body p-0">
			<div class="table-responsive">
				<table id="itemCostTable" class="table table-bordered">
					<colgroup>
						<col width="50px">
						<col width="150px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th class="text-center">NO</th>
							<th class="text-center">발주번호</th>
							<th class="text-center">단가적용일</th>
							<th class="text-center">입고처</th>
							<th class="text-center">단가</th>
							<th class="text-center">화폐단위</th>
							<th class="text-center">비고</th>
						</tr>
					</thead>
				</table>
			</div>                	                    
		</div>
	</div><!-- /.row -->
</div><!-- / #main  -->
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
			let leftcolMinWidth = 500; // leftcol 최소사이즈
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
			$('#page').css('grid-template-columns', '6fr 4px 4fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
			$('#page').css('grid-template-columns', '1fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>
<script>
	WM_init('new');
	WM_init('edit');

	//검색용
	let searchItemCd = '';
	let searchItemNm = '';
	let searchAcctFg = '';
	let searchitemModel = '';

	let itemCdVal = '';
	let itemModelVal = '';
	
    let sideView = '';
    let editCode = 'info';
    let idxVal = '';

	uiProcInfo(true);
	uiProcPrcss(true);
	uiProcMold(true);
	
	$('#saveBtnModalY').on('click',function() {
		sideView = '';
		editCode = 'info';
		uiProcInfo(true);
		uiProcPrcss(true);
		uiProcMold(true);
		uiProcTabButton(false);
		$('#itemInfoNav').tab('show');
		uiProcTabButton(true);
		$('#form').each(function() {
			this.reset();
		});
		$('#itemImage').attr('src',"");
    	$('#btnSave').attr('disabled', true);
    	$('#itemInfoAdmTable').DataTable().ajax.reload( function () {});
    	
    });

	$('#itemInfoNav').on('click',function() {
		editCode = 'info';
		$('#btnEdit').removeClass('d-none');
    });

	//공통 수정, 저장 처리==================================================================================
	
	//등록 버튼
	$('#btnNew').on('click', function(){
		sideView == 'add';

		let col_filter_text = [];
		$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
			col_filter_text.push($(item).find('input').val());
		});
		itemCostTable.row.add({
			'idx'			:	'',
			'itemCd'		:	itemCdVal,
			'costDate'		:	null,
			'dealCorpCd'	:	null,
			'cost'			:	null,
			'costUnit'		:	null,
 			'costDesc'		:	null,
		}).draw(false);

		itemCostTable.colReorder.disable();

		$('#btnSave').attr('disabled', false);
    });

	// 수정 버튼
    $('#btnEdit').on('click', function() {
		if(sideView!='edit') {
			toastr.warning('데이터를 선택해 주세요.');
			return false;
		}
		if($('#btnSave').attr('class') == 'btn btn-primary float-right ml-1') {
    		$('#saveBtnModal').modal('show');
    		return false;
    	}
		if(editCode=='info') {
			uiProcInfo(false);
		}

		$('#itemCostTable tbody').find('tr').each(function(index_tr, tr) {
			$(tr).find('td').each(function(index_td, td) {
				if($(td).find('input').length == 0 && $(tr).find('td').length != 1) {
					if(index_td == itemCostTable.column('costDate:name').index()) {
						let value = itemCostTable.row(tr).data().costDate;
						$(td).html('<input type="date" max="9999-12-31" name="costDate" class="form-control" value="'+moment(value).format('YYYY-MM-DD')+'">');
					} else if(index_td == itemCostTable.column('dealCorpNm:name').index()) {
						let value = itemCostTable.row(tr).data().dealCorpCd;
						let value2 = itemCostTable.row(tr).data().dealCorpNm;
						let html = '';
						html += '<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">';
						html += '<input type="hidden" class="form-control" name="dealCorpCd" value="'+value+'">';
						html += '<input type="text" class="form-control" id="dealCorpNm" name="dealCorpNm" value="'+value2+'" disabled>';
						html += '<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selDealCorpCd" style="padding: 1px 4px; margin-left: 0px;">';
						html += '	<i class="fa-solid fa-magnifying-glass"></i>';
						html += '</button>';
						$(td).html(html);
					} else if(index_td == itemCostTable.column('cost:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:100px;" onkeyup="numberFormat(this, \'int\')" class="form-control text-end" name="cost" value="'+value+'">');
					} else if(index_td == itemCostTable.column('costUnit:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:150px;" class="form-control" name="costUnit" value="'+value+'">');
					} else if(index_td == itemCostTable.column('costDesc:name').index()) {
						let value = $(td).text();
						$(td).html('<input type="text" style="min-width:150px;" class="form-control" name="costDesc" value="'+value+'">');
					}
				}
			});
		});
		
		$('.inputGroup').attr('disabled', false);
		uiProcTabButton(true);
		$('#btnSave').attr('disabled', false);
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
    	let array = [];
		let state = true;
		$('#itemCostTable tbody').find('tr').each(function(index, item) {
			let node = $(item);
			let tr = $(node).parent().parent();
			let td = $(item).find('td');
			if($(item).find('td').find('input').length != 0) {
				let idx = itemCostTable.row($(item)).data().idx;
				let costDate = $(td).eq(itemCostTable.column('costDate:name').index()).find('input').val();
				let dealCorpCd = $(td).find('input[name=dealCorpCd]').val();
				let cost = $(td).eq(itemCostTable.column('cost:name').index()).find('input').val();
				let costUnit = $(td).eq(itemCostTable.column('costUnit:name').index()).find('input').val();
				let costDesc = $(td).eq(itemCostTable.column('costDesc:name').index()).find('input').val();
				
				if(costDate == '') {
					toastr.warning('단가적용일을 선택해주세요.');
					$(td).eq(itemCostTable.column('costDate:name').index()).find('button').focus();
					state = false;
					return false;
				}
				if(cost == '') {
					toastr.warning('단가를 입력해주세요.');
					$(td).eq(itemCostTable.column('cost:name').index()).find('input').focus();
					state = false;
					return false;
				}
				if(costUnit == '') {
					toastr.warning('화폐단위를 입력해주세요.');
					$(td).eq(itemCostTable.column('costUnit:name').index()).find('input').focus();
					state = false;
					return false;
				}

				let obj = new Object();
				obj.itemCd = itemCdVal;
				obj.idx = idx;
				obj.costDate = costDate.replace(/-/g,"");
				obj.dealCorpCd = dealCorpCd;
				obj.cost = cost.replaceAll(/,/g,'');
				obj.costUnit = costUnit;
				obj.costDesc = costDesc;
				
			    array.push(obj);
		    }
		});

		if(!state) {
			return false;
		}
		console.log(array)
		$.ajax({
			url: '<c:url value="/bm/itemCostIU"/>',
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
					itemCostTable.ajax.reload(function() {
						$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
							$(item).find('input').attr('disabled', false);// 검색 필터 enable
						});
					});
					itemCostTable.colReorder.enable();
					$('#btnNew').attr('disabled', false); // 신규 버튼
					$('#btnSave').attr('disabled', true); // 저장 버튼
					$('#btnEdit').attr('disabled', false); // 수정 버튼
					$('#btnDel').attr('disabled', false); // 삭제 버튼
// 					$('#btnCancel').attr('disabled', true); // 취소 버튼
// 					$('#excelUploadFile').val('');

				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
    });


	//기본정보==================================================================================
	
    // 목록
    $('#itemInfoAdmTable thead tr').clone(true).addClass('filters').appendTo('#itemInfoAdmTable thead'); // filter 생성
    let itemInfoAdmTable = $('#itemInfoAdmTable').DataTable({
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
        ajax: {
            url: '<c:url value="/bm/itemInfoAdmLst"/>',
            type: 'GET',
            data: {
                
            },
        },
        rowId: 'itemCd',
        columns: [
        	{ data: 'itemGubunNm', 'className' : 'text-center' },
        	{ data: 'itemGubun1Nm', 'className' : 'text-center' },
        	{ data: 'itemGubun2Nm', 'className' : 'text-center' },
        	{ data: 'maker', 'className' : 'text-center' },
            { data: 'itemCd', 'className' : 'text-center' },            
            { data: 'itemNm', 'className' : 'text-center' },
            { data: 'itemDc', 'className' : 'text-center' },
        ],
        columnDefs: [
        	{ targets: "all", className : 'text-center' },
        ],
        order: [
            [ 0, 'asc' ]
        ],
        buttons: [
        	'copy',
            {
                extend: 'excel',
                title: '품목관리'
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
        drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemInfoAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemInfoAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemInfoAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	itemInfoAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemInfoAdmTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//조회버튼 클릭
	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		itemInfoAdmTable.ajax.reload(function() {
			$('#itemInfoAdmTable tbody tr').removeClass('selected');
		});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

    // 보기
    $('#itemInfoAdmTable tbody').on('click', 'tr', function () {
    	if($('#btnSave').attr('class') == 'btn btn-primary float-right ml-1') {
    		$('#saveBtnModal').modal('show');
    		return false;
    	}

        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }
        else {
        	$('#itemInfoAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
        $('#btnEdit').removeClass('disabled');
    	itemCdVal = itemInfoAdmTable.row( this ).data().itemCd;

    	itemCostTable.ajax.reload();
    	$('#btnNew').attr('disabled', false);  // 등록버튼
    	$('#btnEdit').attr('disabled', true);  // 수정버튼
    	$('#btnSave').attr('disabled', true);  // 저장버튼
        $('#btnDel').attr('disabled', true);  // 삭제버튼
    });

    //입고단가 테이블
    $('#itemCostTable thead tr').clone(true).addClass('filters').appendTo('#itemCostTable thead'); // filter 생성
    let itemCostTable = $('#itemCostTable').DataTable({
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
        ajax: {
            url: '<c:url value="/bm/itemCostLst"/>',
            type: 'GET',
            data: {
                'itemCd'	:	function(){ return itemCdVal; },
            },
        },
        rowId: 'idx',
        columns: [
        	{ 'className' : 'text-center',
				render : function(data, type, row, meta) {
					return meta.row + 1;
				}
            },
            { data: 'orderDtlNo', 'className' : 'text-center', name: 'orderDtlNo', //발주번호
            	render : function(data, type, row, meta) {
            		if(data!=null){
   	        			return '<div style="white-space:nowrap;">'+data+'</div>';
   					} else return '';
            	}
            },
        	{ data: 'costDate', 'className' : 'text-center', name: 'costDate', //단가적용일
        		render : function(data, type, row, meta) {
        			if(data!=null){
   	        			return '<div style=" white-space:nowrap;">'+moment(data).format('YYYY-MM-DD')+'</div>';
   					} else return '';
				}
			},
        	{ data: 'dealCorpNm', 'className' : 'text-center', name: 'dealCorpNm', //입고처
				render : function(data, type, row, meta) {
					if(data!=null){
   	        			return '<div style=" white-space:nowrap;">'+data+'</div>';
   					} else return '';
				}
	        },
        	{ data: 'cost', 'className' : 'text-center', name: 'cost', //단가
	        	render : function(data, type, row, meta) {
	        		if(data!=null){
   	        			return '<div style=" white-space:nowrap;">'+addCommas(parseFloat(data))+'</div>';
   					} else return '';
	        	}
    		},
            { data: 'costUnit', 'className' : 'text-center', name: 'costUnit', //화폐단위 
    			render : function(data, type, row, meta) {
    				if(data!=null){
   	        			return '<div style=" white-space:nowrap;">'+data+'</div>';
   					} else return '';
    			}
            },            
            { data: 'costDesc', 'className' : 'text-center', name: 'costDesc', //비고
           		render : function(data, type, row, meta) {
   	            	if(data!=null){
   	        			return '<div style=" white-space:nowrap;">'+data+'</div>';
   					} else return '';
               	}
            },
        ],
        columnDefs: [
        	{ targets: "all", className : 'text-center' },
        ],
        order: [
            [ 0, 'asc' ]
        ],
        buttons: [
        	'copy',
            {
                extend: 'excel',
                title: '입고단가등록',
                exportOptions: {
					format: {
						body: function (data, row, column, node) {
							if ($(node).children().is('div')) {
								if($(node).children().length >1){
									return $($(node).children()[1]).text();
								} else return $(node).children().text();
							}
						return data;
						}
					}
				}
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
        drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#itemCostTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemCostTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemCostTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
    });
	// dataTable colReorder event
	itemCostTable.on('column-reorder', function( e, settings, details ) {
		let api = userTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#itemCostTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	//조회버튼 클릭
	$('#btnCostSearch').on('click', function() {
		$('#my-spinner').show();
		itemCostTable.ajax.reload(function() {
			$('#itemCostTable tbody tr').removeClass('selected');
		});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

    // 보기
    $('#itemCostTable tbody').on('click', 'tr', function () {

    	sideView = 'edit';

    	idxVal = itemCostTable.row( this ).data().idx;

    	$('#btnNew').attr('disabled', false);  // 등록버튼
    	$('#btnEdit').attr('disabled', false);  // 수정버튼
        $('#btnDel').attr('disabled', false);  // 삭제버튼
    });

	// 수주별발주 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('#itemCostTable tbody').find('tr.selected').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		let data = itemCostTable.row('.selected').data();

		if(data.idx != '') {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('deleteType','ADM');
		} else {
			itemCostTable.row('.selected').remove().draw(false);
		}
	});

	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let deleteType = $('#deleteModal').data('deleteType');
		if(deleteType == 'ADM') {
			let idx = itemCostTable.row('.selected').data().idx;
			if(idx=='') {
				itemCostTable.row('.selected').remove().draw(false);
				toastr.success('삭제되었습니다.');
			} else {
				$.ajax({
					url: '<c:url value="/bm/itemCostDel"/>',
		            type: 'POST',
		            data: {
		                'idx'	:	idxVal
		            },
		            beforeSend: function() {
		            	$('#my-spinner').show();
		            },
					success : function(res) {
						if (res.result == "ok") { //응답결과
							toastr.success('삭제되었습니다.');

							itemCostTable.row('.selected').remove().draw(false);
// 							$('#excelUploadFile').val('');
						} else if(res.result == 'fail') {
							toastr.warning(res.message);
						} else {
							toastr.error(res.message);
						}
						$('#my-spinner').hide();
					}
				});
			}
		}
	});

// 	$('#btnExcelUpload').on('click', function(){
// 		$('#excelUploadFile').trigger('click');
// 	});

// 	$('#excelUploadFile').on('change', function(){

// 		let col_filter_text = [];
// 		$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
// 			$(item).find('input').attr('disabled', true); // 검색 필터 disabled
// 			col_filter_text.push($(item).find('input').val());
// 		});

// 		let excelArray = [];
		
// 		var fileInput = document.getElementById('excelUploadFile');
//         var file = fileInput.files[0];
        
//         var reader = new FileReader();
//         reader.onload = function(e) {
//             var data = new Uint8Array(e.target.result);
//             var workbook = XLSX.read(data, { type: 'array' });
//             var sheetName = workbook.SheetNames[0];
//             var worksheet = workbook.Sheets[sheetName];
//             var jsonData = XLSX.utils.sheet_to_json(worksheet, { 
//                 header: 1,
//                 raw: false, // 숫자 형식을 원시 값(raw)으로 처리
//                 dateNF: 'YYYY-MM-DD' // 원하는 날짜 형식으로 지정 
//             });
            
//             var table = $('#itemCostTable tbody');
            
//             jsonData.slice(2).forEach(function(row) {

//             	let obj = new Object();
// 				obj.idx = '';
// 				obj.itemCd = row[0];
// 				obj.costDate = moment(row[1]).format('YYYY-MM-DD'),
// 				obj.dealCorpCd = row[2];
// 				obj.cost = row[4].replaceAll(/,/g,'');
// 				obj.costUnit = row[5];
// 				obj.costDesc = row[6];

// 				excelArray.push(obj);
//             });

//             $.ajax({
//     			url: '<c:url value="/bm/itemCostIU"/>',
//                 type: 'POST',
//                 data: {
//                     'jsonArray'	:	JSON.stringify(excelArray)
//                 },
//                 beforeSend: function() {
//                 	$('#my-spinner').show();
//                 },
//     			success : function(res) {
//     				if (res.result == "ok") { //응답결과
//     					toastr.success('저장되었습니다.');
//     					itemCostTable.ajax.reload(function() {
//     						$('#itemCostTable_wrapper').find('.filters th').each(function(index, item) {
//     							$(item).find('input').attr('disabled', false);// 검색 필터 enable
//     						});
//     					});
//     					itemCostTable.colReorder.enable();
//     					$('#btnNew').attr('disabled', false); // 신규 버튼
//     					$('#btnSave').attr('disabled', true); // 저장 버튼
//     					$('#btnEdit').attr('disabled', false); // 수정 버튼
//     					$('#btnDel').attr('disabled', false); // 삭제 버튼
// //     					$('#btnCancel').attr('disabled', true); // 취소 버튼
//     					$('#excelUploadFile').val('');

//     				} else if(res.result == 'fail') {
//     					toastr.warning(res.message);
//     				} else {
//     					toastr.error(res.message);
//     				}
//     				$('#my-spinner').hide();
//     			}
//     		});
    		
//         };
//         reader.readAsArrayBuffer(file);
// 	});

	//팝업 테이블==================================================================================

  	//거래처정보조회 팝업 시작
 	$(document).on('click', '#selDealCorpCd', function(){
		$('#dealCorpModal').modal('show');
		setTimeout(function() {
			dealCorpModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#dealCorpModalTable').DataTable().$('tr.selected').removeClass('selected');
			}, 500);
		}, 200);
	});

	// 거래처정보 목록조회
	$('#dealCorpModalTable thead tr').clone(true).addClass('filters').appendTo('#dealCorpModalTable thead'); // filter 생성
	let dealCorpModalTable = $('#dealCorpModalTable').DataTable({
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
			url : '<c:url value="/bm/dealCorpAdmList"/>',
			type : 'POST',
			data : {
				dealGubun : function(){ return $('#modalDealGubun').val();},
				dealCorpStatus: function() { return $('#modalDealCorpStatus').val(); }
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealGubunNm', className : 'text-center'},
			{ data: 'dealCorpCd', className : 'text-center'},
			{ data: 'initial', className : 'text-center'},
			{ data: 'dealCorpNm', className : 'text-center'},
			{ data: 'representative', className : 'text-center'},
			{ data: 'companyNumber', className : 'text-center'},
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#dealCorpModalTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#dealCorpModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	dealCorpModalTable.on('column-reorder', function( e, settings, details ) {
		let api = dealCorpModalTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#dealCorpModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 거래처모달 조회 버튼 click
	$('#btnDealCorpModalSearch').on('click', function() {
		dealCorpModalTable.ajax.reload(function(){});
	});
	
	// 거래처목록 적용 버튼 click
	$('#btnDealCorpModalPaste').on('click', function(){

		if( !$('#dealCorpModalTable tbody tr').hasClass('selected') ){
			toastr.warning('적용할 행을 선택해주세요.');
			return false;
		}
		
		let data = dealCorpModalTable.row('.selected').data();
		$('#dealCorpCd').val(data.idx);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row(this).data();
		$('#itemCostTable').DataTable().$('tr.selected').find('input[name=dealCorpCd]').val(data.dealCorpCd);
		$('#itemCostTable').DataTable().$('tr.selected').find('input[name=dealCorpNm]').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

   	//함수==================================================================================
   	
	//제품 자재에 따라 보이는 탭을 다르게 표시
	function uiProcTabButton(flag) {
		if(flag) {
			$('#itemInfoNav').addClass('disabled');
			$('#itemPrcssNav').addClass('disabled');
		} else {
			$('#itemInfoNav').removeClass('disabled');
			$('#itemPrcssNav').removeClass('disabled');
		}
	}
	
   	//기본정보 disabled 처리
	function uiProcInfo(flag) {
		$('#btnCommonCdModal').attr('disabled', flag);
		$('#itemCd').attr('disabled', flag);
		$('#maker').attr('disabled', flag);
		$('#btnEquipCd').attr('disabled', flag);
	}

   	//공정BOM disabled 처리
	function uiProcPrcss(flag) {
		$('input[name=prcssDesc]').attr('disabled', flag);
		$('button[name=btnSelOutsourcingCorp]').attr('disabled', flag);
		$('button[name=btnSelPrcss]').attr('disabled', flag);
		$('button[name=btnSelEquip]').attr('disabled', flag);
		$('#btnPrcssBom').attr('disabled', flag);
		$('#btnPrcssDelete').attr('disabled', flag);
		$('#btnPrcssAllDelete').attr('disabled', flag);
		$('#btnPrcssAdd').attr('disabled', flag);

		$('#btnPrcssImageUpload').attr('disabled', !flag);
		$('#btnPrcssImageDelete').attr('disabled', !flag);
	}

	//금형선택 disabled 처리
	function uiProcMold(flag) {
		$('#equipCdCus').attr('disabled', flag);
		$('#equipCdDelete').attr('disabled', flag);
	}

	//입고수량 숫자만 입력하게 처리
	$(document).on('keyup', "#packCnt, #bundleCnt, #palletCnt", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas(uncomma($(this).val())));
	}); 
</script>

</body>
</html>
