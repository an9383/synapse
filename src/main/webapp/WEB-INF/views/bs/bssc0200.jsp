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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">시작일자</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" max="9999-12-31" class="form-control w-auto h-100 me-1" id="endDate">
					<select class="form-select w-auto h-100 me-3 monthAdjust" id="monthAdjust">
					</select>
					
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAllAdm" placeholder="통합검색" >
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">진행의뢰상태</label>
					<select class="form-select w-auto h-100 me-3" id="searchStatus" style="min-width: 70px;">
						<option value="" selected>전체</option>
						<option value="N">대기</option>
						<option value="Y">진행중</option>
						<option value="D">완료</option>
					</select>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" id="btnSerialNo" disabled>Serial No</button>
					</div>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto me-2" id="btnProgressY">진행의뢰</button>
					</div>
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="bizProjectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">
<!-- 								<input class="form-check-input" type="checkbox" id="allCheckBox" style="margin: 0px; width: 25px; height: 25px;"> -->
							</th>
							<th class="text-center align-middle">프로젝트 번호</th>
							<th class="text-center align-middle">Customer</th>
							<th class="text-center align-middle">국내/해외</th>
							<th class="text-center align-middle">품목유형</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">목표일자</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">진행금액</th>
							<th class="text-center align-middle">상태</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- Serial No 모달 -->
<div class="modal fade" id="serialNoModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 30vw;">
		<div class="modal-content" style="height: calc(100vh - 30em);">
			<div class="modal-header">
				<h5 class="modal-title" id="serialNoModalTitle">
					Serial No.
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSerialNoModalSave">
						<i class="fa-regular fa-floppy-disk"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body" style="overflow:auto;">
				<table class="table table-bordered p-0 m-0" id="serialNoModalTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">Serial No.</th>
							<th class="text-center align-middle">고객사 Serial No.</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- Serial No 끝 -->
<!-- 프로젝트 채번 모달 -->
<div class="modal fade" id="getSerialNoModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 80vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="serialNoModalTitle">Serial No. 채번</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnSerialNoModalPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="row modal-body-top text-center mt-2" style="justify-content:center;">
				<span id="serialNoMake" style="font-size:40px;height:6vh;">S-<span id="projectCdSerial">___________</span>-<span id="customerCd">__</span>-__</span>
			</div>
			<div class="modal-body">
				<div class="row">
					<div id="leftcol" style="width:25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="CustomerCodeTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th colspan="2" class="text-center">Company Code(①)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center">Synaspseimaging</td>
											<td class="text-center">S</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="centercol" style="width:25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="projectCodeTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th colspan="3" class="text-center">Project Code(②)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="text-center">프로젝트 코드</td>
											<td class="text-center" id="tdProjectCode"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="rightcol" style="width:25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="dealCorpInitialTable" style="width:100%;">
									<colgroup>
										<col width="80%">
										<col width="20%">
									</colgroup>
									<thead class="table-light">
										<tr>
											<th colspan="3" class="text-center">Customer Code(③)</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="leftcolM" style="width:25%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="prdListTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th colspan="3" class="text-center">Serial No(④)</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td rowspan="2" class="text-center"><b>01 ~ 99</b><br>동일 PJT 내 호기 일련번호</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 채번 모달 끝 -->
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

	let abroadGubunList = getCommonCode('시스템', '043'); // 국내/해외

//  	let requestGubunList = getCommonCode('시스템', '048'); // 요청구분
	
// 	let itemGubunList = getCommonCode('시스템', '049'); // 품목구분
// 	let lcGubunList = getCommonCode('시스템', '034'); // 창고분류
	
