package mes.persistence.tm;

import java.util.List;

import mes.domain.tm.InventoryMoveVo;

public interface InventoryMoveDAO {

	//자재이동 내역 리스트
	public List<InventoryMoveVo> InventoryMoveAdmLst(InventoryMoveVo inventoryMoveVo) throws Exception;
	
	//자재이동 등록
	public void InventoryMoveAdmIns(InventoryMoveVo inventoryMoveVo) throws Exception;
	
	//자재이동 수정
	public void InventoryMoveAdmUpd(InventoryMoveVo inventoryMoveVo) throws Exception;
	
	//자재이동 삭제
	public void InventoryMoveAdmDel(InventoryMoveVo inventoryMoveVo) throws Exception;
	
}
