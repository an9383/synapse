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
																		  grid-template-columns: 3fr 4px 7fr;">
	<div id="leftcol">
		<div class="container-fluid h-100" style="padding: 5px;">
			<div class="row" id="leftHeader" style="padding-bottom: 5px;">
				<div class="d-flex align-items-center d-flex">
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">프로젝트 기간</label>
					<input type="date" class="form-control w-auto h-100 me-1" id="startDate">
					<label class="form-label d-flex align-items-center m-0 me-1 h-100">~</label>
					<input type="date" class="form-control w-auto h-100 me-3" id="endDate">
					<input type="text" class="form-control w-auto h-100 me-1 d-none" id="searchAll" placeholder="통합검색" >
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnSearch"><i class="fa-regular fa-clipboard"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnOpen"><i class="fa-solid fa-caret-left"></i></button>
					</div>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered p-0 m-0" id="projectTable">
					<thead class="table-light">
						<tr>
							<th class="text-center">프로젝트번호</th>
							<th class="text-center">수주처</th>
							<th class="text-center">품명</th>
							<th class="text-center">납기일</th>
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
					<label class="form-label d-flex align-items-center header-label m-0 me-1 h-100">Version</label>
					<select class="form-select w-auto h-100 me-3" id="selectVersion"></select>
				</div>
				<div class="me-lg-auto"></div>
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew" disabled><i class="fa-solid fa-plus"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnSave" disabled><i class="fa-regular fa-floppy-disk"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit" disabled><i class="fa-regular fa-pen-to-square"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnCancel" disabled><i class="fa-solid fa-xmark"></i></button>
						<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
					</div>
				</div>
			</div>
			<div class="row" style="height: calc(100vh - 47px); overflow: auto;">
				<table class="table table-bordered p-0 m-0">
					<colgroup>
						<col width="45px">
						<col width="30%">
						<col width="50px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
						<col width="200px">
					</colgroup>
					<thead class="table-light">
						<tr>
							<th class="text-center align-middle" rowspan="2">ID</th>
							<th class="text-center align-middle" rowspan="2">Process Name</th>
							<th class="text-center align-middle" rowspan="2">Period<br>(Day)</th>
							<th class="text-center align-middle" colspan="2" style="width: 250px;">계획</th>
							<th class="text-center align-middle" colspan="2" style="width: 250px;">실적</th>
							<th class="text-center align-middle" rowspan="2">Completion<br>Rate</th>
							<th class="text-center align-middle" rowspan="2">비고</th>
						</tr>
						<tr>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
							<th class="text-center">시작일</th>
							<th class="text-center">종료일</th>
						</tr>
					</thead>
					<tbody id="projectPlanTable">
						<tr>
							<td class="text-center align-middle" colspan="9" style="font-size: 25px; font-weight: 900;">프로젝트를 선택해주세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 버전명 입력 모달 -->