//  	selectBoxAppend(requestGubunList, 'searchRequestGubun', '', '1'); //요청구분
//  	selectBoxAppend(itemGubunList, 'locationModalItemGubun', '', '1'); //품목구분

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));
// 	$('#batchOrderDate').val(moment().format('YYYY-MM-DD'));
	
	let checkRequest = '';

	let projectIdxVal = '';
	let goodsTypeCdVal = '';
	let goodsNmVal = '';

	// 수주관리 전체 목록조회
	$('#bizProjectTable thead tr').clone(true).addClass('filters').appendTo('#bizProjectTable thead'); // filter 생성
	let bizProjectTable = $('#bizProjectTable').DataTable({
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
			url : '<c:url value="/bs/bizProjectLst"/>',
			type : 'POST',
			data : {
				startDate		: function() { return moment($('#startDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				endDate			: function() { return moment($('#endDate').val(),'YYYY-MM-DD').format('YYYYMMDD'); },
				searchTarget	: function() { return $('#searchStatus').val();},
				
			},
		},
        rowId: 'orderNo',
        columns : [
        	{ className : 'text-center align-middle', name : "checkBox", //체크박스
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="checkBox" id="chk-'+meta.row+'" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
			{ data: 'projectCd', className : 'text-center align-middle', //프로젝트 번호
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{ data: 'customerNm', className : 'text-center align-middle',//customer
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			{ data: 'abroadGubun', className : 'text-center align-middle',//국내/해외
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
			{ data: 'goodsTypeNm', className : 'text-center align-middle',//품목유형
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			{ data: 'goodsNm', className : 'text-center align-middle',//품명
				render : function(data, type, row, meta) {
					if(data != null){
						return data;
					} else {
						return "";
					}
				}	
			},
			{ data: 'projectNm', className : 'text-center align-middle', //프로젝트명
				render : function(data, type, row, meta) {
					return data;
				}
			},
			{ data: 'targetDate', className : 'text-center align-middle', //입고일
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data: 'prjQty', className : 'text-end align-middle', //수량
				render : function(data, type, row, meta) {
					return addCommas(parseInt(data));
				}
			},
			{ data: 'progressAmt', className : 'text-end align-middle', //진행금액
				render : function(data, type, row, meta) {
					return addCommas(parseInt(data));
				}
			},
			{ data: 'progressYn', className : 'text-center align-middle', //상태
				render : function(data, type, row, meta) {
					if(data == 'N'){
						return '대기';
					} else if(data == 'Y'){
						return '진행중';
					} else if(data == 'D'){
						return '완료';
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
			let middlecolT_height = parseFloat($('#leftcol').css('height'));
			let theadHeight = parseFloat($('#bizProjectTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#bizProjectTable_wrapper').find('.dataTables_scrollBody').css('height',(middlecolT_height - theadHeight - 80)+'px');
			
			$('#bizProjectTable_filter').addClass('d-none');
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
					let selectData = bizProjectTable.row(item).data();
					if( bizProjectTable.row(item).data().printYn == 'Y' || ( selectData.mergeIdx != '' && selectData.mergeIdx != null && selectData.mergeIdx != '0') ) {
						$(bizProjectTable.row(item).node()).find('.bootstrapToggle').bootstrapToggle('disable');
						$(bizProjectTable.row(item).node()).addClass('notEdit');
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
				let cell = $('#bizProjectTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#bizProjectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	bizProjectTable.on('column-reorder', function( e, settings, details ) {
		let api = bizProjectTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#bizProjectTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		bizProjectTable.ajax.reload(function() {}, false);
		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100);

		$('#btnSerialNo').attr('disabled', true);
	});

	// 수주목록 선택
	$('#bizProjectTable tbody').on('click', 'tr', function() {
		let data = bizProjectTable.row(this).data();
		let idx = data.idx;

		projectIdxVal = data.idx;
		goodsTypeCdVal = data.goodsTypeCd;
		goodsNmVal = data.goodsNm;

		$('#btnSerialNo').attr('disabled', false);
	});

	$('#btnSerialNo').on('click', function(){
		if(bizProjectTable.row('.selected').length != 1){
			toastr.warning('프로젝트를 선택해주세요.');
			return false;
		}

//*************** 시리얼 번호 시리얼번호 불러오기 ****************
		let serialData = [];
		$.ajax({
			url: '<c:url value="/bs/bizSerialNoLst"/>',
            type: 'POST',
            async: false,
            data: {
                'idx'	:	function() { return projectIdxVal; },
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					serialData = res.data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});

		let data = bizProjectTable.row('.selected').data();
		
		var html = '';

		for(var i=0; i<data.prjQty; i++){
			html += '<tr>';
			if(serialData[i] != null){
				html += '<td><input type="hidden" name="serialIdx" value="'+serialData[i].idx+'"><input type="text" class="form-control text-center" name="serialNo" value="'+serialData[i].serialNo+'"></td>';
				html += '<td><input type="text" class="form-control text-center" name="customerSerialNo" value="'+serialData[i].customerSerialNo+'"></td>';
			} else {
				html += '<td><input type="hidden" name="serialIdx" value=""><input type="text" class="form-control text-center" name="serialNo"></td>';
				html += '<td><input type="text" class="form-control text-center" name="customerSerialNo"></td>';
			}
			html += '</tr>';
		}
		
		$('#serialNoModalTable tbody').html(html);
		
		$('#serialNoModal').modal('show');
//		*************** 시리얼 번호 시리얼번호 불러오기 ****************
	});

	//Serial No 모달 저장
	$('#btnSerialNoModalSave').on('click', function(){

		let array = [];
		let state = true;

		let fileUuid;
		let fileNm;
		let fileExt;

		for(var i=0; i<$('#serialNoModalTable tbody tr').length; i++){
			if($($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialNo]').val() == ''){
				toastr.warning('Serial No를 입력해주세요.');
				state = false;
				return false;
			}
			let obj = new Object();
			obj.idx = $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialIdx]').val() == '' ? '' : $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialIdx]').val();
			obj.serialNo = $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=serialNo]').val();
			obj.customerSerialNo = $($('#serialNoModalTable tbody tr').eq(i)).find('input[name=customerSerialNo]').val();

			array.push(obj);
		}

		if(!state) {
			return false;
		}

		$.ajax({
			url: '<c:url value="/bs/bizSerialNoIU"/>',
            type: 'POST',
            data: {
                'projectIdx'		:	function(){ return projectIdxVal; },
                'goodsTypeCd'		:	function(){ return goodsTypeCdVal; },
               	'goodsNm'			:	function(){ return goodsNmVal; },
               	'jsonArray'			:	JSON.stringify(array),
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('저장되었습니다.');
					bizProjectTable.ajax.reload(function(){},false);
					
					$('#serialNoModal').modal('hide');
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});

	$('#btnProgressY').on('click', function(){
		if($('input:checkbox[name=checkBox]:checked').length!=1){
			toastr.warning('체크박스를 하나씩 체크해주세요.');
			return false;
		}

		$.ajax({
			url: '<c:url value="/bs/progressYnUpd"/>',
            type: 'POST',
            data: {
                'idx'			:	function(){ return projectIdxVal; },
                'progressYn'	:	'Y',
            },
            beforeSend: function() {
//             	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('진행의뢰 되었습니다.');
					
					bizProjectTable.ajax.reload(function(){},false);
					purchaseOrderAdmTable.colReorder.enable();
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
// 				$('#my-spinner').hide();
			}
		});
		
	});

</script>

</body>
</html>
