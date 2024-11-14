package mes.domain.bm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("GoodsTypeAdmVo")
public class GoodsTypeAdmVo{
	
	//제품유형별 ADM
	private String idx;
	private String goodsGubun;
	private String goodsTypeCd;
	private String goodsTypeNm;
	private String useYn;
	
	//제품유형별 DTL
	private String goodsNm;
	private String goodsDesc;
	
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
}
