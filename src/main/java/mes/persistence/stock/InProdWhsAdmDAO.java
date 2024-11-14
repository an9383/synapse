package mes.persistence.stock;

import java.util.List;

import mes.domain.stock.InProdWhsAdmVo;

public interface InProdWhsAdmDAO {
	
	// 제품 입고전표 등록
	public void inProdWhsAdmIns(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 입고전표 등록
	public void inProdWhsAdmCompulsionIns(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 입고전표 수정
	public void inProdWhsAdmUpd(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 입고전표 삭제
	public void inProdWhsAdmDel(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 전표번호 조회
	public InProdWhsAdmVo getInSlipNoByRelationNo(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 전표번호 조회
	public String getInSlipNo(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 LOT번호 조회
	public String getLotNo(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
	
	// 제품 입고전표 리스트
	public List<InProdWhsAdmVo> inProdWhsList(InProdWhsAdmVo inProdWhsAdmVo) throws Exception;
}