<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!-- jquery -->
<script src="<c:url value='/resources/assets/vendor/jquery/jquery-3.6.0.min.js?ver=3.6.0'/>"></script> <!-- jquery 3.6.0 -->
<script src="<c:url value='/resources/assets/vendor/jquery-ui/jquery-ui.min.js?ver=3.6.0'/>"></script> <!-- jquery UI 1.12.0 -->


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script src="<c:url value='/resources/assets/vendor/toastr/js/toastr.min.js?version=2.1.4'/>"></script> <!-- toastr 2.1.4 -->
<script src="<c:url value='/resources/assets/vendor/jstree/dist/jstree.min.js?ver=1.0'/>"></script> <!-- jstree 3.3.12 -->


<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<script src="<c:url value='/resources/assets/vendor/panzoom-master/panzoom.js?ver=1.0'/>"></script> <!-- panzoom -->
<script src="<c:url value='/resources/assets/vendor/select2/dist/js/select2.full.js?ver=1.0'/>"></script> <!-- select2 4.0.13 -->
<script src="<c:url value='/resources/assets/vendor/jQuery.print-master/jQuery.print.js?ver=1.0'/>"></script> <!-- jqueryPrint -->
<script src="<c:url value='/resources/assets/vendor/html2canvas/html2canvas.min.js?ver=1.0'/>"></script> <!-- html2canvas -->
<script src="<c:url value='/resources/assets/vendor/html2pdf/html2pdf.bundle.min.js?ver=1.0'/>"></script> <!-- html2pdf -->
<script src="<c:url value='/resources/assets/vendor/virtualKeyboard/JS_virtualKeyboard.js?ver=1.1'/>"></script> <!--virtualKeyboard  -->
<script src="<c:url value='/resources/assets/vendor/Hangul.js-master/hangul.js?ver=1.0'/>"></script><!-- 가상키보드쓰기위한 js -->
<script src="<c:url value='/resources/assets/vendor/sortable/Sortable.min.js?ver=1.0'/>"></script> <!-- Sortable -->
<script src="<c:url value='/resources/assets/vendor/table2excel/xlsx.full.min.js?ver=1.0'/>"></script> <!-- jquery.table2excel --> 
<script src="<c:url value='/resources/assets/vendor/table2excel/FileSaver.min.js?ver=1.0'/>"></script> <!-- jquery.table2excel --> 


<!-- jquery dataTables -->
<script src="<c:url value='/resources/assets/vendor/dataTables/datatables.js?ver=1.2'/>"></script> <!-- core -->
<script src="<c:url value='/resources/assets/vendor/dataTables/plugin/sum().js?ver=1.0'/>"></script> <!-- sum.js -->
<script src="<c:url value='/resources/assets/vendor/dataTables/extensions/rowgroup/dataTables.rowGroup.js?ver=1.1'/>"></script> <!-- rowgroup 2.0.0 -->
<script src="<c:url value='/resources/assets/vendor/dataTables/extensions/pdfmake-0.1.36/pdfmake.min.js?ver=1.1'/>"></script>
<script src="<c:url value='/resources/assets/vendor/dataTables/extensions/pdfmake-0.1.36/vfs_fonts.js?ver=1.1'/>"></script>
<script src="<c:url value='/resources/assets/vendor/lodash/lodash.js?ver=1.1'/>"></script> <!-- lodash -->


<script src="<c:url value='/resources/assets/vendor/moment/moment.min.js?ver=1'/>"></script> <!-- moment -->

