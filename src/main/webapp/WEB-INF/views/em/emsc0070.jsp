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
					<!-- <label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">접속일시</label>
					<input type="datetime-local" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="datetime-local" class="form-control w-auto h-100 me-3" id="endDate"> -->
					<input type="text" class="form-control w-auto h-100 me-1" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-danger w-auto" style="font-size: 17px !important;" id="btnDel"><i class="fa-solid fa-trash-can"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="moldTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">
								<input class="form-check-input" id="checkGroupAll" type="checkbox" style="margin: 0px; width: 25px; height: 25px;">
							</th>
							<th class="text-center align-middle">순서</th>
							<th class="text-center align-middle">관리유형</th>
							<th class="text-center align-middle">자사관리번호</th>
							<th class="text-center align-middle">금형구분</th>
							<th class="text-center align-middle">업체관리번호</th>
							<th class="text-center align-middle">재질</th>
							<th class="text-center align-middle">금형보관위치</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">단위</th>
							<th class="text-center align-middle">수량</th>
							<th class="text-center align-middle">단가</th>
							<th class="text-center align-middle">금액</th>
							<th class="text-center align-middle">발주일</th>
							<th class="text-center align-middle">입고일</th>
							<th class="text-center align-middle">거래처</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">폐기일</th>
							<th class="text-center align-middle">사용여부</th>
							<th class="text-center align-middle">도면</th>
							<th class="text-center align-middle">첨부파일</th>
							<th class="text-center align-middle">비고</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 등록/수정 모달 -->
<div class="modal fade" id="addEditModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 90vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					금형 등록/수정
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave"><i class="fa-regular fa-floppy-disk"></i></button>
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<tr>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>관리유형</th>
						<td class="text-center align-middle">
							<select class="form-select w-100 h-100 inputGroup" id="managementType">
								<option value="" selected>선택</option>
								<option value="001">금형</option>
								<option value="002">계측기</option>
								<option value="003">제조설비</option>
							</select>
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>자사관리번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="selfManagementNumber" disabled>
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>금형구분</th>
						<td class="text-center align-middle">
							<select class="form-select w-100 h-100 selfManagementNumberGroup" id="moldType">
								<option value="" selected>선택</option>
								<option value="001">목형</option>
								<option value="002">프레스</option>
								<option value="003">사출</option>
								<option value="004">다이캐스팅</option>
								<option value="005">고무</option>
								<option value="006">기타</option>
							</select>
						</td>
						<th class="text-center align-middle">업체관리번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="companyManagementNumber">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">재질</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="material">
						</td>
						<th class="text-center align-middle">품번</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="itemNumber">
						</td>
						<th class="text-center align-middle">품명</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="itemName">
						</td>
						<th class="text-center align-middle">규격</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="specification">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">단위</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="unit">
						</td>
						<th class="text-center align-middle">수량</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control text-end inputGroup priceGroup" id="quantity" onkeyup="numberFormat(this,'int')">
						</td>
						<th class="text-center align-middle">단가</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control text-end inputGroup priceGroup" id="unitPrice" onkeyup="numberFormat(this,'float')">
						</td>
						<th class="text-center align-middle">금액</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control text-end inputGroup" id="amount" disabled>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">금형보관위치</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="moldStorageLocation">
						</td>
						<th class="text-center align-middle">발주일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup" id="orderDate">
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>입고일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup selfManagementNumberGroup" id="receiptDate">
						</td>
						<th class="text-center align-middle">거래처</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="vendor">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">발주번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="orderNumber">
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>프로젝트코드</th>
						<td class="text-center align-middle">
							<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="text" class="form-control inputGroup selfManagementNumberGroup" id="projectCode">
								<button type="button" class="btn btn-primary input-sub-search input_group btnProjectSel" style="padding: 1px 4px; margin-left: 0px;">
									<i class="fa-solid fa-magnifying-glass"></i>
								</button>
							</div>
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>프로젝트명</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="projectName">
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>사용여부</th>
						<td class="text-center align-middle">
							<select class="form-select w-100 h-100" id="useYn">
								<option value="">선택</option>
								<option value="Y" selected>사용</option>
								<option value="N">미사용</option>
								<option value="D">폐기</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">비고</th>
						<td class="text-center align-middle" colspan="5">
							<input type="text" class="form-control inputGroup" id="moldDesc">
						</td>
						<th class="text-center align-middle">폐기일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup" id="disposeDate">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">사진</th>
						<td class="text-center align-middle" colspan="7">
							<div class="container-fluid p-0 h-100">
								<div class="row">
									<div style="flex: 0 0 auto; width: calc((90vw - 32px) * 0.9 - 10px);">
										<div class="row" style="overflow: auto;">
											<input type="file" class="d-none" id="imageFile" multiple accept="image/*">
											<div class="row imageList" style="background-color: transparent; height: 150px; flex-wrap: nowrap;">
												<div id="btnImageAdd" 
													style="position: relative; background-color: transparent; text-align: center; border: 1px dashed #00000060;
															border-radius: 5px; margin: 5px; width: 150px; font-size: 50px; cursor: pointer;">
													<div style="position: absolute; top: 28px; right: 50px; color: #00ff00;">
														<i class="fa-solid fa-circle-plus"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">도면</th>
						<td class="text-center" colspan="3" style="height: 300px;">
							<input type="file" class="d-none" id="floorPlanFile" multiple>
							<ol class="list-group list-group" style="overflow: auto; height: 300px;">
								<li class="list-group-item d-flex justify-content-between align-items-start p-0" id="btnFloorPlanAdd" style="cursor: pointer;">
									<div class="ms-2">
										<div style="font-size: 15px; color: #00ff00;">
											<i class="fa-solid fa-circle-plus"></i>
										</div>
									</div>
								</li>
							</ol>
						</td>
						<th class="text-center align-middle">첨부파일</th>
						<td class="text-center" colspan="3" style="height: 300px;">
							<input type="file" class="d-none" id="attachmentFile" multiple>
							<ol class="list-group list-group" style="overflow: auto; height: 300px;">
								<li class="list-group-item d-flex justify-content-between align-items-start p-0" id="btnAttachmentAdd" style="cursor: pointer;">
									<div class="ms-2">
										<div style="font-size: 15px; color: #00ff00;">
											<i class="fa-solid fa-circle-plus"></i>
										</div>
									</div>
								</li>
							</ol>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 프로젝트 목록조회 모달 -->
