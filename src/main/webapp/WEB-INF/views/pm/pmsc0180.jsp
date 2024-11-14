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
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">요청구분</label>
					<select class="form-select w-auto h-100 me-3" id="searchRequestGubun" style="min-width: 70px;">
					</select>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100" style="background-color:#8bade461;">입고일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-3" id="batchOrderDate">
					<div class="d-flex align-items-center justify-content-end me-2">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" id="btnBatchApply">
								적용
							</button>
						</div>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="purchaseOrderAdmTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">상태</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">요청구분</th>
							<th class="text-center align-middle">부서</th>
							<th class="text-center align-middle">구분1</th>
							<th class="text-center align-middle">구분2</th>
							<th class="text-center align-middle">구분3</th>
							<th class="text-center align-middle">거래처</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">Maker</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">발주수량</th>
							<th class="text-center align-middle">기입고수량</th>
							<th class="text-center align-middle">입고일</th>
							<th class="text-center align-middle">입고수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">입고창고</th>
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
	let userName = "${userName}";
	let userIdx = "${userIdx}";
	let userDepartmentNm = "${userDepartmentNm}";
	
	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정

 	let requestGubunList = getCommonCode('시스템', '048'); // 요청구분
	
	let itemGubunList = getCommonCode('시스템', '049'); // 품목구분
	let lcGubunList = getCommonCode('시스템', '034'); // 창고분류
	
 	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
 	selectBoxAppend(itemGubunList, 'locationModalItemGubun', '', '1'); //품목구분

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
	$('#batchOrderDate').val(moment().format('YYYY-MM-DD'));
	
	let checkRequest = '';

	// 수주관리 전체 목록조회
	$('#purchaseOrderAdmTable thead tr').clone(true).addClass('filters').appendTo('#purchaseOrderAdmTable thead'); // filter 생성
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
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
			url : '<c:url value="/pm/purchaseOrderDtlInsertLst"/>',
			type : 'POST',
			data : {
				startDate		: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate			: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				requestGubun	: function() { return $('#searchRequestGubun').val();},
				
			},
		},
        rowId: 'orderNo',
        columns : [
			{ data: 'status', className : 'text-center align-middle', //상태
				render : function(data, type, row, meta) {
					return '발주';
				}
			},
			{ data: 'orderDtlNo', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'requestGubun', className : 'text-center align-middle', name: 'requestGubun',
				render: function(data, type, row, meta) {
					var requestGubun = '';
					requestGubunList.forEach(function(item){
					    if(item.commonCd == data){
					    	requestGubun = item.commonNm;
					    }
					});
					return '<div name="requestGubun" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+requestGubun+'</div>';
				}
			},
			{ data: 'orderUserDepartment', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space:nowrap;" name="orderUserDepartment">'+data+'</div>';
				}
			},
			{ data: 'itemGubunNm', className : 'text-center align-middle', name: 'itemGubunNm', //품목구분1
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx">'+row['itemGubunIdx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubunIdx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubunNm"></div>';
						return html;
					}
				}
			}, 
			{ data: 'itemGubun1Nm', className : 'text-center align-middle', name: 'itemGubun1Nm', //품목구분1
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx">'+row['itemGubun1Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun1Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun1Nm"></div>';
						return html;
					}
				}
			},
			{ data: 'itemGubun2Nm', className : 'text-center align-middle', name: 'itemGubun2Nm', //품목구분2
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx">'+row['itemGubun2Idx']+'</div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm">'+data+'</div>';
						return html;
					} else {
						var html = '<div class="d-none" style="white-space:nowrap;" name="itemGubun2Idx"></div>';
						html += '<div style="white-space:nowrap;" name="itemGubun2Nm"></div>';
						return html;
					}
				}
			},
			{ data: 'dealCorpIdx', className : 'text-center align-middle', name: 'dealCorpIdx', //거래처
				render: function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+row['dealCorpNm']+'</div>';
					} else return '';
				}
			},
			{ data: 'itemCd', className : 'text-center align-middle', name: 'itemCd', //자재코드
				render: function(data, type, row, meta) {
					return '<div name="itemCd" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle', //자재명
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'itemDc', className : 'text-center align-middle', //규격
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'maker', className : 'text-center align-middle', name: 'maker', //maker
				render: function(data, type, row, meta) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'unitDc', className : 'text-center align-middle', //단위
				render : function(data, type, row, meta) {
					if(data!=null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'orderDtlQty', className : 'text-end align-middle', name: 'orderDtlQty', //발주수량
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';							
				}
			},
			{ data: 'alreadyInWhsQty', className : 'text-end align-middle', name: 'alreadyInWhsQty', //기발주수량
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ data: 'inDate', className : 'text-center align-middle', name: 'inDate',//입고일
				render : function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'orderQty', className : 'text-end align-middle', name: 'orderQty', //입고수량
				render : function(data, type, row, meta) {
					return '<div style="background-color:#f8acac;white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
				}
			},
			{ data: 'price', className : 'text-end align-middle', name: 'price', //단가
				render : function(data, type, row, meta) {
					return '<div name="price" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseInt(data))+'</div>';
				}
			},
			{ className : 'text-end align-middle', //금액(계산)
				render : function(data, type, row, meta) {
					return '<div name="totalAmt" style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">0</div>';							
				}
			},
			{  className : 'text-center align-middle', name: 'whsIdx', //입고창고
				render : function(data, type, row, meta) {
					let html = '';
					return html;
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
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#purchaseOrderAdmTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#purchaseOrderAdmTable_filter').addClass('d-none');
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
					let selectData = purchaseOrderAdmTable.row(item).data();
					if( purchaseOrderAdmTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(purchaseOrderAdmTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(purchaseOrderAdmTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#purchaseOrderAdmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	purchaseOrderAdmTable.on('column-reorder', function( e, settings, details ) {
		let api = purchaseOrderAdmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#purchaseOrderAdmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		purchaseOrderAdmTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 수주목록 선택
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function() {
		let data = purchaseOrderAdmTable.row(this).data();
		let idx = data.idx;
	});

	//일괄적용
	$('#btnBatchApply').on('click',function(){
		if($('#batchOrderDate').val()=='') {
			toastr.warning('입고일자를 지정해주세요.');
			$('#batchOrderDate').focus();
		}
		$('#purchaseOrderAdmTable tbody tr').each(function(index, item){
			if($(this).find('input[name=admCheckBox]').is(':checked')) {
				$(this).find('input[name=inDate]').val($('#batchOrderDate').val());
			}
		});
	});

</script>

</body>
</html>
