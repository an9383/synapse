<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp"%>
<%@include file="../layout/script.jsp"%>
<%@include file="../layout/header.jsp"%>
<%@include file="../layout/aside.jsp"%>
<%@include file="../layout/body-top.jsp"%>

<div id="my-spinner">
	<div>
		<span> <img src="<c:url value='/resources/assets/images/spinner.gif'/>">
		</span>
	</div>
</div>
<div class="container-fluid p-1 h-100">
	<div class="row" style="background-color: #ffffff; height: calc(100vh - 53px);">
		<div id="alarmDiv" class="row" style="width: 80%;margin-left: auto;margin-right: auto;">
			<div style="width:100%;">
				<div class="d-flex align-items-center justify-content-end">
					<div class="btn-group" role="group" aria-label="Small button group">
						<button type="button" class="btn btn-outline-light w-auto " style="font-size: 18px !important;" id="btnBatchCheck">일괄확인</i></button>
					</div>
				</div>
				<div class="row" style="padding: 5px;">
					<table class="table table-bordered p-0 m-0" id="alarmTable">
						<thead class="table-light">
							<tr>
								<th class="text-center">발생일시</th>
								<th class="text-center">발생부서</th>
								<th class="text-center">프로젝트번호</th>
								<th class="text-center">Module Name</th>
								<th class="text-center">내용</th>
								<th class="text-center">대상부서</th>
								<th class="text-center">대상자</th>
								<th class="text-center">확인여부</th>
								<th class="text-center">확인일시</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-12" id="main" data-state="false"></div>
	</div>
</div>
<!-- 전체닫기 경고 -->
<div class="modal fade" id="closeTabModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> 경고
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				탭을 닫게될 경우에 작업중인 내용이 사라지게됩니다.<br>탭을 닫으시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="closeTabModalY" data-bs-dismiss="modal" style="width: 70px;">
					예
				</button>
				<button type="button" class="btn btn-secondary" id="closeTabModalN" data-bs-dismiss="modal" style="width: 70px;">
					아니요
				</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="closeTabAllModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fa-solid fa-triangle-exclamation text-danger"></i> 경고
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				모든 탭을 닫게될 경우에 작업중인 내용이 사라지게됩니다.<br>모든 탭을 닫으시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="closeTabAllModalY" data-bs-dismiss="modal" style="width: 70px;">
					예
				</button>
				<button type="button" class="btn btn-secondary" id="closeTabAllModalN" data-bs-dismiss="modal" style="width: 70px;">
					아니요
				</button>
			</div>
		</div>
	</div>
</div>
<style>
	.nav-tabs .nav-link:hover:not(.active) {
		color: #3daf33 !important;
		background-color: #ffffff;
		border-top-color: #ffffff !important;
		border-left-color: #ffffff !important;
		border-right-color: #ffffff !important;
	}
</style>