<div class="modal fade" id="projectListModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 60vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					프로젝트 조회
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnProjectListModalPaste">
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
					</div>
					<div class="me-lg-auto"></div>
					<div class="d-flex align-items-center justify-content-end">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnProjectListModalSearch">
								<i class="fa-regular fa-clipboard"></i>
							</button>
						</div>
					</div>
				</div>
				<table class="table table-bordered p-0 m-0" id="projectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">프로젝트코드</th>
							<th class="text-center align-middle">프로젝트명</th>
							<th class="text-center align-middle">발주번호</th>
							<th class="text-center align-middle">발주일</th>
							<th class="text-center align-middle">품명</th>
							<th class="text-center align-middle">품번</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">단가</th>
						</tr>
					</thead>
				</table>
			</div>			
		</div>
	</div>
</div>
<style>
	/* 선택한 이미지 hover */
	.moldImage {
	    -webkit-transition: .2s ease-in-out;
	    transition: .2s ease-in-out;
	 }
	.moldImage:hover{
	    filter: brightness(1.1);
	    box-shadow: 0px 0px 7px 2px #00000012;
	    background-color: #00000012;
	}
	.moldImage:active{
	    transform: scale(1.05);
	}
	.imageSelected {
	    border-color: #2af598 !important;
	}
</style>
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

	let OS = "${OS}";
	let moldIdx = '';

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD HH:mm'));
	$('#endDate').val(moment().format('YYYY-MM-DD HH:mm'));

	// 금형관리 목록조회
	$('#moldTable thead tr').clone(true).addClass('filters').appendTo('#moldTable thead'); // filter 생성
	let moldTable = $('#moldTable').DataTable({
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
			url : '<c:url value="/em/moldList"/>',
			type : 'POST',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ className : 'text-center',
				render: function(data, type, row, meta) {
					return '<input class="form-check-input" type="checkbox" name="checkGroup" style="margin: 0px; width: 25px; height: 25px;">';
				}
			},
			{ className : 'text-center',
				render: function(data, type, row, meta) {
					return meta.row+1;
				}
			},
			{ data: 'managementTypeNm', className : 'text-center'},
			{ data: 'selfManagementNumber', className : 'text-center'},
			{ data: 'moldTypeNm', className : 'text-center'},
			{ data: 'companyManagementNumber', className : 'text-center'},
			{ data: 'material', className : 'text-center'},
			{ data: 'moldStorageLocation', className : 'text-center'},
			{ data: 'itemNumber', className : 'text-center'},
			{ data: 'itemName', className : 'text-center'},
			{ data: 'specification', className : 'text-center'},
			{ data: 'unit', className : 'text-center'},
			{ data: 'quantity', className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},
			{ data: 'unitPrice', className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},
			{ data: 'amount', className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},
			{ data: 'orderDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'receiptDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'vendor', className : 'text-center'},
			{ data: 'orderNumber', className : 'text-center'},
			{ data: 'projectCode', className : 'text-center'},
			{ data: 'projectName', className : 'text-center'},
			{ data: 'disposeDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'useYn', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data == 'Y') {
						return '사용';
					} else if(data == 'N') {
						return '미사용';
					} else if(data == 'D') {
						return '폐기';
					} else {
						return '';
					}
				}
			},
			{ className : 'text-center', render: function() { return ''; }},
			{ className : 'text-center', render: function() { return ''; }},
			{ data: 'moldDesc', className : 'text-center'},
		],
		columnDefs : [
			{
				targets: [0],
				orderable: false
			},
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#moldTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
			// 통합검색
			$('#searchAll').off('keyup',function() {});
			$('#searchAll').on('keyup',function() {
				$('#'+table_id+'_filter').find('input').val($(this).val());
				$('#'+table_id+'_filter').find('input').trigger('keyup');
			});

			//모든 체크박스 선택
			$('#checkGroupAll').off('click');
			$('#checkGroupAll').on('click',function(){
				if($('#checkGroupAll').prop("checked")){
					$('input:checkbox[name=checkGroup]').prop("checked",true);
				} else{
					$('input:checkbox[name=checkGroup]').prop("checked",false);
				}
			});
		},
		initComplete: function () {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			// For each column
			api.columns().eq(0).each(function (colIdx) {
				// Set the header cell to contain the input element
				let cell = $('#moldTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#moldTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	moldTable.on('column-reorder', function( e, settings, details ) {
		let api = moldTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#moldTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		moldTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 자사관리번호 채번
	$('.selfManagementNumberGroup').on('change keyup', function() {
		let moldType = $('#moldType').val();
		let receiptDate = $('#receiptDate').val();
		let projectCode = $('#projectCode').val();

		switch(moldType) {
			case '001': moldType = 'AA'; break;
			case '002': moldType = 'CC'; break;
			case '003': moldType = 'DD'; break;
			case '004': moldType = 'BB'; break;
			case '005': moldType = 'EE'; break;
			case '006': moldType = 'XX'; break;
			default   : moldType = '__';
		}
		receiptDate = receiptDate==''?'____':moment(receiptDate).format('YYMM');
		projectCode = projectCode.split('-').length != 4?'____':projectCode.split('-')[1];
		
		$('#selfManagementNumber').val("SI"+moldType+"-"+projectCode+"-"+receiptDate+"-"+"____");
	});

	// 금액 계산
	$('.priceGroup').on('change keyup', function() {
		let quantity = $('#quantity').val();
		let unitPrice = $('#unitPrice').val();
		let amount = 0;

		amount = parseFloat(quantity.replaceAll(',','')) * parseFloat(unitPrice.replaceAll(',',''));
		$('#amount').val(addCommas(amount));
	});

	// 등록 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록

		moldIdx = '';
		$('.inputGroup').val('');
		$('#selfManagementNumber').val("SI__-____-____-____");
		$('#quantity').val('0');
		$('#unitPrice').val('0');
		$('#amount').val('0');

		imageList = [];
		$('.moldFile').remove();
		
		$('#addEditModal').modal('show');
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');

		if($('#managementType').val() == '') {
			toastr.warning('관리유형을 선택해주세요.');
			$('#managementType').focus();
			return false;
		}
		if($('#moldType').val() == '') {
			toastr.warning('금형구분을 선택해주세요.');
			$('#moldType').focus();
			return false;
		}
		if($('#receiptDate').val() == '') {
			toastr.warning('입고일을 선택해주세요.');
			$('#receiptDate').focus();
			return false;
		}
		if($('#projectCode').val() == '') {
			toastr.warning('프로젝트코드를 입력해주세요.');
			$('#projectCode').focus();
			return false;
		}
		if($('#projectName').val() == '') {
			toastr.warning('프로젝트명을 입력해주세요.');
			$('#projectName').focus();
			return false;
		}
		if($('#useYn').val() == '') {
			toastr.warning('사용여부를 선택해주세요.');
			$('#useYn').focus();
			return false;
		}
		
		// 등록할 경우에
		if(saveType == 'insert') {
			let moldFileList = [];

			// 사진
			for(var i=0;i<imageList.length;i++) {
				let obj = {};
				let fileFormData = new FormData();
				fileFormData.append(0, imageList[i].file);
				fileFormData.append('uuid', imageList[i].uuid);
				fileFormData.append('ext', imageList[i].fileType);
				fileUpload(fileFormData).then( (value) => {});
				obj.moldIdx = moldIdx;
				obj.fileType = '001';
				obj.uuid = imageList[i].uuid;
				obj.fileName = imageList[i].fileName;
				obj.fileExt = imageList[i].fileType;

				if(OS.indexOf("windows") == 0) {
					obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
				} else {
					obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
				}
				moldFileList.push(obj);
			}
			// 도면
			for(var i=0;i<floorPlanList.length;i++) {
				if(floorPlanList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, floorPlanList[i].file);
					fileFormData.append('uuid', floorPlanList[i].uuid);
					fileFormData.append('ext', floorPlanList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.moldIdx = moldIdx;
					obj.fileType = '002';
					obj.uuid = floorPlanList[i].uuid;
					obj.fileName = floorPlanList[i].fileName;
					obj.fileExt = floorPlanList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					moldFileList.push(obj);
				}
			}
			// 첨부파일
			for(var i=0;i<attachmentList.length;i++) {
				if(attachmentList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, attachmentList[i].file);
					fileFormData.append('uuid', attachmentList[i].uuid);
					fileFormData.append('ext', attachmentList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.moldIdx = moldIdx;
					obj.fileType = '003';
					obj.uuid = attachmentList[i].uuid;
					obj.fileName = attachmentList[i].fileName;
					obj.fileExt = attachmentList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					moldFileList.push(obj);
				}
			}
			
			$.ajax({
				url: '<c:url value="/em/moldIns"/>',
	            type: 'POST',
	            data: {
	            	'managementType' : $('#managementType').val(),
	                'selfManagementNumber' : $('#selfManagementNumber').val(),
	                'moldType' : $('#moldType').val(),
	                'companyManagementNumber' : $('#companyManagementNumber').val(),
	                'material' : $('#material').val(),
	                'moldStorageLocation' : $('#moldStorageLocation').val(),
	                'itemNumber' : $('#itemNumber').val(),
	                'itemName' : $('#itemName').val(),
	                'specification' : $('#specification').val(),
	                'unit' : $('#unit').val(),
	                'quantity' : ($('#quantity').val()).replaceAll(',',''),
	                'unitPrice' : ($('#unitPrice').val()).replaceAll(',',''),
	                'amount' : ($('#amount').val()).replaceAll(',',''),
	                'orderDate' : ($('#orderDate').val()==''?'':moment(($('#orderDate').val())).format('YYYYMMDD')),
	                'receiptDate' : ($('#receiptDate').val()==''?'':moment(($('#receiptDate').val())).format('YYYYMMDD')),
	                'vendor' : $('#vendor').val(),
	                'orderNumber' : $('#orderNumber').val(),
	                'projectCode' : $('#projectCode').val(),
	                'projectName' : $('#projectName').val(),
	                'disposeDate' : ($('#disposeDate').val()==''?'':moment(($('#disposeDate').val())).format('YYYYMMDD')),
	                'useYn' : $('#useYn').val(),
	                'moldDesc' : $('#moldDesc').val(),
	                'moldFileList' : JSON.stringify(moldFileList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						$('#btnSearch').trigger('click');

						$('#addEditModal').modal('hide');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(saveType == 'update') {
			let moldFileList = [];

			// 사진
			for(var i=0;i<imageList.length;i++) {
				if(imageList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, imageList[i].file);
					fileFormData.append('uuid', imageList[i].uuid);
					fileFormData.append('ext', imageList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.moldIdx = moldIdx;
					obj.fileType = '001';
					obj.uuid = imageList[i].uuid;
					obj.fileName = imageList[i].fileName;
					obj.fileExt = imageList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					moldFileList.push(obj);
				}
			}
			// 도면
			for(var i=0;i<floorPlanList.length;i++) {
				if(floorPlanList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, floorPlanList[i].file);
					fileFormData.append('uuid', floorPlanList[i].uuid);
					fileFormData.append('ext', floorPlanList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.moldIdx = moldIdx;
					obj.fileType = '002';
					obj.uuid = floorPlanList[i].uuid;
					obj.fileName = floorPlanList[i].fileName;
					obj.fileExt = floorPlanList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					moldFileList.push(obj);
				}
			}
			// 첨부파일
			for(var i=0;i<attachmentList.length;i++) {
				if(attachmentList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, attachmentList[i].file);
					fileFormData.append('uuid', attachmentList[i].uuid);
					fileFormData.append('ext', attachmentList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.moldIdx = moldIdx;
					obj.fileType = '003';
					obj.uuid = attachmentList[i].uuid;
					obj.fileName = attachmentList[i].fileName;
					obj.fileExt = attachmentList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					moldFileList.push(obj);
				}
			}

			
			$.ajax({
				url: '<c:url value="/em/moldUpd"/>',
	            type: 'POST',
	            data: {
		            'idx' : moldIdx,
	            	'managementType' : $('#managementType').val(),
	                'selfManagementNumber' : $('#selfManagementNumber').val(),
	                'moldType' : $('#moldType').val(),
	                'companyManagementNumber' : $('#companyManagementNumber').val(),
	                'material' : $('#material').val(),
	                'moldStorageLocation' : $('#moldStorageLocation').val(),
	                'itemNumber' : $('#itemNumber').val(),
	                'itemName' : $('#itemName').val(),
	                'specification' : $('#specification').val(),
	                'unit' : $('#unit').val(),
	                'quantity' : ($('#quantity').val()).replaceAll(',',''),
	                'unitPrice' : ($('#unitPrice').val()).replaceAll(',',''),
	                'amount' : ($('#amount').val()).replaceAll(',',''),
	                'orderDate' : ($('#orderDate').val()==''?'':moment(($('#orderDate').val())).format('YYYYMMDD')),
	                'receiptDate' : ($('#receiptDate').val()==''?'':moment(($('#receiptDate').val())).format('YYYYMMDD')),
	                'vendor' : $('#vendor').val(),
	                'orderNumber' : $('#orderNumber').val(),
	                'projectCode' : $('#projectCode').val(),
	                'projectName' : $('#projectName').val(),
	                'disposeDate' : ($('#disposeDate').val()==''?'':moment(($('#disposeDate').val())).format('YYYYMMDD')),
	                'useYn' : $('#useYn').val(),
	                'moldDesc' : $('#moldDesc').val(),
	                'moldFileList' : JSON.stringify(moldFileList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수정 저장되었습니다.');

						$('#btnSearch').trigger('click');

						$('#addEditModal').modal('hide');
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
		if($('input:checkbox[name=checkGroup]:checked').length == 0) {
			toastr.warning('수정할 항목을 체크해주세요.');
			return false;
		} else if($('input:checkbox[name=checkGroup]:checked').length > 1) {
			toastr.warning('수정할 항목을 하나만 체크해주세요.');
			return false;
		}

		$('#btnSave').data('saveType','update'); // 저장 방식 -> 수정

		let checkedNode = $('input:checkbox[name=checkGroup]:checked').parent().parent();
		let moldData = moldTable.row(checkedNode).data();

		moldIdx = moldData.idx;
		$('#managementType').val(moldData.managementType);
		$('#selfManagementNumber').val(moldData.selfManagementNumber);
		$('#moldType').val(moldData.moldType);
		$('#companyManagementNumber').val(moldData.companyManagementNumber);
		$('#material').val(moldData.material);
		$('#moldStorageLocation').val(moldData.moldStorageLocation);
		$('#itemNumber').val(moldData.itemNumber);
		$('#itemName').val(moldData.itemName);
		$('#specification').val(moldData.specification);
		$('#unit').val(moldData.unit);
		$('#quantity').val(moldData.quantity);
		$('#unitPrice').val(addCommas(parseFloat(moldData.unitPrice)));
		$('#amount').val(addCommas(parseFloat(moldData.amount)));
		$('#orderDate').val(moment(moldData.orderDate).format('YYYY-MM-DD'));
		$('#receiptDate').val(moment(moldData.receiptDate).format('YYYY-MM-DD'));
		$('#vendor').val(moldData.vendor);
		$('#orderNumber').val(moldData.orderNumber);
		$('#projectCode').val(moldData.projectCode);
		$('#projectName').val(moldData.projectName);
		$('#disposeDate').val(moment(moldData.disposeDate).format('YYYY-MM-DD'));
		$('#useYn').val(moldData.useYn);
		$('#moldDesc').val(moldData.moldDesc);

		$.ajax({
			url: '<c:url value="/em/moldFileList"/>',
            type: 'POST',
            data: {
                'moldIdx':	moldIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					imageList = [];
					$('.moldFile').remove();

					for(var i=0;i<data.length;i++) {
						let obj = {};
	                    obj.index = i;
	                    obj.file = '';
	                    obj.uuid = data[i].uuid;
	                    obj.fileType = data[i].fileExt;
	                    obj.fileName = data[i].fileName;
	                    if(data[i].fileType == '001') {
	                    	imageList.push(obj);
							let imageHtml = '';
			    				imageHtml += '<div class="moldFile moldImage exsit" id="'+data[i].uuid+'" data-idx="'+data[i].idx+'"';
			    				imageHtml += '	style="position: relative; background-color: #cccccc12; text-align: center; border: 1px solid #00000012;';
			    				imageHtml += '	border-radius: 5px; padding: 5px; margin: 5px; width: 150px; cursor: pointer;">';
			    				imageHtml += '	<img src="data:image/'+data[i].fileExt+';base64,'+data[i].base64+'" style="width: 100%; object-fit: scale-down; height: 100%;">';
			    				imageHtml += '	<div class="btnImageDel"';
			    				imageHtml += '		style="position: absolute; top: -6px; right: -6px; width: 20px; height: 20px; background-color: #ff0000;';
			    				imageHtml += '			border-radius: 20px; text-align: center; cursor: pointer;">';
			    				imageHtml += '		<i class="fa-solid fa-xmark" style="color: #ffffff;"></i>';
			    				imageHtml += '	</div>';
			    				imageHtml += '</div>';
			    			$('#btnImageAdd').before(imageHtml);
	                    } else if(data[i].fileType == '002') {
	                    	let floorPlanHtml = '';
								floorPlanHtml += '<li class="list-group-item d-flex justify-content-between align-items-start p-0 moldFile moldFloorPlan exsit" id="'+data[i].uuid+'" data-idx="'+data[i].idx+'">';
								floorPlanHtml += '	<div class="ms-2 me-auto">';
								floorPlanHtml += '		<a href="data:application/'+data[i].fileExt+';base64,'+data[i].base64+'" download="'+data[i].fileName+'">'+data[i].fileName+'</a>';
								floorPlanHtml += '	</div>';
								floorPlanHtml += '	<span class="me-2" style="font-size: 15px;">';
								floorPlanHtml += '		<i class="fa-solid fa-xmark btnFloorPlanDel" style="cursor: pointer;"></i>';
								floorPlanHtml += '	</span>';
								floorPlanHtml += '</li>';
							$('#btnFloorPlanAdd').before(floorPlanHtml);
	                    } else if(data[i].fileType == '003') {
							let attachmentHtml = '';
								attachmentHtml += '<li class="list-group-item d-flex justify-content-between align-items-start p-0 moldFile moldAttachment exsit" id="'+data[i].uuid+'" data-idx="'+data[i].idx+'">';
								attachmentHtml += '	<div class="ms-2 me-auto">';
								attachmentHtml += '		<a href="data:application/'+data[i].fileExt+';base64,'+data[i].base64+'" download="'+data[i].fileName+'">'+data[i].fileName+'</a>';
								attachmentHtml += '	</div>';
								attachmentHtml += '	<span class="me-2" style="font-size: 15px;">';
								attachmentHtml += '		<i class="fa-solid fa-xmark btnAttachmentDel" style="cursor: pointer;"></i>';
								attachmentHtml += '	</span>';
								attachmentHtml += '</li>';
							$('#btnAttachmentAdd').before(attachmentHtml);
	                    } else {
		                    toastr.error('알 수 없는 파일유형입니다.');
		                }
					}
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
				$('#addEditModal').modal('show');
			}
		});

		
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('input:checkbox[name=checkGroup]:checked').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		$('#deleteModal').modal('show');
		$('#deleteModal').data('type', 'mold');
	});
	
	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let delType = $('#deleteModal').data('type');

		if(delType == 'mold') {
			let deleteList = [];
			$('input:checkbox[name=checkGroup]:checked').each(function(index, item) {
				let tr = $(item).parent().parent();
				let idx = moldTable.row(tr).data().idx;
				let obj = {};
				obj.idx = idx;
				deleteList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/em/moldDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'deleteList'	:	JSON.stringify(deleteList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');
						$('#btnSearch').trigger('click'); // 조회버튼 click
						$('#deleteModal').modal('hide');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(delType == 'moldImage') {
			let node = $('#deleteModal').data('node');
			let idx = $(node).parent().data('idx');
			
			$.ajax({
				url: '<c:url value="/em/moldFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						let uuid = $(node).parent().attr('id');
						let delIndex = _.findIndex(imageList, function(o) { return o.uuid == uuid;});
						imageList.splice(delIndex, 1);
						
						$(node).parent().remove();
						
						$('#deleteModal').modal('hide');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(delType == 'moldFloorPlan') {
			let node = $('#deleteModal').data('node');
			let idx = $(node).parent().parent().data('idx');
			
			$.ajax({
				url: '<c:url value="/em/moldFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						let uuid = $(node).parent().parent().attr('id');
						let delIndex = _.findIndex(floorPlanList, function(o) { return o.uuid == uuid;});
						floorPlanList.splice(delIndex, 1);
						
						$(node).parent().parent().remove();
						
						$('#deleteModal').modal('hide');
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else if(delType == 'moldAttachment') {
			let node = $('#deleteModal').data('node');
			let idx = $(node).parent().parent().data('idx');
			
			$.ajax({
				url: '<c:url value="/em/moldFileDel"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'idx'	:	idx
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('삭제되었습니다.');

						let uuid = $(node).parent().parent().attr('id');
						let delIndex = _.findIndex(attachmentList, function(o) { return o.uuid == uuid;});
						attachmentList.splice(delIndex, 1);
						
						$(node).parent().parent().remove();
						
						$('#deleteModal').modal('hide');
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







	// 프로젝트 목록조회
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
			url : '<c:url value="/em/moldProjectList"/>',
			type : 'POST',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'projectCd', className : 'text-center'},
			{ data: 'projectNm', className : 'text-center'},
			{ data: 'orderDtlNo', className : 'text-center'},
			{ data: 'deliveryOrderDate', className : 'text-center'},
			{ data: 'itemCd', className : 'text-center'},
			{ data: 'itemNm', className : 'text-center'},
			{ data: 'itemDc', className : 'text-center'},
			{ data: 'unitPrice', className : 'text-center'},
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
			{ extend: 'colvis',	text: 'Select Col',	},
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#projectTable_wrapper').find('.dataTables_scrollHead').css('height'));
			$('#'+table_id+'_wrapper').find('.dataTables_scrollBody').css('height',(htmlHeight - theadHeight - 79)+'px');
			
			$('#'+table_id+'_filter').addClass('d-none');
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

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
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
		},
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

	// 프로젝트 목록 조회 버튼 click
	$('#btnProjectListModalSearch').on('click', function() {
		$('#my-spinner').show();
		projectTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 프로젝트 목록 선택 버튼 click
	$('.btnProjectSel').on('click', function() {
		$('#projectListModal').modal('show');
		setTimeout(function() {
			projectTable.rows('.selected').deselect();
			projectTable.ajax.reload(function() {});
		}, 200);
	});

	// 프로젝트 항목 dblclick
	$('#projectTable tbody').on('dblclick','tr',function() {
		let data = projectTable.row(this).data();

		$('#itemNumber').val(data.itemCd);
		$('#itemName').val(data.itemNm);
		$('#specification').val(data.itemDc);
		$('#unitPrice').val(data.unitPrice);
		$('#orderDate').val(moment(data.deliveryOrderDate).format('YYYY-MM-DD'));
		$('#orderNumber').val(data.orderDtlNo);
		$('#projectCode').val(data.projectCd);
		$('#projectName').val(data.projectNm);

		$('.selfManagementNumberGroup').trigger('change');
		$('.priceGroup').trigger('change');
		
		$('#projectListModal').modal('hide');
	});
	$('#btnProjectListModalPaste').on('click',function() {
		let data = projectTable.row('.selected').data();

		$('#itemNumber').val(data.itemCd);
		$('#itemName').val(data.itemNm);
		$('#specification').val(data.itemDc);
		$('#unitPrice').val(data.unitPrice);
		$('#orderDate').val(moment(data.deliveryOrderDate).format('YYYY-MM-DD'));
		$('#orderNumber').val(data.orderDtlNo);
		$('#projectCode').val(data.projectCd);
		$('#projectName').val(data.projectNm);

		$('.selfManagementNumberGroup').trigger('change');
		$('.priceGroup').trigger('change');

		$('#projectListModal').modal('hide');
	});






	let imageList = [];

	// 이미지 확장자 배열
	const imgExtension = ['jpg','JPG','Jpg','png','PNG','Png','gif', 'jpeg', 'bmp', 'ico', 'apng'];
	
	// 사진 추가 버튼 click
	$(document).on('click', '#btnImageAdd', function() {
		$('#imageFile').trigger('click');
	});
	$(document).on('change', '#imageFile', function() {
        let extWarning = false;
        let imgExsit = false;
        let files = $(this)[0].files;
        let max_index = imageList.length==0?0:_.maxBy(imageList, function(x) { return x.index;}).index;
		if(files.length != 0) {
            for(var i=0;i<files.length;i++) {
                if(imgExtension.indexOf(files[i].name.split('.').at(-1)) != -1) { // 이미지파일일 경우
                    imgExsit = true;
                    let fileType = files[i].name.split('.')[files[i].name.split('.').length-1]
                    let fileName = files[i].name.slice(0,(fileType.length*-1)-1);
                    let obj = {};
                    obj.index = max_index+i+1;
                    obj.file = files[i];
                    obj.uuid = uuid_v4();
                    obj.fileType = fileType;
                    obj.fileName = fileName+'.'+files[i].name.split('.').at(-1);
                    imageList.push(obj);

                    toBase64(files[i]).then((base64) => {
                        let imageHtml = '';
	        				imageHtml += '<div class="moldFile moldImage" id="'+obj.uuid+'"';
	        				imageHtml += '	style="position: relative; background-color: #cccccc12; text-align: center; border: 1px solid #00000012;';
	        				imageHtml += '	border-radius: 5px; padding: 5px; margin: 5px; width: 150px; cursor: pointer;">';
	        				imageHtml += '	<img src="'+base64+'" style="width: 100%; object-fit: scale-down; height: 100%;">';
	        				imageHtml += '	<div class="btnImageDel"';
	        				imageHtml += '		style="position: absolute; top: -6px; right: -6px; width: 20px; height: 20px; background-color: #ff0000;';
	        				imageHtml += '			border-radius: 20px; text-align: center; cursor: pointer;">';
	        				imageHtml += '		<i class="fa-solid fa-xmark" style="color: #ffffff;"></i>';
	        				imageHtml += '	</div>';
	        				imageHtml += '</div>';
	        			$('#btnImageAdd').before(imageHtml);
                    });
                } else {
                    extWarning = true;
                }
            }

            if(extWarning) {
                toastr.warning('이미지가 아닌 파일은 자동으로 제외되었습니다.');
            }
        }
	});

	// 사진 삭제 버튼 click
	$(document).on('click', '.btnImageDel', function() {
		let exsit = $(this).parent().hasClass('exsit');

		if(exsit) {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('type', 'moldImage');
			$('#deleteModal').data('node', $(this));
		} else {
			let uuid = $(this).parent().attr('id');
			let delIndex = _.findIndex(imageList, function(o) { return o.uuid == uuid;});
			imageList.splice(delIndex, 1);
			
			$(this).parent().remove();
		}
	});

	const toBase64 = file => new Promise((resolve, reject) => {
	    const reader = new FileReader();
	    reader.readAsDataURL(file);
	    reader.onload = () => resolve(reader.result);
	    reader.onerror = error => reject(error);
	});

	
	let floorPlanList = [];
	
	// 도면 추가 버튼 click
	$(document).on('click', '#btnFloorPlanAdd', function() {
		$('#floorPlanFile').trigger('click');
	});
	$(document).on('change', '#floorPlanFile', function() {
        let files = $(this)[0].files;
        let max_index = floorPlanList.length==0?0:_.maxBy(floorPlanList, function(x) { return x.index;}).index;
		if(files.length != 0) {
            for(var i=0;i<files.length;i++) {
				let fileType = files[i].name.split('.')[files[i].name.split('.').length-1]
				let fileName = files[i].name.slice(0,(fileType.length*-1)-1);
				let obj = {};
				obj.index = max_index+i+1;
				obj.file = files[i];
				obj.uuid = uuid_v4();
				obj.fileType = fileType;
				obj.fileName = fileName+'.'+files[i].name.split('.').at(-1);
				floorPlanList.push(obj);

				toBase64(files[i]).then((base64) => {
					let floorPlanHtml = '';
						floorPlanHtml += '<li class="list-group-item d-flex justify-content-between align-items-start p-0 moldFile moldFloorPlan" id="'+obj.uuid+'">';
						floorPlanHtml += '	<div class="ms-2 me-auto">';
						floorPlanHtml += '		<a href="'+base64+'" download="'+obj.fileName+'">'+obj.fileName+'</a>';
						floorPlanHtml += '	</div>';
						floorPlanHtml += '	<span class="me-2" style="font-size: 15px;">';
						floorPlanHtml += '		<i class="fa-solid fa-xmark btnFloorPlanDel" style="cursor: pointer;"></i>';
						floorPlanHtml += '	</span>';
						floorPlanHtml += '</li>';
					$('#btnFloorPlanAdd').before(floorPlanHtml);
				});
            }
        }
	});

	// 도면 삭제 버튼 click
	$(document).on('click', '.btnFloorPlanDel', function() {
		let exsit = $(this).parent().parent().hasClass('exsit');
		if(exsit) {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('type', 'moldFloorPlan');
			$('#deleteModal').data('node', $(this));
		} else {
			let uuid = $(this).parent().parent().attr('id');
			let delIndex = _.findIndex(floorPlanList, function(o) { return o.uuid == uuid;});
			floorPlanList.splice(delIndex, 1);
			$(this).parent().parent().remove();
		}
	});

	let attachmentList = [];
	
	// 첨부파일 추가 버튼 click
	$(document).on('click', '#btnAttachmentAdd', function() {
		$('#attachmentFile').trigger('click');
	});
	$(document).on('change', '#attachmentFile', function() {
        let files = $(this)[0].files;
        let max_index = attachmentList.length==0?0:_.maxBy(attachmentList, function(x) { return x.index;}).index;
		if(files.length != 0) {
            for(var i=0;i<files.length;i++) {
				let fileType = files[i].name.split('.')[files[i].name.split('.').length-1]
				let fileName = files[i].name.slice(0,(fileType.length*-1)-1);
				let obj = {};
				obj.index = max_index+i+1;
				obj.file = files[i];
				obj.uuid = uuid_v4();
				obj.fileType = fileType;
				obj.fileName = fileName+'.'+files[i].name.split('.').at(-1);
				attachmentList.push(obj);

				toBase64(files[i]).then((base64) => {
					let attachmentHtml = '';
						attachmentHtml += '<li class="list-group-item d-flex justify-content-between align-items-start p-0 moldFile moldAttachment" id="'+obj.uuid+'">';
						attachmentHtml += '	<div class="ms-2 me-auto">';
						attachmentHtml += '		<a href="'+base64+'" download="'+obj.fileName+'">'+obj.fileName+'</a>';
						attachmentHtml += '	</div>';
						attachmentHtml += '	<span class="me-2" style="font-size: 15px;">';
						attachmentHtml += '		<i class="fa-solid fa-xmark btnAttachmentDel" style="cursor: pointer;"></i>';
						attachmentHtml += '	</span>';
						attachmentHtml += '</li>';
					$('#btnAttachmentAdd').before(attachmentHtml);
				});
            }
        }
	});

	// 첨부파일 삭제 버튼 click
	$(document).on('click', '.btnAttachmentDel', function() {
		let exsit = $(this).parent().parent().hasClass('exsit');
		if(exsit) {
			$('#deleteModal').modal('show');
			$('#deleteModal').data('type', 'moldAttachment');
			$('#deleteModal').data('node', $(this));
		} else {
			let uuid = $(this).parent().parent().attr('id');
			let delIndex = _.findIndex(attachmentList, function(o) { return o.uuid == uuid;});
			attachmentList.splice(delIndex, 1);
			$(this).parent().parent().remove();
		}
	});
</script>

</body>
</html>
