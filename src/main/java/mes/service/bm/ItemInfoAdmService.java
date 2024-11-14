package mes.service.bm;

import java.util.List;

import mes.domain.bm.ItemInfoAdmVo;
import mes.domain.bm.LmsInfoAdmVo;

public interface ItemInfoAdmService {
	
	//품목정보 목록조회
	public List<ItemInfoAdmVo> itemInfoAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//품목정보 상세조회
	public ItemInfoAdmVo itemInfoAdmSel(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//품목정보 수정
	public void itemInfoAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품목정보 수정
	public void itemInfoAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품목정보 재고 수정
	public void itemInfoAdmStockUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품번 자동채번
	public ItemInfoAdmVo itemInfoAdmGetCd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//검사항목 등록여부 포함 품목목록조회
	public List<ItemInfoAdmVo> itemInspAdmList(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//************************* 품목구분등록 ***********************//
	//품목구분 목록조회
	public List<ItemInfoAdmVo> itemGubunLmsAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//품목구분 등록
	public void itemGubunLmsAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품목구분 수정
	public void itemGubunLmsAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품목구분 삭제
	public void itemGubunLmsAdmDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//품목구분 중복 체크
	public ItemInfoAdmVo itemGubunLmsAdmCheck(ItemInfoAdmVo itemInfoAdmVo) throws Exception;

	//************************* 입고단가등록 ***********************//
	
	//입고단가 목록조회
	public List<ItemInfoAdmVo> itemCostLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
	
	//입고단가 등록
	public void itemCostIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//입고단가 수정
	public void itemCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//입고단가 삭제
	public void itemCostDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception;	
	
	//입고단가만 수정
	public void itemOnlyCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception;
}