<script src="<c:url value='/resources/dist/js/custom_theme.js?ver=2'/>"></script> <!-- custom theme -->
<script>
	// toastr 환경설정
	toastr.options = {
		positionClass: 'toast-top-right',
		timeOut: '2000',
		progressBar: true
	};
	$('.toast-top-right').css('top','25px');
	
	// moment 언어 설정
	moment.locale('ko');
	
	//dataTables 한글화
	let lang_kor = {
		"decimal" : "",
		"emptyTable" : "데이터가 없습니다.",
		"info" : "_START_ - _END_ (총 _TOTAL_ 건)",
		"infoEmpty" : "0건",
		"infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
		"infoPostFix" : "",
		"thousands" : ",",
		"lengthMenu" : "_MENU_ 개씩 보기",
		"loadingRecords" : "로딩중...",
		"processing" : "처리중...",
		"search" : "검색 : ",
		"zeroRecords" : "검색된 데이터가 없습니다.",
		"paginate" : {
			"first" : "첫 페이지",
			"last" : "마지막 페이지",
			"next" : ">",
			"previous" : "<"
		},
		"aria" : {
			"sortAscending" : " :  오름차순 정렬",
			"sortDescending" : " :  내림차순 정렬"
		}
	};

	// dataTable 전체 reload
	function dataTableDrawAll() {
		$('.dataTables_wrapper').each(function(index, node) {
			let datatableId = $(node).attr('id').split('_')[0];
			$('#'+datatableId).DataTable().draw(false).columns.adjust();
			/* if(datatableId =='itemInfoTable'){
				console.time(datatableId+' 전체 드로우 ');
			} */
		});
	}

 	// 휠 스크롤 확대축소할 때 datatable draw해서 깨지는 현상 복구 처리
	/* $(window).on('mousewheel', function(event){
		if(event.originalEvent.ctrlKey) {
			setTimeout(function() { // 살짝의 딜레이를 주기위함
				dataTableDrawAll(); // dataTable 전체 reload
			},10)
		}
	}); */

	// 리사이즈 이벤트 후 테이블 헤더 보정
    let resizeTimer = false;    
    $(window).on('resize', function(e) {
	   	if( !resizeTimer ) {
	    	$(window).trigger('resizestart');  	
	    }
	    clearTimeout(resizeTimer);
	    resizeTimer = setTimeout(function() {
		    resizeTimer = false;
		    $(window).trigger('resizeend');
	    }, 50);
    }).on('resizeend', function(){
    	dataTableDrawAll(); 
    });

    // promise 선언
	function _promise_() {
		return new Promise(function(resolve, reject) {
			resolve();
		});
	}

	// 숫자 천단위 표기 
	function numberFormat(node, returnType) {
		node.value = node.value.replace(/[^0-9\.]/g,'');
		
		if(node.value.split('.').length > 2) { // .이 두개 이상 있을 경우
			node.value = $(node).data('temp');
		} else {
			if(node.value.length != 1) { // 첫번째 입력이 아닐 경우
				if(node.value.split('.')[0].length != 1) { // 0.몇이 아닐 경우
					if(node.value.split('.')[0].slice(0,1) == '0') {
						node.value = node.value.substring(1)
					}
				}
			}
		}
		if(node.value.slice(0, 1) == '.')  { // 제일 앞 자리가 .일경우
			node.value = "0"+node.value;
		}

		if(node.value == '') { // 빈값일 경우
			node.value = '0';
		}

		if(node.value.split('.').length == 2) { // float타입일 경우
			node.value = node.value.split('.')[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '.' + node.value.split('.')[1];
		} else {
			node.value = node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		if(returnType == 'int') { // int타입으로 리턴할 경우
			node.value = node.value.split('.')[0];
		} else if(returnType == 'float') { // float타입으로 리턴할 경우
			node.value = node.value;
		}
		
		
		$(node).data('temp',node.value.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	}

	// 이미지 파일 base64변환
	function getImgBase64(file) {
		let imgForm = new FormData();
		imgForm.append('file',file);

		let base64 = '';
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

	/*
		경고창 관련 변수 및 함수
		변수명			|	타입			|	설명
		@idx			|	String		|	식별자
		@state			|	Boolean		|	modal 띄울지 여부
		@modalId		|	String		|	modal ID
		@option			|	Object()	|	추가옵션
		@WMlastIdx		|	String		|	가장 최근에 실행한 작업의 식별자
	*/
	const WMActionMap = new Map();
	let WMlastIdx = '';
	let WMcloseYn = false;

	function WM_init(idx) { // 작업 등록
		WMActionMap.set(idx, new Map());
		WMActionMap.get(idx).set('state',false);
	}

	function setWM(idx, key, value) {
		WMActionMap.get(idx).set(key, value);
	}
	
	function getWM(idx='', key='') {
		return WMActionMap.get(idx).get(key);
	}

	function WM_action_ON(idx, modalId, option) { // 상태 ON
		setWM(idx, 'state', true);
		setWM(idx, 'modalId', modalId);
		if(option != null) {
			setWm(idx, 'option', option);
		}
	}

	function WM_action_OFF(idx, option) { // 상태 OFF
		setWM(idx, 'state', false);
		if(option != null) {
			setWm(idx, 'option', option);
		}
	}
	
	function WMShow(idx, modalId) { // 모달 show
		$('#'+modalId).modal('show');
		WMlastIdx = idx;
	}

	function WMCheck(idx) { // 모달 띄워야하는지 check
		if(idx != '' && idx != null) { // idx가 지정되었을 경우
			if(WMActionMap.get(idx).get('state')) { // 모달을 띄워야할 경우
				WMShow(idx, WMActionMap.get(idx).get('modalId')); // 모달 show
				return true;
			}
		} else { // idx가 지정되지 않았을 경우
			for(let key of WMActionMap.keys()) { // 등록된 작업들 순회
				if(WMActionMap.get(key).get('state')) { // 모달을 띄워야할 경우
					WMShow(key, WMActionMap.get(key).get('modalId')); // 모달 show
					WM_close_ON();
					return true;
				}
			}
		}
		return false;
	}

	function WM_close_ON() {
		WMcloseYn = true;
	}

	function WM_close_OFF() {
		WMcloseYn = false;
	}

	function WM_close_check() {
		return WMcloseYn;
	}

	// =========================================================================
	
	// 공통코드관리 DTL 공통코드별 목록조회
	function getCommonCode(commonType, commonCd) {
		let result = [];
		$.ajax({
			url: '<c:url value="/sm/commonCodeDtlLstByCommonCd"/>',
            type: 'POST',
            async: false,
            data: {
                'commonType'	:	commonType,
                'commonCd'		:	commonCd
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					if(data.length != 1 || data[0] != null) {
						result = data;
					}
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		return result;
	}

	// 메뉴권한관리 페이지-사용자별 권한 목록조회
	function getPermission(userIdx, menuId) {
		let result = [];
		$.ajax({
			url: '<c:url value="/sm/menuAuthPermissionLst"/>',
            type: 'POST',
            async: false,
            data: {
                'userIdx'	:	userIdx,
               	'menuId'	:	menuId
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					let data = res.data;
					if(data.length != 1 || data[0] != null) {
						result = data;
					}
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		return result;
	}

	function selectBoxAppend(list, id, sVal, flag)
	{
		$('#'+id).empty();
		let html = '';

		if(flag == '1') {
			html += '<option value="">'+ '전체' +'</option>';
		} else if(flag == '2') {
			html += '<option value="">'+ '선택' +'</option>';
		}
		for(var i=0;i<list.length;i++) {
			if(list[i].commonCd == sVal) {
				html += '<option value='+list[i].commonCd+' selected>'+list[i].commonNm+'</option>';
			} else {
				html += '<option value='+list[i].commonCd+'>'+list[i].commonNm+'</option>';
			}
		}
		$('#'+id).append(html);
	}

	function selectBoxHtml(list, id, name, sVal, flag, option)
	{
		let html = '';
			html += '<select class="form-select" id="'+id+'" name="'+name+'" '+(option.disabled?'disabled':'')+'>';
			html += '	<option value="">'+ flag +'</option>';
		for(var i=0;i<list.length;i++) {
			if(list[i].commonCd == sVal) {
				html += '<option value='+list[i].commonCd+' selected>'+list[i].commonNm+'</option>';
			} else {
				html += '<option value='+list[i].commonCd+'>'+list[i].commonNm+'</option>';
			}
		}
			html += '</select>';
		return html;
	}

	// UUID v4
	function uuid_v4() {
		return ([1e7]+-1e3+-4e3+-8e3+-1e11).replace(/[018]/g, c =>
		    (c ^ crypto.getRandomValues(new Uint8Array(1))[0] & 15 >> c / 4).toString(16)
		);
	}

	// 파일통합관리 - 파일 업로드
	async function fileUpload(formData) {
		// resolve - 성공, reject - 오류
		return new Promise( (resolve, reject) => {
			$.ajax({
				url: '<c:url value="/file/fileUpload"/>',
	            type: 'POST',
	            async: false,
	            contentType: false,
	            processData: false,
	            data: formData,
				success : function(res) {
					if (res.result == "ok") { //응답결과
						resolve(res.filePath); //파일경로 "YYYYMM/DD/"
					} else if(res.result == 'fail') {
						reject('파일 업로드에 실패하였습니다.');
					} else {
						reject('파일 업로드에 실패하였습니다.');
					}
				}
			});			
		});
		
		/* 사용예시
			fileUpload.then( (value) => {
						//DB에 저장하는 ajax , function 등등 작성
						// formData에 fileUploadDate에 value값 넣음으로써 
						// DB에 몇일날기준으로 업로드되었는지 저장할수있도록 코드 작성
			})
			.catch( (error) => {
				//오류처리에 대한 코드 작성
			});
		*/
	}

	// 파일통합관리 - 파일 다운로드
	function fileDownload(obj) {
		let uuid = obj.uuid;
		let fileName = obj.fileName;
		let ext = obj.ext;
		location.href = '/file/fileDownload?uuid='+encodeURIComponent(uuid)+'&fileName='+fileName+'&ext='+ext;
	}

	// 파일통합관리 - 파일 삭제
	async function fileDelete(obj) {
		// resolve - 성공, reject - 오류
		return new Promise( (resolve, reject) => {
			let fileUploadDate = obj.fileUploadDate;
			let uuid = obj.uuid;
			let ext = obj.ext;
			$.ajax({
				url: '<c:url value="/file/fileDelete"/>',
	            type: 'POST',
	            data: {
	            	fileUploadDate	:	fileUploadDate,
	            	uuid			:	uuid,
	            	ext				:	ext,
	            },
	            beforeSend: function() {
	            	$('#my-spinner').show();
	            },
				success : function(res) {
					if (res.result == "ok") { //응답결과
						resolve();
					} else if(res.result == 'fail') {
						reject('파일 삭제를 실패했습니다.');
					} else {
						reject('파일 삭제를 실패했습니다.');
					}
					$('#my-spinner').hide();
				}
			});
		});

		/* 사용예시
		fileDelete.then( (value) => {
			//DB삭제처리
		})
		.catch( (error) => {
			//오류처리에 대한 코드 작성
		});
		*/
	}

	// 파일통합관리 - 파일 BLOB 조회
	function getFileBlob(obj) {
		let uuid = obj.uuid;
		let ext = obj.ext;
		let blob = '';
		$.ajax({
			url: '<c:url value="/file/getFileBlob"/>',
            type: 'POST',
            async: false,
            data: {
            	uuid			:	uuid,
            	ext				:	ext,
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					blob = res.data;
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
		return blob;
	}

	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 생성
	function addCommasNoDot(x) {
		var y = x.toString().split('.');
		y[0] = y[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return y.join(".");
	}

	//콤마(,) 제거
	function removeCommas(x) { 
	    var strCheck = /\,/g; 
	    x = x.replace(strCheck, ''); 
	    return x; 
	}
	
	// input text 'x'버튼 click
	$(document).on('click','.btnInputDel',function() {
		let prev = $(this).prev();
		let node = $(this);
		let next = $(this).next();

		$(prev).val('');
		$(next).val('');
	});

	$(document).on('change','input[type=date]',function(){
		let data = $(this).val();

		if(data == '' || data == 'invalid date'){
			//$(this).val($(this).data('beforeVal'));
			$(this).val(moment().format('YYYY-MM-DD'));
		} else {
			$(this).data('beforeVal', data);
		}
		
	});

	$(document).ready(function(){
		$('input[type=date]').each(function(){
			$(this).data('beforeVal',$(this).val());
		});
	});

	$(document).ready(function(){
		$('.fa-clipboard').parent().attr('title', '검색');
		$('.fa-plus').parent().attr('title', '추가');
		$('.fa-pen-to-square').parent().attr('title', '수정');
		$('.fa-trash-can').parent().attr('title', '삭제');
		$('.fa-floppy-disk').parent().attr('title', '저장');
		$('.fa-xmark').parent().attr('title', '취소');
		$('.fa-caret-left').parent().attr('title', '크기 변경');
		$('.fa-caret-right').parent().attr('title', '크기 변경');
	});
	
	// 빈값체크 함수 - 빈값일 경우 true반환, 아닐경우 false반환 
	// 넘어온 값이 빈값인지 체크하는 함수 . 
	// !value 하면 생기는 논리적 오류를 제거하기 위해
	// 명시적으로 value == 사용
	// [], {} 도 빈값으로 처리
	// 마지막 수정 20230220 종현
	function isEmptyCheck(value){
	  if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){
	    return true;
	  } else {
	    return false;
	  }
	};

	//날짜 N개월 단위로 변경
	$(document).on('change','.monthAdjust',function(){
		let adjustVal = $(this).val();
		
		let startDateObj = $(this).prev().prev().prev();
		let endDateObj = $(this).prev();
		
		let startDateVal = $(this).prev().prev().prev().val();
		let endDateVal = $(this).prev().val();
		
		if( adjustVal != '' ){			
			$(startDateObj).val(moment(endDateVal).subtract('M', adjustVal).format('YYYY-MM-DD'));
		}
	});

	//모달에서 신규 추가시 페이지 open&&click
	$(document).on('click', 'button[name=btnModalNew]', function() {
		if(window.location != window.parent.location) { // tab일 경우
			let id = $(this).data('menu');
			window.parent.tabOpenAndClick(id);
		}
	});

	//input type="text"에서 날짜형식으로 바꾸는 스크립트
	$(document).on('keydown', '.dateTextInput', function(e){
		//엔터키 == 13 || 탭키 == 9
		if(e.keyCode == 13 /*|| e.keyCode == 9*/){
			//e.preventDefault(); // 기본 동작 중지, 브라우저 자체의 탭키기능(인풋박스 다른곳으로 이동) 중지
			//변환 전 값
			let beforeVal = $(this).val();
			//이번년도값
			let todayYear = moment().format('YYYY');
			// MM/DD or MM-DD or MM.DD인지 체크
			let match = beforeVal.match(/^(\d{1,2})[-./](\d{1,2})$/);
			if(match){
				//앞에 두자리 MM 몇월인지 가져와서 해당 달의 마지막 일자 구하기
				let sliceList = beforeVal.split(/[\/\-.]/);
				let month = parseInt(sliceList[0]); 
				let day = parseInt(sliceList[1]);
				//월(MM)은 1~12만 있으니까 하드코딩함
				if( month > 0 && month <= 12){
					//해당월의 마지막 일자
					let monthEndDate = moment(todayYear + '-' + month + '-' +'01').endOf('month').date();
					if( day <= monthEndDate && day > 0 ){
						//해당 일자로 변경
						$(this).val(todayYear + '-' + month.toString().padStart(2, '0') + '-' + day.toString().padStart(2, '0'));
					} else {
						toastr.warning(month + '월은 ' + day + '일이 존재하지 않습니다.');
					}
				} else {
					toastr.warning(month + '월은 존재하지 않는 달입니다.');	
				}
			} else {
				//MM/DD or MM-DD or MM.DD이 아닌 경우
				//YY(년도뒷2자리)/MM/DD or YY(년도뒷2자리)-MM-DD or YY(년도뒷2자리).MM.DD 인지 체크 
				match = beforeVal.match(/^(\d{2})[-./](\d{1,2})[-./](\d{1,2})$/);
				if(match){
					//앞에 두자리 MM 몇월인지 가져와서 해당 달의 마지막 일자 구하기
					let sliceList = beforeVal.split(/[\/\-.]/);
					let year = parseInt(sliceList[0]);
					let month = parseInt(sliceList[1]); 
					let day = parseInt(sliceList[2]);
					//월(MM)은 1~12만 있으니까 하드코딩함
					if( month > 0 && month <= 12){
						//해당월의 마지막 일자, 여기서 년도를 입력받았기에 todayYear의 앞2자리와 입력받은 뒷2자리 합쳐서 연산해야함
						let monthEndDate = moment( todayYear.slice(0,2) + year + '-' + month + '-' +'01').endOf('month').date();
						if( day <= monthEndDate && day > 0 ){
							//해당 일자로 변경
							$(this).val(todayYear.slice(0,2) + year + '-' + month.toString().padStart(2, '0') + '-' + day.toString().padStart(2, '0'));
						} else {
							toastr.warning(todayYear.slice(0,2) + year + '년의<br>' + month + '월은 ' + day + '일이 존재하지 않습니다.');
						}
					} else {
						toastr.warning(month + '월은 존재하지 않는 달입니다.');	
					}
				} else {
					//YYYY(년도4자리)/MM/DD or YYYY(년도4자리)-MM-DD or YYYY(년도4자리).MM.DD 인지 체크 
					match = beforeVal.match(/^(\d{4})[-./](\d{1,2})[-./](\d{1,2})$/);
					if(match){
						//앞에 두자리 MM 몇월인지 가져와서 해당 달의 마지막 일자 구하기
						let sliceList = beforeVal.split(/[\/\-.]/);
						let year = parseInt(sliceList[0]);
						let month = parseInt(sliceList[1]); 
						let day = parseInt(sliceList[2]);
						//월(MM)은 1~12만 있으니까 하드코딩함
						if( month > 0 && month <= 12){
							//해당월의 마지막 일자, 여기서 년도를 입력받은 년도로 계산함
							let monthEndDate = moment( year + '-' + month + '-' +'01').endOf('month').date();
							if( day <= monthEndDate && day > 0 ){
								//해당 일자로 변경
								$(this).val( year + '-' + month.toString().padStart(2, '0') + '-' + day.toString().padStart(2, '0'));
							} else {
								toastr.warning(year + '년의<br>' + month + '월은 ' + day + '일이 존재하지 않습니다.');
							}
						} else {
							toastr.warning(month + '월은 존재하지 않는 달입니다.');	
						}
					} else {
						toastr.warning('날짜형식(YYYY-MM-DD)에 <br>맞춰서 입력 후 시도해주세요.');
					}
				}
			}
		}
	});

	//버튼식으로 날짜조정기능
	/* 아래형식처럼 html이 작성되어야하고 해당 html의 전요소는 selectbox로 날짜조정기능이 있어야하며 selectBox의 전요소엔 endDate , 전전전요소엔 startDate가 있어야함
	<div class="btn-group me-3" role="group" aria-label="Small button group">
		<button type="button" class="btn btn-outline-light w-auto monthAdjustBtn" data-val="3">
			3개월
		</button>
		<button type="button" class="btn btn-outline-light w-auto monthAdjustBtn" data-val="6">
			6개월
		</button>
		<button type="button" class="btn btn-outline-light w-auto monthAdjustBtn" data-val="12">
			12개월
		</button>
	</div>	
	*/
	$(document).on('click', '.monthAdjustBtn', function(){
		let adjustValue = $(this).data('val');
		let parentDiv = $(this).parent();

		let startDateObj = $(parentDiv).prev().prev().prev().prev();
		let endDateObj = $(parentDiv).prev().prev();

		let startDateVal = $(startDateObj).val();
		let endDateVal = $(endDateObj).val();

		if( adjustValue != '' ){			
			$(startDateObj).val(moment(endDateVal).subtract('M', adjustValue).format('YYYY-MM-DD'));
		}
		
	});
	
	window.onbeforeunload = function(event){
		return "-";
	}
</script>