<div class="modal fade" id="projectPlanVersionModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					생성하실 버젼명을 입력해주세요.
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" id="btnVersionSave"><i class="fa-regular fa-floppy-disk"></i></button>
				</div>
			</div>
			<div class="modal-body">
				<input type="text" class="form-control" id="projectPlanVersion" placeholder="버전명 입력...(최대50자)" max="50">
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
	
	$('#btnOpen').on('click',function() { // right-box 열기버튼 클릭
		if($('#rightcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '0fr 4px 7fr');
			$('#leftcol').addClass('d-none');
			$('#rightcol').removeClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
	$('#btnClose').on('click',function() { // right-box 닫기버튼 클릭
		if($('#leftcol').hasClass('d-none')){
			$('#page').css('grid-template-columns', '3fr 4px 7fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').removeClass('d-none');
		} else {
			$('#page').css('grid-template-columns', '3fr 4px 0fr');
			$('#leftcol').removeClass('d-none');
			$('#rightcol').addClass('d-none');
		}
		dataTableDrawAll(); // dataTable 전체 reload
	});
	
</script>

<script>
	WM_init('new');
	WM_init('edit');

	$('#startDate').val(moment().format('YYYY-MM-DD'));
	$('#endDate').val(moment().format('YYYY-MM-DD'));

	$('#selectVersion').append('<option>선택</option>');

	let projectPlanData = [];
	let prjCd = '';
	let serialNo = '';
	let versionNo = '';

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
			url : '<c:url value="/bs/bizOrderAdmLst"/>',
			type : 'POST',
			data : {
				'startDate': function() { return $('#startDate').val(); },
				'endDate': function() { return $('#endDate').val(); },
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'projectCd', className : 'text-center'},
			{ data: 'goodsNm', className : 'text-center'},
			{ data: 'goodsNm', className : 'text-center'},
			{ data: 'targetDate', className : 'text-center',
				render: function(data, type, row, meta) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
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
			let theadHeight = parseFloat($('#projectTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
			$('#projectTable_wrapper').find.eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
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
		projectTable.ajax.reload(function() {});

		setTimeout(function() {
			$('#my-spinner').hide();
		}, 100);
	});

	// 버전 변경 onchange
	$('#selectVersion').on('change', function() {
		$('#my-spinner').show();
		versionNo = $(this).val();
		versionState = $('#selectVersion :selected').data('version');
		if(versionState == 'old') {
			$('#btnEdit').attr('disabled', false); // 수정 버튼
		} else {
			$('#btnEdit').attr('disabled', true); // 수정 버튼
		}
		setTimeout(function() {
			getProjectPlanList();
			$('#my-spinner').hide();
		}, 100);
	});

	// 프로젝트 버전 목록 조회
	function getProjectPlanVersionList(prjCd, serialNo) {
		$.ajax({
			url: '<c:url value="/bs/projectPlanVersionLst"/>',
            type: 'POST',
            async: false,
            data: {
                'prjCd':	prjCd,
                'serialNo': serialNo
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					data = res.data;

					console.log(data);

					$('#selectVersion').empty();
					if(data.length == 0) {
						versionNo = versionNo;
						$('#selectVersion').append('<option value="init" data-version="recent" selected>init</option>');
						$('#btnEdit').attr('disabled', false); // 수정 버튼
					}
					for(var i=0;i<data.length;i++) {
						if(i==0) {
							versionNo = data[i].versionNo;
							$('#selectVersion').append('<option value="'+data[i].versionNo+'" data-version="old" selected>'+data[i].versionNo+'</option>');
						} else {
							$('#selectVersion').append('<option value="'+data[i].versionNo+'" data-version="recent">'+data[i].versionNo+'</option>');
						}
					}
					
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// 프로젝트 일정표 조회
	function getProjectPlanList() {
		$.ajax({
			url: '<c:url value="/bs/projectPlanLst"/>',
            type: 'POST',
            async: false,
            data: {
                'prjCd':	prjCd,
                'serialNo': serialNo,
                'versionNo': versionNo
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					projectPlanData = res.data;

					$('#projectPlanTable').empty();
					
					let html = '';
					let L_index = 0;
					let M_index = 0;
					let S_index = 0;
					for(var i=0;i<projectPlanData.length;i++) {
						let idx = projectPlanData[i].idx;
						let lmsType = projectPlanData[i].lmsType;
						let planStartDate = projectPlanData[i].planStartDate==''?'':moment(projectPlanData[i].planStartDate).format('YYYY-MM-DD');
						let planEndDate = projectPlanData[i].planEndDate==''?'':moment(projectPlanData[i].planEndDate).format('YYYY-MM-DD');
						let performStartDate = projectPlanData[i].performStartDate==''?'':moment(projectPlanData[i].performStartDate).format('YYYY-MM-DD');
						let performEndDate = projectPlanData[i].performEndDate==''?'':moment(projectPlanData[i].performEndDate).format('YYYY-MM-DD');
						let completionRate = projectPlanData[i].completionRate==''?'0':projectPlanData[i].completionRate;
						
						let backgroundColor = '';
						if(lmsType == "L") {
							backgroundColor = '#85db18';
						} else if(lmsType == "M") {
							backgroundColor = '#cee755';
						} else if(lmsType == "S") {
							backgroundColor = '#f5f6d4';
						} else {
							backgroundColor = '#ffffff';
						}
						let fontColor_sd = ''; // 실적 시작일 글자색
						let fontColor_ed = ''; // 실적 종료일 글자색
						let fontColor_cr = ''; // Completion Rate 글자색

						let sd_diff = moment.duration(moment(performStartDate).diff(planStartDate)).asSeconds();
						let ed_diff = moment.duration(moment(performEndDate).diff(planEndDate)).asSeconds();
						console.log(ed_diff);

						if(sd_diff>0) {
							fontColor_sd = '#ff0000';
						} else {
							fontColor_sd = '#000000';
						}

						if(ed_diff>0) {
							fontColor_ed = '#ff0000';
						} else {
							fontColor_ed = '#000000';
						}
						
						
						if(completionRate < 20) {
							fontColor_cr = '#ff0000';
						} else if(completionRate < 50) {
							fontColor_cr = '#ffff00';
						} else {
							fontColor_cr = '#000000';
						}
						
						html += '<tr style="background-color: '+backgroundColor+';" data-idx="'+idx+'" data-lmstype="'+lmsType+'">';
						if(lmsType == "L") {
							L_index++;
							M_index = 0;
							S_index = 0;
							html += '	<td style="vertical-align: middle;">'+L_index+'</td>';
							html += '	<td>';
							html += '		<input type="text" class="form-control plan_input_form d-none" value="'+projectPlanData[i].largeNm+'" data-val="'+projectPlanData[i].largeNm+'" style="width: 100%;">';
							html += '		<div class="plan_text_form"style="width: 100%; padding: 2px 6px;">'+projectPlanData[i].largeNm+'</div>';
							html += '	</td>';
						} else if(lmsType == "M") {
							M_index++;
							S_index = 0;
							html += '	<td style="vertical-align: middle;">'+L_index+'.'+M_index+'</td>';
							html += '	<td>';
							html += '		<input type="text" class="form-control plan_input_form d-none" value="'+projectPlanData[i].mediumNm+'" data-val="'+projectPlanData[i].mediumNm+'" style="width: 90%; margin-left: 10%;">';
							html += '		<div class="plan_text_form"style="width: 90%; margin-left: 10%; padding: 2px 6px;">'+projectPlanData[i].mediumNm+'</div>';
							html += '	</td>';
						} else if(lmsType == "S") {
							S_index++;
							html += '	<td style="vertical-align: middle;">'+L_index+'.'+M_index+'.'+S_index+'</td>';
							html += '	<td>';
							html += '		<input type="text" class="form-control plan_input_form d-none" value="'+projectPlanData[i].smallNm+'" data-val="'+projectPlanData[i].smallNm+'" style="width: 80%; margin-left: 20%;">';
							html += '		<div class="plan_text_form"style="width: 80%; margin-left: 20%; padding: 2px 6px;">'+projectPlanData[i].smallNm+'</div>';
							html += '	</td>';
						}
						if(planStartDate != '' && planEndDate != '') {
							html += '	<td style="text-align: center; vertical-align: middle;">';
							html += '		'+moment.duration(moment(planEndDate).diff(planStartDate)).asDays();
							html += '	</td>';
						} else {
							html += '	<td></td>';
						}
						html += '	<td style="text-align: center; vertical-align: middle;">';
						html += '		<input type="date" class="form-control plan_input_form d-none" value="'+planStartDate+'" data-val="'+planStartDate+'">';
						html += '		<span class="plan_text_form" >'+planStartDate+'</span>';
						html += '	</td>';
						html += '	<td style="text-align: center; vertical-align: middle;">';
						html += '		<input type="date" class="form-control plan_input_form d-none" value="'+planEndDate+'" data-val="'+planEndDate+'">';
						html += '		<span class="plan_text_form">'+planEndDate+'</span>';
						html += '	</td>';
						html += '	<td style="text-align: center; vertical-align: middle;">';
						html += '		<input type="date" class="form-control plan_input_form d-none" value="'+performStartDate+'" data-val="'+performStartDate+'">';
						html += '		<span class="plan_text_form" style="color: '+fontColor_sd+';">'+performStartDate+'</span>';
						html += '	</td>';
						html += '	<td style="text-align: center; vertical-align: middle;">';
						html += '		<input type="date" class="form-control plan_input_form d-none" value="'+performEndDate+'" data-val="'+performEndDate+'">';
						html += '		<span class="plan_text_form" style="color: '+fontColor_ed+';">'+performEndDate+'</span>';
						html += '	</td>';
						html += '	<td class="text-center align-middle" style="position: relative;">';
						html += '		<input type="number" class="form-control plan_input_form text-center d-none" value="'+completionRate+'" data-val="'+completionRate+'" max="100" min="0">';
						html += '		<span class="plan_text_form" style="color: '+fontColor_cr+';">'+completionRate+'</span>';
						html += '		<span class="post_fix " style="position: absolute; right: 27px; top: 7px; color: '+fontColor_cr+';">%</span>';
						html += '	</td>';
						html += '	<td style="text-align: left; vertical-align: middle;">';
						html += '		<input type="text" class="form-control plan_input_form d-none" value="'+projectPlanData[i].projectPlanDesc+'" data-val="'+projectPlanData[i].projectPlanDesc+'">';
						html += '		<span class="plan_text_form" >'+projectPlanData[i].projectPlanDesc+'</span>';
						html += '	</td>';
						html += '</tr>';
					}
					$('#projectPlanTable').html(html);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			}
		});
	}

	// 프로젝트 목록 click
	$('#projectTable tbody').on('click','tr', function() {
		$('#my-spinner').show();

		prjCd = projectTable.row(this).data().projectCd;
		serialNo = '';
		
		
		//if(WMCheck('new')) { // 신규등록중일 경우
		//	setWM('new', 'idx', idx);
		//	return false;
		//}
		//if(WMCheck('edit')) { // 수정중일 경우
		//	setWM('edit', 'idx', idx);
		//	return false;
		//}
		
		$('#selectVersion').attr('disabled', false); // Version
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼
		

		setTimeout(function() {
			getProjectPlanVersionList(prjCd, serialNo);
			getProjectPlanList();
			$('#my-spinner').hide();
		}, 100);
	});

	// 작업중 경고 모달 예 버튼 click
	$('#btnWorkingWarningModalY').on('click', function() {
		if(WMlastIdx == 'new' || WMlastIdx == 'edit') { // 등록중이거나 수정중이였을 경우
			$('#btnSave').trigger('click');
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
				projectTable.row('#'+idx).select();
				$(projectTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
			} else {
				WM_action_OFF(WMlastIdx);
				if(window.location != window.parent.location) { // tab일 경우
					// 부모 탭 닫기버튼 click
					$('#tab-list', parent.document).find('.active').find('span').eq(1).find('i').trigger('click');
			    }
				
				$('#btnNew').attr('disabled', false); // 신규 버튼
				$('#btnSave').attr('disabled', true); // 저장 버튼
				$('#btnEdit').attr('disabled', true); // 수정 버튼
				$('#btnCancel').attr('disabled', true); // 취소 버튼
			}
			
			return false;
		}
	});

	// 버전명 입력부분 enter
	$('#projectPlanVersion').keypress(function (e) {
		if (e.which == 13) {
			$('#btnVersionSave').trigger('click');
		}
	});

	// 버전명 저장 버튼 click
	$('#btnVersionSave').on('click', function() {
		$('#my-spinner').show();
		// 초기값 확인
		let initVersion = versionNo;
		
		versionNo = $('#projectPlanVersion').val();
		if(versionNo == '') {
			toastr.warning('버전명을 입력해주세요.');
			return false;
		}

		setTimeout(function() {
			$.ajax({
				url: '<c:url value="/bs/projectPlanVersionExistCheck"/>',
	            type: 'POST',
	            async: false,
	            data: {
	                'prjCd':	prjCd,
	                'serialNo': serialNo,
	                'versionNo': versionNo
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						existCount = res.existCount;
						if(existCount == 0) {
							// 첫 버전일 경우
							if(initVersion == '') {
								$('#selectVersion').empty();
							}
							
							$('#selectVersion').append('<option value="'+versionNo+'" selected>'+versionNo+'</option>');
							$('#projectPlanVersionModal').modal('hide');
						} else {
							toastr.warning('이미 존재하는 버전번호입니다.<br>다시 입력해주세요.');
							return false;
						}
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				}
			});
			$('#my-spinner').hide();
		}, 100);
		
		
	});

	// 신규 버튼 click
	$('#btnNew').on('click', function() {
		$('#btnSave').data('saveType','insert'); // 저장 방식 -> 등록
		
		WM_action_ON('new', 'workingWarningModal');
		
		$('.plan_input_form').removeClass('d-none');
		$('.plan_text_form').addClass('d-none');

		$('#selectVersion').attr('disabled', true); // Version
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼

		$('#outUser').addClass('d-none'); //거래처 비활성화

		$('#projectPlanVersionModal').modal('show');
		setTimeout(function() {
			$('#projectPlanVersion').focus();
		}, 500);
	});

	// 저장 버튼 click
	$('#btnSave').on('click', function() {
		let saveType = $(this).data('saveType');
		
		// 등록할 경우에
		if(saveType == 'insert') {
			let insertList = [];
			$('#projectPlanTable').find('tr').each(function(index, item) {
				let tr = $(item);
				let td = $(tr).find('td');
				let obj = {};
				obj.prjCd = prjCd;
				obj.serialNo = serialNo;
				obj.versionNo = versionNo;
				obj.planId = $(td).eq(0).html();
				obj.lmsType = $(tr).data('lmstype');
				if(obj.lmsType == 'L') {
					obj.largeNm = $(td).eq(1).find('input').val();
					obj.mediumNm = '';
					obj.smallNm = '';
				} else if(obj.lmsType == 'M') {
					obj.largeNm = '';
					obj.mediumNm = $(td).eq(1).find('input').val();
					obj.smallNm = '';
				} else if(obj.lmsType == 'S') {
					obj.largeNm = '';
					obj.mediumNm = '';
					obj.smallNm = $(td).eq(1).find('input').val();
				}
				obj.planStartDate = $(td).eq(3).find('input').val().replaceAll('-','');
				obj.planEndDate = $(td).eq(4).find('input').val().replaceAll('-','');
				obj.performStartDate = $(td).eq(5).find('input').val().replaceAll('-','');
				obj.performEndDate = $(td).eq(6).find('input').val().replaceAll('-','');
				obj.completionRate = $(td).eq(7).find('input').val().replaceAll('-','');
				obj.projectPlanDesc = $(td).eq(8).find('input').val();
				insertList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/bs/projectPlanIns"/>',
	            type: 'POST',
	            data: {
	                'insertList' : JSON.stringify(insertList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('신규 저장되었습니다.');

						$('#projectTable').find('.selected').trigger('click');

						WM_action_OFF('new');

						$('.plan_input_form').addClass('d-none');
						$('.plan_text_form').removeClass('d-none');
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', false); // 수정 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else { // 수정할 경우에
			let updateList = [];
			$('#projectPlanTable').find('tr').each(function(index, item) {
				let tr = $(item);
				let td = $(tr).find('td');
				let obj = {};
				obj.idx = $(tr).data('idx');
				obj.prjCd = prjCd;
				obj.serialNo = serialNo;
				obj.versionNo = versionNo;
				obj.planId = $(td).eq(0).html();
				obj.lmsType = $(tr).data('lmstype');
				if(obj.lmsType == 'L') {
					obj.largeNm = $(td).eq(1).find('input').val();
					obj.mediumNm = '';
					obj.smallNm = '';
				} else if(obj.lmsType == 'M') {
					obj.largeNm = '';
					obj.mediumNm = $(td).eq(1).find('input').val();
					obj.smallNm = '';
				} else if(obj.lmsType == 'S') {
					obj.largeNm = '';
					obj.mediumNm = '';
					obj.smallNm = $(td).eq(1).find('input').val();
				}
				obj.planStartDate = $(td).eq(3).find('input').val().replaceAll('-','');
				obj.planEndDate = $(td).eq(4).find('input').val().replaceAll('-','');
				obj.performStartDate = $(td).eq(5).find('input').val().replaceAll('-','');
				obj.performEndDate = $(td).eq(6).find('input').val().replaceAll('-','');
				obj.completionRate = $(td).eq(7).find('input').val().replaceAll('-','');
				obj.projectPlanDesc = $(td).eq(8).find('input').val();
				updateList.push(obj);
			});
			
			$.ajax({
				url: '<c:url value="/bs/projectPlanUpd"/>',
	            type: 'POST',
	            data: {
	                'updateList' : JSON.stringify(updateList)
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('수정 저장되었습니다.');

						$('#projectTable').find('.selected').trigger('click');

						WM_action_OFF('edit');
						
						$('#btnNew').attr('disabled', false); // 신규 버튼
						$('#btnSave').attr('disabled', true); // 저장 버튼
						$('#btnEdit').attr('disabled', true); // 수정 버튼
						$('#btnCancel').attr('disabled', true); // 취소 버튼

						let idx = projectTable.row('.selected').data().idx;
						projectTable.row('#'+idx).select();
						$(projectTable.row('#'+idx).node()).trigger('click'); // 선택했던 항목 선택처리
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

		$('.plan_input_form').removeClass('d-none');
		$('.plan_text_form').addClass('d-none');

		$('#selectVersion').attr('disabled', true); // Version
		$('#btnNew').attr('disabled', true); // 신규 버튼
		$('#btnSave').attr('disabled', false); // 저장 버튼
		$('#btnEdit').attr('disabled', true); // 수정 버튼
		$('#btnCancel').attr('disabled', false); // 취소 버튼
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

		getProjectPlanVersionList(prjCd, serialNo);

		$('.plan_input_form').addClass('d-none');
		$('.plan_text_form').removeClass('d-none');

		$('#selectVersion').attr('disabled', false); // Version
		$('#btnNew').attr('disabled', false); // 신규 버튼
		$('#btnSave').attr('disabled', true); // 저장 버튼
		$('#btnEdit').attr('disabled', false); // 수정 버튼
		$('#btnCancel').attr('disabled', true); // 취소 버튼

		$('#outUser').addClass('d-none'); //거래처 비활성화
	});
</script>

</body>
</html>
