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
																		  grid-template-columns: 6fr 4px 4fr;">
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
							<thead class="thead-light">
								<tr>
									<th class="text-center">품목구분</th>
									<th class="text-center">품목구분1</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">규격</th>
									<th class="text-center">MAKER</th>
									<th class="text-center">개별발주대상</th>
									<th class="text-center">사용유무</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div><!-- /.left-list -->
			<div id="dragbar" onmousedown="StartDrag()"></div>
			<div id="rightcol">
				<div class="container-fluid h-100" style="padding: 5px;" id="formBox">
					<div class="d-flex align-items-center justify-content-end w-100" style="padding-bottom: 5px;">
						<div class="btn-group" role="group" aria-label="Small button group">
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnNew"><i class="fa-solid fa-plus"></i></button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnEdit"><i class="fa-regular fa-pen-to-square"></i></button>
							<button type="button" class="btn btn-outline-light w-auto d-none" style="font-size: 20px !important;" id="btnSave"><i class="fa-regular fa-floppy-disk"></i></button>
							<button type="button" class="btn btn-outline-light w-auto" style="font-size: 18px !important;" id="btnClose"><i class="fa-solid fa-caret-right"></i></button>
						</div>
					</div>
                    <!--/오른쪽 등록 부분 상단 버튼 영역-->
                    <!--====================TAB-UI=======================-->
					<!-- .card-header -->
					<div class="card-body p-0">
							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered p-0 m-0">
										<colgroup>
											<col width="16%">
											<col width="16%">
											<col width="16%">
											<col width="16%">
											<col width="16%">
											<col width="16%">
										</colgroup>
										<tr>
											<th class="text-center"><span style="color:#ff0000;">*</span>품목구분</th>
											<td colspan="2">
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control" id="itemGubunNm" name="itemGubunNm" disabled>
													<input type="hidden" class="form-control" id="itemGubunIdx">
													<input type="hidden" class="form-control" id="itemGubun">
													<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selItemGubun" style="padding: 1px 4px; margin-left: 0px;" disabled>
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</div>
											</td>
											<th class="text-center">품목구분1</th>
											<td colspan="2">
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control" id="itemGubun1Nm" name="itemGubun1Nm" disabled>
													<input type="hidden" class="form-control" id="itemGubun1Idx">
													<input type="hidden" class="form-control" id="itemGubun1">
												</div>
											</td>
											
										</tr>
										<tr>
											<th class="text-center">품목구분2</th>
											<td colspan="2">
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
													<input type="text" placeholder="" class="form-control" id="itemGubun2Nm" name="itemGubun2Nm" disabled>
														<input type="hidden" class="form-control" id="itemGubun2Idx">
													<input type="hidden" class="form-control" id="itemGubun2">
												</div>
											</td>
											<th class="text-center">MAKER</th>
											<td colspan="2"><input type="text" class="form-control inputGroup" style="min-width:100%;" id="maker" name="maker" disabled></td>
										</tr>
										<tr>
											<th class="text-center"><span style="color:#ff0000;">*</span>품번</th>
											<td colspan="2"><input type="text" class="form-control inputGroup" style="min-width:100%;" id="itemCd" name="itemCd" disabled></td>
											<th class="text-center"><span style="color:#ff0000;">*</span>품명</th>
											<td colspan="2"><input type="text" class="form-control inputGroup" style="min-width:100%;" id="itemNm" name="itemNm" disabled></td>
										</tr>
										<tr>
											<th class="text-center">ERP품번</th>
											<td colspan="2"><input type="text" class="form-control inputGroup" style="min-width:100%;" id="erpCd" name="erpCd" disabled></td>
											<th class="text-center">거래처명</th>
											<td colspan="2">
												<div style="display: flex; flex-wrap: 1 1 auto;" class="input-group">
												<input type="text" placeholder="거래처명" class="form-control" id="dealCorpNm" name="dealCorpNm" disabled>
												<input type="hidden" class="form-control" id="dealCorpCd">
												<button type="button" class="btn btn-primary input-sub-search inputGroup" id="selDealCorpCd" style="padding: 1px 4px; margin-left: 0px;" disabled>
													<i class="fa-solid fa-magnifying-glass"></i>
												</button>
											</div>
											</td>
										</tr>
										<tr>
											<th class="text-center align-middle">규격</th>
											<td colspan="5"><textarea class="form-control inputGroup" style="min-width:100%; height: 300px;" id="itemDc" name="itemDc"disabled></textarea></td>
										</tr>
										<tr>
											<th class="text-center"><span style="color:#ff0000;">*</span>재고단위</th>
											<td colspan="2"><input type="text" class="form-control inputGroup" style="min-width:100%;" id="unitDc" name="unitDc" disabled></td>
											<th class="text-center"><span style="color:#ff0000;">*</span>사용여부</th>
											<td colspan="2">
												<select class="form-select inputGroup" id="useYn" disabled></select>
											</td>
										</tr>
										<tr>
											<th class="text-center"><span style="color:#ff0000;">*</span>검사여부</th>
											<td colspan="2">
												<select class="form-select inputGroup"  id="inspectYn" name="inspectYn" style="min-width:100%;" >
												<option value="" selected>선택</option>
												<option value="001">검사</option>
												<option value="002">무검사</option>
												</select>
											</td>
											<th class="text-center">안전재고</th>
											<td colspan="2">
												<input type="text" class="form-control inputGroup" onkeyup="numberFormat(this,'int')" style="min-width:100%;" id="safetyStock" name="safetyStock" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center"><span style="color:#ff0000;">*</span>개별발주대상</th>
											<td colspan="2">
												<select class="form-select inputGroup" id="individualYn" disabled>
													<option value="">선택</option>
													<option value="Y">Y</option>
													<option value="N">N</option>
												</select>
											</td>
											<th class="text-center">기초단가</th>
											<td colspan="2">
												<input type="text" class="form-control inputGroup" onkeyup="numberFormat(this,'int')" style="min-width:100%;" id="unitPrice" name="unitPrice" disabled>
											</td>
										</tr>
										<tr>
											<th class="text-center">비고</th>
											<td colspan="5"><input type="text" class="form-control inputGroup mw-100" style="min-width:100%;" id="itemDesc"  name="itemDesc"></td>
										</tr>
										<tr>
											<th class="text-center" colspan="2">실물사진</th>
											<th class="text-center" colspan="2">도형</th>
											<th class="text-center" colspan="2">도면</th>
										</tr>
										<tr>
											<td colspan="2">
												<div class="text-center mb-1">
													<button id="btnItemImageView" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
													
													<button id="btnItemImageUpload" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-folder"></i>
													</button>
													<button id="btnItemImageDelete" class="btn btn-outline-danger w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-trash-can"></i>
													</button>
												</div>
												<div class="custom-file" style="height:160px;">
													<img src="" alt="등록된 사진이 없습니다." id="itemImage" style="height:100%;width: 100%;min-height:160px;max-height: 160px;border: 1px solid #000000;"
													onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													>
													<input type="file" class="d-none" id="itemImageFile">
												</div>
											</td>
											
											<td colspan="2">
												<div class="text-center mb-1">
													<button id="btnItemImageView3" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
													<button id="btnItemImageUpload3" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-folder"></i>
													</button>
													<button id="btnItemImageDelete3" class="btn btn-outline-danger w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-trash-can"></i>
													</button>
												</div>
												<div class="custom-file" style="height:160px;">
													<img src="" alt="등록된 사진이 없습니다." id="itemImage3" style="height:100%;width: 100%;min-height:160px;max-height: 160px;border: 1px solid #000000;"
													onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													>
													<input type="file" class="d-none" id="itemImageFile3">
												</div>
											</td>
											<td colspan="2">
												<div class="text-center mb-1">
													<button id="btnItemImageView2" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
													<button id="btnItemImageUpload2" class="btn btn-outline-light w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-folder"></i>
													</button>
													<button id="btnItemImageDelete2" class="btn btn-outline-danger w-auto" type="button" style="font-size: 10px !important;">
														<i class="fa-solid fa-trash-can"></i>
													</button>
												</div>
												<div class="custom-file" style="height:160px;">
													<img src="" alt="등록된 사진이 없습니다." id="itemImage2" style="height:100%;width: 100%;min-height:160px;max-height: 160px;border: 1px solid #000000;"
													onerror="this.src='<c:url value='/resources/assets/images/temp_img/no_image_white.png?ver=1.0'/>'"
													>
													<input type="file" class="d-none" id="itemImageFile2">
												</div>
											</td>
										</tr>
									</table>
								</div>                	                    
							</form>
					</div>
				</div><!-- ===/.right-sidebar 등록,수정===  -->
			</div><!-- /.row -->
		</div><!-- / #main  -->
