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
				<table class="table table-bordered p-0 m-0" id="measuringInstrumentTable">
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle">
								<input class="form-check-input" id="checkGroupAll" type="checkbox" style="margin: 0px; width: 25px; height: 25px;">
							</th>
							<th class="text-center align-middle">No</th>
							<th class="text-center align-middle">관리번호</th>
							<th class="text-center align-middle">기존 관리번호</th>
							<th class="text-center align-middle">사진현황</th>
							<th class="text-center align-middle">계측기명</th>
							<th class="text-center align-middle">모델명</th>
							<th class="text-center align-middle">규격</th>
							<th class="text-center align-middle">기기<br>고유번호</th>
							<th class="text-center align-middle">등록일</th>
							<th class="text-center align-middle">사용부서</th>
							<th class="text-center align-middle">제작사/국가</th>
							<th class="text-center align-middle">발주번호<br>(품의번호)</th>
							<th class="text-center align-middle">구입가격</th>
							<th class="text-center align-middle">교정주기</th>
							<th class="text-center align-middle">교정일</th>
							<th class="text-center align-middle">교정번호</th>
							<th class="text-center align-middle">차기교정일</th>
							<th class="text-center align-middle">폐기일</th>
							<th class="text-center align-middle">검교정기관</th>
							<th class="text-center align-middle">사용여부</th>
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
					계측기 등록/수정
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
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>관리번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="managementNumber" disabled>
						</td>
						<th class="text-center align-middle">기존관리번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="existingManagementNumber">
						</td>
						<th class="text-center align-middle">계측기명</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="measuringInstrumentName">
						</td>
						<th class="text-center align-middle">모델명</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="modelName">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">규격</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="specification">
						</td>
						<th class="text-center align-middle">기기고유번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="deviceUniqueNumber">
						</td>
						<th class="text-center align-middle"><span style="color:#ff0000;">*</span>등록일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup managementNumberGroup" id="registrationDate">
						</td>
						<th class="text-center align-middle">사용부서</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="departmentInUse">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">제작사/국가</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="manufacturerCountry">
						</td>
						<th class="text-center align-middle">발주번호(품의번호)</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup priceGroup" id="orderNumber">
						</td>
						<th class="text-center align-middle">구입가격</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup priceGroup" id="purchasePrice" onkeyup="numberFormat(this,'float')">
						</td>
						<th class="text-center align-middle">검교정기관</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="calibrationOrganization">
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">교정일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup calibrationCycle" id="calibrationDate">
						</td>
						<th class="text-center align-middle">교정주기</th>
						<td class="text-center align-middle">
							<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
								<input type="text" class="form-control text-end inputGroup calibrationCycle" id="calibrationCycle_tec" onkeyup="numberFormat(this,'int')">
								<select class="form-select h-100 calibrationCycle" id="calibrationCycle_type">
									<option value="" selected>선택</option>
									<option value="Y">년</option>
									<option value="M">개월</option>
									<option value="W">주</option>
									<option value="D">일</option>
								</select>
							</div>
						</td>
						<th class="text-center align-middle">교정번호</th>
						<td class="text-center align-middle">
							<input type="text" class="form-control inputGroup" id="calibrationNumber">
						</td>
						<th class="text-center align-middle">차기교정일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup" id="nextCalibrationDate" disabled>
						</td>
					</tr>
					<tr>
						<th class="text-center align-middle">폐기일</th>
						<td class="text-center align-middle">
							<input type="date" class="form-control inputGroup" id="disposeDate">
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
	let measuringInstrumentIdx = '';

	$('#startDate').val(moment().subtract('w',1).format('YYYY-MM-DD HH:mm'));
	$('#endDate').val(moment().format('YYYY-MM-DD HH:mm'));

	// 계측기관리 목록조회
	$('#measuringInstrumentTable thead tr').clone(true).addClass('filters').appendTo('#measuringInstrumentTable thead'); // filter 생성
	let measuringInstrumentTable = $('#measuringInstrumentTable').DataTable({
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
			url : '<c:url value="/em/measuringInstrumentList"/>',
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
			{ data: 'idx', className : 'text-center'},
			{ data: 'managementNumber', className : 'text-center'},
			{ data: 'existingManagementNumber', className : 'text-center'},
			{ data: 'base64', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<img src="data:image/'+row['fileExt']+';base64,'+row['base64']+'" style="width: 100%; object-fit: scale-down; height: 100%;">';
					} else {
						return '-';
					}
				}
			},
			{ data: 'measuringInstrumentName', className : 'text-center'},
			{ data: 'modelName', className : 'text-center'},
			{ data: 'specification', className : 'text-center'},
			{ data: 'deviceUniqueNumber', className : 'text-center'},
			{ data: 'registrationDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'departmentInUse', className : 'text-center'},
			{ data: 'manufacturerCountry', className : 'text-center'},
			{ data: 'orderNumber', className : 'text-center'},
			{ data: 'purchasePrice', className : 'text-end',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return addCommas(parseFloat(data));
					} else {
						return '';
					}
				}
			},
			{ data: 'calibrationCycle', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						let calibrationCycle_tec = data.split('_')[0];
						let calibrationCycle_type = data.split('_')[1];
						if(calibrationCycle_type == 'Y') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+calibrationCycle_tec+'년</div>';
						} else if(calibrationCycle_type == 'M') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+calibrationCycle_tec+'개월</div>';
						} else if(calibrationCycle_type == 'W') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+calibrationCycle_tec+'주</div>';
						} else if(calibrationCycle_type == 'D') {
							return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+calibrationCycle_tec+'일</div>';
						} else {
							return '';
						}
					} else {
						return '';
					}
				}
			},
			{ data: 'calibrationDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'calibrationNumber', className : 'text-center'},
			{ className : 'text-center',
				render: function(data, type, row, meta) {
					if(row['calibrationCycle'] != '' && row['calibrationDate'] != '') {
						let calibrationCycle_tec = row['calibrationCycle'].split('_')[0];
						let calibrationCycle_type = row['calibrationCycle'].split('_')[1];
						let nextCalibrationDate = moment(row['calibrationDate']);
						let nowDate = moment();
						
						while(true && row['calibrationDate'] != '' && calibrationCycle_tec != '') {
							if(calibrationCycle_type == 'Y') {
								nextCalibrationDate = moment(nextCalibrationDate).add('Y', parseInt(calibrationCycle_tec));
							} else if(calibrationCycle_type == 'M') {
								nextCalibrationDate = moment(nextCalibrationDate).add('M', parseInt(calibrationCycle_tec));
							} else if(calibrationCycle_type == 'W') {
								nextCalibrationDate = moment(nextCalibrationDate).add('w', parseInt(calibrationCycle_tec));
							} else if(calibrationCycle_type == 'D') {
								nextCalibrationDate = moment(nextCalibrationDate).add('d', parseInt(calibrationCycle_tec));
							} else {
								nextCalibrationDate = moment();
							}

							if(nextCalibrationDate.diff(nowDate) >= 0) {
								break;
							}
						}

						return moment(nextCalibrationDate).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{ data: 'disposeDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null && data != '') {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment(data).format('YYYY-MM-DD')+'</div>';
					} else {
						return '';
					}
				}
			},
			{ data: 'calibrationOrganization', className : 'text-center'},
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
			let theadHeight = parseFloat($('#measuringInstrumentTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#measuringInstrumentTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#measuringInstrumentTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	measuringInstrumentTable.on('column-reorder', function( e, settings, details ) {
		let api = measuringInstrumentTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#measuringInstrumentTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		measuringInstrumentTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100)
	});

	// 관리번호 채번
	$('.managementNumberGroup').on('change keyup', function() {
		let registrationDate = $('#registrationDate').val();
		
		registrationDate = registrationDate==''?'______':moment(registrationDate).format('YYYYMM');
		
		$('#managementNumber').val("D(공기)"+"-"+registrationDate+"-"+"__");
	});

	// 차기교정일 계산
	$('.calibrationCycle').on('change keyup', function() {
		let calibrationCycle_tec = $('#calibrationCycle_tec').val();
		let calibrationCycle_type = $('#calibrationCycle_type').val();
		let nextCalibrationDate = moment($('#calibrationDate').val());
		let nowDate = moment();
		
		while(true && $('#calibrationDate').val() != '' && calibrationCycle_tec != '') {
			if(calibrationCycle_type == 'Y') {
				nextCalibrationDate = moment(nextCalibrationDate).add('Y', parseInt(calibrationCycle_tec));
			} else if(calibrationCycle_type == 'M') {
				nextCalibrationDate = moment(nextCalibrationDate).add('M', parseInt(calibrationCycle_tec));
			} else if(calibrationCycle_type == 'W') {
				nextCalibrationDate = moment(nextCalibrationDate).add('w', parseInt(calibrationCycle_tec));
			} else if(calibrationCycle_type == 'D') {
				nextCalibrationDate = moment(nextCalibrationDate).add('d', parseInt(calibrationCycle_tec));
			} else {
				nextCalibrationDate = moment();
			}

			if(nextCalibrationDate.diff(nowDate) >= 0) {
				break;
			}
		}

		$('#nextCalibrationDate').val(moment(nextCalibrationDate).format('YYYY-MM-DD'));
	});

	// 등록 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록

		measuringInstrumentIdx = '';
		$('.inputGroup').val('');
		$('#managementNumber').val("D(공기)-______-__");
		$('#calibrationCycle_tec').val('1');
		$('#calibrationCycle_type').val('');
		$('#purchasePrice').val('0');

		imageList = [];
		$('.measuringInstrumentFile').remove();
		
		$('#addEditModal').modal('show');
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');

		if($('#registrationDate').val() == '') {
			toastr.warning('등록일을 선택해주세요.');
			$('#registrationDate').focus();
			return false;
		}
		if($('#useYn').val() == '') {
			toastr.warning('사용여부를 선택해주세요.');
			$('#useYn').focus();
			return false;
		}
		
		// 등록할 경우에
		if(saveType == 'insert') {
			let measuringInstrumentFileList = [];
			
			for(var i=0;i<imageList.length;i++) {
				let obj = {};
				let fileFormData = new FormData();
				fileFormData.append(0, imageList[i].file);
				fileFormData.append('uuid', imageList[i].uuid);
				fileFormData.append('ext', imageList[i].fileType);
				fileUpload(fileFormData).then( (value) => {});
				obj.measuringInstrumentIdx = measuringInstrumentIdx;
				obj.uuid = imageList[i].uuid;
				obj.fileName = imageList[i].fileName;
				obj.fileExt = imageList[i].fileType;

				if(OS.indexOf("windows") == 0) {
					obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
				} else {
					obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
				}
				
				measuringInstrumentFileList.push(obj);
			}
			
			$.ajax({
				url: '<c:url value="/em/measuringInstrumentIns"/>',
	            type: 'POST',
	            data: {
	            	'managementNumber' : $('#managementNumber').val(),
	            	'existingManagementNumber' : $('#existingManagementNumber').val(),
	            	'measuringInstrumentName' : $('#measuringInstrumentName').val(),
	            	'modelName' : $('#modelName').val(),
	            	'specification' : $('#specification').val(),
	            	'deviceUniqueNumber' : $('#deviceUniqueNumber').val(),
	            	'registrationDate' : ($('#registrationDate').val()==''?'':moment(($('#registrationDate').val())).format('YYYYMMDD')),
	            	'departmentInUse' : $('#departmentInUse').val(),
	            	'manufacturerCountry' : $('#manufacturerCountry').val(),
	            	'orderNumber' : $('#orderNumber').val(),
	            	'purchasePrice' : ($('#purchasePrice').val()).replaceAll(',',''),
	            	'calibrationCycle' : $('#calibrationCycle_tec').val()+"_"+$('#calibrationCycle_type').val(),
	            	'calibrationDate' : ($('#calibrationDate').val()==''?'':moment(($('#calibrationDate').val())).format('YYYYMMDD')),
	            	'calibrationNumber' : $('#calibrationNumber').val(),
	            	'disposeDate' : ($('#disposeDate').val()==''?'':moment(($('#disposeDate').val())).format('YYYYMMDD')),
	            	'calibrationOrganization' : $('#calibrationOrganization').val(),
	            	'useYn' : $('#useYn').val(),
	                'measuringInstrumentFileList' : JSON.stringify(measuringInstrumentFileList)
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
			let measuringInstrumentFileList = [];
			
			for(var i=0;i<imageList.length;i++) {
				if(imageList[i].file != '') {
					let obj = {};
					let fileFormData = new FormData();
					fileFormData.append(0, imageList[i].file);
					fileFormData.append('uuid', imageList[i].uuid);
					fileFormData.append('ext', imageList[i].fileType);
					fileUpload(fileFormData).then( (value) => {});
					obj.measuringInstrumentIdx = measuringInstrumentIdx;
					obj.uuid = imageList[i].uuid;
					obj.fileName = imageList[i].fileName;
					obj.fileExt = imageList[i].fileType;

					if(OS.indexOf("windows") == 0) {
						obj.uuid = moment().format('YYYYMM[\\\\]DD[\\\\]') + obj.uuid;
					} else {
						obj.uuid = moment().format('YYYYMM/DD/') + obj.uuid;
					}
					
					measuringInstrumentFileList.push(obj);
				}
			}

			
			$.ajax({
				url: '<c:url value="/em/measuringInstrumentUpd"/>',
	            type: 'POST',
	            data: {
		            'idx' : measuringInstrumentIdx,
		            'managementNumber' : $('#managementNumber').val(),
	            	'existingManagementNumber' : $('#existingManagementNumber').val(),
	            	'measuringInstrumentName' : $('#measuringInstrumentName').val(),
	            	'modelName' : $('#modelName').val(),
	            	'specification' : $('#specification').val(),
	            	'deviceUniqueNumber' : $('#deviceUniqueNumber').val(),
	            	'registrationDate' : ($('#registrationDate').val()==''?'':moment(($('#registrationDate').val())).format('YYYYMMDD')),
	            	'departmentInUse' : $('#departmentInUse').val(),
	            	'manufacturerCountry' : $('#manufacturerCountry').val(),
	            	'orderNumber' : $('#orderNumber').val(),
	            	'purchasePrice' : ($('#purchasePrice').val()).replaceAll(',',''),
	            	'calibrationCycle' : $('#calibrationCycle_tec').val()+"_"+$('#calibrationCycle_type').val(),
	            	'calibrationDate' : ($('#calibrationDate').val()==''?'':moment(($('#calibrationDate').val())).format('YYYYMMDD')),
	            	'calibrationNumber' : $('#calibrationNumber').val(),
	            	'disposeDate' : ($('#disposeDate').val()==''?'':moment(($('#disposeDate').val())).format('YYYYMMDD')),
	            	'calibrationOrganization' : $('#calibrationOrganization').val(),
	            	'useYn' : $('#useYn').val(),
	                'measuringInstrumentFileList' : JSON.stringify(measuringInstrumentFileList)
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
		let measuringInstrumentData = measuringInstrumentTable.row(checkedNode).data();

		measuringInstrumentIdx = measuringInstrumentData.idx;
		$('#managementNumber').val(measuringInstrumentData.managementNumber);
		$('#existingManagementNumber').val(measuringInstrumentData.existingManagementNumber);
		$('#measuringInstrumentName').val(measuringInstrumentData.measuringInstrumentName);
		$('#modelName').val(measuringInstrumentData.modelName);
		$('#specification').val(measuringInstrumentData.specification);
		$('#deviceUniqueNumber').val(measuringInstrumentData.deviceUniqueNumber);
		$('#registrationDate').val(moment(measuringInstrumentData.registrationDate).format('YYYY-MM-DD'));
		$('#departmentInUse').val(measuringInstrumentData.departmentInUse);
		$('#manufacturerCountry').val(measuringInstrumentData.manufacturerCountry);
		$('#orderNumber').val(measuringInstrumentData.orderNumber);
		$('#purchasePrice').val(addCommas(parseFloat(measuringInstrumentData.purchasePrice)));
		$('#calibrationCycle_tec').val(measuringInstrumentData.calibrationCycle.split("_")[0]);
		$('#calibrationCycle_type').val(measuringInstrumentData.calibrationCycle.split("_")[1]);
		$('#calibrationDate').val(moment(measuringInstrumentData.calibrationDate).format('YYYY-MM-DD'));
		$('#calibrationNumber').val(measuringInstrumentData.calibrationNumber);
		$('#disposeDate').val(moment(measuringInstrumentData.disposeDate).format('YYYY-MM-DD'));
		$('#calibrationOrganization').val(measuringInstrumentData.calibrationOrganization);
		$('#useYn').val(measuringInstrumentData.useYn);

		$.ajax({
			url: '<c:url value="/em/measuringInstrumentFileList"/>',
            type: 'POST',
            data: {
                'measuringInstrumentIdx':	measuringInstrumentIdx
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					console.log(data);
					imageList = [];
					$('.measuringInstrumentFile').remove();

					for(var i=0;i<data.length;i++) {
						let obj = {};
	                    obj.index = i;
	                    obj.file = '';
	                    obj.uuid = data[i].uuid;
	                    obj.fileType = data[i].fileExt;
	                    obj.fileName = data[i].fileName;
	                    imageList.push(obj);
						let imageHtml = '';
		    				imageHtml += '<div class="measuringInstrumentFile moldImage exsit" id="'+data[i].uuid+'" data-idx="'+data[i].idx+'"';
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
					}
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});

		$('#addEditModal').modal('show');
	});

	// 삭제 버튼 click
	$('#btnDel').on('click', function() {
		if($('input:checkbox[name=checkGroup]:checked').length == 0) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		$('#deleteModal').modal('show');
		$('#deleteModal').data('type', 'measuringInstrument');
	});
	
	// 삭제 경고창 삭제 버튼 click
	$('#btnDeleteModalY').on('click', function() {
		let delType = $('#deleteModal').data('type');

		if(delType == 'measuringInstrument') {
			let deleteList = [];
			$('input:checkbox[name=checkGroup]:checked').each(function(index, item) {
				let tr = $(item).parent().parent();
				let idx = measuringInstrumentTable.row(tr).data().idx;
				let obj = {};
				obj.idx = idx;
				deleteList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/em/measuringInstrumentDel"/>',
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
		} else if(delType == 'measuringInstrumentImage') {
			let node = $('#deleteModal').data('node');
			let idx = $(node).parent().data('idx');
			
			$.ajax({
				url: '<c:url value="/em/measuringInstrumentFileDel"/>',
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
		}
		
		
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
	        				imageHtml += '<div class="measuringInstrumentFile moldImage" id="'+obj.uuid+'"';
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
			$('#deleteModal').data('type', 'measuringInstrumentImage');
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
</script>

</body>
</html>
