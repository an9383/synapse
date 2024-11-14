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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">발행년도</label>
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="yearAdjust">
					</select>
					<input type="text" class="d-none form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
					<!-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-warning bg-gradient">작업진행</label>
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100 bg-primary bg-info">작업완료</label> -->
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizOrderSalesDealMonTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">수주처</th>
							<th class="text-center align-middle"><span id="mon1"></span>01</th>
							<th class="text-center align-middle"><span id="mon2"></span>02</th>
							<th class="text-center align-middle"><span id="mon3"></span>03</th>
							<th class="text-center align-middle"><span id="mon4"></span>04</th>
							<th class="text-center align-middle"><span id="mon5"></span>05</th>
							<th class="text-center align-middle"><span id="mon6"></span>06</th>
							<th class="text-center align-middle"><span id="mon7"></span>07</th>
							<th class="text-center align-middle"><span id="mon8"></span>08</th>
							<th class="text-center align-middle"><span id="mon9"></span>09</th>
							<th class="text-center align-middle"><span id="mon10"></span>10</th>
							<th class="text-center align-middle"><span id="mon11"></span>11</th>
							<th class="text-center align-middle"><span id="mon12"></span>12</th>
							<th class="text-center align-middle">합계</th>
						</tr>
					</thead>
					<tfoot>
						<tr style="background-color: #6fdb65; border: 1px solid black;">
							<td class="text-center align-middle" style="background-color: #6fdb65;">합계</td>
							<td id="totalMon1" style="background-color: #6fdb65;"></td>
							<td id="totalMon2" style="background-color: #6fdb65;"></td>
							<td id="totalMon3" style="background-color: #6fdb65;"></td>
							<td id="totalMon4" style="background-color: #6fdb65;"></td>
							<td id="totalMon5" style="background-color: #6fdb65;"></td>
							<td id="totalMon6" style="background-color: #6fdb65;"></td>
							<td id="totalMon7" style="background-color: #6fdb65;"></td>
							<td id="totalMon8" style="background-color: #6fdb65;"></td>
							<td id="totalMon9" style="background-color: #6fdb65;"></td>
							<td id="totalMon10" style="background-color: #6fdb65;"></td>
							<td id="totalMon11" style="background-color: #6fdb65;"></td>
							<td id="totalMon12" style="background-color: #6fdb65;"></td>
							<td id="totalSum" style="background-color: #6fdb65;"></td>
						</tr>
					</tfoot>
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

	var remainPubVal = 0;
	var inCompleteVal = 0;
	var remainPubValQ = 0;
	var inCompleteValQ = 0;
	var remainPubValH = 0;
	var inCompleteValH = 0;

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	let now = new Date();
	let now_year = now.getFullYear();

	for(var i=1; i<13; i++){
		$('#mon'+i).text(now_year);
	}
	
	// 2005년 부터 올해까지
	for(var i = now_year; i >= 2005; i--){
		if(i == now_year){
			$("#yearAdjust").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
			$("#yearAdjust1").append("<option value='"+ i +"' selected>"+ i + " 년" +"</option>");
		} else {
			$("#yearAdjust").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
			$("#yearAdjust1").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
		}
	}

	$('#yearAdjust').on('change', function(){
		for(var i=1; i<13; i++){
			$('#mon'+i).text($("#yearAdjust").val());
		}
		
		bizOrderSalesDealMonTable.ajax.reload(function(){});
	});

	$('#bizOrderSalesDealMonTable thead tr').clone(true).addClass('filters').appendTo('#bizOrderSalesDealMonTable thead'); // filter 생성
	let bizOrderSalesDealMonTable = $('#bizOrderSalesDealMonTable').DataTable({
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
        scrollY: '76vh',
//        scrollX: true,
		pageLength: 100000000,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bs/bizOrderSalesGroupByDealMon"/>',
			type : 'POST',
			data : {
				'selYear'	: function() { return $("#yearAdjust").val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'dealCorpNm', className : 'text-center align-middle', //연월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'jan', className : 'text-end align-middle', //1월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'feb', className : 'text-end align-middle', //2월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'mar', className : 'text-end align-middle', //3월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'apr', className : 'text-end align-middle', //4월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'may', className : 'text-end align-middle', //5월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'june', className : 'text-end align-middle', //6월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'july', className : 'text-end align-middle', //7월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'aug', className : 'text-end align-middle', //8월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'sep', className : 'text-end align-middle', //9월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'oct', className : 'text-end align-middle', //10월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'nov', className : 'text-end align-middle', //11월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'dec', className : 'text-end align-middle', //12월
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
			{ data: 'dealSum', className : 'text-end align-middle', //거래처별 합계
				render : function(data, type, row, meta) {
					if(data != '' && data != null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+addCommas(parseFloat(data))+'</div>';
					} else {
						return '0';
					}
				}
			},
		],
		columnDefs : [
			/* {
				targets: '_all',
				render: function(data) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			}  */
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
			let theadHeight = parseFloat($('#bizOrderSalesDealMonTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});
			
 			let data = api.data();

			let totalMon1 = 0;
			let totalMon2 = 0;
			let totalMon3 = 0;
			let totalMon4 = 0;
			let totalMon5 = 0;
			let totalMon6 = 0;
			let totalMon7 = 0;
			let totalMon8 = 0;
			let totalMon9 = 0;
			let totalMon10 = 0;
			let totalMon11 = 0;
			let totalMon12 = 0;
			let totalSum = 0;
			
 			for(var i=0; i<data.length; i++){
 				totalMon1 += parseFloat(data[i].jan);
 				totalMon2 += parseFloat(data[i].feb);
 				totalMon3 += parseFloat(data[i].mar);
 				totalMon4 += parseFloat(data[i].apr);
 				totalMon5 += parseFloat(data[i].may);
 				totalMon6 += parseFloat(data[i].june);
 				totalMon7 += parseFloat(data[i].july);
 				totalMon8 += parseFloat(data[i].aug);
 				totalMon9 += parseFloat(data[i].sep);
 				totalMon10 += parseFloat(data[i].oct);
 				totalMon11 += parseFloat(data[i].nov);
 				totalMon12 += parseFloat(data[i].dec);
 				totalSum += parseFloat(data[i].dealSum);
 	 		}

 			$('#totalMon1').text(addCommas(totalMon1));
 			$('#totalMon2').text(addCommas(totalMon2));
 			$('#totalMon3').text(addCommas(totalMon3));
 			$('#totalMon4').text(addCommas(totalMon4));
 			$('#totalMon5').text(addCommas(totalMon5));
 			$('#totalMon6').text(addCommas(totalMon6));
 			$('#totalMon7').text(addCommas(totalMon7));
 			$('#totalMon8').text(addCommas(totalMon8));
 			$('#totalMon9').text(addCommas(totalMon9));
 			$('#totalMon10').text(addCommas(totalMon10));
 			$('#totalMon11').text(addCommas(totalMon11));
 			$('#totalMon12').text(addCommas(totalMon12));
 			$('#totalSum').text(addCommas(totalSum));

 			setTimeout(function(){
 	 			$('#bizOrderSalesDealMonTable tfoot').remove();
 	 		}, 150);
		},
		initComplete: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#bizOrderSalesDealMonTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizOrderSalesDealMonTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizOrderSalesDealMonTable.on('column-reorder', function( e, settings, details ) {
		let api = bizOrderSalesDealMonTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizOrderSalesDealMonTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		bizOrderSalesDealMonTable.ajax.reload(function() { });

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});


	
</script>

</body>
</html>
