package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.ItemInfoAdmVo;


@Repository
public class ItemInfoAdmDAOImpl implements ItemInfoAdmDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "mes.mappers.bm.itemInfoAdmMapper";
	
	//품목정보 목록조회
	@Override
	public List<ItemInfoAdmVo> itemInfoAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return session.selectList(namespace+".itemInfoAdmLst", itemInfoAdmVo);
	}
	
	//품목정보 상세조회
	@Override
	public ItemInfoAdmVo itemInfoAdmSel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return session.selectOne(namespace+".itemInfoAdmSel", itemInfoAdmVo);
	}
	
	//품목정보 수정
	@Override
	public void itemInfoAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.insert(namespace+".itemInfoAdmIns", itemInfoAdmVo);
	}
	
	//품목정보 수정
	@Override
	public void itemInfoAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemInfoAdmUpd", itemInfoAdmVo);
	}
	
	//품목정보 재고 수정
	@Override
	public void itemInfoAdmStockUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemInfoAdmStockUpd", itemInfoAdmVo);
	}
	
	//품번 자동채번
	@Override
	public ItemInfoAdmVo itemInfoAdmGetCd(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
		return session.selectOne(namespace + ".itemInfoAdmGetCd", itemInfoAdmVo);
	}
	
	//검사항목 등록여부 포함 품목목록조회
	@Override
	public List<ItemInfoAdmVo> itemInspAdmList(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return session.selectList(namespace+".itemInspAdmList", itemInfoAdmVo);
	}
	
	//************************* 품목구분등록 ***********************//
	//품목구분 목록조회
	@Override
	public List<ItemInfoAdmVo> itemGubunLmsAdmLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return session.selectList(namespace+".itemGubunLmsAdmLst",itemInfoAdmVo);
	}
	
	//품목구분 등록
	@Override
	public void itemGubunLmsAdmIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.insert(namespace+".itemGubunLmsAdmIns", itemInfoAdmVo);
	}
	
	//품목구분 수정
	@Override
	public void itemGubunLmsAdmUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemGubunLmsAdmUpd", itemInfoAdmVo);
	}
	
	//품목구분 삭제
	@Override
	public void itemGubunLmsAdmDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.delete(namespace+".itemGubunLmsAdmDel", itemInfoAdmVo);
	}
	
	//품목구분 중복 체크
	@Override
	public ItemInfoAdmVo itemGubunLmsAdmCheck(ItemInfoAdmVo itemInfoAdmVo) throws Exception{
		return session.selectOne(namespace+".itemGubunLmsAdmCheck", itemInfoAdmVo);
	}
	
	//************************* 입고단가등록 ***********************//
	
	//입고단가 목록조회
	@Override
	public List<ItemInfoAdmVo> itemCostLst(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		return session.selectList(namespace+".itemCostLst", itemInfoAdmVo);
	}
	
	//입고단가 등록
	@Override
	public void itemCostIns(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.insert(namespace+".itemCostIns", itemInfoAdmVo);
	}
	
	//입고단가 수정
	@Override
	public void itemCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemCostUpd", itemInfoAdmVo);
	}
	
	//입고단가 삭제
	@Override
	public void itemCostDel(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemCostDel", itemInfoAdmVo);
	}
	
	//입고단가만 수정
	@Override
	public void itemOnlyCostUpd(ItemInfoAdmVo itemInfoAdmVo) throws Exception {
		session.update(namespace+".itemOnlyCostUpd", itemInfoAdmVo);
	}
}