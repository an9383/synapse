package mes.domain.bm;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
@Alias("InspectContantAdmVo")
public class InspectContantAdmVo{
	
	//제품유형별 ADM
	private String idx;
	private String inspectGubun;
	private String inspectCd;
	private String inspectNm;
	private String useYn;
	private String inspectDesc;
	
	private String regIdx;
	private String regDate;
	private String updIdx;
	private String updDate;
}
