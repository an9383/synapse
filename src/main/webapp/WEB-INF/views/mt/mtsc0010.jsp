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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">생산지시일</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-danger bg-gradient">범례 : 241H ( 23 * 10.5H )</label>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle" rowspan='2'>수주상세번호</th>
							<th class="text-center align-middle" rowspan='2'>고객사</th>
							<th class="text-center align-middle" rowspan='2'>수주접수일</th>
							<th class="text-center align-middle" rowspan='2'>수주수량</th>
							<th class="text-center align-middle" rowspan='2'>제품명</th>
							<th class="text-center align-middle" rowspan='2'>재질</th>
							<th class="text-center align-middle" rowspan='2'>버전</th>
							<th class="text-center align-middle" rowspan='2'>출고요청일</th>
							<th class="text-center align-middle" rowspan='2'>목표요구일</th>
							<th class="text-center align-middle" rowspan='2'>지시수량</th>
							<th class="text-center align-middle" rowspan='2'>생산완료일</th>
							<th class="text-center align-middle">생산량</th>
							<th class="text-center align-middle">가동시간</th>
							<th class="text-center align-middle">시간당생산량</th>
						</tr>
						<tr>
							<td class="text-end align-middle" id="sumWorkFairQty">0</td>
							<td class="text-end align-middle">241</td>
							<td class="text-end align-middle" id="sumProductionPerHour">0</td>
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

<script>

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let monthAdjustList = getCommonCode('시스템', '026'); //날짜조정
	monthAdjustList = _.sortBy(monthAdjustList, v=>parseInt(v.commonCd));
	selectBoxAppend(monthAdjustList, 'monthAdjust', '', '2'); //날짜조정
	
	// 수주관리 전체 목록조회
	let bizOrderTable = $('#bizOrderTable').DataTable({
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
		colReorder: false,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/mt/bizOrdWorkCurrentSituation"/>',
			type : 'POST',
			data : {
				startDate	: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate		: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
			},
		},
        rowId: '',
		columns : [
			{ data: 'bizOrdDtlNo', className : 'text-center align-middle', //수주상세번호
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '-';
					}
				}
			},
			{ data: 'bizOrdDealCorpNm', className : 'text-center align-middle',//고객사
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'bizOrdDate', className : 'text-center align-middle',//수주접수일
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'bizOrdQty', className : 'text-end align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'itemNm', className : 'text-center align-middle',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'paperType', className : 'text-center align-middle',//재질
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'itemVersionNm', className : 'text-center align-middle',//버전번호
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'outReqDate', className : 'text-center align-middle',//출고요청일
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'workEndReqDate', className : 'text-center align-middle',//목표요구일
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'workOrdQty', className : 'text-end align-middle',//지시수량
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'workEndDate', className : 'text-center align-middle',//생산완료일
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'workFairQty', className : 'text-end align-middle',name:'workFairQty',//생산량
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'upTime', className : 'text-end align-middle',//가동시간인데 데이터가 있든말든 빈값이라고하셨씀
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'productionPerHour', className : 'text-end align-middle',name:'productionPerHour',
				render: function(data) {
					if(data != null && data != ''){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
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
			{ extend: 'pdf',	text: 'PDF',	},
			{ extend: 'print',	text: 'Print',		charset: 'UTF-8', bom: true },
			{ extend: 'colvisGroup',	className: 'd-none',	hide: '.colvisHide'},
			/* { extend: 'colvis',	text: 'Select Col',	}, */
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#bizOrderTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			$('.bootstrapToggle').bootstrapToggle();
			
			$('#sumWorkFairQty').text(addCommas(api.column( $('#bizOrderTable').DataTable().column('workFairQty:name').index(), {page : 'current'} ).data().sum()));
			let sumProductionPerHour = api.column( $('#bizOrderTable').DataTable().column('workFairQty:name').index(), {page : 'current'} ).data().sum()/241;
			$('#sumProductionPerHour').text(addCommas( sumProductionPerHour.toFixed(2) ));
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="' + title + '" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		bizOrderTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

</script>

</body>
</html>
