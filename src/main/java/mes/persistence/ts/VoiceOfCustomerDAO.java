package mes.persistence.ts;

import java.util.List;

import mes.domain.ts.VoiceOfCustomerVo;

public interface VoiceOfCustomerDAO {
	
	public List<VoiceOfCustomerVo> voiceOfCustomerAdmLst(VoiceOfCustomerVo vocVo) throws Exception;
	
	public List<VoiceOfCustomerVo> voiceOfCustomerDtlLst(VoiceOfCustomerVo vocVo) throws Exception;
	
	public String getAsNo() throws Exception;
	
	public void vocAdmIns(VoiceOfCustomerVo vocVo) throws Exception;
	
	public void vocAdmUpd(VoiceOfCustomerVo vocVo) throws Exception;
	
	public void vocAdmDel(VoiceOfCustomerVo vocVo) throws Exception;
	
	public void vocDtlIns(VoiceOfCustomerVo vocVo) throws Exception;
	
	public void vocDtlUpd(VoiceOfCustomerVo vocVo) throws Exception;
	
	public void vocDtlDel(VoiceOfCustomerVo vocVo) throws Exception;

}