<%@include file="../layout/body-bottom.jsp"%>
<script>
	window.onbeforeunload = function(event){
	}

	//메뉴클릭이벤트와 sideNav에서 mouseleave이벤트 겹쳐발생해서 트리거 형태로 변수선언해서 사용 
	let isClickEvent = false;

	$('#headerSubName').text('대시보드'); // 메뉴명
	$('#headerMainName').text('메인'); // 메뉴명
	$(document).on('click', 'aside a',function(event) { // 메뉴 클릭
		isClickEvent  = true;
		event.preventDefault();
	    event.stopPropagation();
	    $('#alarmDiv').addClass('d-none');
		let id = $(this).parent().data('id').replaceAll(/-/g,'_'); // tab ID
		let title = $(this).parent().data('title'); // tab ID
		let name = $(this).parent().data('name'); // tab NAME
		let src = '/'+$(this).parent().data('path'); // tab SRC
		
		changeHeaderName(title, name); // header명 변경
		
		if($('#main').data('state')) { // main이 있을 경우
			if($('#tab-list-contents').find('#'+id).length == 0) { // 해당 화면이 열려있지 않을 경우
				$('#my-spinner').show();
				$('#tabList').append(makeMainTab({
					action: '',
					id: id,
					title: title,
					name: name
				}));
				$('#tab-list-contents').append(makeSubTab({
					id: id,
					src: src
				}));
			} else { // 해당 화면이 열려있을 경우
				$('#nav-'+id).trigger('click');
				$('#'+id).find('iframe').get(0).contentWindow.dataTableDrawAll();
			}
		} else { // main이 없을 경우
			$('#my-spinner').show();
			$('#main').append(makeTab());
			$('#tabList').append(makeMainTab({
				action: 'active',
				id: id,
				title: title,
				name: name
			}));
			$('#tab-list-contents').append(makeSubTab({
				id: id,
				src: src
			}));
			$('#main').data('state',true);

			Sortable.create(tabList, {
				group: "schedule",
				handle: ".dragableModule",
				sort: true
			});
		}

		
		$('#nav-'+id).off('click');
		$('#nav-'+id).on('click', function() {
			setTimeout(function() {
				$('#'+id).find('iframe').get(0).contentWindow.dataTableDrawAll();

				// 탭간 이동처리 모음 ==============================================================
				if(id == 'bm_bmsc0030') { // 제품코드등록 화면 이동할 경우
					let itemIdx = $('#'+id.replaceAll(/_/g,'-')).data('itemIdx');
					let gubun = $('#'+id.replaceAll(/_/g,'-')).data('gubun');
					if(itemIdx != '') {
						if(gubun == 'dblClick'){
							$('#'+id).find('iframe').get(0).contentWindow.itemInfoTableClick(itemIdx);
						} else if(gubun == 'copy'){
							$('#'+id).find('iframe').get(0).contentWindow.itemInfoTableCopy(itemIdx);
						}
						$('#'+id.replaceAll(/_/g,'-')).data('itemIdx','');
					}
					
					/* $('#'+id).find('iframe').contents().find('#itemInfoTable tbody').find('tr#'+itemIdx).trigger('click');
					console.log($('#'+id).find('iframe').contents().find('#itemInfoTable').DataTable());
					$('#'+id).find('iframe').get(0).contentWindow.itemInfoTable.row('#'+itemIdx).select(); */
				}
			}, 100);
		});

		$('#'+id).find('iframe').off('load');
		$('#'+id).find('iframe').on('load', function() {
			$('#nav-'+id).trigger('click');
			
			_promise_().then(()=>{
				$('#my-spinner').hide();	
			}).then(()=>{
				setTimeout(function(){
					if( !$('#sideNav').is(':hover') ){
						$('#sideBackground').css('width','0px');
						$('#sideNav').hide(300);
					}
				},50);
				
			});
		});
		
	});

	$('#sideNav').on('mouseleave',function(e){
		if(!isClickEvent){
			if($('#sideNav').css('display') == 'none'){
			} else {
				$('#sideBackground').css('width','0px');
				$('#sideNav').hide(300);
			}
		} else{
			isClickEvent = false;
		}
	});

	// TAB mousedown 이벤트
	$(document).on('mousedown','.nav-link', function() {
		$(this).trigger('click');
	})

	function makeMainTab(obj) {
		let html = '';
			html += '	<button class="nav-link '+obj.action+' dragableModule" id="nav-'+obj.id+'" onclick="changeHeaderName(\''+obj.title+'\', \''+obj.name+'\');" data-bs-toggle="tab" data-bs-target="#'+obj.id+'" draggable="true">';
			html += '		<span class="me-1">'+obj.name+'</span>';
			html += '		<span><i class="fa-regular fa-x" onclick="closeTabModal(event, this,\''+obj.id+'\');"></i></span>';
			html += '	</button>';
		return html;
	}
	
	function makeSubTab(obj) {
		let html = '';
			html += '	<div class="tab-pane show active" id="'+obj.id+'" style="height: calc(100vh - 86px);">';
			html += '		<iframe class="w-100" style="height: calc(100vh - 86px);"';
			html += '				src="'+obj.src+'"></iframe>';
			html += '	</div>';
		return html;
	}

	function makeTab() {
		let html = '';
			html += '<div class="nav nav-tabs" id="tabList">';
			html += '	<button class="btn btn-outline-light w-auto px-2" onclick="closeTabAll();" style="position: absolute; right: 10px; padding: 0px 6px !important; margin-top: 4px;">';
			html += '		<i class="fa-solid fa-x" style="font-size:21px;"></i>';
			html += '	</button>';
			html += '</div>';
			html += '<div class="tab-content" id="tab-list-contents"></div>';
		return html;
	}


	function closeTab(event, node, id) {
		if($('#'+id).find('iframe').get(0).contentWindow.WMCheck()) {
			return false;
		}

		event.stopPropagation();
		
		let prevNode = $(node).parent().parent().prev(); // 왼쪽 탭
		let nextNode = $(node).parent().parent().next(); // 오른쪽 탭

		$(node).parent().parent().remove(); // 현재 탭 삭제
		$('#'+id).remove(); // 현재 탭의 content 삭제

		let tabLength = $('#tabList').find('button').length; // 총 탭 갯수

		if(tabLength == 1) { // 남은 탭이 없을 경우(전체닫기 버튼 1개 포함)
			$('#main').data('state',false).empty();
			changeHeaderName('대시보드', '메인');
			$('#alarmDiv').removeClass('d-none');
			alarmTable.ajax.reload(function() {});
		} else { // 남은 탭이 있을 경우
			if($(nextNode).length != 0) { // 우측에 남은 탭이 있을 경우
				$(nextNode).trigger('click'); // 우측에 남은 탭 클릭
			} else { // 우측에 남은 탭이 없을 경우
				$(prevNode).trigger('click'); // 좌측에 남은 탭 클릭
			}
		}
	}

	function closeTabModal(event, node, id) {
		$('#closeTabModal').modal('show');
		$('#closeTabModalY').data({ event, node, id });
	}

	$(document).on('click', '#closeTabModalY', function() {
		let { event, node, id } = $(this).data();
		closeTab(event, node, id);
	});
	

	function closeTabAll() {
		$('#closeTabAllModal').modal('show');
	}

	$(document).on('click', '#closeTabAllModalY', function() {
		$('#main').data('state',false).empty();
		changeHeaderName('대시보드', '메인');
		$('#alarmDiv').removeClass('d-none');
		alarmTable.ajax.reload(function() {});
	});

	// 우측 상단 메뉴명 변경
	function changeHeaderName(title, name) {
		$('#headerSubName').text(title); // 대메뉴명
		$('#headerMainName').text(name); // 메뉴명
	}

	// 제품코드조회 화면에서 제품 dblckick 할때 제품코드등록화면의 해당 제품 선택처리를 위한 함수
	function selectItemInfoAdm(itemIdx,gubun){
		let id = 'bm-bmsc0030'; // 제품코드등록 화면 id
		$('#'+id).data('itemIdx',itemIdx);
		$('#'+id).data('gubun',gubun)
		$('#'+id).find('a').trigger('click');
	}

	//해당 탭을 열고 클릭
	function tabOpenAndClick(tabId){
		let id = tabId; // 제품코드등록 화면 id
		$('#'+id).find('a').trigger('click');
	}


	// 알람 데이터 조회
	$('#alarmTable thead tr').clone(true).addClass('filters').appendTo('#alarmTable thead'); // filter 생성
	let alarmTable = $('#alarmTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'Bp><'me-lg-auto'><'d-flex align-items-center justify-content-end'i>>",
		language: lang_kor,
		info: false,
		ordering: true,
		processing: true,
		paging: false,
		lengthChange: false,
		searching: true,
		autoWidth: false,
		orderCellsTop: true,
        fixedHeader: false,
        scrollY: '80vh',
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
			url : '<c:url value="/sm/alarmLst"/>',
			type : 'GET',
			data : {
			},
		},
        rowId: 'idx',
		columns : [
			{ data: 'happenTime', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+moment((data),'YYYYMMDDHHmm').format("YYYY-MM-DD HH:mm")+'</div>';
				}
			},
			{ data: 'happenDepartmentNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'prjCd', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'moduleNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'moduleDesc', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'departmentNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'userNm', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
				}
			},
			{ data: 'checkTime', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">완료</div>';
					} else {
						return '<button type="button" class="btn btn-outline-light w-auto" onclick="alarmCheck('+row['idx']+')">확인</button>';
					}
				}
			},
			{ data: 'checkTime', className : 'text-center align-middle',
				render: function(data, type, row, meta) {
					if(data!=null) {
						return moment((data),'YYYYMMDDHHmm').format("YYYY-MM-DD HH:mm");
					} else {
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;"></div>';
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
		],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let table_id = $(api.table().node()).attr('id'); // dataTable ID
			
			let htmlHeight = parseFloat($('html').css('height'));
			let theadHeight = parseFloat($('#alarmTable_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#alarmTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control" placeholder="" />');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#alarmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	// dataTable colReorder event
	alarmTable.on('column-reorder', function( e, settings, details ) {
		let api = alarmTable;
		api.columns().eq(0).each(function (colIdx) {
			$('#alarmTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	function alarmCheck(idxValue) {
		$.ajax({
			url: '<c:url value="/sm/alarmCheckIns"/>',
            type: 'POST',
            data: {
                'idx'		:	idxValue
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					toastr.success('처리되었습니다.');
					alarmTable.ajax.reload(function() {});
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	}

	$('#btnBatchCheck').on('click', function() {
		if( $('#alarmTable').DataTable().rows().count()==0 ){
			toastr.warning('데이터가 없습니다.');
			return false;
		}
		let check = false;
		$('#alarmTable tbody').find('tr').each(function(index, item) {
				let data = alarmTable.row(index).data();
				if(data.checkTime!=null) {
					check = true;
				}
		});
		if(check) {
			$.ajax({
				url: '<c:url value="/sm/alarmCheckBatchIns"/>',
	            type: 'POST',
	            data: {
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						toastr.success('처리되었습니다.');
						alarmTable.ajax.reload(function() {});
					} else if(res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
					$('#my-spinner').hide();
				}
			});
		} else {
			toastr.warning('모두 확인된 상태입니다.');
		}
		
	});
	
</script>

</body>
</html>
