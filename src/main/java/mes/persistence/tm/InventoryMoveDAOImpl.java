package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.InventoryMoveVo;

@Repository
public class InventoryMoveDAOImpl implements InventoryMoveDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.tm.inventoryMoveMapper";

	//자재이동 내역 리스트
	@Override
	public List<InventoryMoveVo> InventoryMoveAdmLst(InventoryMoveVo inventoryMoveVo) throws Exception{
		return session.selectList(namespace+".inventoryMoveAdmLst", inventoryMoveVo);
	}
	
	//자재이동 등록
	@Override
	public void InventoryMoveAdmIns(InventoryMoveVo inventoryMoveVo) throws Exception{
		session.insert(namespace+".inventoryMoveAdmIns", inventoryMoveVo);
	}
	
	//자재이동 수정
	@Override
	public void InventoryMoveAdmUpd(InventoryMoveVo inventoryMoveVo) throws Exception{
		session.update(namespace+".inventoryMoveAdmUpd", inventoryMoveVo);
	}
	
	//자재이동 삭제
	@Override
	public void InventoryMoveAdmDel(InventoryMoveVo inventoryMoveVo) throws Exception{
		session.delete(namespace+".inventoryMoveAdmDel", inventoryMoveVo);
	}
}