<!-- 이미지 상세보기 모달 시작-->
<div class="modal fade" id="imgEnlargeModal" tabindex="-1" aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog"  style="max-width: 60vw;">
		<div class="modal-content" style="height: calc(100vh - 5em);">
			<div class="modal-header">
				<h5 class="modal-title">
					이미지 상세보기
				</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto" style="font-size: 20px !important;" data-bs-dismiss="modal" aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div> 
			<div class="modal-body">
				<div class="custom-file text-center" style="height:100%; max-height:600px;">
					<img src="" alt="등록된 사진이 없습니다." id="modalImage" style="height:100%;width: 100%;max-width:700px;max-height:600px;border: 1px solid #000000;">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 이미지 상세보기 모달 종료-->
<!-- 품목구분 선택 모달 -->
<div class="modal fade" id="itemGubunModal" tabindex="-1"
	aria-hidden="true" style="z-index: 9999;">
	<div class="modal-dialog" style="max-width: 65vw;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemGubunModalTitle">품목구분 선택</h5>
				<div class="btn-group" role="group" aria-label="Small button group">
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" id="btnItemGubunPaste">
						<i class="fa-regular fa-paste"></i>
					</button>
					<button type="button" class="btn btn-outline-light w-auto"
						style="font-size: 20px !important;" data-bs-dismiss="modal"
						aria-label="Close">
						<i class="fa-solid fa-xmark"></i>
					</button>
				</div>
			</div>
			<div class="modal-body">
				<div class="row">
					<div id="leftcol" style="width:33%; margin-left:4px;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="itemGubunModalTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">사용여부</th>
											<th class="text-center">품목구분</th>
											<th class="text-center">품목구분명</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="centercol" style="width:33%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="itemGubun1ModalTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">사용여부</th>
											<th class="text-center">품목구분1</th>
											<th class="text-center">품목구분명1</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div id="rightcol" style="width:33%;">
						<div class="container-fluid h-100" style="padding: 3px;">
							<div class="row">
								<table class="table table-bordered p-0 m-0" id="itemGubun2ModalTable" style="width:100%;">
									<thead class="table-light">
										<tr>
											<th class="text-center">사용여부</th>
											<th class="text-center">품목구분2</th>
											<th class="text-center">품목구분명2</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 품목구분 선택 모달 끝 -->
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
	let searchUseYn = '001';
	let searchitemModel = '';

	let itemCdVal = '';
	let itemModelVal = '';
	let useYnVal = '001';
	
    let sideView = '';
    let editCode = 'info';

    let modalImg = '';
    let modalImg2 = '';
    let modalImg3 = '';

    let itemGubunIdx = '';
    let itemGubun1Idx = '';
    let itemGubun2Idx = '';

    let itemGubunVal = '';
    let itemGubun1Val = '';
    let itemGubun2Val = '';

    let itemGubunNmVal = '';
    let itemGubun1NmVal = '';
    let itemGubun2NmVal = '';

    let itemGubunSelect = '';
	let itemGubun1Select = '';
	let itemGubun2Select = '';

    let useYnList = getCommonCode('시스템', '000'); // 근무상태
