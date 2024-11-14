package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ItemInfoAdmVo;
import mes.persistence.bm.ItemInfoAdmDAO;

@Service
public class ItemInfoAdmServiceImpl implements ItemInfoAdmService {

	@Inject
	private ItemInfoAdmDAO dao;

	//품목정보 목록조회
	@Override
	public List<ItemInfoAdmVo> itemInfoAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.itemInfoAdmLst(itemInfoAdmVo);
	}
	
	//품목정보 상세조회
	@Override
	public ItemInfoAdmVo itemInfoAdmSel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.itemInfoAdmSel(itemInfoAdmVo);
	}
	
	//품목정보 수정
	@Override
	public void itemInfoAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemInfoAdmIns(itemInfoAdmVo);
	}
	
	//품목정보 수정
	@Override
	public void itemInfoAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemInfoAdmUpd(itemInfoAdmVo);
	}
	
	//품목정보 재고 수정
	@Override
	public void itemInfoAdmStockUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemInfoAdmStockUpd(itemInfoAdmVo);
	}
	
	//품번 자동채번
	@Override
	public ItemInfoAdmVo itemInfoAdmGetCd(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
		return dao.itemInfoAdmGetCd(itemInfoAdmVo);
	}
	
	//검사항목 등록여부 포함 품목목록조회
	@Override
	public List<ItemInfoAdmVo> itemInspAdmList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.itemInspAdmList(itemInfoAdmVo);
	}
	
	//************************* 품목구분등록 ***********************//
	//품목구분 목록조회
	@Override
	public List<ItemInfoAdmVo> itemGubunLmsAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.itemGubunLmsAdmLst(itemInfoAdmVo);
	}
	
	//품목구분 등록
	@Override
	public void itemGubunLmsAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemGubunLmsAdmIns(itemInfoAdmVo);
	}
	
	//품목구분 수정
	@Override
	public void itemGubunLmsAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemGubunLmsAdmUpd(itemInfoAdmVo);
	}
	
	//품목구분 삭제
	@Override
	public void itemGubunLmsAdmDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemGubunLmsAdmDel(itemInfoAdmVo);
	}
	
	//품목구분 중복 체크
	@Override
	public ItemInfoAdmVo itemGubunLmsAdmCheck(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
		return dao.itemGubunLmsAdmCheck(itemInfoAdmVo);
	}
	
	//************************* 입고단가등록 ***********************//
	
	//입고단가 목록조회
	@Override
	public List<ItemInfoAdmVo> itemCostLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return dao.itemCostLst(itemInfoAdmVo);
	}
	
	//입고단가 등록
	@Override
	public void itemCostIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemCostIns(itemInfoAdmVo);
	}
	
	//입고단가 수정
	@Override
	public void itemCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemCostUpd(itemInfoAdmVo);
	}
	
	//입고단가 삭제
	@Override
	public void itemCostDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemCostDel(itemInfoAdmVo);
	}
	
	//입고단가만 수정
	@Override
	public void itemOnlyCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		dao.itemOnlyCostUpd(itemInfoAdmVo);
	}
}

	