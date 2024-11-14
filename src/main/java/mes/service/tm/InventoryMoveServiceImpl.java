package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.InventoryMoveVo;
import mes.persistence.tm.InventoryMoveDAO;

@Service
public class InventoryMoveServiceImpl implements InventoryMoveService{
	
	@Inject
	private InventoryMoveDAO dao;
	
	//자재이동 내역 리스트
	@Override
	public List<InventoryMoveVo> InventoryMoveAdmLst(InventoryMoveVo inventoryMoveVo) throws Exception{
		return dao.InventoryMoveAdmLst(inventoryMoveVo);
	}
	
	//자재이동 등록
	@Override
	public void InventoryMoveAdmIns(InventoryMoveVo inventoryMoveVo) throws Exception{
		dao.InventoryMoveAdmIns(inventoryMoveVo);
	}
	
	//자재이동 수정
	@Override
	public void InventoryMoveAdmUpd(InventoryMoveVo inventoryMoveVo) throws Exception{
		dao.InventoryMoveAdmUpd(inventoryMoveVo);
	}
	
	//자재이동 삭제
	@Override
	public void InventoryMoveAdmDel(InventoryMoveVo inventoryMoveVo) throws Exception{
		dao.InventoryMoveAdmDel(inventoryMoveVo);
	}
}