//    let matrlGubunList = getCommonCode('일반', '002'); // 자재구분
    
    selectBoxAppend(useYnList, 'useYn', '', '2');	
//	selectBoxAppend(matrlGubunList, "itemGubun1", "" , "2");
	
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
    	$('#btnSave').addClass('d-none');
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

		$('#itemGubunNm').val('');
		$('#itemGubun1Nm').val('');
		$('#itemGubun2Nm').val('');
		$('#dealCorpCd').val('');
		$('#dealCorpNm').val('');
    	$('.inputGroup').val('');
    	$('.inputGroup').attr('disabled', false);

    	$('#useYn').val('001');
    	$('#inspectYn').val('001');
    	$('#safetyStock').val('0');
    	$('#unitPrice').val('0');

    	$('#itemImageFile').val('');
		$('#itemImageFile2').val('');
		$('#itemImageFile3').val('');

		$('#itemImage').attr('src', '');
		$('#itemImage2').attr('src', '');
		$('#itemImage3').attr('src', '');
		//테스트 끝나면 지울 것
// 		$('#itemCd').val('품번');
// 		$('#itemNm').val('품명');
// 		$('#itemDc').val('12');
// 		$('#unitDc').val('재고단위');
// 		$('#height').val('34');
// 		$('#width').val('56');
// 		$('#weight').val('78');
// 		$('#length').val('910');
// 		$('#itemGubun1').val('자재분류');
// 		$('#itemModel').val('차종');
// 		$('#itemDesc').val('비고');
// 		$('#useYn').val('001');
// 		$('#inspectYn').val('1');
		//
		uiProcInfo(false);
		$('#btnSave').removeClass('d-none');
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
		$('.inputGroup').attr('disabled', false);
		$('#itemImageFile').val('');
		$('#itemImageFile2').val('');
		$('#itemImageFile3').val('');
		uiProcTabButton(true);
		$('#btnSave').removeClass('d-none');
    });

    // 저장 처리
    $('#btnSave').on('click', function() {
        if($('#itemGubunNm').val() == ''){
        	$('#itemGubunNm').focus();
        	$('#selItemGubun').focus();
			toastr.warning('품목구분을 선택해주세요.');
			return false;
        }
        if($('#itemCd').val() == ''){
        	$('#itemCd').focus();
			toastr.warning('품번을 입력해주세요.');
			return false;
        }
        if($('#itemNm').val() == ''){
        	$('#itemNm').focus();
			toastr.warning('품명을 입력해주세요.');
			return false;
        }
        if($('#unitDc').val() == ''){
        	$('#unitDc').focus();
			toastr.warning('재고단위를 입력해주세요.');
			return false;
        }
        if($('#inspectYn').val() == ''){
        	$('#inspectYn').focus();
			toastr.warning('검사여부를 선택해주세요.');
			return false;
        }
        if($('#useYn').val() == ''){
        	$('#useYn').focus();
			toastr.warning('사용여부를 선택해주세요.');
			return false;
        }
        if($('#individualYn').val() == ''){
        	$('#individualYn').focus();
			toastr.warning('개별발주대상인지 선택해주세요.');
			return false;
        }
        
        //001 - 제품, 002 - 자재
   		let itemImage = '';
   		let itemImage2 = '';
   		let itemImage3 = '';
   		itemImage = $('#itemImage').attr('src');
   		itemImage = itemImage.replaceAll('data:image/jpeg;base64,','');
   		if(itemImage=='/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
   			itemImage = null;
       	}
   		itemImage2 = $('#itemImage2').attr('src');
   		itemImage2 = itemImage2.replaceAll('data:image/jpeg;base64,','');
   		if(itemImage2=='/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
   			itemImage2 = null;
       	}
   		itemImage3 = $('#itemImage3').attr('src');
   		itemImage3 = itemImage3.replaceAll('data:image/jpeg;base64,','');
   		if(itemImage3=='/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
   			itemImage3 = null;
       	}
       	
		$.ajax({
            url: '<c:url value="/bm/itemInfoAdmIUD"/>',
            type: 'POST',
            data: {
            	'itemCd'	   	:		$('#itemCd').val(),
            	'itemNm'		:		$('#itemNm').val(),
            	'erpCd'			:		$('#erpCd').val(),
            	'maker'			:		$('#maker').val(),
            	'itemDc'		:		$('#itemDc').val().replace(/(?:\r\n|\r|\n)/g, '<br>'),
            	'unitDc'		:		$('#unitDc').val(),
            	'dealCorpCd'	:		$('#dealCorpCd').val(),
            	'itemGubunIdx'	:		$('#itemGubunIdx').val(),
            	'itemGubun'		:		$('#itemGubun').val(),
            	'itemGubun1Idx'	:		$('#itemGubun1Idx').val(),
            	'itemGubun1'	:		$('#itemGubun1').val(),
            	'itemGubun2Idx'	:		$('#itemGubun2Idx').val(),
            	'itemGubun2'	:		$('#itemGubun2').val(),
            	'individualYn'	:		$('#individualYn').val(),
            	'safetyStock'	:		$('#safetyStock').val().replaceAll(/,/g, ''),
            	'unitPrice'		:		$('#unitPrice').val().replaceAll(/,/g, ''),
            	'useYn'			:		$('#useYn').val(),
	            'itemDesc' 		:		$('#itemDesc').val(),
	            'inspectYn'		:		$('#inspectYn').val(),
	            'itemImage'		:		itemImage,
	            'itemImage2'	:		itemImage2,
	            'itemImage3'	:		itemImage3,
            },
            success: function (res) {
                if (res.result == 'ok') {
                	sideView = '';
                	uiProcInfo(true);
                    uiProcTabButton(false);
                    $('.inputGroup').attr('disabled', true);
                    $('#btnSave').addClass('d-none');
                    
					toastr.success(res.message);
                } else {
                    toastr.error(res.message);
                }
            },
            complete: function() {
            	$('#itemInfoAdmTable').DataTable().ajax.reload();
            },
        });

		itemCdVal = '';
		itemGubunIdx = '';   
		itemGubun1Idx = '';  
		itemGubun2Idx = '';  
		itemGubunVal = '';   
		itemGubun1Val = '';  
		itemGubun2Val = '';  
		itemGubunNmVal = ''; 
		itemGubun1NmVal = '';
		itemGubun2NmVal = '';
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
                individualYn	:	'A'
            },
        },
        rowId: 'itemCd',
        columns: [
        	{ data: 'itemGubunNm', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	 
			},            
        	{ data: 'itemGubun1Nm', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},            
            { data: 'itemCd', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},            
            { data: 'itemNm', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'itemDc', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'maker', 'className' : 'text-center align-middle',
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'individualYn', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
            { data: 'useYnNm', 'className' : 'text-center align-middle' ,
				render : function(data, type, row, meta) {
					if(data != null){
						return '<div style="white-space: nowrap; text-overflow: ellipsis; overflow: hidden;">'+data+'</div>';
					} else {
						return "";
					}
				}	
			},
        ],
        columnDefs: [
        	{ targets: "all", className : 'text-center' },
        ],
        order: [
//             [ 0, 'asc' ]
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

		$('.inputGroup').val('');
		$('#itemGubunNm').val('');
		$('#itemGubun1Nm').val('');
		$('#itemGubun2Nm').val('');
		$('#dealCorpNm').val('');
		$('#itemImage').attr('src', '');
		$('#itemImage2').attr('src', '');
		$('#itemImage3').attr('src', '');

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
    	
    	//$('#itemInfoNav').tab('show');
//     	let beforeitemGubun1Val = itemGubun1Val;
//     	if(itemInfoAdmTable.row( this ).data().acctFg=='0' || itemInfoAdmTable.row( this ).data().acctFg=='1') {
// 			itemGubun1Val = '002';
// 			$('#mes').attr('rowspan', 4);
//     	} else {
//     		itemGubun1Val = '001';
//     		$('#mes').attr('rowspan', 8);
//         }

    	//품목구분이 다르면 기본정보 탭 표시 아니면 기존의 탭 표시
// 		if(beforeitemGubun1Val==itemGubun1Val) {
// 			if(editCode=='info') {
// 				$('#itemInfoNav').trigger('click');
// 			} else if(editCode=='prcss') {
// 				$('#itemPrcssNav').trigger('click');
// 			}
// 		} else {
// 			$('#itemInfoNav').trigger('click');
// 		}
    	uiProcTabButton(false);
    	uiProcInfo(true);
    	uiProcPrcss(true);
        $('#btnSave').addClass('d-none');  // 저장버튼
        $.ajax({
            url: '<c:url value="/bm/itemInfoAdmSel"/>',
            type: 'GET',
            data: {
                'itemCd': itemCdVal
            },
            success: function (res) {
                let data = res.data;
      			if(res.result == 'ok') {
      				sideView = 'edit';
                    // 보기
                    $('#itemGubunIdx').val(data.itemGubunIdx);
                    $('#itemGubun').val(data.itemGubun);
                    $('#itemGubunNm').val(data.itemGubunNm);
                    $('#itemGubun1Idx').val(data.itemGubun1Idx);
                    $('#itemGubun1').val(data.itemGubun1);
                    $('#itemGubun1Nm').val(data.itemGubun1Nm);
                    $('#itemGubun2Idx').val(data.itemGubun2Idx);
                    $('#itemGubun2').val(data.itemGubun2);
                    $('#itemGubun2Nm').val(data.itemGubun2Nm);
                    $('#individualYn').val(data.individualYn);
                    $('#safetyStock').val(addCommas(parseFloat(data.safetyStock)));
                    $('#unitPrice').val(addCommas(parseFloat(data.unitPrice)));
                    $('#itemCd').val(data.itemCd);
                    $('#itemNm').val(data.itemNm);
                    $('#erpCd').val(data.erpCd);
                    $('#maker').val(data.maker);
                    $('#itemDc').val(data.itemDc.split('<br>').join("\r\n"));
                    $('#unitDc').val(data.unitDc);
                    $('#dealCorpCd').val(data.dealCorpCd);
                    $('#dealCorpNm').val(data.dealCorpNm);
                    $('#useYn').val(data.useYn);
                    //$('#etc1').val(data.etc1);
                    //$('#etc2').val(data.etc2);
                    $('#itemDesc').val(data.itemDesc);
                    $('#inspectYn').val(data.inspectYn);
                    if(data.itemImage!=null) {
                    	$('#itemImage').attr('src','data:image/jpeg;base64,'+data.itemImage);
                    	modalImg = 'data:image/jpeg;base64,'+data.itemImage;	
					} else {
						$('#itemImage').attr('src',"");
					}
                    if(data.itemImage2!=null) {
                    	$('#itemImage2').attr('src','data:image/jpeg;base64,'+data.itemImage2);
                    	modalImg2 = 'data:image/jpeg;base64,'+data.itemImage2;
					} else {
						$('#itemImage2').attr('src',"");
					}
                    if(data.itemImage3!=null) {
                    	$('#itemImage3').attr('src','data:image/jpeg;base64,'+data.itemImage3);
                    	modalImg3 = 'data:image/jpeg;base64,'+data.itemImage3;	
					} else {
						$('#itemImage3').attr('src',"");
					}
      			} else {
      				toastr.error(res.message);
      			}
            }
        });
    });

    //기본정보 이미지 처리
    // 이미지 확대 버튼 click
    $('#btnItemImageView').on('click', function() {
        if($('#itemImage').attr('src') != '/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
			if(modalImg == ''){
				$('#modalImage').attr('src',$('#itemImage').attr('src'));
			} else $('#modalImage').attr('src',modalImg);
    		$('#imgEnlargeModal').modal('show');
        } else {
            toastr.warning('이미지 파일이 없습니다.');
            return false;
    	}
	});
    $('#btnItemImageView2').on('click', function() {
        if($('#itemImage2').attr('src') != '/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
        	if(modalImg2 == ''){
				$('#modalImage').attr('src',$('#itemImage2').attr('src'));
			} else $('#modalImage').attr('src',modalImg2);
    		$('#imgEnlargeModal').modal('show');
        } else {
            toastr.warning('이미지 파일이 없습니다.');
            return false;
    	}
	});
    $('#btnItemImageView3').on('click', function() {
        if($('#itemImage3').attr('src') != '/resources/assets/images/temp_img/no_image_white.png?ver=1.0') {
        	if(modalImg3 == ''){
				$('#modalImage').attr('src',$('#itemImage3').attr('src'));
			} else $('#modalImage').attr('src',modalImg3);
    		$('#imgEnlargeModal').modal('show');
        } else {
            toastr.warning('이미지 파일이 없습니다.');
            return false;
    	}
	});
    
	// 사진선택 버튼 click
	$('#btnItemImageUpload').on('click', function() {
		$('#itemImageFile').trigger('click');
	});
	$('#btnItemImageUpload2').on('click', function() {
		$('#itemImageFile2').trigger('click');
	});
	$('#btnItemImageUpload3').on('click', function() {
		$('#itemImageFile3').trigger('click');
	});

	// 사진삭제 버튼 click
	$('#btnItemImageDelete').on('click', function() {
		$('#itemImage').attr('src','');
		$('#itemImageFile').val('');
	});
	$('#btnItemImageDelete2').on('click', function() {
		$('#itemImage2').attr('src','');
		$('#itemImageFile2').val('');
	});
	$('#btnItemImageDelete3').on('click', function() {
		$('#itemImage3').attr('src','');
		$('#itemImageFile3').val('');
	});

	// 파일 선택
	$('#itemImageFile').on('change',function(e) {
		var formData = new FormData();
		var fileInput = document.getElementById("itemImageFile"); //id로 파일 태그를 호출
		var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		var fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		var bases64 = getImgBase64(files[0]);
		$('#itemImage').attr('src','data:image/jpeg;base64,'+bases64);
	})
	$('#itemImageFile2').on('change',function(e) {
		var formData = new FormData();
		var fileInput = document.getElementById("itemImageFile2"); //id로 파일 태그를 호출
		var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		var fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		var bases64 = getImgBase64(files[0]);
		$('#itemImage2').attr('src','data:image/jpeg;base64,'+bases64);
	})
	$('#itemImageFile3').on('change',function(e) {
		var formData = new FormData();
		var fileInput = document.getElementById("itemImageFile3"); //id로 파일 태그를 호출
		var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		var fileType = files[0].type;
		if(fileType.split('/')[0] != 'image') {
			toastr.warning('사진파일을 선택해주세요.');
			return false;
		}
		var bases64 = getImgBase64(files[0]);
		$('#itemImage3').attr('src','data:image/jpeg;base64,'+bases64);
	})
	
// 	//공정명 팝업
// 	var prcssPopUpTable;
// 	function selectPrcssCd() {
// 		if (prcssPopUpTable == null || prcssPopUpTable == undefined) {
// 			prcssPopUpTable = $('#prcssPopUpTable').DataTable({
// 				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
// 						+ "<'row'<'col-sm-12'tr>>"
// 						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
// 				language : lang_kor,
// 				destroy : true,
// 				paging : true,
// 				info : true,
// 				ordering : true,
// 				processing : true,
// 				autoWidth : false,
// 				lengthChange : false,
// 				pageLength : 20,
// 				ajax : {
// 					url : '<c:url value="bm/prcssCodeAdmList"/>',
// 					type : 'GET',
// 					data : {
// 						'prcssType' : '001'	//마스터공정 불러옴
// 					},
// 				},
// 				rowId : 'prcssCd',
// 				columns : [
// 					{ data : 'prcssCd'		},
// 					{ data : 'prcssNm'		},
// 					{ data : 'osrcYnNm'		},
// 					{ data : 'prcssDesc'	},
// 				],
// 				columnDefs : [
// 					{ "className" : "text-center", "targets" : "_all"},
// 				],
// 				order : [ [ 0, 'asc' ] ],
// 			});
			
// 			$('#prcssPopUpTable tbody').on('click', 'tr', function() {
// 				var data = prcssPopUpTable.row(this).data();
// 				 if ( $(this).hasClass('selected') ) {
// 		            //$(this).removeClass('selected');
// 		        }else {
// 		        	$('#prcssPopUpTable').DataTable().$('tr.selected').removeClass('selected');
// 		            $(this).addClass('selected');
// 		        }
// 				$('#prcssCd').val(data.prcssCd);
// 				$('#prcssNm').val(data.prcssNm);
// 				$('#prcssPopUpModal').modal('hide');
// 			});
// 		} else {
// 			$('#prcssPopUpTable').DataTable().ajax.reload(function() {});
// 		}
// 		$('#prcssPopUpModal').modal('show');
// 	}
	
	//팝업 테이블==================================================================================

  	//거래처정보조회 팝업 시작
 	$('#selDealCorpCd').on('click', function(){
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
		$('#dealCorpCd').val(data.dealCorpCd);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

	$('#dealCorpModalTable tbody').on('dblclick','tr',function(){
		let data = dealCorpModalTable.row(this).data();
		$('#dealCorpCd').val(data.dealCorpCd);
		$('#dealCorpNm').val(data.dealCorpNm);
		$('#dealCorpModal').modal('hide');
	});

	//금형코드 팝업 시작
	var equipCdPopUpTable = null;
	function equipCdSelectInCorpCd(){
		equipCdPopUpTable = $('#equipCdPopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			bDestroy : true,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/equipCodeAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [ 
			{
				data : 'equipNo'
			}, 
			{
				data : 'equipNm'
			},
			{
				data : 'mfcCorpCd'
			},
			{
				data : 'mfcDate',
				render : function(data, type, row) {
					return moment(data).format('YYYY-MM-DD');
				}
			}  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#equipCdPopUpModal').modal('show');
	}

	$(document).on('click', '#equipCdPopUpTable tbody tr', function() {
		var data = equipCdPopUpTable.row(this).data();
		
		$('#equipRealCd').val(data.equipCd);
		$('#moldCd').val(data.equipNo);
		$('#moldNm').val(data.equipNm);
		$('#mfcCorpCd').val(data.mfcCorpCd);
		$('#mfcDate').val(moment(data.mfcDate).format('YYYY-MM-DD'));
		
		$('#equipCdPopUpModal').modal('hide');
	});


	//작업지시등록시 설비 팝업창
	//설비 팝업 시작
	let equipPopUpTable;
	function selectEquipCd() {
		if ( equipPopUpTable == null || equipPopUpTable == 'undefined' ) {
			equipPopUpTable = $('#equipPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : true,
				info : false,
				ordering : false,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : "001",
						'useYn'		: '001',
					},
				},
				columns : [ {
						data : 'equipNo'
					}, {
						data : 'equipNm'
					}, {
						data : 'prcRealNm'
					}, {
						data : 'equipType'
					}, {
						render : function(data, type, row){
							return moment(row['mfcDate']).format('YYYY-MM-DD');
						}
					}, {
						data : 'mfcCorpCd'
					}
				],
				columnDefs: [
					{ "targets": "_all" , "className" : "text-center" },
		        ],
				order : [ [ 0, 'asc' ], ],
				buttons : [ {
					extend : 'copy',
					title : '설비정보관리',
				}, {
					extend : 'excel',
					title : '설비정보관리',
				}, {
					extend : 'print',
					title : '설비정보관리',
		        	exportOptions: {
		            	columns: ':visible',
		                modifier: {                      
		                	selected:null
		        		},
		        	},
				}, ],
			});
		}
		$('#equipPopUpModal').modal('show');

		$(document).on('click', '#equipPopUpTable tbody tr', function() {
			var data = equipPopUpTable.row(this).data();

			$('#equipCd').val(data.equipCd);
			$('#equipNm').val(data.equipNm);
			$('#equipPopUpModal').modal('hide');
		});

	}

	// 품목구분 테이블
	$('#itemGubunModalTable thead tr').clone(true).addClass('filters').appendTo('#itemGubunModalTable thead'); // filter 생성
	let itemGubunModalTable = $('#itemGubunModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '76vh',
        scrollX: true,
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'L'; },
				'largeIdx' 		: function() { return itemGubunIdx; },
				'mediumIdx' 	: function() { return itemGubun1Idx; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분
				data: 'itemGubun', className : 'text-center', name: 'itemGubun',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분명
				data: 'itemGubunNm', className : 'text-center', name: 'itemGubunNm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemGubunModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemGubunModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	itemGubunModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemGubunModalTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#itemGubunModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	// 품목구분1 테이블
	$('#itemGubun1ModalTable thead tr').clone(true).addClass('filters').appendTo('#itemGubun1ModalTable thead'); // filter 생성
	let itemGubun1ModalTable = $('#itemGubun1ModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '76vh',
        scrollX: true,
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'M'; },
				'largeIdx' 		: function() { return itemGubunIdx; },
				'mediumIdx' 	: function() { return itemGubun1Idx; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '<select class="form-select"><option value="Y" selected>사용</option><option value="N">미사용</option></select><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분1
				data: 'itemGubun1', className : 'text-center', name: 'itemGubun1',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
					}
				}
			},
			{ //품목구분명1
				data: 'itemGubun1Nm', className : 'text-center', name: 'itemGubun1Nm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '<input type="text" class="form-control"><span class="d-none">'+data+'</span>';
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemGubun1ModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemGubun1ModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	itemGubun1ModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemGubun1ModalTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#itemGubun1ModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});
	
	// 품목구분2 테이블
	$('#itemGubun2ModalTable thead tr').clone(true).addClass('filters').appendTo('#itemGubun2ModalTable thead'); // filter 생성
	let itemGubun2ModalTable = $('#itemGubun2ModalTable').DataTable({
		dom : "<'row'<'col-md-12 col-md-6'l><'col-md-12 col-md-6'f>>"
				+ "<'row'<'col-md-12'tr>>"
				+ "<'row pt-1'<'d-flex align-items-center d-flex'><'me-lg-auto'><'d-flex align-items-center justify-content-end'>>",
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
        scrollY: '76vh',
        scrollX: true,
		pageLength: -1,
		colReorder: true,
		select: {
            style: 'single',
            toggleable: false,
            items: 'row',
            info: false
        },
        ajax : {
			url : '<c:url value="/bm/itemGubunLmsAdmLst"/>',
			type : 'POST',
			data : {
				'lmsType' 		: function() { return 'S'; },
				'largeIdx' 		: function() { return itemGubunIdx; },
				'mediumIdx' 	: function() { return itemGubun1Idx; },
			},
		},
        rowId: 'idx',
		columns : [
			{ //사용여부
				data: 'useYn', className : 'text-center', name: 'useYn',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						if (data == 'Y') { return '사용'; } else { return '미사용'; }
					} else {
						return '';
					}
				}
			},
			{//품목구분2
				data: 'itemGubun2', className : 'text-center', name: 'itemGubun2',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '';
					}
				}
			},
			{//품목구분명2
				data: 'itemGubun2Nm', className : 'text-center', name: 'itemGubun2Nm',
				render: function(data, type, row, meta) {
					if(row['idx'] != '' && row['idx'] != null) {
						return data;
					} else {
						return '';
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
			let theadHeight = parseFloat($('#'+table_id+'_wrapper').find('.dataTables_scrollHead').css('height'));
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
				let cell = $('#itemGubun2ModalTable_wrapper').find('.filters th').eq(
					$(api.column(colIdx).header()).index()
				);

				let title = $(cell).text();

				$(cell).html('<input type="text" class="form-control"/>');
				$(cell).css('padding','2px');

				let cursorPosition = '';
				
				// On every keypress in this input
				$('#itemGubun2ModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
					api.column(colIdx).search(this.value, false, false, true).draw();
				}).on('keyup', function (e) {
					e.stopPropagation();
					$(this).trigger('keyupTrigger');
				});
			});
		},
	});
	
	// dataTable colReorder event
	itemGubun2ModalTable.on('column-reorder', function( e, settings, details ) {
		let api = itemGubun2ModalTable;
		api.columns().eq(0).each(function (colIdx) {
			 $('#itemGubun2ModalTable_wrapper').find('.filters th').eq($(api.column(colIdx).header()).index()).find('input').off('keyup keyupTrigger').on('keyupTrigger', function (e) {
				api.column(colIdx).search(this.value, false, false, true).draw();
			}).on('keyup', function (e) {
				e.stopPropagation();
				$(this).trigger('keyupTrigger');
			});
		});
	});

	$('#selItemGubun').on('click', function(){
		itemGubunIdx = '';   
		itemGubun1Idx = '';  
		itemGubun2Idx = '';  
		itemGubunSelect = '';
		itemGubun1Select = '';
		itemGubun2Select = '';
		itemGubunVal = '';
		itemGubun1Val = '';
		itemGubun2Val = '';
		itemGubunNmVal = '';
		itemGubun1NmVal = '';
		itemGubun2NmVal = '';

		$('#itemGubunModal').modal('show');
		setTimeout(function() {
			itemGubunModalTable.ajax.reload(function() {});
			itemGubun1ModalTable.ajax.reload(function() {});
			itemGubun2ModalTable.ajax.reload(function() {});
			setTimeout(function() {
				$('#itemGubunModalTable tbody tr').removeClass('selected');
				$('#itemGubun1ModalTable tbody tr').removeClass('selected');
				$('#itemGubun2ModalTable tbody tr').removeClass('selected');
			}, 150);
		}, 150);
	});

	$('#itemGubunModalTable tbody').on('click', 'tr', function(){
		let data = itemGubunModalTable.row(this).data();

		itemGubunIdx = data.idx;
		itemGubunVal = data.itemGubun;
		itemGubunNmVal = data.itemGubunNm;

		itemGubun1ModalTable.ajax.reload(function() {});
	});

	$('#itemGubun1ModalTable tbody').on('click', 'tr', function(){
		if( !$('#itemGubunModalTable tbody tr').hasClass('selected') ){
			toastr.warning('품목구분을 선택해주세요.');
			return false;
		}
		
		let data = itemGubun1ModalTable.row(this).data();

		itemGubun1Idx = data.idx;
		itemGubun1Val = data.itemGubun1;
		itemGubun1NmVal = data.itemGubun1Nm;

		itemGubun2ModalTable.ajax.reload(function() {});
	});

	$('#itemGubun2ModalTable tbody').on('click', 'tr', function(){
		if( !$('#itemGubun1ModalTable tbody tr').hasClass('selected') ){
			toastr.warning('품목구분1을 선택해주세요.');
			return false;
		}
		
		let data = itemGubun2ModalTable.row(this).data();

		itemGubun2Idx = data.idx;
		itemGubun2Val = data.itemGubun2;
		itemGubun2NmVal = data.itemGubun2Nm;
	});

	$('#btnItemGubunPaste').on('click', function(){

		if( !$('#itemGubunModalTable tbody tr').hasClass('selected') ){
			toastr.warning('품목구분을 선택해주세요.');
			return false;
		}
		if( !$('#itemGubun1ModalTable tbody tr').hasClass('selected') ){
			toastr.warning('품목구분1을 선택해주세요.');
			return false;
		}
// 		if( !$('#itemGubun2ModalTable tbody tr').hasClass('selected') ){
// 			toastr.warning('품목구분2를 선택해주세요.');
// 			return false;
// 		}

		$('#itemGubunIdx').val(itemGubunIdx);
		$('#itemGubun').val(itemGubunVal);
		$('#itemGubunNm').val(itemGubunNmVal);
		
		$('#itemGubun1Idx').val(itemGubun1Idx);
		$('#itemGubun1').val(itemGubun1Val);
		$('#itemGubun1Nm').val(itemGubun1NmVal);

		$('#itemGubun2Idx').val(itemGubun2Idx);
		$('#itemGubun2').val(itemGubun2Val);
		$('#itemGubun2Nm').val(itemGubun2NmVal);

		
		itemGubunSelect = itemGubunVal.split('/').pop();
		itemGubun1Select = '-'+itemGubun1Val.split('/').pop();
		itemGubun2Select = '-'+itemGubun2Val.split('/').pop();
		if(itemGubun1Select == '-'){
			itemGubun1Select = '';
		}if(itemGubun2Select == '-'){
			itemGubun2Select = '';
		}

		$.ajax({
			url : '<c:url value="/bm/itemInfoAdmGetCd"/>',
			type : 'POST',
			async: false,
			data : {
				'itemCd' : function(){ return (itemGubunSelect+itemGubun1Select+itemGubun2Select); }
			},
			success : function(res) {
				if (res.result == "ok") { //응답결과
					$('#itemCd').val(res.itemCdSeq);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});

		$('#itemGubunModal').modal('hide');
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
		$('#selItemGubun').attr('disabled', flag);
		$('#itemCd').attr('disabled', flag);
		$('#itemNm').attr('disabled', flag);
		$('#erpCd').attr('disabled', flag);
		$('#itemDc').attr('disabled', flag);
		$('#unitDc').attr('disabled', flag);
		$('#selDealCorpCd').attr('disabled', flag);
		$('#useYn').attr('disabled', flag);
		$('#maker').attr('disabled', flag);
		$('#btnEquipCd').attr('disabled', flag);
		$('#itemDesc').attr('disabled', flag);
		$('#inspectYn').attr('disabled', flag);
		$('#individualYn').attr('disabled', flag);
		$('#safetyStock').attr('disabled', flag);
		$('#unitPrice').attr('disabled', flag);
		if(!flag) {
			$('#btnItemImageUpload').removeClass('d-none');
			$('#btnItemImageDelete').removeClass('d-none');
			$('#btnItemImageUpload2').removeClass('d-none');
			$('#btnItemImageDelete2').removeClass('d-none');
			$('#btnItemImageUpload3').removeClass('d-none');
			$('#btnItemImageDelete3').removeClass('d-none');
		} else {
			$('#btnItemImageUpload').addClass('d-none');
			$('#btnItemImageDelete').addClass('d-none');
			$('#btnItemImageUpload2').addClass('d-none');
			$('#btnItemImageDelete2').addClass('d-none');
			$('#btnItemImageUpload3').addClass('d-none');
			$('#btnItemImageDelete3').addClass('d-none');
		}
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

	// 이미지 파일 base64변환
	function getImgBase64(files) {
		var imgForm = new FormData();
		imgForm.append('file',files);

		var base64 = '';
		$.ajax({
            url: '<c:url value="/ut/getImgBase64"/>',
            data: imgForm,
            beforeSend: function() {
                // $('#my-spinner').show();
            },
            processData: false,
            contentType: false,
            async: false,
            type: 'POST',
            success: function(res){
                if(res.result == "ok"){ //응답결과
                	base64 = res.data;
                } else {
                	toastr.error(res.message);
            	}
          },
          error: function(xhr,textStatus,error){
                                  
              console.log("textStatus: "+xhr.status+", error: "+error);
              alert("예상치 못한 오류가 발생했습니다.");
              
          }
        });
        return base64;
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
